Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04943FA3741
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 13:24:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.19078.1666617858552532751
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Oct 2022 06:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61910113E;
	Mon, 24 Oct 2022 06:24:24 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5BB5B3F7B4;
	Mon, 24 Oct 2022 06:24:17 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 1/1] arm-bsp/corstone1000: apply ts patch to psa crypto api test
Date: Mon, 24 Oct 2022 14:24:12 +0100
Message-Id: <20221024132412.30881-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221024132412.30881-1-emekcan.aras@arm.com>
References: <20221024132412.30881-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 13:24:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4015

From: Rui Miguel Silva <rui.silva@linaro.org>

Apply shared patch to trusted services that is used to compile
psa crypto api tests to include change in packed-c request
message in the eaed update structure to be in sync with the
serialize/deserialize in TS side.

As at it, move the other corstone1000 specific patch file to
meta-arm-bsp where it should be.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 .../0018-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch   | 4 +++-
 .../0001-corstone1000-port-crypto-config.patch             | 0
 .../trusted-services/ts-psa-crypto-api-test_git.bbappend   | 7 +++++++
 .../trusted-services/ts-psa-api-test-common_git.inc        | 1 -
 4 files changed, 10 insertions(+), 2 deletions(-)
 rename meta-arm/recipes-security/trusted-services/files/0002-corstone1000-port-crypto-config.patch => meta-arm-bsp/recipes-security/trusted-services/corstone1000/ts-psa-crypto-api-test/0001-corstone1000-port-crypto-config.patch (100%)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-psa-crypto-api-test_git.bbappend

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0018-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0018-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch
index 0fdb254f..9ab1157e 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0018-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0018-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch
@@ -1,9 +1,11 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
 From a1da63a8c4d55d52321608a72129af49e0a498b2 Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Mon, 14 Feb 2022 08:22:25 +0000
 Subject: [PATCH 18/19] Fixes in AEAD for psa-arch test 54 and 58.
 
-Upstream-Status: Pending
 Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
diff --git a/meta-arm/recipes-security/trusted-services/files/0002-corstone1000-port-crypto-config.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/ts-psa-crypto-api-test/0001-corstone1000-port-crypto-config.patch
similarity index 100%
rename from meta-arm/recipes-security/trusted-services/files/0002-corstone1000-port-crypto-config.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/ts-psa-crypto-api-test/0001-corstone1000-port-crypto-config.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-crypto-api-test_git.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-crypto-api-test_git.bbappend
new file mode 100644
index 00000000..6595c92a
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-crypto-api-test_git.bbappend
@@ -0,0 +1,7 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/corstone1000:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/corstone1000/${PN}:"
+
+SRC_URI:append:corstone1000 = " \
+            file://0001-corstone1000-port-crypto-config.patch;patchdir=../psatest \
+            file://0018-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch;patchdir=../trusted-services \
+           "
diff --git a/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_git.inc b/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_git.inc
index 3bb7bea3..dfd47163 100644
--- a/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_git.inc
+++ b/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_git.inc
@@ -9,7 +9,6 @@ RDEPENDS:${PN} += "libts"
 
 SRC_URI += "git://github.com/ARM-software/psa-arch-tests.git;name=psatest;protocol=https;branch=main;destsuffix=git/psatest \
             file://0001-Pass-Yocto-build-settings-to-psa-arch-tests-native.patch;patchdir=../psatest \
-            file://0002-corstone1000-port-crypto-config.patch;patchdir=../psatest \
            "
 
 SRCREV_psatest = "451aa087a40d02c7d04778235014c5619d126471"
-- 
2.17.1


