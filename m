Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F269C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 15:47:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19106.1714492025973193196
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 08:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAC532F4;
	Tue, 30 Apr 2024 08:47:31 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.39.83])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 854263F793;
	Tue, 30 Apr 2024 08:47:04 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 0/3] corstone1000:arm-bsp: Enable SMM gateway authenticated variables and Secure Boot
Date: Tue, 30 Apr 2024 16:46:51 +0100
Message-Id: <20240430154654.26833-1-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 15:47:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5651

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

These changes enable the SMM gateway authenticated variables and Secure B=
oot features
implementation for Corstone-1000

Emekcan Aras (1):
  arm-bsp/trusted-firmware-a: corstone1000: Remove unused NS_SHARED_RAM
    region

Harsimran Singh Tungal (2):
  arm-bsp: corstone1000: Enable SMM gateway authenticated variables
  arm-bsp/u-boot: corstone1000: Enable UEFI secure boot

 ...0-remove-unused-NS_SHARED_RAM-region.patch | 92 +++++++++++++++++++
 .../trusted-firmware-a-corstone1000.inc       |  1 +
 .../u-boot/u-boot-corstone1000.inc            |  1 +
 ...corstone1000-Enable-UEFI-Secure-boot.patch | 28 ++++++
 .../0002-increase-tzdram-size.patch           | 28 ++++++
 .../optee/optee-os-corstone1000-common.inc    |  1 +
 .../ts-sp-smm-gateway_%.bbappend              |  2 +
 7 files changed, 153 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0004-fix-corstone1000-remove-unused-NS_SHARED_RAM-region.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
048-corstone1000-Enable-UEFI-Secure-boot.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/co=
rstone1000/0002-increase-tzdram-size.patch

--=20
2.25.1


