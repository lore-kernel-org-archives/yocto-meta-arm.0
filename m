Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B2DC433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 14:55:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.12044.1667573692248304476
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 07:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9A891FB;
	Fri,  4 Nov 2022 07:54:57 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A90163F703;
	Fri,  4 Nov 2022 07:54:50 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan <emekcan.aras@arm.com>
Subject: [PATCH 0/3] arm/trusted-services:check before applying patches
Date: Fri,  4 Nov 2022 14:54:43 +0000
Message-Id: <20221104145446.26551-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Nov 2022 14:55:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4077

From: Emekcan <emekcan.aras@arm.com>

It fixes few issues regarding ts patch stage.
1- Adds check if there are patches to be applied on psa-api-tests.
2- Fixes psa-api-tests (crypto and attestation) for corstone1000.
3- Changes default configuration on tfm to accomodate changes in 2
for corstone1000.

Rui Miguel Silva (3):
  arm/trusted-services: check before applying patches
  arm-bsp/trusted-services: psa test setup corstone1000
  arm-bsp/trusted-firmware-m: adjust ps assets for corstone1000

 ...ne1000-adjust-PS-asset-configuration.patch | 27 +++++++
 .../trusted-firmware-m-corstone1000.inc       |  1 +
 ...1-Add-openamp-to-SE-proxy-deployment.patch |  6 +-
 ...iver-and-the-OpenAmp-conversion-laye.patch |  6 +-
 .../0003-Add-openamp-rpc-caller.patch         |  6 +-
 ...-add-psa-client-definitions-for-ff-m.patch |  6 +-
 ...mon-service-component-to-ipc-support.patch |  6 +-
 .../0006-Add-secure-storage-ipc-backend.patch |  6 +-
 ...storage-ipc-and-openamp-for-se_proxy.patch |  6 +-
 .../corstone1000/0008-Run-psa-arch-test.patch |  6 +-
 ...0009-Use-address-instead-of-pointers.patch |  6 +-
 ...-Add-psa-ipc-attestation-to-se-proxy.patch | 75 ++++++++++++++++---
 ...d-as-openamp-rpc-using-secure-storag.patch |  6 +-
 .../0012-add-psa-ipc-crypto-backend.patch     | 22 +-----
 ...ub-capsule-update-service-components.patch |  8 +-
 .../0014-Configure-storage-size.patch         |  8 +-
 ...face-structure-aligned-with-tf-m-cha.patch |  6 +-
 ...egrate-remaining-psa-ipc-client-APIs.patch |  6 +-
 ...et_key_usage_flags-definition-to-the.patch |  6 +-
 ...-in-AEAD-for-psa-arch-test-54-and-58.patch | 11 ++-
 ...rstone1000-change-default-smm-values.patch |  6 +-
 .../0020-FMP-Support-in-Corstone1000.patch    | 15 ++--
 ...0001-corstone1000-port-crypto-config.patch |  0
 .../trusted-services/libts_git.bbappend       | 10 +++
 .../trusted-services/ts-corstone1000.inc      | 47 ++++++------
 .../trusted-services/ts-psa-api-test.inc      |  7 ++
 .../ts-psa-crypto-api-test_git.bbappend       |  8 +-
 .../ts-psa-iat-api-test_git.bbappend          |  1 +
 .../ts-psa-its-api-test_git.bbappend          |  1 +
 .../ts-psa-ps-api-test_git.bbappend           |  1 +
 .../ts-sp-se-proxy_%.bbappend                 |  5 ++
 .../ts-sp-smm-gateway_%.bbappend              |  5 ++
 .../ts-psa-api-test-common_git.inc            |  6 +-
 33 files changed, 215 insertions(+), 127 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1000/0007-corstone1000-adjust-PS-asset-configuration.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{ts-psa-crypto-api-test => psa-apitest}/0001-corstone1000-port-crypto-config.patch (100%)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/libts_git.bbappend
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-test.inc
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-psa-iat-api-test_git.bbappend
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-psa-its-api-test_git.bbappend
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-psa-ps-api-test_git.bbappend

-- 
2.17.1


