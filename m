Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09E2C47DB7
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 09:03:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7287.1705568573784484252
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jan 2024 01:02:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E4151042;
	Thu, 18 Jan 2024 01:03:39 -0800 (PST)
Received: from e126835.arm.com (unknown [10.57.8.154])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4657D3F5A1;
	Thu, 18 Jan 2024 01:02:52 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH nanbield 0/1] corstone1000:arm-bsp/tftf: Fix tftf tests on mps3
Date: Thu, 18 Jan 2024 09:02:37 +0000
Message-Id: <20240118090238.19455-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Jan 2024 09:03:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5336

From: Emekcan Aras <Emekcan.Aras@arm.com>

The tftf tests were getting crashed on the MPS3 and two issues were found
during investigation. This change set provide fix for those issues:
1. The tftf tests were getting crashed on the MPS3 when compiled with
LOG_LEVEL=3D50. So, reducing the log level and aligning it with the TF-A
allows us to get rid of the crash.

2. Once the above crash got resolved, it has been found that tftf tests
were getting asserted while reading the value of the register
GICD_ITARGETSR. The reason for the crash is that the value of this regist=
er
is zero. As per the GIC documentation, this register is RAZ/WI for unipro=
cessor
implementation and corstone1000 is uniprocessor implementation for FPGA.
So, this change compiles the tftf tests in release mode which allows us
to compile out the assert definitions.

Harsimran Singh Tungal (1):
  corstone1000:arm-bsp/tftf: Fix tftf tests on mps3

 .../recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend     | 3 +++
 .../recipes-bsp/trusted-firmware-a/tf-a-tests_2.8.0.bb       | 5 ++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

--=20
2.25.1


