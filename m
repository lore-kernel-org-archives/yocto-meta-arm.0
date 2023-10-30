Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF50C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 15:46:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.152716.1698680783573311455
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Oct 2023 08:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C80E0FEC
	for <meta-arm@lists.yoctoproject.org>; Mon, 30 Oct 2023 08:47:04 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E49E13F64C
	for <meta-arm@lists.yoctoproject.org>; Mon, 30 Oct 2023 08:46:22 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/hafnium: update to v2.9
Date: Mon, 30 Oct 2023 09:19:18 -0500
Message-Id: <20231030141918.3961840-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Oct 2023 15:46:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5187

Updating to the latest version of hafnium.  Also, dropping tc patches,
as they are either experimental or a similar feature has been added.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...p-timer-register-accesses-using-cnth.patch | 249 ------------------
 ...vhe-and-disable-branch-protection-fo.patch |  32 ---
 ...interrupt-controller-register-access.patch | 156 -----------
 ...GE1_NS-while-mapping-memory-from-NWd.patch |  41 ---
 .../recipes-bsp/hafnium/hafnium-tc.inc        |   9 -
 ...ig-native-to-find-the-libssl-headers.patch |   4 +-
 ...-arm-hafnium-fix-kernel-tool-linking.patch |   2 +-
 .../0001-work-around-visibility-issue.patch   |   4 +-
 .../0002-Fix-build-with-clang-15.patch        | 101 -------
 .../{hafnium_2.8.bb =3D> hafnium_2.9.bb}        |   3 +-
 10 files changed, 6 insertions(+), 595 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-feat-e=
mulate-cntp-timer-register-accesses-using-cnth.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-feat-v=
he-enable-vhe-and-disable-branch-protection-fo.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-feat-e=
mulate-interrupt-controller-register-access.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-feat-v=
he-set-STAGE1_NS-while-mapping-memory-from-NWd.patch
 delete mode 100644 meta-arm/recipes-bsp/hafnium/hafnium/0002-Fix-build-w=
ith-clang-15.patch
 rename meta-arm/recipes-bsp/hafnium/{hafnium_2.8.bb =3D> hafnium_2.9.bb}=
 (95%)

diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-feat-emulate-=
cntp-timer-register-accesses-using-cnth.patch b/meta-arm-bsp/recipes-bsp/=
hafnium/files/tc/0001-feat-emulate-cntp-timer-register-accesses-using-cnt=
h.patch
deleted file mode 100644
index 9ae4b39f..00000000
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-feat-emulate-cntp-ti=
mer-register-accesses-using-cnth.patch
+++ /dev/null
@@ -1,249 +0,0 @@
-From 3bc797e097ef2b29acf36560e4d2bfeec31f8d81 Mon Sep 17 00:00:00 2001
-From: Ben Horgan <ben.horgan@arm.com>
-Date: Fri, 4 Mar 2022 16:48:14 +0000
-Subject: [PATCH] feat: emulate cntp timer register accesses using cnthps
-
-Upstream-Status: Inappropriate [Experimental feature]
-Signed-off-by: Ben Horgan <ben.horgan@arm.com>
-Change-Id: I67508203273baf3bd8e6be2d99717028db945715
----
- Makefile                                |   3 +-
- src/arch/aarch64/hypervisor/BUILD.gn    |   1 +
- src/arch/aarch64/hypervisor/cpu.c       |  11 ++-
- src/arch/aarch64/hypervisor/handler.c   |   6 ++
- src/arch/aarch64/hypervisor/timer_el1.c | 104 ++++++++++++++++++++++++
- src/arch/aarch64/hypervisor/timer_el1.h |  20 +++++
- src/arch/aarch64/msr.h                  |   8 ++
- 7 files changed, 150 insertions(+), 3 deletions(-)
- create mode 100644 src/arch/aarch64/hypervisor/timer_el1.c
- create mode 100644 src/arch/aarch64/hypervisor/timer_el1.h
-
-diff --git a/Makefile b/Makefile
-index 95cab9a56bfd..21cca938531d 100644
---- a/Makefile
-+++ b/Makefile
-@@ -60,7 +60,8 @@ CHECKPATCH :=3D $(CURDIR)/third_party/linux/scripts/ch=
eckpatch.pl \
- # debug_el1.c : uses XMACROS, which checkpatch doesn't understand.
- # perfmon.c : uses XMACROS, which checkpatch doesn't understand.
- # feature_id.c : uses XMACROS, which checkpatch doesn't understand.
--CHECKPATCH_IGNORE :=3D "src/arch/aarch64/hypervisor/debug_el1.c\|src/ar=
ch/aarch64/hypervisor/perfmon.c\|src/arch/aarch64/hypervisor/feature_id.c=
"
-+# timer_el1.c : uses XMACROS, which checkpatch doesn't understand.
-+CHECKPATCH_IGNORE :=3D "src/arch/aarch64/hypervisor/debug_el1.c\|src/ar=
ch/aarch64/hypervisor/perfmon.c\|src/arch/aarch64/hypervisor/feature_id.c=
\|src/arch/aarch64/hypervisor/timer_el1.c"
-=20
- OUT ?=3D out/$(PROJECT)
- OUT_DIR =3D out/$(PROJECT)
-diff --git a/src/arch/aarch64/hypervisor/BUILD.gn b/src/arch/aarch64/hyp=
ervisor/BUILD.gn
-index 6068d1e8f075..de1a414dac68 100644
---- a/src/arch/aarch64/hypervisor/BUILD.gn
-+++ b/src/arch/aarch64/hypervisor/BUILD.gn
-@@ -45,6 +45,7 @@ source_set("hypervisor") {
-     "handler.c",
-     "perfmon.c",
-     "psci_handler.c",
-+    "timer_el1.c",
-     "vm.c",
-   ]
-=20
-diff --git a/src/arch/aarch64/hypervisor/cpu.c b/src/arch/aarch64/hyperv=
isor/cpu.c
-index 5e025b596674..edd5df134cfc 100644
---- a/src/arch/aarch64/hypervisor/cpu.c
-+++ b/src/arch/aarch64/hypervisor/cpu.c
-@@ -98,13 +98,20 @@ void arch_regs_reset(struct vcpu *vcpu)
- 	if (is_primary) {
- 		/*
- 		 * cnthctl_el2 is redefined when VHE is enabled.
--		 * EL1PCTEN, don't trap phys cnt access.
--		 * EL1PCEN, don't trap phys timer access.
-+		 * EL1PCTEN, don't trap phys cnt access. Except when in
-+		 * secure world without vhe.
-+		 * EL1PCEN, don't trap phys timer access. Except when in
-+		 * secure world without vhe.
- 		 */
- 		if (has_vhe_support()) {
- 			cnthctl |=3D (1U << 10) | (1U << 11);
- 		} else {
-+#if SECURE_WORLD =3D=3D 1
-+			cnthctl &=3D ~(1U << 0);
-+			cnthctl &=3D ~(1U << 1);
-+#else
- 			cnthctl |=3D (1U << 0) | (1U << 1);
-+#endif
- 		}
- 	}
-=20
-diff --git a/src/arch/aarch64/hypervisor/handler.c b/src/arch/aarch64/hy=
pervisor/handler.c
-index 3422ff7b8265..c495df40f3f5 100644
---- a/src/arch/aarch64/hypervisor/handler.c
-+++ b/src/arch/aarch64/hypervisor/handler.c
-@@ -34,6 +34,7 @@
- #include "psci_handler.h"
- #include "smc.h"
- #include "sysregs.h"
-+#include "timer_el1.h"
-=20
- /**
-  * Hypervisor Fault Address Register Non-Secure.
-@@ -1295,6 +1296,11 @@ void handle_system_register_access(uintreg_t esr_=
el2)
- 			inject_el1_sysreg_trap_exception(vcpu, esr_el2);
- 			return;
- 		}
-+	} else if (timer_el1_is_register_access(esr_el2)) {
-+		if (!timer_el1_process_access(vcpu, vm_id, esr_el2)) {
-+			inject_el1_unknown_exception(vcpu, esr_el2);
-+			return;
-+		}
- 	} else {
- 		inject_el1_sysreg_trap_exception(vcpu, esr_el2);
- 		return;
-diff --git a/src/arch/aarch64/hypervisor/timer_el1.c b/src/arch/aarch64/=
hypervisor/timer_el1.c
-new file mode 100644
-index 000000000000..c30e5543f436
---- /dev/null
-+++ b/src/arch/aarch64/hypervisor/timer_el1.c
-@@ -0,0 +1,104 @@
-+/*
-+ * Copyright 2022 The Hafnium Authors.
-+ *
-+ * Use of this source code is governed by a BSD-style
-+ * license that can be found in the LICENSE file or at
-+ * https://opensource.org/licenses/BSD-3-Clause.
-+ */
-+
-+#include "timer_el1.h"
-+
-+#include "hf/dlog.h"
-+
-+#include "msr.h"
-+#include "sysregs.h"
-+
-+/*
-+ * Physical timer (CNTP) register encodings as defined in
-+ * table D13-8 of the ARMv8 ARM (DDI0487F).
-+ * TYPE, op0, op1, crn, crm, op2
-+ * The register names are the concatenation of
-+ * "CNTP_", TYPE and "_EL2".
-+ */
-+#define CNTP_REGISTERS          \
-+	X(CTL,  3, 3, 14, 2, 1) \
-+	X(CVAL, 3, 3, 14, 2, 2) \
-+	X(TVAL, 3, 3, 14, 2, 0) \
-+
-+bool timer_el1_is_register_access(uintreg_t esr)
-+{
-+	uintreg_t sys_register =3D GET_ISS_SYSREG(esr);
-+	bool is_timer_access;
-+	switch (sys_register) {
-+#define X(type, op0, op1, crn, crm, op2)                  \
-+	case (GET_ISS_ENCODING(op0, op1, crn, crm, op2)): \
-+		is_timer_access =3D true;                   \
-+		break;
-+			CNTP_REGISTERS
-+#undef X
-+	case (GET_ISS_ENCODING(3, 3, 14, 0, 1)):
-+		is_timer_access =3D true;
-+		break;
-+	default:
-+		is_timer_access =3D false;
-+	}
-+
-+	return is_timer_access;
-+}
-+
-+/* Accesses to CNTP timer emulated with CNTHPS */
-+bool timer_el1_process_access(struct vcpu *vcpu, ffa_vm_id_t vm_id,
-+			      uintreg_t esr)
-+{
-+	uintreg_t sys_register =3D GET_ISS_SYSREG(esr);
-+	uintreg_t rt_register =3D GET_ISS_RT(esr);
-+	uintreg_t value;
-+
-+	if (ISS_IS_READ(esr)) {
-+		switch (sys_register) {
-+#define X(type, op0, op1, crn, crm, op2)                           \
-+		case (GET_ISS_ENCODING(op0, op1, crn, crm, op2)):  \
-+			value =3D read_msr(MSR_CNTHPS_##type##_EL2); \
-+			vcpu->regs.r[rt_register] =3D value;         \
-+			break;
-+				CNTP_REGISTERS
-+#undef X
-+		case (GET_ISS_ENCODING(3, 3, 14, 0, 1)):
-+			value =3D read_msr(cntpct_el0);
-+			vcpu->regs.r[rt_register] =3D value;
-+			break;
-+		default:
-+			dlog_notice(
-+				"Unsupported timer register "
-+				"read: "
-+				"op0=3D%d, op1=3D%d, crn=3D%d, crm=3D%d, op2=3D%d, "
-+				"rt=3D%d.\n",
-+				GET_ISS_OP0(esr), GET_ISS_OP1(esr),
-+				GET_ISS_CRN(esr), GET_ISS_CRM(esr),
-+				GET_ISS_OP2(esr), GET_ISS_RT(esr));
-+			break;
-+		}
-+	} else {
-+		value =3D vcpu->regs.r[rt_register];
-+		switch (sys_register) {
-+#define X(type, op0, op1, crn, crm, op2)                           \
-+		case (GET_ISS_ENCODING(op0, op1, crn, crm, op2)):  \
-+			write_msr(MSR_CNTHPS_##type##_EL2, value); \
-+			break;
-+				CNTP_REGISTERS
-+#undef X
-+		default:
-+			dlog_notice(
-+				"Unsupported timer register "
-+				"write: "
-+				"op0=3D%d, op1=3D%d, crn=3D%d, crm=3D%d, op2=3D%d, "
-+				"rt=3D%d, value=3D%d.\n",
-+				GET_ISS_OP0(esr), GET_ISS_OP1(esr),
-+				GET_ISS_CRN(esr), GET_ISS_CRM(esr),
-+				GET_ISS_OP2(esr), GET_ISS_RT(esr), value);
-+			break;
-+		}
-+	}
-+
-+	return true;
-+}
-diff --git a/src/arch/aarch64/hypervisor/timer_el1.h b/src/arch/aarch64/=
hypervisor/timer_el1.h
-new file mode 100644
-index 000000000000..04a43b6ca335
---- /dev/null
-+++ b/src/arch/aarch64/hypervisor/timer_el1.h
-@@ -0,0 +1,20 @@
-+/*
-+ * Copyright 2022 The Hafnium Authors.
-+ *
-+ * Use of this source code is governed by a BSD-style
-+ * license that can be found in the LICENSE file or at
-+ * https://opensource.org/licenses/BSD-3-Clause.
-+ */
-+
-+#pragma once
-+
-+#include "hf/arch/types.h"
-+
-+#include "hf/cpu.h"
-+
-+#include "vmapi/hf/ffa.h"
-+
-+bool timer_el1_is_register_access(uintreg_t esr);
-+
-+bool timer_el1_process_access(struct vcpu *vcpu, ffa_vm_id_t vm_id,
-+			      uintreg_t esr);
-diff --git a/src/arch/aarch64/msr.h b/src/arch/aarch64/msr.h
-index 6edc39f2af48..bf1a66d1d4c5 100644
---- a/src/arch/aarch64/msr.h
-+++ b/src/arch/aarch64/msr.h
-@@ -131,3 +131,11 @@
- #define MSR_ELR_EL12 S3_5_C4_C0_1
-=20
- #endif
-+
-+/*
-+ * Secure EL2 Physical timer (CNTHPS) register encodings as defined in
-+ * table D13-8 of the ARMv8 ARM (DDI0487F).
-+ */
-+#define MSR_CNTHPS_CTL_EL2 S3_4_C14_C5_1
-+#define MSR_CNTHPS_CVAL_EL2 S3_4_C14_C5_2
-+#define MSR_CNTHPS_TVAL_EL2 S3_4_C14_C5_0
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-feat-vhe-enab=
le-vhe-and-disable-branch-protection-fo.patch b/meta-arm-bsp/recipes-bsp/=
hafnium/files/tc/0001-feat-vhe-enable-vhe-and-disable-branch-protection-f=
o.patch
deleted file mode 100644
index 9627a765..00000000
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-feat-vhe-enable-vhe-=
and-disable-branch-protection-fo.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 1fef5bd2504ce3a203c56a3b66dba773cd4893c6 Mon Sep 17 00:00:00 2001
-From: Davidson K <davidson.kumaresan@arm.com>
-Date: Thu, 8 Sep 2022 10:47:10 +0530
-Subject: [PATCH] feat(vhe): enable vhe and disable branch protection for=
 TC
-
-Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
-Change-Id: I60cd607d9f2bf0114b482980e7ca68e24aaf4d1f
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- BUILD.gn | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/BUILD.gn b/BUILD.gn
-index cc6a78f4fdb8..acd1f9d1634b 100644
---- a/BUILD.gn
-+++ b/BUILD.gn
-@@ -245,7 +245,6 @@ aarch64_toolchains("secure_tc") {
-   heap_pages =3D 180
-   max_cpus =3D 8
-   max_vms =3D 16
--  branch_protection =3D "standard"
-   toolchain_args =3D {
-     plat_ffa =3D "//src/arch/aarch64/plat/ffa:spmc"
-     plat_psci =3D "//src/arch/aarch64/plat/psci:spmc"
-@@ -254,6 +253,7 @@ aarch64_toolchains("secure_tc") {
-     secure_world =3D "1"
-     pl011_base_address =3D "0x7ff80000"
-     enable_mte =3D "1"
-+    enable_vhe =3D "1"
-     plat_log_level =3D "LOG_LEVEL_INFO"
-   }
- }
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-feat-emulate-=
interrupt-controller-register-access.patch b/meta-arm-bsp/recipes-bsp/haf=
nium/files/tc/0002-feat-emulate-interrupt-controller-register-access.patc=
h
deleted file mode 100644
index 3e676151..00000000
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-feat-emulate-interru=
pt-controller-register-access.patch
+++ /dev/null
@@ -1,156 +0,0 @@
-From 9f5b07e30c82713b9598ea60d9f802bd419b560f Mon Sep 17 00:00:00 2001
-From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Date: Tue, 26 Apr 2022 14:43:58 +0100
-Subject: [PATCH] feat: emulate interrupt controller register access
-
-This emulates ICC_SGI1R_EL1 and ICC_IGRPEN1_EL1 register
-
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Change-Id: I0c11f034f3676067597461a183a341c809adcaa4
-Upstream-Status: Inappropriate [Experimental feature]
----
- src/arch/aarch64/hypervisor/handler.c |  5 ++
- src/arch/aarch64/hypervisor/perfmon.c | 84 +++++++++++++++++++++++++++
- src/arch/aarch64/hypervisor/perfmon.h |  5 ++
- src/arch/aarch64/msr.h                |  3 +
- 4 files changed, 97 insertions(+)
-
-diff --git a/src/arch/aarch64/hypervisor/handler.c b/src/arch/aarch64/hy=
pervisor/handler.c
-index c495df40f3f5..13578fc99670 100644
---- a/src/arch/aarch64/hypervisor/handler.c
-+++ b/src/arch/aarch64/hypervisor/handler.c
-@@ -1301,6 +1301,11 @@ void handle_system_register_access(uintreg_t esr_=
el2)
- 			inject_el1_unknown_exception(vcpu, esr_el2);
- 			return;
- 		}
-+	} else if (intr_ctrl_is_register_access(esr_el2)) {
-+		if (!intr_ctrl_el1_process_access(vcpu, vm_id, esr_el2)) {
-+			inject_el1_unknown_exception(vcpu, esr_el2);
-+			return;
-+		}
- 	} else {
- 		inject_el1_sysreg_trap_exception(vcpu, esr_el2);
- 		return;
-diff --git a/src/arch/aarch64/hypervisor/perfmon.c b/src/arch/aarch64/hy=
pervisor/perfmon.c
-index f13b035480d8..05e216c84c2e 100644
---- a/src/arch/aarch64/hypervisor/perfmon.c
-+++ b/src/arch/aarch64/hypervisor/perfmon.c
-@@ -116,6 +116,10 @@
- 	X(PMEVTYPER30_EL0   , 3, 3, 14, 15, 6) \
- 	X(PMCCFILTR_EL0     , 3, 3, 14, 15, 7)
-=20
-+#define INTR_CTRL_REGISTERS                    \
-+	X(ICC_IGRPEN1_EL1   , 3, 0, 12, 12, 7) \
-+	X(ICC_SGI1R_EL1     , 3, 0, 12, 11, 5) \
-+
- /* clang-format on */
-=20
- /**
-@@ -232,3 +236,83 @@ uintreg_t perfmon_get_pmccfiltr_el0_init_value(ffa_=
vm_id_t vm_id)
-=20
- 	return 0;
- }
-+
-+bool intr_ctrl_is_register_access(uintreg_t esr)
-+{
-+	uintreg_t op0 =3D GET_ISS_OP0(esr);
-+	uintreg_t op1 =3D GET_ISS_OP1(esr);
-+	uintreg_t crn =3D GET_ISS_CRN(esr);
-+	uintreg_t crm =3D GET_ISS_CRM(esr);
-+
-+	if (op0 =3D=3D 3 && op1 =3D=3D 0 && crn =3D=3D 12 && crm =3D=3D 12) {
-+		return true;
-+	}
-+
-+	if (op0 =3D=3D 3 && op1 =3D=3D 0 && crn =3D=3D 12 && crm =3D=3D 11) {
-+		return true;
-+	}
-+
-+	return false;
-+}
-+
-+bool intr_ctrl_el1_process_access(struct vcpu *vcpu, ffa_vm_id_t vm_id,
-+				  uintreg_t esr)
-+{
-+	uintreg_t sys_register =3D GET_ISS_SYSREG(esr);
-+	uintreg_t rt_register =3D GET_ISS_RT(esr);
-+	uintreg_t value;
-+
-+	/* +1 because Rt can access register XZR */
-+	CHECK(rt_register < NUM_GP_REGS + 1);
-+
-+	if (ISS_IS_READ(esr)) {
-+		switch (sys_register) {
-+#define X(reg_name, op0, op1, crn, crm, op2)              \
-+	case (GET_ISS_ENCODING(op0, op1, crn, crm, op2)): \
-+		value =3D read_msr(reg_name);               \
-+		break;
-+			INTR_CTRL_REGISTERS
-+#undef X
-+		default:
-+			value =3D vcpu->regs.r[rt_register];
-+			dlog_notice(
-+				"Unsupported interrupt control register "
-+				"read: "
-+				"op0=3D%d, op1=3D%d, crn=3D%d, crm=3D%d, op2=3D%d, "
-+				"rt=3D%d.\n",
-+				GET_ISS_OP0(esr), GET_ISS_OP1(esr),
-+				GET_ISS_CRN(esr), GET_ISS_CRM(esr),
-+				GET_ISS_OP2(esr), GET_ISS_RT(esr));
-+			break;
-+		}
-+		if (rt_register !=3D RT_REG_XZR) {
-+			vcpu->regs.r[rt_register] =3D value;
-+		}
-+	} else {
-+		if (rt_register !=3D RT_REG_XZR) {
-+			value =3D vcpu->regs.r[rt_register];
-+		} else {
-+			value =3D 0;
-+		}
-+		switch (sys_register) {
-+#define X(reg_name, op0, op1, crn, crm, op2)              \
-+	case (GET_ISS_ENCODING(op0, op1, crn, crm, op2)): \
-+		write_msr(reg_name, value);               \
-+		break;
-+			INTR_CTRL_REGISTERS
-+#undef X
-+		default:
-+			dlog_notice(
-+				"Unsupported interrupt control register "
-+				"write: "
-+				"op0=3D%d, op1=3D%d, crn=3D%d, crm=3D%d, op2=3D%d, "
-+				"rt=3D%d.\n",
-+				GET_ISS_OP0(esr), GET_ISS_OP1(esr),
-+				GET_ISS_CRN(esr), GET_ISS_CRM(esr),
-+				GET_ISS_OP2(esr), GET_ISS_RT(esr));
-+			break;
-+		}
-+	}
-+
-+	return true;
-+}
-diff --git a/src/arch/aarch64/hypervisor/perfmon.h b/src/arch/aarch64/hy=
pervisor/perfmon.h
-index 81669ba1c401..c90d45bfc239 100644
---- a/src/arch/aarch64/hypervisor/perfmon.h
-+++ b/src/arch/aarch64/hypervisor/perfmon.h
-@@ -70,3 +70,8 @@ bool perfmon_process_access(struct vcpu *vcpu, ffa_vm_=
id_t vm_id,
- 			    uintreg_t esr_el2);
-=20
- uintreg_t perfmon_get_pmccfiltr_el0_init_value(ffa_vm_id_t vm_id);
-+
-+bool intr_ctrl_is_register_access(uintreg_t esr);
-+
-+bool intr_ctrl_el1_process_access(struct vcpu *vcpu, ffa_vm_id_t vm_id,
-+				  uintreg_t esr);
-diff --git a/src/arch/aarch64/msr.h b/src/arch/aarch64/msr.h
-index bf1a66d1d4c5..b88a14b52f68 100644
---- a/src/arch/aarch64/msr.h
-+++ b/src/arch/aarch64/msr.h
-@@ -139,3 +139,6 @@
- #define MSR_CNTHPS_CTL_EL2 S3_4_C14_C5_1
- #define MSR_CNTHPS_CVAL_EL2 S3_4_C14_C5_2
- #define MSR_CNTHPS_TVAL_EL2 S3_4_C14_C5_0
-+
-+#define ICC_IGRPEN1_EL1 S3_0_C12_C12_7
-+#define ICC_SGI1R_EL1 S3_0_C12_C11_5
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-feat-vhe-set-=
STAGE1_NS-while-mapping-memory-from-NWd.patch b/meta-arm-bsp/recipes-bsp/=
hafnium/files/tc/0003-feat-vhe-set-STAGE1_NS-while-mapping-memory-from-NW=
d.patch
deleted file mode 100644
index cd19f632..00000000
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-feat-vhe-set-STAGE1_=
NS-while-mapping-memory-from-NWd.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 41f3ff2f011da69ff81234769353955e51c7e588 Mon Sep 17 00:00:00 2001
-From: Davidson K <davidson.kumaresan@arm.com>
-Date: Thu, 7 Oct 2021 12:20:08 +0530
-Subject: [PATCH] feat(vhe): set STAGE1_NS while mapping memory from NWd =
to SWd
-
-If the memory is shared by a VM executing in non secure world, attribute
-MM_MODE_NS had to be set while mapping that in a S-EL0 SP executing in
-secure world. It will not be needed for a S-EL1 SP since the NS bit is
-available only for the stage 1 translations and the stage 1 translations
-for a S-EL1 SP will be handled by a trusted OS running in S-EL1.
-
-Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
-Change-Id: I074e2d5a50a659bd3c097d797c4901f08d210b1b
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- src/ffa_memory.c | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/src/ffa_memory.c b/src/ffa_memory.c
-index 5826cb2fdd4b..bae677633dea 100644
---- a/src/ffa_memory.c
-+++ b/src/ffa_memory.c
-@@ -2618,6 +2618,18 @@ struct ffa_value ffa_memory_retrieve(struct vm_lo=
cked to_locked,
-=20
- 	memory_to_attributes =3D ffa_memory_permissions_to_mode(
- 		permissions, share_state->sender_orig_mode);
-+
-+	if (to_locked.vm->el0_partition) {
-+		/*
-+		 * Get extra mapping attributes for the given VM ID.
-+		 * If the memory is shared by a VM executing in non secure
-+		 * world, attribute MM_MODE_NS had to be set while mapping
-+		 * that in a SP executing in secure world.
-+		 */
-+		memory_to_attributes |=3D arch_mm_extra_attributes_from_vm(
-+						retrieve_request->sender);
-+	}
-+
- 	ret =3D ffa_retrieve_check_update(
- 		to_locked, memory_region->sender, share_state->fragments,
- 		share_state->fragment_constituent_counts,
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc b/meta-arm-b=
sp/recipes-bsp/hafnium/hafnium-tc.inc
index 09de6f1e..4e5368eb 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
+++ b/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
@@ -3,15 +3,6 @@
 COMPATIBLE_MACHINE =3D "(tc?)"
 HAFNIUM_PLATFORM =3D "secure_tc"
=20
-FILESEXTRAPATHS:prepend:tc :=3D "${THISDIR}/files/tc:"
-
-SRC_URI:append =3D " \
-        file://0001-feat-emulate-cntp-timer-register-accesses-using-cnth=
.patch \
-        file://0002-feat-emulate-interrupt-controller-register-access.pa=
tch \
-        file://0003-feat-vhe-set-STAGE1_NS-while-mapping-memory-from-NWd=
.patch \
-        file://0001-feat-vhe-enable-vhe-and-disable-branch-protection-fo=
.patch;patchdir=3Dproject/reference \
-        "
-
 do_compile() {
     PATH=3D"${S}/prebuilts/linux-x64/clang/bin:$PATH" oe_runmake -C ${S}
 }
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/0001-Use-pkg-config-nat=
ive-to-find-the-libssl-headers.patch b/meta-arm/recipes-bsp/hafnium/hafni=
um/0001-Use-pkg-config-native-to-find-the-libssl-headers.patch
index a9a487f0..cfb534d4 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium/0001-Use-pkg-config-native-to-=
find-the-libssl-headers.patch
+++ b/meta-arm/recipes-bsp/hafnium/hafnium/0001-Use-pkg-config-native-to-=
find-the-libssl-headers.patch
@@ -1,4 +1,4 @@
-From 60b8c4e852cbe76c383d5c495ecc8aeb84b407b6 Mon Sep 17 00:00:00 2001
+From 1c1e7ca2874feaa3e447dce578487d42c226ef46 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Sat, 17 Jul 2021 14:38:02 -0500
 Subject: [PATCH] Use pkg-config-native to find the libssl headers.
@@ -10,7 +10,7 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/scripts/Makefile b/scripts/Makefile
-index 9adb6d247..5fe371c7d 100644
+index 9adb6d247818..5fe371c7d7f5 100644
 --- a/scripts/Makefile
 +++ b/scripts/Makefile
 @@ -3,8 +3,8 @@
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/0001-arm-hafnium-fix-ke=
rnel-tool-linking.patch b/meta-arm/recipes-bsp/hafnium/hafnium/0001-arm-h=
afnium-fix-kernel-tool-linking.patch
index d4fe49ae..6f91ecfe 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium/0001-arm-hafnium-fix-kernel-to=
ol-linking.patch
+++ b/meta-arm/recipes-bsp/hafnium/hafnium/0001-arm-hafnium-fix-kernel-to=
ol-linking.patch
@@ -1,4 +1,4 @@
-From ef156578c1f7100b339ddfe956ff2cd89d61e0d4 Mon Sep 17 00:00:00 2001
+From c17aabb2535d791a715130f21178946ab9c1e29d Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Tue, 9 Nov 2021 23:31:22 +0000
 Subject: [PATCH] arm/hafnium: fix kernel tool linking
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/0001-work-around-visibi=
lity-issue.patch b/meta-arm/recipes-bsp/hafnium/hafnium/0001-work-around-=
visibility-issue.patch
index 62c5ec1f..dc0c35fe 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium/0001-work-around-visibility-is=
sue.patch
+++ b/meta-arm/recipes-bsp/hafnium/hafnium/0001-work-around-visibility-is=
sue.patch
@@ -1,4 +1,4 @@
-From 4f1ab5944c1042a141a2ce16ec8bf1d12749e41a Mon Sep 17 00:00:00 2001
+From 745294ffa9bb9296eb4250f24dd0ae8115fadd7a Mon Sep 17 00:00:00 2001
 From: Jon Mason <jon.mason@arm.com>
 Date: Thu, 27 Oct 2022 20:10:09 +0000
 Subject: [PATCH] work around visibility issue
@@ -16,7 +16,7 @@ Signed-off-by: Jon Mason <jon.mason@arm.com>
  1 file changed, 1 deletion(-)
=20
 diff --git a/BUILD.gn b/BUILD.gn
-index f55560c..d60c3e3 100644
+index f55560c540de..d60c3e37135b 100644
 --- a/BUILD.gn
 +++ b/BUILD.gn
 @@ -5,7 +5,6 @@
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/0002-Fix-build-with-cla=
ng-15.patch b/meta-arm/recipes-bsp/hafnium/hafnium/0002-Fix-build-with-cl=
ang-15.patch
deleted file mode 100644
index c305e97b..00000000
--- a/meta-arm/recipes-bsp/hafnium/hafnium/0002-Fix-build-with-clang-15.p=
atch
+++ /dev/null
@@ -1,101 +0,0 @@
-From 960d022fa69568752a58b6f5d78e9759b54cff68 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 22 Sep 2022 19:13:49 -0700
-Subject: [PATCH] Fix build with clang-15
-
-Clang-15 warns about prototypes a bit harder
-Remove unused variable suites_in_image
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- test/hftest/common.c                                         | 2 --
- test/vmapi/arch/aarch64/gicv3/inc/gicv3.h                    | 2 +-
- test/vmapi/arch/aarch64/gicv3/timer_secondary.c              | 2 +-
- test/vmapi/el0_partitions/services/interruptible.c           | 2 +-
- test/vmapi/el0_partitions/services/interruptible_echo.c      | 2 +-
- test/vmapi/primary_with_secondaries/services/interruptible.c | 2 +-
- 6 files changed, 5 insertions(+), 7 deletions(-)
-
-diff --git a/test/hftest/common.c b/test/hftest/common.c
-index 344ff2452c36..175230a7cfa7 100644
---- a/test/hftest/common.c
-+++ b/test/hftest/common.c
-@@ -67,7 +67,6 @@ void hftest_json(void)
- {
- 	const char *suite =3D NULL;
- 	size_t i;
--	size_t suites_in_image =3D 0;
- 	size_t tests_in_suite =3D 0;
-=20
- 	HFTEST_LOG("{");
-@@ -81,7 +80,6 @@ void hftest_json(void)
- 				HFTEST_LOG("    },");
- 			}
- 			/* Move onto new suite. */
--			++suites_in_image;
- 			suite =3D test->suite;
- 			tests_in_suite =3D 0;
- 			HFTEST_LOG("    {");
-diff --git a/test/vmapi/arch/aarch64/gicv3/inc/gicv3.h b/test/vmapi/arch=
/aarch64/gicv3/inc/gicv3.h
-index 28bf29d412f4..dede047a381a 100644
---- a/test/vmapi/arch/aarch64/gicv3/inc/gicv3.h
-+++ b/test/vmapi/arch/aarch64/gicv3/inc/gicv3.h
-@@ -30,4 +30,4 @@ extern void *recv_buffer;
-=20
- extern volatile uint32_t last_interrupt_id;
-=20
--void gicv3_system_setup();
-+void gicv3_system_setup(void);
-diff --git a/test/vmapi/arch/aarch64/gicv3/timer_secondary.c b/test/vmap=
i/arch/aarch64/gicv3/timer_secondary.c
-index 0ac07f4411df..6264a5864721 100644
---- a/test/vmapi/arch/aarch64/gicv3/timer_secondary.c
-+++ b/test/vmapi/arch/aarch64/gicv3/timer_secondary.c
-@@ -55,7 +55,7 @@ TEAR_DOWN(timer_secondary_ffa)
- 	EXPECT_FFA_ERROR(ffa_rx_release(), FFA_DENIED);
- }
-=20
--static void timer_busywait_secondary()
-+static void timer_busywait_secondary(void)
- {
- 	const char message[] =3D "loop 0099999";
- 	const char expected_response[] =3D "Got IRQ 03.";
-diff --git a/test/vmapi/el0_partitions/services/interruptible.c b/test/v=
mapi/el0_partitions/services/interruptible.c
-index 85c97dc7a857..80fc61b2e5a9 100644
---- a/test/vmapi/el0_partitions/services/interruptible.c
-+++ b/test/vmapi/el0_partitions/services/interruptible.c
-@@ -44,7 +44,7 @@ static void irq(void)
-  * Try to receive a message from the mailbox, blocking if necessary, an=
d
-  * retrying if interrupted.
-  */
--static struct ffa_value mailbox_receive_retry()
-+static struct ffa_value mailbox_receive_retry(void)
- {
- 	struct ffa_value received;
-=20
-diff --git a/test/vmapi/el0_partitions/services/interruptible_echo.c b/t=
est/vmapi/el0_partitions/services/interruptible_echo.c
-index 958d75090cce..55511d6a2bce 100644
---- a/test/vmapi/el0_partitions/services/interruptible_echo.c
-+++ b/test/vmapi/el0_partitions/services/interruptible_echo.c
-@@ -33,7 +33,7 @@ static void irq(void)
-  * Try to receive a message from the mailbox, blocking if necessary, an=
d
-  * retrying if interrupted.
-  */
--static struct ffa_value mailbox_receive_retry()
-+static struct ffa_value mailbox_receive_retry(void)
- {
- 	struct ffa_value received;
-=20
-diff --git a/test/vmapi/primary_with_secondaries/services/interruptible.=
c b/test/vmapi/primary_with_secondaries/services/interruptible.c
-index 594f28ac8bc8..3888bf8b0b6e 100644
---- a/test/vmapi/primary_with_secondaries/services/interruptible.c
-+++ b/test/vmapi/primary_with_secondaries/services/interruptible.c
-@@ -41,7 +41,7 @@ static void irq(void)
-  * Try to receive a message from the mailbox, blocking if necessary, an=
d
-  * retrying if interrupted.
-  */
--struct ffa_value mailbox_receive_retry()
-+struct ffa_value mailbox_receive_retry(void)
- {
- 	struct ffa_value received;
-=20
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.8.bb b/meta-arm/recip=
es-bsp/hafnium/hafnium_2.9.bb
similarity index 95%
rename from meta-arm/recipes-bsp/hafnium/hafnium_2.8.bb
rename to meta-arm/recipes-bsp/hafnium/hafnium_2.9.bb
index 53027256..0997448f 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.8.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.9.bb
@@ -15,11 +15,10 @@ inherit deploy python3native pkgconfig ${CLANGNATIVE}
=20
 SRC_URI =3D "gitsm://git.trustedfirmware.org/hafnium/hafnium.git;protoco=
l=3Dhttps;branch=3Dmaster \
            file://0001-arm-hafnium-fix-kernel-tool-linking.patch  \
-           file://0002-Fix-build-with-clang-15.patch \
            file://0001-Use-pkg-config-native-to-find-the-libssl-headers.=
patch;patchdir=3Dthird_party/linux \
            file://0001-work-around-visibility-issue.patch;patchdir=3Dthi=
rd_party/dtc \
           "
-SRCREV =3D "b7d27acb9c63a52f8bd8a37d1eee335d4ccfbe93"
+SRCREV =3D "0715b8e002cdfb92e6b7efb71128cb24557b70cb"
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
--=20
2.30.2


