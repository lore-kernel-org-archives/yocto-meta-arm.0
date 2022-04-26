Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F9AC433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 10:21:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.4528.1650968500269720564
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 03:21:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 963BDED1;
	Tue, 26 Apr 2022 03:21:39 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com
 [10.1.194.44])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DF2EA3F5A1;
	Tue, 26 Apr 2022 03:21:38 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 1/1] arm-bsp/trusted-services: corstone1000: add sysroot tasks
 dependency
Date: Tue, 26 Apr 2022 11:21:25 +0100
Message-Id: <20220426102125.8855-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220426102125.8855-1-emekcan.aras@arm.com>
References: <20220426102125.8855-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 Apr 2022 10:21:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3299

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

ffa-debugfs-mod provides arm_ffa_user.h needed by psa-arch-tests source-code.

This commit sets the sysroot tasks dependencies.

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../recipes-security/trusted-services/ts-corstone1000.inc       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
index 58bd6dc..e14730e 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -92,6 +92,8 @@ PSA_API_TESTS += "deployments/psa-api-test/internal_trusted_storage/${TS_ENVIRON
 PSA_API_TESTS += "deployments/psa-api-test/initial_attestation/${TS_ENVIRONMENT_LINUX}"
 PSA_API_TESTS += "deployments/psa-api-test/crypto/${TS_ENVIRONMENT_LINUX}"
 
+# ffa-debugfs-mod provides arm_ffa_user.h needed by psa-arch-tests source-code
+DEPENDS += "ffa-debugfs-mod"
 
 do_configure:append() {
     for PSA_API_TEST in ${PSA_API_TESTS}; do
-- 
2.17.1


