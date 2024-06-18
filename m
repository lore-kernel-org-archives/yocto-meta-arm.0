Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C7A4C27C4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 15:27:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.89533.1718724452425755659
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jun 2024 08:27:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BF39DA7;
	Tue, 18 Jun 2024 08:27:56 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.30.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6D383F6A8;
	Tue, 18 Jun 2024 08:27:30 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH v2 0/5] arm-bsp: corstone1000: Enable multicore support for FVP 
Date: Tue, 18 Jun 2024 16:27:19 +0100
Message-Id: <20240618152724.7273-1-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jun 2024 15:27:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5819

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

This changeset incorporates the multicore support for Corstone-1000 FVP.

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

v2:
* Add extra space while appending EXTRA_OEMAKE for TF-A and OPTEE
* Change upstream pacth status to Backport for TF-A and OPTEE

Harsimran Singh Tungal (5):
  arm-bsp/optee: corstone1000: Remove MMCOMM buffer address
  arm-bsp/u-boot: corstone1000: Enable secondary cores for Corstone-1000
    FVP
  arm-bsp/trusted-firmware-a: corstone1000: Multicore support for
    Corstone-1000 FVP
  arm-bsp/trusted-firmware-m: corstone1000: Multicore support for
    Corstone-1000 FVP
  ci,arm-bsp: corstone1000: New MACHINE_FEATURES for Corstone-1000 FVP
    multicore

 kas/corstone1000-fvp-multicore.yml            |   8 +
 ...0-Add-multicore-support-for-FVP-plat.patch | 162 ++++++++++++++++++
 .../trusted-firmware-a-corstone1000.inc       |   2 +
 ...CS1000-Add-multicore-support-for-FVP.patch | 119 +++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |   2 +
 .../u-boot/u-boot-corstone1000.inc            |   1 +
 ...dd-secondary-cores-cpu-nodes-for-FVP.patch |  63 +++++++
 ...one1000-Remove-MMCOMM-buffer-address.patch |  43 +++++
 .../optee/optee-os-corstone1000-common.inc    |   3 +
 9 files changed, 403 insertions(+)
 create mode 100644 kas/corstone1000-fvp-multicore.yml
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0006-feat-corstone1000-Add-multicore-support-for-FVP-plat.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0013-platform-CS1000-Add-multicore-support-for-FVP.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
049-corstone1000-Add-secondary-cores-cpu-nodes-for-FVP.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/co=
rstone1000/0003-plat-corstone1000-Remove-MMCOMM-buffer-address.patch

--=20
2.25.1


