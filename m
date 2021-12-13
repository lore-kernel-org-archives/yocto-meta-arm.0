Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B84DDC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 16:31:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13338.1639413071560427845
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 08:31:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41F5F1FB;
	Mon, 13 Dec 2021 08:31:11 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.32.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1CEA33F73B;
	Mon, 13 Dec 2021 08:31:09 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH][HONISTER 0/7] backport "Corstone1000: updating source-code
 and fixes" 
Date: Mon, 13 Dec 2021 16:30:55 +0000
Message-Id: <20211213163102.1039-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Dec 2021 16:31:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2651

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Backporting the features already merged with master.

Abdellatif El Khlifi (4):
  arm-bsp/trusted-firmware-m: corstone1000: bump the version to 1.5
  arm-bsp/optee-os: corstone1000: unpack sp_manifest_combined_se.dts in
    WORKDIR
  arm/secure-partitions: introducing a common file
  arm-bsp/secure-partitions: corstone1000: using the default SHA

Gowtham Suresh Kumar (1):
  arm-bsp/u-boot: corstone1000: Fix GetVariable data size issue

Vishnu Banavath (2):
  arm-bsp/secure-partitions: rebase TS patches
  arm-bsp/optee-os: cherry pick fixes from upstream integration branch

 .../conf/machine/include/corstone1000.inc     |    2 +-
 .../trusted-firmware-m-corstone1000.inc       |    2 +
 ...ppend => trusted-firmware-m_1.4%.bbappend} |    0
 ...ix-GetVariable-to-handle-0-data-size.patch |   47 +
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |    1 +
 ...d-missing-error-check-during-SP-init.patch |   40 +
 .../optee/optee-os_corstone1000.inc           |    5 +-
 .../optee/optee-os_corstone1000_common.inc    |    3 +-
 ...pplying-lowercase-project-convention.patch |    6 +-
 ...0002-fix-EARLY_TA_PATHS-env-variable.patch |    6 +-
 ...proxy-dts-add-se-proxy-as-child-node.patch |    6 +-
 ...te-mm-comm-buffer-region-in-dts-file.patch |   10 +-
 .../0005-Configure-NV-storage-macro.patch     |   10 +-
 .../0006-Use-device-region.patch              |   10 +-
 ...7-Add-openamp-to-SE-proxy-deployment.patch |   20 +-
 ...iver-and-the-OpenAmp-conversion-laye.patch |    6 +-
 .../0009-Add-openamp-rpc-caller.patch         |   10 +-
 ...-add-psa-client-definitions-for-ff-m.patch |    8 +-
 ...mon-service-component-to-ipc-support.patch |   12 +-
 .../0012-Add-secure-storage-ipc-backend.patch |   10 +-
 ...storage-ipc-and-openamp-for-se_proxy.patch |    6 +-
 ...d-uefi-variable-append-write-support.patch | 1152 +++++++++++++++++
 ...riable-support-for-QueryVariableInfo.patch |  822 ++++++++++++
 .../0016-Add-uefi-test-deployment.patch       |  239 ++++
 ...-parameter-setting-in-sp-ffarpc_call.patch |   31 +
 ...-call-requests-with-no-shared-buffer.patch |  107 ++
 .../trusted-services/ts-corstone1000.inc      |    7 +-
 .../trusted-services/secure-partitions.inc    |   27 +
 .../trusted-services/secure-partitions_git.bb |   17 +-
 29 files changed, 2543 insertions(+), 79 deletions(-)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/{trusted-firmware-m_%.bbappend => trusted-firmware-m_1.4%.bbappend} (100%)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-Fix-GetVariable-to-handle-0-data-size.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0005-Fix-add-missing-error-check-during-SP-init.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0014-Add-uefi-variable-append-write-support.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0015-Add-UEFI-variable-support-for-QueryVariableInfo.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0016-Add-uefi-test-deployment.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0017-Fix-interface-ID-parameter-setting-in-sp-ffarpc_call.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0018-Support-FFARPC-call-requests-with-no-shared-buffer.patch
 create mode 100644 meta-arm/recipes-security/trusted-services/secure-partitions.inc

-- 
2.17.1


