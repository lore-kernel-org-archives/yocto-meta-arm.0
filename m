Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D42C433FE
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 10:15:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.17458.1664792115363216780
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 03:15:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9708113D5;
	Mon,  3 Oct 2022 03:15:21 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com
 [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0EED43F792;
	Mon,  3 Oct 2022 03:15:13 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan <emekcan.aras@arm.com>
Subject: [PATCH 1/2] arm-bsp/test: Changing the test app repository
Date: Mon,  3 Oct 2022 11:15:07 +0100
Message-Id: <20221003101508.42204-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221003101508.42204-1-emekcan.aras@arm.com>
References: <20221003101508.42204-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Oct 2022 10:15:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3888

From: Emekcan <emekcan.aras@arm.com>

Migrating the test repo to a new namespace under
arm reference solution.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 .../corstone1000-external-sys-tests_1.0.bb                      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-test/corstone1000-external-sys-tests/corstone1000-external-sys-tests_1.0.bb b/meta-arm-bsp/recipes-test/corstone1000-external-sys-tests/corstone1000-external-sys-tests_1.0.bb
index 04c0aae2..47434204 100644
--- a/meta-arm-bsp/recipes-test/corstone1000-external-sys-tests/corstone1000-external-sys-tests_1.0.bb
+++ b/meta-arm-bsp/recipes-test/corstone1000-external-sys-tests/corstone1000-external-sys-tests_1.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://git.linaro.org/landing-teams/working/arm/test-apps.git"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://license.md;md5=e44b2531cd6ffe9dece394dbe988d9a0"
 
-SRC_URI = "git://git.linaro.org/landing-teams/working/arm/test-apps.git;protocol=https;branch=master"
+SRC_URI = "git://git.gitlab.arm.com/arm-reference-solutions/corstone1000/applications.git;protocol=https;branch=master"
 SRCREV = "2945cd92f7c6dbe4999ee72cd5cf1e2615eedba7"
 PV .= "+git${SRCPV}"
 
-- 
2.17.1


