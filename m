Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA85C433EF
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 13:31:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.12495.1642512673230795011
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 05:31:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32334ED1;
	Tue, 18 Jan 2022 05:31:12 -0800 (PST)
Received: from e125903.cambridge.arm.com (e125903.cambridge.arm.com
 [10.1.195.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81BEF3F73D;
	Tue, 18 Jan 2022 05:31:11 -0800 (PST)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH honister 1/1] arm-bsp/psa-arch-tests: change master to main
 for psa-arch-tests repo
Date: Tue, 18 Jan 2022 13:30:55 +0000
Message-Id: <20220118133055.52754-2-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220118133055.52754-1-vishnu.banavath@arm.com>
References: <20220118133055.52754-1-vishnu.banavath@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jan 2022 13:31:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2855

From: Vishnu Banavath <vishnu.banavath@arm.com>

master branch is renamed to main on psa-arch-tests github.

Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 .../recipes-security/trusted-services/psa-arch-tests_git.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/trusted-services/psa-arch-tests_git.bb b/meta-arm/recipes-security/trusted-services/psa-arch-tests_git.bb
index ff89b06..ff38f7d 100644
--- a/meta-arm/recipes-security/trusted-services/psa-arch-tests_git.bb
+++ b/meta-arm/recipes-security/trusted-services/psa-arch-tests_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "PSA arch test application"
 require secure-partitions.inc
 
 LIC_FILES_CHKSUM += "file://../psa-arch-tests/LICENSE.md;md5=2a944942e1496af1886903d274dedb13"
-SRC_URI_PSA = "git://github.com/ARM-software/psa-arch-tests.git;protocol=https;branch=master;name=psa;destsuffix=git/psa-arch-tests"
+SRC_URI_PSA = "git://github.com/ARM-software/psa-arch-tests.git;protocol=https;branch=main;name=psa;destsuffix=git/psa-arch-tests"
 SRC_URI:append = " ${SRC_URI_PSA}"
 
 SRCREV_FORMAT="ts_psa"
-- 
2.17.1


