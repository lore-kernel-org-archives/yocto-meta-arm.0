Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207DBC4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 17:50:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1968.1699897809283085364
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Nov 2023 09:50:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7327DFEC;
	Mon, 13 Nov 2023 09:50:54 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 77CAC3F6C4;
	Mon, 13 Nov 2023 09:50:08 -0800 (PST)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/3] arm-bsp/trusted-firmware-a: use v8.4 instructions on fvp-base
Date: Mon, 13 Nov 2023 17:50:05 +0000
Message-Id: <20231113175005.174725-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231113175005.174725-1-ross.burton@arm.com>
References: <20231113175005.174725-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Nov 2023 17:50:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5240

From: Ross Burton <ross.burton@arm.com>

The fvp-base machine uses a v8.4 tune and the FVP itself is configured
to be v8.4, so also tell TF-A to use v8.4.

This is normally done in the TF-A board configuration, but the fvp board
is configurable.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a-fvp-base.inc       | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-fvp-base.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a-fvp-base.inc
index d773e41c..5fafe292 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-=
base.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-=
base.inc
@@ -14,4 +14,7 @@ TFA_MBEDTLS =3D "1"
 TFA_UBOOT ?=3D "1"
 TFA_BUILD_TARGET =3D "bl1 bl2 bl31 dtbs fip"
=20
-EXTRA_OEMAKE:append =3D " FVP_DT_PREFIX=3Dfvp-base-gicv3-psci-1t"
+EXTRA_OEMAKE +=3D "FVP_DT_PREFIX=3Dfvp-base-gicv3-psci-1t"
+
+# Our fvp-base machine explicitly has v8.4 cores
+EXTRA_OEMAKE +=3D "ARM_ARCH_MAJOR=3D8 ARM_ARCH_MINOR=3D4"
--=20
2.34.1


