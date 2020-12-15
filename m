Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.8683.1608024179534996278
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 01:22:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 395D31FB
	for <meta-arm@lists.yoctoproject.org>; Tue, 15 Dec 2020 01:22:59 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CCFF63F66E
	for <meta-arm@lists.yoctoproject.org>; Tue, 15 Dec 2020 01:22:58 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/u-boot: update FVP patch metadata
Date: Tue, 15 Dec 2020 09:22:55 +0000
Message-Id: <20201215092255.2765278-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: If8edc606afa57e33ddd05ae16d6bf53b798257bc
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../0001-Add-vexpress_aemv8a_aarch32-variant.patch              | 2 +-
 .../u-boot/u-boot-2020.07/fvp-common/u-boot_vexpress_fvp.patch  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-base-arm3=
2/0001-Add-vexpress_aemv8a_aarch32-variant.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot-2020.07/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-=
variant.patch
index 39c7e6a..ccfa57e 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-base-arm32/0001-=
Add-vexpress_aemv8a_aarch32-variant.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-base-arm32/0001-=
Add-vexpress_aemv8a_aarch32-variant.patch
@@ -13,7 +13,7 @@ vexpress_armv8a.h.
=20
 This patch is co-authored with Soby Mathew <Soby.Mathew@arm.com>.
=20
-Upstream-status: Denied
+Upstream-Status: Denied
=20
 For upstream discussion, please visit
 https://www.mail-archive.com/u-boot@lists.denx.de/msg233429.html
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-common/u-=
boot_vexpress_fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/=
fvp-common/u-boot_vexpress_fvp.patch
index 9a21687..0934e40 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-common/u-boot_ve=
xpress_fvp.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-common/u-boot_ve=
xpress_fvp.patch
@@ -1,4 +1,5 @@
 Upstream-Status: Inappropriate [OE config specific]
+Signed-off-by: Anders Dellien <anders.dellien@arm.com>
=20
 diff --git a/configs/vexpress_aemv8a_semi_defconfig b/configs/vexpress_a=
emv8a_semi_defconfig
 index f0ac2f9da3..93fcd3026a 100644
--=20
2.25.1

