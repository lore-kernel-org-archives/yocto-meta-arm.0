Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88332C25B0E
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 13:19:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.15682.1660655983152757546
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Aug 2022 06:19:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 986D11042;
	Tue, 16 Aug 2022 06:19:43 -0700 (PDT)
Received: from e125903.cambridge.arm.com (e125903.cambridge.arm.com
 [10.1.195.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21F853F66F;
	Tue, 16 Aug 2022 06:19:42 -0700 (PDT)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 0/2] N1SDP: Bump TF-A version, add optee support
Date: Tue, 16 Aug 2022 14:19:31 +0100
Message-Id: <20220816131933.33160-1-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Aug 2022 13:19:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3695

From: Vishnu Banavath <vishnu.banavath@arm.com>

These changes are to bump TF-A version for N1SDP and also
to add optee-os support for N1SDP platform.

Vishnu Banavath (2):
  arm-bsp/trusted-firmware-a: Bump TF-A version for N1SDP
  arm-bsp/optee: add optee-os support for N1SDP target

 meta-arm-bsp/conf/machine/n1sdp.conf          |   3 +
 .../files/n1sdp/bl_size.patch                 |  40 ---
 .../trusted-firmware-a-n1sdp.inc              |  28 ++-
 ...DR-affinity-shift-and-mask-for-32-bi.patch |  29 +++
 ...lat-n1sdp-add-N1SDP-platform-support.patch | 233 ++++++++++++++++++
 ...ble-instruction-cache-and-data-cache.patch |  46 ++++
 .../n1sdp/0004-Handle-logging-syscall.patch   |  33 +++
 .../recipes-security/optee/optee-os-n1sdp.inc |  22 ++
 .../optee/optee-os_3.18.0.bbappend            |   6 +
 meta-arm/recipes-security/optee/optee-os.inc  |   6 +-
 10 files changed, 396 insertions(+), 50 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/bl_size.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0001-core-arm-add-MPIDR-affinity-shift-and-mask-for-32-bi.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0002-plat-n1sdp-add-N1SDP-platform-support.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0003-HACK-disable-instruction-cache-and-data-cache.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0004-Handle-logging-syscall.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend

-- 
2.17.1


