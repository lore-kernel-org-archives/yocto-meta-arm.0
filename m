Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F24FFC43219
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 09:16:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5914.1666170969988766964
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Oct 2022 02:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 636F61063;
	Wed, 19 Oct 2022 02:16:15 -0700 (PDT)
Received: from e121910.arm.com (unknown [10.57.5.203])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E326C3F7D8;
	Wed, 19 Oct 2022 02:16:07 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com,
	Devaraj.Ranganna@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH kirkstone 0/2] corstone1000: kirkstone: backport kernel compression
Date: Wed, 19 Oct 2022 10:15:55 +0100
Message-Id: <20221019091557.3949-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Oct 2022 09:16:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3980

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

backport from master the commits allowing to reduce the initramfs bundle size.

Cheers,
Abdellatif

Abdellatif El Khlifi (2):
  arm-bsp/corstone1000: use compressed kernel image
  arm-bsp/machine: corstone1000: disable pulling the kernel into the
    initramfs

 .../conf/machine/include/corstone1000.inc     |  5 ++-
 ...corstone1000-use-a-compressed-kernel.patch | 35 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 .../wic/corstone1000-image.corstone1000.wks   |  2 +-
 4 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-corstone1000-use-a-compressed-kernel.patch

-- 
2.17.1


