Return-Path: <Michael.safwat@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0081510D149C
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:54:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48190.1774868085760169963
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Mar 2026 03:54:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=nSmOzsuq;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: michael.safwat@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6C581C2B;
	Mon, 30 Mar 2026 03:54:38 -0700 (PDT)
Received: from e142473.cambridge.arm.com (e142473.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6389C3F915;
	Mon, 30 Mar 2026 03:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774868084; bh=d/lXKaJWpD616AJuGNQx6yn/6diFOGnBBstJBD4eaDY=;
	h=From:To:Cc:Subject:Date:From;
	b=nSmOzsuqJF+5KV4s2wEDbYj0s8g5pE3DUpv6MfMBkU1QhC+MzGvlzd4E2r+S/mWOd
	 5IQiyCHGpcbKGJwAVx43b8UTe2/CxRn6YGdNgZfdmTtl5XF7S1Arm4qORi/5AciNuS
	 LqYmtOgXHvcYj+z511Y+JnpLIbWSbwmOo4FikpRs=
From: Michael Safwat <michael.safwat@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Michael Safwat <michael.safwat@arm.com>
Subject: [PATCH 0/7] corstone1000: align A320 and Ethos-U85 flow with in-tree ethosu
Date: Mon, 30 Mar 2026 11:43:10 +0100
Message-ID: <20260330105428.2580463-1-michael.safwat@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Mar 2026 10:54:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6982

This series updates the Corstone-1000 Cortex-A320 flow to match the curre=
nt
upstream direction and the in-tree Ethos-U integration model.

It reworks the U-Boot device tree patch layout to separate common and
Cortex-A320-specific changes, adds linux-yocto 6.19 support, aligns the
Ethos-U85 device tree and kernel configuration with the in-tree ethosu
driver, removes the remaining meta-ethos and meta-sca dependency from the
A320 flow, and refreshes the documentation.

The main changes are:
- rework the Corstone-1000 U-Boot CONFIG_OF_UPSTREAM patch layout
- add and prefer linux-yocto 6.19 for Corstone-1000
- update Ethos-U85 DT and kernel config for the in-tree ethosu driver
- drop meta-ethos and meta-sca from the A320 flow
- refresh the user guide for SMP, test_teflon, and the patch-based workar=
ound

Frazer Carsley (2):
  arm-bsp/u-boot:cs1k: Rework CONFIG_OF_UPSTREAM patch
  arm-bsp/u-boot:cs1k: Split Cortex-a320 device tree

Michael Safwat (5):
  arm-bsp/corstone1000: Add linux-yocto 6.19 kernel recipe
  arm-bsp/u-boot: cs1k: Align Ethos-U85 DT with in-tree driver
  arm-bsp/corstone1000-a320: Drop meta-ethos dependency
  arm-bsp/docs: corstone1000: document Cortex-A320 SMP support
  arm-bsp/docs: corstone1000: switch Ethos-U85 test flow to test_teflon

 kas/corstone1000-a320.yml                     |   8 -
 meta-arm-bsp/conf/layer.conf                  |   1 -
 .../machine/include/corstone1000-a320.inc     |   2 -
 .../conf/machine/include/corstone1000.inc     |   2 +-
 .../documentation/corstone1000/change-log.rst |   4 -
 .../documentation/corstone1000/user-guide.rst |  82 ++-
 .../u-boot/u-boot-corstone1000.inc            |  12 +-
 ...able-OF_UPSTREAM-device-tree-support.patch | 101 ++--
 ...-use-32-bit-cells-for-reserved-memor.patch |   8 +-
 ...e1000-Add-Cortex-A320-support-on-FVP.patch | 227 -------
 ...-a320-Add-Corstone1000-board-variant.patch | 563 ++++++++++++++++++
 .../u-boot/corstone1000/corstone1000-a320.cfg |   2 -
 .../linux/files/corstone1000/ethosu.cfg       |   4 +
 .../linux/linux-arm-platforms.inc             |   1 +
 .../recipes-kernel/linux/linux-yocto_6.19.bb  |  37 ++
 15 files changed, 742 insertions(+), 312 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
039-corstone1000-Add-Cortex-A320-support-on-FVP.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
039-corstone1000-a320-Add-Corstone1000-board-variant.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/c=
orstone1000-a320.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
ethosu.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.19.bb


