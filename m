Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A960FC433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 11:09:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.24288.1639480174912598722
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 03:09:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 395206D;
	Tue, 14 Dec 2021 03:09:34 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.34.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1CE043F5A1;
	Tue, 14 Dec 2021 03:09:32 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH honister 0/9] backport "corstone1000: out of tree patches for
 secure partitions and psa-arch-tests "
Date: Tue, 14 Dec 2021 11:09:16 +0000
Message-Id: <20211214110925.9936-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Dec 2021 11:09:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2688

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Backporting the patchset from master

Emekcan Aras (2):
  arm-bsp/trusted-firmware-m: corstone1000: Aligning with TF-M master
  arm-bsp/psa-arch-tests: corstone1000: configuring crypto and
    attestation test

Gowtham Suresh Kumar (1):
  arm-bsp/secure-partitions: corstone1000: Increase SMM Gateway variable
    handling capacity

Satish Kumar (5):
  arm-bsp/secure-partitions: fixes required to run psa-arch-test
  arm-bsp/secure-partitions: corstone1000: Use address instead of
    pointers
  arm-bsp/secure-partitions: corstone1000: Add psa ipc attestation to se
    proxy
  arm-bsp/secure-partitions: corstone1000: Setup its backend
  arm-bsp/secure-partitions: corstone1000: add psa ipc crypto backend

Vishnu Banavath (1):
  arm-bsp/secure-partitions: add capsule update interface to SE proxy SP

 .../trusted-firmware-m-corstone1000.inc       |    2 +-
 .../psa-arch-tests-corstone1000.inc           |    4 +-
 ...rch-test-Fixing-psa-arch-tests-cmake.patch |   49 +
 ...0003-corstone1000-port-crypto-config.patch |  237 ++
 .../0019-Run-psa-arch-test.patch              |   87 +
 ...0020-Use-address-instead-of-pointers.patch |  170 ++
 ...-Add-psa-ipc-attestation-to-se-proxy.patch |  268 ++
 ...d-as-openamp-rpc-using-secure-storag.patch |  165 ++
 .../0023-add-psa-ipc-crypto-backend.patch     | 2587 +++++++++++++++++
 ...MM-gateway-UEFI-variable-macro-value.patch |   35 +
 ...ub-capsule-update-service-components.patch |  416 +++
 .../trusted-services/ts-corstone1000.inc      |    7 +
 12 files changed, 4025 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests/corstone1000/0002-arm-bsp-psa-arch-test-Fixing-psa-arch-tests-cmake.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests/corstone1000/0003-corstone1000-port-crypto-config.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0019-Run-psa-arch-test.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0020-Use-address-instead-of-pointers.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0021-Add-psa-ipc-attestation-to-se-proxy.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0022-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0023-add-psa-ipc-crypto-backend.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0024-Increase-SMM-gateway-UEFI-variable-macro-value.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0025-Add-stub-capsule-update-service-components.patch

-- 
2.17.1


