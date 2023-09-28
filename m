Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1290E732D0
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 14:25:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14626.1695911145830903271
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Sep 2023 07:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D44DC1FB;
	Thu, 28 Sep 2023 07:26:23 -0700 (PDT)
Received: from e130802.cambridge.arm.com (e130802.arm.com [10.1.39.56])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABE823F59C;
	Thu, 28 Sep 2023 07:25:44 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 1/2] arm-bsp/trusted-firmware-a: corstone1000: enable ERRATA_A35_855472
Date: Thu, 28 Sep 2023 15:25:32 +0100
Message-Id: <20230928142533.391672-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230928142533.391672-1-abdellatif.elkhlifi@arm.com>
References: <20230928142533.391672-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 28 Sep 2023 14:25:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5076

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

enable errata 855472 for Cortex-A35 in Corstone-1000

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a-corstone1000.inc       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index 5b15247d..ee071371 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -38,6 +38,7 @@ EXTRA_OEMAKE:append =3D " \
                         NR_OF_IMAGES_IN_FW_BANK=3D4 \
                         COT=3Dtbbr \
                         ARM_ROTPK_LOCATION=3Ddevel_rsa  \
+                        ERRATA_A35_855472=3D1 \
                         ROT_KEY=3Dplat/arm/board/common/rotpk/arm_rotpri=
vk_rsa.pem \
                         BL32=3D${RECIPE_SYSROOT}/${nonarch_base_libdir}/=
firmware/tee-pager_v2.bin \
                         LOG_LEVEL=3D50 \
--=20
2.25.1


