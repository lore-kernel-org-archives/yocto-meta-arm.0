Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E493C00140
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 13:19:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10426.1660310343984658366
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Aug 2022 06:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFD17113E
	for <meta-arm@lists.yoctoproject.org>; Fri, 12 Aug 2022 06:19:03 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CF6473F70D
	for <meta-arm@lists.yoctoproject.org>; Fri, 12 Aug 2022 06:19:02 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/qemuarm-secureboot: remove vmalloc from
 QB_KERNEL_CMDLINE_APPEND
Date: Thu, 11 Aug 2022 10:05:03 -0400
Message-Id: <20220811140503.10500-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220811140503.10500-1-jon.mason@arm.com>
References: <20220811140503.10500-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 12 Aug 2022 13:19:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3676

The newly added vmalloc entry in qemuarm is causing issues with graphics
on qemuarm-secureboot.  Remove that by setting +QB_KERNEL_CMDLINE_APPEND
to empty.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/conf/machine/qemuarm-secureboot.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/conf/machine/qemuarm-secureboot.conf b/meta-arm/conf/machine/qemuarm-secureboot.conf
index a459f3fa..e48d9642 100644
--- a/meta-arm/conf/machine/qemuarm-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm-secureboot.conf
@@ -12,6 +12,7 @@ QB_DEFAULT_BIOS = "flash.bin"
 QB_FSINFO = "wic:no-kernel-in-fs"
 QB_ROOTFS_OPT = ""
 QB_KERNEL_ROOT = "/dev/vda2"
+QB_KERNEL_CMDLINE_APPEND = ""
 
 IMAGE_FSTYPES += "wic wic.qcow2"
 
-- 
2.17.1


