Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EC75C38145
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 19:30:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.479.1662665411183257770
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 08 Sep 2022 12:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19FA815A1
	for <meta-arm@lists.yoctoproject.org>; Thu,  8 Sep 2022 12:30:17 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A69723F71A
	for <meta-arm@lists.yoctoproject.org>; Thu,  8 Sep 2022 12:30:10 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm/optee-spdevkit: add version to file name
Date: Thu,  8 Sep 2022 15:29:59 -0400
Message-Id: <20220908192959.21816-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220908192959.21816-1-jon.mason@arm.com>
References: <20220908192959.21816-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 08 Sep 2022 19:30:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3748

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...optee-spdevkit_git.bbappend => optee-spdevkit_3.10.0.bbappend} | 0
 .../optee/{optee-spdevkit_git.bb => optee-spdevkit_3.10.0.bb}     | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-arm-bsp/recipes-security/optee/{optee-spdevkit_git.bbappend => optee-spdevkit_3.10.0.bbappend} (100%)
 rename meta-arm/recipes-security/optee/{optee-spdevkit_git.bb => optee-spdevkit_3.10.0.bb} (100%)

diff --git a/meta-arm-bsp/recipes-security/optee/optee-spdevkit_git.bbappend b/meta-arm-bsp/recipes-security/optee/optee-spdevkit_3.10.0.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/optee-spdevkit_git.bbappend
rename to meta-arm-bsp/recipes-security/optee/optee-spdevkit_3.10.0.bbappend
diff --git a/meta-arm/recipes-security/optee/optee-spdevkit_git.bb b/meta-arm/recipes-security/optee/optee-spdevkit_3.10.0.bb
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-spdevkit_git.bb
rename to meta-arm/recipes-security/optee/optee-spdevkit_3.10.0.bb
-- 
2.17.1


