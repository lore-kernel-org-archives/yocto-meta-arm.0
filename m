Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A9FC43334
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 12:54:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.40185.1658235240725272804
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 Jul 2022 05:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B118139F;
	Tue, 19 Jul 2022 05:54:00 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com
 [10.1.194.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FAB53F766;
	Tue, 19 Jul 2022 05:53:59 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 0/1] arm-bsp/edk2-firmware: Add NT_FW_CONFIG to N1SDP (fix
 aborts)
Date: Tue, 19 Jul 2022 13:53:24 +0100
Message-Id: <20220719125325.923598-1-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 19 Jul 2022 12:54:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3568

From: Adam Johnston <adam.johnston@arm.com>

This patch, from N1SDP 2022-R1, adds support to parse NT_FW_CONFIG to EDK=
2
platform code for the N1SDP. This is required to fix aborts seen when tes=
ting
virtual memory after enabling trusted boot.

NT_FW_CONFIG DTB contains platform information passed by TF-A boot stage.
This information is used for virtual memory map generation during PEI pha=
se
and passed on to DXE phase as a HOB, where it is used in
ConfigurationManagerDxe.

Adam Johnston (1):
  arm-bsp/edk2-firmware: Add NT_FW_CONFIG to N1SDP to fix aborts when
    accessing virtual memory

 .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc  |   6 +
 .../edk2-platforms/add-nt-fw-config.patch     | 474 ++++++++++++++++++
 2 files changed, 480 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/ad=
d-nt-fw-config.patch

--=20
2.17.1


