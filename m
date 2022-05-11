Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D80C433EF
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 13:52:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11644.1652277164484906577
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 May 2022 06:52:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C791ED1;
	Wed, 11 May 2022 06:52:44 -0700 (PDT)
Received: from e125903.cambridge.arm.com (e125903.cambridge.arm.com
 [10.1.195.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C2E83F66F;
	Wed, 11 May 2022 06:52:43 -0700 (PDT)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 0/1] arm-bsp/tf-a-tests: Add recipe to build and install TFTF
Date: Wed, 11 May 2022 14:52:30 +0100
Message-Id: <20220511135231.14477-1-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 11 May 2022 13:52:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3382

From: Vishnu Banavath <vishnu.banavath@arm.com>

TFTF is TF-A tests that runs at NS-EL2. This is primarily developed to
test the TF-A interfaces exposed to NS code.

Vishnu Banavath (1):
  arm-bsp/tf-a-tests: Add recipe to build and install TFTF

 .gitlab-ci.yml                                |  2 +-
 ci/tftf.yml                                   |  7 +++
 kas/tftf.yml                                  |  7 +++
 .../conf/machine/include/corstone1000.inc     |  1 -
 .../tf-a-tests_2.6.bbappend                   |  3 ++
 .../trusted-firmware-a-corstone1000.inc       |  2 +-
 .../trusted-firmware-a/tf-a-tests_2.6.bb      | 53 +++++++++++++++++++
 .../trusted-firmware-a/trusted-firmware-a.inc |  4 ++
 8 files changed, 76 insertions(+), 3 deletions(-)
 create mode 100644 ci/tftf.yml
 create mode 100644 kas/tftf.yml
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bbappend
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bb

-- 
2.17.1


