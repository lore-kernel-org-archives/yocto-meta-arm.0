Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F88DC433EF
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 17:33:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.80296.1638293620977557151
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Nov 2021 09:33:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CEAC106F;
	Tue, 30 Nov 2021 09:33:40 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.3.254])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 746B63F694;
	Tue, 30 Nov 2021 09:33:39 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 0/2] Corstone1000: adding smm-gateway
Date: Tue, 30 Nov 2021 17:33:29 +0000
Message-Id: <20211130173331.8848-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Nov 2021 17:33:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2492

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This patchset provides new features to Corstone1000: adding smm-gateway

Gowtham Suresh Kumar (2):
  arm-bsp/secure-partitions: corstone1000: add smm-gateway partition
  arm-bsp/optee-os: corstone1000: enabling smm-gateway partition

 .../corstone1000/sp_manifest_combined_se.dts  | 41 +++++++++++++
 .../optee/optee-os_corstone1000.inc           |  8 ++-
 ...te-mm-comm-buffer-region-in-dts-file.patch | 61 +++++++++++++++++++
 .../0005-Configure-NV-storage-macro.patch     | 28 +++++++++
 .../0006-Use-device-region.patch              | 55 +++++++++++++++++
 .../trusted-services/ts-corstone1000.inc      |  7 +++
 6 files changed, 199 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/sp_manifest_combined_se.dts
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0004-Update-mm-comm-buffer-region-in-dts-file.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0005-Configure-NV-storage-macro.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0006-Use-device-region.patch

-- 
2.17.1


