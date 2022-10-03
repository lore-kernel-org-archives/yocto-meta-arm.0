Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E1A9C4321E
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 13:01:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.55.1664802079761788145
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 06:01:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3ED4216F8;
	Mon,  3 Oct 2022 06:01:26 -0700 (PDT)
Received: from e121910.arm.com (unknown [10.57.65.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EB143F73B;
	Mon,  3 Oct 2022 06:01:18 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 07/12] arm-bsp/machine: corstone1000: disable pulling the
 kernel into the initramfs
Date: Mon,  3 Oct 2022 14:00:46 +0100
Message-Id: <20221003130051.28934-8-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221003130051.28934-1-abdellatif.elkhlifi@arm.com>
References: <20221003130051.28934-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Oct 2022 13:01:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3901

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

exclude kernel-image-* packages from the rootfs

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 meta-arm-bsp/conf/machine/include/corstone1000.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
index fd659a4c..46361bba 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -57,6 +57,9 @@ INITRAMFS_IMAGE_BUNDLE ?= "1"
 #telling the build system which image is responsible of the generation of the initramfs rootfs
 INITRAMFS_IMAGE = "corstone1000-initramfs-image"
 
+# prevent the kernel image from being included in the intramfs rootfs
+PACKAGE_EXCLUDE = "kernel-image-*"
+
 # enable this feature for kernel debugging
 # MACHINE_FEATURES += "corstone1000_kernel_debug"
 
-- 
2.17.1


