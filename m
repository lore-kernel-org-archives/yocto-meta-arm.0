Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB76CC433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 16:18:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7538.1668442721860983886
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Nov 2022 08:18:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CBD0ED1
	for <meta-arm@lists.yoctoproject.org>; Mon, 14 Nov 2022 08:18:47 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E25EE3F663
	for <meta-arm@lists.yoctoproject.org>; Mon, 14 Nov 2022 08:18:40 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/hafnium: cleanup the patches
Date: Mon, 14 Nov 2022 09:32:12 -0500
Message-Id: <20221114143213.16026-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221114143213.16026-1-jon.mason@arm.com>
References: <20221114143213.16026-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 14 Nov 2022 16:18:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4126

Update the patches and renumber them to make it more obvious which
subtree they apply to.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...p-timer-register-accesses-using-cnth.patch | 26 +++++++++----------
 ...atch => 0001-tc-increase-heap-pages.patch} | 14 +++++-----
 ...interrupt-controller-register-access.patch | 16 +++++-------
 ...he-and-disable-branch-protection-fo.patch} |  5 +---
 ...-alignment-check-for-EL0-partitions.patch} | 20 +++++++-------
 ...E1_NS-while-mapping-memory-from-NWd.patch} |  7 ++---
 .../recipes-bsp/hafnium/hafnium-tc.inc        | 10 +++----
 ...g-native-to-find-the-libssl-headers.patch} |  5 +---
 .../0001-define-_Noreturn-if-needed.patch     |  5 ++--
 ...arm-hafnium-fix-kernel-tool-linking.patch} |  4 +--
 ...tch => 0003-Fix-build-with-clang-15.patch} |  0
 meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb   |  6 ++---
 12 files changed, 52 insertions(+), 66 deletions(-)
 rename meta-arm-bsp/recipes-bsp/hafnium/files/tc/{0003-tc-increase-heap-pages.patch => 0001-tc-increase-heap-pages.patch} (68%)
 rename meta-arm-bsp/recipes-bsp/hafnium/files/tc/{0006-feat-vhe-enable-vhe-and-disable-branch-protection-fo.patch => 0002-feat-vhe-enable-vhe-and-disable-branch-protection-fo.patch} (92%)
 rename meta-arm-bsp/recipes-bsp/hafnium/files/tc/{0004-feat-disable-alignment-check-for-EL0-partitions.patch => 0003-feat-disable-alignment-check-for-EL0-partitions.patch} (96%)
 rename meta-arm-bsp/recipes-bsp/hafnium/files/tc/{0005-feat-vhe-set-STAGE1_NS-while-mapping-memory-from-NWd.patch => 0004-feat-vhe-set-STAGE1_NS-while-mapping-memory-from-NWd.patch} (93%)
 rename meta-arm/recipes-bsp/hafnium/hafnium/{pkg-config-native.patch => 0001-Use-pkg-config-native-to-find-the-libssl-headers.patch} (92%)
 rename meta-arm/recipes-bsp/hafnium/hafnium/{host-ld.patch => 0002-arm-hafnium-fix-kernel-tool-linking.patch} (91%)
 rename meta-arm/recipes-bsp/hafnium/hafnium/{0001-Fix-build-with-clang-15.patch => 0003-Fix-build-with-clang-15.patch} (100%)

diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-feat-emulate-cntp-timer-register-accesses-using-cnth.patch b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-feat-emulate-cntp-timer-register-accesses-using-cnth.patch
index 7094c8bc..a9a839ea 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-feat-emulate-cntp-timer-register-accesses-using-cnth.patch
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-feat-emulate-cntp-timer-register-accesses-using-cnth.patch
@@ -1,7 +1,7 @@
-From c8bd941579fb062359b683b184b851eea2ddb761 Mon Sep 17 00:00:00 2001
+From f526797b83113cc64e3e658c22d8a5d269896a2a Mon Sep 17 00:00:00 2001
 From: Ben Horgan <ben.horgan@arm.com>
 Date: Fri, 4 Mar 2022 16:48:14 +0000
-Subject: [PATCH 1/5] feat: emulate cntp timer register accesses using cnthps
+Subject: [PATCH] feat: emulate cntp timer register accesses using cnthps
 
 Upstream-Status: Inappropriate [Experimental feature]
 Signed-off-by: Ben Horgan <ben.horgan@arm.com>
@@ -19,10 +19,10 @@ Change-Id: I67508203273baf3bd8e6be2d99717028db945715
  create mode 100644 src/arch/aarch64/hypervisor/timer_el1.h
 
 diff --git a/Makefile b/Makefile
-index c9fb16f..6371a8a 100644
+index 95cab9a5..21cca938 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -59,7 +59,8 @@ CHECKPATCH := $(CURDIR)/third_party/linux/scripts/checkpatch.pl \
+@@ -60,7 +60,8 @@ CHECKPATCH := $(CURDIR)/third_party/linux/scripts/checkpatch.pl \
  # debug_el1.c : uses XMACROS, which checkpatch doesn't understand.
  # perfmon.c : uses XMACROS, which checkpatch doesn't understand.
  # feature_id.c : uses XMACROS, which checkpatch doesn't understand.
@@ -33,7 +33,7 @@ index c9fb16f..6371a8a 100644
  OUT ?= out/$(PROJECT)
  OUT_DIR = out/$(PROJECT)
 diff --git a/src/arch/aarch64/hypervisor/BUILD.gn b/src/arch/aarch64/hypervisor/BUILD.gn
-index 6068d1e..de1a414 100644
+index 6068d1e8..de1a414d 100644
 --- a/src/arch/aarch64/hypervisor/BUILD.gn
 +++ b/src/arch/aarch64/hypervisor/BUILD.gn
 @@ -45,6 +45,7 @@ source_set("hypervisor") {
@@ -45,10 +45,10 @@ index 6068d1e..de1a414 100644
    ]
  
 diff --git a/src/arch/aarch64/hypervisor/cpu.c b/src/arch/aarch64/hypervisor/cpu.c
-index c6cebdd..cb41e6e 100644
+index bcf5ffce..d2df77d8 100644
 --- a/src/arch/aarch64/hypervisor/cpu.c
 +++ b/src/arch/aarch64/hypervisor/cpu.c
-@@ -91,13 +91,20 @@ void arch_regs_reset(struct vcpu *vcpu)
+@@ -98,13 +98,20 @@ void arch_regs_reset(struct vcpu *vcpu)
  	if (is_primary) {
  		/*
  		 * cnthctl_el2 is redefined when VHE is enabled.
@@ -72,7 +72,7 @@ index c6cebdd..cb41e6e 100644
  	}
  
 diff --git a/src/arch/aarch64/hypervisor/handler.c b/src/arch/aarch64/hypervisor/handler.c
-index cd64d68..c9068c5 100644
+index 4bd8a3b4..4c1b6e48 100644
 --- a/src/arch/aarch64/hypervisor/handler.c
 +++ b/src/arch/aarch64/hypervisor/handler.c
 @@ -34,6 +34,7 @@
@@ -83,7 +83,7 @@ index cd64d68..c9068c5 100644
  
  /**
   * Hypervisor Fault Address Register Non-Secure.
-@@ -1276,6 +1277,11 @@ void handle_system_register_access(uintreg_t esr_el2)
+@@ -1277,6 +1278,11 @@ void handle_system_register_access(uintreg_t esr_el2)
  			inject_el1_unknown_exception(vcpu, esr_el2);
  			return;
  		}
@@ -97,7 +97,7 @@ index cd64d68..c9068c5 100644
  		return;
 diff --git a/src/arch/aarch64/hypervisor/timer_el1.c b/src/arch/aarch64/hypervisor/timer_el1.c
 new file mode 100644
-index 0000000..c30e554
+index 00000000..c30e5543
 --- /dev/null
 +++ b/src/arch/aarch64/hypervisor/timer_el1.c
 @@ -0,0 +1,104 @@
@@ -207,7 +207,7 @@ index 0000000..c30e554
 +}
 diff --git a/src/arch/aarch64/hypervisor/timer_el1.h b/src/arch/aarch64/hypervisor/timer_el1.h
 new file mode 100644
-index 0000000..04a43b6
+index 00000000..04a43b6c
 --- /dev/null
 +++ b/src/arch/aarch64/hypervisor/timer_el1.h
 @@ -0,0 +1,20 @@
@@ -232,7 +232,7 @@ index 0000000..04a43b6
 +bool timer_el1_process_access(struct vcpu *vcpu, ffa_vm_id_t vm_id,
 +			      uintreg_t esr);
 diff --git a/src/arch/aarch64/msr.h b/src/arch/aarch64/msr.h
-index cd6778b..55e7833 100644
+index cd6778b4..55e78330 100644
 --- a/src/arch/aarch64/msr.h
 +++ b/src/arch/aarch64/msr.h
 @@ -126,3 +126,11 @@
@@ -247,6 +247,4 @@ index cd6778b..55e7833 100644
 +#define MSR_CNTHPS_CTL_EL2 S3_4_C14_C5_1
 +#define MSR_CNTHPS_CVAL_EL2 S3_4_C14_C5_2
 +#define MSR_CNTHPS_TVAL_EL2 S3_4_C14_C5_0
--- 
-2.17.1
 
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-tc-increase-heap-pages.patch b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-tc-increase-heap-pages.patch
similarity index 68%
rename from meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-tc-increase-heap-pages.patch
rename to meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-tc-increase-heap-pages.patch
index dfec5d83..fa35efc1 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-tc-increase-heap-pages.patch
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-tc-increase-heap-pages.patch
@@ -1,4 +1,4 @@
-From e918cc5179241e1d35ba4b465b035b74b88e55d2 Mon Sep 17 00:00:00 2001
+From 613dea068fa546956717ce0b60328e39d451f661 Mon Sep 17 00:00:00 2001
 From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Date: Fri, 29 Apr 2022 20:07:50 +0100
 Subject: [PATCH] tc: increase heap pages
@@ -6,14 +6,14 @@ Subject: [PATCH] tc: increase heap pages
 Upstream-Status: Pending
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 ---
- /BUILD.gn | 2 +-
+ BUILD.gn | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a//BUILD.gn b//BUILD.gn
-index 5d84d13..4ea0890 100644
---- a//BUILD.gn
-+++ b//BUILD.gn
-@@ -233,7 +233,7 @@ aarch64_toolchains("secure_tc") {
+diff --git a/BUILD.gn b/BUILD.gn
+index 6b9b383..62ba763 100644
+--- a/BUILD.gn
++++ b/BUILD.gn
+@@ -235,7 +235,7 @@ aarch64_toolchains("secure_tc") {
    gicd_base_address = "0x30000000"
    gicr_base_address = "0x30080000"
    gicr_frames = 8
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-feat-emulate-interrupt-controller-register-access.patch b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-feat-emulate-interrupt-controller-register-access.patch
index 95f1651a..d9ec6e2a 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-feat-emulate-interrupt-controller-register-access.patch
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-feat-emulate-interrupt-controller-register-access.patch
@@ -1,7 +1,7 @@
-From 380f2cf944dd5db36c168a11d31a46ad14cdcb6d Mon Sep 17 00:00:00 2001
+From 97a8ca1835f5d9512dacda497540d5523e56c7dd Mon Sep 17 00:00:00 2001
 From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Date: Tue, 26 Apr 2022 14:43:58 +0100
-Subject: [PATCH 4/5] feat: emulate interrupt controller register access
+Subject: [PATCH] feat: emulate interrupt controller register access
 
 This emulates ICC_SGI1R_EL1 and ICC_IGRPEN1_EL1 register
 
@@ -16,10 +16,10 @@ Upstream-Status: Inappropriate [Experimental feature]
  4 files changed, 97 insertions(+)
 
 diff --git a/src/arch/aarch64/hypervisor/handler.c b/src/arch/aarch64/hypervisor/handler.c
-index c9068c5..b9aa5d8 100644
+index 4c1b6e48..cd5146bd 100644
 --- a/src/arch/aarch64/hypervisor/handler.c
 +++ b/src/arch/aarch64/hypervisor/handler.c
-@@ -1282,6 +1282,11 @@ void handle_system_register_access(uintreg_t esr_el2)
+@@ -1283,6 +1283,11 @@ void handle_system_register_access(uintreg_t esr_el2)
  			inject_el1_unknown_exception(vcpu, esr_el2);
  			return;
  		}
@@ -32,7 +32,7 @@ index c9068c5..b9aa5d8 100644
  		inject_el1_unknown_exception(vcpu, esr_el2);
  		return;
 diff --git a/src/arch/aarch64/hypervisor/perfmon.c b/src/arch/aarch64/hypervisor/perfmon.c
-index f13b035..05e216c 100644
+index f13b0354..05e216c8 100644
 --- a/src/arch/aarch64/hypervisor/perfmon.c
 +++ b/src/arch/aarch64/hypervisor/perfmon.c
 @@ -116,6 +116,10 @@
@@ -131,7 +131,7 @@ index f13b035..05e216c 100644
 +	return true;
 +}
 diff --git a/src/arch/aarch64/hypervisor/perfmon.h b/src/arch/aarch64/hypervisor/perfmon.h
-index 81669ba..c90d45b 100644
+index 81669ba1..c90d45bf 100644
 --- a/src/arch/aarch64/hypervisor/perfmon.h
 +++ b/src/arch/aarch64/hypervisor/perfmon.h
 @@ -70,3 +70,8 @@ bool perfmon_process_access(struct vcpu *vcpu, ffa_vm_id_t vm_id,
@@ -144,7 +144,7 @@ index 81669ba..c90d45b 100644
 +bool intr_ctrl_el1_process_access(struct vcpu *vcpu, ffa_vm_id_t vm_id,
 +				  uintreg_t esr);
 diff --git a/src/arch/aarch64/msr.h b/src/arch/aarch64/msr.h
-index 55e7833..82aa884 100644
+index 55e78330..82aa8846 100644
 --- a/src/arch/aarch64/msr.h
 +++ b/src/arch/aarch64/msr.h
 @@ -134,3 +134,6 @@
@@ -154,6 +154,4 @@ index 55e7833..82aa884 100644
 +
 +#define ICC_IGRPEN1_EL1 S3_0_C12_C12_7
 +#define ICC_SGI1R_EL1 S3_0_C12_C11_5
--- 
-2.17.1
 
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0006-feat-vhe-enable-vhe-and-disable-branch-protection-fo.patch b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-feat-vhe-enable-vhe-and-disable-branch-protection-fo.patch
similarity index 92%
rename from meta-arm-bsp/recipes-bsp/hafnium/files/tc/0006-feat-vhe-enable-vhe-and-disable-branch-protection-fo.patch
rename to meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-feat-vhe-enable-vhe-and-disable-branch-protection-fo.patch
index 3139759e..9960f65d 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0006-feat-vhe-enable-vhe-and-disable-branch-protection-fo.patch
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-feat-vhe-enable-vhe-and-disable-branch-protection-fo.patch
@@ -1,4 +1,4 @@
-From c235511a06a54bcccec97b3067c1004d3957b1d8 Mon Sep 17 00:00:00 2001
+From 1fef5bd2504ce3a203c56a3b66dba773cd4893c6 Mon Sep 17 00:00:00 2001
 From: Davidson K <davidson.kumaresan@arm.com>
 Date: Thu, 8 Sep 2022 10:47:10 +0530
 Subject: [PATCH] feat(vhe): enable vhe and disable branch protection for TC
@@ -29,6 +29,3 @@ index 62ba763..f26ce03 100644
 +    enable_vhe = "1"
    }
  }
--- 
-2.34.1
-
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0004-feat-disable-alignment-check-for-EL0-partitions.patch b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-feat-disable-alignment-check-for-EL0-partitions.patch
similarity index 96%
rename from meta-arm-bsp/recipes-bsp/hafnium/files/tc/0004-feat-disable-alignment-check-for-EL0-partitions.patch
rename to meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-feat-disable-alignment-check-for-EL0-partitions.patch
index d1e10d0e..5e620cf3 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0004-feat-disable-alignment-check-for-EL0-partitions.patch
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-feat-disable-alignment-check-for-EL0-partitions.patch
@@ -1,4 +1,4 @@
-From 1e24b45a8ff34af45dda45c57f8403452d384f99 Mon Sep 17 00:00:00 2001
+From 1c4d28493faed6cf189c75fa91d19131e6a34e04 Mon Sep 17 00:00:00 2001
 From: Olivier Deprez <olivier.deprez@arm.com>
 Date: Mon, 8 Aug 2022 19:14:23 +0200
 Subject: [PATCH] feat: disable alignment check for EL0 partitions
@@ -40,7 +40,7 @@ Upstream-Status: Submitted [https://review.trustedfirmware.org/c/hafnium/hafnium
  8 files changed, 59 insertions(+), 30 deletions(-)
 
 diff --git a/src/arch/aarch64/hypervisor/cpu.c b/src/arch/aarch64/hypervisor/cpu.c
-index d2df77d..a000159 100644
+index d2df77d8..a000159b 100644
 --- a/src/arch/aarch64/hypervisor/cpu.c
 +++ b/src/arch/aarch64/hypervisor/cpu.c
 @@ -115,7 +115,9 @@ void arch_regs_reset(struct vcpu *vcpu)
@@ -69,7 +69,7 @@ index d2df77d..a000159 100644
  		r->lazy.vttbr_el2 = pa_addr(table) | ((uint64_t)vm_id << 48);
  #if SECURE_WORLD == 1
 diff --git a/src/arch/aarch64/hypervisor/exceptions.S b/src/arch/aarch64/hypervisor/exceptions.S
-index 539e196..d3732f8 100644
+index 539e196d..d3732f86 100644
 --- a/src/arch/aarch64/hypervisor/exceptions.S
 +++ b/src/arch/aarch64/hypervisor/exceptions.S
 @@ -20,6 +20,9 @@
@@ -147,7 +147,7 @@ index 539e196..d3732f8 100644
  	ret
  #endif
 diff --git a/src/arch/aarch64/hypervisor/feature_id.c b/src/arch/aarch64/hypervisor/feature_id.c
-index ed3bf8f..57f3262 100644
+index ed3bf8f1..57f32627 100644
 --- a/src/arch/aarch64/hypervisor/feature_id.c
 +++ b/src/arch/aarch64/hypervisor/feature_id.c
 @@ -175,7 +175,7 @@ void feature_set_traps(struct vm *vm, struct arch_regs *regs)
@@ -177,7 +177,7 @@ index ed3bf8f..57f3262 100644
  		vm->arch.tid3_masks.id_aa64isar1_el1 &= ~ID_AA64ISAR1_EL1_GPI;
  		vm->arch.tid3_masks.id_aa64isar1_el1 &= ~ID_AA64ISAR1_EL1_GPA;
 diff --git a/src/arch/aarch64/hypervisor/handler.c b/src/arch/aarch64/hypervisor/handler.c
-index cd5146b..8a3d628 100644
+index cd5146bd..8a3d6289 100644
 --- a/src/arch/aarch64/hypervisor/handler.c
 +++ b/src/arch/aarch64/hypervisor/handler.c
 @@ -272,9 +272,9 @@ noreturn void sync_current_exception_noreturn(uintreg_t elr, uintreg_t spsr)
@@ -241,7 +241,7 @@ index cd5146b..8a3d628 100644
  
  #if SECURE_WORLD == 1
 diff --git a/src/arch/aarch64/inc/hf/arch/types.h b/src/arch/aarch64/inc/hf/arch/types.h
-index 6379d73..6b8b24f 100644
+index 6379d73e..6b8b24f1 100644
 --- a/src/arch/aarch64/inc/hf/arch/types.h
 +++ b/src/arch/aarch64/inc/hf/arch/types.h
 @@ -79,8 +79,13 @@ struct arch_regs {
@@ -261,7 +261,7 @@ index 6379d73..6b8b24f 100644
  	/*
  	 * System registers.
 diff --git a/src/arch/aarch64/mm.c b/src/arch/aarch64/mm.c
-index 8ee65ca..487ae35 100644
+index 8ee65ca0..487ae353 100644
 --- a/src/arch/aarch64/mm.c
 +++ b/src/arch/aarch64/mm.c
 @@ -886,7 +886,7 @@ bool arch_mm_init(paddr_t table)
@@ -274,7 +274,7 @@ index 8ee65ca..487ae35 100644
  			     (0 << 30) |	    /* SA. */
  			     (0 << 29) |	    /* SW. */
 diff --git a/src/arch/aarch64/sysregs.c b/src/arch/aarch64/sysregs.c
-index e8c154b..087ba4e 100644
+index e8c154b1..087ba4ed 100644
 --- a/src/arch/aarch64/sysregs.c
 +++ b/src/arch/aarch64/sysregs.c
 @@ -159,7 +159,7 @@ uintreg_t get_cptr_el2_value(void)
@@ -303,7 +303,7 @@ index e8c154b..087ba4e 100644
  	sctlr_el2_value |= SCTLR_EL2_SA;
  	sctlr_el2_value |= SCTLR_EL2_I;
 diff --git a/src/arch/aarch64/sysregs.h b/src/arch/aarch64/sysregs.h
-index babd237..6fdab58 100644
+index babd2375..6fdab58e 100644
 --- a/src/arch/aarch64/sysregs.h
 +++ b/src/arch/aarch64/sysregs.h
 @@ -668,7 +668,7 @@ uintreg_t get_mdcr_el2_value(void);
@@ -315,6 +315,4 @@ index babd237..6fdab58 100644
  
  /**
   * Branch Target Identification mechanism support in AArch64 state.
--- 
-2.34.1
 
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0005-feat-vhe-set-STAGE1_NS-while-mapping-memory-from-NWd.patch b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0004-feat-vhe-set-STAGE1_NS-while-mapping-memory-from-NWd.patch
similarity index 93%
rename from meta-arm-bsp/recipes-bsp/hafnium/files/tc/0005-feat-vhe-set-STAGE1_NS-while-mapping-memory-from-NWd.patch
rename to meta-arm-bsp/recipes-bsp/hafnium/files/tc/0004-feat-vhe-set-STAGE1_NS-while-mapping-memory-from-NWd.patch
index 1808295d..cfa7cfb7 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0005-feat-vhe-set-STAGE1_NS-while-mapping-memory-from-NWd.patch
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0004-feat-vhe-set-STAGE1_NS-while-mapping-memory-from-NWd.patch
@@ -1,4 +1,4 @@
-From 02c8afc4f7315b4e12098ffeb8bd5e64e4891e78 Mon Sep 17 00:00:00 2001
+From 4b59905d2fec01cc17038b1c167b4e57e7835adf Mon Sep 17 00:00:00 2001
 From: Davidson K <davidson.kumaresan@arm.com>
 Date: Thu, 7 Oct 2021 12:20:08 +0530
 Subject: [PATCH] feat(vhe): set STAGE1_NS while mapping memory from NWd to SWd
@@ -17,7 +17,7 @@ Upstream-Status: Pending [Not submitted to upstream yet]
  1 file changed, 12 insertions(+)
 
 diff --git a/src/ffa_memory.c b/src/ffa_memory.c
-index 048cca9..8910cc7 100644
+index 048cca9c..8910cc79 100644
 --- a/src/ffa_memory.c
 +++ b/src/ffa_memory.c
 @@ -2483,6 +2483,18 @@ struct ffa_value ffa_memory_retrieve(struct vm_locked to_locked,
@@ -39,6 +39,3 @@ index 048cca9..8910cc7 100644
  	ret = ffa_retrieve_check_update(
  		to_locked, memory_region->sender, share_state->fragments,
  		share_state->fragment_constituent_counts,
--- 
-2.34.1
-
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc b/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
index 6dd08ad0..433d5612 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
+++ b/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
@@ -9,15 +9,15 @@ PV = "2.7+git${SRCPV}"
 
 FILESEXTRAPATHS:prepend:tc := "${THISDIR}/files/tc:"
 
-SRC_URI:remove = "file://0001-Fix-build-with-clang-15.patch"
+SRC_URI:remove = "file://0003-Fix-build-with-clang-15.patch"
 
 SRC_URI:append = " \
         file://0001-feat-emulate-cntp-timer-register-accesses-using-cnth.patch \
         file://0002-feat-emulate-interrupt-controller-register-access.patch \
-        file://0003-tc-increase-heap-pages.patch;patchdir=project/reference \
-        file://0004-feat-disable-alignment-check-for-EL0-partitions.patch \
-        file://0005-feat-vhe-set-STAGE1_NS-while-mapping-memory-from-NWd.patch \
-        file://0006-feat-vhe-enable-vhe-and-disable-branch-protection-fo.patch;patchdir=project/reference \
+        file://0003-feat-disable-alignment-check-for-EL0-partitions.patch \
+        file://0004-feat-vhe-set-STAGE1_NS-while-mapping-memory-from-NWd.patch \
+        file://0001-tc-increase-heap-pages.patch;patchdir=project/reference \
+        file://0002-feat-vhe-enable-vhe-and-disable-branch-protection-fo.patch;patchdir=project/reference \
         "
 
 do_compile() {
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/pkg-config-native.patch b/meta-arm/recipes-bsp/hafnium/hafnium/0001-Use-pkg-config-native-to-find-the-libssl-headers.patch
similarity index 92%
rename from meta-arm/recipes-bsp/hafnium/hafnium/pkg-config-native.patch
rename to meta-arm/recipes-bsp/hafnium/hafnium/0001-Use-pkg-config-native-to-find-the-libssl-headers.patch
index 40129acf..a9a487f0 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium/pkg-config-native.patch
+++ b/meta-arm/recipes-bsp/hafnium/hafnium/0001-Use-pkg-config-native-to-find-the-libssl-headers.patch
@@ -1,4 +1,4 @@
-From b0405e0e25740ca0ea8b75d9b3b4f35b39d82e0e Mon Sep 17 00:00:00 2001
+From 60b8c4e852cbe76c383d5c495ecc8aeb84b407b6 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Sat, 17 Jul 2021 14:38:02 -0500
 Subject: [PATCH] Use pkg-config-native to find the libssl headers.
@@ -24,6 +24,3 @@ index 9adb6d247..5fe371c7d 100644
  
  hostprogs-always-$(CONFIG_BUILD_BIN2C)			+= bin2c
  hostprogs-always-$(CONFIG_KALLSYMS)			+= kallsyms
--- 
-2.30.2
-
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/0001-define-_Noreturn-if-needed.patch b/meta-arm/recipes-bsp/hafnium/hafnium/0001-define-_Noreturn-if-needed.patch
index 7c6a8b2a..8353fc12 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium/0001-define-_Noreturn-if-needed.patch
+++ b/meta-arm/recipes-bsp/hafnium/hafnium/0001-define-_Noreturn-if-needed.patch
@@ -1,4 +1,4 @@
-From a433727e0fe8424db984f3afa2bda898dd517e9d Mon Sep 17 00:00:00 2001
+From 3da6c62e6f56facf9c6a8d7d46fa9509e76f482e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 19 Apr 2022 22:32:56 -0700
 Subject: [PATCH] define _Noreturn if needed
@@ -18,7 +18,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/inc/hf/panic.h b/inc/hf/panic.h
-index ec864e4..588f119 100644
+index ec864e4f..588f1193 100644
 --- a/inc/hf/panic.h
 +++ b/inc/hf/panic.h
 @@ -10,4 +10,8 @@
@@ -30,3 +30,4 @@ index ec864e4..588f119 100644
 +#endif
 +
  noreturn void panic(const char *fmt, ...);
+
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/host-ld.patch b/meta-arm/recipes-bsp/hafnium/hafnium/0002-arm-hafnium-fix-kernel-tool-linking.patch
similarity index 91%
rename from meta-arm/recipes-bsp/hafnium/hafnium/host-ld.patch
rename to meta-arm/recipes-bsp/hafnium/hafnium/0002-arm-hafnium-fix-kernel-tool-linking.patch
index 2a342390..5c69b788 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium/host-ld.patch
+++ b/meta-arm/recipes-bsp/hafnium/hafnium/0002-arm-hafnium-fix-kernel-tool-linking.patch
@@ -1,4 +1,4 @@
-From 9b1b93184c365a07b340c9404a6a0581e971bd54 Mon Sep 17 00:00:00 2001
+From b54c7b4d325b7effbebe5bdd86d0cfceedb66b9d Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Tue, 9 Nov 2021 23:31:22 +0000
 Subject: [PATCH] arm/hafnium: fix kernel tool linking
@@ -17,7 +17,7 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/build/linux/linux.gni b/build/linux/linux.gni
-index 45860fa..b010254 100644
+index 45860fab..b0102544 100644
 --- a/build/linux/linux.gni
 +++ b/build/linux/linux.gni
 @@ -60,6 +60,7 @@ template("linux_kernel") {
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/0001-Fix-build-with-clang-15.patch b/meta-arm/recipes-bsp/hafnium/hafnium/0003-Fix-build-with-clang-15.patch
similarity index 100%
rename from meta-arm/recipes-bsp/hafnium/hafnium/0001-Fix-build-with-clang-15.patch
rename to meta-arm/recipes-bsp/hafnium/hafnium/0003-Fix-build-with-clang-15.patch
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb b/meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb
index 0c4e2941..ebf13730 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb
@@ -15,9 +15,9 @@ inherit deploy python3native pkgconfig ${CLANGNATIVE}
 
 SRC_URI = "gitsm://git.trustedfirmware.org/hafnium/hafnium.git;protocol=https;branch=master \
            file://0001-define-_Noreturn-if-needed.patch \
-           file://host-ld.patch \
-           file://pkg-config-native.patch;patchdir=third_party/linux \
-           file://0001-Fix-build-with-clang-15.patch \
+           file://0002-arm-hafnium-fix-kernel-tool-linking.patch  \
+           file://0003-Fix-build-with-clang-15.patch \
+           file://0001-Use-pkg-config-native-to-find-the-libssl-headers.patch;patchdir=third_party/linux \
           "
 SRCREV = "79e9522d26fc2a88a44af149034acc27312b73a1"
 S = "${WORKDIR}/git"
-- 
2.17.1


