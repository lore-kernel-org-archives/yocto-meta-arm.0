Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376FBFA373D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 08:44:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5335.1666773872760728344
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 01:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3528623A;
	Wed, 26 Oct 2022 01:44:38 -0700 (PDT)
Received: from e125903.cambridge.arm.com (e125903.cambridge.arm.com [10.1.195.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44CAF3F792;
	Wed, 26 Oct 2022 01:44:31 -0700 (PDT)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 0/2] arm-bsp/optee: register DRAM1 for N1SDP target and
Date: Wed, 26 Oct 2022 09:44:20 +0100
Message-Id: <20221026084422.25644-1-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 26 Oct 2022 08:44:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4035

From: Vishnu Banavath <vishnu.banavath@arm.com>

* N1SDP has 2 DRAM's. This change is to register 2nd DRAM which starts at
0x8080000000. Linux uses 1KB of this memory to share data with optee-os.
* These changes are to build and install optee test for N1SDP

Vishnu Banavath (2):
  arm-bsp/optee: register DRAM1 for N1SDP target
  arm-bsp:optee: enable optee test for N1SDP target

 ...lat-n1sdp-register-DRAM1-to-optee-os.patch | 52 +++++++++++++++++++
 .../optee/optee-os-generic-n1sdp.inc          |  2 +
 .../recipes-security/optee/optee-os-n1sdp.inc |  4 +-
 .../optee/optee-os-tadevkit_3.18.0.bbappend   |  1 +
 .../optee/optee-test_3.18.0.bbappend          |  1 +
 5 files changed, 58 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0005-plat-n1sdp-register-DRAM1-to-optee-os.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-generic-n1sdp.inc

-- 
2.17.1


