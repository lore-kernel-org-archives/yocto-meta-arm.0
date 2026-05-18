Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44CE6CD4F52
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 18:52:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4586.1779130313350067077
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 May 2026 11:51:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=kL2q8FQ7;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A3363297;
	Mon, 18 May 2026 11:51:47 -0700 (PDT)
Received: from LXKV206JHX.arm.com (unknown [10.57.25.80])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E56693F85F;
	Mon, 18 May 2026 11:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779130312; bh=D7mF7gNfZOky3Sbbe+TQbmUI4kRiQRmEFAHTtmgaB18=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kL2q8FQ7Sf6ZqLVT5AEoi1ivEaOAa6rNN4U0+3l56vsOpUS9bfCEPJXTnMWCUvnWs
	 rAAkai8PYengD3zqBS+HZm+xQA1Ym0UuYCXnQrGmr3iYi9MyMWxkFQ4XKrAZhFR/19
	 d3VPq0gLpjmlTRGv8gLxLtcGr/UGXsagJc5mjrK4=
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Alex Chapman <alex.chapman@arm.com>,
	Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH wrynose 1/6] arm-bsp/tf-a: corstone1000: Fix Cortex-A320 errata override
Date: Mon, 18 May 2026 19:51:36 +0100
Message-ID: <20260518185146.11634-2-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260518185146.11634-1-hugues.kambampiana@arm.com>
References: <20260518185146.11634-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 May 2026 18:52:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7050

From: Alex Chapman <alex.chapman@arm.com>

Fix the Corstone-1000 with Cortex-A320 override for the
Trusted Firmware-A errata list.
The override was misspelled as
`ENABLE_CORTEX_A35_ERRATA:cortexta320` instead of
`ENABLE_CORTEX_A35_ERRATA:cortexa320`.

Rename the list to `ENABLE_CORTEX_A_ERRATA`, since it is shared by
the Cortex-A35 and Cortex-A320 variants.

Signed-off-by: Alex Chapman <alex.chapman@arm.com>
Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a-corstone1000.inc  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index c77ec29d..4979f294 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -23,10 +23,10 @@ TFA_SPMD_SPM_AT_SEL2 =3D "0"
 # BL2 loads BL32 (optee). So, optee needs to be built first:
 DEPENDS +=3D "optee-os"
=20
-ENABLE_CORTEX_A35_ERRATA =3D " \
+ENABLE_CORTEX_A_ERRATA =3D " \
     ERRATA_A35_855472=3D1 \
 "
-ENABLE_CORTEX_A35_ERRATA:cortexta320 =3D ""
+ENABLE_CORTEX_A_ERRATA:cortexa320 =3D ""
 FVP_GIC_DRIVER ?=3D "FVP_GICV2"
 FVP_GIC_DRIVER:cortexa320 =3D "FVP_GICV3"
=20
@@ -54,7 +54,7 @@ EXTRA_OEMAKE:append =3D " \
                         NR_OF_IMAGES_IN_FW_BANK=3D4 \
                         COT=3Dtbbr \
                         ARM_ROTPK_LOCATION=3Ddevel_rsa  \
-                        ${ENABLE_CORTEX_A35_ERRATA} \
+                        ${ENABLE_CORTEX_A_ERRATA} \
                         ROT_KEY=3Dplat/arm/board/common/rotpk/arm_rotpri=
vk_rsa.pem \
                         BL32=3D${RECIPE_SYSROOT}/${nonarch_base_libdir}/=
firmware/tee-pager_v2.bin \
                         FVP_USE_GIC_DRIVER=3D${FVP_GIC_DRIVER} \

