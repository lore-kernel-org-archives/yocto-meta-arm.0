Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.18149.1597161229587795821
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Aug 2020 08:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 555C731B
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 Aug 2020 08:53:47 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB01B3F6CF
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 Aug 2020 08:53:46 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] gem5/linux: remove redundant CONFIG_DRM_ARM
Date: Tue, 11 Aug 2020 16:53:39 +0100
Message-Id: <20200811155339.3234353-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Ross Burton <ross.burton@arm.com>

This config option was made redundant in 5.1, so remove it.

https://github.com/torvalds/linux/commit/37fc9bb022c654e261c5a7d2ce600c6c=
e26c022d

Change-Id: I01aabec52ae71fc5cabe8a1589766b6b4c79b677
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gem5-kmeta/bsp/gem5-platforms/gem5-arm64/gem5-arm64-drm.cfg  | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms=
/gem5-arm64/gem5-arm64-drm.cfg b/meta-gem5/recipes-kernel/linux/gem5-kmet=
a/bsp/gem5-platforms/gem5-arm64/gem5-arm64-drm.cfg
index 7c97020..34b0141 100644
--- a/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-a=
rm64/gem5-arm64-drm.cfg
+++ b/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-a=
rm64/gem5-arm64-drm.cfg
@@ -1,5 +1,4 @@
 CONFIG_DRM=3Dy
-CONFIG_DRM_ARM=3Dy
 CONFIG_DRM_HDLCD=3Dy
 CONFIG_FB=3Dy
 CONFIG_FB_ARMCLCD=3Dy
--=20
2.26.2

