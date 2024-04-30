Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C8EC4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 16:03:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19685.1714492991945027790
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 09:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A6FB339;
	Tue, 30 Apr 2024 09:03:38 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.32.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A778E3F73F;
	Tue, 30 Apr 2024 09:03:10 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 2/3] arm-bsp/trusted-firmware-m: remove OpenAMP and Libmetal
Date: Tue, 30 Apr 2024 18:03:00 +0200
Message-Id: <20240430160301.802105-3-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240430160301.802105-1-bence.balogh@arm.com>
References: <20240430160301.802105-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 16:03:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5663

From: Bence Balogh <bence.balogh@arm.com>

Corstone-1000 no longer uses OpenAMP, and it was the only platform
which needed this library.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 ...are-m-disable-address-warnings-into.patch} |  0
 ...modify-path-to-libmetal-version-file.patch | 27 -------------------
 .../trusted-firmware-m-corstone1000.inc       | 20 ++------------
 3 files changed, 2 insertions(+), 45 deletions(-)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/{0002-arm-trust=
ed-firmware-m-disable-address-warnings-into.patch =3D> 0001-arm-trusted-f=
irmware-m-disable-address-warnings-into.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/000=
1-cmake-modify-path-to-libmetal-version-file.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/0002-arm-t=
rusted-firmware-m-disable-address-warnings-into.patch b/meta-arm-bsp/reci=
pes-bsp/trusted-firmware-m/files/0001-arm-trusted-firmware-m-disable-addr=
ess-warnings-into.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/0002-arm-tr=
usted-firmware-m-disable-address-warnings-into.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/0001-arm-trus=
ted-firmware-m-disable-address-warnings-into.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/0001-cmake=
-modify-path-to-libmetal-version-file.patch b/meta-arm-bsp/recipes-bsp/tr=
usted-firmware-m/files/0001-cmake-modify-path-to-libmetal-version-file.pa=
tch
deleted file mode 100644
index d53524ad..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/0001-cmake-modify=
-path-to-libmetal-version-file.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 6b38b9990c4dab0cb8524506ef129d4f326f3800 Mon Sep 17 00:00:00 2001
-From: Jon Mason <jon.mason@arm.com>
-Date: Thu, 14 Dec 2023 09:23:09 -0500
-Subject: [PATCH] cmake: modify path to libmetal version file
-
-Commit ad87802d6e01e97946de20b6c2fa28aed184ed20 changed how the
-versioning is done and created a version file.  Due to this change,
-the VERSION file is not being found when building because the source dir
-is pointing to tf-m.  Modify to point where we want it.
-
-Upstream-Status: Inappropriate [Build workaround]
-
-Signed-off-by: Jon Mason <jon.mason@arm.com>
----
- cmake/options.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cmake/options.cmake b/cmake/options.cmake
-index a7b4ef8bdf03..a06009b6acc4 100644
---- a/cmake/options.cmake
-+++ b/cmake/options.cmake
-@@ -1,4 +1,4 @@
--file(READ ${LIBMETAL_ROOT_DIR}/VERSION ver)
-+file(READ ${LIBMETAL_ROOT_DIR}/../libmetal/VERSION ver)
-=20
- string(REGEX MATCH "VERSION_MAJOR =3D ([0-9]*)" _ ${ver})
- set(PROJECT_VERSION_MAJOR ${CMAKE_MATCH_1})
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index ed4710e5..2bd346bf 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -11,25 +11,9 @@ TFM_PLATFORM_IS_FVP ?=3D "FALSE"
 EXTRA_OECMAKE +=3D "-DPLATFORM_IS_FVP=3D${TFM_PLATFORM_IS_FVP}"
 EXTRA_OECMAKE +=3D "-DCC312_LEGACY_DRIVER_API_ENABLED=3DOFF"
=20
-# libmetal v2023.04.0
-LICENSE +=3D "& BSD-3-Clause"
-LIC_FILES_CHKSUM +=3D "file://../libmetal/LICENSE.md;md5=3Df4d5df0f12dce=
a1b1a0124219c0dbab4"
-SRC_URI +=3D "git://github.com/OpenAMP/libmetal.git;protocol=3Dhttps;bra=
nch=3Dmain;name=3Dlibmetal;destsuffix=3Dgit/libmetal \
-            file://0001-cmake-modify-path-to-libmetal-version-file.patch=
;patchdir=3D../libmetal \
-            file://0002-arm-trusted-firmware-m-disable-address-warnings-=
into.patch \
+SRC_URI +=3D " \
+            file://0001-arm-trusted-firmware-m-disable-address-warnings-=
into.patch \
            "
-SRCREV_libmetal =3D "28fa2351d6a8121ce6c1c2ac5ee43ce08d38dbae"
-EXTRA_OECMAKE +=3D "-DLIBMETAL_SRC_PATH=3D${S}/../libmetal -DLIBMETAL_BI=
N_PATH=3D${B}/libmetal-build"
-# The configuration can fail if libmetal tries to generate the docs and =
the doxygen bin is found
-EXTRA_OECMAKE +=3D "-DWITH_DOC=3DFalse"
-
-# OpenAMP v2023.04.0
-LICENSE +=3D "& BSD-2-Clause & BSD-3-Clause"
-LIC_FILES_CHKSUM +=3D "file://../openamp/LICENSE.md;md5=3Dab88daf995c0bd=
0071c2e1e55f3d3505"
-SRC_URI +=3D "git://github.com/OpenAMP/open-amp.git;protocol=3Dhttps;bra=
nch=3Dmain;name=3Dopenamp;destsuffix=3Dgit/openamp"
-SRCREV_openamp =3D "accac4d3610cbb268f3c3fe3c31dc45dd4c4dd17"
-EXTRA_OECMAKE +=3D "-DLIBOPENAMP_SRC_PATH=3D${S}/../openamp -DLIBOPENAMP=
_BIN_PATH=3D${B}/libopenamp-build"
-
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
 SRC_URI:append:corstone1000 =3D " \
--=20
2.25.1


