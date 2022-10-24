Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04900C38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 13:24:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19284.1666617858154756908
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Oct 2022 06:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6466DED1;
	Mon, 24 Oct 2022 06:24:23 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 556453F7B4;
	Mon, 24 Oct 2022 06:24:16 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan <emekcan.aras@arm.com>
Subject: [PATCH 0/1] arm-bsp/corstone1000: apply ts patch to psa crypto api test
Date: Mon, 24 Oct 2022 14:24:11 +0100
Message-Id: <20221024132412.30881-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 13:24:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4014

From: Emekcan <emekcan.aras@arm.com>

Apply shared patch to trusted services that is used to compile
psa crypto api tests to include change in packed-c request
message in the eaed update structure to be in sync with the
serialize/deserialize in TS side.

As at it, move the other corstone1000 specific patch file to
meta-arm-bsp where it should be.

Rui Miguel Silva (1):
  arm-bsp/corstone1000: apply ts patch to psa crypto api test

 .../0018-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch   | 4 +++-
 .../0001-corstone1000-port-crypto-config.patch             | 0
 .../trusted-services/ts-psa-crypto-api-test_git.bbappend   | 7 +++++++
 .../trusted-services/ts-psa-api-test-common_git.inc        | 1 -
 4 files changed, 10 insertions(+), 2 deletions(-)
 rename meta-arm/recipes-security/trusted-services/files/0002-corstone1000-port-crypto-config.patch => meta-arm-bsp/recipes-security/trusted-services/corstone1000/ts-psa-crypto-api-test/0001-corstone1000-port-crypto-config.patch (100%)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-psa-crypto-api-test_git.bbappend

-- 
2.17.1


