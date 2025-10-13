Return-Path: <frazer.carsley@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B76CCCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 15:49:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.47457.1760370577285872435
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Oct 2025 08:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: frazer.carsley@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1D1D113E;
	Mon, 13 Oct 2025 08:49:28 -0700 (PDT)
Received: from e138143.cambridge.arm.com (e138143.arm.com [10.1.29.180])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EFFD43F66E;
	Mon, 13 Oct 2025 08:49:35 -0700 (PDT)
From: Frazer Carsley <frazer.carsley@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH 0/2] corstone1000: Fixes PSA API Crypto tests
Date: Mon, 13 Oct 2025 16:49:10 +0100
Message-ID: <20251013154912.55363-1-frazer.carsley@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Oct 2025 15:49:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6733

The PSA API Crypto tests were failing on Corstone1000 after both TF-M
and Trusted Services were upgraded. These commits fix the problems
caused by both of these upgrades.

Frazer Carsley (2):
  arm-bsp/corstone1000:trusted-services: Fix psa-crypto-api-tests
  arm-bsp/corstone1000:psa-tests: Removes RSA tests

 ...n-PSA-Crypto-structs-with-TF-Mv2.1.1.patch | 40 ++++++++++++++
 .../psa-apitest/0004-Remove-RSA-support.patch | 52 +++++++++++++++++++
 .../trusted-services/ts-arm-platforms.inc     |  2 +
 .../trusted-services/ts-psa-api-test.inc      |  1 +
 4 files changed, 95 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0013-Align-PSA-Crypto-structs-with-TF-Mv2.1.1.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/psa-apitest/0004-Remove-RSA-support.patch


