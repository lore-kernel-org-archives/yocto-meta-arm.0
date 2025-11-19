Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF38CCF3979
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 17:13:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12489.1763572420261732951
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 09:13:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=temperror, err=temporary DNS error (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BC44153B
	for <meta-arm@lists.yoctoproject.org>; Wed, 19 Nov 2025 09:13:31 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CD3673F66E
	for <meta-arm@lists.yoctoproject.org>; Wed, 19 Nov 2025 09:13:38 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] arm-bsp/trusted-firmware-m: use UNPACKDIR instead of S/../
Date: Wed, 19 Nov 2025 17:13:31 +0000
Message-ID: <20251119171333.3883043-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119171333.3883043-1-ross.burton@arm.com>
References: <20251119171333.3883043-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Nov 2025 17:13:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6776

This is slightly clearer.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m-corstone1000.inc      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index e0a0745ce0..a9521fbfbb 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -16,7 +16,7 @@ EXTRA_OECMAKE +=3D "-DPLATFORM_IS_FVP=3D${TFM_PLATFORM_=
IS_FVP}"
 EXTRA_OECMAKE +=3D "-DCC312_LEGACY_DRIVER_API_ENABLED=3DOFF"
 EXTRA_OECMAKE:append:corstone1000-fvp =3D " -DENABLE_MULTICORE=3D${@bb.u=
tils.contains('MACHINE_FEATURES', 'corstone1000_fvp_smp', 'TRUE', 'FALSE'=
, d)}"
 EXTRA_OECMAKE:append:corstone1000-mps3 =3D " -DPLATFORM_PSA_ADAC_SECURE_=
DEBUG=3D${@bb.utils.contains('MACHINE_FEATURES', 'secure-debug', 'ON', 'O=
FF', d)}"
-EXTRA_OECMAKE:append:corstone1000-mps3 =3D " -DPLATFORM_PSA_ADAC_SOURCE_=
PATH=3D${S}/../tfm-psa-adac -DPLATFORM_PSA_ADAC_BUILD_PATH=3D${B}/tfm-psa=
-adac-build"
+EXTRA_OECMAKE:append:corstone1000-mps3 =3D " -DPLATFORM_PSA_ADAC_SOURCE_=
PATH=3D${UNPACKDIR}/tfm-psa-adac -DPLATFORM_PSA_ADAC_BUILD_PATH=3D${B}/tf=
m-psa-adac-build"
=20
 SRC_URI +=3D " \
             file://0001-arm-trusted-firmware-m-disable-address-warnings-=
into.patch \
--=20
2.43.0


