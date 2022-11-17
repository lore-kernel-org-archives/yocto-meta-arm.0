Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 460D9C43217
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 16:59:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1306.1668704387795664630
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Nov 2022 08:59:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BA4E23A
	for <meta-arm@lists.yoctoproject.org>; Thu, 17 Nov 2022 08:59:53 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C28AB3F73B
	for <meta-arm@lists.yoctoproject.org>; Thu, 17 Nov 2022 08:59:46 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp/trusted-services: rename bbappends with git version
Date: Thu, 17 Nov 2022 11:59:40 -0500
Message-Id: <20221117165941.26145-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Nov 2022 16:59:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4136

"git" is the version and need not be part of the bbappend name.  Since
this isn't being done in any other part of meta-arm-bsp (and not
uniformly in the same directory), rename the bbappends to have the %
wild card.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../trusted-services/{libts_git.bbappend => libts_%.bbappend}     | 0
 ...to-api-test_git.bbappend => ts-psa-crypto-api-test_%.bbappend} | 0
 ...a-iat-api-test_git.bbappend => ts-psa-iat-api-test_%.bbappend} | 0
 ...a-its-api-test_git.bbappend => ts-psa-its-api-test_%.bbappend} | 0
 ...psa-ps-api-test_git.bbappend => ts-psa-ps-api-test_%.bbappend} | 0
 5 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-arm-bsp/recipes-security/trusted-services/{libts_git.bbappend => libts_%.bbappend} (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/{ts-psa-crypto-api-test_git.bbappend => ts-psa-crypto-api-test_%.bbappend} (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/{ts-psa-iat-api-test_git.bbappend => ts-psa-iat-api-test_%.bbappend} (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/{ts-psa-its-api-test_git.bbappend => ts-psa-its-api-test_%.bbappend} (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/{ts-psa-ps-api-test_git.bbappend => ts-psa-ps-api-test_%.bbappend} (100%)

diff --git a/meta-arm-bsp/recipes-security/trusted-services/libts_git.bbappend b/meta-arm-bsp/recipes-security/trusted-services/libts_%.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/libts_git.bbappend
rename to meta-arm-bsp/recipes-security/trusted-services/libts_%.bbappend
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-crypto-api-test_git.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-crypto-api-test_%.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/ts-psa-crypto-api-test_git.bbappend
rename to meta-arm-bsp/recipes-security/trusted-services/ts-psa-crypto-api-test_%.bbappend
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-iat-api-test_git.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-iat-api-test_%.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/ts-psa-iat-api-test_git.bbappend
rename to meta-arm-bsp/recipes-security/trusted-services/ts-psa-iat-api-test_%.bbappend
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-its-api-test_git.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-its-api-test_%.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/ts-psa-its-api-test_git.bbappend
rename to meta-arm-bsp/recipes-security/trusted-services/ts-psa-its-api-test_%.bbappend
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-ps-api-test_git.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-ps-api-test_%.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/ts-psa-ps-api-test_git.bbappend
rename to meta-arm-bsp/recipes-security/trusted-services/ts-psa-ps-api-test_%.bbappend
-- 
2.17.1


