Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3A1C433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 16:43:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.203.1666370581119740712
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Oct 2022 09:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED7271063;
	Fri, 21 Oct 2022 09:43:06 -0700 (PDT)
Received: from e125903.cambridge.arm.com (e125903.cambridge.arm.com [10.1.195.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F8803F67D;
	Fri, 21 Oct 2022 09:42:59 -0700 (PDT)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 0/1] meta-arm-bsp/doc: add readthedocs for corstone1000
Date: Fri, 21 Oct 2022 17:42:49 +0100
Message-Id: <20221021164250.33661-1-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 16:43:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4003

From: Vishnu Banavath <vishnu.banavath@arm.com>

These changes are to add support for readthedocs for
corstone1000 platform. readthedocs server traces
any changes to to corstone1000 documents and will trigger
a build which will generate html file which can will be
rendered by corstone1000.docs.arm.com server

Vishnu Banavath (1):
  meta-arm-bsp/doc: add readthedocs for corstone1000

 .../documentation/corstone1000/change-log.rst |  98 +++
 .../documentation/corstone1000/conf.py        |  52 ++
 .../images/CorstoneSubsystems.png             | Bin 0 -> 111103 bytes
 .../corstone1000/images/ExternalFlash.png     | Bin 0 -> 35431 bytes
 .../corstone1000/images/SecureBootChain.png   | Bin 0 -> 150409 bytes
 .../images/SecureFirmwareUpdate.png           | Bin 0 -> 61393 bytes
 .../corstone1000/images/SecureServices.png    | Bin 0 -> 73965 bytes
 .../corstone1000/images/UEFISupport.png       | Bin 0 -> 98811 bytes
 .../documentation/corstone1000/index.rst      |  16 +
 .../corstone1000/release-notes.rst            | 137 ++++
 .../corstone1000/software-architecture.rst    | 239 ++++++
 .../documentation/corstone1000/user-guide.rst | 685 ++++++++++++++++++
 meta-arm-bsp/documentation/requirements.txt   |  12 +
 13 files changed, 1239 insertions(+)
 create mode 100644 meta-arm-bsp/documentation/corstone1000/change-log.rst
 create mode 100644 meta-arm-bsp/documentation/corstone1000/conf.py
 create mode 100644 meta-arm-bsp/documentation/corstone1000/images/CorstoneSubsystems.png
 create mode 100644 meta-arm-bsp/documentation/corstone1000/images/ExternalFlash.png
 create mode 100644 meta-arm-bsp/documentation/corstone1000/images/SecureBootChain.png
 create mode 100644 meta-arm-bsp/documentation/corstone1000/images/SecureFirmwareUpdate.png
 create mode 100644 meta-arm-bsp/documentation/corstone1000/images/SecureServices.png
 create mode 100644 meta-arm-bsp/documentation/corstone1000/images/UEFISupport.png
 create mode 100644 meta-arm-bsp/documentation/corstone1000/index.rst
 create mode 100644 meta-arm-bsp/documentation/corstone1000/release-notes.rst
 create mode 100644 meta-arm-bsp/documentation/corstone1000/software-architecture.rst
 create mode 100644 meta-arm-bsp/documentation/corstone1000/user-guide.rst
 create mode 100644 meta-arm-bsp/documentation/requirements.txt

-- 
2.17.1


