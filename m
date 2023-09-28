Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4A94E732DC
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 14:25:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14624.1695911144677209444
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Sep 2023 07:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7A371FB;
	Thu, 28 Sep 2023 07:26:22 -0700 (PDT)
Received: from e130802.cambridge.arm.com (e130802.arm.com [10.1.39.56])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B8DC3F59C;
	Thu, 28 Sep 2023 07:25:43 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 0/2] Corstone-1000: U-Boot DT, TF-A errata
Date: Thu, 28 Sep 2023 15:25:31 +0100
Message-Id: <20230928142533.391672-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 28 Sep 2023 14:25:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5075

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

- Enable 855472 errata in TF-A
- At U-Boot level, drop DT nodes that shouldn't be passed to Linux (neede=
d by SystemReady IR 2.0)

Cheers,
Abdellatif

Abdellatif El Khlifi (2):
  arm-bsp/trusted-firmware-a: corstone1000: enable ERRATA_A35_855472
  arm-bsp/u-boot: corstone1000: purge U-Boot specific DT nodes before
    Linux

 .../trusted-firmware-a-corstone1000.inc       |   1 +
 ...-to-remove-non-compliant-nodes-and-p.patch | 137 ++++++++++++++++++
 ...-Call-the-EVT_FT_FIXUP-event-handler.patch |  56 +++++++
 ...e1000-purge-U-Boot-specific-DT-nodes.patch |  51 +++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   3 +
 5 files changed, 248 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
035-dt-Provide-a-way-to-remove-non-compliant-nodes-and-p.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
036-bootefi-Call-the-EVT_FT_FIXUP-event-handler.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
037-corstone1000-purge-U-Boot-specific-DT-nodes.patch

--=20
2.25.1


