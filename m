Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A808C3ABA5
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 14:13:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.29.1745936001719973507
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 29 Apr 2025 07:13:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76D671516;
	Tue, 29 Apr 2025 07:13:14 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3233F3F66E;
	Tue, 29 Apr 2025 07:13:21 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH scarthgap 2/2] arm/fvp-base-a-aem: remove spurious executable stack from one library
Date: Tue, 29 Apr 2025 10:13:20 -0400
Message-Id: <20250429141320.2609-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250429141320.2609-1-jon.mason@arm.com>
References: <20250429141320.2609-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 29 Apr 2025 14:13:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6483

From: Ross Burton <ross.burton@arm.com>

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
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../fvp/fvp-base-a-aem_11.25.15.bb            |  3 +++
 .../recipes-devtools/fvp/remove-execstack.inc | 26 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta-arm/recipes-devtools/fvp/remove-execstack.inc

diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.25.15.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.25.15.bb
index eab2255f6f3c..df1d698ab145 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.25.15.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.25.15.bb
@@ -14,3 +14,6 @@ UPSTREAM_VERSION_UNKNOWN =3D "1"
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
index 000000000000..7f02b5027b27
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
2.39.5 (Apple Git-154)


