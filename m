Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.19124.1625652292877396315
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 Jul 2021 03:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: damodar.santhapuri@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4422ED1;
	Wed,  7 Jul 2021 03:04:51 -0700 (PDT)
Received: from a077431.blr.arm.com (a077431.blr.arm.com [10.162.16.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 760283F694;
	Wed,  7 Jul 2021 03:04:50 -0700 (PDT)
From: "Damodar Santhapuri" <damodar.santhapuri@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Damodar Santhapuri <damodar.santhapuri@arm.com>
Subject: [PATCH] arm/scp-firmware: Fix secondary cpus boot issue
Date: Wed,  7 Jul 2021 15:34:33 +0530
Message-Id: <20210707100433.12855-1-damodar.santhapuri@arm.com>
X-Mailer: git-send-email 2.17.1

The below assertion is observed in linux kernel booting secondary cpus.
fix is available in scp-firmware's master.

ASSERT: drivers/arm/css/scmi/scmi_pwr_dmn_proto.c:48
BACKTRACE: START: assert
0: EL3: 0x400557c
1: EL3: 0x40031b8
2: EL3: 0x400abec
3: EL3: 0x4006898
4: EL3: 0x4008c70
5: EL3: 0x4008a48
6: EL3: 0x4009d60
7: EL3: 0x400af74
8: EL3: 0x40053e8
BACKTRACE: END: assert

Change-Id: I79ec7007aadbe9947368cb471da159cbb965e04c
Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
---
 ...and-length-volatile-for-mod_smt_memo.patch | 47 +++++++++++++++++++
 .../scp-firmware/scp-firmware_2.8.0.bb        |  5 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-bsp/scp-firmware/files/0001-smt-Make-status-and-length-volatile-for-mod_smt_memo.patch

diff --git a/meta-arm/recipes-bsp/scp-firmware/files/0001-smt-Make-status-and-length-volatile-for-mod_smt_memo.patch b/meta-arm/recipes-bsp/scp-firmware/files/0001-smt-Make-status-and-length-volatile-for-mod_smt_memo.patch
new file mode 100644
index 0000000..a4b08ed
--- /dev/null
+++ b/meta-arm/recipes-bsp/scp-firmware/files/0001-smt-Make-status-and-length-volatile-for-mod_smt_memo.patch
@@ -0,0 +1,47 @@
+From d13b4f81287ef957365c3fe68c3d8e17427cb364 Mon Sep 17 00:00:00 2001
+From: Nicola Mazzucato <nicola.mazzucato@arm.com>
+Date: Wed, 12 May 2021 15:20:58 +0100
+Subject: [PATCH] smt: Make status and length volatile for mod_smt_memory
+
+There is an intermittent error on TF-A side when reading the mailbox.
+The error is due to the mailbox message length not matching the expectation:
+    ASSERT: drivers/arm/css/scmi/scmi_pwr_dmn_proto.c:48
+
+This is due to a race between SCP writing the data and TF-A reading them.
+
+Effectively, the compiler seems to perform some minor optimisations with the
+local mod_smt_memory resulting in the expected writing sequence to be altered.
+This is seen in smt_respond().
+
+To remove such optimisations, force the length and status to be volatile.
+With this patch the sequence of writing into smt is restored and the error
+in TF-A disappears.
+
+Change-Id: I0127b9aa3cd1b54643ffdb2ca5ddce9fc9569bea
+Signed-off-by: Nicola Mazzucato <nicola.mazzucato@arm.com>
+Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
+Upstream-Status: Backport
+---
+ module/smt/include/internal/smt.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/module/smt/include/internal/smt.h b/module/smt/include/internal/smt.h
+index 1a615a36..d9f3f423 100644
+--- a/module/smt/include/internal/smt.h
++++ b/module/smt/include/internal/smt.h
+@@ -12,10 +12,10 @@
+ 
+ struct mod_smt_memory {
+     uint32_t reserved0;
+-    uint32_t status;
++    volatile uint32_t status;
+     uint64_t reserved1;
+     uint32_t flags;
+-    uint32_t length; /* message_header + payload */
++    volatile uint32_t length; /* message_header + payload */
+     uint32_t message_header;
+     uint32_t payload[];
+ };
+-- 
+2.17.1
+
diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb
index c58e621..ca7017a 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb
@@ -6,7 +6,10 @@ LICENSE = "BSD-3-Clause & Apache-2.0"
 LIC_FILES_CHKSUM = "file://license.md;beginline=5;md5=9db9e3d2fb8d9300a6c3d15101b19731 \
                     file://contrib/cmsis/git/LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
 
-SRC_URI = "gitsm://github.com/ARM-software/SCP-firmware.git;protocol=https"
+SRC_URI = "\
+    gitsm://github.com/ARM-software/SCP-firmware.git;protocol=https \
+    file://0001-smt-Make-status-and-length-volatile-for-mod_smt_memo.patch \
+"
 SRCREV  = "043de77f220a0b4b0ec3aa367bd515a9e9df2a29"
 
 PROVIDES += "virtual/control-processor-firmware"
-- 
2.17.1

