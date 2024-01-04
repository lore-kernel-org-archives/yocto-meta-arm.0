Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D6AC3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 15:32:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.26058.1704468743684863650
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Jan 2024 07:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BB0EFEC
	for <meta-arm@lists.yoctoproject.org>; Fri,  5 Jan 2024 07:33:09 -0800 (PST)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1498B3F7A6
	for <meta-arm@lists.yoctoproject.org>; Fri,  5 Jan 2024 07:32:23 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-bsp/trusted-firmware-m: update libmetal and open-amp to 2023.04.0
Date: Thu,  4 Jan 2024 14:47:30 -0600
Message-Id: <20240104204730.27174-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240104204730.27174-1-jon.mason@arm.com>
References: <20240104204730.27174-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 05 Jan 2024 15:32:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5311

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...-cmake-modify-path-to-libmetal-version-file.patch | 10 +++++-----
 .../trusted-firmware-m-corstone1000.inc              | 12 ++++++------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/0001-cmake=
-modify-path-to-libmetal-version-file.patch b/meta-arm-bsp/recipes-bsp/tr=
usted-firmware-m/files/0001-cmake-modify-path-to-libmetal-version-file.pa=
tch
index 68785f6c..d53524ad 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/0001-cmake-modify=
-path-to-libmetal-version-file.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/0001-cmake-modify=
-path-to-libmetal-version-file.patch
@@ -1,6 +1,6 @@
-From dfdfd7f829f74b46f14470eae968c39b910fd11c Mon Sep 17 00:00:00 2001
+From 6b38b9990c4dab0cb8524506ef129d4f326f3800 Mon Sep 17 00:00:00 2001
 From: Jon Mason <jon.mason@arm.com>
-Date: Thu, 14 Dec 2023 09:01:02 -0500
+Date: Thu, 14 Dec 2023 09:23:09 -0500
 Subject: [PATCH] cmake: modify path to libmetal version file
=20
 Commit ad87802d6e01e97946de20b6c2fa28aed184ed20 changed how the
@@ -16,12 +16,12 @@ Signed-off-by: Jon Mason <jon.mason@arm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/cmake/options.cmake b/cmake/options.cmake
-index 4b866164c390..004126a40da1 100644
+index a7b4ef8bdf03..a06009b6acc4 100644
 --- a/cmake/options.cmake
 +++ b/cmake/options.cmake
 @@ -1,4 +1,4 @@
--file(READ ${CMAKE_SOURCE_DIR}/VERSION ver)
-+file(READ ${CMAKE_SOURCE_DIR}/../libmetal/VERSION ver)
+-file(READ ${LIBMETAL_ROOT_DIR}/VERSION ver)
++file(READ ${LIBMETAL_ROOT_DIR}/../libmetal/VERSION ver)
 =20
  string(REGEX MATCH "VERSION_MAJOR =3D ([0-9]*)" _ ${ver})
  set(PROJECT_VERSION_MAJOR ${CMAKE_MATCH_1})
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 8d91c523..f4623f50 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -11,20 +11,20 @@ TFM_PLATFORM_IS_FVP ?=3D "FALSE"
 EXTRA_OECMAKE +=3D "-DPLATFORM_IS_FVP=3D${TFM_PLATFORM_IS_FVP}"
 EXTRA_OECMAKE +=3D "-DCC312_LEGACY_DRIVER_API_ENABLED=3DON"
=20
-# libmetal v2021.04.0
+# libmetal v2023.04.0
 LICENSE +=3D "& BSD-3-Clause"
-LIC_FILES_CHKSUM +=3D "file://../libmetal/LICENSE.md;md5=3Dfe0b8a4beea8f=
0813b606d15a3df3d3c"
+LIC_FILES_CHKSUM +=3D "file://../libmetal/LICENSE.md;md5=3Df4d5df0f12dce=
a1b1a0124219c0dbab4"
 SRC_URI +=3D "git://github.com/OpenAMP/libmetal.git;protocol=3Dhttps;bra=
nch=3Dmain;name=3Dlibmetal;destsuffix=3Dgit/libmetal \
             file://0001-cmake-modify-path-to-libmetal-version-file.patch=
;patchdir=3D../libmetal \
            "
-SRCREV_libmetal =3D "59e2f084d31a60a95c99ab130227674fd365764b"
+SRCREV_libmetal =3D "28fa2351d6a8121ce6c1c2ac5ee43ce08d38dbae"
 EXTRA_OECMAKE +=3D "-DLIBMETAL_SRC_PATH=3D${S}/../libmetal -DLIBMETAL_BI=
N_PATH=3D${B}/libmetal-build"
=20
-# OpenAMP v2021.04.0
+# OpenAMP v2023.04.0
 LICENSE +=3D "& BSD-2-Clause & BSD-3-Clause"
-LIC_FILES_CHKSUM +=3D "file://../openamp/LICENSE.md;md5=3Da8d8cf662ef6bf=
9936a1e1413585ecbf"
+LIC_FILES_CHKSUM +=3D "file://../openamp/LICENSE.md;md5=3Dab88daf995c0bd=
0071c2e1e55f3d3505"
 SRC_URI +=3D "git://github.com/OpenAMP/open-amp.git;protocol=3Dhttps;bra=
nch=3Dmain;name=3Dopenamp;destsuffix=3Dgit/openamp"
-SRCREV_openamp =3D "c3f12991991d187d47637d88e8a66076f23d0c8c"
+SRCREV_openamp =3D "accac4d3610cbb268f3c3fe3c31dc45dd4c4dd17"
 EXTRA_OECMAKE +=3D "-DLIBOPENAMP_SRC_PATH=3D${S}/../openamp -DLIBOPENAMP=
_BIN_PATH=3D${B}/libopenamp-build"
=20
=20
--=20
2.30.2


