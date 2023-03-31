Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40AD1C77B60
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 19:14:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4526.1680290083543029160
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 31 Mar 2023 12:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E84616F8;
	Fri, 31 Mar 2023 12:15:27 -0700 (PDT)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 615643F663;
	Fri, 31 Mar 2023 12:14:42 -0700 (PDT)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Xueliang Zhong <xueliang.zhong@arm.com>
Subject: [PATCH 1/1] arm-bsp/optee-os: N1SDP support for optee-os 3.20
Date: Fri, 31 Mar 2023 19:14:34 +0000
Message-Id: <20230331191434.8363-2-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230331191434.8363-1-xueliang.zhong@arm.com>
References: <20230331191434.8363-1-xueliang.zhong@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 31 Mar 2023 19:14:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4527

From: Xueliang Zhong <xueliang.zhong@arm.com>

This patch adds optee-os 3.20 support on N1SDP, the optee-os 3.20
bbappend file is also added.

Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf                          | 2 +-
 .../files/optee-os/n1sdp/0004-Handle-logging-syscall.patch    | 4 ++--
 meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend  | 1 -
 meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend  | 1 +
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index 0e047e8d..ef90c639 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -31,7 +31,7 @@ EXTRA_IMAGEDEPENDS += "virtual/control-processor-firmware"
 EXTRA_IMAGEDEPENDS += "edk2-firmware"
 
 #optee
-PREFERRED_VERSION_optee-os ?= "3.18.%"
+PREFERRED_VERSION_optee-os ?= "3.20.%"
 
 #grub-efi
 EFI_PROVIDER ?= "grub-efi"
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0004-Handle-logging-syscall.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0004-Handle-logging-syscall.patch
index 356be9e0..67d98725 100644
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0004-Handle-logging-syscall.patch
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0004-Handle-logging-syscall.patch
@@ -15,8 +15,8 @@ diff --git a/core/arch/arm/kernel/spmc_sp_handler.c b/core/arch/arm/kernel/spmc_
 index e0fa0aa6..c7a45387 100644
 --- a/core/arch/arm/kernel/spmc_sp_handler.c
 +++ b/core/arch/arm/kernel/spmc_sp_handler.c
-@@ -1004,6 +1004,12 @@ void spmc_sp_msg_handler(struct thread_smc_args *args,
- 			ffa_mem_reclaim(args, caller_sp);
+@@ -1132,6 +1132,12 @@ void spmc_sp_msg_handler(struct thread_smc_args *args,
+ 			handle_mem_perm_set(args, caller_sp);
  			sp_enter(args, caller_sp);
  			break;
 +		case 0xdeadbeef:
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend
index bc933dd5..e276fb86 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend
@@ -1,7 +1,6 @@
 # Machine specific configurations
 
 MACHINE_OPTEE_OS_REQUIRE ?= ""
-MACHINE_OPTEE_OS_REQUIRE:n1sdp = "optee-os-n1sdp.inc"
 MACHINE_OPTEE_OS_REQUIRE:tc = "optee-os-tc.inc"
 
 require ${MACHINE_OPTEE_OS_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend
index e732c80f..b5493e5e 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend
@@ -2,5 +2,6 @@
 
 MACHINE_OPTEE_OS_REQUIRE ?= ""
 MACHINE_OPTEE_OS_REQUIRE:corstone1000 = "optee-os-corstone1000-common.inc"
+MACHINE_OPTEE_OS_REQUIRE:n1sdp = "optee-os-n1sdp.inc"
 
 require ${MACHINE_OPTEE_OS_REQUIRE}
-- 
2.17.1


