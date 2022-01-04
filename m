Return-Path: <gowtham.sureshkumar@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 849D5C433EF
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 17:23:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10019.1641317035811695951
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jan 2022 09:23:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gowtham.sureshkumar@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6022B13A1;
	Tue,  4 Jan 2022 09:23:55 -0800 (PST)
Received: from e126345.arm.com (unknown [10.57.35.172])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A58F3F774;
	Tue,  4 Jan 2022 09:23:53 -0800 (PST)
From: gowtham.sureshkumar@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Subject: [PATCH honister 0/1] arm-bsp/secure-partitions: add check for null
 attribute field
Date: Tue,  4 Jan 2022 17:23:44 +0000
Message-Id: <20220104172345.22414-1-gowtham.sureshkumar@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Jan 2022 17:23:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2788

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

UEFI spec says that if 0 is passed in the attributes filed in
setVariable() API, it means that it's a delete variable call.
Currently smm gateway doesn't handle this case. This change
is to add above mentioned check.

Vishnu Banavath (1):
  arm-bsp/secure-partitions: add check for null attribute field

 ...teway-add-checks-for-null-attributes.patch | 79 +++++++++++++++++++
 .../trusted-services/ts-corstone1000.inc      |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0032-smm_gateway-add-checks-for-null-attributes.patch

-- 
2.17.1


