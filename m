Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47AF9C3064D
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 13:31:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17128.1719581512421037586
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Jun 2024 06:31:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB3E3106F;
	Fri, 28 Jun 2024 06:32:16 -0700 (PDT)
Received: from e132995.arm.com (unknown [10.57.72.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D621A3F73B;
	Fri, 28 Jun 2024 06:31:50 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 0/3] arm-bsp/u-boot: corstone1000: fix U-Boot, Trusted-Services, and ts-newlib compilation issue
Date: Fri, 28 Jun 2024 14:31:42 +0100
Message-Id: <20240628133145.1444437-1-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 28 Jun 2024 13:31:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5848

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

Fix compilation issues with newer GCC version 14.1 for

1. U-Boot patch
2. Trusted-Services patches
3. ts-newlib package

Harsimran Singh Tungal (3):
  arm-bsp/u-boot: corstone1000: fix U-Boot patch
  arm-bsp/trusted-services: corstone1000: fix compilation issues
  arm-bsp/trusted-services: fix compilation issues for ts-newlib

 .../corstone1000/0019-arm-corstone1000-esrt-support.patch     | 4 ++--
 .../recipes-security/trusted-services/ts-arm-platforms.inc    | 3 +++
 .../recipes-security/trusted-services/ts-newlib_%.bbappend    | 1 +
 3 files changed, 6 insertions(+), 2 deletions(-)

--=20
2.25.1


