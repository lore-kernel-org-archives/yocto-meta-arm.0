Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D72C4332F
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 10:15:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17175.1664792116199540208
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 03:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 915CC139F;
	Mon,  3 Oct 2022 03:15:22 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com
 [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 14A5D3F792;
	Mon,  3 Oct 2022 03:15:14 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan <emekcan.aras@arm.com>
Subject: [PATCH 2/2] arm-bsp/external-system: Changing the RTX repo
Date: Mon,  3 Oct 2022 11:15:08 +0100
Message-Id: <20221003101508.42204-3-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221003101508.42204-1-emekcan.aras@arm.com>
References: <20221003101508.42204-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Oct 2022 10:15:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3889

From: Emekcan <emekcan.aras@arm.com>

Migrating RTX repo to a new namespace under
arm reference solution. The new repo also adds
corstone1000 as a product so this commits
also changes the PRODUCT variable.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 .../recipes-bsp/external-system/external-system_0.1.0.bb  | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
index ce5e7a76..5bb8c37c 100644
--- a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
+++ b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
@@ -8,16 +8,14 @@ LICENSE = "BSD-3-Clause & Apache-2.0"
 LIC_FILES_CHKSUM = "file://license.md;md5=e44b2531cd6ffe9dece394dbe988d9a0 \
                     file://cmsis/LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
 
-SRC_URI = "gitsm://git.linaro.org/landing-teams/working/arm/external-system.git;protocol=https;branch=master"
-SRCREV = "2057819cd3652b457907ad70f6b951cf10c7a481"
+SRC_URI = "gitsm://git.gitlab.arm.com/arm-reference-solutions/corstone1000/external_system/rtx.git;protocol=https;branch=master"
+SRCREV = "8c9dca74b104ff6c9722fb0738ba93dd3719c080"
 PV .= "+git${SRCPV}"
 
 COMPATIBLE_MACHINE = "(corstone1000)"
 
 # PRODUCT is passed to the Makefile to specify the platform to be used.
-# platform code is same for corstone700 and corstone1000, hence use the
-# same PRODUCT for both.
-PRODUCT = "corstone-700"
+PRODUCT = "corstone-1000"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
-- 
2.17.1


