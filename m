Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87CC0C4332F
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 10:56:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5831.1644576975497747034
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 02:56:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15C6411D4
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 02:56:15 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82F4D3F73B
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 02:56:14 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/5] arm-bsp/trusted-firmware-m: add OpenAMP to the CS1K build
Date: Fri, 11 Feb 2022 10:56:07 +0000
Message-Id: <20220211105608.2483647-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211105608.2483647-1-ross.burton@arm.com>
References: <20220211105608.2483647-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 10:56:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2984

TF-M for corstone1000 uses libmetal and open-amp, downloaded during
configure by FetchContent.  This is bad form, so add these sources and
license statements to the recipe so the fetch doesn't need to happen.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m-corstone1000.inc            | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 0e25fbe7..398d66eb 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -16,6 +16,20 @@ SRCREV_mcuboot =3D "29099e1d17f93ae1d09fe945ad191b703a=
acd3d8"
 PV =3D "1.5.0+git${SRCPV}"
 SRCREV_FORMAT =3D "tfm"
=20
+# libmetal
+LICENSE +=3D "& BSD-3-Clause"
+LIC_FILES_CHKSUM +=3D "file://../libmetal/LICENSE.md;md5=3Dfe0b8a4beea8f=
0813b606d15a3df3d3c"
+SRC_URI +=3D "git://github.com/OpenAMP/libmetal.git;protocol=3Dhttps;bra=
nch=3Dmain;name=3Dlibmetal;destsuffix=3Dgit/libmetal"
+SRCREV_libmetal =3D "f252f0e007fbfb8b3a52b1d5901250ddac96baad"
+EXTRA_OECMAKE +=3D "-DLIBMETAL_SRC_PATH=3D${WORKDIR}/git/libmetal -DLIBM=
ETAL_BIN_PATH=3D${B}/libmetal-build"
+
+# OpenAMP
+LICENSE +=3D "& BSD-2-Clause & BSD-3-Clause"
+LIC_FILES_CHKSUM +=3D "file://../openamp/LICENSE.md;md5=3Da8d8cf662ef6bf=
9936a1e1413585ecbf"
+SRC_URI +=3D "git://github.com/OpenAMP/open-amp.git;protocol=3Dhttps;bra=
nch=3Dmain;name=3Dopenamp;destsuffix=3Dgit/openamp"
+SRCREV_openamp =3D "347397decaa43372fc4d00f965640ebde042966d"
+EXTRA_OECMAKE +=3D "-DLIBOPENAMP_SRC_PATH=3D${WORKDIR}/git/openamp -DLIB=
OPENAMP_BIN_PATH=3D${B}/libopenamp-build"
+
 # The install task signs the TF-A BL2 and FIP binaries.
 # So they need to be copied to the sysroot. Hence the dependencies below=
:
 do_prepare_recipe_sysroot[depends]+=3D "trusted-firmware-a:do_populate_s=
ysroot"
--=20
2.25.1


