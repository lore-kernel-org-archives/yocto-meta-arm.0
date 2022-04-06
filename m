Return-Path: <satish.kumar01@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C05C352A1
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6072.1649233965895122181
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Apr 2022 01:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: satish.kumar01@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9E8C23A;
	Wed,  6 Apr 2022 01:32:44 -0700 (PDT)
Received: from e124072.arm.com (unknown [10.57.43.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6E8C3F718;
	Wed,  6 Apr 2022 01:32:43 -0700 (PDT)
From: satish.kumar01@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Satish Kumar <satish.kumar01@arm.com>
Subject: [PATCH honister 0/1] kas/corstone1000.yml: refspec update for
 run-scripts
Date: Wed,  6 Apr 2022 09:30:30 +0100
Message-Id: <20220406083031.8746-1-satish.kumar01@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 Apr 2022 16:33:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3240

From: Satish Kumar <satish.kumar01@arm.com>

Patch updates refspec for run-scripts inside corstone1000 fvp yaml file.

Satish Kumar (1):
  kas/corstone1000.yml: refspec update for run-scripts

 kas/corstone1000-fvp.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.17.1


