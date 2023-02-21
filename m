Return-Path: <mohamed.omarasaker@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC002C64ED6
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 14:51:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.44477.1676991070105647159
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Feb 2023 06:51:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mohamed.omarasaker@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC716FEC;
	Tue, 21 Feb 2023 06:51:51 -0800 (PST)
Received: from e126544.cambridge.arm.com (unknown [10.1.199.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FA9B3F703;
	Tue, 21 Feb 2023 06:51:08 -0800 (PST)
From: mohamed.omarasaker@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
Subject: [PATCH 0/3] Align TS psa client and psa-arch tests with TF-Mv1.7
Date: Tue, 21 Feb 2023 14:50:53 +0000
Message-Id: <20230221145056.278981-1-mohamed.omarasaker@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 Feb 2023 14:51:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4429

From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>


Align the trusted services psa crypto client with TF-Mv1.7
- Update PSA Crypto SID defines value
- Update psa_ipc_crypto_pack_iovec structure
- Fix inputs and outputs passed to in/out_vec to match crypto service
  expectations
Disable the obsolete and the not supported crypto algorithms from psa-arc=
h
test suite.

Mohamed Omar Asaker (3):
  arm-bsp/trusted-services: corstone1000:Align psa crypto client with
    TF-Mv1.7
  arm-bsp/trusted-services:corstone1000: disable obsolete algorithms for
    crypto
  arm-bsp/trusted-services: corstone1000: Disable SHA512/384

 ...v1.7-alignment-Align-PSA-Crypto-SIDs.patch | 413 +++++++++++
 ...gnment-Align-crypto-iovec-definition.patch | 655 ++++++++++++++++++
 ...ignment-PSA-crypto-client-in-out_vec.patch | 117 ++++
 ...tone1000-Disable-obsolete-algorithms.patch |  32 +
 ...0003-corstone1000-Disable-SHA512-384.patch |  32 +
 .../trusted-services/ts-arm-platforms.inc     |   4 +
 .../trusted-services/ts-psa-api-test.inc      |   2 +
 7 files changed, 1255 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0024-TF-Mv1.7-alignment-Align-PSA-Crypto-SIDs.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0025-TF-Mv1.7-alignment-Align-crypto-iovec-definition.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0026-TF-Mv1.7-alignment-PSA-crypto-client-in-out_vec.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/psa-apitest/0002-corstone1000-Disable-obsolete-algorithms.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/psa-apitest/0003-corstone1000-Disable-SHA512-384.patch

--=20
2.25.1


