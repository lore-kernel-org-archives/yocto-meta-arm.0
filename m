Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D1FC433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:33:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20267.1646058815072004224
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 28 Feb 2022 06:33:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8602D6E
	for <meta-arm@lists.yoctoproject.org>; Mon, 28 Feb 2022 06:33:34 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52BA13F73D
	for <meta-arm@lists.yoctoproject.org>; Mon, 28 Feb 2022 06:33:34 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: apply in-flight patches to fix lopper and python-dtc
Date: Mon, 28 Feb 2022 14:33:32 +0000
Message-Id: <20220228143332.1866942-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 28 Feb 2022 14:33:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3077

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 0001-lopper-fix-wheel-build.patch      | 35 ++++++++++++++++++++++++++
 0001-python3-dtc-fix-wheel-build.patch | 29 +++++++++++++++++++++
 ci/meta-virtualization.yml             |  7 ++++++
 3 files changed, 71 insertions(+)
 create mode 100644 0001-lopper-fix-wheel-build.patch
 create mode 100644 0001-python3-dtc-fix-wheel-build.patch

diff --git a/0001-lopper-fix-wheel-build.patch b/0001-lopper-fix-wheel-bu=
ild.patch
new file mode 100644
index 00000000..85dc6189
--- /dev/null
+++ b/0001-lopper-fix-wheel-build.patch
@@ -0,0 +1,35 @@
+From 1784be00b170308c56a3d467b22163a385985497 Mon Sep 17 00:00:00 2001
+From: Tim Orling <ticotimo@gmail.com>
+Date: Sun, 27 Feb 2022 15:28:18 -0800
+Subject: [PATCH] lopper: fix wheel build
+
+The wheel that is built is:
+lopper-1.0-py3-none-any.whl
+
+Set BASEVERSION to 1.0 and use this to set PV and the value for PYPA_WHE=
EL
+(the path to the wheel filename).
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+---
+ recipes-kernel/lopper/lopper_git.bb | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/recipes-kernel/lopper/lopper_git.bb b/recipes-kernel/lopper=
/lopper_git.bb
+index 606dab6..e96bac7 100644
+--- a/recipes-kernel/lopper/lopper_git.bb
++++ b/recipes-kernel/lopper/lopper_git.bb
+@@ -7,7 +7,10 @@ SRC_URI =3D "git://github.com/devicetree-org/lopper.git=
;branch=3Dmaster;protocol=3Dhtt
+ SRCREV =3D "3c81fcce08eeb64cbbde1535abd83572985a8689"
+ S =3D "${WORKDIR}/git"
+=20
+-PV=3D"v1.0+git${SRCPV}"
++BASEVERSION =3D "1.0"
++PV=3D"v${BASEVERSION}+git${SRCPV}"
++
++PYPA_WHEEL =3D "${PIP_INSTALL_DIST_PATH}/${BPN}-${BASEVERSION}-*.whl"
+=20
+ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D8e5f5f691f01c9fdfa7a7f2d5=
35be619"
+=20
+--=20
+2.25.1
+
diff --git a/0001-python3-dtc-fix-wheel-build.patch b/0001-python3-dtc-fi=
x-wheel-build.patch
new file mode 100644
index 00000000..ca45c91f
--- /dev/null
+++ b/0001-python3-dtc-fix-wheel-build.patch
@@ -0,0 +1,29 @@
+From ef0d9470c853ee8bbef33db4708d3657646ad8f8 Mon Sep 17 00:00:00 2001
+From: Tim Orling <ticotimo@gmail.com>
+Date: Sun, 27 Feb 2022 15:28:17 -0800
+Subject: [PATCH] python3-dtc: fix wheel build
+
+The wheel that is built is ${S}/dist/libfdt-1.6.2.dev39+g4048aed.d202201=
03-cp310-cp310-linux_x86_64.whl
+Set PYPA_WHEEL to match this.
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+---
+ recipes-kernel/dtc/python3-dtc_1.6.1.bb | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/recipes-kernel/dtc/python3-dtc_1.6.1.bb b/recipes-kernel/dt=
c/python3-dtc_1.6.1.bb
+index 449d071..671d280 100644
+--- a/recipes-kernel/dtc/python3-dtc_1.6.1.bb
++++ b/recipes-kernel/dtc/python3-dtc_1.6.1.bb
+@@ -19,6 +19,8 @@ SRCREV =3D "4048aed12b81c5a0154b9af438edc99ec7d2b6a1"
+ PV =3D "1.6.1+git${SRCPV}"
+ S =3D "${WORKDIR}/git"
+=20
++PYPA_WHEEL =3D "${S}/dist/libfdt-1.6.2*.whl"
++
+ inherit setuptools3 pkgconfig
+=20
+ BBCLASSEXTEND =3D "native nativesdk"
+--=20
+2.25.1
+
diff --git a/ci/meta-virtualization.yml b/ci/meta-virtualization.yml
index 1cd0e21a..6459e68b 100644
--- a/ci/meta-virtualization.yml
+++ b/ci/meta-virtualization.yml
@@ -6,3 +6,10 @@ header:
 repos:
   meta-virtualization:
     url: git://git.yoctoproject.org/meta-virtualization
+    patches:
+      lopper:
+        repo: meta-arm
+        path: 0001-lopper-fix-wheel-build.patch
+      dtc:
+        repo: meta-arm
+        path: 0001-python3-dtc-fix-wheel-build.patch
--=20
2.25.1


