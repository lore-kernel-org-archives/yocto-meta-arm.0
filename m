Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4948DC433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 13:59:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.12623.1638971951663126479
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 05:59:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFFF3D6E;
	Wed,  8 Dec 2021 05:59:09 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.6.202])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B71853F73B;
	Wed,  8 Dec 2021 05:59:08 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 0/8] Corstone1000: MHU driver patchset
Date: Wed,  8 Dec 2021 13:58:52 +0000
Message-Id: <20211208135900.683-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Dec 2021 13:59:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2561

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Adding the following features to Corstone1000:

- openamp support
- MHU driver
- increasing optee core heap size
- adding missing header for optee-spdevkit

Abdellatif El Khlifi (3):
  arm/secure-partitions: remove platform specific dependencies
  arm-bsp/secure-partitions: corstone1000: add mbed-crypto and nanopb to
    platform code
  arm-bsp/secure-partitions: corstone1000: add openamp support in SE
    proxy SP

Vishnu Banavath (5):
  arm-bsp/optee-os: increase core heap size
  arm/optee-spdevkit: add missing header file in optee-spdevkit
  arm/secure-partitions: pass TS_PLATFORM in the configure task
  arm-bsp/secure-partitions: Implement mhu driver
  arm-bsp/optee-os: add MHU device regions in the SP manifest

 ...ne1000-increase-OPTEE-core-heap-size.patch |   29 +
 .../corstone1000/sp_manifest_combined_se.dts  |   17 +-
 .../optee/optee-os_corstone1000_common.inc    |    4 +-
 ...7-Add-openamp-to-SE-proxy-deployment.patch |  259 ++++
 ...iver-and-the-OpenAmp-conversion-laye.patch | 1083 +++++++++++++++++
 .../trusted-services/ts-corstone1000.inc      |   32 +-
 .../optee/optee-spdevkit_git.bb               |  183 +++
 .../trusted-services/secure-partitions_git.bb |   12 +-
 8 files changed, 1603 insertions(+), 16 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-plat-corstone1000-increase-OPTEE-core-heap-size.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0007-Add-openamp-to-SE-proxy-deployment.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0008-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch

-- 
2.17.1


