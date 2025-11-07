Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5766CCFA05
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 11:12:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8993.1762513977930505169
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Nov 2025 03:12:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 073F91477;
	Fri,  7 Nov 2025 03:12:49 -0800 (PST)
Received: from LXKV206JHX.arm.com (unknown [10.57.85.116])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A3993F63F;
	Fri,  7 Nov 2025 03:12:56 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH 0/3] Extract FVP options, enable module autoload & fix reserved-memory cells
Date: Fri,  7 Nov 2025 11:12:49 +0000
Message-ID: <20251107111252.25711-1-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 07 Nov 2025 11:12:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6759

This patchset bundles three commits that enhance the Corstone=E2=80=91100=
0 BSP and U-Boot integration:

* Extract External System FVP options:
Allow passing external FVP configuration flags into the Corstone=E2=80=91=
1000 platform layer for more flexible
virtualization setups.
* sysvinit: Make module autoload work at boot
Adjust the sysvinit script in arm=E2=80=91bsp/corstone1000 so that kernel=
 modules configured for autoload are correctly
loaded during early boot.
* u-boot:corstone1000: Use 32-bit cells for reserved-memory node
Update the Corstone=E2=80=911000 U-Boot device tree binding to use 32=E2=80=
=91bit cells in the reserved=E2=80=91memory node, matching
the platform=E2=80=99s requirements.

These changes collectively improve boot=E2=80=91time configuration, modul=
e handling, and device=E2=80=91tree consistency for
Corstone=E2=80=911000 targets.


Harsimran Singh Tungal (1):
  arm-bsp/u-boot:corstone1000: Use 32-bit cells for reserved-memory node

Hugues KAMBA MPIANA (1):
  arm-bsp/corstone1000: sysvinit: Make module autoload work at boot

Michael Safwat (1):
  arm-bsp/corstone1000: Extract External System FVP options

 kas/corstone1000-image-configuration.yml      |  5 +++
 .../conf/machine/corstone1000-fvp.conf        |  8 ++--
 .../machine/include/corstone1000-extsys.inc   |  6 +++
 .../u-boot/u-boot-corstone1000.inc            |  5 +++
 ...-use-32-bit-cells-for-reserved-memor.patch | 39 +++++++++++++++++++
 5 files changed, 58 insertions(+), 5 deletions(-)
 create mode 100644 meta-arm-bsp/conf/machine/include/corstone1000-extsys=
.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
040-corstone1000-dts-use-32-bit-cells-for-reserved-memor.patch


