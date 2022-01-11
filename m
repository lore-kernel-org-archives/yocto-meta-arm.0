Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4303C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 18:30:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.11740.1641925833035538005
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 10:30:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A178D6E
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 Jan 2022 10:30:32 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FECA3F766
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 Jan 2022 10:30:32 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/trusted-firmware-a: remove TF-A 2.5
Date: Tue, 11 Jan 2022 18:30:30 +0000
Message-Id: <20220111183030.3219939-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Jan 2022 18:30:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2814

Nothing is using TF-A 2.5 anymore, so remove the recipe.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-a_2.5.bbappend                | 14 --------------
 .../trusted-firmware-a/trusted-firmware-a_2.5.bb   | 12 ------------
 2 files changed, 26 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a_2.5.bbappend
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_2.5.bb

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.5.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_2.5.bbappend
deleted file mode 100644
index 659ba352..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.=
bbappend
+++ /dev/null
@@ -1,14 +0,0 @@
-# Machine specific TFAs
-
-MACHINE_TFA_REQUIRE ?=3D ""
-MACHINE_TFA_REQUIRE:corstone500 =3D "trusted-firmware-a-corstone500.inc"
-MACHINE_TFA_REQUIRE:corstone700 =3D "trusted-firmware-a-corstone700.inc"
-MACHINE_TFA_REQUIRE:corstone1000 =3D "trusted-firmware-a-corstone1000.in=
c"
-MACHINE_TFA_REQUIRE:fvp-base =3D "trusted-firmware-a-fvp.inc"
-MACHINE_TFA_REQUIRE:fvp-base-arm32 =3D "trusted-firmware-a-fvp-arm32.inc=
"
-MACHINE_TFA_REQUIRE:juno =3D "trusted-firmware-a-juno.inc"
-MACHINE_TFA_REQUIRE:n1sdp =3D "trusted-firmware-a-n1sdp.inc"
-MACHINE_TFA_REQUIRE:sgi575 =3D "trusted-firmware-a-sgi575.inc"
-MACHINE_TFA_REQUIRE:tc =3D "trusted-firmware-a-tc.inc"
-
-require ${MACHINE_TFA_REQUIRE}
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.5.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bb
deleted file mode 100644
index 15c4e5df..00000000
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require trusted-firmware-a.inc
-
-# TF-A v2.5
-SRCREV_tfa =3D "1e13c500a0351ac4b55d09a63f7008e2438550f8"
-
-LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D713afe122abbe07f067=
f939ca3c480c5"
-
-# mbed TLS v2.26.0
-SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmaster"
-SRCREV_mbedtls =3D "e483a77c85e1f9c1dd2eb1c5a8f552d2617fe400"
-
-LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D3b83ef96387f1=
4655fc854ddc3c6bd57"
--=20
2.25.1


