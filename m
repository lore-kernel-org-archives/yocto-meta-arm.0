Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71321C6FA89
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 19:30:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.442.1662665410915296487
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 08 Sep 2022 12:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D80421576
	for <meta-arm@lists.yoctoproject.org>; Thu,  8 Sep 2022 12:30:16 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 66AD23F71A
	for <meta-arm@lists.yoctoproject.org>; Thu,  8 Sep 2022 12:30:10 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm-bsp/optee: rename corstone1000 files
Date: Thu,  8 Sep 2022 15:29:58 -0400
Message-Id: <20220908192959.21816-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220908192959.21816-1-jon.mason@arm.com>
References: <20220908192959.21816-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 08 Sep 2022 19:30:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3747

The corstone1000 optee files have an underbar when it should have a
hyphen in the naming scheme.  Change this to match other files.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...corstone1000_common.inc => optee-os-corstone1000-common.inc} | 0
 .../{optee-os_corstone1000.inc => optee-os-corstone1000.inc}    | 2 +-
 .../recipes-security/optee/optee-spdevkit-corstone1000.inc      | 1 +
 .../recipes-security/optee/optee-spdevkit_corstone1000.inc      | 1 -
 meta-arm-bsp/recipes-security/optee/optee-spdevkit_git.bbappend | 2 +-
 5 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-arm-bsp/recipes-security/optee/{optee-os_corstone1000_common.inc => optee-os-corstone1000-common.inc} (100%)
 rename meta-arm-bsp/recipes-security/optee/{optee-os_corstone1000.inc => optee-os-corstone1000.inc} (94%)
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-spdevkit-corstone1000.inc
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-spdevkit_corstone1000.inc

diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000_common.inc b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/optee-os_corstone1000_common.inc
rename to meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000.inc b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000.inc
similarity index 94%
rename from meta-arm-bsp/recipes-security/optee/optee-os_corstone1000.inc
rename to meta-arm-bsp/recipes-security/optee/optee-os-corstone1000.inc
index eb5f6df0..8ddf47e3 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000.inc
@@ -1,4 +1,4 @@
-require optee-os_corstone1000_common.inc
+require optee-os-corstone1000-common.inc
 
 DEPENDS += " secure-partitions"
 EXTRA_OEMAKE +="'SP_PACKAGING_METHOD=embedded'"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-spdevkit-corstone1000.inc b/meta-arm-bsp/recipes-security/optee/optee-spdevkit-corstone1000.inc
new file mode 100644
index 00000000..db85ed8e
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-spdevkit-corstone1000.inc
@@ -0,0 +1 @@
+require optee-os-corstone1000-common.inc
diff --git a/meta-arm-bsp/recipes-security/optee/optee-spdevkit_corstone1000.inc b/meta-arm-bsp/recipes-security/optee/optee-spdevkit_corstone1000.inc
deleted file mode 100644
index 363b0ed1..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-spdevkit_corstone1000.inc
+++ /dev/null
@@ -1 +0,0 @@
-require optee-os_corstone1000_common.inc
diff --git a/meta-arm-bsp/recipes-security/optee/optee-spdevkit_git.bbappend b/meta-arm-bsp/recipes-security/optee/optee-spdevkit_git.bbappend
index 13e109cb..5f74ae45 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-spdevkit_git.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-spdevkit_git.bbappend
@@ -1,6 +1,6 @@
 # Machine specific configurations
 
 MACHINE_OPTEE_SPDEVKIT_REQUIRE ?= ""
-MACHINE_OPTEE_SPDEVKIT_REQUIRE:corstone1000 = "optee-spdevkit_corstone1000.inc"
+MACHINE_OPTEE_SPDEVKIT_REQUIRE:corstone1000 = "optee-spdevkit-corstone1000.inc"
 
 require ${MACHINE_OPTEE_SPDEVKIT_REQUIRE}
-- 
2.17.1


