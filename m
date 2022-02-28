Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3791C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:24:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.20164.1646058288535736714
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 28 Feb 2022 06:24:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C4F9D6E
	for <meta-arm@lists.yoctoproject.org>; Mon, 28 Feb 2022 06:24:47 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37FA53F73D
	for <meta-arm@lists.yoctoproject.org>; Mon, 28 Feb 2022 06:24:47 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: apply in-flight patches to fix python3-cryptography
Date: Mon, 28 Feb 2022 14:24:45 +0000
Message-Id: <20220228142445.1862252-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 28 Feb 2022 14:24:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3075

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...python3-cryptography-fix-wheel-build.patch | 30 ++++++++++++++
 ...tuptools-rust-native-fix-wheel-build.patch | 40 +++++++++++++++++++
 ci/meta-openembedded.yml                      |  7 ++++
 3 files changed, 77 insertions(+)
 create mode 100644 0001-python3-cryptography-fix-wheel-build.patch
 create mode 100644 0001-python3-setuptools-rust-native-fix-wheel-build.p=
atch

diff --git a/0001-python3-cryptography-fix-wheel-build.patch b/0001-pytho=
n3-cryptography-fix-wheel-build.patch
new file mode 100644
index 00000000..b28acf69
--- /dev/null
+++ b/0001-python3-cryptography-fix-wheel-build.patch
@@ -0,0 +1,30 @@
+From f82b518cb64005962dfdd789849dd4356a67d8cf Mon Sep 17 00:00:00 2001
+From: Tim Orling <ticotimo@gmail.com>
+Date: Fri, 25 Feb 2022 10:55:50 -0800
+Subject: [PATCH] python3-cryptography: fix wheel build
+
+Like python3-setuptools-rust-native, this is building its wheel in
+${S}/dist rather than ${B}/dist. Set PIP_INSTALL_DIST_PATH accordingly.
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../recipes-devtools/python/python3-cryptography_36.0.1.bb      | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/meta-python/recipes-devtools/python/python3-cryptography_36=
.0.1.bb b/meta-python/recipes-devtools/python/python3-cryptography_36.0.1=
.bb
+index abb15381f5..00791dce2d 100644
+--- a/meta-python/recipes-devtools/python/python3-cryptography_36.0.1.bb
++++ b/meta-python/recipes-devtools/python/python3-cryptography_36.0.1.bb
+@@ -20,6 +20,8 @@ SRC_URI +=3D " \
+=20
+ inherit pypi setuptools3_rust
+=20
++PIP_INSTALL_DIST_PATH =3D "${S}/dist"
++
+ DEPENDS +=3D " \
+     ${PYTHON_PN}-asn1crypto-native \
+     ${PYTHON_PN}-cffi-native \
+--=20
+2.25.1
+
diff --git a/0001-python3-setuptools-rust-native-fix-wheel-build.patch b/=
0001-python3-setuptools-rust-native-fix-wheel-build.patch
new file mode 100644
index 00000000..b66239d9
--- /dev/null
+++ b/0001-python3-setuptools-rust-native-fix-wheel-build.patch
@@ -0,0 +1,40 @@
+From 224eff9a28a4489504178621287b33f148a9f54a Mon Sep 17 00:00:00 2001
+From: Tim Orling <ticotimo@gmail.com>
+Date: Fri, 25 Feb 2022 09:31:51 -0800
+Subject: [PATCH] python3-setuptools-rust-native: fix wheel build
+
+Add comment that setuptools_build_meta is currently broken and stick
+with setuptools3 for now.
+
+For some reason, the wheel is built in ${S}/dist and not ${B}/dist.
+Set PIP_INSTALL_DIST_PATH accordingly as a workaround.
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../python/python3-setuptools-rust-native_1.1.2.bb         | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/meta-python/recipes-devtools/python/python3-setuptools-rust=
-native_1.1.2.bb b/meta-python/recipes-devtools/python/python3-setuptools=
-rust-native_1.1.2.bb
+index 34ff91241f..1afb3f0e0f 100644
+--- a/meta-python/recipes-devtools/python/python3-setuptools-rust-native=
_1.1.2.bb
++++ b/meta-python/recipes-devtools/python/python3-setuptools-rust-native=
_1.1.2.bb
+@@ -12,8 +12,15 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D011cd92e70=
2dd9e6b1a26157b6fd53f5"
+ SRC_URI =3D "https://files.pythonhosted.org/packages/67/08/e1aa2c582c62=
ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-${PV}.ta=
r.gz"
+ SRC_URI[sha256sum] =3D "a0adb9b503c0ffc4e8fe80b7c617898cefa78049983aaae=
a7f747e153a3e65d1"
+=20
++# While this has a pyproject.toml and declares that setuptools_build_me=
ta should work
++# it results in a wheel named UNKNOWN-0.0.0-py3-none-any.whl so stay wi=
th setuptools3
++# until that can be resolved
+ inherit cargo pypi setuptools3 native
+=20
++# For some reason the wheel is built in ${S} not ${B}
++PIP_INSTALL_DIST_PATH =3D "${S}/dist"
++
++
+ DEPENDS +=3D "python3-setuptools-scm-native python3-wheel-native"
+=20
+ RDEPENDS:${PN}:class-native +=3D " \
+--=20
+2.25.1
+
diff --git a/ci/meta-openembedded.yml b/ci/meta-openembedded.yml
index bed338da..4da829b5 100644
--- a/ci/meta-openembedded.yml
+++ b/ci/meta-openembedded.yml
@@ -9,3 +9,10 @@ repos:
       meta-networking:
       meta-oe:
       meta-python:
+    patches:
+      wheel1:
+        repo: meta-arm
+        path: 0001-python3-cryptography-fix-wheel-build.patch
+      wheel2:
+        repo: meta-arm
+        path: 0001-python3-setuptools-rust-native-fix-wheel-build.patch
--=20
2.25.1


