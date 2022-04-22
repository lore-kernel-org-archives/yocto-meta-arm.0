Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF99C5DF62
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.9802.1650640413360367783
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 08:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A0E615BF
	for <meta-arm@lists.yoctoproject.org>; Fri, 22 Apr 2022 08:13:32 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 693C13F5A1
	for <meta-arm@lists.yoctoproject.org>; Fri, 22 Apr 2022 08:13:32 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] CI: add testing for edk2
Date: Fri, 22 Apr 2022 11:13:26 -0400
Message-Id: <20220422151326.23359-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220422151326.23359-1-jon.mason@arm.com>
References: <20220422151326.23359-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3282

For platforms that can do both u-boot and edk2, add a yml to switch from
u-boot to edk2.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml | 1 +
 ci/edk2.yml    | 9 +++++++++
 2 files changed, 10 insertions(+)
 create mode 100644 ci/edk2.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index bd1ae59..276cb26 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -129,6 +129,7 @@ juno:
   parallel:
     matrix:
       - TOOLCHAINS: [gcc, clang]
+        FIRMWARE: [none, edk2]
 
 microbit-v1:
   extends: .build_and_test
diff --git a/ci/edk2.yml b/ci/edk2.yml
new file mode 100644
index 0000000..77eaee8
--- /dev/null
+++ b/ci/edk2.yml
@@ -0,0 +1,9 @@
+header:
+  version: 11
+
+local_conf_header:
+  bootfirmware: |
+    PREFERRED_PROVIDER_virtual/bootloader = "edk2-firmware"
+    MACHINE_FEATURES += "efi"
+    TFA_UBOOT = "0"
+    TFA_UEFI = "1"
-- 
2.17.1


