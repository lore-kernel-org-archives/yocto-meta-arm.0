Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07EEEC433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 13:36:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.12554.1642513000364425467
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 05:36:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EC121FB;
	Tue, 18 Jan 2022 05:36:39 -0800 (PST)
Received: from e125903.cambridge.arm.com (e125903.cambridge.arm.com
 [10.1.195.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E39FA3F73D;
	Tue, 18 Jan 2022 05:36:38 -0800 (PST)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 0/1] arm-bsp/psa-arch-tests: change master to main for
 psa-arch-tests repo
Date: Tue, 18 Jan 2022 13:36:18 +0000
Message-Id: <20220118133619.4101-1-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jan 2022 13:36:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2856

From: Vishnu Banavath <vishnu.banavath@arm.com>

master branch is renamed to main on psa-arch-tests github

Vishnu Banavath (1):
  arm-bsp/psa-arch-tests: change master to main for psa-arch-tests repo

 .../recipes-security/trusted-services/psa-arch-tests_git.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.17.1


