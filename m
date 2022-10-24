Return-Path: <mohamed.omarasaker@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15522FA373E
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 13:33:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.19410.1666618426735084207
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Oct 2022 06:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mohamed.omarasaker@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F1B01042;
	Mon, 24 Oct 2022 06:33:52 -0700 (PDT)
Received: from e126544.cambridge.arm.com (e126544.cambridge.arm.com [10.1.199.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A38C63F7B4;
	Mon, 24 Oct 2022 06:33:45 -0700 (PDT)
From: mohamed.omarasaker@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
Subject: [PATCH 1/4] Revert "arm-bsp/trusted-firmware-m: corstone1000: secure debug code checkout from yocto"
Date: Mon, 24 Oct 2022 14:33:27 +0100
Message-Id: <20221024133330.10542-2-mohamed.omarasaker@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221024133330.10542-1-mohamed.omarasaker@arm.com>
References: <20221024133330.10542-1-mohamed.omarasaker@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 13:33:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4017

From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>

This reverts commit 37ba0b162a363ec2884511b4994f36b48873df48.

Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
---
 .../trusted-firmware-m-corstone1000.inc               | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index dc57eacb..3cd1a4bb 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -41,17 +41,6 @@ SRC_URI +=3D "git://github.com/OpenAMP/open-amp.git;pr=
otocol=3Dhttps;branch=3Dmain;nam
 SRCREV_openamp =3D "347397decaa43372fc4d00f965640ebde042966d"
 EXTRA_OECMAKE +=3D "-DLIBOPENAMP_SRC_PATH=3D${S}/../openamp -DLIBOPENAMP=
_BIN_PATH=3D${B}/libopenamp-build"
=20
-# Secure Debug ADAC
-LICENSE +=3D "& BSD-3-Clause"
-LIC_FILES_CHKSUM +=3D "file://../psa-adac/license.rst;md5=3D07f368487da3=
47f3c7bd0fc3085f3afa"
-SRC_URI +=3D "git://git.trustedfirmware.org/shared/psa-adac.git;protocol=
=3Dhttps;branch=3Dmaster;name=3Dpsa-adac;destsuffix=3Dgit/psa-adac"
-SRCREV_psa-adac =3D "427923cc0152578d536fb2065154d5d0dd874910"
-# Secure debug is disabled by default
-EXTRA_OECMAKE +=3D "-DPLATFORM_PSA_ADAC_SECURE_DEBUG=3DOFF"
-EXTRA_OECMAKE +=3D "-DPLATFORM_PSA_ADAC_SOURCE_PATH=3D${S}/../psa-adac -=
DPLATFORM_PSA_ADAC_BUILD_PATH=3D${B}/libpsa-adac-build"
-
-DEPENDS +=3D "trusted-firmware-a"
-
 do_install() {
   install -D -p -m 0644 ${B}/install/outputs/tfm_s_signed.bin ${D}/firmw=
are/tfm_s_signed.bin
   install -D -p -m 0644 ${B}/install/outputs/bl2_signed.bin ${D}/firmwar=
e/bl2_signed.bin
--=20
2.25.1


