Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97FCBC52D6F
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 14:53:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.61986.1723128786183125897
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 08 Aug 2024 07:53:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBDC31042
	for <meta-arm@lists.yoctoproject.org>; Thu,  8 Aug 2024 07:53:30 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ACC583F766
	for <meta-arm@lists.yoctoproject.org>; Thu,  8 Aug 2024 07:53:04 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/linux-yocto: update for linux 6.10
Date: Thu,  8 Aug 2024 15:52:59 +0100
Message-Id: <20240808145259.2155425-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 08 Aug 2024 14:53:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5958

CONFIG_FB_ARMCLCD is long obsolete, has been replaced with a DRM driver
enabled by CONFIG_DRM_PL111, and was removed in 6.8.

CONFIG_THERMAL_WRITABLE_TRIPS was removed in 6.9.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux/arm-platforms-kmeta/bsp/arm-platforms/fvp/fvp-drm.cfg | 1 -
 .../arm-platforms-kmeta/bsp/arm-platforms/juno/juno-drm.cfg     | 2 +-
 .../arm-platforms-kmeta/bsp/arm-platforms/juno/juno-fb.cfg      | 1 -
 .../arm-platforms-kmeta/bsp/arm-platforms/juno/juno-thermal.cfg | 1 -
 4 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/fvp/fvp-drm.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platf=
orms-kmeta/bsp/arm-platforms/fvp/fvp-drm.cfg
index 77133a9d..0a6e3f67 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/fvp/fvp-drm.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/fvp/fvp-drm.cfg
@@ -2,4 +2,3 @@
 CONFIG_DRM=3Dy
 CONFIG_DRM_PL111=3Dy
 CONFIG_FB=3Dy
-CONFIG_FB_ARMCLCD=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/juno/juno-drm.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-pla=
tforms-kmeta/bsp/arm-platforms/juno/juno-drm.cfg
index 12162979..7b225083 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/juno/juno-drm.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/juno/juno-drm.cfg
@@ -1,5 +1,5 @@
 CONFIG_DRM=3Dy
 CONFIG_DRM_HDLCD=3Dy
+CONFIG_DRM_PL111=3Dy
 CONFIG_DRM_I2C_NXP_TDA998X=3Dy
 CONFIG_FB=3Dy
-CONFIG_FB_ARMCLCD=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/juno/juno-fb.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-plat=
forms-kmeta/bsp/arm-platforms/juno/juno-fb.cfg
index 59499fa6..ba143a0a 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/juno/juno-fb.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/juno/juno-fb.cfg
@@ -1,4 +1,3 @@
 CONFIG_FB=3Dy
-CONFIG_FB_ARMCLCD=3Dy
 CONFIG_FRAMEBUFFER_CONSOLE=3Dy
 # CONFIG_VGA_CONSOLE is not set
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/juno/juno-thermal.cfg b/meta-arm-bsp/recipes-kernel/linux/arm=
-platforms-kmeta/bsp/arm-platforms/juno/juno-thermal.cfg
index f4d220e0..a5b0e69b 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/juno/juno-thermal.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/juno/juno-thermal.cfg
@@ -5,4 +5,3 @@ CONFIG_THERMAL_GOV_POWER_ALLOCATOR=3Dy
 CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR=3Dy
 CONFIG_THERMAL_GOV_USER_SPACE=3Dy
 CONFIG_CPU_THERMAL=3Dy
-CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
--=20
2.34.1


