Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B50E5C433EF
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 10:08:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20118.1639217327776572853
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 11 Dec 2021 02:08:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 504FD106F;
	Sat, 11 Dec 2021 02:08:47 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.35.244])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A2BA3F73D;
	Sat, 11 Dec 2021 02:08:46 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH][HONISTER 0/9] backport "corstone1000: secure partitions
 patchset"
Date: Sat, 11 Dec 2021 10:08:28 +0000
Message-Id: <20211211100837.19703-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 11 Dec 2021 10:08:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2625

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Backporting already merged commits on master:

corstone1000: secure partitions patchset

Abdellatif El Khlifi (2):
  arm-bsp/u-boot: corstone1000: setting the boot console output
  arm-bsp/u-boot: corstone1000: remove the use of fdt_addr_r

Satish Kumar (1):
  arm-bsp/trusted-firmware-m: corstone1000: Aligning with TF-M master

Vishnu Banavath (6):
  arm-bsp/secure-partitions: add openamp rpc caller
  arm-bsp/optee-os: add openamp-virtio
  arm-bsp/secure-partitions: Add psa client definitions for ff-m
  arm-bsp/secure-partitions: add common service component to ipc support
  arm-bsp/secure-partitions: add secure storage ipc backend
  arm-bsp/secure-partitions: Use secure storage ipc and openamp for
    se_proxy

 .../trusted-firmware-m-corstone1000.inc       |   22 +-
 ...-dts-setting-the-boot-console-output.patch |   33 +
 ...000-dts-remove-the-use-of-fdt_addr_r.patch |   34 +
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |    2 +
 .../corstone1000/sp_manifest_combined_se.dts  |    6 +
 .../0009-Add-openamp-rpc-caller.patch         | 1178 +++++++++++++++++
 ...-add-psa-client-definitions-for-ff-m.patch |  294 ++++
 ...mon-service-component-to-ipc-support.patch |  287 ++++
 .../0012-Add-secure-storage-ipc-backend.patch |  514 +++++++
 ...storage-ipc-and-openamp-for-se_proxy.patch |   61 +
 .../trusted-services/ts-corstone1000.inc      |    7 +-
 11 files changed, 2416 insertions(+), 22 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-corstone1000-dts-setting-the-boot-console-output.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-corstone1000-dts-remove-the-use-of-fdt_addr_r.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0009-Add-openamp-rpc-caller.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0010-add-psa-client-definitions-for-ff-m.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0011-Add-common-service-component-to-ipc-support.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0012-Add-secure-storage-ipc-backend.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0013-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch

-- 
2.17.1


