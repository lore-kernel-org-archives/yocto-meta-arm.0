Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D6FCD37B0
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 18:04:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.59081.1695060272815369502
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Sep 2023 11:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6CF1C15;
	Mon, 18 Sep 2023 11:05:09 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8C4F53F5A1;
	Mon, 18 Sep 2023 11:04:31 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 1/1] arm-bsp/optee-os: corstone1000: Handling logging syscall correctly
Date: Mon, 18 Sep 2023 19:04:24 +0100
Message-Id: <20230918180424.26148-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230918180424.26148-1-emekcan.aras@arm.com>
References: <20230918180424.26148-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Sep 2023 18:04:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5056

From: Emekcan Aras <emekcan.aras@arm.com>

Enables handling logging messages correctly.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 .../0001-Handle-logging-syscall.patch         | 32 +++++++++++++++++++
 .../optee/optee-os-corstone1000-common.inc    |  5 +++
 2 files changed, 37 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0001-Handle-logging-syscall.patch

diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0001-Handle-logging-syscall.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0001-Handle-logging-syscall.patch
new file mode 100644
index 00000000..9c1d7816
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0001-Handle-logging-syscall.patch
@@ -0,0 +1,32 @@
+From d6ee50f581b43b16733b8731369b071d609d5048 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Thu, 31 Aug 2023 10:51:54 +0100
+Subject: [PATCH] Handle logging syscall
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Upstream-Status:  Inappropriate [Other]
+---
+ core/arch/arm/kernel/spmc_sp_handler.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/core/arch/arm/kernel/spmc_sp_handler.c b/core/arch/arm/kernel/spmc_sp_handler.c
+index 1f218a0df..0676e8898 100644
+--- a/core/arch/arm/kernel/spmc_sp_handler.c
++++ b/core/arch/arm/kernel/spmc_sp_handler.c
+@@ -1276,7 +1276,12 @@ void spmc_sp_msg_handler(struct thread_smc_args *args,
+ 			handle_console_log(args);
+ 			sp_enter(args, caller_sp);
+ 			break;
+-
++		case 0xdeadbeef:
++			ts_push_current_session(&caller_sp->ts_sess);
++			IMSG("%s", (char *)args->a1);
++			ts_pop_current_session();
++			sp_enter(args, caller_sp);
++			break;
+ 		default:
+ 			EMSG("Unhandled FFA function ID %#"PRIx32,
+ 			     (uint32_t)args->a0);
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
index eaee7ae9..a883c345 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
@@ -1,3 +1,8 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/files/optee-os/corstone1000:"
+SRC_URI:append = " \
+                  file://0001-Handle-logging-syscall.patch \
+		  "
+
 COMPATIBLE_MACHINE = "corstone1000"
 
 OPTEEMACHINE = "corstone1000"
-- 
2.17.1


