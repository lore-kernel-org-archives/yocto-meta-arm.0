Return-Path: <mohamed.omarasaker@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34765C433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 11:03:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.5773.1665745407068004281
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 14 Oct 2022 04:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mohamed.omarasaker@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D3FC13D5;
	Fri, 14 Oct 2022 04:03:32 -0700 (PDT)
Received: from e126544.arm.com (unknown [10.57.36.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B7033F792;
	Fri, 14 Oct 2022 04:03:24 -0700 (PDT)
From: mohamed.omarasaker@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Satish Kumar <satish.kumar01@arm.com>
Subject: [PATCH 2/4] arm-bsp/trusted-firmware-m: corstone1000: bump tfm SHA
Date: Fri, 14 Oct 2022 12:02:49 +0100
Message-Id: <20221014110251.1766159-3-mohamed.omarasaker@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221014110251.1766159-1-mohamed.omarasaker@arm.com>
References: <20221014110251.1766159-1-mohamed.omarasaker@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 14 Oct 2022 11:03:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3965

From: Satish Kumar <satish.kumar01@arm.com>

The patch bumps the tfm SHA to
b065a6b28cc6c692b99e4f7e9387d96f51bf4d07

Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
---
 .../trusted-firmware-m-corstone1000.inc          | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 95c49d06..e57b1a97 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -11,6 +11,22 @@ TFM_PLATFORM_IS_FVP ?=3D "FALSE"
 EXTRA_OECMAKE +=3D "-DPLATFORM_IS_FVP=3D${TFM_PLATFORM_IS_FVP}"
 EXTRA_OECMAKE +=3D "-DCC312_LEGACY_DRIVER_API_ENABLED=3DOFF"
=20
+SRCBRANCH_tfm =3D "master"
+SRC_URI  =3D "git://git.trustedfirmware.org/TF-M/trusted-firmware-m.git;=
protocol=3Dhttps;branch=3D${SRCBRANCH_tfm};name=3Dtfm;destsuffix=3Dgit/tf=
m \
+            git://git.trustedfirmware.org/TF-M/tf-m-tests.git;protocol=3D=
https;branch=3Dmaster;name=3Dtfm-tests;destsuffix=3Dgit/tf-m-tests \
+            git://github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;branch=
=3Dmaster;name=3Dmbedtls;destsuffix=3Dgit/mbedtls \
+            git://github.com/mcu-tools/mcuboot.git;protocol=3Dhttps;bran=
ch=3Dmain;name=3Dmcuboot;destsuffix=3Dgit/mcuboot \
+            "
+
+# Bumping the SHA of TFM is required as multiple changes are needed in t=
he TFM to support the ESRT=20
+# The most crucial change needed is TFM support for UEFI FMP Image Infor=
mation=20
+SRCREV_tfm =3D "b065a6b28cc6c692b99e4f7e9387d96f51bf4d07"
+SRCREV_mbedtls =3D "869298bffeea13b205343361b7a7daf2b210e33d"
+SRCREV_mcuboot =3D "c657cbea75f2bb1faf1fceacf972a0537a8d26dd"
+SRCREV_tfm-tests =3D "3e6c52b4b255e4b1343ba6a257a77fa7a976e8fb"
+PV .=3D "+git${SRCPV}"
+SRCREV_FORMAT ?=3D "tfm"
+
 # libmetal
 LICENSE +=3D "& BSD-3-Clause"
 LIC_FILES_CHKSUM +=3D "file://../libmetal/LICENSE.md;md5=3Dfe0b8a4beea8f=
0813b606d15a3df3d3c"
--=20
2.25.1


