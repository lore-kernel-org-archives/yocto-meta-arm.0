Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D9EC00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 16:23:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.659.1659111778269125810
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Jul 2022 09:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9AE112FC;
	Fri, 29 Jul 2022 09:22:57 -0700 (PDT)
Received: from e125903.cambridge.arm.com (e125903.cambridge.arm.com
 [10.1.195.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 693843F73B;
	Fri, 29 Jul 2022 09:22:56 -0700 (PDT)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 0/1] arm/optee: support optee-os v3.18.0
Date: Fri, 29 Jul 2022 17:22:29 +0100
Message-Id: <20220729162230.45859-1-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Jul 2022 16:23:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3612

From: Vishnu Banavath <vishnu.banavath@arm.com>

This change is to add yocot recipe to support optee-os
3.18.0 version.
Also, move the SRC_URI:append and DEPENDS to optee-os.inc
as these are common accross different optee versions.

Vishnu Banavath (1):
  arm/optee: support optee-os v3.18.0

 meta-arm/recipes-security/optee/optee-os.inc       | 5 +++++
 meta-arm/recipes-security/optee/optee-os_3.14.0.bb | 4 ----
 meta-arm/recipes-security/optee/optee-os_3.17.0.bb | 4 ----
 meta-arm/recipes-security/optee/optee-os_3.18.0.bb | 5 +++++
 4 files changed, 10 insertions(+), 8 deletions(-)
 create mode 100644 meta-arm/recipes-security/optee/optee-os_3.18.0.bb

-- 
2.17.1


