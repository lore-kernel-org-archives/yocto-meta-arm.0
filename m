Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 648ABE784AF
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 10:43:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.78655.1696243409517298691
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Oct 2023 03:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AEDDC15;
	Mon,  2 Oct 2023 03:44:07 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5A4433F762;
	Mon,  2 Oct 2023 03:43:28 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 0/5] Introduce authenticated capsule update
Date: Mon,  2 Oct 2023 11:43:18 +0100
Message-Id: <20231002104323.1967358-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 02 Oct 2023 10:43:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5096

From: Emekcan Aras <emekcan.aras@arm.com>

This patchset introduces authenticated capsule update support for corston=
e1000.
We now use mkeficapsule tool provided by u-boot to generate a signed caps=
ule.=20
This requires efitools-native provided by meta-secure-core and some adjus=
tment=20
around firmware update agent in trusted-firmware-m.=20

Emekcan Aras (5):
  CI: Add meta-secure-core
  CI: Include meta-secure-core in corstone1000
  kas: corstone1000: add meta-secure-core
  arm-bsp/u-boot: corstone1000: introduce authenticated capsule update
  arm-bsp/trusted-firmware-m: Enable authenticated capsule update

 ci/corstone1000-common.yml                    |   1 +
 ci/meta-openembedded.yml                      |   1 +
 ci/meta-secure-core.yml                       |  11 ++
 kas/corstone1000-base.yml                     |   7 ++
 ...m-Corstone1000-Enable-Signed-Capsule.patch | 102 ++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |   1 +
 ...00-add-signature-device-tree-overlay.patch |  31 ++++++
 ...-enable-authenticated-capsule-config.patch |  28 +++++
 ...roduce-EFI-authenticated-capsule-upd.patch |  76 +++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  15 ++-
 10 files changed, 272 insertions(+), 1 deletion(-)
 create mode 100644 ci/meta-secure-core.yml
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0006-Platform-Corstone1000-Enable-Signed-Capsule.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
038-corstone1000-add-signature-device-tree-overlay.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
039-corstone1000-enable-authenticated-capsule-config.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
040-corstone1000-introduce-EFI-authenticated-capsule-upd.patch

--=20
2.25.1


