Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E61DCD3427
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 09:56:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19630.1725357371417313037
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 Sep 2024 02:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0AC6FEC;
	Tue,  3 Sep 2024 02:56:36 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.38.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8C8E3F73F;
	Tue,  3 Sep 2024 02:56:09 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 0/1] arm-bsp,documentation: corstone1000: update user documentation 
Date: Tue,  3 Sep 2024 10:56:01 +0100
Message-Id: <20240903095602.167973-1-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 03 Sep 2024 09:56:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6050

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

Add new usage details for running the secure boot testing
script located in the systemready-patch repository.
This script is used to create UEFI authenticated variables and sign the
Linux kernel image for the MPS3-FPGA and FVP secure boot tests.
Reflect the latest modifications to the script usage in the Corstone-1000=
 user guide.

Harsimran Singh Tungal (1):
  arm-bsp,documentation: corstone1000: update user documentation

 .../documentation/corstone1000/user-guide.rst | 28 +++++++++++++------
 1 file changed, 20 insertions(+), 8 deletions(-)

--=20
2.25.1


