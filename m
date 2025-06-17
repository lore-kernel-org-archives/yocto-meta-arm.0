Return-Path: <yogesh.wani@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C30C7115B
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 16:30:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.23767.1750177823800470417
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Jun 2025 09:30:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: yogesh.wani@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65471150C;
	Tue, 17 Jun 2025 09:30:02 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.57.84.156])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01B883F58B;
	Tue, 17 Jun 2025 09:30:22 -0700 (PDT)
From: Yogesh Wani <yogesh.wani@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Yogesh Wani <yogesh.wani@arm.com>
Subject: [PATCH 0/1] arm/trusted-firmware-m: Remove duplicate config in the cmake file.
Date: Tue, 17 Jun 2025 17:30:10 +0100
Message-ID: <20250617163011.2238429-1-yogesh.wani@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Jun 2025 16:30:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6562

The PS_NUM_ASSET is duplicated in the cmake.config and the config_tfm_tar=
get.h file
under corstone-1000. The commit removes the one from the cmake.config and=
 keeps the
one in the header file.

The whole rationale behind this is for the vendor to be able to override =
the
configuration using the cmake file.

Yogesh Wani (1):
  arm/trusted-firmware-m: Remove duplicate config in the cmake file.

 ...e-duplicate-configuration-parameters.patch | 30 +++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0023-Platform-CS1000-Remove-duplicate-configuration-parameters.=
patch


