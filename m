Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23A2C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 11:32:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.5869.1639135946357930722
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Dec 2021 03:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA5AD2B;
	Fri, 10 Dec 2021 03:32:25 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.35.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79EFA3F73B;
	Fri, 10 Dec 2021 03:32:24 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Drew Reed <drew.reed@arm.com>,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH] arm-bsp/trusted-firmware-m: corsone1000: Fix circular
 dependency in SRCPV
Date: Fri, 10 Dec 2021 11:32:15 +0000
Message-Id: <20211210113215.6525-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 10 Dec 2021 11:32:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2610

From: Drew Reed <drew.reed@arm.com>

Change the setting of PV from referancing SRCPV to using SRCREV.

Also drop the use of PREFERRED_VERSION. The existing TF-M recipe will
be selected automatically (1.4.1). Corstone1000 bbappend sets the SHA and
PV to 1.5

Change-Id: Id9332fd87e271608ba425e05e796f75fd1c0268d
Signed-off-by: Drew Reed <drew.reed@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 meta-arm-bsp/conf/machine/include/corstone1000.inc              | 1 -
 .../trusted-firmware-m/trusted-firmware-m-corstone1000.inc      | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
index 994fb06..2c554d4 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -11,7 +11,6 @@ TFA_BL2_BINARY = "bl2-corstone1000.bin"
 TFA_FIP_BINARY = "fip-corstone1000.bin"
 
 # TF-M
-PREFERRED_VERSION_trusted-firmware-m ?= "1.4%"
 TFM_PLATFORM = "arm/corstone1000"
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-m"
 
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
index 19222d5..a060358 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
@@ -12,7 +12,7 @@ SRCBRANCH_tfm = "master"
 SRCREV_tfm = "dc605e057470bb0eb0e92c2aafb443300a90c43f"
 SRCREV_mcuboot = "29099e1d17f93ae1d09fe945ad191b703aacd3d8"
 
-PV = "1.5+git${SRCPV}"
+PV = "1.5+git${SRCREV_tfm}"
 
 # The install task signs the TF-A BL2 and FIP binaries.
 # So they need to be copied to the sysroot. Hence the dependencies below:
-- 
2.17.1


