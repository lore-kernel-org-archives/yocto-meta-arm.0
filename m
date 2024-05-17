Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E693C04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 10:26:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.37383.1715941589455729912
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 17 May 2024 03:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15C301424;
	Fri, 17 May 2024 03:26:53 -0700 (PDT)
Received: from e132995.arm.com (unknown [10.57.69.180])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8881F3F762;
	Fri, 17 May 2024 03:26:28 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH scarthgap 0/1] arm-bsp/documentation: corstone1000: Update user guide for secureboot test
Date: Fri, 17 May 2024 11:26:21 +0100
Message-Id: <20240517102622.3067719-1-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 17 May 2024 10:26:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5732

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

This changeset updates the user guide to test the secureboot for both the
Corstone-1000 FVP and FPGA.

Harsimran Singh Tungal (1):
  arm-bsp/documentation: corstone1000: Update user guide for secureboot
    test

 .../documentation/corstone1000/user-guide.rst | 168 ++++++++++++++++++
 1 file changed, 168 insertions(+)

--=20
2.25.1


