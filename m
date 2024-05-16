Return-Path: <ali.oezaslan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16FD1C25B7C
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 15:48:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17582.1715874532918778002
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 May 2024 08:48:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ali.oezaslan@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B741ADA7;
	Thu, 16 May 2024 08:49:16 -0700 (PDT)
Received: from PW05BKJD.arm.com (PW05BKJD.arm.com [10.1.35.164])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1060E3F7A6;
	Thu, 16 May 2024 08:48:51 -0700 (PDT)
From: ali.oezaslan@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Ali Can Ozaslan <ali.oezaslan@arm.com>
Subject: [PATCH scarthgap 0/2] corstone1000: fix crypto and iat psa failures
Date: Thu, 16 May 2024 16:48:41 +0100
Message-Id: <20240516154843.15843-1-ali.oezaslan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 May 2024 15:48:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5725

From: Ali Can Ozaslan <ali.oezaslan@arm.com>

* The psa-iat-api-test was failing because the PLATFORM_HAS_ATTEST_PK
flag was added to the build for Corstone1000.

* Crypto-AEAD-APIs tests fails on mps3. Configures CC312 mps3 model
same as predefined cc312 FVP configuration while keeping debug
ports closed.

Ali Can Ozaslan (1):
  arm-bsp/trusted-firmware-m: corstone1000: fix crypto failure on mps3

Bence Balogh (1):
  arm-bsp/trusted-services: corstone1000: fix IAT test

 ...of-cc312-differences-between-fvp-and.patch | 31 +++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  1 +
 ...M_HAS_ATTEST_PK-define-from-IAT-test.patch | 27 ++++++++++++++++
 .../trusted-services/ts-arm-platforms.inc     |  1 +
 4 files changed, 60 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0010-CC312-alignment-of-cc312-differences-between-fvp-and.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0010-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch

--=20
2.34.1


