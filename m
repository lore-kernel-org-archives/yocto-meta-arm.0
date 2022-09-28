Return-Path: <davidson.kumaresan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E1EC04A95
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 14:55:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8811.1664376902163254790
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 07:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: davidson.kumaresan@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 638E61042;
	Wed, 28 Sep 2022 07:55:08 -0700 (PDT)
Received: from usa.arm.com (unknown [10.162.16.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8D8603F73D;
	Wed, 28 Sep 2022 07:55:00 -0700 (PDT)
From: Davidson K <davidson.kumaresan@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Davidson K <davidson.kumaresan@arm.com>
Subject: [PATCH] arm-bsp/hafnium: enable Virtual Host Extension for TC
Date: Wed, 28 Sep 2022 20:24:47 +0530
Message-Id: <20220928145447.48196-1-davidson.kumaresan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 28 Sep 2022 14:55:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3863

Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
Change-Id: I348b80ee8d31f6ac7c528bcd80490fe83ac5f97d
---
 ...e-alignment-check-for-EL0-partitions.patch | 320 ++++++++++++++++++
 ...GE1_NS-while-mapping-memory-from-NWd.patch |  44 +++
 ...vhe-and-disable-branch-protection-fo.patch |  34 ++
 .../recipes-bsp/hafnium/hafnium-tc.inc        |   3 +
 4 files changed, 401 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc/0004-feat-d=
isable-alignment-check-for-EL0-partitions.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc/0005-feat-v=
he-set-STAGE1_NS-while-mapping-memory-from-NWd.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc/0006-feat-v=
he-enable-vhe-and-disable-branch-protection-fo.patch

diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0004-feat-disable-=
alignment-check-for-EL0-partitions.patch b/meta-arm-bsp/recipes-bsp/hafni=
um/files/tc/0004-feat-disable-alignment-check-for-EL0-partitions.patch
new file mode 100644
index 00000000..d1e10d0e
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0004-feat-disable-alignme=
nt-check-for-EL0-partitions.patch
@@ -0,0 +1,320 @@
+From 1e24b45a8ff34af45dda45c57f8403452d384f99 Mon Sep 17 00:00:00 2001
+From: Olivier Deprez <olivier.deprez@arm.com>
+Date: Mon, 8 Aug 2022 19:14:23 +0200
+Subject: [PATCH] feat: disable alignment check for EL0 partitions
+
+Relax hw alignment check specifically for (S-)EL0 partitions when
+Hafnium runs with VHE enabled. EL1 partitions have a specific control
+for EL1 and EL0 with respect to alignment check.
+Create a hyp_state structure (from already defined flying registers)
+within the vCPU context to hold the Hypervisor EL2 static configuration
+applied when a vCPU runs. This state is switched back and forth when
+running the Hypervisor or the VM.
+Add SCTLR_EL2 to this context. An EL0 partition context is initialized
+with SCTLR_EL2.A=3D0 such that alignment check is disabled when EL0 runs
+in the EL2&0 translation regime. SCTLR_EL2.A is set back when returning
+to the Hypervisor such that Hypervisor execution runs with aligment
+check enabled at EL2.
+Remove HCR_EL2 saving from vCPU exit path provided this register state
+is static and doesn't change while a vCPU runs.
+The rationale for such change is to permit running upstream SW stacks
+such as the EDKII/StandaloneMm [1] for which default build assumes
+unaligned accesses are permitted. Similar query exists for running
+Trusted Services on top of Hafnium [2].
+
+[1] https://github.com/tianocore/edk2/tree/master/StandaloneMmPkg
+[2] https://trusted-services.readthedocs.io/en/integration/
+
+Signed-off-by: Olivier Deprez <olivier.deprez@arm.com>
+Change-Id: I2906f4c712425fcfb31adbf89e2e3b9ca293f181
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/hafnium=
/hafnium/+/16195]
+---
+ src/arch/aarch64/hypervisor/cpu.c        |  9 ++++---
+ src/arch/aarch64/hypervisor/exceptions.S | 32 ++++++++++++++++--------
+ src/arch/aarch64/hypervisor/feature_id.c |  6 ++---
+ src/arch/aarch64/hypervisor/handler.c    | 18 +++++++------
+ src/arch/aarch64/inc/hf/arch/types.h     |  9 +++++--
+ src/arch/aarch64/mm.c                    |  2 +-
+ src/arch/aarch64/sysregs.c               | 11 ++++++--
+ src/arch/aarch64/sysregs.h               |  2 +-
+ 8 files changed, 59 insertions(+), 30 deletions(-)
+
+diff --git a/src/arch/aarch64/hypervisor/cpu.c b/src/arch/aarch64/hyperv=
isor/cpu.c
+index d2df77d..a000159 100644
+--- a/src/arch/aarch64/hypervisor/cpu.c
++++ b/src/arch/aarch64/hypervisor/cpu.c
+@@ -115,7 +115,9 @@ void arch_regs_reset(struct vcpu *vcpu)
+ 		}
+ 	}
+=20
+-	r->hcr_el2 =3D get_hcr_el2_value(vm_id, vcpu->vm->el0_partition);
++	r->hyp_state.hcr_el2 =3D
++		get_hcr_el2_value(vm_id, vcpu->vm->el0_partition);
++	r->hyp_state.sctlr_el2 =3D get_sctlr_el2_value(vcpu->vm->el0_partition=
);
+ 	r->lazy.cnthctl_el2 =3D cnthctl;
+ 	if (vcpu->vm->el0_partition) {
+ 		CHECK(has_vhe_support());
+@@ -125,10 +127,11 @@ void arch_regs_reset(struct vcpu *vcpu)
+ 		 * are ignored and treated as 0. There is no need to mask the
+ 		 * VMID (used as asid) to only 8 bits.
+ 		 */
+-		r->ttbr0_el2 =3D pa_addr(table) | ((uint64_t)vm_id << 48);
++		r->hyp_state.ttbr0_el2 =3D
++			pa_addr(table) | ((uint64_t)vm_id << 48);
+ 		r->spsr =3D PSR_PE_MODE_EL0T;
+ 	} else {
+-		r->ttbr0_el2 =3D read_msr(ttbr0_el2);
++		r->hyp_state.ttbr0_el2 =3D read_msr(ttbr0_el2);
+ 		r->lazy.vtcr_el2 =3D arch_mm_get_vtcr_el2();
+ 		r->lazy.vttbr_el2 =3D pa_addr(table) | ((uint64_t)vm_id << 48);
+ #if SECURE_WORLD =3D=3D 1
+diff --git a/src/arch/aarch64/hypervisor/exceptions.S b/src/arch/aarch64=
/hypervisor/exceptions.S
+index 539e196..d3732f8 100644
+--- a/src/arch/aarch64/hypervisor/exceptions.S
++++ b/src/arch/aarch64/hypervisor/exceptions.S
+@@ -20,6 +20,9 @@
+ #define ID_AA64PFR0_SVE_SHIFT (32)
+ #define ID_AA64PFR0_SVE_LENGTH (4)
+=20
++#define SCTLR_EL2_A_SHIFT	(1)
++#define HCR_EL2_TGE_SHIFT	(27)
++
+ /**
+  * Saves the volatile registers into the register buffer of the current=
 vCPU.
+  */
+@@ -51,8 +54,6 @@
+ 	mrs x1, elr_el2
+ 	mrs x2, spsr_el2
+ 	stp x1, x2, [x18, #VCPU_REGS + 8 * 31]
+-	mrs x1, hcr_el2
+-	str x1, [x18, #VCPU_REGS + 8 * 33]
+ .endm
+=20
+ /**
+@@ -871,12 +872,13 @@ vcpu_restore_volatile_and_run:
+ 	msr elr_el2, x1
+ 	msr spsr_el2, x2
+=20
+-	ldr x1, [x0, #VCPU_REGS + 8 * 33]
++	ldp x1, x2, [x0, #VCPU_REGS + 8 * 33]
+ 	msr hcr_el2, x1
++	msr ttbr0_el2, x2
+ 	isb
+=20
+-	ldr x1, [x0, #VCPU_REGS + 8 * 34]
+-	msr ttbr0_el2, x1
++	ldr x1, [x0, #VCPU_REGS + 8 * 35]
++	msr sctlr_el2, x1
+ 	isb
+=20
+ 	/* Restore x0..x3, which we have used as scratch before. */
+@@ -886,15 +888,17 @@ vcpu_restore_volatile_and_run:
+=20
+ #if ENABLE_VHE
+ enable_vhe_tge:
++	mrs x0, id_aa64mmfr1_el1
++	tst x0, #0xf00
++	b.eq 1f
++
+ 	/**
+ 	 * Switch to host mode ({E2H, TGE} =3D {1,1}) when VHE is enabled.
+ 	 * Note that E2H is always set when VHE is enabled.
+ 	 */
+-	mrs x0, id_aa64mmfr1_el1
+-	tst x0, #0xf00
+-	b.eq 1f
+-	orr x1, x1, #(1 << 27)
+-	msr hcr_el2, x1
++	mrs x0, hcr_el2
++	orr x0, x0, #(1 << HCR_EL2_TGE_SHIFT)
++	msr hcr_el2, x0
+ 	isb
+=20
+ 	/**
+@@ -905,6 +909,14 @@ enable_vhe_tge:
+ 	ldr x0, [x0]
+ 	msr ttbr0_el2, x0
+ 	isb
++
++	/**
++	 * Enable alignment check while Hypervisor runs.
++	 */
++	mrs x0, sctlr_el2
++	orr x0, x0, #(1 << SCTLR_EL2_A_SHIFT)
++	msr sctlr_el2, x0
++	isb
+ 1:
+ 	ret
+ #endif
+diff --git a/src/arch/aarch64/hypervisor/feature_id.c b/src/arch/aarch64=
/hypervisor/feature_id.c
+index ed3bf8f..57f3262 100644
+--- a/src/arch/aarch64/hypervisor/feature_id.c
++++ b/src/arch/aarch64/hypervisor/feature_id.c
+@@ -175,7 +175,7 @@ void feature_set_traps(struct vm *vm, struct arch_re=
gs *regs)
+ 		~(ID_AA64MMFR1_EL1_VH_MASK << ID_AA64MMFR1_EL1_VH_SHIFT);
+=20
+ 	if (features & HF_FEATURE_RAS) {
+-		regs->hcr_el2 |=3D HCR_EL2_TERR;
++		regs->hyp_state.hcr_el2 |=3D HCR_EL2_TERR;
+ 		vm->arch.tid3_masks.id_aa64mmfr1_el1 &=3D
+ 			~ID_AA64MMFR1_EL1_SPEC_SEI;
+ 		vm->arch.tid3_masks.id_aa64pfr0_el1 &=3D ~ID_AA64PFR0_EL1_RAS;
+@@ -221,14 +221,14 @@ void feature_set_traps(struct vm *vm, struct arch_=
regs *regs)
+ 	}
+=20
+ 	if (features & HF_FEATURE_LOR) {
+-		regs->hcr_el2 |=3D HCR_EL2_TLOR;
++		regs->hyp_state.hcr_el2 |=3D HCR_EL2_TLOR;
+=20
+ 		vm->arch.tid3_masks.id_aa64mmfr1_el1 &=3D ~ID_AA64MMFR1_EL1_LO;
+ 	}
+=20
+ 	if (features & HF_FEATURE_PAUTH) {
+ 		/* APK and API bits *enable* trapping when cleared. */
+-		regs->hcr_el2 &=3D ~(HCR_EL2_APK | HCR_EL2_API);
++		regs->hyp_state.hcr_el2 &=3D ~(HCR_EL2_APK | HCR_EL2_API);
+=20
+ 		vm->arch.tid3_masks.id_aa64isar1_el1 &=3D ~ID_AA64ISAR1_EL1_GPI;
+ 		vm->arch.tid3_masks.id_aa64isar1_el1 &=3D ~ID_AA64ISAR1_EL1_GPA;
+diff --git a/src/arch/aarch64/hypervisor/handler.c b/src/arch/aarch64/hy=
pervisor/handler.c
+index cd5146b..8a3d628 100644
+--- a/src/arch/aarch64/hypervisor/handler.c
++++ b/src/arch/aarch64/hypervisor/handler.c
+@@ -272,9 +272,9 @@ noreturn void sync_current_exception_noreturn(uintre=
g_t elr, uintreg_t spsr)
+ static void set_virtual_irq(struct arch_regs *r, bool enable)
+ {
+ 	if (enable) {
+-		r->hcr_el2 |=3D HCR_EL2_VI;
++		r->hyp_state.hcr_el2 |=3D HCR_EL2_VI;
+ 	} else {
+-		r->hcr_el2 &=3D ~HCR_EL2_VI;
++		r->hyp_state.hcr_el2 &=3D ~HCR_EL2_VI;
+ 	}
+ }
+=20
+@@ -283,14 +283,15 @@ static void set_virtual_irq(struct arch_regs *r, b=
ool enable)
+  */
+ static void set_virtual_irq_current(bool enable)
+ {
+-	uintreg_t hcr_el2 =3D current()->regs.hcr_el2;
++	struct vcpu *vcpu =3D current();
++	uintreg_t hcr_el2 =3D vcpu->regs.hyp_state.hcr_el2;
+=20
+ 	if (enable) {
+ 		hcr_el2 |=3D HCR_EL2_VI;
+ 	} else {
+ 		hcr_el2 &=3D ~HCR_EL2_VI;
+ 	}
+-	current()->regs.hcr_el2 =3D hcr_el2;
++	vcpu->regs.hyp_state.hcr_el2 =3D hcr_el2;
+ }
+=20
+ /**
+@@ -300,9 +301,9 @@ static void set_virtual_irq_current(bool enable)
+ static void set_virtual_fiq(struct arch_regs *r, bool enable)
+ {
+ 	if (enable) {
+-		r->hcr_el2 |=3D HCR_EL2_VF;
++		r->hyp_state.hcr_el2 |=3D HCR_EL2_VF;
+ 	} else {
+-		r->hcr_el2 &=3D ~HCR_EL2_VF;
++		r->hyp_state.hcr_el2 &=3D ~HCR_EL2_VF;
+ 	}
+ }
+=20
+@@ -311,14 +312,15 @@ static void set_virtual_fiq(struct arch_regs *r, b=
ool enable)
+  */
+ static void set_virtual_fiq_current(bool enable)
+ {
+-	uintreg_t hcr_el2 =3D current()->regs.hcr_el2;
++	struct vcpu *vcpu =3D current();
++	uintreg_t hcr_el2 =3D vcpu->regs.hyp_state.hcr_el2;
+=20
+ 	if (enable) {
+ 		hcr_el2 |=3D HCR_EL2_VF;
+ 	} else {
+ 		hcr_el2 &=3D ~HCR_EL2_VF;
+ 	}
+-	current()->regs.hcr_el2 =3D hcr_el2;
++	vcpu->regs.hyp_state.hcr_el2 =3D hcr_el2;
+ }
+=20
+ #if SECURE_WORLD =3D=3D 1
+diff --git a/src/arch/aarch64/inc/hf/arch/types.h b/src/arch/aarch64/inc=
/hf/arch/types.h
+index 6379d73..6b8b24f 100644
+--- a/src/arch/aarch64/inc/hf/arch/types.h
++++ b/src/arch/aarch64/inc/hf/arch/types.h
+@@ -79,8 +79,13 @@ struct arch_regs {
+ 	uintreg_t r[NUM_GP_REGS];
+ 	uintreg_t pc;
+ 	uintreg_t spsr;
+-	uintreg_t hcr_el2;
+-	uintreg_t ttbr0_el2;
++
++	/* Hypervisor configuration while a vCPU runs. */
++	struct {
++		uintreg_t hcr_el2;
++		uintreg_t ttbr0_el2;
++		uintreg_t sctlr_el2;
++	} hyp_state;
+=20
+ 	/*
+ 	 * System registers.
+diff --git a/src/arch/aarch64/mm.c b/src/arch/aarch64/mm.c
+index 8ee65ca..487ae35 100644
+--- a/src/arch/aarch64/mm.c
++++ b/src/arch/aarch64/mm.c
+@@ -886,7 +886,7 @@ bool arch_mm_init(paddr_t table)
+ #endif
+ 				    (0xff << (8 * STAGE1_NORMALINDX)),
+=20
+-		.sctlr_el2 =3D get_sctlr_el2_value(),
++		.sctlr_el2 =3D get_sctlr_el2_value(false),
+ 		.vstcr_el2 =3D (1U << 31) |	    /* RES1. */
+ 			     (0 << 30) |	    /* SA. */
+ 			     (0 << 29) |	    /* SW. */
+diff --git a/src/arch/aarch64/sysregs.c b/src/arch/aarch64/sysregs.c
+index e8c154b..087ba4e 100644
+--- a/src/arch/aarch64/sysregs.c
++++ b/src/arch/aarch64/sysregs.c
+@@ -159,7 +159,7 @@ uintreg_t get_cptr_el2_value(void)
+ /**
+  * Returns the value for SCTLR_EL2 for the CPU.
+  */
+-uintreg_t get_sctlr_el2_value(void)
++uintreg_t get_sctlr_el2_value(bool is_el0_partition)
+ {
+ 	uintreg_t sctlr_el2_value =3D 0;
+=20
+@@ -173,7 +173,14 @@ uintreg_t get_sctlr_el2_value(void)
+=20
+ 	/* MMU-related bits. */
+ 	sctlr_el2_value |=3D SCTLR_EL2_M;
+-	sctlr_el2_value |=3D SCTLR_EL2_A;
++
++	/*
++	 * Alignment check enabled, but in the case of an EL0 partition
++	 * with VHE enabled.
++	 */
++	if (!(has_vhe_support() && is_el0_partition)) {
++		sctlr_el2_value |=3D SCTLR_EL2_A;
++	}
+ 	sctlr_el2_value |=3D SCTLR_EL2_C;
+ 	sctlr_el2_value |=3D SCTLR_EL2_SA;
+ 	sctlr_el2_value |=3D SCTLR_EL2_I;
+diff --git a/src/arch/aarch64/sysregs.h b/src/arch/aarch64/sysregs.h
+index babd237..6fdab58 100644
+--- a/src/arch/aarch64/sysregs.h
++++ b/src/arch/aarch64/sysregs.h
+@@ -668,7 +668,7 @@ uintreg_t get_mdcr_el2_value(void);
+=20
+ uintreg_t get_cptr_el2_value(void);
+=20
+-uintreg_t get_sctlr_el2_value(void);
++uintreg_t get_sctlr_el2_value(bool is_el0_partition);
+=20
+ /**
+  * Branch Target Identification mechanism support in AArch64 state.
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0005-feat-vhe-set-=
STAGE1_NS-while-mapping-memory-from-NWd.patch b/meta-arm-bsp/recipes-bsp/=
hafnium/files/tc/0005-feat-vhe-set-STAGE1_NS-while-mapping-memory-from-NW=
d.patch
new file mode 100644
index 00000000..1808295d
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0005-feat-vhe-set-STAGE1_=
NS-while-mapping-memory-from-NWd.patch
@@ -0,0 +1,44 @@
+From 02c8afc4f7315b4e12098ffeb8bd5e64e4891e78 Mon Sep 17 00:00:00 2001
+From: Davidson K <davidson.kumaresan@arm.com>
+Date: Thu, 7 Oct 2021 12:20:08 +0530
+Subject: [PATCH] feat(vhe): set STAGE1_NS while mapping memory from NWd =
to SWd
+
+If the memory is shared by a VM executing in non secure world, attribute
+MM_MODE_NS had to be set while mapping that in a S-EL0 SP executing in
+secure world. It will not be needed for a S-EL1 SP since the NS bit is
+available only for the stage 1 translations and the stage 1 translations
+for a S-EL1 SP will be handled by a trusted OS running in S-EL1.
+
+Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
+Change-Id: I074e2d5a50a659bd3c097d797c4901f08d210b1b
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ src/ffa_memory.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/src/ffa_memory.c b/src/ffa_memory.c
+index 048cca9..8910cc7 100644
+--- a/src/ffa_memory.c
++++ b/src/ffa_memory.c
+@@ -2483,6 +2483,18 @@ struct ffa_value ffa_memory_retrieve(struct vm_lo=
cked to_locked,
+=20
+ 	memory_to_attributes =3D ffa_memory_permissions_to_mode(
+ 		permissions, share_state->sender_orig_mode);
++
++	if (to_locked.vm->el0_partition) {
++		/*
++		 * Get extra mapping attributes for the given VM ID.
++		 * If the memory is shared by a VM executing in non secure
++		 * world, attribute MM_MODE_NS had to be set while mapping
++		 * that in a SP executing in secure world.
++		 */
++		memory_to_attributes |=3D arch_mm_extra_attributes_from_vm(
++						retrieve_request->sender);
++	}
++
+ 	ret =3D ffa_retrieve_check_update(
+ 		to_locked, memory_region->sender, share_state->fragments,
+ 		share_state->fragment_constituent_counts,
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0006-feat-vhe-enab=
le-vhe-and-disable-branch-protection-fo.patch b/meta-arm-bsp/recipes-bsp/=
hafnium/files/tc/0006-feat-vhe-enable-vhe-and-disable-branch-protection-f=
o.patch
new file mode 100644
index 00000000..3139759e
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0006-feat-vhe-enable-vhe-=
and-disable-branch-protection-fo.patch
@@ -0,0 +1,34 @@
+From c235511a06a54bcccec97b3067c1004d3957b1d8 Mon Sep 17 00:00:00 2001
+From: Davidson K <davidson.kumaresan@arm.com>
+Date: Thu, 8 Sep 2022 10:47:10 +0530
+Subject: [PATCH] feat(vhe): enable vhe and disable branch protection for=
 TC
+
+Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
+Change-Id: I60cd607d9f2bf0114b482980e7ca68e24aaf4d1f
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ BUILD.gn | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/BUILD.gn b/BUILD.gn
+index 62ba763..f26ce03 100644
+--- a/BUILD.gn
++++ b/BUILD.gn
+@@ -238,7 +238,6 @@ aarch64_toolchains("secure_tc") {
+   heap_pages =3D 120
+   max_cpus =3D 8
+   max_vms =3D 16
+-  branch_protection =3D "standard"
+   toolchain_args =3D {
+     plat_ffa =3D "//src/arch/aarch64/plat/ffa:spmc"
+     plat_psci =3D "//src/arch/aarch64/plat/psci:spmc"
+@@ -247,5 +246,6 @@ aarch64_toolchains("secure_tc") {
+     secure_world =3D "1"
+     pl011_base_address =3D "0x7ff80000"
+     enable_mte =3D "1"
++    enable_vhe =3D "1"
+   }
+ }
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc b/meta-arm-b=
sp/recipes-bsp/hafnium/hafnium-tc.inc
index 75707e1d..6dd08ad0 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
+++ b/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
@@ -15,6 +15,9 @@ SRC_URI:append =3D " \
         file://0001-feat-emulate-cntp-timer-register-accesses-using-cnth=
.patch \
         file://0002-feat-emulate-interrupt-controller-register-access.pa=
tch \
         file://0003-tc-increase-heap-pages.patch;patchdir=3Dproject/refe=
rence \
+        file://0004-feat-disable-alignment-check-for-EL0-partitions.patc=
h \
+        file://0005-feat-vhe-set-STAGE1_NS-while-mapping-memory-from-NWd=
.patch \
+        file://0006-feat-vhe-enable-vhe-and-disable-branch-protection-fo=
.patch;patchdir=3Dproject/reference \
         "
=20
 do_compile() {
--=20
2.34.1


