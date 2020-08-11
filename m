Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.18157.1597161238354061070
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Aug 2020 08:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9099631B
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 Aug 2020 08:53:57 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2BEF13F6CF
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 Aug 2020 08:53:57 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][dunfell] arm-bsp/linux: remove redundant CONFIG_DRM_ARM
Date: Tue, 11 Aug 2020 16:53:54 +0100
Message-Id: <20200811155354.3234412-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Ross Burton <ross.burton@arm.com>

This config option was made redundant in 5.1, so remove it.

https://github.com/torvalds/linux/commit/37fc9bb022c654e261c5a7d2ce600c6c=
e26c022d

Change-Id: I12dd59e5405936aac2733354f4ff1e214571130d
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../bsp/arm-platforms/gem5-arm64/gem5-arm64-drm.cfg              | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/gem5-arm64/gem5-arm64-drm.cfg b/meta-arm-bsp/recipes-kernel/l=
inux/arm-platforms-kmeta/bsp/arm-platforms/gem5-arm64/gem5-arm64-drm.cfg
index 7c97020..34b0141 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/gem5-arm64/gem5-arm64-drm.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/gem5-arm64/gem5-arm64-drm.cfg
@@ -1,5 +1,4 @@
 CONFIG_DRM=3Dy
-CONFIG_DRM_ARM=3Dy
 CONFIG_DRM_HDLCD=3Dy
 CONFIG_FB=3Dy
 CONFIG_FB_ARMCLCD=3Dy
--=20
2.26.2

