Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6070C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 18:18:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14974.1639419495366164222
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 10:18:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 053626D;
	Mon, 13 Dec 2021 10:18:15 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.32.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A40EB3F793;
	Mon, 13 Dec 2021 10:18:13 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH][HONISTER 2/5] arm/psa-arch-tests: introduce the recipe
Date: Mon, 13 Dec 2021 18:17:59 +0000
Message-Id: <20211213181802.13323-3-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211213181802.13323-1-abdellatif.elkhlifi@arm.com>
References: <20211213181802.13323-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Dec 2021 18:18:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2666

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This commit adds a recipe for psa-arch-tests linux
userspace application.

Included tests are; crypto, protected_storage,
internal_trusted_storage and attestation.

Change-Id: I6285aa2a6ae8fdd25f4327f1d301c59a88bce775
Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../trusted-services/psa-arch-tests_git.bb    | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-arm/recipes-security/trusted-services/psa-arch-tests_git.bb

diff --git a/meta-arm/recipes-security/trusted-services/psa-arch-tests_git.bb b/meta-arm/recipes-security/trusted-services/psa-arch-tests_git.bb
new file mode 100644
index 0000000..ff89b06
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/psa-arch-tests_git.bb
@@ -0,0 +1,26 @@
+SUMMARY = "PSA arch test application"
+
+require secure-partitions.inc
+
+LIC_FILES_CHKSUM += "file://../psa-arch-tests/LICENSE.md;md5=2a944942e1496af1886903d274dedb13"
+SRC_URI_PSA = "git://github.com/ARM-software/psa-arch-tests.git;protocol=https;branch=master;name=psa;destsuffix=git/psa-arch-tests"
+SRC_URI:append = " ${SRC_URI_PSA}"
+
+SRCREV_FORMAT="ts_psa"
+SRCREV_psa = "6e1549dde62d12c92fc2df90ebbbe2d2d77cc76a"
+PV = "0.0+git${SRCREV_psa}"
+
+PSA_APPLICATION_NAME = "psa-api-test"
+TS_ENVIRONMENT_LINUX = "arm-linux"
+
+PSA_API_TESTS += "deployments/psa-api-test/protected_storage/${TS_ENVIRONMENT_LINUX}"
+PSA_API_TESTS += "deployments/psa-api-test/internal_trusted_storage/${TS_ENVIRONMENT_LINUX}"
+PSA_API_TESTS += "deployments/psa-api-test/initial_attestation/${TS_ENVIRONMENT_LINUX}"
+PSA_API_TESTS += "deployments/psa-api-test/crypto/${TS_ENVIRONMENT_LINUX}"
+
+EXTRA_OECMAKE += "-DCMAKE_POSITION_INDEPENDENT_CODE=True \
+                 -DCMAKE_SYSTEM_NAME=Linux \
+                 -DCMAKE_SYSTEM_PROCESSOR=arm \
+                "
+
+do_deploy[noexec] = "1"
-- 
2.17.1


