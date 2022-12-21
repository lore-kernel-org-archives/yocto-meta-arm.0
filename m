Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BBBC3DA7B
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 14:39:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20310.1671633593422215449
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Dec 2022 06:39:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BB97AD7;
	Wed, 21 Dec 2022 06:40:34 -0800 (PST)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4A36B3F71E;
	Wed, 21 Dec 2022 06:39:52 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 5/5] arm/qemuarm-secureboot: pin optee-os version
Date: Wed, 21 Dec 2022 14:39:42 +0000
Message-Id: <20221221143942.15196-6-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221221143942.15196-1-emekcan.aras@arm.com>
References: <20221221143942.15196-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Dec 2022 14:39:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4220

From: Emekcan Aras <emekcan.aras@arm.com>

There is a new optee version 3.19. Currently, qemuarm-secureboot cannot boot
optee 3.19 out-of-the-box. This pins optee-os version to 3.18 for
qemuarm-secureboot.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 meta-arm/conf/machine/qemuarm-secureboot.conf   | 3 +++
 meta-arm/conf/machine/qemuarm64-secureboot.conf | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta-arm/conf/machine/qemuarm-secureboot.conf b/meta-arm/conf/machine/qemuarm-secureboot.conf
index f08b84fe..db02dc68 100644
--- a/meta-arm/conf/machine/qemuarm-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm-secureboot.conf
@@ -21,3 +21,6 @@ WKS_FILE_DEPENDS = "trusted-firmware-a"
 IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
 
 MACHINE_FEATURES += "optee-ftpm"
+
+PREFERRED_VERSION_optee-os ?= "3.18.%"
+
diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
index 55c4cab4..7277817d 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -23,3 +23,6 @@ WKS_FILE_DEPENDS = "trusted-firmware-a"
 IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
 
 MACHINE_FEATURES += "optee-ftpm"
+
+PREFERRED_VERSION_optee-os ?= "3.18.%"
+
-- 
2.17.1


