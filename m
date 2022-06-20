Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB4CAC43334
	for <webhook@archiver.kernel.org>; Fri, 24 Jun 2022 17:26:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.10721.1656091574707876624
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 24 Jun 2022 10:26:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7365D143D
	for <meta-arm@lists.yoctoproject.org>; Fri, 24 Jun 2022 10:26:14 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2BCE43F792
	for <meta-arm@lists.yoctoproject.org>; Fri, 24 Jun 2022 10:26:14 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] ci: update edk2 yml file to work with qemuarm/qemuarm64
Date: Mon, 20 Jun 2022 11:29:13 -0400
Message-Id: <20220620152913.3563-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220620152913.3563-1-jon.mason@arm.com>
References: <20220620152913.3563-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 24 Jun 2022 17:26:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3539

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml | 4 ++++
 ci/edk2.yml    | 6 ++++++
 ci/jobs-to-kas | 2 +-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 6532fd09..f91d678a 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -185,6 +185,9 @@ qemuarm64:
   extends: .build
   parallel:
     matrix:
+      - TOOLCHAINS: [gcc, clang]
+        EFI: [uboot, edk2]
+        TESTING: testimage
       - VIRT: xen
 
 qemuarm-secureboot:
@@ -199,6 +202,7 @@ qemuarm:
   parallel:
     matrix:
       - TOOLCHAINS: [gcc, clang]
+        EFI: [uboot, edk2]
         TESTING: testimage
       - VIRT: xen
 
diff --git a/ci/edk2.yml b/ci/edk2.yml
index 77eaee88..219ee28b 100644
--- a/ci/edk2.yml
+++ b/ci/edk2.yml
@@ -7,3 +7,9 @@ local_conf_header:
     MACHINE_FEATURES += "efi"
     TFA_UBOOT = "0"
     TFA_UEFI = "1"
+
+    EXTRA_IMAGEDEPENDS += "edk2-firmware"
+    EFI_PROVIDER ?= "grub-efi"
+
+    QB_DEFAULT_BIOS = "QEMU_EFI.fd"
+    WKS_FILE ?= "efi-disk.wks.in"
diff --git a/ci/jobs-to-kas b/ci/jobs-to-kas
index f442a22d..d6896b77 100755
--- a/ci/jobs-to-kas
+++ b/ci/jobs-to-kas
@@ -18,7 +18,7 @@ for i in $(echo $1 | cut -s -d ':' -f 2 | sed 's/[][,]//g'); do
 	# defaults, we can simply ignore those parameters.  They are necessary
 	# to pass in so that matrix can correctly setup all of the permutations
 	# of each individual run.
-	if [[ $i == 'none' || $i == 'gcc' || $i == 'glibc' ]]; then
+	if [[ $i == 'none' || $i == 'gcc' || $i == 'glibc' || $i == 'uboot' ]]; then
 		continue
 	fi
 	FILES+=":ci/$i.yml"
-- 
2.17.1


