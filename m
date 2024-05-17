Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B71AC04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 10:24:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.37347.1715941453824667625
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 17 May 2024 03:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 329D51424;
	Fri, 17 May 2024 03:24:37 -0700 (PDT)
Received: from e132995.arm.com (unknown [10.57.69.180])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8910F3F762;
	Fri, 17 May 2024 03:24:12 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 0/1] arm-bsp/documentation: corstone1000: Update user guide for secureboot test
Date: Fri, 17 May 2024 11:24:01 +0100
Message-Id: <20240517102402.3065167-1-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 17 May 2024 10:24:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5730

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


