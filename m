Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C424C4332F
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 16:41:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.217.1652373700813901710
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 May 2022 09:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D868106F;
	Thu, 12 May 2022 09:41:39 -0700 (PDT)
Received: from e125903.cambridge.arm.com (e125903.cambridge.arm.com
 [10.1.195.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E23B03F73D;
	Thu, 12 May 2022 09:41:38 -0700 (PDT)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH kirkstone 0/1] arm-bsp/tf-a-tests: Add recipe to build
Date: Thu, 12 May 2022 17:41:28 +0100
Message-Id: <20220512164129.28438-1-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 May 2022 16:41:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3391

From: Vishnu Banavath <vishnu.banavath@arm.com>

TFTF is TF-A tests that runs at NS-EL2. This is primarily developed to
test the TF-A interfaces exposed to NS code.

Vishnu Banavath (1):
  arm-bsp/tf-a-tests: Add recipe to build and install TFTF

 .gitlab-ci.yml                                |  2 +-
 ci/tftf.yml                                   |  7 +++
 kas/corstone1000-base.yml                     |  2 +-
 kas/tftf.yml                                  |  7 +++
 .../conf/machine/include/corstone1000.inc     |  1 -
 .../tf-a-tests_2.6.bbappend                   |  3 ++
 .../trusted-firmware-a-corstone1000.inc       |  2 +-
 .../trusted-firmware-a/tf-a-tests_2.6.bb      | 53 +++++++++++++++++++
 .../trusted-firmware-a/trusted-firmware-a.inc |  4 ++
 9 files changed, 77 insertions(+), 4 deletions(-)
 create mode 100644 ci/tftf.yml
 create mode 100644 kas/tftf.yml
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bbappend
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bb

-- 
2.17.1


