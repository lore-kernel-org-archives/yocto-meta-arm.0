Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A07D7109B469
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 13:07:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19558.1774962424224867728
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 31 Mar 2026 06:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Yk7zeGKE;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC1D23620
	for <meta-arm@lists.yoctoproject.org>; Tue, 31 Mar 2026 06:06:57 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9BD4D3F7D8
	for <meta-arm@lists.yoctoproject.org>; Tue, 31 Mar 2026 06:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774962423; bh=HKIfPIFfwPrK8XIgUcE2AN1s9udeEUYWgpEKyp1Z2j0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Yk7zeGKE/VLorf1WYIUw9SrG7RdGK0+nF2/4NKCW0JWJd7ZerFg8PXCp6yj90/Aog
	 zudMZbFz9iq8gKSz1VtBnshyhcoSnMRW9JsG1+wCNWYxXO9fmK8wIjCt1Ly1iW+tG/
	 ZjL99mDmx2fXnqHzbx1kEkoK+HprVKhl//j6snbA=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/6] Revert "arm/execstack: remove, no longer needed"
Date: Tue, 31 Mar 2026 09:06:58 -0400
Message-ID: <20260331130702.56223-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260331130702.56223-1-jon.mason@arm.com>
References: <20260331130702.56223-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 31 Mar 2026 13:07:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6990

Some of the soon-to-be-added FVPs have the execute issue still.  So,
re-add this until it can be resolved.  Also, address S issue that
changed upstream between the original removal and now.
---
 .../recipes-devtools/fvp/execstack-native.bb  | 23 ++++++++++++++++
 .../recipes-devtools/fvp/remove-execstack.inc | 26 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta-arm/recipes-devtools/fvp/execstack-native.bb
 create mode 100644 meta-arm/recipes-devtools/fvp/remove-execstack.inc

diff --git a/meta-arm/recipes-devtools/fvp/execstack-native.bb b/meta-arm=
/recipes-devtools/fvp/execstack-native.bb
new file mode 100644
index 000000000000..0bd8f6f33d07
--- /dev/null
+++ b/meta-arm/recipes-devtools/fvp/execstack-native.bb
@@ -0,0 +1,23 @@
+SUMMARY =3D "execstack tool"
+LICENSE =3D "GPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc93c0550bd3173f4504b2cbd8991e=
50b"
+
+DEPENDS =3D "binutils-native elfutils-native"
+
+SRC_URI =3D "git://git.yoctoproject.org/prelink-cross;protocol=3Dhttps;b=
ranch=3Dmaster"
+SRCREV =3D "ff2561c02ade96c5d4d56ddd4e27ff064840a176"
+PV =3D "1.0+git${SRCPV}"
+
+# The last tagged release was 20151030.  Track this as a git tree to
+# see if there are any updates
+UPSTREAM_CHECK_COMMITS =3D "1"
+
+inherit autotools native
+
+do_compile() {
+    oe_runmake -C ${B}/src execstack
+}
+
+do_install() {
+    oe_runmake -C ${B}/src install-binPROGRAMS DESTDIR=3D"${D}"
+}
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
2.50.1 (Apple Git-155)


