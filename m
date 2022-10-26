Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 391E0FA3743
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 08:44:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.5246.1666773874190496396
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 01:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECB0E23A;
	Wed, 26 Oct 2022 01:44:39 -0700 (PDT)
Received: from e125903.cambridge.arm.com (e125903.cambridge.arm.com [10.1.195.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 095343F792;
	Wed, 26 Oct 2022 01:44:32 -0700 (PDT)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 2/2] arm-bsp:optee: enable optee test for N1SDP target
Date: Wed, 26 Oct 2022 09:44:22 +0100
Message-Id: <20221026084422.25644-3-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221026084422.25644-1-vishnu.banavath@arm.com>
References: <20221026084422.25644-1-vishnu.banavath@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 26 Oct 2022 08:44:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4037

From: Vishnu Banavath <vishnu.banavath@arm.com>

These changes are to build and install optee test for
N1SDP

Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 meta-arm-bsp/recipes-security/optee/optee-os-generic-n1sdp.inc | 2 ++
 meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc         | 3 +--
 .../recipes-security/optee/optee-os-tadevkit_3.18.0.bbappend   | 1 +
 meta-arm-bsp/recipes-security/optee/optee-test_3.18.0.bbappend | 1 +
 4 files changed, 5 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-generic-n1sdp.inc

diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-generic-n1sdp.inc b/meta-arm-bsp/recipes-security/optee/optee-os-generic-n1sdp.inc
new file mode 100644
index 00000000..c090834c
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-generic-n1sdp.inc
@@ -0,0 +1,2 @@
+COMPATIBLE_MACHINE:n1sdp = "n1sdp"
+OPTEEMACHINE:n1sdp = "n1sdp"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc b/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc
index 5e6e1507..2719e4c0 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc
@@ -1,7 +1,6 @@
 # N1 SDP specific configuration for optee-os
 
-COMPATIBLE_MACHINE:n1sdp = "n1sdp"
-OPTEEMACHINE:n1sdp = "n1sdp"
+require optee-os-generic-n1sdp.inc
 
 TS_INSTALL_PREFIX_PATH = "${RECIPE_SYSROOT}/firmware/sp/opteesp"
 
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bbappend
index 6a22d47e..9a210832 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bbappend
@@ -2,5 +2,6 @@
 
 MACHINE_OPTEE_OS_TADEVKIT_REQUIRE ?= ""
 MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:tc = "optee-os-generic-tc.inc"
+MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:n1sdp = "optee-os-n1sdp.inc"
 
 require ${MACHINE_OPTEE_OS_TADEVKIT_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_3.18.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-test_3.18.0.bbappend
index 490b3500..9318a07e 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-test_3.18.0.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-test_3.18.0.bbappend
@@ -2,5 +2,6 @@
 
 MACHINE_OPTEE_TEST_REQUIRE ?= ""
 MACHINE_OPTEE_TEST_REQUIRE:tc = "optee-test-tc.inc"
+MACHINE_OPTEE_TEST_REQUIRE:n1sdp = "optee-os-generic-n1sdp.inc"
 
 require ${MACHINE_OPTEE_TEST_REQUIRE}
-- 
2.17.1


