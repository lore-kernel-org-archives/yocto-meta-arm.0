Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40173C433F5
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 19:56:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.15276.1633377376894668908
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 04 Oct 2021 12:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A08AD6E
	for <meta-arm@lists.yoctoproject.org>; Mon,  4 Oct 2021 12:56:15 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41D7A3F70D
	for <meta-arm@lists.yoctoproject.org>; Mon,  4 Oct 2021 12:56:15 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/8] arm/hafnium: remove python symlink workaround
Date: Mon,  4 Oct 2021 20:56:06 +0100
Message-Id: <20211004195612.188487-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004195612.188487-1-ross.burton@arm.com>
References: <20211004195612.188487-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 04 Oct 2021 19:56:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2242

Hafnium drops a python symlink into HOSTTOOLS_DIR, which is visible to
all recipes, so building hafnium changes the build environment.

Hafnium, since 6c63a26 (2.4 onwards), uses python3 in its own hashbangs.
The prebuilt clang currently uses python hangbangs but this is fixed in
git, and can be temporarily worked around with a patch instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../hafnium/hafnium/hashbang.patch            | 34 +++++++++++++++++++
 meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb   |  7 +---
 2 files changed, 35 insertions(+), 6 deletions(-)
 create mode 100644 meta-arm/recipes-bsp/hafnium/hafnium/hashbang.patch

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/hashbang.patch b/meta-a=
rm/recipes-bsp/hafnium/hafnium/hashbang.patch
new file mode 100644
index 00000000..af77e7c7
--- /dev/null
+++ b/meta-arm/recipes-bsp/hafnium/hafnium/hashbang.patch
@@ -0,0 +1,34 @@
+Update Clang hashbangs to call python3 instead of python, as that doesn'=
t exist
+in our hosttools.
+
+Upstream-Status: Backport [partial, fixed upstream]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/linux-x64/clang/bin/clang b/prebuilts/linux-x64/clang/bin/c=
lang
+index 081cb20a..ce9cc267 100755
+--- a/prebuilts/linux-x64/clang/bin/clang
++++ b/prebuilts/linux-x64/clang/bin/clang
+@@ -1 +1 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+diff --git a/prebuilts/linux-x64/clang/bin/clang++ b/prebuilts/linux-x64=
/clang/bin/clang++
+index 081cb20a..ce9cc267 100755
+--- a/prebuilts/linux-x64/clang/bin/clang++
++++ b/prebuilts/linux-x64/clang/bin/clang++
+@@ -1 +1 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+diff --git a/prebuilts/linux-x64/clang/bin/clang-tidy b/prebuilts/linux-=
x64/clang/bin/clang-tidy
+index 081cb20a..ce9cc267 100755
+--- a/prebuilts/linux-x64/clang/bin/clang-tidy
++++ b/prebuilts/linux-x64/clang/bin/clang-tidy
+@@ -1 +1 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+diff --git a/prebuilts/linux-x64/clang/bin/scan-view b/prebuilts/linux-x=
64/clang/bin/scan-view
+index 6165432e..07effbca 100755
+--- a/prebuilts/linux-x64/clang/bin/scan-view
++++ b/prebuilts/linux-x64/clang/bin/scan-view
+@@ -1 +1 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb b/meta-arm/recip=
es-bsp/hafnium/hafnium_2.5.bb
index 9f05b725..595f53c9 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
@@ -8,6 +8,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 inherit deploy python3native pkgconfig
=20
 SRC_URI =3D "gitsm://git.trustedfirmware.org/hafnium/hafnium.git;protoco=
l=3Dhttps \
+           file://hashbang.patch \
            file://pkg-config-native.patch"
 SRCREV =3D "3a149eb219467c0d9336467ea1fb9d3fb65da94b"
 S =3D "${WORKDIR}/git"
@@ -33,12 +34,6 @@ DEPENDS =3D "bison-native bc-native openssl-native"
 # set project to build
 EXTRA_OEMAKE +=3D "PROJECT=3D${HAFNIUM_PROJECT}"
=20
-do_compile:prepend() {
-    # Hafnium expects 'python'. Create symlink python to python3
-    real=3D$(which ${PYTHON})
-    ln -snf $real $(dirname $real)/python
-}
-
 do_install() {
     install -d -m 755 ${D}/firmware
     for bldfile in ${HAFNIUM_INSTALL_TARGET}; do
--=20
2.25.1


