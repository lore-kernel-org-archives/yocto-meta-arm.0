Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65626C36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 17:34:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.3078.1743788091577466287
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Apr 2025 10:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D2FC1516
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Apr 2025 10:34:53 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AC7933F63F
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Apr 2025 10:34:50 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/fvp-base-a-aem: remove spurious executable stack from one library
Date: Fri,  4 Apr 2025 18:34:45 +0100
Message-ID: <20250404173445.3901440-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250404173445.3901440-1-ross.burton@arm.com>
References: <20250404173445.3901440-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Apr 2025 17:34:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6447

There are some objects in the FVP binary that are assembler source and
fail to declare what permissions the stack needs to have, so GCC falls
back to assuming that the final binary needs an executable stack.

glibc 2.41 (as now used in uninative) introduces changes here[1]: whether
to have an executable stack or not when the binary doesn't specify a
need (defaults to executable, but this is a tunable), and any binaries
that are dlopen()ed that require an executable stack will fail.

Thus, some FVPs on some platforms (notable, fvp-base-a-aem on x86-64)
now fail on startup:

  libarmctmodel.so: cannot enable executable stack as shared object requi=
res: Invalid argument

Luckily the solution here is to simply clear the executable bit, as
an executable stack is not actually needed.  Until a new release of the
FVP is made we can fix the binary in our package using execstack.

[1] https://lists.gnu.org/archive/html/info-gnu/2025-01/msg00014.html

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../fvp/fvp-base-a-aem_11.28.23.bb            |  3 +++
 .../recipes-devtools/fvp/remove-execstack.inc | 26 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta-arm/recipes-devtools/fvp/remove-execstack.inc

diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.28.23.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.28.23.bb
index f411276b..45fd21fe 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.28.23.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.28.23.bb
@@ -17,3 +17,6 @@ UPSTREAM_VERSION_UNKNOWN =3D "1"
 MODEL_CODE =3D "FVP_Base_RevC-2xAEMvA"
=20
 COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux"
+
+require remove-execstack.inc
+REMOVE_EXECSTACKS:x86-64 =3D "${FVPDIR}/models/${FVP_ARCH_DIR}*/libarmct=
model.so"
diff --git a/meta-arm/recipes-devtools/fvp/remove-execstack.inc b/meta-ar=
m/recipes-devtools/fvp/remove-execstack.inc
new file mode 100644
index 00000000..7f02b502
--- /dev/null
+++ b/meta-arm/recipes-devtools/fvp/remove-execstack.inc
@@ -0,0 +1,26 @@
+# Clear the executable stack flag on named shared libraries. This are ty=
pically
+# not needed, and glibc 2.41 will refuse to dlopen() a library that expe=
cts
+# an executable stack.
+#
+# The stack permissions can be checked with readelf -lW <.so> | grep GNU=
_STACK.
+# RW is read/write, RWE is read/write/execute.
+
+DEPENDS +=3D "execstack-native"
+
+REMOVE_EXECSTACKS ?=3D ""
+
+do_install:append() {
+    for SO in ${REMOVE_EXECSTACKS}; do
+        NAME=3D$(basename $SO)
+        SO=3D${D}$SO
+
+        test -f $SO || bbfatal remove-execstack: cannot find $SO
+
+        if execstack --query $SO | grep -q ^X; then
+            bbnote "Stripping executable stack bit on $NAME"
+            execstack --clear-execstack $SO
+        else
+            bbwarn "Executable stack stripping no longer required for $N=
AME, remove"
+        fi
+    done
+}
--=20
2.43.0


