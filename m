Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9887BC433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 14:40:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.13153.1635259201837838784
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Oct 2021 07:40:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE1BD1396;
	Tue, 26 Oct 2021 07:40:00 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C3C8C3F73D;
	Tue, 26 Oct 2021 07:40:00 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 2/2] arm-bsp/n1sdp: remove explicit preferred edk2-firmware
 version
Date: Fri, 15 Oct 2021 12:34:45 -0400
Message-Id: <20211015163445.10695-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211015163445.10695-1-jon.mason@arm.com>
References: <20211015163445.10695-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 Oct 2021 14:40:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2303

From: Ross Burton <ross.burton@arm.com>

Whilst we have just one version of edk2-firmware, there is no reason to
select a preferred version.

Change-Id: I816de3b7dbcfc543307c792bcd16a5d69f5f4f2d
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index 7e265ba..288d760 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -32,7 +32,6 @@ EXTRA_IMAGEDEPENDS += "virtual/control-processor-firmware"
 
 #UEFI EDK2 firmware
 EXTRA_IMAGEDEPENDS += "virtual/uefi-firmware"
-PREFERRED_VERSION_edk2-firmware ?= "202102%"
 
 #grub-efi
 EFI_PROVIDER ?= "grub-efi"
-- 
2.17.1


