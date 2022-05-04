Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6533DC433F5
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 13:17:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.6268.1651670237719079944
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 May 2022 06:17:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AE9312FC;
	Wed,  4 May 2022 06:17:16 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 220A73FA49;
	Wed,  4 May 2022 06:17:16 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] arm-bsp/trusted-firmware-m: move corstone1000 to TF-M
 1.6.0.
Date: Wed,  4 May 2022 14:17:11 +0100
Message-Id: <20220504131711.783449-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504131711.783449-1-ross.burton@arm.com>
References: <20220504131711.783449-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 May 2022 13:17:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3353

Move the TFM_PLATFORM assignment to the bbappend.

Drop the SRCREV changes, these are all incorporated into the 1.6.0
release.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/include/corstone1000.inc |  2 --
 .../trusted-firmware-m-corstone1000.inc            | 14 +++-----------
 ....bbappend =3D> trusted-firmware-m_1.6.%.bbappend} |  0
 3 files changed, 3 insertions(+), 13 deletions(-)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/{trusted-firmware-m_1=
.5%.bbappend =3D> trusted-firmware-m_1.6.%.bbappend} (100%)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 1faccd0b..d38773a3 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -10,8 +10,6 @@ TFA_BL2_BINARY =3D "bl2-corstone1000.bin"
 TFA_FIP_BINARY =3D "fip-corstone1000.bin"
=20
 # TF-M
-PREFERRED_VERSION_trusted-firmware-m ?=3D "1.5%"
-TFM_PLATFORM =3D "arm/corstone1000"
 EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-m"
=20
 # TF-M settings for signing host images
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index f387be5a..eb400e52 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -2,6 +2,8 @@
=20
 COMPATIBLE_MACHINE =3D "(corstone1000)"
=20
+TFM_PLATFORM =3D "arm/corstone1000"
+
 TFM_DEBUG =3D "1"
=20
 ## Default is the MPS3 board
@@ -9,14 +11,6 @@ TFM_PLATFORM_IS_FVP ?=3D "FALSE"
 EXTRA_OECMAKE +=3D "-DPLATFORM_IS_FVP=3D${TFM_PLATFORM_IS_FVP}"
 EXTRA_OECMAKE +=3D "-DCC312_LEGACY_DRIVER_API_ENABLED=3DOFF"
=20
-SRCBRANCH_tfm =3D "master"
-SRCREV_tfm =3D "f8c7e5361b92b16108165601ea81c5d01feb3c22"
-SRCREV_mbedtls =3D "d65aeb37349ad1a50e0f6c9b694d4b5290d60e49"
-SRCREV_mcuboot =3D "29099e1d17f93ae1d09fe945ad191b703aacd3d8"
-
-PV =3D "1.5.0+git${SRCPV}"
-SRCREV_FORMAT =3D "tfm"
-
 # libmetal
 LICENSE +=3D "& BSD-3-Clause"
 LIC_FILES_CHKSUM +=3D "file://../libmetal/LICENSE.md;md5=3Dfe0b8a4beea8f=
0813b606d15a3df3d3c"
@@ -31,9 +25,7 @@ SRC_URI +=3D "git://github.com/OpenAMP/open-amp.git;pro=
tocol=3Dhttps;branch=3Dmain;nam
 SRCREV_openamp =3D "347397decaa43372fc4d00f965640ebde042966d"
 EXTRA_OECMAKE +=3D "-DLIBOPENAMP_SRC_PATH=3D${WORKDIR}/git/openamp -DLIB=
OPENAMP_BIN_PATH=3D${B}/libopenamp-build"
=20
-# The install task signs the TF-A BL2 and FIP binaries.
-# So they need to be copied to the sysroot. Hence the dependencies below=
:
-do_prepare_recipe_sysroot[depends]+=3D "trusted-firmware-a:do_populate_s=
ysroot"
+DEPENDS +=3D "trusted-firmware-a"
=20
 # adding host images signing support
 require trusted-firmware-m-sign-host-images.inc
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m_1.5%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-fi=
rmware-m_1.6.%.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-=
m_1.5%.bbappend
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_=
1.6.%.bbappend
--=20
2.25.1


