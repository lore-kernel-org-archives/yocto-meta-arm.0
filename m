Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D093ECAAD8
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 12:58:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6025.1663765131235167838
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Sep 2022 05:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 436AE1F02
	for <meta-arm@lists.yoctoproject.org>; Wed, 21 Sep 2022 05:58:57 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9E92A3F73B
	for <meta-arm@lists.yoctoproject.org>; Wed, 21 Sep 2022 05:58:50 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] arm/qemuarm-secureboot: remove optee-os version pin
Date: Tue, 20 Sep 2022 18:38:44 -0400
Message-Id: <20220920223846.8000-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220920223846.8000-1-jon.mason@arm.com>
References: <20220920223846.8000-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Sep 2022 12:58:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3797

The CPU issue that pinned qemuarm-secureboot is no longer present.
Remove the logic in the conf file that held it back to the older
version.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/conf/machine/qemuarm-secureboot.conf | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arm/conf/machine/qemuarm-secureboot.conf b/meta-arm/conf/machine/qemuarm-secureboot.conf
index e48d9642..f08b84fe 100644
--- a/meta-arm/conf/machine/qemuarm-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm-secureboot.conf
@@ -21,6 +21,3 @@ WKS_FILE_DEPENDS = "trusted-firmware-a"
 IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
 
 MACHINE_FEATURES += "optee-ftpm"
-
-# FIXME - CPUs 2-4 don't start in the newer OPTEE
-PREFERRED_VERSION_optee-os ?= "3.14%"
-- 
2.17.1


