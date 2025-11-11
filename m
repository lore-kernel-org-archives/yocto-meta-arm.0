Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B90CCFA1E
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 16:54:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22285.1762880075051438137
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Nov 2025 08:54:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D16E497;
	Tue, 11 Nov 2025 08:54:26 -0800 (PST)
Received: from e132995.arm.com (unknown [10.57.87.92])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F4A53F5A1;
	Tue, 11 Nov 2025 08:54:33 -0800 (PST)
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 0/1] arm-bsp/trusted-firmware-a: corstone1000: Add patch for removing dependency of GICC frame for GICv3
Date: Tue, 11 Nov 2025 16:54:21 +0000
Message-Id: <20251111165422.303832-1-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Nov 2025 16:54:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6765

GICC registers are not defined for GICv3. Trusted-Firmware-A throws=20
error when GICC register address is not defined even for GICv3.=20
Adding patch to handle this in Trusted-Firmware-A.

Harsimran Singh Tungal (1):
  arm-bsp/trusted-firmware-a: corstone1000: Add patch for removing
    dependency of GICC frame for GICv3

 ...quire-the-GICC-frame-to-be-defined-o.patch | 45 +++++++++++++++++++
 .../trusted-firmware-a_2.13.0.bb              |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0002-fi=
x-css-don-t-require-the-GICC-frame-to-be-defined-o.patch


