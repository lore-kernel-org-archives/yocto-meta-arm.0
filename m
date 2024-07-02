Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09CAEC30658
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 15:35:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.27548.1719934543564811556
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Jul 2024 08:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E861D339;
	Tue,  2 Jul 2024 08:36:02 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.38.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 348FF3F766;
	Tue,  2 Jul 2024 08:35:36 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 0/1] arm-bsp/trusted-firmware-a: corstone1000: fix compilation issue for FVP multicore
Date: Tue,  2 Jul 2024 16:35:28 +0100
Message-Id: <20240702153529.19530-1-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 02 Jul 2024 15:35:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5858

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

Include platform header file in order to remove compiler warnings.
Due to GCC upgrades to 14.1, some warnings are being treated as errors.
This change resolves TF-A compilation issue when FVP multicore
is enabled.

Harsimran Singh Tungal (1):
  arm-bsp/trusted-firmware-a: corstone1000: fix compilation issue for
    FVP multicore

 ...one1000-include-platform-header-file.patch | 28 +++++++++++++++++++
 .../trusted-firmware-a-corstone1000.inc       |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0007-feat-corstone1000-include-platform-header-file.patch

--=20
2.25.1


