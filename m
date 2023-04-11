Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EEB7C77B6F
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 14:48:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.15910.1681224511058088597
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 07:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04654D75;
	Tue, 11 Apr 2023 07:49:15 -0700 (PDT)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5AD93F73F;
	Tue, 11 Apr 2023 07:48:29 -0700 (PDT)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Xueliang Zhong <xueliang.zhong@arm.com>
Subject: [PATCH 0/1] arm-bsp/n1sdp: use edk2-firmware 202211 version
Date: Tue, 11 Apr 2023 14:48:23 +0000
Message-Id: <20230411144824.19142-1-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Apr 2023 14:48:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4572

From: Xueliang Zhong <xueliang.zhong@arm.com>

The upstream official N1SDP software currently supports edk2-firmware
202211 version. This patch is to align N1SDP Yocto build with upstream
N1SDP software.

Xueliang Zhong (1):
  arm-bsp/n1sdp: use edk2-firmware 202211 version

 meta-arm-bsp/conf/machine/n1sdp.conf          |    1 +
 .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc  |   13 +-
 ...dp-Add-support-to-parse-NT_FW_CONFIG.patch |   42 +-
 ...orm-ARM-N1Sdp-Fix-RemoteDdrSize-cast.patch |   14 +-
 ...dp-Modify-the-IRQ-ID-of-Debug-UART-a.patch |   16 +-
 ...erseN1Soc-Enable-SCP-QSPI-flash-regi.patch |   57 +
 ...RM-N1Sdp-NOR-flash-library-for-N1Sdp.patch |  119 +
 ...N1Sdp-NOR-flash-Dxe-Driver-for-N1Sdp.patch | 2538 +++++++++++++++++
 ...M-N1Sdp-Persistent-storage-for-N1Sdp.patch |   88 +
 ...dp-Enable-FaultTolerantWrite-Dxe-dri.patch |   50 +
 ...dp-manually-poll-QSPI-status-bit-aft.patch |  197 ++
 .../recipes-bsp/uefi/edk2-firmware_202211.bb  |    4 +
 12 files changed, 3091 insertions(+), 48 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0004-Silicon-ARM-NeoverseN1Soc-Enable-SCP-QSPI-flash-regi.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0005-Platform-ARM-N1Sdp-NOR-flash-library-for-N1Sdp.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0006-Platform-ARM-N1Sdp-NOR-flash-Dxe-Driver-for-N1Sdp.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0007-Platform-ARM-N1Sdp-Persistent-storage-for-N1Sdp.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0008-Platform-ARM-N1Sdp-Enable-FaultTolerantWrite-Dxe-dri.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0009-Platform-ARM-N1Sdp-manually-poll-QSPI-status-bit-aft.patch
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202211.bb

-- 
2.17.1


