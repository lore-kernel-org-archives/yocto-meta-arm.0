Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7009DEE49AE
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 17:32:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2324.1692725519836725890
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 22 Aug 2023 10:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 591BE11FB
	for <meta-arm@lists.yoctoproject.org>; Tue, 22 Aug 2023 10:32:40 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4B4493F762
	for <meta-arm@lists.yoctoproject.org>; Tue, 22 Aug 2023 10:31:59 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/hafnium: update to v2.8
Date: Mon, 21 Aug 2023 14:47:39 -0500
Message-Id: <20230821194739.3647180-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 22 Aug 2023 17:32:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4987

Update hafnium to v2.8, which allows updating tc1 to that version and
remove the intermediate SHA.  It also allows for the removal of some
backported patches.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...p-timer-register-accesses-using-cnth.patch |  25 +-
 ...he-and-disable-branch-protection-fo.patch} |   9 +-
 .../tc/0001-tc-increase-heap-pages.patch      |  27 --
 ...interrupt-controller-register-access.patch |  17 +-
 ...e-alignment-check-for-EL0-partitions.patch | 318 ------------------
 ...E1_NS-while-mapping-memory-from-NWd.patch} |   6 +-
 .../recipes-bsp/hafnium/hafnium-tc.inc        |  12 +-
 ...arm-hafnium-fix-kernel-tool-linking.patch} |   7 +-
 .../0001-define-_Noreturn-if-needed.patch     |  33 --
 ...tch =3D> 0002-Fix-build-with-clang-15.patch} |  41 +--
 .../{hafnium_2.7.bb =3D> hafnium_2.8.bb}        |   7 +-
 11 files changed, 49 insertions(+), 453 deletions(-)
 rename meta-arm-bsp/recipes-bsp/hafnium/files/tc/{0002-feat-vhe-enable-v=
he-and-disable-branch-protection-fo.patch =3D> 0001-feat-vhe-enable-vhe-a=
nd-disable-branch-protection-fo.patch} (80%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-tc-inc=
rease-heap-pages.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-feat-d=
isable-alignment-check-for-EL0-partitions.patch
 rename meta-arm-bsp/recipes-bsp/hafnium/files/tc/{0004-feat-vhe-set-STAG=
E1_NS-while-mapping-memory-from-NWd.patch =3D> 0003-feat-vhe-set-STAGE1_N=
S-while-mapping-memory-from-NWd.patch} (89%)
 rename meta-arm/recipes-bsp/hafnium/hafnium/{0002-arm-hafnium-fix-kernel=
-tool-linking.patch =3D> 0001-arm-hafnium-fix-kernel-tool-linking.patch} =
(86%)
 delete mode 100644 meta-arm/recipes-bsp/hafnium/hafnium/0001-define-_Nor=
eturn-if-needed.patch
 rename meta-arm/recipes-bsp/hafnium/hafnium/{0003-Fix-build-with-clang-1=
5.patch =3D> 0002-Fix-build-with-clang-15.patch} (77%)
 rename meta-arm/recipes-bsp/hafnium/{hafnium_2.7.bb =3D> hafnium_2.8.bb}=
 (90%)

diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-feat-emulate-=
cntp-timer-register-accesses-using-cnth.patch b/meta-arm-bsp/recipes-bsp/=
hafnium/files/tc/0001-feat-emulate-cntp-timer-register-accesses-using-cnt=
h.patch
index a9a839ea..9ae4b39f 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-feat-emulate-cntp-ti=
mer-register-accesses-using-cnth.patch
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-feat-emulate-cntp-ti=
mer-register-accesses-using-cnth.patch
@@ -1,4 +1,4 @@
-From f526797b83113cc64e3e658c22d8a5d269896a2a Mon Sep 17 00:00:00 2001
+From 3bc797e097ef2b29acf36560e4d2bfeec31f8d81 Mon Sep 17 00:00:00 2001
 From: Ben Horgan <ben.horgan@arm.com>
 Date: Fri, 4 Mar 2022 16:48:14 +0000
 Subject: [PATCH] feat: emulate cntp timer register accesses using cnthps
@@ -19,7 +19,7 @@ Change-Id: I67508203273baf3bd8e6be2d99717028db945715
  create mode 100644 src/arch/aarch64/hypervisor/timer_el1.h
=20
 diff --git a/Makefile b/Makefile
-index 95cab9a5..21cca938 100644
+index 95cab9a56bfd..21cca938531d 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -60,7 +60,8 @@ CHECKPATCH :=3D $(CURDIR)/third_party/linux/scripts/ch=
eckpatch.pl \
@@ -33,7 +33,7 @@ index 95cab9a5..21cca938 100644
  OUT ?=3D out/$(PROJECT)
  OUT_DIR =3D out/$(PROJECT)
 diff --git a/src/arch/aarch64/hypervisor/BUILD.gn b/src/arch/aarch64/hyp=
ervisor/BUILD.gn
-index 6068d1e8..de1a414d 100644
+index 6068d1e8f075..de1a414dac68 100644
 --- a/src/arch/aarch64/hypervisor/BUILD.gn
 +++ b/src/arch/aarch64/hypervisor/BUILD.gn
 @@ -45,6 +45,7 @@ source_set("hypervisor") {
@@ -45,7 +45,7 @@ index 6068d1e8..de1a414d 100644
    ]
 =20
 diff --git a/src/arch/aarch64/hypervisor/cpu.c b/src/arch/aarch64/hyperv=
isor/cpu.c
-index bcf5ffce..d2df77d8 100644
+index 5e025b596674..edd5df134cfc 100644
 --- a/src/arch/aarch64/hypervisor/cpu.c
 +++ b/src/arch/aarch64/hypervisor/cpu.c
 @@ -98,13 +98,20 @@ void arch_regs_reset(struct vcpu *vcpu)
@@ -72,7 +72,7 @@ index bcf5ffce..d2df77d8 100644
  	}
 =20
 diff --git a/src/arch/aarch64/hypervisor/handler.c b/src/arch/aarch64/hy=
pervisor/handler.c
-index 4bd8a3b4..4c1b6e48 100644
+index 3422ff7b8265..c495df40f3f5 100644
 --- a/src/arch/aarch64/hypervisor/handler.c
 +++ b/src/arch/aarch64/hypervisor/handler.c
 @@ -34,6 +34,7 @@
@@ -83,8 +83,8 @@ index 4bd8a3b4..4c1b6e48 100644
 =20
  /**
   * Hypervisor Fault Address Register Non-Secure.
-@@ -1277,6 +1278,11 @@ void handle_system_register_access(uintreg_t esr_=
el2)
- 			inject_el1_unknown_exception(vcpu, esr_el2);
+@@ -1295,6 +1296,11 @@ void handle_system_register_access(uintreg_t esr_=
el2)
+ 			inject_el1_sysreg_trap_exception(vcpu, esr_el2);
  			return;
  		}
 +	} else if (timer_el1_is_register_access(esr_el2)) {
@@ -93,11 +93,11 @@ index 4bd8a3b4..4c1b6e48 100644
 +			return;
 +		}
  	} else {
- 		inject_el1_unknown_exception(vcpu, esr_el2);
+ 		inject_el1_sysreg_trap_exception(vcpu, esr_el2);
  		return;
 diff --git a/src/arch/aarch64/hypervisor/timer_el1.c b/src/arch/aarch64/=
hypervisor/timer_el1.c
 new file mode 100644
-index 00000000..c30e5543
+index 000000000000..c30e5543f436
 --- /dev/null
 +++ b/src/arch/aarch64/hypervisor/timer_el1.c
 @@ -0,0 +1,104 @@
@@ -207,7 +207,7 @@ index 00000000..c30e5543
 +}
 diff --git a/src/arch/aarch64/hypervisor/timer_el1.h b/src/arch/aarch64/=
hypervisor/timer_el1.h
 new file mode 100644
-index 00000000..04a43b6c
+index 000000000000..04a43b6ca335
 --- /dev/null
 +++ b/src/arch/aarch64/hypervisor/timer_el1.h
 @@ -0,0 +1,20 @@
@@ -232,10 +232,10 @@ index 00000000..04a43b6c
 +bool timer_el1_process_access(struct vcpu *vcpu, ffa_vm_id_t vm_id,
 +			      uintreg_t esr);
 diff --git a/src/arch/aarch64/msr.h b/src/arch/aarch64/msr.h
-index cd6778b4..55e78330 100644
+index 6edc39f2af48..bf1a66d1d4c5 100644
 --- a/src/arch/aarch64/msr.h
 +++ b/src/arch/aarch64/msr.h
-@@ -126,3 +126,11 @@
+@@ -131,3 +131,11 @@
  #define MSR_ELR_EL12 S3_5_C4_C0_1
 =20
  #endif
@@ -247,4 +247,3 @@ index cd6778b4..55e78330 100644
 +#define MSR_CNTHPS_CTL_EL2 S3_4_C14_C5_1
 +#define MSR_CNTHPS_CVAL_EL2 S3_4_C14_C5_2
 +#define MSR_CNTHPS_TVAL_EL2 S3_4_C14_C5_0
-
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-feat-vhe-enab=
le-vhe-and-disable-branch-protection-fo.patch b/meta-arm-bsp/recipes-bsp/=
hafnium/files/tc/0001-feat-vhe-enable-vhe-and-disable-branch-protection-f=
o.patch
similarity index 80%
rename from meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-feat-vhe-enabl=
e-vhe-and-disable-branch-protection-fo.patch
rename to meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-feat-vhe-enable-=
vhe-and-disable-branch-protection-fo.patch
index 9960f65d..9627a765 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-feat-vhe-enable-vhe-=
and-disable-branch-protection-fo.patch
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-feat-vhe-enable-vhe-=
and-disable-branch-protection-fo.patch
@@ -11,21 +11,22 @@ Upstream-Status: Pending [Not submitted to upstream y=
et]
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/BUILD.gn b/BUILD.gn
-index 62ba763..f26ce03 100644
+index cc6a78f4fdb8..acd1f9d1634b 100644
 --- a/BUILD.gn
 +++ b/BUILD.gn
-@@ -238,7 +238,6 @@ aarch64_toolchains("secure_tc") {
-   heap_pages =3D 120
+@@ -245,7 +245,6 @@ aarch64_toolchains("secure_tc") {
+   heap_pages =3D 180
    max_cpus =3D 8
    max_vms =3D 16
 -  branch_protection =3D "standard"
    toolchain_args =3D {
      plat_ffa =3D "//src/arch/aarch64/plat/ffa:spmc"
      plat_psci =3D "//src/arch/aarch64/plat/psci:spmc"
-@@ -247,5 +246,6 @@ aarch64_toolchains("secure_tc") {
+@@ -254,6 +253,7 @@ aarch64_toolchains("secure_tc") {
      secure_world =3D "1"
      pl011_base_address =3D "0x7ff80000"
      enable_mte =3D "1"
 +    enable_vhe =3D "1"
+     plat_log_level =3D "LOG_LEVEL_INFO"
    }
  }
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-tc-increase-h=
eap-pages.patch b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-tc-incre=
ase-heap-pages.patch
deleted file mode 100644
index fa35efc1..00000000
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-tc-increase-heap-pag=
es.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 613dea068fa546956717ce0b60328e39d451f661 Mon Sep 17 00:00:00 2001
-From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Date: Fri, 29 Apr 2022 20:07:50 +0100
-Subject: [PATCH] tc: increase heap pages
-
-Upstream-Status: Pending
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
----
- BUILD.gn | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/BUILD.gn b/BUILD.gn
-index 6b9b383..62ba763 100644
---- a/BUILD.gn
-+++ b/BUILD.gn
-@@ -235,7 +235,7 @@ aarch64_toolchains("secure_tc") {
-   gicd_base_address =3D "0x30000000"
-   gicr_base_address =3D "0x30080000"
-   gicr_frames =3D 8
--  heap_pages =3D 60
-+  heap_pages =3D 120
-   max_cpus =3D 8
-   max_vms =3D 16
-   branch_protection =3D "standard"
---=20
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-feat-emulate-=
interrupt-controller-register-access.patch b/meta-arm-bsp/recipes-bsp/haf=
nium/files/tc/0002-feat-emulate-interrupt-controller-register-access.patc=
h
index d9ec6e2a..3e676151 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-feat-emulate-interru=
pt-controller-register-access.patch
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-feat-emulate-interru=
pt-controller-register-access.patch
@@ -1,4 +1,4 @@
-From 97a8ca1835f5d9512dacda497540d5523e56c7dd Mon Sep 17 00:00:00 2001
+From 9f5b07e30c82713b9598ea60d9f802bd419b560f Mon Sep 17 00:00:00 2001
 From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Date: Tue, 26 Apr 2022 14:43:58 +0100
 Subject: [PATCH] feat: emulate interrupt controller register access
@@ -16,10 +16,10 @@ Upstream-Status: Inappropriate [Experimental feature]
  4 files changed, 97 insertions(+)
=20
 diff --git a/src/arch/aarch64/hypervisor/handler.c b/src/arch/aarch64/hy=
pervisor/handler.c
-index 4c1b6e48..cd5146bd 100644
+index c495df40f3f5..13578fc99670 100644
 --- a/src/arch/aarch64/hypervisor/handler.c
 +++ b/src/arch/aarch64/hypervisor/handler.c
-@@ -1283,6 +1283,11 @@ void handle_system_register_access(uintreg_t esr_=
el2)
+@@ -1301,6 +1301,11 @@ void handle_system_register_access(uintreg_t esr_=
el2)
  			inject_el1_unknown_exception(vcpu, esr_el2);
  			return;
  		}
@@ -29,10 +29,10 @@ index 4c1b6e48..cd5146bd 100644
 +			return;
 +		}
  	} else {
- 		inject_el1_unknown_exception(vcpu, esr_el2);
+ 		inject_el1_sysreg_trap_exception(vcpu, esr_el2);
  		return;
 diff --git a/src/arch/aarch64/hypervisor/perfmon.c b/src/arch/aarch64/hy=
pervisor/perfmon.c
-index f13b0354..05e216c8 100644
+index f13b035480d8..05e216c84c2e 100644
 --- a/src/arch/aarch64/hypervisor/perfmon.c
 +++ b/src/arch/aarch64/hypervisor/perfmon.c
 @@ -116,6 +116,10 @@
@@ -131,7 +131,7 @@ index f13b0354..05e216c8 100644
 +	return true;
 +}
 diff --git a/src/arch/aarch64/hypervisor/perfmon.h b/src/arch/aarch64/hy=
pervisor/perfmon.h
-index 81669ba1..c90d45bf 100644
+index 81669ba1c401..c90d45bfc239 100644
 --- a/src/arch/aarch64/hypervisor/perfmon.h
 +++ b/src/arch/aarch64/hypervisor/perfmon.h
 @@ -70,3 +70,8 @@ bool perfmon_process_access(struct vcpu *vcpu, ffa_vm_=
id_t vm_id,
@@ -144,14 +144,13 @@ index 81669ba1..c90d45bf 100644
 +bool intr_ctrl_el1_process_access(struct vcpu *vcpu, ffa_vm_id_t vm_id,
 +				  uintreg_t esr);
 diff --git a/src/arch/aarch64/msr.h b/src/arch/aarch64/msr.h
-index 55e78330..82aa8846 100644
+index bf1a66d1d4c5..b88a14b52f68 100644
 --- a/src/arch/aarch64/msr.h
 +++ b/src/arch/aarch64/msr.h
-@@ -134,3 +134,6 @@
+@@ -139,3 +139,6 @@
  #define MSR_CNTHPS_CTL_EL2 S3_4_C14_C5_1
  #define MSR_CNTHPS_CVAL_EL2 S3_4_C14_C5_2
  #define MSR_CNTHPS_TVAL_EL2 S3_4_C14_C5_0
 +
 +#define ICC_IGRPEN1_EL1 S3_0_C12_C12_7
 +#define ICC_SGI1R_EL1 S3_0_C12_C11_5
-
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-feat-disable-=
alignment-check-for-EL0-partitions.patch b/meta-arm-bsp/recipes-bsp/hafni=
um/files/tc/0003-feat-disable-alignment-check-for-EL0-partitions.patch
deleted file mode 100644
index 5e620cf3..00000000
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-feat-disable-alignme=
nt-check-for-EL0-partitions.patch
+++ /dev/null
@@ -1,318 +0,0 @@
-From 1c4d28493faed6cf189c75fa91d19131e6a34e04 Mon Sep 17 00:00:00 2001
-From: Olivier Deprez <olivier.deprez@arm.com>
-Date: Mon, 8 Aug 2022 19:14:23 +0200
-Subject: [PATCH] feat: disable alignment check for EL0 partitions
-
-Relax hw alignment check specifically for (S-)EL0 partitions when
-Hafnium runs with VHE enabled. EL1 partitions have a specific control
-for EL1 and EL0 with respect to alignment check.
-Create a hyp_state structure (from already defined flying registers)
-within the vCPU context to hold the Hypervisor EL2 static configuration
-applied when a vCPU runs. This state is switched back and forth when
-running the Hypervisor or the VM.
-Add SCTLR_EL2 to this context. An EL0 partition context is initialized
-with SCTLR_EL2.A=3D0 such that alignment check is disabled when EL0 runs
-in the EL2&0 translation regime. SCTLR_EL2.A is set back when returning
-to the Hypervisor such that Hypervisor execution runs with aligment
-check enabled at EL2.
-Remove HCR_EL2 saving from vCPU exit path provided this register state
-is static and doesn't change while a vCPU runs.
-The rationale for such change is to permit running upstream SW stacks
-such as the EDKII/StandaloneMm [1] for which default build assumes
-unaligned accesses are permitted. Similar query exists for running
-Trusted Services on top of Hafnium [2].
-
-[1] https://github.com/tianocore/edk2/tree/master/StandaloneMmPkg
-[2] https://trusted-services.readthedocs.io/en/integration/
-
-Signed-off-by: Olivier Deprez <olivier.deprez@arm.com>
-Change-Id: I2906f4c712425fcfb31adbf89e2e3b9ca293f181
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/hafnium=
/hafnium/+/16195]
----
- src/arch/aarch64/hypervisor/cpu.c        |  9 ++++---
- src/arch/aarch64/hypervisor/exceptions.S | 32 ++++++++++++++++--------
- src/arch/aarch64/hypervisor/feature_id.c |  6 ++---
- src/arch/aarch64/hypervisor/handler.c    | 18 +++++++------
- src/arch/aarch64/inc/hf/arch/types.h     |  9 +++++--
- src/arch/aarch64/mm.c                    |  2 +-
- src/arch/aarch64/sysregs.c               | 11 ++++++--
- src/arch/aarch64/sysregs.h               |  2 +-
- 8 files changed, 59 insertions(+), 30 deletions(-)
-
-diff --git a/src/arch/aarch64/hypervisor/cpu.c b/src/arch/aarch64/hyperv=
isor/cpu.c
-index d2df77d8..a000159b 100644
---- a/src/arch/aarch64/hypervisor/cpu.c
-+++ b/src/arch/aarch64/hypervisor/cpu.c
-@@ -115,7 +115,9 @@ void arch_regs_reset(struct vcpu *vcpu)
- 		}
- 	}
-=20
--	r->hcr_el2 =3D get_hcr_el2_value(vm_id, vcpu->vm->el0_partition);
-+	r->hyp_state.hcr_el2 =3D
-+		get_hcr_el2_value(vm_id, vcpu->vm->el0_partition);
-+	r->hyp_state.sctlr_el2 =3D get_sctlr_el2_value(vcpu->vm->el0_partition=
);
- 	r->lazy.cnthctl_el2 =3D cnthctl;
- 	if (vcpu->vm->el0_partition) {
- 		CHECK(has_vhe_support());
-@@ -125,10 +127,11 @@ void arch_regs_reset(struct vcpu *vcpu)
- 		 * are ignored and treated as 0. There is no need to mask the
- 		 * VMID (used as asid) to only 8 bits.
- 		 */
--		r->ttbr0_el2 =3D pa_addr(table) | ((uint64_t)vm_id << 48);
-+		r->hyp_state.ttbr0_el2 =3D
-+			pa_addr(table) | ((uint64_t)vm_id << 48);
- 		r->spsr =3D PSR_PE_MODE_EL0T;
- 	} else {
--		r->ttbr0_el2 =3D read_msr(ttbr0_el2);
-+		r->hyp_state.ttbr0_el2 =3D read_msr(ttbr0_el2);
- 		r->lazy.vtcr_el2 =3D arch_mm_get_vtcr_el2();
- 		r->lazy.vttbr_el2 =3D pa_addr(table) | ((uint64_t)vm_id << 48);
- #if SECURE_WORLD =3D=3D 1
-diff --git a/src/arch/aarch64/hypervisor/exceptions.S b/src/arch/aarch64=
/hypervisor/exceptions.S
-index 539e196d..d3732f86 100644
---- a/src/arch/aarch64/hypervisor/exceptions.S
-+++ b/src/arch/aarch64/hypervisor/exceptions.S
-@@ -20,6 +20,9 @@
- #define ID_AA64PFR0_SVE_SHIFT (32)
- #define ID_AA64PFR0_SVE_LENGTH (4)
-=20
-+#define SCTLR_EL2_A_SHIFT	(1)
-+#define HCR_EL2_TGE_SHIFT	(27)
-+
- /**
-  * Saves the volatile registers into the register buffer of the current=
 vCPU.
-  */
-@@ -51,8 +54,6 @@
- 	mrs x1, elr_el2
- 	mrs x2, spsr_el2
- 	stp x1, x2, [x18, #VCPU_REGS + 8 * 31]
--	mrs x1, hcr_el2
--	str x1, [x18, #VCPU_REGS + 8 * 33]
- .endm
-=20
- /**
-@@ -871,12 +872,13 @@ vcpu_restore_volatile_and_run:
- 	msr elr_el2, x1
- 	msr spsr_el2, x2
-=20
--	ldr x1, [x0, #VCPU_REGS + 8 * 33]
-+	ldp x1, x2, [x0, #VCPU_REGS + 8 * 33]
- 	msr hcr_el2, x1
-+	msr ttbr0_el2, x2
- 	isb
-=20
--	ldr x1, [x0, #VCPU_REGS + 8 * 34]
--	msr ttbr0_el2, x1
-+	ldr x1, [x0, #VCPU_REGS + 8 * 35]
-+	msr sctlr_el2, x1
- 	isb
-=20
- 	/* Restore x0..x3, which we have used as scratch before. */
-@@ -886,15 +888,17 @@ vcpu_restore_volatile_and_run:
-=20
- #if ENABLE_VHE
- enable_vhe_tge:
-+	mrs x0, id_aa64mmfr1_el1
-+	tst x0, #0xf00
-+	b.eq 1f
-+
- 	/**
- 	 * Switch to host mode ({E2H, TGE} =3D {1,1}) when VHE is enabled.
- 	 * Note that E2H is always set when VHE is enabled.
- 	 */
--	mrs x0, id_aa64mmfr1_el1
--	tst x0, #0xf00
--	b.eq 1f
--	orr x1, x1, #(1 << 27)
--	msr hcr_el2, x1
-+	mrs x0, hcr_el2
-+	orr x0, x0, #(1 << HCR_EL2_TGE_SHIFT)
-+	msr hcr_el2, x0
- 	isb
-=20
- 	/**
-@@ -905,6 +909,14 @@ enable_vhe_tge:
- 	ldr x0, [x0]
- 	msr ttbr0_el2, x0
- 	isb
-+
-+	/**
-+	 * Enable alignment check while Hypervisor runs.
-+	 */
-+	mrs x0, sctlr_el2
-+	orr x0, x0, #(1 << SCTLR_EL2_A_SHIFT)
-+	msr sctlr_el2, x0
-+	isb
- 1:
- 	ret
- #endif
-diff --git a/src/arch/aarch64/hypervisor/feature_id.c b/src/arch/aarch64=
/hypervisor/feature_id.c
-index ed3bf8f1..57f32627 100644
---- a/src/arch/aarch64/hypervisor/feature_id.c
-+++ b/src/arch/aarch64/hypervisor/feature_id.c
-@@ -175,7 +175,7 @@ void feature_set_traps(struct vm *vm, struct arch_re=
gs *regs)
- 		~(ID_AA64MMFR1_EL1_VH_MASK << ID_AA64MMFR1_EL1_VH_SHIFT);
-=20
- 	if (features & HF_FEATURE_RAS) {
--		regs->hcr_el2 |=3D HCR_EL2_TERR;
-+		regs->hyp_state.hcr_el2 |=3D HCR_EL2_TERR;
- 		vm->arch.tid3_masks.id_aa64mmfr1_el1 &=3D
- 			~ID_AA64MMFR1_EL1_SPEC_SEI;
- 		vm->arch.tid3_masks.id_aa64pfr0_el1 &=3D ~ID_AA64PFR0_EL1_RAS;
-@@ -221,14 +221,14 @@ void feature_set_traps(struct vm *vm, struct arch_=
regs *regs)
- 	}
-=20
- 	if (features & HF_FEATURE_LOR) {
--		regs->hcr_el2 |=3D HCR_EL2_TLOR;
-+		regs->hyp_state.hcr_el2 |=3D HCR_EL2_TLOR;
-=20
- 		vm->arch.tid3_masks.id_aa64mmfr1_el1 &=3D ~ID_AA64MMFR1_EL1_LO;
- 	}
-=20
- 	if (features & HF_FEATURE_PAUTH) {
- 		/* APK and API bits *enable* trapping when cleared. */
--		regs->hcr_el2 &=3D ~(HCR_EL2_APK | HCR_EL2_API);
-+		regs->hyp_state.hcr_el2 &=3D ~(HCR_EL2_APK | HCR_EL2_API);
-=20
- 		vm->arch.tid3_masks.id_aa64isar1_el1 &=3D ~ID_AA64ISAR1_EL1_GPI;
- 		vm->arch.tid3_masks.id_aa64isar1_el1 &=3D ~ID_AA64ISAR1_EL1_GPA;
-diff --git a/src/arch/aarch64/hypervisor/handler.c b/src/arch/aarch64/hy=
pervisor/handler.c
-index cd5146bd..8a3d6289 100644
---- a/src/arch/aarch64/hypervisor/handler.c
-+++ b/src/arch/aarch64/hypervisor/handler.c
-@@ -272,9 +272,9 @@ noreturn void sync_current_exception_noreturn(uintre=
g_t elr, uintreg_t spsr)
- static void set_virtual_irq(struct arch_regs *r, bool enable)
- {
- 	if (enable) {
--		r->hcr_el2 |=3D HCR_EL2_VI;
-+		r->hyp_state.hcr_el2 |=3D HCR_EL2_VI;
- 	} else {
--		r->hcr_el2 &=3D ~HCR_EL2_VI;
-+		r->hyp_state.hcr_el2 &=3D ~HCR_EL2_VI;
- 	}
- }
-=20
-@@ -283,14 +283,15 @@ static void set_virtual_irq(struct arch_regs *r, b=
ool enable)
-  */
- static void set_virtual_irq_current(bool enable)
- {
--	uintreg_t hcr_el2 =3D current()->regs.hcr_el2;
-+	struct vcpu *vcpu =3D current();
-+	uintreg_t hcr_el2 =3D vcpu->regs.hyp_state.hcr_el2;
-=20
- 	if (enable) {
- 		hcr_el2 |=3D HCR_EL2_VI;
- 	} else {
- 		hcr_el2 &=3D ~HCR_EL2_VI;
- 	}
--	current()->regs.hcr_el2 =3D hcr_el2;
-+	vcpu->regs.hyp_state.hcr_el2 =3D hcr_el2;
- }
-=20
- /**
-@@ -300,9 +301,9 @@ static void set_virtual_irq_current(bool enable)
- static void set_virtual_fiq(struct arch_regs *r, bool enable)
- {
- 	if (enable) {
--		r->hcr_el2 |=3D HCR_EL2_VF;
-+		r->hyp_state.hcr_el2 |=3D HCR_EL2_VF;
- 	} else {
--		r->hcr_el2 &=3D ~HCR_EL2_VF;
-+		r->hyp_state.hcr_el2 &=3D ~HCR_EL2_VF;
- 	}
- }
-=20
-@@ -311,14 +312,15 @@ static void set_virtual_fiq(struct arch_regs *r, b=
ool enable)
-  */
- static void set_virtual_fiq_current(bool enable)
- {
--	uintreg_t hcr_el2 =3D current()->regs.hcr_el2;
-+	struct vcpu *vcpu =3D current();
-+	uintreg_t hcr_el2 =3D vcpu->regs.hyp_state.hcr_el2;
-=20
- 	if (enable) {
- 		hcr_el2 |=3D HCR_EL2_VF;
- 	} else {
- 		hcr_el2 &=3D ~HCR_EL2_VF;
- 	}
--	current()->regs.hcr_el2 =3D hcr_el2;
-+	vcpu->regs.hyp_state.hcr_el2 =3D hcr_el2;
- }
-=20
- #if SECURE_WORLD =3D=3D 1
-diff --git a/src/arch/aarch64/inc/hf/arch/types.h b/src/arch/aarch64/inc=
/hf/arch/types.h
-index 6379d73e..6b8b24f1 100644
---- a/src/arch/aarch64/inc/hf/arch/types.h
-+++ b/src/arch/aarch64/inc/hf/arch/types.h
-@@ -79,8 +79,13 @@ struct arch_regs {
- 	uintreg_t r[NUM_GP_REGS];
- 	uintreg_t pc;
- 	uintreg_t spsr;
--	uintreg_t hcr_el2;
--	uintreg_t ttbr0_el2;
-+
-+	/* Hypervisor configuration while a vCPU runs. */
-+	struct {
-+		uintreg_t hcr_el2;
-+		uintreg_t ttbr0_el2;
-+		uintreg_t sctlr_el2;
-+	} hyp_state;
-=20
- 	/*
- 	 * System registers.
-diff --git a/src/arch/aarch64/mm.c b/src/arch/aarch64/mm.c
-index 8ee65ca0..487ae353 100644
---- a/src/arch/aarch64/mm.c
-+++ b/src/arch/aarch64/mm.c
-@@ -886,7 +886,7 @@ bool arch_mm_init(paddr_t table)
- #endif
- 				    (0xff << (8 * STAGE1_NORMALINDX)),
-=20
--		.sctlr_el2 =3D get_sctlr_el2_value(),
-+		.sctlr_el2 =3D get_sctlr_el2_value(false),
- 		.vstcr_el2 =3D (1U << 31) |	    /* RES1. */
- 			     (0 << 30) |	    /* SA. */
- 			     (0 << 29) |	    /* SW. */
-diff --git a/src/arch/aarch64/sysregs.c b/src/arch/aarch64/sysregs.c
-index e8c154b1..087ba4ed 100644
---- a/src/arch/aarch64/sysregs.c
-+++ b/src/arch/aarch64/sysregs.c
-@@ -159,7 +159,7 @@ uintreg_t get_cptr_el2_value(void)
- /**
-  * Returns the value for SCTLR_EL2 for the CPU.
-  */
--uintreg_t get_sctlr_el2_value(void)
-+uintreg_t get_sctlr_el2_value(bool is_el0_partition)
- {
- 	uintreg_t sctlr_el2_value =3D 0;
-=20
-@@ -173,7 +173,14 @@ uintreg_t get_sctlr_el2_value(void)
-=20
- 	/* MMU-related bits. */
- 	sctlr_el2_value |=3D SCTLR_EL2_M;
--	sctlr_el2_value |=3D SCTLR_EL2_A;
-+
-+	/*
-+	 * Alignment check enabled, but in the case of an EL0 partition
-+	 * with VHE enabled.
-+	 */
-+	if (!(has_vhe_support() && is_el0_partition)) {
-+		sctlr_el2_value |=3D SCTLR_EL2_A;
-+	}
- 	sctlr_el2_value |=3D SCTLR_EL2_C;
- 	sctlr_el2_value |=3D SCTLR_EL2_SA;
- 	sctlr_el2_value |=3D SCTLR_EL2_I;
-diff --git a/src/arch/aarch64/sysregs.h b/src/arch/aarch64/sysregs.h
-index babd2375..6fdab58e 100644
---- a/src/arch/aarch64/sysregs.h
-+++ b/src/arch/aarch64/sysregs.h
-@@ -668,7 +668,7 @@ uintreg_t get_mdcr_el2_value(void);
-=20
- uintreg_t get_cptr_el2_value(void);
-=20
--uintreg_t get_sctlr_el2_value(void);
-+uintreg_t get_sctlr_el2_value(bool is_el0_partition);
-=20
- /**
-  * Branch Target Identification mechanism support in AArch64 state.
-
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0004-feat-vhe-set-=
STAGE1_NS-while-mapping-memory-from-NWd.patch b/meta-arm-bsp/recipes-bsp/=
hafnium/files/tc/0003-feat-vhe-set-STAGE1_NS-while-mapping-memory-from-NW=
d.patch
similarity index 89%
rename from meta-arm-bsp/recipes-bsp/hafnium/files/tc/0004-feat-vhe-set-S=
TAGE1_NS-while-mapping-memory-from-NWd.patch
rename to meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-feat-vhe-set-STA=
GE1_NS-while-mapping-memory-from-NWd.patch
index cfa7cfb7..cd19f632 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0004-feat-vhe-set-STAGE1_=
NS-while-mapping-memory-from-NWd.patch
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-feat-vhe-set-STAGE1_=
NS-while-mapping-memory-from-NWd.patch
@@ -1,4 +1,4 @@
-From 4b59905d2fec01cc17038b1c167b4e57e7835adf Mon Sep 17 00:00:00 2001
+From 41f3ff2f011da69ff81234769353955e51c7e588 Mon Sep 17 00:00:00 2001
 From: Davidson K <davidson.kumaresan@arm.com>
 Date: Thu, 7 Oct 2021 12:20:08 +0530
 Subject: [PATCH] feat(vhe): set STAGE1_NS while mapping memory from NWd =
to SWd
@@ -17,10 +17,10 @@ Upstream-Status: Pending [Not submitted to upstream y=
et]
  1 file changed, 12 insertions(+)
=20
 diff --git a/src/ffa_memory.c b/src/ffa_memory.c
-index 048cca9c..8910cc79 100644
+index 5826cb2fdd4b..bae677633dea 100644
 --- a/src/ffa_memory.c
 +++ b/src/ffa_memory.c
-@@ -2483,6 +2483,18 @@ struct ffa_value ffa_memory_retrieve(struct vm_lo=
cked to_locked,
+@@ -2618,6 +2618,18 @@ struct ffa_value ffa_memory_retrieve(struct vm_lo=
cked to_locked,
 =20
  	memory_to_attributes =3D ffa_memory_permissions_to_mode(
  		permissions, share_state->sender_orig_mode);
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc b/meta-arm-b=
sp/recipes-bsp/hafnium/hafnium-tc.inc
index 433d5612..09de6f1e 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
+++ b/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
@@ -3,21 +3,13 @@
 COMPATIBLE_MACHINE =3D "(tc?)"
 HAFNIUM_PLATFORM =3D "secure_tc"
=20
-# Intermediate SHA with 2.7 baseline version
-SRCREV =3D "dd0561820946fe23bcd57cc129140437f72102a5"
-PV =3D "2.7+git${SRCPV}"
-
 FILESEXTRAPATHS:prepend:tc :=3D "${THISDIR}/files/tc:"
=20
-SRC_URI:remove =3D "file://0003-Fix-build-with-clang-15.patch"
-
 SRC_URI:append =3D " \
         file://0001-feat-emulate-cntp-timer-register-accesses-using-cnth=
.patch \
         file://0002-feat-emulate-interrupt-controller-register-access.pa=
tch \
-        file://0003-feat-disable-alignment-check-for-EL0-partitions.patc=
h \
-        file://0004-feat-vhe-set-STAGE1_NS-while-mapping-memory-from-NWd=
.patch \
-        file://0001-tc-increase-heap-pages.patch;patchdir=3Dproject/refe=
rence \
-        file://0002-feat-vhe-enable-vhe-and-disable-branch-protection-fo=
.patch;patchdir=3Dproject/reference \
+        file://0003-feat-vhe-set-STAGE1_NS-while-mapping-memory-from-NWd=
.patch \
+        file://0001-feat-vhe-enable-vhe-and-disable-branch-protection-fo=
.patch;patchdir=3Dproject/reference \
         "
=20
 do_compile() {
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/0002-arm-hafnium-fix-ke=
rnel-tool-linking.patch b/meta-arm/recipes-bsp/hafnium/hafnium/0001-arm-h=
afnium-fix-kernel-tool-linking.patch
similarity index 86%
rename from meta-arm/recipes-bsp/hafnium/hafnium/0002-arm-hafnium-fix-ker=
nel-tool-linking.patch
rename to meta-arm/recipes-bsp/hafnium/hafnium/0001-arm-hafnium-fix-kerne=
l-tool-linking.patch
index 5c69b788..d4fe49ae 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium/0002-arm-hafnium-fix-kernel-to=
ol-linking.patch
+++ b/meta-arm/recipes-bsp/hafnium/hafnium/0001-arm-hafnium-fix-kernel-to=
ol-linking.patch
@@ -1,4 +1,4 @@
-From b54c7b4d325b7effbebe5bdd86d0cfceedb66b9d Mon Sep 17 00:00:00 2001
+From ef156578c1f7100b339ddfe956ff2cd89d61e0d4 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Tue, 9 Nov 2021 23:31:22 +0000
 Subject: [PATCH] arm/hafnium: fix kernel tool linking
@@ -11,16 +11,15 @@ ld: .../recipe-sysroot-native/usr/lib/pkgconfig/../..=
/../usr/lib/libcrypto.so: u
=20
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
-
 ---
  build/linux/linux.gni | 1 +
  1 file changed, 1 insertion(+)
=20
 diff --git a/build/linux/linux.gni b/build/linux/linux.gni
-index 45860fab..b0102544 100644
+index 497915290106..0e0167d5f485 100644
 --- a/build/linux/linux.gni
 +++ b/build/linux/linux.gni
-@@ -60,6 +60,7 @@ template("linux_kernel") {
+@@ -54,6 +54,7 @@ template("linux_kernel") {
      "LLVM=3D1",
      "LLVM_IAS=3D1",
      "CROSS_COMPILE=3Daarch64-linux-gnu-",
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/0001-define-_Noreturn-i=
f-needed.patch b/meta-arm/recipes-bsp/hafnium/hafnium/0001-define-_Noretu=
rn-if-needed.patch
deleted file mode 100644
index 8353fc12..00000000
--- a/meta-arm/recipes-bsp/hafnium/hafnium/0001-define-_Noreturn-if-neede=
d.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 3da6c62e6f56facf9c6a8d7d46fa9509e76f482e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 19 Apr 2022 22:32:56 -0700
-Subject: [PATCH] define _Noreturn if needed
-
-The new _Noreturn function specifier is not recognized by the parser and=
 shows as a syntax error:
-
-Fixes
-../git/inc/hf/panic.h:13:1: error: '_Noreturn' is a C11 extension [-Werr=
or,-Wc11-extensions]
-noreturn void panic(const char *fmt, ...);
-^
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- inc/hf/panic.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/inc/hf/panic.h b/inc/hf/panic.h
-index ec864e4f..588f1193 100644
---- a/inc/hf/panic.h
-+++ b/inc/hf/panic.h
-@@ -10,4 +10,8 @@
-=20
- #include <stdnoreturn.h>
-=20
-+#ifndef _Noreturn
-+#define _Noreturn __attribute__ ((noreturn))
-+#endif
-+
- noreturn void panic(const char *fmt, ...);
-
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/0003-Fix-build-with-cla=
ng-15.patch b/meta-arm/recipes-bsp/hafnium/hafnium/0002-Fix-build-with-cl=
ang-15.patch
similarity index 77%
rename from meta-arm/recipes-bsp/hafnium/hafnium/0003-Fix-build-with-clan=
g-15.patch
rename to meta-arm/recipes-bsp/hafnium/hafnium/0002-Fix-build-with-clang-=
15.patch
index f037d2b5..c305e97b 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium/0003-Fix-build-with-clang-15.p=
atch
+++ b/meta-arm/recipes-bsp/hafnium/hafnium/0002-Fix-build-with-clang-15.p=
atch
@@ -1,4 +1,4 @@
-From d96f696244e0869654004f49586b53811037db30 Mon Sep 17 00:00:00 2001
+From 960d022fa69568752a58b6f5d78e9759b54cff68 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 22 Sep 2022 19:13:49 -0700
 Subject: [PATCH] Fix build with clang-15
@@ -8,19 +8,17 @@ Remove unused variable suites_in_image
=20
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  test/hftest/common.c                                         | 2 --
- test/vmapi/arch/aarch64/gicv3/gicv3.c                        | 2 +-
  test/vmapi/arch/aarch64/gicv3/inc/gicv3.h                    | 2 +-
  test/vmapi/arch/aarch64/gicv3/timer_secondary.c              | 2 +-
  test/vmapi/el0_partitions/services/interruptible.c           | 2 +-
  test/vmapi/el0_partitions/services/interruptible_echo.c      | 2 +-
  test/vmapi/primary_with_secondaries/services/interruptible.c | 2 +-
- 7 files changed, 6 insertions(+), 8 deletions(-)
+ 6 files changed, 5 insertions(+), 7 deletions(-)
=20
 diff --git a/test/hftest/common.c b/test/hftest/common.c
-index 344ff24..175230a 100644
+index 344ff2452c36..175230a7cfa7 100644
 --- a/test/hftest/common.c
 +++ b/test/hftest/common.c
 @@ -67,7 +67,6 @@ void hftest_json(void)
@@ -39,31 +37,18 @@ index 344ff24..175230a 100644
  			suite =3D test->suite;
  			tests_in_suite =3D 0;
  			HFTEST_LOG("    {");
-diff --git a/test/vmapi/arch/aarch64/gicv3/gicv3.c b/test/vmapi/arch/aar=
ch64/gicv3/gicv3.c
-index 682bc4e..82582f0 100644
---- a/test/vmapi/arch/aarch64/gicv3/gicv3.c
-+++ b/test/vmapi/arch/aarch64/gicv3/gicv3.c
-@@ -42,7 +42,7 @@ static void irq(void)
- 	dlog("primary IRQ %d ended\n", interrupt_id);
- }
-=20
--void system_setup()
-+void system_setup(void)
- {
- 	const uint32_t mode =3D MM_MODE_R | MM_MODE_W | MM_MODE_D;
- 	hftest_mm_identity_map((void *)GICD_BASE, PAGE_SIZE, mode);
 diff --git a/test/vmapi/arch/aarch64/gicv3/inc/gicv3.h b/test/vmapi/arch=
/aarch64/gicv3/inc/gicv3.h
-index 5faf3a8..f681e58 100644
+index 28bf29d412f4..dede047a381a 100644
 --- a/test/vmapi/arch/aarch64/gicv3/inc/gicv3.h
 +++ b/test/vmapi/arch/aarch64/gicv3/inc/gicv3.h
 @@ -30,4 +30,4 @@ extern void *recv_buffer;
 =20
  extern volatile uint32_t last_interrupt_id;
 =20
--void system_setup();
-+void system_setup(void);
+-void gicv3_system_setup();
++void gicv3_system_setup(void);
 diff --git a/test/vmapi/arch/aarch64/gicv3/timer_secondary.c b/test/vmap=
i/arch/aarch64/gicv3/timer_secondary.c
-index ebc4db3..8260e10 100644
+index 0ac07f4411df..6264a5864721 100644
 --- a/test/vmapi/arch/aarch64/gicv3/timer_secondary.c
 +++ b/test/vmapi/arch/aarch64/gicv3/timer_secondary.c
 @@ -55,7 +55,7 @@ TEAR_DOWN(timer_secondary_ffa)
@@ -76,10 +61,10 @@ index ebc4db3..8260e10 100644
  	const char message[] =3D "loop 0099999";
  	const char expected_response[] =3D "Got IRQ 03.";
 diff --git a/test/vmapi/el0_partitions/services/interruptible.c b/test/v=
mapi/el0_partitions/services/interruptible.c
-index 0d00b16..3c3250d 100644
+index 85c97dc7a857..80fc61b2e5a9 100644
 --- a/test/vmapi/el0_partitions/services/interruptible.c
 +++ b/test/vmapi/el0_partitions/services/interruptible.c
-@@ -43,7 +43,7 @@ static void irq(void)
+@@ -44,7 +44,7 @@ static void irq(void)
   * Try to receive a message from the mailbox, blocking if necessary, an=
d
   * retrying if interrupted.
   */
@@ -89,10 +74,10 @@ index 0d00b16..3c3250d 100644
  	struct ffa_value received;
 =20
 diff --git a/test/vmapi/el0_partitions/services/interruptible_echo.c b/t=
est/vmapi/el0_partitions/services/interruptible_echo.c
-index b618cf2..636ebc9 100644
+index 958d75090cce..55511d6a2bce 100644
 --- a/test/vmapi/el0_partitions/services/interruptible_echo.c
 +++ b/test/vmapi/el0_partitions/services/interruptible_echo.c
-@@ -32,7 +32,7 @@ static void irq(void)
+@@ -33,7 +33,7 @@ static void irq(void)
   * Try to receive a message from the mailbox, blocking if necessary, an=
d
   * retrying if interrupted.
   */
@@ -102,10 +87,10 @@ index b618cf2..636ebc9 100644
  	struct ffa_value received;
 =20
 diff --git a/test/vmapi/primary_with_secondaries/services/interruptible.=
c b/test/vmapi/primary_with_secondaries/services/interruptible.c
-index cc1c1f9..c94093b 100644
+index 594f28ac8bc8..3888bf8b0b6e 100644
 --- a/test/vmapi/primary_with_secondaries/services/interruptible.c
 +++ b/test/vmapi/primary_with_secondaries/services/interruptible.c
-@@ -40,7 +40,7 @@ static void irq(void)
+@@ -41,7 +41,7 @@ static void irq(void)
   * Try to receive a message from the mailbox, blocking if necessary, an=
d
   * retrying if interrupted.
   */
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb b/meta-arm/recip=
es-bsp/hafnium/hafnium_2.8.bb
similarity index 90%
rename from meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb
rename to meta-arm/recipes-bsp/hafnium/hafnium_2.8.bb
index 564c203f..53027256 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.8.bb
@@ -14,13 +14,12 @@ CLANGNATIVE:runtime-llvm =3D "clang-native"
 inherit deploy python3native pkgconfig ${CLANGNATIVE}
=20
 SRC_URI =3D "gitsm://git.trustedfirmware.org/hafnium/hafnium.git;protoco=
l=3Dhttps;branch=3Dmaster \
-           file://0001-define-_Noreturn-if-needed.patch \
-           file://0002-arm-hafnium-fix-kernel-tool-linking.patch  \
-           file://0003-Fix-build-with-clang-15.patch \
+           file://0001-arm-hafnium-fix-kernel-tool-linking.patch  \
+           file://0002-Fix-build-with-clang-15.patch \
            file://0001-Use-pkg-config-native-to-find-the-libssl-headers.=
patch;patchdir=3Dthird_party/linux \
            file://0001-work-around-visibility-issue.patch;patchdir=3Dthi=
rd_party/dtc \
           "
-SRCREV =3D "79e9522d26fc2a88a44af149034acc27312b73a1"
+SRCREV =3D "b7d27acb9c63a52f8bd8a37d1eee335d4ccfbe93"
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
--=20
2.30.2


