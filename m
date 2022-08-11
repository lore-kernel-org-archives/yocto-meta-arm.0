Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D87C25B0C
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 13:42:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.6548.1660225363066509497
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Aug 2022 06:42:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19F3E1570
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Aug 2022 06:42:43 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3AADE3F67D
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Aug 2022 06:42:42 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm/linux-yocto: remove optee num pages kernel config
 variable
Date: Thu, 11 Aug 2022 09:42:36 -0400
Message-Id: <20220811134236.3502-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220811134236.3502-1-jon.mason@arm.com>
References: <20220811134236.3502-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Aug 2022 13:42:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3674

This kernel config variable has been removed from newer kernels (v5.19)
and is logging a warning of:
[INFO]: the following symbols were not found in the active configuration:
     - CONFIG_OPTEE_SHM_NUM_PRIV_PAGES

Remove the entry, as it is no longer needed

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg b/meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg
index 9a25cd5b..53c452d4 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg
+++ b/meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg
@@ -5,7 +5,6 @@ CONFIG_TEE=y
 # TEE drivers
 #
 CONFIG_OPTEE=y
-CONFIG_OPTEE_SHM_NUM_PRIV_PAGES=1
 # end of TEE drivers
 
 CONFIG_TCG_TPM=y
-- 
2.17.1


