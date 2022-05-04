Return-Path: <arunachalam.ganapathy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBDCC4167B
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 16:58:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.620.1651683514994189842
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 May 2022 09:58:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: arunachalam.ganapathy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 989E011FB;
	Wed,  4 May 2022 09:58:34 -0700 (PDT)
Received: from ts710.cambridge.arm.com (ts710.cambridge.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCAAC3FA27;
	Wed,  4 May 2022 09:58:33 -0700 (PDT)
From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 07/10] arm-bsp/linux: TC: Update backport patches of FFA
 driver
Date: Wed,  4 May 2022 17:58:17 +0100
Message-Id: <20220504165820.882784-7-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504165820.882784-1-arunachalam.ganapathy@arm.com>
References: <20220504165820.882784-1-arunachalam.ganapathy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 May 2022 16:58:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3363

This updates the existing FFA driver to the latest upstream version.

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: Idabf2d97cd497edc6c41e7132e1e82be8e717c59
---
 .../linux/linux-arm-platforms.inc             |   52 +-
 ...support-for-SMCCCv1.2-extended-input.patch |  188 --
 ...e-arm_ffa-Backport-of-arm_ffa-driver.patch | 1684 +++++++++++++++++
 ...-Add-initial-FFA-bus-support-for-dev.patch |  420 ----
 ...-add-sec_world_id-to-struct-tee_shm.patch} |    0
 ...a-Add-initial-Arm-FFA-driver-support.patch |  415 ----
 ...> 0010-optee-simplify-optee_release.patch} |    0
 ...-Add-support-for-SMCCC-as-transport-.patch |  115 --
 ...h =3D> 0011-optee-sync-OP-TEE-headers.patch} |    0
 ...-Setup-in-kernel-users-of-FFA-partit.patch |  398 ----
 ...ctor-driver-with-internal-callbacks.patch} |    0
 ..._ffa-Add-support-for-MEM_-interfaces.patch |  406 ----
 ...> 0013-optee-add-a-FF-A-memory-pool.patch} |    0
 ...atch =3D> 0014-optee-add-FF-A-support.patch} |    0
 ...esight-etm4x-Save-restore-TRFCR_EL1.patch} |    0
 ...se-Trace-Filtering-controls-dynamic.patch} |    0
 ...7-perf-arm-cmn-Use-irq_set_affinity.patch} |    0
 ...-cmn-Fix-CPU-hotplug-unregistration.patch} |    0
 ...f-arm-cmn-Account-for-NUMA-affinity.patch} |    0
 ...m-cmn-Drop-compile-test-restriction.patch} |    0
 ...021-arm_ffa-add-support-for-FFA-v1.1.patch |   37 -
 ...f-arm-cmn-Refactor-node-ID-handling.patch} |    0
 ...f-arm-cmn-Streamline-node-iteration.patch} |    0
 ...rivers-perf-arm-cmn-Add-space-after.patch} |    0
 ...-perf-arm-cmn-Refactor-DTM-handling.patch} |    0
 ...-arm-cmn-Optimise-DTM-counter-reads.patch} |    0
 ...m-cmn-Optimise-DTC-counter-accesses.patch} |    0
 ...ove-group-validation-data-off-stack.patch} |    0
 ...arm-cmn-Demarcate-CMN-600-specifics.patch} |    0
 ...erf-arm-cmn-Support-new-IP-features.patch} |    0
 ...030-perf-arm-cmn-Add-CI-700-Support.patch} |    0
 31 files changed, 1707 insertions(+), 2008 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0008-arm64-smccc-Add-support-for-SMCCCv1.2-extended-input.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0008-firmware-arm_ffa-Backport-of-arm_ffa-driver.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0009-firmware-arm_ffa-Add-initial-FFA-bus-support-for-dev.patch
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0014-t=
ee-add-sec_world_id-to-struct-tee_shm.patch =3D> 0009-tee-add-sec_world_i=
d-to-struct-tee_shm.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0010-firmware-arm_ffa-Add-initial-Arm-FFA-driver-support.patch
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0015-o=
ptee-simplify-optee_release.patch =3D> 0010-optee-simplify-optee_release.=
patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0011-firmware-arm_ffa-Add-support-for-SMCCC-as-transport-.patch
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0016-o=
ptee-sync-OP-TEE-headers.patch =3D> 0011-optee-sync-OP-TEE-headers.patch}=
 (100%)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0012-firmware-arm_ffa-Setup-in-kernel-users-of-FFA-partit.patch
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0017-o=
ptee-refactor-driver-with-internal-callbacks.patch =3D> 0012-optee-refact=
or-driver-with-internal-callbacks.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0013-firmware-arm_ffa-Add-support-for-MEM_-interfaces.patch
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0018-o=
ptee-add-a-FF-A-memory-pool.patch =3D> 0013-optee-add-a-FF-A-memory-pool.=
patch} (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0019-o=
ptee-add-FF-A-support.patch =3D> 0014-optee-add-FF-A-support.patch} (100%=
)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0022-c=
oresight-etm4x-Save-restore-TRFCR_EL1.patch =3D> 0015-coresight-etm4x-Sav=
e-restore-TRFCR_EL1.patch} (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0023-c=
oresight-etm4x-Use-Trace-Filtering-controls-dynamic.patch =3D> 0016-cores=
ight-etm4x-Use-Trace-Filtering-controls-dynamic.patch} (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0024-p=
erf-arm-cmn-Use-irq_set_affinity.patch =3D> 0017-perf-arm-cmn-Use-irq_set=
_affinity.patch} (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0025-p=
erf-arm-cmn-Fix-CPU-hotplug-unregistration.patch =3D> 0018-perf-arm-cmn-F=
ix-CPU-hotplug-unregistration.patch} (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0026-p=
erf-arm-cmn-Account-for-NUMA-affinity.patch =3D> 0019-perf-arm-cmn-Accoun=
t-for-NUMA-affinity.patch} (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0027-p=
erf-arm-cmn-Drop-compile-test-restriction.patch =3D> 0020-perf-arm-cmn-Dr=
op-compile-test-restriction.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0021-arm_ffa-add-support-for-FFA-v1.1.patch
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0028-p=
erf-arm-cmn-Refactor-node-ID-handling.patch =3D> 0021-perf-arm-cmn-Refact=
or-node-ID-handling.patch} (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0029-p=
erf-arm-cmn-Streamline-node-iteration.patch =3D> 0022-perf-arm-cmn-Stream=
line-node-iteration.patch} (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0030-d=
rivers-perf-arm-cmn-Add-space-after.patch =3D> 0023-drivers-perf-arm-cmn-=
Add-space-after.patch} (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0031-p=
erf-arm-cmn-Refactor-DTM-handling.patch =3D> 0024-perf-arm-cmn-Refactor-D=
TM-handling.patch} (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0032-p=
erf-arm-cmn-Optimise-DTM-counter-reads.patch =3D> 0025-perf-arm-cmn-Optim=
ise-DTM-counter-reads.patch} (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0033-p=
erf-arm-cmn-Optimise-DTC-counter-accesses.patch =3D> 0026-perf-arm-cmn-Op=
timise-DTC-counter-accesses.patch} (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0034-p=
erf-arm-cmn-Move-group-validation-data-off-stack.patch =3D> 0027-perf-arm=
-cmn-Move-group-validation-data-off-stack.patch} (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0035-p=
erf-arm-cmn-Demarcate-CMN-600-specifics.patch =3D> 0028-perf-arm-cmn-Dema=
rcate-CMN-600-specifics.patch} (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0036-p=
erf-arm-cmn-Support-new-IP-features.patch =3D> 0029-perf-arm-cmn-Support-=
new-IP-features.patch} (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0037-p=
erf-arm-cmn-Add-CI-700-Support.patch =3D> 0030-perf-arm-cmn-Add-CI-700-Su=
pport.patch} (100%)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index fc7df03a..ce2c7f93 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -143,35 +143,29 @@ SRC_URI:append:tc =3D " \
     file://0005-mailbox-arm_mhuv2-Fix-sparse-warnings.patch \
     file://0006-mailbox-arm_mhuv2-make-remove-callback-return-void.patch=
 \
     file://0007-mailbox-arm_mhuv2-Skip-calling-kfree-with-invalid-po.pat=
ch \
-    file://0008-arm64-smccc-Add-support-for-SMCCCv1.2-extended-input.pat=
ch \
-    file://0009-firmware-arm_ffa-Add-initial-FFA-bus-support-for-dev.pat=
ch \
-    file://0010-firmware-arm_ffa-Add-initial-Arm-FFA-driver-support.patc=
h \
-    file://0011-firmware-arm_ffa-Add-support-for-SMCCC-as-transport-.pat=
ch \
-    file://0012-firmware-arm_ffa-Setup-in-kernel-users-of-FFA-partit.pat=
ch \
-    file://0013-firmware-arm_ffa-Add-support-for-MEM_-interfaces.patch \
-    file://0014-tee-add-sec_world_id-to-struct-tee_shm.patch \
-    file://0015-optee-simplify-optee_release.patch \
-    file://0016-optee-sync-OP-TEE-headers.patch \
-    file://0017-optee-refactor-driver-with-internal-callbacks.patch \
-    file://0018-optee-add-a-FF-A-memory-pool.patch \
-    file://0019-optee-add-FF-A-support.patch \
-    file://0021-arm_ffa-add-support-for-FFA-v1.1.patch \
-    file://0022-coresight-etm4x-Save-restore-TRFCR_EL1.patch \
-    file://0023-coresight-etm4x-Use-Trace-Filtering-controls-dynamic.pat=
ch \
-    file://0024-perf-arm-cmn-Use-irq_set_affinity.patch \
-    file://0025-perf-arm-cmn-Fix-CPU-hotplug-unregistration.patch \
-    file://0026-perf-arm-cmn-Account-for-NUMA-affinity.patch \
-    file://0027-perf-arm-cmn-Drop-compile-test-restriction.patch \
-    file://0028-perf-arm-cmn-Refactor-node-ID-handling.patch \
-    file://0029-perf-arm-cmn-Streamline-node-iteration.patch \
-    file://0030-drivers-perf-arm-cmn-Add-space-after.patch \
-    file://0031-perf-arm-cmn-Refactor-DTM-handling.patch \
-    file://0032-perf-arm-cmn-Optimise-DTM-counter-reads.patch \
-    file://0033-perf-arm-cmn-Optimise-DTC-counter-accesses.patch \
-    file://0034-perf-arm-cmn-Move-group-validation-data-off-stack.patch =
\
-    file://0035-perf-arm-cmn-Demarcate-CMN-600-specifics.patch \
-    file://0036-perf-arm-cmn-Support-new-IP-features.patch \
-    file://0037-perf-arm-cmn-Add-CI-700-Support.patch \
+    file://0008-firmware-arm_ffa-Backport-of-arm_ffa-driver.patch \
+    file://0009-tee-add-sec_world_id-to-struct-tee_shm.patch \
+    file://0010-optee-simplify-optee_release.patch \
+    file://0011-optee-sync-OP-TEE-headers.patch \
+    file://0012-optee-refactor-driver-with-internal-callbacks.patch \
+    file://0013-optee-add-a-FF-A-memory-pool.patch \
+    file://0014-optee-add-FF-A-support.patch \
+    file://0015-coresight-etm4x-Save-restore-TRFCR_EL1.patch \
+    file://0016-coresight-etm4x-Use-Trace-Filtering-controls-dynamic.pat=
ch \
+    file://0017-perf-arm-cmn-Use-irq_set_affinity.patch \
+    file://0018-perf-arm-cmn-Fix-CPU-hotplug-unregistration.patch \
+    file://0019-perf-arm-cmn-Account-for-NUMA-affinity.patch \
+    file://0020-perf-arm-cmn-Drop-compile-test-restriction.patch \
+    file://0021-perf-arm-cmn-Refactor-node-ID-handling.patch \
+    file://0022-perf-arm-cmn-Streamline-node-iteration.patch \
+    file://0023-drivers-perf-arm-cmn-Add-space-after.patch \
+    file://0024-perf-arm-cmn-Refactor-DTM-handling.patch \
+    file://0025-perf-arm-cmn-Optimise-DTM-counter-reads.patch \
+    file://0026-perf-arm-cmn-Optimise-DTC-counter-accesses.patch \
+    file://0027-perf-arm-cmn-Move-group-validation-data-off-stack.patch =
\
+    file://0028-perf-arm-cmn-Demarcate-CMN-600-specifics.patch \
+    file://0029-perf-arm-cmn-Support-new-IP-features.patch \
+    file://0030-perf-arm-cmn-Add-CI-700-Support.patch \
     "
 KERNEL_FEATURES:append:tc =3D " bsp/arm-platforms/tc.scc"
 KERNEL_FEATURES:append:tc1 =3D " bsp/arm-platforms/tc-autofdo.scc"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
08-arm64-smccc-Add-support-for-SMCCCv1.2-extended-input.patch b/meta-arm-=
bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0008-arm64-smccc-Add-sup=
port-for-SMCCCv1.2-extended-input.patch
deleted file mode 100644
index fdd74689..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0008-arm6=
4-smccc-Add-support-for-SMCCCv1.2-extended-input.patch
+++ /dev/null
@@ -1,188 +0,0 @@
-From 8f51e94b1c2c605fee7376fdb7ebac6a8fe16789 Mon Sep 17 00:00:00 2001
-From: Sudeep Holla <sudeep.holla@arm.com>
-Date: Fri, 30 Apr 2021 11:24:24 +0100
-Subject: [PATCH 08/22] arm64: smccc: Add support for SMCCCv1.2 extended
- input/output registers
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-SMCCC v1.2 allows x8-x17 to be used as parameter registers and x4=E2=80=94=
x17
-to be used as result registers in SMC64/HVC64. Arm Firmware Framework
-for Armv8-A specification makes use of x0-x7 as parameter and result
-registers. There are other users like Hyper-V who intend to use beyond
-x0-x7 as well.
-
-Current SMCCC interface in the kernel just use x0-x7 as parameter and
-x0-x3 as result registers as required by SMCCCv1.0. Let us add new
-interface to support this extended set of input/output registers namely
-x0-x17 as both parameter and result registers.
-
-Acked-by: Mark Rutland <mark.rutland@arm.com>
-Tested-by: Michael Kelley <mikelley@microsoft.com>
-Reviewed-by: Michael Kelley <mikelley@microsoft.com>
-Cc: Will Deacon <will@kernel.org>
-Cc: Catalin Marinas <catalin.marinas@arm.com>
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/g=
it/sudeep.holla/linux.git/commit/?h=3Dv5.10/ffa&id=3Dd3d7f68912d370e80f7c=
293e04c8fecf76d704c5]
----
- arch/arm64/kernel/asm-offsets.c |  9 ++++++
- arch/arm64/kernel/smccc-call.S  | 57 +++++++++++++++++++++++++++++++++
- include/linux/arm-smccc.h       | 55 +++++++++++++++++++++++++++++++
- 3 files changed, 121 insertions(+)
-
-diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-off=
sets.c
-index 93da876a58e6..bad4a367da28 100644
---- a/arch/arm64/kernel/asm-offsets.c
-+++ b/arch/arm64/kernel/asm-offsets.c
-@@ -139,6 +139,15 @@ int main(void)
-   DEFINE(ARM_SMCCC_RES_X2_OFFS,		offsetof(struct arm_smccc_res, a2));
-   DEFINE(ARM_SMCCC_QUIRK_ID_OFFS,	offsetof(struct arm_smccc_quirk, id))=
;
-   DEFINE(ARM_SMCCC_QUIRK_STATE_OFFS,	offsetof(struct arm_smccc_quirk, s=
tate));
-+  DEFINE(ARM_SMCCC_1_2_REGS_X0_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a0));
-+  DEFINE(ARM_SMCCC_1_2_REGS_X2_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a2));
-+  DEFINE(ARM_SMCCC_1_2_REGS_X4_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a4));
-+  DEFINE(ARM_SMCCC_1_2_REGS_X6_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a6));
-+  DEFINE(ARM_SMCCC_1_2_REGS_X8_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a8));
-+  DEFINE(ARM_SMCCC_1_2_REGS_X10_OFFS,	offsetof(struct arm_smccc_1_2_reg=
s, a10));
-+  DEFINE(ARM_SMCCC_1_2_REGS_X12_OFFS,	offsetof(struct arm_smccc_1_2_reg=
s, a12));
-+  DEFINE(ARM_SMCCC_1_2_REGS_X14_OFFS,	offsetof(struct arm_smccc_1_2_reg=
s, a14));
-+  DEFINE(ARM_SMCCC_1_2_REGS_X16_OFFS,	offsetof(struct arm_smccc_1_2_reg=
s, a16));
-   BLANK();
-   DEFINE(HIBERN_PBE_ORIG,	offsetof(struct pbe, orig_address));
-   DEFINE(HIBERN_PBE_ADDR,	offsetof(struct pbe, address));
-diff --git a/arch/arm64/kernel/smccc-call.S b/arch/arm64/kernel/smccc-ca=
ll.S
-index d62447964ed9..2def9d0dd3dd 100644
---- a/arch/arm64/kernel/smccc-call.S
-+++ b/arch/arm64/kernel/smccc-call.S
-@@ -43,3 +43,60 @@ SYM_FUNC_START(__arm_smccc_hvc)
- 	SMCCC	hvc
- SYM_FUNC_END(__arm_smccc_hvc)
- EXPORT_SYMBOL(__arm_smccc_hvc)
-+
-+	.macro SMCCC_1_2 instr
-+	/* Save `res` and free a GPR that won't be clobbered */
-+	stp     x1, x19, [sp, #-16]!
-+
-+	/* Ensure `args` won't be clobbered while loading regs in next step */
-+	mov	x19, x0
-+
-+	/* Load the registers x0 - x17 from the struct arm_smccc_1_2_regs */
-+	ldp	x0, x1, [x19, #ARM_SMCCC_1_2_REGS_X0_OFFS]
-+	ldp	x2, x3, [x19, #ARM_SMCCC_1_2_REGS_X2_OFFS]
-+	ldp	x4, x5, [x19, #ARM_SMCCC_1_2_REGS_X4_OFFS]
-+	ldp	x6, x7, [x19, #ARM_SMCCC_1_2_REGS_X6_OFFS]
-+	ldp	x8, x9, [x19, #ARM_SMCCC_1_2_REGS_X8_OFFS]
-+	ldp	x10, x11, [x19, #ARM_SMCCC_1_2_REGS_X10_OFFS]
-+	ldp	x12, x13, [x19, #ARM_SMCCC_1_2_REGS_X12_OFFS]
-+	ldp	x14, x15, [x19, #ARM_SMCCC_1_2_REGS_X14_OFFS]
-+	ldp	x16, x17, [x19, #ARM_SMCCC_1_2_REGS_X16_OFFS]
-+
-+	\instr #0
-+
-+	/* Load the `res` from the stack */
-+	ldr	x19, [sp]
-+
-+	/* Store the registers x0 - x17 into the result structure */
-+	stp	x0, x1, [x19, #ARM_SMCCC_1_2_REGS_X0_OFFS]
-+	stp	x2, x3, [x19, #ARM_SMCCC_1_2_REGS_X2_OFFS]
-+	stp	x4, x5, [x19, #ARM_SMCCC_1_2_REGS_X4_OFFS]
-+	stp	x6, x7, [x19, #ARM_SMCCC_1_2_REGS_X6_OFFS]
-+	stp	x8, x9, [x19, #ARM_SMCCC_1_2_REGS_X8_OFFS]
-+	stp	x10, x11, [x19, #ARM_SMCCC_1_2_REGS_X10_OFFS]
-+	stp	x12, x13, [x19, #ARM_SMCCC_1_2_REGS_X12_OFFS]
-+	stp	x14, x15, [x19, #ARM_SMCCC_1_2_REGS_X14_OFFS]
-+	stp	x16, x17, [x19, #ARM_SMCCC_1_2_REGS_X16_OFFS]
-+
-+	/* Restore original x19 */
-+	ldp     xzr, x19, [sp], #16
-+	ret
-+.endm
-+
-+/*
-+ * void arm_smccc_1_2_hvc(const struct arm_smccc_1_2_regs *args,
-+ *			  struct arm_smccc_1_2_regs *res);
-+ */
-+SYM_FUNC_START(arm_smccc_1_2_hvc)
-+	SMCCC_1_2 hvc
-+SYM_FUNC_END(arm_smccc_1_2_hvc)
-+EXPORT_SYMBOL(arm_smccc_1_2_hvc)
-+
-+/*
-+ * void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
-+ *			  struct arm_smccc_1_2_regs *res);
-+ */
-+SYM_FUNC_START(arm_smccc_1_2_smc)
-+	SMCCC_1_2 smc
-+SYM_FUNC_END(arm_smccc_1_2_smc)
-+EXPORT_SYMBOL(arm_smccc_1_2_smc)
-diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
-index 62c54234576c..c8eb24af3c62 100644
---- a/include/linux/arm-smccc.h
-+++ b/include/linux/arm-smccc.h
-@@ -186,6 +186,61 @@ struct arm_smccc_res {
- 	unsigned long a3;
- };
-=20
-+#ifdef CONFIG_ARM64
-+/**
-+ * struct arm_smccc_1_2_regs - Arguments for or Results from SMC/HVC ca=
ll
-+ * @a0-a17 argument values from registers 0 to 17
-+ */
-+struct arm_smccc_1_2_regs {
-+	unsigned long a0;
-+	unsigned long a1;
-+	unsigned long a2;
-+	unsigned long a3;
-+	unsigned long a4;
-+	unsigned long a5;
-+	unsigned long a6;
-+	unsigned long a7;
-+	unsigned long a8;
-+	unsigned long a9;
-+	unsigned long a10;
-+	unsigned long a11;
-+	unsigned long a12;
-+	unsigned long a13;
-+	unsigned long a14;
-+	unsigned long a15;
-+	unsigned long a16;
-+	unsigned long a17;
-+};
-+
-+/**
-+ * arm_smccc_1_2_hvc() - make HVC calls
-+ * @args: arguments passed via struct arm_smccc_1_2_regs
-+ * @res: result values via struct arm_smccc_1_2_regs
-+ *
-+ * This function is used to make HVC calls following SMC Calling Conven=
tion
-+ * v1.2 or above. The content of the supplied param are copied from the
-+ * structure to registers prior to the HVC instruction. The return valu=
es
-+ * are updated with the content from registers on return from the HVC
-+ * instruction.
-+ */
-+asmlinkage void arm_smccc_1_2_hvc(const struct arm_smccc_1_2_regs *args=
,
-+				  struct arm_smccc_1_2_regs *res);
-+
-+/**
-+ * arm_smccc_1_2_smc() - make SMC calls
-+ * @args: arguments passed via struct arm_smccc_1_2_regs
-+ * @res: result values via struct arm_smccc_1_2_regs
-+ *
-+ * This function is used to make SMC calls following SMC Calling Conven=
tion
-+ * v1.2 or above. The content of the supplied param are copied from the
-+ * structure to registers prior to the SMC instruction. The return valu=
es
-+ * are updated with the content from registers on return from the SMC
-+ * instruction.
-+ */
-+asmlinkage void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args=
,
-+				  struct arm_smccc_1_2_regs *res);
-+#endif
-+
- /**
-  * struct arm_smccc_quirk - Contains quirk information
-  * @id: quirk identification
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
08-firmware-arm_ffa-Backport-of-arm_ffa-driver.patch b/meta-arm-bsp/recip=
es-kernel/linux/linux-arm64-ack-5.10/tc/0008-firmware-arm_ffa-Backport-of=
-arm_ffa-driver.patch
new file mode 100644
index 00000000..d91dbc57
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0008-firm=
ware-arm_ffa-Backport-of-arm_ffa-driver.patch
@@ -0,0 +1,1684 @@
+From 85df9333f0adf60fd76eb5ebb21b89c5b0a86c10 Mon Sep 17 00:00:00 2001
+From: Sudeep Holla <sudeep.holla@arm.com>
+Date: Tue, 18 May 2021 17:36:18 +0100
+Subject: [PATCH 01/32] firmware: arm_ffa: Backport of arm_ffa driver
+
+This is a backport of upstream ARM FFA driver from:
+https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git/c=
ommit/?h=3Dv5.10/ffa&id=3Dc0aff30cb9ad6a00c82acef0f2a48f99adf997c0
+
+to branch=3Dandroid12-5.10-lts
+
+   arm64: smccc: Add support for SMCCCv1.2 extended input/output registe=
rs
+   commit 3fdc0cb59d97f87e2cc708d424f1538e31744286 upstream.
+
+   firmware: arm_ffa: Add initial FFA bus support for device enumeration
+   commit e781858488b918e30a6ff28e9eab6058b787e3b3 upstream.
+
+   firmware: arm_ffa: Add initial Arm FFA driver support
+   commit 3bbfe9871005f38df2955b2e125933edf1d2feef upstream.
+
+   firmware: arm_ffa: Add support for SMCCC as transport to FFA driver
+   commit 714be77e976a4b013b935b3223b2ef68856084d0 upstream.
+
+   firmware: arm_ffa: Setup in-kernel users of FFA partitions
+   commit d0c0bce831223b08e5bade2cefc93c3ddb790796 upstream.
+
+   firmware: arm_ffa: Add support for MEM_* interfaces
+   commit cc2195fe536c28e192df5d07e6dd277af36814b4 upstream.
+
+   firmware: arm_ffa: Ensure drivers provide a probe function
+   commit 92743071464fca5acbbe812d9a0d88de3eaaad36 upstream.
+
+   firmware: arm_ffa: Simplify probe function
+   commit e362547addc39e4bb18ad5bdfd59ce4d512d0c08 upstream.
+
+   firmware: arm_ffa: Fix the comment style
+   commit ba684a31d3626c86cd9097e12d6ed57d224d077d upstream.
+
+   firmware: arm_ffa: Fix a possible ffa_linux_errmap buffer overflow
+   commit dd925db6f07556061c11ab1fbfa4a0145ae6b438 upstream.
+
+   firmware: arm_ffa: Add missing remove callback to ffa_bus_type
+   commit 244f5d597e1ea519c2085fbd9819458688775e42 upstream.
+
+   firmware: arm_ffa: Fix __ffa_devices_unregister
+   commit eb7b52e6db7c21400b9b2d539f9343fb6e94bd94 upstream.
+
+   firmware: arm_ffa: Handle compatibility with different firmware versi=
ons
+   commit 8e3f9da608f14cfebac2659d8dd8737b79d01308 upstream.
+
+   firmware: arm_ffa: Add support for MEM_LEND
+   commit 82a8daaecfd9382e9450a05f86be8a274cf69a27 upstream.
+
+   firmware: arm_ffa: Remove unused 'compat_version' variable
+   commit 01537a078b86917c7bb69aa4b756b42b980c158b upstream.
+
+Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
+Change-Id: If9df40d2d10be9e3c95298820bc20c201ea1774c
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+
+Upstream-Status: Backport
+Change-Id: I8e6197d8b7ef6654dacd21450069b8e284a3cec5
+---
+ MAINTAINERS                       |   7 +
+ arch/arm64/kernel/asm-offsets.c   |   9 +
+ arch/arm64/kernel/smccc-call.S    |  57 +++
+ drivers/firmware/Kconfig          |   1 +
+ drivers/firmware/Makefile         |   1 +
+ drivers/firmware/arm_ffa/Kconfig  |  21 +
+ drivers/firmware/arm_ffa/Makefile |   6 +
+ drivers/firmware/arm_ffa/bus.c    | 220 +++++++++
+ drivers/firmware/arm_ffa/common.h |  31 ++
+ drivers/firmware/arm_ffa/driver.c | 776 ++++++++++++++++++++++++++++++
+ drivers/firmware/arm_ffa/smccc.c  |  39 ++
+ include/linux/arm-smccc.h         |  55 +++
+ include/linux/arm_ffa.h           | 269 +++++++++++
+ 13 files changed, 1492 insertions(+)
+ create mode 100644 drivers/firmware/arm_ffa/Kconfig
+ create mode 100644 drivers/firmware/arm_ffa/Makefile
+ create mode 100644 drivers/firmware/arm_ffa/bus.c
+ create mode 100644 drivers/firmware/arm_ffa/common.h
+ create mode 100644 drivers/firmware/arm_ffa/driver.c
+ create mode 100644 drivers/firmware/arm_ffa/smccc.c
+ create mode 100644 include/linux/arm_ffa.h
+
+diff --git a/MAINTAINERS b/MAINTAINERS
+index 5234423c477a..d5fdc9e68c89 100644
+--- a/MAINTAINERS
++++ b/MAINTAINERS
+@@ -6847,6 +6847,13 @@ F:	include/linux/firewire.h
+ F:	include/uapi/linux/firewire*.h
+ F:	tools/firewire/
+=20
++FIRMWARE FRAMEWORK FOR ARMV8-A
++M:	Sudeep Holla <sudeep.holla@arm.com>
++L:	linux-arm-kernel@lists.infradead.org
++S:	Maintained
++F:	drivers/firmware/arm_ffa/
++F:	include/linux/arm_ffa.h
++
+ FIRMWARE LOADER (request_firmware)
+ M:	Luis Chamberlain <mcgrof@kernel.org>
+ L:	linux-kernel@vger.kernel.org
+diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-off=
sets.c
+index 93da876a58e6..bad4a367da28 100644
+--- a/arch/arm64/kernel/asm-offsets.c
++++ b/arch/arm64/kernel/asm-offsets.c
+@@ -139,6 +139,15 @@ int main(void)
+   DEFINE(ARM_SMCCC_RES_X2_OFFS,		offsetof(struct arm_smccc_res, a2));
+   DEFINE(ARM_SMCCC_QUIRK_ID_OFFS,	offsetof(struct arm_smccc_quirk, id))=
;
+   DEFINE(ARM_SMCCC_QUIRK_STATE_OFFS,	offsetof(struct arm_smccc_quirk, s=
tate));
++  DEFINE(ARM_SMCCC_1_2_REGS_X0_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a0));
++  DEFINE(ARM_SMCCC_1_2_REGS_X2_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a2));
++  DEFINE(ARM_SMCCC_1_2_REGS_X4_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a4));
++  DEFINE(ARM_SMCCC_1_2_REGS_X6_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a6));
++  DEFINE(ARM_SMCCC_1_2_REGS_X8_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a8));
++  DEFINE(ARM_SMCCC_1_2_REGS_X10_OFFS,	offsetof(struct arm_smccc_1_2_reg=
s, a10));
++  DEFINE(ARM_SMCCC_1_2_REGS_X12_OFFS,	offsetof(struct arm_smccc_1_2_reg=
s, a12));
++  DEFINE(ARM_SMCCC_1_2_REGS_X14_OFFS,	offsetof(struct arm_smccc_1_2_reg=
s, a14));
++  DEFINE(ARM_SMCCC_1_2_REGS_X16_OFFS,	offsetof(struct arm_smccc_1_2_reg=
s, a16));
+   BLANK();
+   DEFINE(HIBERN_PBE_ORIG,	offsetof(struct pbe, orig_address));
+   DEFINE(HIBERN_PBE_ADDR,	offsetof(struct pbe, address));
+diff --git a/arch/arm64/kernel/smccc-call.S b/arch/arm64/kernel/smccc-ca=
ll.S
+index d62447964ed9..2def9d0dd3dd 100644
+--- a/arch/arm64/kernel/smccc-call.S
++++ b/arch/arm64/kernel/smccc-call.S
+@@ -43,3 +43,60 @@ SYM_FUNC_START(__arm_smccc_hvc)
+ 	SMCCC	hvc
+ SYM_FUNC_END(__arm_smccc_hvc)
+ EXPORT_SYMBOL(__arm_smccc_hvc)
++
++	.macro SMCCC_1_2 instr
++	/* Save `res` and free a GPR that won't be clobbered */
++	stp     x1, x19, [sp, #-16]!
++
++	/* Ensure `args` won't be clobbered while loading regs in next step */
++	mov	x19, x0
++
++	/* Load the registers x0 - x17 from the struct arm_smccc_1_2_regs */
++	ldp	x0, x1, [x19, #ARM_SMCCC_1_2_REGS_X0_OFFS]
++	ldp	x2, x3, [x19, #ARM_SMCCC_1_2_REGS_X2_OFFS]
++	ldp	x4, x5, [x19, #ARM_SMCCC_1_2_REGS_X4_OFFS]
++	ldp	x6, x7, [x19, #ARM_SMCCC_1_2_REGS_X6_OFFS]
++	ldp	x8, x9, [x19, #ARM_SMCCC_1_2_REGS_X8_OFFS]
++	ldp	x10, x11, [x19, #ARM_SMCCC_1_2_REGS_X10_OFFS]
++	ldp	x12, x13, [x19, #ARM_SMCCC_1_2_REGS_X12_OFFS]
++	ldp	x14, x15, [x19, #ARM_SMCCC_1_2_REGS_X14_OFFS]
++	ldp	x16, x17, [x19, #ARM_SMCCC_1_2_REGS_X16_OFFS]
++
++	\instr #0
++
++	/* Load the `res` from the stack */
++	ldr	x19, [sp]
++
++	/* Store the registers x0 - x17 into the result structure */
++	stp	x0, x1, [x19, #ARM_SMCCC_1_2_REGS_X0_OFFS]
++	stp	x2, x3, [x19, #ARM_SMCCC_1_2_REGS_X2_OFFS]
++	stp	x4, x5, [x19, #ARM_SMCCC_1_2_REGS_X4_OFFS]
++	stp	x6, x7, [x19, #ARM_SMCCC_1_2_REGS_X6_OFFS]
++	stp	x8, x9, [x19, #ARM_SMCCC_1_2_REGS_X8_OFFS]
++	stp	x10, x11, [x19, #ARM_SMCCC_1_2_REGS_X10_OFFS]
++	stp	x12, x13, [x19, #ARM_SMCCC_1_2_REGS_X12_OFFS]
++	stp	x14, x15, [x19, #ARM_SMCCC_1_2_REGS_X14_OFFS]
++	stp	x16, x17, [x19, #ARM_SMCCC_1_2_REGS_X16_OFFS]
++
++	/* Restore original x19 */
++	ldp     xzr, x19, [sp], #16
++	ret
++.endm
++
++/*
++ * void arm_smccc_1_2_hvc(const struct arm_smccc_1_2_regs *args,
++ *			  struct arm_smccc_1_2_regs *res);
++ */
++SYM_FUNC_START(arm_smccc_1_2_hvc)
++	SMCCC_1_2 hvc
++SYM_FUNC_END(arm_smccc_1_2_hvc)
++EXPORT_SYMBOL(arm_smccc_1_2_hvc)
++
++/*
++ * void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
++ *			  struct arm_smccc_1_2_regs *res);
++ */
++SYM_FUNC_START(arm_smccc_1_2_smc)
++	SMCCC_1_2 smc
++SYM_FUNC_END(arm_smccc_1_2_smc)
++EXPORT_SYMBOL(arm_smccc_1_2_smc)
+diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
+index bfef3d8d14e7..90e6dd32f2cd 100644
+--- a/drivers/firmware/Kconfig
++++ b/drivers/firmware/Kconfig
+@@ -296,6 +296,7 @@ config TURRIS_MOX_RWTM
+ 	  other manufacturing data and also utilize the Entropy Bit Generator
+ 	  for hardware random number generation.
+=20
++source "drivers/firmware/arm_ffa/Kconfig"
+ source "drivers/firmware/broadcom/Kconfig"
+ source "drivers/firmware/google/Kconfig"
+ source "drivers/firmware/efi/Kconfig"
+diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
+index 523173cbff33..3c2af2e98def 100644
+--- a/drivers/firmware/Makefile
++++ b/drivers/firmware/Makefile
+@@ -23,6 +23,7 @@ obj-$(CONFIG_TI_SCI_PROTOCOL)	+=3D ti_sci.o
+ obj-$(CONFIG_TRUSTED_FOUNDATIONS) +=3D trusted_foundations.o
+ obj-$(CONFIG_TURRIS_MOX_RWTM)	+=3D turris-mox-rwtm.o
+=20
++obj-y				+=3D arm_ffa/
+ obj-y				+=3D arm_scmi/
+ obj-y				+=3D broadcom/
+ obj-y				+=3D meson/
+diff --git a/drivers/firmware/arm_ffa/Kconfig b/drivers/firmware/arm_ffa=
/Kconfig
+new file mode 100644
+index 000000000000..5e3ae5cf82e8
+--- /dev/null
++++ b/drivers/firmware/arm_ffa/Kconfig
+@@ -0,0 +1,21 @@
++# SPDX-License-Identifier: GPL-2.0-only
++config ARM_FFA_TRANSPORT
++	tristate "Arm Firmware Framework for Armv8-A"
++	depends on OF
++	depends on ARM64
++	default n
++	help
++	  This Firmware Framework(FF) for Arm A-profile processors describes
++	  interfaces that standardize communication between the various
++	  software images which includes communication between images in
++	  the Secure world and Normal world. It also leverages the
++	  virtualization extension to isolate software images provided
++	  by an ecosystem of vendors from each other.
++
++	  This driver provides interface for all the client drivers making
++	  use of the features offered by ARM FF-A.
++
++config ARM_FFA_SMCCC
++	bool
++	default ARM_FFA_TRANSPORT
++	depends on ARM64 && HAVE_ARM_SMCCC_DISCOVERY
+diff --git a/drivers/firmware/arm_ffa/Makefile b/drivers/firmware/arm_ff=
a/Makefile
+new file mode 100644
+index 000000000000..9d9f37523200
+--- /dev/null
++++ b/drivers/firmware/arm_ffa/Makefile
+@@ -0,0 +1,6 @@
++# SPDX-License-Identifier: GPL-2.0-only
++ffa-bus-y =3D bus.o
++ffa-driver-y =3D driver.o
++ffa-transport-$(CONFIG_ARM_FFA_SMCCC) +=3D smccc.o
++ffa-module-objs :=3D $(ffa-bus-y) $(ffa-driver-y) $(ffa-transport-y)
++obj-$(CONFIG_ARM_FFA_TRANSPORT) =3D ffa-module.o
+diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/b=
us.c
+new file mode 100644
+index 000000000000..fca1e311ea6c
+--- /dev/null
++++ b/drivers/firmware/arm_ffa/bus.c
+@@ -0,0 +1,220 @@
++// SPDX-License-Identifier: GPL-2.0
++/*
++ * Copyright (C) 2021 ARM Ltd.
++ */
++
++#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
++
++#include <linux/arm_ffa.h>
++#include <linux/device.h>
++#include <linux/fs.h>
++#include <linux/kernel.h>
++#include <linux/module.h>
++#include <linux/slab.h>
++#include <linux/types.h>
++
++#include "common.h"
++
++static int ffa_device_match(struct device *dev, struct device_driver *d=
rv)
++{
++	const struct ffa_device_id *id_table;
++	struct ffa_device *ffa_dev;
++
++	id_table =3D to_ffa_driver(drv)->id_table;
++	ffa_dev =3D to_ffa_dev(dev);
++
++	while (!uuid_is_null(&id_table->uuid)) {
++		/*
++		 * FF-A v1.0 doesn't provide discovery of UUIDs, just the
++		 * partition IDs, so fetch the partitions IDs for this
++		 * id_table UUID and assign the UUID to the device if the
++		 * partition ID matches
++		 */
++		if (uuid_is_null(&ffa_dev->uuid))
++			ffa_device_match_uuid(ffa_dev, &id_table->uuid);
++
++		if (uuid_equal(&ffa_dev->uuid, &id_table->uuid))
++			return 1;
++		id_table++;
++	}
++
++	return 0;
++}
++
++static int ffa_device_probe(struct device *dev)
++{
++	struct ffa_driver *ffa_drv =3D to_ffa_driver(dev->driver);
++	struct ffa_device *ffa_dev =3D to_ffa_dev(dev);
++
++	return ffa_drv->probe(ffa_dev);
++}
++
++static int ffa_device_remove(struct device *dev)
++{
++	struct ffa_driver *ffa_drv =3D to_ffa_driver(dev->driver);
++
++	ffa_drv->remove(to_ffa_dev(dev));
++
++	return 0;
++}
++
++static int ffa_device_uevent(struct device *dev, struct kobj_uevent_env=
 *env)
++{
++	struct ffa_device *ffa_dev =3D to_ffa_dev(dev);
++
++	return add_uevent_var(env, "MODALIAS=3Darm_ffa:%04x:%pUb",
++			      ffa_dev->vm_id, &ffa_dev->uuid);
++}
++
++static ssize_t partition_id_show(struct device *dev,
++				 struct device_attribute *attr, char *buf)
++{
++	struct ffa_device *ffa_dev =3D to_ffa_dev(dev);
++
++	return sprintf(buf, "0x%04x\n", ffa_dev->vm_id);
++}
++static DEVICE_ATTR_RO(partition_id);
++
++static ssize_t uuid_show(struct device *dev, struct device_attribute *a=
ttr,
++			 char *buf)
++{
++	struct ffa_device *ffa_dev =3D to_ffa_dev(dev);
++
++	return sprintf(buf, "%pUb\n", &ffa_dev->uuid);
++}
++static DEVICE_ATTR_RO(uuid);
++
++static struct attribute *ffa_device_attributes_attrs[] =3D {
++	&dev_attr_partition_id.attr,
++	&dev_attr_uuid.attr,
++	NULL,
++};
++ATTRIBUTE_GROUPS(ffa_device_attributes);
++
++struct bus_type ffa_bus_type =3D {
++	.name		=3D "arm_ffa",
++	.match		=3D ffa_device_match,
++	.probe		=3D ffa_device_probe,
++	.remove		=3D ffa_device_remove,
++	.uevent		=3D ffa_device_uevent,
++	.dev_groups	=3D ffa_device_attributes_groups,
++};
++EXPORT_SYMBOL_GPL(ffa_bus_type);
++
++int ffa_driver_register(struct ffa_driver *driver, struct module *owner=
,
++			const char *mod_name)
++{
++	int ret;
++
++	if (!driver->probe)
++		return -EINVAL;
++
++	driver->driver.bus =3D &ffa_bus_type;
++	driver->driver.name =3D driver->name;
++	driver->driver.owner =3D owner;
++	driver->driver.mod_name =3D mod_name;
++
++	ret =3D driver_register(&driver->driver);
++	if (!ret)
++		pr_debug("registered new ffa driver %s\n", driver->name);
++
++	return ret;
++}
++EXPORT_SYMBOL_GPL(ffa_driver_register);
++
++void ffa_driver_unregister(struct ffa_driver *driver)
++{
++	driver_unregister(&driver->driver);
++}
++EXPORT_SYMBOL_GPL(ffa_driver_unregister);
++
++static void ffa_release_device(struct device *dev)
++{
++	struct ffa_device *ffa_dev =3D to_ffa_dev(dev);
++
++	kfree(ffa_dev);
++}
++
++static int __ffa_devices_unregister(struct device *dev, void *data)
++{
++	device_unregister(dev);
++
++	return 0;
++}
++
++static void ffa_devices_unregister(void)
++{
++	bus_for_each_dev(&ffa_bus_type, NULL, NULL,
++			 __ffa_devices_unregister);
++}
++
++bool ffa_device_is_valid(struct ffa_device *ffa_dev)
++{
++	bool valid =3D false;
++	struct device *dev =3D NULL;
++	struct ffa_device *tmp_dev;
++
++	do {
++		dev =3D bus_find_next_device(&ffa_bus_type, dev);
++		tmp_dev =3D to_ffa_dev(dev);
++		if (tmp_dev =3D=3D ffa_dev) {
++			valid =3D true;
++			break;
++		}
++		put_device(dev);
++	} while (dev);
++
++	put_device(dev);
++
++	return valid;
++}
++
++struct ffa_device *ffa_device_register(const uuid_t *uuid, int vm_id)
++{
++	int ret;
++	struct device *dev;
++	struct ffa_device *ffa_dev;
++
++	ffa_dev =3D kzalloc(sizeof(*ffa_dev), GFP_KERNEL);
++	if (!ffa_dev)
++		return NULL;
++
++	dev =3D &ffa_dev->dev;
++	dev->bus =3D &ffa_bus_type;
++	dev->release =3D ffa_release_device;
++	dev_set_name(&ffa_dev->dev, "arm-ffa-%04x", vm_id);
++
++	ffa_dev->vm_id =3D vm_id;
++	uuid_copy(&ffa_dev->uuid, uuid);
++
++	ret =3D device_register(&ffa_dev->dev);
++	if (ret) {
++		dev_err(dev, "unable to register device %s err=3D%d\n",
++			dev_name(dev), ret);
++		put_device(dev);
++		return NULL;
++	}
++
++	return ffa_dev;
++}
++EXPORT_SYMBOL_GPL(ffa_device_register);
++
++void ffa_device_unregister(struct ffa_device *ffa_dev)
++{
++	if (!ffa_dev)
++		return;
++
++	device_unregister(&ffa_dev->dev);
++}
++EXPORT_SYMBOL_GPL(ffa_device_unregister);
++
++int arm_ffa_bus_init(void)
++{
++	return bus_register(&ffa_bus_type);
++}
++
++void arm_ffa_bus_exit(void)
++{
++	ffa_devices_unregister();
++	bus_unregister(&ffa_bus_type);
++}
+diff --git a/drivers/firmware/arm_ffa/common.h b/drivers/firmware/arm_ff=
a/common.h
+new file mode 100644
+index 000000000000..d6eccf1fd3f6
+--- /dev/null
++++ b/drivers/firmware/arm_ffa/common.h
+@@ -0,0 +1,31 @@
++/* SPDX-License-Identifier: GPL-2.0 */
++/*
++ * Copyright (C) 2021 ARM Ltd.
++ */
++
++#ifndef _FFA_COMMON_H
++#define _FFA_COMMON_H
++
++#include <linux/arm_ffa.h>
++#include <linux/arm-smccc.h>
++#include <linux/err.h>
++
++typedef struct arm_smccc_1_2_regs ffa_value_t;
++
++typedef void (ffa_fn)(ffa_value_t, ffa_value_t *);
++
++int arm_ffa_bus_init(void);
++void arm_ffa_bus_exit(void);
++bool ffa_device_is_valid(struct ffa_device *ffa_dev);
++void ffa_device_match_uuid(struct ffa_device *ffa_dev, const uuid_t *uu=
id);
++
++#ifdef CONFIG_ARM_FFA_SMCCC
++int __init ffa_transport_init(ffa_fn **invoke_ffa_fn);
++#else
++static inline int __init ffa_transport_init(ffa_fn **invoke_ffa_fn)
++{
++	return -EOPNOTSUPP;
++}
++#endif
++
++#endif /* _FFA_COMMON_H */
+diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ff=
a/driver.c
+new file mode 100644
+index 000000000000..14f900047ac0
+--- /dev/null
++++ b/drivers/firmware/arm_ffa/driver.c
+@@ -0,0 +1,776 @@
++// SPDX-License-Identifier: GPL-2.0-only
++/*
++ * Arm Firmware Framework for ARMv8-A(FFA) interface driver
++ *
++ * The Arm FFA specification[1] describes a software architecture to
++ * leverages the virtualization extension to isolate software images
++ * provided by an ecosystem of vendors from each other and describes
++ * interfaces that standardize communication between the various softwa=
re
++ * images including communication between images in the Secure world an=
d
++ * Normal world. Any Hypervisor could use the FFA interfaces to enable
++ * communication between VMs it manages.
++ *
++ * The Hypervisor a.k.a Partition managers in FFA terminology can assig=
n
++ * system resources(Memory regions, Devices, CPU cycles) to the partiti=
ons
++ * and manage isolation amongst them.
++ *
++ * [1] https://developer.arm.com/docs/den0077/latest
++ *
++ * Copyright (C) 2021 ARM Ltd.
++ */
++
++#define DRIVER_NAME "ARM FF-A"
++#define pr_fmt(fmt) DRIVER_NAME ": " fmt
++
++#include <linux/arm_ffa.h>
++#include <linux/bitfield.h>
++#include <linux/device.h>
++#include <linux/io.h>
++#include <linux/kernel.h>
++#include <linux/module.h>
++#include <linux/mm.h>
++#include <linux/scatterlist.h>
++#include <linux/slab.h>
++#include <linux/uuid.h>
++
++#include "common.h"
++
++#define FFA_DRIVER_VERSION	FFA_VERSION_1_0
++
++#define FFA_SMC(calling_convention, func_num)				\
++	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, (calling_convention),	\
++			   ARM_SMCCC_OWNER_STANDARD, (func_num))
++
++#define FFA_SMC_32(func_num)	FFA_SMC(ARM_SMCCC_SMC_32, (func_num))
++#define FFA_SMC_64(func_num)	FFA_SMC(ARM_SMCCC_SMC_64, (func_num))
++
++#define FFA_ERROR			FFA_SMC_32(0x60)
++#define FFA_SUCCESS			FFA_SMC_32(0x61)
++#define FFA_INTERRUPT			FFA_SMC_32(0x62)
++#define FFA_VERSION			FFA_SMC_32(0x63)
++#define FFA_FEATURES			FFA_SMC_32(0x64)
++#define FFA_RX_RELEASE			FFA_SMC_32(0x65)
++#define FFA_RXTX_MAP			FFA_SMC_32(0x66)
++#define FFA_FN64_RXTX_MAP		FFA_SMC_64(0x66)
++#define FFA_RXTX_UNMAP			FFA_SMC_32(0x67)
++#define FFA_PARTITION_INFO_GET		FFA_SMC_32(0x68)
++#define FFA_ID_GET			FFA_SMC_32(0x69)
++#define FFA_MSG_POLL			FFA_SMC_32(0x6A)
++#define FFA_MSG_WAIT			FFA_SMC_32(0x6B)
++#define FFA_YIELD			FFA_SMC_32(0x6C)
++#define FFA_RUN				FFA_SMC_32(0x6D)
++#define FFA_MSG_SEND			FFA_SMC_32(0x6E)
++#define FFA_MSG_SEND_DIRECT_REQ		FFA_SMC_32(0x6F)
++#define FFA_FN64_MSG_SEND_DIRECT_REQ	FFA_SMC_64(0x6F)
++#define FFA_MSG_SEND_DIRECT_RESP	FFA_SMC_32(0x70)
++#define FFA_FN64_MSG_SEND_DIRECT_RESP	FFA_SMC_64(0x70)
++#define FFA_MEM_DONATE			FFA_SMC_32(0x71)
++#define FFA_FN64_MEM_DONATE		FFA_SMC_64(0x71)
++#define FFA_MEM_LEND			FFA_SMC_32(0x72)
++#define FFA_FN64_MEM_LEND		FFA_SMC_64(0x72)
++#define FFA_MEM_SHARE			FFA_SMC_32(0x73)
++#define FFA_FN64_MEM_SHARE		FFA_SMC_64(0x73)
++#define FFA_MEM_RETRIEVE_REQ		FFA_SMC_32(0x74)
++#define FFA_FN64_MEM_RETRIEVE_REQ	FFA_SMC_64(0x74)
++#define FFA_MEM_RETRIEVE_RESP		FFA_SMC_32(0x75)
++#define FFA_MEM_RELINQUISH		FFA_SMC_32(0x76)
++#define FFA_MEM_RECLAIM			FFA_SMC_32(0x77)
++#define FFA_MEM_OP_PAUSE		FFA_SMC_32(0x78)
++#define FFA_MEM_OP_RESUME		FFA_SMC_32(0x79)
++#define FFA_MEM_FRAG_RX			FFA_SMC_32(0x7A)
++#define FFA_MEM_FRAG_TX			FFA_SMC_32(0x7B)
++#define FFA_NORMAL_WORLD_RESUME		FFA_SMC_32(0x7C)
++
++/*
++ * For some calls it is necessary to use SMC64 to pass or return 64-bit=
 values.
++ * For such calls FFA_FN_NATIVE(name) will choose the appropriate
++ * (native-width) function ID.
++ */
++#ifdef CONFIG_64BIT
++#define FFA_FN_NATIVE(name)	FFA_FN64_##name
++#else
++#define FFA_FN_NATIVE(name)	FFA_##name
++#endif
++
++/* FFA error codes. */
++#define FFA_RET_SUCCESS            (0)
++#define FFA_RET_NOT_SUPPORTED      (-1)
++#define FFA_RET_INVALID_PARAMETERS (-2)
++#define FFA_RET_NO_MEMORY          (-3)
++#define FFA_RET_BUSY               (-4)
++#define FFA_RET_INTERRUPTED        (-5)
++#define FFA_RET_DENIED             (-6)
++#define FFA_RET_RETRY              (-7)
++#define FFA_RET_ABORTED            (-8)
++
++#define MAJOR_VERSION_MASK	GENMASK(30, 16)
++#define MINOR_VERSION_MASK	GENMASK(15, 0)
++#define MAJOR_VERSION(x)	((u16)(FIELD_GET(MAJOR_VERSION_MASK, (x))))
++#define MINOR_VERSION(x)	((u16)(FIELD_GET(MINOR_VERSION_MASK, (x))))
++#define PACK_VERSION_INFO(major, minor)			\
++	(FIELD_PREP(MAJOR_VERSION_MASK, (major)) |	\
++	 FIELD_PREP(MINOR_VERSION_MASK, (minor)))
++#define FFA_VERSION_1_0		PACK_VERSION_INFO(1, 0)
++#define FFA_MIN_VERSION		FFA_VERSION_1_0
++
++#define SENDER_ID_MASK		GENMASK(31, 16)
++#define RECEIVER_ID_MASK	GENMASK(15, 0)
++#define SENDER_ID(x)		((u16)(FIELD_GET(SENDER_ID_MASK, (x))))
++#define RECEIVER_ID(x)		((u16)(FIELD_GET(RECEIVER_ID_MASK, (x))))
++#define PACK_TARGET_INFO(s, r)		\
++	(FIELD_PREP(SENDER_ID_MASK, (s)) | FIELD_PREP(RECEIVER_ID_MASK, (r)))
++
++/*
++ * FF-A specification mentions explicitly about '4K pages'. This should
++ * not be confused with the kernel PAGE_SIZE, which is the translation
++ * granule kernel is configured and may be one among 4K, 16K and 64K.
++ */
++#define FFA_PAGE_SIZE		SZ_4K
++/*
++ * Keeping RX TX buffer size as 4K for now
++ * 64K may be preferred to keep it min a page in 64K PAGE_SIZE config
++ */
++#define RXTX_BUFFER_SIZE	SZ_4K
++
++static ffa_fn *invoke_ffa_fn;
++
++static const int ffa_linux_errmap[] =3D {
++	/* better than switch case as long as return value is continuous */
++	0,		/* FFA_RET_SUCCESS */
++	-EOPNOTSUPP,	/* FFA_RET_NOT_SUPPORTED */
++	-EINVAL,	/* FFA_RET_INVALID_PARAMETERS */
++	-ENOMEM,	/* FFA_RET_NO_MEMORY */
++	-EBUSY,		/* FFA_RET_BUSY */
++	-EINTR,		/* FFA_RET_INTERRUPTED */
++	-EACCES,	/* FFA_RET_DENIED */
++	-EAGAIN,	/* FFA_RET_RETRY */
++	-ECANCELED,	/* FFA_RET_ABORTED */
++};
++
++static inline int ffa_to_linux_errno(int errno)
++{
++	int err_idx =3D -errno;
++
++	if (err_idx >=3D 0 && err_idx < ARRAY_SIZE(ffa_linux_errmap))
++		return ffa_linux_errmap[err_idx];
++	return -EINVAL;
++}
++
++struct ffa_drv_info {
++	u32 version;
++	u16 vm_id;
++	struct mutex rx_lock; /* lock to protect Rx buffer */
++	struct mutex tx_lock; /* lock to protect Tx buffer */
++	void *rx_buffer;
++	void *tx_buffer;
++};
++
++static struct ffa_drv_info *drv_info;
++
++/*
++ * The driver must be able to support all the versions from the earlies=
t
++ * supported FFA_MIN_VERSION to the latest supported FFA_DRIVER_VERSION=
.
++ * The specification states that if firmware supports a FFA implementat=
ion
++ * that is incompatible with and at a greater version number than speci=
fied
++ * by the caller(FFA_DRIVER_VERSION passed as parameter to FFA_VERSION)=
,
++ * it must return the NOT_SUPPORTED error code.
++ */
++static u32 ffa_compatible_version_find(u32 version)
++{
++	u16 major =3D MAJOR_VERSION(version), minor =3D MINOR_VERSION(version)=
;
++	u16 drv_major =3D MAJOR_VERSION(FFA_DRIVER_VERSION);
++	u16 drv_minor =3D MINOR_VERSION(FFA_DRIVER_VERSION);
++
++	if ((major < drv_major) || (major =3D=3D drv_major && minor <=3D drv_m=
inor))
++		return version;
++
++	pr_info("Firmware version higher than driver version, downgrading\n");
++	return FFA_DRIVER_VERSION;
++}
++
++static int ffa_version_check(u32 *version)
++{
++	ffa_value_t ver;
++
++	invoke_ffa_fn((ffa_value_t){
++		      .a0 =3D FFA_VERSION, .a1 =3D FFA_DRIVER_VERSION,
++		      }, &ver);
++
++	if (ver.a0 =3D=3D FFA_RET_NOT_SUPPORTED) {
++		pr_info("FFA_VERSION returned not supported\n");
++		return -EOPNOTSUPP;
++	}
++
++	if (ver.a0 < FFA_MIN_VERSION) {
++		pr_err("Incompatible v%d.%d! Earliest supported v%d.%d\n",
++		       MAJOR_VERSION(ver.a0), MINOR_VERSION(ver.a0),
++		       MAJOR_VERSION(FFA_MIN_VERSION),
++		       MINOR_VERSION(FFA_MIN_VERSION));
++		return -EINVAL;
++	}
++
++	pr_info("Driver version %d.%d\n", MAJOR_VERSION(FFA_DRIVER_VERSION),
++		MINOR_VERSION(FFA_DRIVER_VERSION));
++	pr_info("Firmware version %d.%d found\n", MAJOR_VERSION(ver.a0),
++		MINOR_VERSION(ver.a0));
++	*version =3D ffa_compatible_version_find(ver.a0);
++
++	return 0;
++}
++
++static int ffa_rx_release(void)
++{
++	ffa_value_t ret;
++
++	invoke_ffa_fn((ffa_value_t){
++		      .a0 =3D FFA_RX_RELEASE,
++		      }, &ret);
++
++	if (ret.a0 =3D=3D FFA_ERROR)
++		return ffa_to_linux_errno((int)ret.a2);
++
++	/* check for ret.a0 =3D=3D FFA_RX_RELEASE ? */
++
++	return 0;
++}
++
++static int ffa_rxtx_map(phys_addr_t tx_buf, phys_addr_t rx_buf, u32 pg_=
cnt)
++{
++	ffa_value_t ret;
++
++	invoke_ffa_fn((ffa_value_t){
++		      .a0 =3D FFA_FN_NATIVE(RXTX_MAP),
++		      .a1 =3D tx_buf, .a2 =3D rx_buf, .a3 =3D pg_cnt,
++		      }, &ret);
++
++	if (ret.a0 =3D=3D FFA_ERROR)
++		return ffa_to_linux_errno((int)ret.a2);
++
++	return 0;
++}
++
++static int ffa_rxtx_unmap(u16 vm_id)
++{
++	ffa_value_t ret;
++
++	invoke_ffa_fn((ffa_value_t){
++		      .a0 =3D FFA_RXTX_UNMAP, .a1 =3D PACK_TARGET_INFO(vm_id, 0),
++		      }, &ret);
++
++	if (ret.a0 =3D=3D FFA_ERROR)
++		return ffa_to_linux_errno((int)ret.a2);
++
++	return 0;
++}
++
++/* buffer must be sizeof(struct ffa_partition_info) * num_partitions */
++static int
++__ffa_partition_info_get(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
++			 struct ffa_partition_info *buffer, int num_partitions)
++{
++	int count;
++	ffa_value_t partition_info;
++
++	mutex_lock(&drv_info->rx_lock);
++	invoke_ffa_fn((ffa_value_t){
++		      .a0 =3D FFA_PARTITION_INFO_GET,
++		      .a1 =3D uuid0, .a2 =3D uuid1, .a3 =3D uuid2, .a4 =3D uuid3,
++		      }, &partition_info);
++
++	if (partition_info.a0 =3D=3D FFA_ERROR) {
++		mutex_unlock(&drv_info->rx_lock);
++		return ffa_to_linux_errno((int)partition_info.a2);
++	}
++
++	count =3D partition_info.a2;
++
++	if (buffer && count <=3D num_partitions)
++		memcpy(buffer, drv_info->rx_buffer, sizeof(*buffer) * count);
++
++	ffa_rx_release();
++
++	mutex_unlock(&drv_info->rx_lock);
++
++	return count;
++}
++
++/* buffer is allocated and caller must free the same if returned count =
> 0 */
++static int
++ffa_partition_probe(const uuid_t *uuid, struct ffa_partition_info **buf=
fer)
++{
++	int count;
++	u32 uuid0_4[4];
++	struct ffa_partition_info *pbuf;
++
++	export_uuid((u8 *)uuid0_4, uuid);
++	count =3D __ffa_partition_info_get(uuid0_4[0], uuid0_4[1], uuid0_4[2],
++					 uuid0_4[3], NULL, 0);
++	if (count <=3D 0)
++		return count;
++
++	pbuf =3D kcalloc(count, sizeof(*pbuf), GFP_KERNEL);
++	if (!pbuf)
++		return -ENOMEM;
++
++	count =3D __ffa_partition_info_get(uuid0_4[0], uuid0_4[1], uuid0_4[2],
++					 uuid0_4[3], pbuf, count);
++	if (count <=3D 0)
++		kfree(pbuf);
++	else
++		*buffer =3D pbuf;
++
++	return count;
++}
++
++#define VM_ID_MASK	GENMASK(15, 0)
++static int ffa_id_get(u16 *vm_id)
++{
++	ffa_value_t id;
++
++	invoke_ffa_fn((ffa_value_t){
++		      .a0 =3D FFA_ID_GET,
++		      }, &id);
++
++	if (id.a0 =3D=3D FFA_ERROR)
++		return ffa_to_linux_errno((int)id.a2);
++
++	*vm_id =3D FIELD_GET(VM_ID_MASK, (id.a2));
++
++	return 0;
++}
++
++static int ffa_msg_send_direct_req(u16 src_id, u16 dst_id, bool mode_32=
bit,
++				   struct ffa_send_direct_data *data)
++{
++	u32 req_id, resp_id, src_dst_ids =3D PACK_TARGET_INFO(src_id, dst_id);
++	ffa_value_t ret;
++
++	if (mode_32bit) {
++		req_id =3D FFA_MSG_SEND_DIRECT_REQ;
++		resp_id =3D FFA_MSG_SEND_DIRECT_RESP;
++	} else {
++		req_id =3D FFA_FN_NATIVE(MSG_SEND_DIRECT_REQ);
++		resp_id =3D FFA_FN_NATIVE(MSG_SEND_DIRECT_RESP);
++	}
++
++	invoke_ffa_fn((ffa_value_t){
++		      .a0 =3D req_id, .a1 =3D src_dst_ids, .a2 =3D 0,
++		      .a3 =3D data->data0, .a4 =3D data->data1, .a5 =3D data->data2,
++		      .a6 =3D data->data3, .a7 =3D data->data4,
++		      }, &ret);
++
++	while (ret.a0 =3D=3D FFA_INTERRUPT)
++		invoke_ffa_fn((ffa_value_t){
++			      .a0 =3D FFA_RUN, .a1 =3D ret.a1,
++			      }, &ret);
++
++	if (ret.a0 =3D=3D FFA_ERROR)
++		return ffa_to_linux_errno((int)ret.a2);
++
++	if (ret.a0 =3D=3D resp_id) {
++		data->data0 =3D ret.a3;
++		data->data1 =3D ret.a4;
++		data->data2 =3D ret.a5;
++		data->data3 =3D ret.a6;
++		data->data4 =3D ret.a7;
++		return 0;
++	}
++
++	return -EINVAL;
++}
++
++static int ffa_mem_first_frag(u32 func_id, phys_addr_t buf, u32 buf_sz,
++			      u32 frag_len, u32 len, u64 *handle)
++{
++	ffa_value_t ret;
++
++	invoke_ffa_fn((ffa_value_t){
++		      .a0 =3D func_id, .a1 =3D len, .a2 =3D frag_len,
++		      .a3 =3D buf, .a4 =3D buf_sz,
++		      }, &ret);
++
++	while (ret.a0 =3D=3D FFA_MEM_OP_PAUSE)
++		invoke_ffa_fn((ffa_value_t){
++			      .a0 =3D FFA_MEM_OP_RESUME,
++			      .a1 =3D ret.a1, .a2 =3D ret.a2,
++			      }, &ret);
++
++	if (ret.a0 =3D=3D FFA_ERROR)
++		return ffa_to_linux_errno((int)ret.a2);
++
++	if (ret.a0 !=3D FFA_SUCCESS)
++		return -EOPNOTSUPP;
++
++	if (handle)
++		*handle =3D PACK_HANDLE(ret.a2, ret.a3);
++
++	return frag_len;
++}
++
++static int ffa_mem_next_frag(u64 handle, u32 frag_len)
++{
++	ffa_value_t ret;
++
++	invoke_ffa_fn((ffa_value_t){
++		      .a0 =3D FFA_MEM_FRAG_TX,
++		      .a1 =3D HANDLE_LOW(handle), .a2 =3D HANDLE_HIGH(handle),
++		      .a3 =3D frag_len,
++		      }, &ret);
++
++	while (ret.a0 =3D=3D FFA_MEM_OP_PAUSE)
++		invoke_ffa_fn((ffa_value_t){
++			      .a0 =3D FFA_MEM_OP_RESUME,
++			      .a1 =3D ret.a1, .a2 =3D ret.a2,
++			      }, &ret);
++
++	if (ret.a0 =3D=3D FFA_ERROR)
++		return ffa_to_linux_errno((int)ret.a2);
++
++	if (ret.a0 !=3D FFA_MEM_FRAG_RX)
++		return -EOPNOTSUPP;
++
++	return ret.a3;
++}
++
++static int
++ffa_transmit_fragment(u32 func_id, phys_addr_t buf, u32 buf_sz, u32 fra=
g_len,
++		      u32 len, u64 *handle, bool first)
++{
++	if (!first)
++		return ffa_mem_next_frag(*handle, frag_len);
++
++	return ffa_mem_first_frag(func_id, buf, buf_sz, frag_len, len, handle)=
;
++}
++
++static u32 ffa_get_num_pages_sg(struct scatterlist *sg)
++{
++	u32 num_pages =3D 0;
++
++	do {
++		num_pages +=3D sg->length / FFA_PAGE_SIZE;
++	} while ((sg =3D sg_next(sg)));
++
++	return num_pages;
++}
++
++static int
++ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
++		       struct ffa_mem_ops_args *args)
++{
++	int rc =3D 0;
++	bool first =3D true;
++	phys_addr_t addr =3D 0;
++	struct ffa_composite_mem_region *composite;
++	struct ffa_mem_region_addr_range *constituents;
++	struct ffa_mem_region_attributes *ep_mem_access;
++	struct ffa_mem_region *mem_region =3D buffer;
++	u32 idx, frag_len, length, buf_sz =3D 0, num_entries =3D sg_nents(args=
->sg);
++
++	mem_region->tag =3D args->tag;
++	mem_region->flags =3D args->flags;
++	mem_region->sender_id =3D drv_info->vm_id;
++	mem_region->attributes =3D FFA_MEM_NORMAL | FFA_MEM_WRITE_BACK |
++				 FFA_MEM_INNER_SHAREABLE;
++	ep_mem_access =3D &mem_region->ep_mem_access[0];
++
++	for (idx =3D 0; idx < args->nattrs; idx++, ep_mem_access++) {
++		ep_mem_access->receiver =3D args->attrs[idx].receiver;
++		ep_mem_access->attrs =3D args->attrs[idx].attrs;
++		ep_mem_access->composite_off =3D COMPOSITE_OFFSET(args->nattrs);
++	}
++	mem_region->ep_count =3D args->nattrs;
++
++	composite =3D buffer + COMPOSITE_OFFSET(args->nattrs);
++	composite->total_pg_cnt =3D ffa_get_num_pages_sg(args->sg);
++	composite->addr_range_cnt =3D num_entries;
++
++	length =3D COMPOSITE_CONSTITUENTS_OFFSET(args->nattrs, num_entries);
++	frag_len =3D COMPOSITE_CONSTITUENTS_OFFSET(args->nattrs, 0);
++	if (frag_len > max_fragsize)
++		return -ENXIO;
++
++	if (!args->use_txbuf) {
++		addr =3D virt_to_phys(buffer);
++		buf_sz =3D max_fragsize / FFA_PAGE_SIZE;
++	}
++
++	constituents =3D buffer + frag_len;
++	idx =3D 0;
++	do {
++		if (frag_len =3D=3D max_fragsize) {
++			rc =3D ffa_transmit_fragment(func_id, addr, buf_sz,
++						   frag_len, length,
++						   &args->g_handle, first);
++			if (rc < 0)
++				return -ENXIO;
++
++			first =3D false;
++			idx =3D 0;
++			frag_len =3D 0;
++			constituents =3D buffer;
++		}
++
++		if ((void *)constituents - buffer > max_fragsize) {
++			pr_err("Memory Region Fragment > Tx Buffer size\n");
++			return -EFAULT;
++		}
++
++		constituents->address =3D sg_phys(args->sg);
++		constituents->pg_cnt =3D args->sg->length / FFA_PAGE_SIZE;
++		constituents++;
++		frag_len +=3D sizeof(struct ffa_mem_region_addr_range);
++	} while ((args->sg =3D sg_next(args->sg)));
++
++	return ffa_transmit_fragment(func_id, addr, buf_sz, frag_len,
++				     length, &args->g_handle, first);
++}
++
++static int ffa_memory_ops(u32 func_id, struct ffa_mem_ops_args *args)
++{
++	int ret;
++	void *buffer;
++
++	if (!args->use_txbuf) {
++		buffer =3D alloc_pages_exact(RXTX_BUFFER_SIZE, GFP_KERNEL);
++		if (!buffer)
++			return -ENOMEM;
++	} else {
++		buffer =3D drv_info->tx_buffer;
++		mutex_lock(&drv_info->tx_lock);
++	}
++
++	ret =3D ffa_setup_and_transmit(func_id, buffer, RXTX_BUFFER_SIZE, args=
);
++
++	if (args->use_txbuf)
++		mutex_unlock(&drv_info->tx_lock);
++	else
++		free_pages_exact(buffer, RXTX_BUFFER_SIZE);
++
++	return ret < 0 ? ret : 0;
++}
++
++static int ffa_memory_reclaim(u64 g_handle, u32 flags)
++{
++	ffa_value_t ret;
++
++	invoke_ffa_fn((ffa_value_t){
++		      .a0 =3D FFA_MEM_RECLAIM,
++		      .a1 =3D HANDLE_LOW(g_handle), .a2 =3D HANDLE_HIGH(g_handle),
++		      .a3 =3D flags,
++		      }, &ret);
++
++	if (ret.a0 =3D=3D FFA_ERROR)
++		return ffa_to_linux_errno((int)ret.a2);
++
++	return 0;
++}
++
++static u32 ffa_api_version_get(void)
++{
++	return drv_info->version;
++}
++
++static int ffa_partition_info_get(const char *uuid_str,
++				  struct ffa_partition_info *buffer)
++{
++	int count;
++	uuid_t uuid;
++	struct ffa_partition_info *pbuf;
++
++	if (uuid_parse(uuid_str, &uuid)) {
++		pr_err("invalid uuid (%s)\n", uuid_str);
++		return -ENODEV;
++	}
++
++	count =3D ffa_partition_probe(&uuid_null, &pbuf);
++	if (count <=3D 0)
++		return -ENOENT;
++
++	memcpy(buffer, pbuf, sizeof(*pbuf) * count);
++	kfree(pbuf);
++	return 0;
++}
++
++static void ffa_mode_32bit_set(struct ffa_device *dev)
++{
++	dev->mode_32bit =3D true;
++}
++
++static int ffa_sync_send_receive(struct ffa_device *dev,
++				 struct ffa_send_direct_data *data)
++{
++	return ffa_msg_send_direct_req(drv_info->vm_id, dev->vm_id,
++				       dev->mode_32bit, data);
++}
++
++static int
++ffa_memory_share(struct ffa_device *dev, struct ffa_mem_ops_args *args)
++{
++	if (dev->mode_32bit)
++		return ffa_memory_ops(FFA_MEM_SHARE, args);
++
++	return ffa_memory_ops(FFA_FN_NATIVE(MEM_SHARE), args);
++}
++
++static int
++ffa_memory_lend(struct ffa_device *dev, struct ffa_mem_ops_args *args)
++{
++	/* Note that upon a successful MEM_LEND request the caller
++	 * must ensure that the memory region specified is not accessed
++	 * until a successful MEM_RECALIM call has been made.
++	 * On systems with a hypervisor present this will been enforced,
++	 * however on systems without a hypervisor the responsibility
++	 * falls to the calling kernel driver to prevent access.
++	 */
++	if (dev->mode_32bit)
++		return ffa_memory_ops(FFA_MEM_LEND, args);
++
++	return ffa_memory_ops(FFA_FN_NATIVE(MEM_LEND), args);
++}
++
++static const struct ffa_dev_ops ffa_ops =3D {
++	.api_version_get =3D ffa_api_version_get,
++	.partition_info_get =3D ffa_partition_info_get,
++	.mode_32bit_set =3D ffa_mode_32bit_set,
++	.sync_send_receive =3D ffa_sync_send_receive,
++	.memory_reclaim =3D ffa_memory_reclaim,
++	.memory_share =3D ffa_memory_share,
++	.memory_lend =3D ffa_memory_lend,
++};
++
++const struct ffa_dev_ops *ffa_dev_ops_get(struct ffa_device *dev)
++{
++	if (ffa_device_is_valid(dev))
++		return &ffa_ops;
++
++	return NULL;
++}
++EXPORT_SYMBOL_GPL(ffa_dev_ops_get);
++
++void ffa_device_match_uuid(struct ffa_device *ffa_dev, const uuid_t *uu=
id)
++{
++	int count, idx;
++	struct ffa_partition_info *pbuf, *tpbuf;
++
++	count =3D ffa_partition_probe(uuid, &pbuf);
++	if (count <=3D 0)
++		return;
++
++	for (idx =3D 0, tpbuf =3D pbuf; idx < count; idx++, tpbuf++)
++		if (tpbuf->id =3D=3D ffa_dev->vm_id)
++			uuid_copy(&ffa_dev->uuid, uuid);
++	kfree(pbuf);
++}
++
++static void ffa_setup_partitions(void)
++{
++	int count, idx;
++	struct ffa_device *ffa_dev;
++	struct ffa_partition_info *pbuf, *tpbuf;
++
++	count =3D ffa_partition_probe(&uuid_null, &pbuf);
++	if (count <=3D 0) {
++		pr_info("%s: No partitions found, error %d\n", __func__, count);
++		return;
++	}
++
++	for (idx =3D 0, tpbuf =3D pbuf; idx < count; idx++, tpbuf++) {
++		/* Note that the &uuid_null parameter will require
++		 * ffa_device_match() to find the UUID of this partition id
++		 * with help of ffa_device_match_uuid(). Once the FF-A spec
++		 * is updated to provide correct UUID here for each partition
++		 * as part of the discovery API, we need to pass the
++		 * discovered UUID here instead.
++		 */
++		ffa_dev =3D ffa_device_register(&uuid_null, tpbuf->id);
++		if (!ffa_dev) {
++			pr_err("%s: failed to register partition ID 0x%x\n",
++			       __func__, tpbuf->id);
++			continue;
++		}
++
++		ffa_dev_set_drvdata(ffa_dev, drv_info);
++	}
++	kfree(pbuf);
++}
++
++static int __init ffa_init(void)
++{
++	int ret;
++
++	ret =3D ffa_transport_init(&invoke_ffa_fn);
++	if (ret)
++		return ret;
++
++	ret =3D arm_ffa_bus_init();
++	if (ret)
++		return ret;
++
++	drv_info =3D kzalloc(sizeof(*drv_info), GFP_KERNEL);
++	if (!drv_info) {
++		ret =3D -ENOMEM;
++		goto ffa_bus_exit;
++	}
++
++	ret =3D ffa_version_check(&drv_info->version);
++	if (ret)
++		goto free_drv_info;
++
++	if (ffa_id_get(&drv_info->vm_id)) {
++		pr_err("failed to obtain VM id for self\n");
++		ret =3D -ENODEV;
++		goto free_drv_info;
++	}
++
++	drv_info->rx_buffer =3D alloc_pages_exact(RXTX_BUFFER_SIZE, GFP_KERNEL=
);
++	if (!drv_info->rx_buffer) {
++		ret =3D -ENOMEM;
++		goto free_pages;
++	}
++
++	drv_info->tx_buffer =3D alloc_pages_exact(RXTX_BUFFER_SIZE, GFP_KERNEL=
);
++	if (!drv_info->tx_buffer) {
++		ret =3D -ENOMEM;
++		goto free_pages;
++	}
++
++	ret =3D ffa_rxtx_map(virt_to_phys(drv_info->tx_buffer),
++			   virt_to_phys(drv_info->rx_buffer),
++			   RXTX_BUFFER_SIZE / FFA_PAGE_SIZE);
++	if (ret) {
++		pr_err("failed to register FFA RxTx buffers\n");
++		goto free_pages;
++	}
++
++	mutex_init(&drv_info->rx_lock);
++	mutex_init(&drv_info->tx_lock);
++
++	ffa_setup_partitions();
++
++	return 0;
++free_pages:
++	if (drv_info->tx_buffer)
++		free_pages_exact(drv_info->tx_buffer, RXTX_BUFFER_SIZE);
++	free_pages_exact(drv_info->rx_buffer, RXTX_BUFFER_SIZE);
++free_drv_info:
++	kfree(drv_info);
++ffa_bus_exit:
++	arm_ffa_bus_exit();
++	return ret;
++}
++subsys_initcall(ffa_init);
++
++static void __exit ffa_exit(void)
++{
++	ffa_rxtx_unmap(drv_info->vm_id);
++	free_pages_exact(drv_info->tx_buffer, RXTX_BUFFER_SIZE);
++	free_pages_exact(drv_info->rx_buffer, RXTX_BUFFER_SIZE);
++	kfree(drv_info);
++	arm_ffa_bus_exit();
++}
++module_exit(ffa_exit);
++
++MODULE_ALIAS("arm-ffa");
++MODULE_AUTHOR("Sudeep Holla <sudeep.holla@arm.com>");
++MODULE_DESCRIPTION("Arm FF-A interface driver");
++MODULE_LICENSE("GPL v2");
+diff --git a/drivers/firmware/arm_ffa/smccc.c b/drivers/firmware/arm_ffa=
/smccc.c
+new file mode 100644
+index 000000000000..4d85bfff0a4e
+--- /dev/null
++++ b/drivers/firmware/arm_ffa/smccc.c
+@@ -0,0 +1,39 @@
++// SPDX-License-Identifier: GPL-2.0-only
++/*
++ * Copyright (C) 2021 ARM Ltd.
++ */
++
++#include <linux/printk.h>
++
++#include "common.h"
++
++static void __arm_ffa_fn_smc(ffa_value_t args, ffa_value_t *res)
++{
++	arm_smccc_1_2_smc(&args, res);
++}
++
++static void __arm_ffa_fn_hvc(ffa_value_t args, ffa_value_t *res)
++{
++	arm_smccc_1_2_hvc(&args, res);
++}
++
++int __init ffa_transport_init(ffa_fn **invoke_ffa_fn)
++{
++	enum arm_smccc_conduit conduit;
++
++	if (arm_smccc_get_version() < ARM_SMCCC_VERSION_1_2)
++		return -EOPNOTSUPP;
++
++	conduit =3D arm_smccc_1_1_get_conduit();
++	if (conduit =3D=3D SMCCC_CONDUIT_NONE) {
++		pr_err("%s: invalid SMCCC conduit\n", __func__);
++		return -EOPNOTSUPP;
++	}
++
++	if (conduit =3D=3D SMCCC_CONDUIT_SMC)
++		*invoke_ffa_fn =3D __arm_ffa_fn_smc;
++	else
++		*invoke_ffa_fn =3D __arm_ffa_fn_hvc;
++
++	return 0;
++}
+diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
+index 62c54234576c..c8eb24af3c62 100644
+--- a/include/linux/arm-smccc.h
++++ b/include/linux/arm-smccc.h
+@@ -186,6 +186,61 @@ struct arm_smccc_res {
+ 	unsigned long a3;
+ };
+=20
++#ifdef CONFIG_ARM64
++/**
++ * struct arm_smccc_1_2_regs - Arguments for or Results from SMC/HVC ca=
ll
++ * @a0-a17 argument values from registers 0 to 17
++ */
++struct arm_smccc_1_2_regs {
++	unsigned long a0;
++	unsigned long a1;
++	unsigned long a2;
++	unsigned long a3;
++	unsigned long a4;
++	unsigned long a5;
++	unsigned long a6;
++	unsigned long a7;
++	unsigned long a8;
++	unsigned long a9;
++	unsigned long a10;
++	unsigned long a11;
++	unsigned long a12;
++	unsigned long a13;
++	unsigned long a14;
++	unsigned long a15;
++	unsigned long a16;
++	unsigned long a17;
++};
++
++/**
++ * arm_smccc_1_2_hvc() - make HVC calls
++ * @args: arguments passed via struct arm_smccc_1_2_regs
++ * @res: result values via struct arm_smccc_1_2_regs
++ *
++ * This function is used to make HVC calls following SMC Calling Conven=
tion
++ * v1.2 or above. The content of the supplied param are copied from the
++ * structure to registers prior to the HVC instruction. The return valu=
es
++ * are updated with the content from registers on return from the HVC
++ * instruction.
++ */
++asmlinkage void arm_smccc_1_2_hvc(const struct arm_smccc_1_2_regs *args=
,
++				  struct arm_smccc_1_2_regs *res);
++
++/**
++ * arm_smccc_1_2_smc() - make SMC calls
++ * @args: arguments passed via struct arm_smccc_1_2_regs
++ * @res: result values via struct arm_smccc_1_2_regs
++ *
++ * This function is used to make SMC calls following SMC Calling Conven=
tion
++ * v1.2 or above. The content of the supplied param are copied from the
++ * structure to registers prior to the SMC instruction. The return valu=
es
++ * are updated with the content from registers on return from the SMC
++ * instruction.
++ */
++asmlinkage void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args=
,
++				  struct arm_smccc_1_2_regs *res);
++#endif
++
+ /**
+  * struct arm_smccc_quirk - Contains quirk information
+  * @id: quirk identification
+diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
+new file mode 100644
+index 000000000000..85651e41ded8
+--- /dev/null
++++ b/include/linux/arm_ffa.h
+@@ -0,0 +1,269 @@
++/* SPDX-License-Identifier: GPL-2.0-only */
++/*
++ * Copyright (C) 2021 ARM Ltd.
++ */
++
++#ifndef _LINUX_ARM_FFA_H
++#define _LINUX_ARM_FFA_H
++
++#include <linux/device.h>
++#include <linux/module.h>
++#include <linux/types.h>
++#include <linux/uuid.h>
++
++/* FFA Bus/Device/Driver related */
++struct ffa_device {
++	int vm_id;
++	bool mode_32bit;
++	uuid_t uuid;
++	struct device dev;
++};
++
++#define to_ffa_dev(d) container_of(d, struct ffa_device, dev)
++
++struct ffa_device_id {
++	uuid_t uuid;
++};
++
++struct ffa_driver {
++	const char *name;
++	int (*probe)(struct ffa_device *sdev);
++	void (*remove)(struct ffa_device *sdev);
++	const struct ffa_device_id *id_table;
++
++	struct device_driver driver;
++};
++
++#define to_ffa_driver(d) container_of(d, struct ffa_driver, driver)
++
++static inline void ffa_dev_set_drvdata(struct ffa_device *fdev, void *d=
ata)
++{
++	fdev->dev.driver_data =3D data;
++}
++
++#if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
++struct ffa_device *ffa_device_register(const uuid_t *uuid, int vm_id);
++void ffa_device_unregister(struct ffa_device *ffa_dev);
++int ffa_driver_register(struct ffa_driver *driver, struct module *owner=
,
++			const char *mod_name);
++void ffa_driver_unregister(struct ffa_driver *driver);
++bool ffa_device_is_valid(struct ffa_device *ffa_dev);
++const struct ffa_dev_ops *ffa_dev_ops_get(struct ffa_device *dev);
++
++#else
++static inline
++struct ffa_device *ffa_device_register(const uuid_t *uuid, int vm_id)
++{
++	return NULL;
++}
++
++static inline void ffa_device_unregister(struct ffa_device *dev) {}
++
++static inline int
++ffa_driver_register(struct ffa_driver *driver, struct module *owner,
++		    const char *mod_name)
++{
++	return -EINVAL;
++}
++
++static inline void ffa_driver_unregister(struct ffa_driver *driver) {}
++
++static inline
++bool ffa_device_is_valid(struct ffa_device *ffa_dev) { return false; }
++
++static inline
++const struct ffa_dev_ops *ffa_dev_ops_get(struct ffa_device *dev)
++{
++	return NULL;
++}
++#endif /* CONFIG_ARM_FFA_TRANSPORT */
++
++#define ffa_register(driver) \
++	ffa_driver_register(driver, THIS_MODULE, KBUILD_MODNAME)
++#define ffa_unregister(driver) \
++	ffa_driver_unregister(driver)
++
++/**
++ * module_ffa_driver() - Helper macro for registering a psa_ffa driver
++ * @__ffa_driver: ffa_driver structure
++ *
++ * Helper macro for psa_ffa drivers to set up proper module init / exit
++ * functions.  Replaces module_init() and module_exit() and keeps peopl=
e from
++ * printing pointless things to the kernel log when their driver is loa=
ded.
++ */
++#define module_ffa_driver(__ffa_driver)	\
++	module_driver(__ffa_driver, ffa_register, ffa_unregister)
++
++/* FFA transport related */
++struct ffa_partition_info {
++	u16 id;
++	u16 exec_ctxt;
++/* partition supports receipt of direct requests */
++#define FFA_PARTITION_DIRECT_RECV	BIT(0)
++/* partition can send direct requests. */
++#define FFA_PARTITION_DIRECT_SEND	BIT(1)
++/* partition can send and receive indirect messages. */
++#define FFA_PARTITION_INDIRECT_MSG	BIT(2)
++	u32 properties;
++};
++
++/* For use with FFA_MSG_SEND_DIRECT_{REQ,RESP} which pass data via regi=
sters */
++struct ffa_send_direct_data {
++	unsigned long data0; /* w3/x3 */
++	unsigned long data1; /* w4/x4 */
++	unsigned long data2; /* w5/x5 */
++	unsigned long data3; /* w6/x6 */
++	unsigned long data4; /* w7/x7 */
++};
++
++struct ffa_mem_region_addr_range {
++	/* The base IPA of the constituent memory region, aligned to 4 kiB */
++	u64 address;
++	/* The number of 4 kiB pages in the constituent memory region. */
++	u32 pg_cnt;
++	u32 reserved;
++};
++
++struct ffa_composite_mem_region {
++	/*
++	 * The total number of 4 kiB pages included in this memory region. Thi=
s
++	 * must be equal to the sum of page counts specified in each
++	 * `struct ffa_mem_region_addr_range`.
++	 */
++	u32 total_pg_cnt;
++	/* The number of constituents included in this memory region range */
++	u32 addr_range_cnt;
++	u64 reserved;
++	/** An array of `addr_range_cnt` memory region constituents. */
++	struct ffa_mem_region_addr_range constituents[];
++};
++
++struct ffa_mem_region_attributes {
++	/* The ID of the VM to which the memory is being given or shared. */
++	u16 receiver;
++	/*
++	 * The permissions with which the memory region should be mapped in th=
e
++	 * receiver's page table.
++	 */
++#define FFA_MEM_EXEC		BIT(3)
++#define FFA_MEM_NO_EXEC		BIT(2)
++#define FFA_MEM_RW		BIT(1)
++#define FFA_MEM_RO		BIT(0)
++	u8 attrs;
++	/*
++	 * Flags used during FFA_MEM_RETRIEVE_REQ and FFA_MEM_RETRIEVE_RESP
++	 * for memory regions with multiple borrowers.
++	 */
++#define FFA_MEM_RETRIEVE_SELF_BORROWER	BIT(0)
++	u8 flag;
++	u32 composite_off;
++	/*
++	 * Offset in bytes from the start of the outer `ffa_memory_region` to
++	 * an `struct ffa_mem_region_addr_range`.
++	 */
++	u64 reserved;
++};
++
++struct ffa_mem_region {
++	/* The ID of the VM/owner which originally sent the memory region */
++	u16 sender_id;
++#define FFA_MEM_NORMAL		BIT(5)
++#define FFA_MEM_DEVICE		BIT(4)
++
++#define FFA_MEM_WRITE_BACK	(3 << 2)
++#define FFA_MEM_NON_CACHEABLE	(1 << 2)
++
++#define FFA_DEV_nGnRnE		(0 << 2)
++#define FFA_DEV_nGnRE		(1 << 2)
++#define FFA_DEV_nGRE		(2 << 2)
++#define FFA_DEV_GRE		(3 << 2)
++
++#define FFA_MEM_NON_SHAREABLE	(0)
++#define FFA_MEM_OUTER_SHAREABLE	(2)
++#define FFA_MEM_INNER_SHAREABLE	(3)
++	u8 attributes;
++	u8 reserved_0;
++/*
++ * Clear memory region contents after unmapping it from the sender and
++ * before mapping it for any receiver.
++ */
++#define FFA_MEM_CLEAR			BIT(0)
++/*
++ * Whether the hypervisor may time slice the memory sharing or retrieva=
l
++ * operation.
++ */
++#define FFA_TIME_SLICE_ENABLE		BIT(1)
++
++#define FFA_MEM_RETRIEVE_TYPE_IN_RESP	(0 << 3)
++#define FFA_MEM_RETRIEVE_TYPE_SHARE	(1 << 3)
++#define FFA_MEM_RETRIEVE_TYPE_LEND	(2 << 3)
++#define FFA_MEM_RETRIEVE_TYPE_DONATE	(3 << 3)
++
++#define FFA_MEM_RETRIEVE_ADDR_ALIGN_HINT	BIT(9)
++#define FFA_MEM_RETRIEVE_ADDR_ALIGN(x)		((x) << 5)
++	/* Flags to control behaviour of the transaction. */
++	u32 flags;
++#define HANDLE_LOW_MASK		GENMASK_ULL(31, 0)
++#define HANDLE_HIGH_MASK	GENMASK_ULL(63, 32)
++#define HANDLE_LOW(x)		((u32)(FIELD_GET(HANDLE_LOW_MASK, (x))))
++#define	HANDLE_HIGH(x)		((u32)(FIELD_GET(HANDLE_HIGH_MASK, (x))))
++
++#define PACK_HANDLE(l, h)		\
++	(FIELD_PREP(HANDLE_LOW_MASK, (l)) | FIELD_PREP(HANDLE_HIGH_MASK, (h)))
++	/*
++	 * A globally-unique ID assigned by the hypervisor for a region
++	 * of memory being sent between VMs.
++	 */
++	u64 handle;
++	/*
++	 * An implementation defined value associated with the receiver and th=
e
++	 * memory region.
++	 */
++	u64 tag;
++	u32 reserved_1;
++	/*
++	 * The number of `ffa_mem_region_attributes` entries included in this
++	 * transaction.
++	 */
++	u32 ep_count;
++	/*
++	 * An array of endpoint memory access descriptors.
++	 * Each one specifies a memory region offset, an endpoint and the
++	 * attributes with which this memory region should be mapped in that
++	 * endpoint's page table.
++	 */
++	struct ffa_mem_region_attributes ep_mem_access[];
++};
++
++#define	COMPOSITE_OFFSET(x)	\
++	(offsetof(struct ffa_mem_region, ep_mem_access[x]))
++#define CONSTITUENTS_OFFSET(x)	\
++	(offsetof(struct ffa_composite_mem_region, constituents[x]))
++#define COMPOSITE_CONSTITUENTS_OFFSET(x, y)	\
++	(COMPOSITE_OFFSET(x) + CONSTITUENTS_OFFSET(y))
++
++struct ffa_mem_ops_args {
++	bool use_txbuf;
++	u32 nattrs;
++	u32 flags;
++	u64 tag;
++	u64 g_handle;
++	struct scatterlist *sg;
++	struct ffa_mem_region_attributes *attrs;
++};
++
++struct ffa_dev_ops {
++	u32 (*api_version_get)(void);
++	int (*partition_info_get)(const char *uuid_str,
++				  struct ffa_partition_info *buffer);
++	void (*mode_32bit_set)(struct ffa_device *dev);
++	int (*sync_send_receive)(struct ffa_device *dev,
++				 struct ffa_send_direct_data *data);
++	int (*memory_reclaim)(u64 g_handle, u32 flags);
++	int (*memory_share)(struct ffa_device *dev,
++			    struct ffa_mem_ops_args *args);
++	int (*memory_lend)(struct ffa_device *dev,
++			   struct ffa_mem_ops_args *args);
++};
++
++#endif /* _LINUX_ARM_FFA_H */
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
09-firmware-arm_ffa-Add-initial-FFA-bus-support-for-dev.patch b/meta-arm-=
bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0009-firmware-arm_ffa-Ad=
d-initial-FFA-bus-support-for-dev.patch
deleted file mode 100644
index fc53fccc..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0009-firm=
ware-arm_ffa-Add-initial-FFA-bus-support-for-dev.patch
+++ /dev/null
@@ -1,420 +0,0 @@
-From 95591bf20e67a2f9635b7823baf7975946a630c2 Mon Sep 17 00:00:00 2001
-From: Sudeep Holla <sudeep.holla@arm.com>
-Date: Fri, 30 Apr 2021 11:24:33 +0100
-Subject: [PATCH 09/22] firmware: arm_ffa: Add initial FFA bus support fo=
r
- device enumeration
-
-The Arm FF for Armv8-A specification has concept of endpoints or
-partitions. In the Normal world, a partition could be a VM when
-the Virtualization extension is enabled or the kernel itself.
-
-In order to handle multiple partitions, we can create a FFA device for
-each such partition on a dedicated FFA bus. Similarly, different drivers
-requiring FFA transport can be registered on the same bus. We can match
-the device and drivers using UUID. This is mostly for the in-kernel
-users with FFA drivers.
-
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/g=
it/sudeep.holla/linux.git/commit/?h=3Dv5.10/ffa&id=3D6c31a912d7cf9042d80b=
24f431f0739d53a7262d]
----
- MAINTAINERS                       |   7 +
- drivers/firmware/Kconfig          |   1 +
- drivers/firmware/Makefile         |   1 +
- drivers/firmware/arm_ffa/Kconfig  |  16 +++
- drivers/firmware/arm_ffa/Makefile |   4 +
- drivers/firmware/arm_ffa/bus.c    | 207 ++++++++++++++++++++++++++++++
- include/linux/arm_ffa.h           |  91 +++++++++++++
- 7 files changed, 327 insertions(+)
- create mode 100644 drivers/firmware/arm_ffa/Kconfig
- create mode 100644 drivers/firmware/arm_ffa/Makefile
- create mode 100644 drivers/firmware/arm_ffa/bus.c
- create mode 100644 include/linux/arm_ffa.h
-
-diff --git a/MAINTAINERS b/MAINTAINERS
-index 5234423c477a..d5fdc9e68c89 100644
---- a/MAINTAINERS
-+++ b/MAINTAINERS
-@@ -6847,6 +6847,13 @@ F:	include/linux/firewire.h
- F:	include/uapi/linux/firewire*.h
- F:	tools/firewire/
-=20
-+FIRMWARE FRAMEWORK FOR ARMV8-A
-+M:	Sudeep Holla <sudeep.holla@arm.com>
-+L:	linux-arm-kernel@lists.infradead.org
-+S:	Maintained
-+F:	drivers/firmware/arm_ffa/
-+F:	include/linux/arm_ffa.h
-+
- FIRMWARE LOADER (request_firmware)
- M:	Luis Chamberlain <mcgrof@kernel.org>
- L:	linux-kernel@vger.kernel.org
-diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
-index bfef3d8d14e7..90e6dd32f2cd 100644
---- a/drivers/firmware/Kconfig
-+++ b/drivers/firmware/Kconfig
-@@ -296,6 +296,7 @@ config TURRIS_MOX_RWTM
- 	  other manufacturing data and also utilize the Entropy Bit Generator
- 	  for hardware random number generation.
-=20
-+source "drivers/firmware/arm_ffa/Kconfig"
- source "drivers/firmware/broadcom/Kconfig"
- source "drivers/firmware/google/Kconfig"
- source "drivers/firmware/efi/Kconfig"
-diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
-index 523173cbff33..3c2af2e98def 100644
---- a/drivers/firmware/Makefile
-+++ b/drivers/firmware/Makefile
-@@ -23,6 +23,7 @@ obj-$(CONFIG_TI_SCI_PROTOCOL)	+=3D ti_sci.o
- obj-$(CONFIG_TRUSTED_FOUNDATIONS) +=3D trusted_foundations.o
- obj-$(CONFIG_TURRIS_MOX_RWTM)	+=3D turris-mox-rwtm.o
-=20
-+obj-y				+=3D arm_ffa/
- obj-y				+=3D arm_scmi/
- obj-y				+=3D broadcom/
- obj-y				+=3D meson/
-diff --git a/drivers/firmware/arm_ffa/Kconfig b/drivers/firmware/arm_ffa=
/Kconfig
-new file mode 100644
-index 000000000000..261a3660650a
---- /dev/null
-+++ b/drivers/firmware/arm_ffa/Kconfig
-@@ -0,0 +1,16 @@
-+# SPDX-License-Identifier: GPL-2.0-only
-+config ARM_FFA_TRANSPORT
-+	tristate "Arm Firmware Framework for Armv8-A"
-+	depends on OF
-+	depends on ARM64
-+	default n
-+	help
-+	  This Firmware Framework(FF) for Arm A-profile processors describes
-+	  interfaces that standardize communication between the various
-+	  software images which includes communication between images in
-+	  the Secure world and Normal world. It also leverages the
-+	  virtualization extension to isolate software images provided
-+	  by an ecosystem of vendors from each other.
-+
-+	  This driver provides interface for all the client drivers making
-+	  use of the features offered by ARM FF-A.
-diff --git a/drivers/firmware/arm_ffa/Makefile b/drivers/firmware/arm_ff=
a/Makefile
-new file mode 100644
-index 000000000000..bfe4323a8784
---- /dev/null
-+++ b/drivers/firmware/arm_ffa/Makefile
-@@ -0,0 +1,4 @@
-+# SPDX-License-Identifier: GPL-2.0-only
-+ffa-bus-y =3D bus.o
-+ffa-module-objs :=3D $(ffa-bus-y)
-+obj-$(CONFIG_ARM_FFA_TRANSPORT) =3D ffa-module.o
-diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/b=
us.c
-new file mode 100644
-index 000000000000..b743fb2256e9
---- /dev/null
-+++ b/drivers/firmware/arm_ffa/bus.c
-@@ -0,0 +1,207 @@
-+// SPDX-License-Identifier: GPL-2.0
-+/*
-+ * Copyright (C) 2020 ARM Ltd.
-+ */
-+
-+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-+
-+#include <linux/arm_ffa.h>
-+#include <linux/device.h>
-+#include <linux/fs.h>
-+#include <linux/kernel.h>
-+#include <linux/module.h>
-+#include <linux/slab.h>
-+#include <linux/types.h>
-+
-+static int ffa_device_match(struct device *dev, struct device_driver *d=
rv)
-+{
-+	const struct ffa_device_id *id_table;
-+	struct ffa_device *ffa_dev;
-+
-+	id_table =3D to_ffa_driver(drv)->id_table;
-+	ffa_dev =3D to_ffa_dev(dev);
-+
-+	while (!uuid_is_null(&id_table->uuid)) {
-+		if (uuid_equal(&ffa_dev->uuid, &id_table->uuid))
-+			return 1;
-+		id_table++;
-+	}
-+
-+	return 0;
-+}
-+
-+static int ffa_device_probe(struct device *dev)
-+{
-+	struct ffa_driver *ffa_drv =3D to_ffa_driver(dev->driver);
-+	struct ffa_device *ffa_dev =3D to_ffa_dev(dev);
-+
-+	if (!ffa_device_match(dev, dev->driver))
-+		return -ENODEV;
-+
-+	return ffa_drv->probe(ffa_dev);
-+}
-+
-+static int ffa_device_uevent(struct device *dev, struct kobj_uevent_env=
 *env)
-+{
-+	struct ffa_device *ffa_dev =3D to_ffa_dev(dev);
-+
-+	return add_uevent_var(env, "MODALIAS=3Darm_ffa:%04x:%pUb",
-+			      ffa_dev->vm_id, &ffa_dev->uuid);
-+}
-+
-+static ssize_t partition_id_show(struct device *dev,
-+				 struct device_attribute *attr, char *buf)
-+{
-+	struct ffa_device *ffa_dev =3D to_ffa_dev(dev);
-+
-+	return sprintf(buf, "0x%04x\n", ffa_dev->vm_id);
-+}
-+static DEVICE_ATTR_RO(partition_id);
-+
-+static ssize_t uuid_show(struct device *dev, struct device_attribute *a=
ttr,
-+			 char *buf)
-+{
-+	struct ffa_device *ffa_dev =3D to_ffa_dev(dev);
-+
-+	return sprintf(buf, "%pUb\n", &ffa_dev->uuid);
-+}
-+static DEVICE_ATTR_RO(uuid);
-+
-+static struct attribute *ffa_device_attributes_attrs[] =3D {
-+	&dev_attr_partition_id.attr,
-+	&dev_attr_uuid.attr,
-+	NULL,
-+};
-+ATTRIBUTE_GROUPS(ffa_device_attributes);
-+
-+struct bus_type ffa_bus_type =3D {
-+	.name		=3D "arm_ffa",
-+	.match		=3D ffa_device_match,
-+	.probe		=3D ffa_device_probe,
-+	.uevent		=3D ffa_device_uevent,
-+	.dev_groups	=3D ffa_device_attributes_groups,
-+};
-+EXPORT_SYMBOL_GPL(ffa_bus_type);
-+
-+int ffa_driver_register(struct ffa_driver *driver, struct module *owner=
,
-+			const char *mod_name)
-+{
-+	int ret;
-+
-+	driver->driver.bus =3D &ffa_bus_type;
-+	driver->driver.name =3D driver->name;
-+	driver->driver.owner =3D owner;
-+	driver->driver.mod_name =3D mod_name;
-+
-+	ret =3D driver_register(&driver->driver);
-+	if (!ret)
-+		pr_debug("registered new ffa driver %s\n", driver->name);
-+
-+	return ret;
-+}
-+EXPORT_SYMBOL_GPL(ffa_driver_register);
-+
-+void ffa_driver_unregister(struct ffa_driver *driver)
-+{
-+	driver_unregister(&driver->driver);
-+}
-+EXPORT_SYMBOL_GPL(ffa_driver_unregister);
-+
-+static void ffa_release_device(struct device *dev)
-+{
-+	struct ffa_device *ffa_dev =3D to_ffa_dev(dev);
-+
-+	kfree(ffa_dev);
-+}
-+
-+static int __ffa_devices_unregister(struct device *dev, void *data)
-+{
-+	ffa_release_device(dev);
-+
-+	return 0;
-+}
-+
-+static void ffa_devices_unregister(void)
-+{
-+	bus_for_each_dev(&ffa_bus_type, NULL, NULL,
-+			 __ffa_devices_unregister);
-+}
-+
-+bool ffa_device_is_valid(struct ffa_device *ffa_dev)
-+{
-+	bool valid =3D false;
-+	struct device *dev =3D NULL;
-+	struct ffa_device *tmp_dev;
-+
-+	do {
-+		dev =3D bus_find_next_device(&ffa_bus_type, dev);
-+		tmp_dev =3D to_ffa_dev(dev);
-+		if (tmp_dev =3D=3D ffa_dev) {
-+			valid =3D true;
-+			break;
-+		}
-+		put_device(dev);
-+	} while (dev);
-+
-+	put_device(dev);
-+
-+	return valid;
-+}
-+
-+struct ffa_device *ffa_device_register(const uuid_t *uuid, int vm_id)
-+{
-+	int ret;
-+	struct device *dev;
-+	struct ffa_device *ffa_dev;
-+
-+	ffa_dev =3D kzalloc(sizeof(*ffa_dev), GFP_KERNEL);
-+	if (!ffa_dev)
-+		return NULL;
-+
-+	dev =3D &ffa_dev->dev;
-+	dev->bus =3D &ffa_bus_type;
-+	dev->release =3D ffa_release_device;
-+	dev_set_name(&ffa_dev->dev, "arm-ffa-%04x", vm_id);
-+
-+	ffa_dev->vm_id =3D vm_id;
-+	uuid_copy(&ffa_dev->uuid, uuid);
-+
-+	ret =3D device_register(&ffa_dev->dev);
-+	if (ret) {
-+		dev_err(dev, "unable to register device %s err=3D%d\n",
-+			dev_name(dev), ret);
-+		put_device(dev);
-+		return NULL;
-+	}
-+
-+	return ffa_dev;
-+}
-+EXPORT_SYMBOL_GPL(ffa_device_register);
-+
-+void ffa_device_unregister(struct ffa_device *ffa_dev)
-+{
-+	if (!ffa_dev)
-+		return;
-+
-+	device_unregister(&ffa_dev->dev);
-+}
-+EXPORT_SYMBOL_GPL(ffa_device_unregister);
-+
-+static int __init arm_ffa_bus_init(void)
-+{
-+	return bus_register(&ffa_bus_type);
-+}
-+module_init(arm_ffa_bus_init);
-+
-+static void __exit arm_ffa_bus_exit(void)
-+{
-+	ffa_devices_unregister();
-+	bus_unregister(&ffa_bus_type);
-+}
-+
-+module_exit(arm_ffa_bus_exit);
-+
-+MODULE_ALIAS("arm-ffa-bus");
-+MODULE_AUTHOR("Sudeep Holla <sudeep.holla@arm.com>");
-+MODULE_DESCRIPTION("Arm FF-A bus driver");
-+MODULE_LICENSE("GPL v2");
-diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
-new file mode 100644
-index 000000000000..aaff89364541
---- /dev/null
-+++ b/include/linux/arm_ffa.h
-@@ -0,0 +1,91 @@
-+/* SPDX-License-Identifier: GPL-2.0-only */
-+/*
-+ * Copyright (C) 2020 ARM Ltd.
-+ */
-+
-+#ifndef _LINUX_ARM_FFA_H
-+#define _LINUX_ARM_FFA_H
-+
-+#include <linux/cdev.h>
-+#include <linux/device.h>
-+#include <linux/module.h>
-+#include <linux/types.h>
-+#include <linux/uuid.h>
-+
-+/* FFA Bus/Device/Driver related */
-+struct ffa_device {
-+	int vm_id;
-+	uuid_t uuid;
-+	struct device dev;
-+};
-+
-+#define to_ffa_dev(d) container_of(d, struct ffa_device, dev)
-+
-+struct ffa_device_id {
-+	uuid_t uuid;
-+};
-+
-+struct ffa_driver {
-+	const char *name;
-+	int (*probe)(struct ffa_device *sdev);
-+	void (*remove)(struct ffa_device *sdev);
-+	const struct ffa_device_id *id_table;
-+
-+	struct device_driver driver;
-+};
-+
-+#define to_ffa_driver(d) container_of(d, struct ffa_driver, driver)
-+
-+static inline void ffa_dev_set_drvdata(struct ffa_device *fdev, void *d=
ata)
-+{
-+	fdev->dev.driver_data =3D data;
-+}
-+
-+#if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
-+struct ffa_device *ffa_device_register(const uuid_t *uuid, int vm_id);
-+void ffa_device_unregister(struct ffa_device *ffa_dev);
-+int ffa_driver_register(struct ffa_driver *driver, struct module *owner=
,
-+			const char *mod_name);
-+void ffa_driver_unregister(struct ffa_driver *driver);
-+bool ffa_device_is_valid(struct ffa_device *ffa_dev);
-+
-+#else
-+static inline
-+struct ffa_device *ffa_device_register(const uuid_t *uuid, int vm_id)
-+{
-+	return NULL;
-+}
-+
-+static inline void ffa_device_unregister(struct ffa_device *dev) {}
-+
-+static inline int
-+ffa_driver_register(struct ffa_driver *driver, struct module *owner,
-+		    const char *mod_name)
-+{
-+	return -EINVAL;
-+}
-+
-+static inline void ffa_driver_unregister(struct ffa_driver *driver) {}
-+
-+static inline
-+bool ffa_device_is_valid(struct ffa_device *ffa_dev) { return false; }
-+
-+#endif /* CONFIG_ARM_FFA_TRANSPORT */
-+
-+#define ffa_register(driver) \
-+	ffa_driver_register(driver, THIS_MODULE, KBUILD_MODNAME)
-+#define ffa_unregister(driver) \
-+	ffa_driver_unregister(driver)
-+
-+/**
-+ * module_ffa_driver() - Helper macro for registering a psa_ffa driver
-+ * @__ffa_driver: ffa_driver structure
-+ *
-+ * Helper macro for psa_ffa drivers to set up proper module init / exit
-+ * functions.  Replaces module_init() and module_exit() and keeps peopl=
e from
-+ * printing pointless things to the kernel log when their driver is loa=
ded.
-+ */
-+#define module_ffa_driver(__ffa_driver)	\
-+	module_driver(__ffa_driver, ffa_register, ffa_unregister)
-+
-+#endif /* _LINUX_ARM_FFA_H */
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
14-tee-add-sec_world_id-to-struct-tee_shm.patch b/meta-arm-bsp/recipes-ke=
rnel/linux/linux-arm64-ack-5.10/tc/0009-tee-add-sec_world_id-to-struct-te=
e_shm.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/001=
4-tee-add-sec_world_id-to-struct-tee_shm.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0009-=
tee-add-sec_world_id-to-struct-tee_shm.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
10-firmware-arm_ffa-Add-initial-Arm-FFA-driver-support.patch b/meta-arm-b=
sp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0010-firmware-arm_ffa-Add=
-initial-Arm-FFA-driver-support.patch
deleted file mode 100644
index 7bba11c3..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0010-firm=
ware-arm_ffa-Add-initial-Arm-FFA-driver-support.patch
+++ /dev/null
@@ -1,415 +0,0 @@
-From b81111a9cdfc182fb0ee5f219ab16710cd9146cd Mon Sep 17 00:00:00 2001
-From: Sudeep Holla <sudeep.holla@arm.com>
-Date: Fri, 30 Apr 2021 11:24:39 +0100
-Subject: [PATCH 10/22] firmware: arm_ffa: Add initial Arm FFA driver sup=
port
-
-This just add a basic driver that sets up the transport(e.g. SMCCC),
-checks the FFA version implemented, get the partition ID for self and
-sets up the Tx/Rx buffers for communication.
-
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/g=
it/sudeep.holla/linux.git/commit/?h=3Dv5.10/ffa&id=3D13201f9a97be567e8c18=
fec5e357561f41d9b5f6]
----
- drivers/firmware/arm_ffa/Makefile |   3 +-
- drivers/firmware/arm_ffa/bus.c    |  14 +-
- drivers/firmware/arm_ffa/common.h |  24 +++
- drivers/firmware/arm_ffa/driver.c | 307 ++++++++++++++++++++++++++++++
- 4 files changed, 337 insertions(+), 11 deletions(-)
- create mode 100644 drivers/firmware/arm_ffa/common.h
- create mode 100644 drivers/firmware/arm_ffa/driver.c
-
-diff --git a/drivers/firmware/arm_ffa/Makefile b/drivers/firmware/arm_ff=
a/Makefile
-index bfe4323a8784..82d0d35c5324 100644
---- a/drivers/firmware/arm_ffa/Makefile
-+++ b/drivers/firmware/arm_ffa/Makefile
-@@ -1,4 +1,5 @@
- # SPDX-License-Identifier: GPL-2.0-only
- ffa-bus-y =3D bus.o
--ffa-module-objs :=3D $(ffa-bus-y)
-+ffa-driver-y =3D driver.o
-+ffa-module-objs :=3D $(ffa-bus-y) $(ffa-driver-y)
- obj-$(CONFIG_ARM_FFA_TRANSPORT) =3D ffa-module.o
-diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/b=
us.c
-index b743fb2256e9..58441266e60d 100644
---- a/drivers/firmware/arm_ffa/bus.c
-+++ b/drivers/firmware/arm_ffa/bus.c
-@@ -13,6 +13,8 @@
- #include <linux/slab.h>
- #include <linux/types.h>
-=20
-+#include "common.h"
-+
- static int ffa_device_match(struct device *dev, struct device_driver *d=
rv)
- {
- 	const struct ffa_device_id *id_table;
-@@ -187,21 +189,13 @@ void ffa_device_unregister(struct ffa_device *ffa_=
dev)
- }
- EXPORT_SYMBOL_GPL(ffa_device_unregister);
-=20
--static int __init arm_ffa_bus_init(void)
-+int __init arm_ffa_bus_init(void)
- {
- 	return bus_register(&ffa_bus_type);
- }
--module_init(arm_ffa_bus_init);
-=20
--static void __exit arm_ffa_bus_exit(void)
-+void __exit arm_ffa_bus_exit(void)
- {
- 	ffa_devices_unregister();
- 	bus_unregister(&ffa_bus_type);
- }
--
--module_exit(arm_ffa_bus_exit);
--
--MODULE_ALIAS("arm-ffa-bus");
--MODULE_AUTHOR("Sudeep Holla <sudeep.holla@arm.com>");
--MODULE_DESCRIPTION("Arm FF-A bus driver");
--MODULE_LICENSE("GPL v2");
-diff --git a/drivers/firmware/arm_ffa/common.h b/drivers/firmware/arm_ff=
a/common.h
-new file mode 100644
-index 000000000000..9195f66f826c
---- /dev/null
-+++ b/drivers/firmware/arm_ffa/common.h
-@@ -0,0 +1,24 @@
-+/* SPDX-License-Identifier: GPL-2.0 */
-+/*
-+ * Copyright (C) 2020 ARM Ltd.
-+ */
-+
-+#ifndef _FFA_COMMON_H
-+#define _FFA_COMMON_H
-+
-+#include <linux/arm-smccc.h>
-+#include <linux/err.h>
-+
-+typedef struct arm_smccc_1_2_regs ffa_value_t;
-+
-+typedef void (ffa_fn)(ffa_value_t, ffa_value_t *);
-+
-+int __init arm_ffa_bus_init(void);
-+void __exit arm_ffa_bus_exit(void);
-+
-+static inline int __init ffa_transport_init(ffa_fn **invoke_ffa_fn)
-+{
-+	return -EOPNOTSUPP;
-+}
-+
-+#endif /* _FFA_COMMON_H */
-diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ff=
a/driver.c
-new file mode 100644
-index 000000000000..d74f03b773d2
---- /dev/null
-+++ b/drivers/firmware/arm_ffa/driver.c
-@@ -0,0 +1,307 @@
-+// SPDX-License-Identifier: GPL-2.0-only
-+/*
-+ * Arm Firmware Framework for ARMv8-A(FFA) interface driver
-+ *
-+ * The Arm FFA specification[1] describes a software architecture to
-+ * leverages the virtualization extension to isolate software images
-+ * provided by an ecosystem of vendors from each other and describes
-+ * interfaces that standardize communication between the various softwa=
re
-+ * images including communication between images in the Secure world an=
d
-+ * Normal world. Any Hypervisor could use the FFA interfaces to enable
-+ * communication between VMs it manages.
-+ *
-+ * The Hypervisor a.k.a Partition managers in FFA terminology can assig=
n
-+ * system resources(Memory regions, Devices, CPU cycles) to the partiti=
ons
-+ * and manage isolation amongst them.
-+ *
-+ * [1] https://developer.arm.com/docs/den0077/latest
-+ *
-+ * Copyright (C) 2020 Arm Ltd.
-+ */
-+
-+#define DRIVER_NAME "ARM FF-A"
-+#define pr_fmt(fmt) DRIVER_NAME ": " fmt
-+
-+#include <linux/arm_ffa.h>
-+#include <linux/bitfield.h>
-+#include <linux/io.h>
-+#include <linux/module.h>
-+#include <linux/slab.h>
-+
-+#include "common.h"
-+
-+#define FFA_DRIVER_VERSION	FFA_VERSION_1_0
-+
-+#define FFA_SMC(calling_convention, func_num)				\
-+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, (calling_convention),	\
-+			   ARM_SMCCC_OWNER_STANDARD, (func_num))
-+
-+#define FFA_SMC_32(func_num)	FFA_SMC(ARM_SMCCC_SMC_32, (func_num))
-+#define FFA_SMC_64(func_num)	FFA_SMC(ARM_SMCCC_SMC_64, (func_num))
-+
-+#define FFA_ERROR			FFA_SMC_32(0x60)
-+#define FFA_SUCCESS			FFA_SMC_32(0x61)
-+#define FFA_INTERRUPT			FFA_SMC_32(0x62)
-+#define FFA_VERSION			FFA_SMC_32(0x63)
-+#define FFA_FEATURES			FFA_SMC_32(0x64)
-+#define FFA_RX_RELEASE			FFA_SMC_32(0x65)
-+#define FFA_RXTX_MAP			FFA_SMC_32(0x66)
-+#define FFA_FN64_RXTX_MAP		FFA_SMC_64(0x66)
-+#define FFA_RXTX_UNMAP			FFA_SMC_32(0x67)
-+#define FFA_PARTITION_INFO_GET		FFA_SMC_32(0x68)
-+#define FFA_ID_GET			FFA_SMC_32(0x69)
-+#define FFA_MSG_POLL			FFA_SMC_32(0x6A)
-+#define FFA_MSG_WAIT			FFA_SMC_32(0x6B)
-+#define FFA_YIELD			FFA_SMC_32(0x6C)
-+#define FFA_RUN				FFA_SMC_32(0x6D)
-+#define FFA_MSG_SEND			FFA_SMC_32(0x6E)
-+#define FFA_MSG_SEND_DIRECT_REQ		FFA_SMC_32(0x6F)
-+#define FFA_FN64_MSG_SEND_DIRECT_REQ	FFA_SMC_64(0x6F)
-+#define FFA_MSG_SEND_DIRECT_RESP	FFA_SMC_32(0x70)
-+#define FFA_FN64_MSG_SEND_DIRECT_RESP	FFA_SMC_64(0x70)
-+#define FFA_MEM_DONATE			FFA_SMC_32(0x71)
-+#define FFA_FN64_MEM_DONATE		FFA_SMC_64(0x71)
-+#define FFA_MEM_LEND			FFA_SMC_32(0x72)
-+#define FFA_FN64_MEM_LEND		FFA_SMC_64(0x72)
-+#define FFA_MEM_SHARE			FFA_SMC_32(0x73)
-+#define FFA_FN64_MEM_SHARE		FFA_SMC_64(0x73)
-+#define FFA_MEM_RETRIEVE_REQ		FFA_SMC_32(0x74)
-+#define FFA_FN64_MEM_RETRIEVE_REQ	FFA_SMC_64(0x74)
-+#define FFA_MEM_RETRIEVE_RESP		FFA_SMC_32(0x75)
-+#define FFA_MEM_RELINQUISH		FFA_SMC_32(0x76)
-+#define FFA_MEM_RECLAIM			FFA_SMC_32(0x77)
-+#define FFA_MEM_OP_PAUSE		FFA_SMC_32(0x78)
-+#define FFA_MEM_OP_RESUME		FFA_SMC_32(0x79)
-+#define FFA_MEM_FRAG_RX			FFA_SMC_32(0x7A)
-+#define FFA_MEM_FRAG_TX			FFA_SMC_32(0x7B)
-+#define FFA_NORMAL_WORLD_RESUME		FFA_SMC_32(0x7C)
-+
-+/*
-+ * For some calls it is necessary to use SMC64 to pass or return 64-bit=
 values.
-+ * For such calls FFA_FN_NATIVE(name) will choose the appropriate
-+ * (native-width) function ID.
-+ */
-+#ifdef CONFIG_64BIT
-+#define FFA_FN_NATIVE(name)	FFA_FN64_##name
-+#else
-+#define FFA_FN_NATIVE(name)	FFA_##name
-+#endif
-+
-+/* FFA error codes. */
-+#define FFA_RET_SUCCESS            (0)
-+#define FFA_RET_NOT_SUPPORTED      (-1)
-+#define FFA_RET_INVALID_PARAMETERS (-2)
-+#define FFA_RET_NO_MEMORY          (-3)
-+#define FFA_RET_BUSY               (-4)
-+#define FFA_RET_INTERRUPTED        (-5)
-+#define FFA_RET_DENIED             (-6)
-+#define FFA_RET_RETRY              (-7)
-+#define FFA_RET_ABORTED            (-8)
-+
-+#define MAJOR_VERSION_MASK	GENMASK(30, 16)
-+#define MINOR_VERSION_MASK	GENMASK(15, 0)
-+#define MAJOR_VERSION(x)	((u16)(FIELD_GET(MAJOR_VERSION_MASK, (x))))
-+#define MINOR_VERSION(x)	((u16)(FIELD_GET(MINOR_VERSION_MASK, (x))))
-+#define PACK_VERSION_INFO(major, minor)			\
-+	(FIELD_PREP(MAJOR_VERSION_MASK, (major)) |	\
-+	 FIELD_PREP(MINOR_VERSION_MASK, (minor)))
-+#define FFA_VERSION_1_0		PACK_VERSION_INFO(1, 0)
-+#define FFA_MIN_VERSION		FFA_VERSION_1_0
-+
-+#define SENDER_ID_MASK		GENMASK(31, 16)
-+#define RECEIVER_ID_MASK	GENMASK(15, 0)
-+#define SENDER_ID(x)		((u16)(FIELD_GET(SENDER_ID_MASK, (x))))
-+#define RECEIVER_ID(x)		((u16)(FIELD_GET(RECEIVER_ID_MASK, (x))))
-+#define PACK_TARGET_INFO(s, r)		\
-+	(FIELD_PREP(SENDER_ID_MASK, (s)) | FIELD_PREP(RECEIVER_ID_MASK, (r)))
-+
-+/**
-+ * FF-A specification mentions explicitly about '4K pages'. This should
-+ * not be confused with the kernel PAGE_SIZE, which is the translation
-+ * granule kernel is configured and may be one among 4K, 16K and 64K.
-+ */
-+#define FFA_PAGE_SIZE		SZ_4K
-+/*
-+ * Keeping RX TX buffer size as 4K for now
-+ * 64K may be preferred to keep it min a page in 64K PAGE_SIZE config
-+ */
-+#define RXTX_BUFFER_SIZE	SZ_4K
-+
-+static ffa_fn *invoke_ffa_fn;
-+
-+static const int ffa_linux_errmap[] =3D {
-+	/* better than switch case as long as return value is continuous */
-+	0,		/* FFA_RET_SUCCESS */
-+	-EOPNOTSUPP,	/* FFA_RET_NOT_SUPPORTED */
-+	-EINVAL,	/* FFA_RET_INVALID_PARAMETERS */
-+	-ENOMEM,	/* FFA_RET_NO_MEMORY */
-+	-EBUSY,		/* FFA_RET_BUSY */
-+	-EINTR,		/* FFA_RET_INTERRUPTED */
-+	-EACCES,	/* FFA_RET_DENIED */
-+	-EAGAIN,	/* FFA_RET_RETRY */
-+	-ECANCELED,	/* FFA_RET_ABORTED */
-+};
-+
-+static inline int ffa_to_linux_errno(int errno)
-+{
-+	if (errno < FFA_RET_SUCCESS && errno >=3D -ARRAY_SIZE(ffa_linux_errmap=
))
-+		return ffa_linux_errmap[-errno];
-+	return -EINVAL;
-+}
-+
-+struct ffa_drv_info {
-+	u32 version;
-+	u16 vm_id;
-+	struct mutex rx_lock; /* lock to protect Rx buffer */
-+	struct mutex tx_lock; /* lock to protect Tx buffer */
-+	void *rx_buffer;
-+	void *tx_buffer;
-+};
-+
-+static struct ffa_drv_info *drv_info;
-+
-+static int ffa_version_check(u32 *version)
-+{
-+	ffa_value_t ver;
-+
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D FFA_VERSION, .a1 =3D FFA_DRIVER_VERSION,
-+		      }, &ver);
-+
-+	if (ver.a0 =3D=3D FFA_RET_NOT_SUPPORTED) {
-+		pr_info("FFA_VERSION returned not supported\n");
-+		return -EOPNOTSUPP;
-+	}
-+
-+	if (ver.a0 < FFA_MIN_VERSION || ver.a0 > FFA_DRIVER_VERSION) {
-+		pr_err("Incompatible version %d.%d found\n",
-+		       MAJOR_VERSION(ver.a0), MINOR_VERSION(ver.a0));
-+		return -EINVAL;
-+	}
-+
-+	*version =3D ver.a0;
-+	pr_info("Version %d.%d found\n", MAJOR_VERSION(ver.a0),
-+		MINOR_VERSION(ver.a0));
-+	return 0;
-+}
-+
-+static int ffa_rxtx_map(phys_addr_t tx_buf, phys_addr_t rx_buf, u32 pg_=
cnt)
-+{
-+	ffa_value_t ret;
-+
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D FFA_FN_NATIVE(RXTX_MAP),
-+		      .a1 =3D tx_buf, .a2 =3D rx_buf, .a3 =3D pg_cnt,
-+		      }, &ret);
-+
-+	if (ret.a0 =3D=3D FFA_ERROR)
-+		return ffa_to_linux_errno((int)ret.a2);
-+
-+	return 0;
-+}
-+
-+static int ffa_rxtx_unmap(u16 vm_id)
-+{
-+	ffa_value_t ret;
-+
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D FFA_RXTX_UNMAP, .a1 =3D PACK_TARGET_INFO(vm_id, 0),
-+		      }, &ret);
-+
-+	if (ret.a0 =3D=3D FFA_ERROR)
-+		return ffa_to_linux_errno((int)ret.a2);
-+
-+	return 0;
-+}
-+
-+#define VM_ID_MASK	GENMASK(15, 0)
-+static int ffa_id_get(u16 *vm_id)
-+{
-+	ffa_value_t id;
-+
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D FFA_ID_GET,
-+		      }, &id);
-+
-+	if (id.a0 =3D=3D FFA_ERROR)
-+		return ffa_to_linux_errno((int)id.a2);
-+
-+	*vm_id =3D FIELD_GET(VM_ID_MASK, (id.a2));
-+
-+	return 0;
-+}
-+
-+static int __init ffa_init(void)
-+{
-+	int ret;
-+
-+	ret =3D arm_ffa_bus_init();
-+	if (ret)
-+		return ret;
-+
-+	ret =3D ffa_transport_init(&invoke_ffa_fn);
-+	if (ret)
-+		return ret;
-+
-+	drv_info =3D kzalloc(sizeof(*drv_info), GFP_KERNEL);
-+	if (!drv_info)
-+		return -ENOMEM;
-+
-+	ret =3D ffa_version_check(&drv_info->version);
-+	if (ret)
-+		goto free_drv_info;
-+
-+	if (ffa_id_get(&drv_info->vm_id)) {
-+		pr_err("failed to obtain VM id for self\n");
-+		ret =3D -ENODEV;
-+		goto free_drv_info;
-+	}
-+
-+	drv_info->rx_buffer =3D alloc_pages_exact(RXTX_BUFFER_SIZE, GFP_KERNEL=
);
-+	if (!drv_info->rx_buffer) {
-+		ret =3D -ENOMEM;
-+		goto free_pages;
-+	}
-+
-+	drv_info->tx_buffer =3D alloc_pages_exact(RXTX_BUFFER_SIZE, GFP_KERNEL=
);
-+	if (!drv_info->tx_buffer) {
-+		ret =3D -ENOMEM;
-+		goto free_pages;
-+	}
-+
-+	ret =3D ffa_rxtx_map(virt_to_phys(drv_info->tx_buffer),
-+			   virt_to_phys(drv_info->rx_buffer),
-+			   RXTX_BUFFER_SIZE / FFA_PAGE_SIZE);
-+	if (ret) {
-+		pr_err("failed to register FFA RxTx buffers\n");
-+		goto free_pages;
-+	}
-+
-+	mutex_init(&drv_info->rx_lock);
-+	mutex_init(&drv_info->tx_lock);
-+
-+	return 0;
-+free_pages:
-+	if (drv_info->tx_buffer)
-+		free_pages_exact(drv_info->tx_buffer, RXTX_BUFFER_SIZE);
-+	free_pages_exact(drv_info->rx_buffer, RXTX_BUFFER_SIZE);
-+free_drv_info:
-+	kfree(drv_info);
-+	return ret;
-+}
-+module_init(ffa_init);
-+
-+static void __exit ffa_exit(void)
-+{
-+	ffa_rxtx_unmap(drv_info->vm_id);
-+	free_pages_exact(drv_info->tx_buffer, RXTX_BUFFER_SIZE);
-+	free_pages_exact(drv_info->rx_buffer, RXTX_BUFFER_SIZE);
-+	kfree(drv_info);
-+	arm_ffa_bus_exit();
-+}
-+module_exit(ffa_exit);
-+
-+MODULE_ALIAS("arm-ffa");
-+MODULE_AUTHOR("Sudeep Holla <sudeep.holla@arm.com>");
-+MODULE_DESCRIPTION("Arm FF-A interface driver");
-+MODULE_LICENSE("GPL v2");
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
15-optee-simplify-optee_release.patch b/meta-arm-bsp/recipes-kernel/linux=
/linux-arm64-ack-5.10/tc/0010-optee-simplify-optee_release.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/001=
5-optee-simplify-optee_release.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0010-=
optee-simplify-optee_release.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
11-firmware-arm_ffa-Add-support-for-SMCCC-as-transport-.patch b/meta-arm-=
bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0011-firmware-arm_ffa-Ad=
d-support-for-SMCCC-as-transport-.patch
deleted file mode 100644
index d62c4b62..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0011-firm=
ware-arm_ffa-Add-support-for-SMCCC-as-transport-.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-From 22b6c0e78b031f97af093f4d2b26984c42cf4c22 Mon Sep 17 00:00:00 2001
-From: Sudeep Holla <sudeep.holla@arm.com>
-Date: Fri, 30 Apr 2021 11:24:43 +0100
-Subject: [PATCH 11/22] firmware: arm_ffa: Add support for SMCCC as trans=
port
- to FFA driver
-
-There are requests to keep the transport separate in order to allow
-other possible transports like virtio. So let us keep the SMCCC transpor=
t
-specific routines abstracted.
-
-It is kept simple for now. Once we add another transport, we can develop
-better abstraction.
-
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/g=
it/sudeep.holla/linux.git/commit/?h=3Dv5.10/ffa&id=3Dba0c60e85cb3773a9e17=
2425bd14d76cf9d6e67b]
----
- drivers/firmware/arm_ffa/Kconfig  |  5 ++++
- drivers/firmware/arm_ffa/Makefile |  3 ++-
- drivers/firmware/arm_ffa/common.h |  4 ++++
- drivers/firmware/arm_ffa/smccc.c  | 39 +++++++++++++++++++++++++++++++
- 4 files changed, 50 insertions(+), 1 deletion(-)
- create mode 100644 drivers/firmware/arm_ffa/smccc.c
-
-diff --git a/drivers/firmware/arm_ffa/Kconfig b/drivers/firmware/arm_ffa=
/Kconfig
-index 261a3660650a..5e3ae5cf82e8 100644
---- a/drivers/firmware/arm_ffa/Kconfig
-+++ b/drivers/firmware/arm_ffa/Kconfig
-@@ -14,3 +14,8 @@ config ARM_FFA_TRANSPORT
-=20
- 	  This driver provides interface for all the client drivers making
- 	  use of the features offered by ARM FF-A.
-+
-+config ARM_FFA_SMCCC
-+	bool
-+	default ARM_FFA_TRANSPORT
-+	depends on ARM64 && HAVE_ARM_SMCCC_DISCOVERY
-diff --git a/drivers/firmware/arm_ffa/Makefile b/drivers/firmware/arm_ff=
a/Makefile
-index 82d0d35c5324..9d9f37523200 100644
---- a/drivers/firmware/arm_ffa/Makefile
-+++ b/drivers/firmware/arm_ffa/Makefile
-@@ -1,5 +1,6 @@
- # SPDX-License-Identifier: GPL-2.0-only
- ffa-bus-y =3D bus.o
- ffa-driver-y =3D driver.o
--ffa-module-objs :=3D $(ffa-bus-y) $(ffa-driver-y)
-+ffa-transport-$(CONFIG_ARM_FFA_SMCCC) +=3D smccc.o
-+ffa-module-objs :=3D $(ffa-bus-y) $(ffa-driver-y) $(ffa-transport-y)
- obj-$(CONFIG_ARM_FFA_TRANSPORT) =3D ffa-module.o
-diff --git a/drivers/firmware/arm_ffa/common.h b/drivers/firmware/arm_ff=
a/common.h
-index 9195f66f826c..842451666827 100644
---- a/drivers/firmware/arm_ffa/common.h
-+++ b/drivers/firmware/arm_ffa/common.h
-@@ -16,9 +16,13 @@ typedef void (ffa_fn)(ffa_value_t, ffa_value_t *);
- int __init arm_ffa_bus_init(void);
- void __exit arm_ffa_bus_exit(void);
-=20
-+#ifdef CONFIG_ARM_FFA_SMCCC
-+int __init ffa_transport_init(ffa_fn **invoke_ffa_fn);
-+#else
- static inline int __init ffa_transport_init(ffa_fn **invoke_ffa_fn)
- {
- 	return -EOPNOTSUPP;
- }
-+#endif
-=20
- #endif /* _FFA_COMMON_H */
-diff --git a/drivers/firmware/arm_ffa/smccc.c b/drivers/firmware/arm_ffa=
/smccc.c
-new file mode 100644
-index 000000000000..22c34b788769
---- /dev/null
-+++ b/drivers/firmware/arm_ffa/smccc.c
-@@ -0,0 +1,39 @@
-+// SPDX-License-Identifier: GPL-2.0-only
-+/*
-+ * Copyright (C) 2020 ARM Ltd.
-+ */
-+
-+#include <linux/printk.h>
-+
-+#include "common.h"
-+
-+static void __arm_ffa_fn_smc(ffa_value_t args, ffa_value_t *res)
-+{
-+	arm_smccc_1_2_smc(&args, res);
-+}
-+
-+static void __arm_ffa_fn_hvc(ffa_value_t args, ffa_value_t *res)
-+{
-+	arm_smccc_1_2_hvc(&args, res);
-+}
-+
-+int __init ffa_transport_init(ffa_fn **invoke_ffa_fn)
-+{
-+	enum arm_smccc_conduit conduit;
-+
-+	if (arm_smccc_get_version() < ARM_SMCCC_VERSION_1_2)
-+		return -EOPNOTSUPP;
-+
-+	conduit =3D arm_smccc_1_1_get_conduit();
-+	if (conduit =3D=3D SMCCC_CONDUIT_NONE) {
-+		pr_err("%s: invalid SMCCC conduit\n", __func__);
-+		return -EOPNOTSUPP;
-+	}
-+
-+	if (conduit =3D=3D SMCCC_CONDUIT_SMC)
-+		*invoke_ffa_fn =3D __arm_ffa_fn_smc;
-+	else
-+		*invoke_ffa_fn =3D __arm_ffa_fn_hvc;
-+
-+	return 0;
-+}
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
16-optee-sync-OP-TEE-headers.patch b/meta-arm-bsp/recipes-kernel/linux/li=
nux-arm64-ack-5.10/tc/0011-optee-sync-OP-TEE-headers.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/001=
6-optee-sync-OP-TEE-headers.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0011-=
optee-sync-OP-TEE-headers.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
12-firmware-arm_ffa-Setup-in-kernel-users-of-FFA-partit.patch b/meta-arm-=
bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0012-firmware-arm_ffa-Se=
tup-in-kernel-users-of-FFA-partit.patch
deleted file mode 100644
index c747642e..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0012-firm=
ware-arm_ffa-Setup-in-kernel-users-of-FFA-partit.patch
+++ /dev/null
@@ -1,398 +0,0 @@
-From c3da0efebc33b357c9fcf4c748c14167594e5c01 Mon Sep 17 00:00:00 2001
-From: Sudeep Holla <sudeep.holla@arm.com>
-Date: Fri, 30 Apr 2021 11:24:48 +0100
-Subject: [PATCH 12/22] firmware: arm_ffa: Setup in-kernel users of FFA
- partitions
-
-Parse the FFA nodes from the device-tree and register all the partitions
-whose services will be used in the kernel.
-
-In order to also enable in-kernel users of FFA interface, let us add
-simple set of operations for such devices.
-
-The in-kernel users are registered without the character device interfac=
e.
-
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/g=
it/sudeep.holla/linux.git/commit/?h=3Dv5.10/ffa&id=3Df9a344783c03e17cf58f=
9846e5f689cd5233a844]
----
- drivers/firmware/arm_ffa/bus.c    |   9 ++
- drivers/firmware/arm_ffa/common.h |   3 +
- drivers/firmware/arm_ffa/driver.c | 213 ++++++++++++++++++++++++++++++
- include/linux/arm_ffa.h           |  38 +++++-
- 4 files changed, 262 insertions(+), 1 deletion(-)
-
-diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/b=
us.c
-index 58441266e60d..da23100c2e39 100644
---- a/drivers/firmware/arm_ffa/bus.c
-+++ b/drivers/firmware/arm_ffa/bus.c
-@@ -24,6 +24,15 @@ static int ffa_device_match(struct device *dev, struc=
t device_driver *drv)
- 	ffa_dev =3D to_ffa_dev(dev);
-=20
- 	while (!uuid_is_null(&id_table->uuid)) {
-+		/*
-+		 * FF-A v1.0 doesn't provide discovery of UUIDs, just the
-+		 * partition IDs, so fetch the partitions IDs for this
-+		 * id_table UUID and assign the UUID to the device if the
-+		 * partition ID matches
-+		 */
-+		if (uuid_is_null(&ffa_dev->uuid))
-+			ffa_device_match_uuid(ffa_dev, &id_table->uuid);
-+
- 		if (uuid_equal(&ffa_dev->uuid, &id_table->uuid))
- 			return 1;
- 		id_table++;
-diff --git a/drivers/firmware/arm_ffa/common.h b/drivers/firmware/arm_ff=
a/common.h
-index 842451666827..80ad71f02235 100644
---- a/drivers/firmware/arm_ffa/common.h
-+++ b/drivers/firmware/arm_ffa/common.h
-@@ -6,6 +6,7 @@
- #ifndef _FFA_COMMON_H
- #define _FFA_COMMON_H
-=20
-+#include <linux/arm_ffa.h>
- #include <linux/arm-smccc.h>
- #include <linux/err.h>
-=20
-@@ -15,6 +16,8 @@ typedef void (ffa_fn)(ffa_value_t, ffa_value_t *);
-=20
- int __init arm_ffa_bus_init(void);
- void __exit arm_ffa_bus_exit(void);
-+bool ffa_device_is_valid(struct ffa_device *ffa_dev);
-+void ffa_device_match_uuid(struct ffa_device *ffa_dev, const uuid_t *uu=
id);
-=20
- #ifdef CONFIG_ARM_FFA_SMCCC
- int __init ffa_transport_init(ffa_fn **invoke_ffa_fn);
-diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ff=
a/driver.c
-index d74f03b773d2..cefbb3edf142 100644
---- a/drivers/firmware/arm_ffa/driver.c
-+++ b/drivers/firmware/arm_ffa/driver.c
-@@ -24,9 +24,12 @@
-=20
- #include <linux/arm_ffa.h>
- #include <linux/bitfield.h>
-+#include <linux/device.h>
- #include <linux/io.h>
-+#include <linux/kernel.h>
- #include <linux/module.h>
- #include <linux/slab.h>
-+#include <linux/uuid.h>
-=20
- #include "common.h"
-=20
-@@ -185,6 +188,22 @@ static int ffa_version_check(u32 *version)
- 	return 0;
- }
-=20
-+static int ffa_rx_release(void)
-+{
-+	ffa_value_t ret;
-+
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D FFA_RX_RELEASE,
-+		      }, &ret);
-+
-+	if (ret.a0 =3D=3D FFA_ERROR)
-+		return ffa_to_linux_errno((int)ret.a2);
-+
-+	/* check for ret.a0 =3D=3D FFA_RX_RELEASE ? */
-+
-+	return 0;
-+}
-+
- static int ffa_rxtx_map(phys_addr_t tx_buf, phys_addr_t rx_buf, u32 pg_=
cnt)
- {
- 	ffa_value_t ret;
-@@ -214,6 +233,64 @@ static int ffa_rxtx_unmap(u16 vm_id)
- 	return 0;
- }
-=20
-+/* buffer must be sizeof(struct ffa_partition_info) * num_partitions */
-+static int
-+__ffa_partition_info_get(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
-+			 struct ffa_partition_info *buffer, int num_partitions)
-+{
-+	int count;
-+	ffa_value_t partition_info;
-+
-+	mutex_lock(&drv_info->rx_lock);
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D FFA_PARTITION_INFO_GET,
-+		      .a1 =3D uuid0, .a2 =3D uuid1, .a3 =3D uuid2, .a4 =3D uuid3,
-+		      }, &partition_info);
-+
-+	if (partition_info.a0 =3D=3D FFA_ERROR) {
-+		mutex_unlock(&drv_info->rx_lock);
-+		return ffa_to_linux_errno((int)partition_info.a2);
-+	}
-+
-+	count =3D partition_info.a2;
-+
-+	if (buffer && count <=3D num_partitions)
-+		memcpy(buffer, drv_info->rx_buffer, sizeof(*buffer) * count);
-+
-+	ffa_rx_release();
-+
-+	mutex_unlock(&drv_info->rx_lock);
-+
-+	return count;
-+}
-+
-+/* buffer is allocated and caller must free the same if returned count =
> 0 */
-+static int
-+ffa_partition_probe(const uuid_t *uuid, struct ffa_partition_info **buf=
fer)
-+{
-+	int count;
-+	u32 uuid0_4[4];
-+	struct ffa_partition_info *pbuf;
-+
-+	export_uuid((u8 *)uuid0_4, uuid);
-+	count =3D __ffa_partition_info_get(uuid0_4[0], uuid0_4[1], uuid0_4[2],
-+					 uuid0_4[3], NULL, 0);
-+	if (count <=3D 0)
-+		return count;
-+
-+	pbuf =3D kcalloc(count, sizeof(*pbuf), GFP_KERNEL);
-+	if (!pbuf)
-+		return -ENOMEM;
-+
-+	count =3D __ffa_partition_info_get(uuid0_4[0], uuid0_4[1], uuid0_4[2],
-+					 uuid0_4[3], pbuf, count);
-+	if (count <=3D 0)
-+		kfree(pbuf);
-+
-+	*buffer =3D pbuf;
-+	return count;
-+}
-+
- #define VM_ID_MASK	GENMASK(15, 0)
- static int ffa_id_get(u16 *vm_id)
- {
-@@ -231,6 +308,140 @@ static int ffa_id_get(u16 *vm_id)
- 	return 0;
- }
-=20
-+static int ffa_msg_send_direct_req(u16 src_id, u16 dst_id, bool mode_32=
bit,
-+				   struct ffa_send_direct_data *data)
-+{
-+	u32 req_id, resp_id, src_dst_ids =3D PACK_TARGET_INFO(src_id, dst_id);
-+	ffa_value_t ret;
-+
-+	if (mode_32bit) {
-+		req_id =3D FFA_MSG_SEND_DIRECT_REQ;
-+		resp_id =3D FFA_MSG_SEND_DIRECT_RESP;
-+	} else {
-+		req_id =3D FFA_FN_NATIVE(MSG_SEND_DIRECT_REQ);
-+		resp_id =3D FFA_FN_NATIVE(MSG_SEND_DIRECT_RESP);
-+	}
-+
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D req_id, .a1 =3D src_dst_ids, .a2 =3D 0,
-+		      .a3 =3D data->data0, .a4 =3D data->data1, .a5 =3D data->data2,
-+		      .a6 =3D data->data3, .a7 =3D data->data4,
-+		      }, &ret);
-+
-+	while (ret.a0 =3D=3D FFA_INTERRUPT)
-+		invoke_ffa_fn((ffa_value_t){
-+			      .a0 =3D FFA_RUN, .a1 =3D ret.a1,
-+			      }, &ret);
-+
-+	if (ret.a0 =3D=3D FFA_ERROR)
-+		return ffa_to_linux_errno((int)ret.a2);
-+
-+	if (ret.a0 =3D=3D resp_id) {
-+		data->data0 =3D ret.a3;
-+		data->data1 =3D ret.a4;
-+		data->data2 =3D ret.a5;
-+		data->data3 =3D ret.a6;
-+		data->data4 =3D ret.a7;
-+		return 0;
-+	}
-+
-+	return -EINVAL;
-+}
-+
-+static u32 ffa_api_version_get(void)
-+{
-+	return drv_info->version;
-+}
-+
-+static int ffa_partition_info_get(const char *uuid_str,
-+				  struct ffa_partition_info *buffer)
-+{
-+	int count;
-+	uuid_t uuid;
-+	struct ffa_partition_info *pbuf;
-+
-+	if (uuid_parse(uuid_str, &uuid)) {
-+		pr_err("invalid uuid (%s)\n", uuid_str);
-+		return -ENODEV;
-+	}
-+
-+	count =3D ffa_partition_probe(&uuid_null, &pbuf);
-+	if (count <=3D 0)
-+		return -ENOENT;
-+
-+	memcpy(buffer, pbuf, sizeof(*pbuf) * count);
-+	kfree(pbuf);
-+	return 0;
-+}
-+
-+static void ffa_mode_32bit_set(struct ffa_device *dev)
-+{
-+	dev->mode_32bit =3D true;
-+}
-+
-+static int ffa_sync_send_receive(struct ffa_device *dev,
-+				 struct ffa_send_direct_data *data)
-+{
-+	return ffa_msg_send_direct_req(drv_info->vm_id, dev->vm_id,
-+				       dev->mode_32bit, data);
-+}
-+
-+static const struct ffa_dev_ops ffa_ops =3D {
-+	.api_version_get =3D ffa_api_version_get,
-+	.partition_info_get =3D ffa_partition_info_get,
-+	.mode_32bit_set =3D ffa_mode_32bit_set,
-+	.sync_send_receive =3D ffa_sync_send_receive,
-+};
-+
-+const struct ffa_dev_ops *ffa_dev_ops_get(struct ffa_device *dev)
-+{
-+	if (ffa_device_is_valid(dev))
-+		return &ffa_ops;
-+
-+	return NULL;
-+}
-+EXPORT_SYMBOL_GPL(ffa_dev_ops_get);
-+
-+void ffa_device_match_uuid(struct ffa_device *ffa_dev, const uuid_t *uu=
id)
-+{
-+	int count, idx;
-+	struct ffa_partition_info *pbuf, *tpbuf;
-+
-+	count =3D ffa_partition_probe(uuid, &pbuf);
-+	if (count <=3D 0)
-+		return;
-+
-+	for (idx =3D 0, tpbuf =3D pbuf; idx < count; idx++, tpbuf++)
-+		if (tpbuf->id =3D=3D ffa_dev->vm_id)
-+			uuid_copy(&ffa_dev->uuid, uuid);
-+	kfree(pbuf);
-+}
-+
-+static void ffa_setup_partitions(void)
-+{
-+	int count, idx;
-+	struct ffa_device *ffa_dev;
-+	struct ffa_partition_info *pbuf, *tpbuf;
-+
-+	count =3D ffa_partition_probe(&uuid_null, &pbuf);
-+	if (count <=3D 0) {
-+		pr_info("%s: No partitions found, error %d\n", __func__, count);
-+		return;
-+	}
-+
-+	for (idx =3D 0, tpbuf =3D pbuf; idx < count; idx++, tpbuf++) {
-+		ffa_dev =3D ffa_device_register(&uuid_null, tpbuf->id);
-+		if (!ffa_dev) {
-+			pr_err("%s: failed to register partition ID 0x%x\n",
-+			       __func__, tpbuf->id);
-+			continue;
-+		}
-+
-+		ffa_dev_set_drvdata(ffa_dev, drv_info);
-+	}
-+	kfree(pbuf);
-+}
-+
- static int __init ffa_init(void)
- {
- 	int ret;
-@@ -280,6 +491,8 @@ static int __init ffa_init(void)
- 	mutex_init(&drv_info->rx_lock);
- 	mutex_init(&drv_info->tx_lock);
-=20
-+	ffa_setup_partitions();
-+
- 	return 0;
- free_pages:
- 	if (drv_info->tx_buffer)
-diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
-index aaff89364541..b242fbbce4f0 100644
---- a/include/linux/arm_ffa.h
-+++ b/include/linux/arm_ffa.h
-@@ -6,7 +6,6 @@
- #ifndef _LINUX_ARM_FFA_H
- #define _LINUX_ARM_FFA_H
-=20
--#include <linux/cdev.h>
- #include <linux/device.h>
- #include <linux/module.h>
- #include <linux/types.h>
-@@ -15,6 +14,7 @@
- /* FFA Bus/Device/Driver related */
- struct ffa_device {
- 	int vm_id;
-+	bool mode_32bit;
- 	uuid_t uuid;
- 	struct device dev;
- };
-@@ -48,6 +48,7 @@ int ffa_driver_register(struct ffa_driver *driver, str=
uct module *owner,
- 			const char *mod_name);
- void ffa_driver_unregister(struct ffa_driver *driver);
- bool ffa_device_is_valid(struct ffa_device *ffa_dev);
-+const struct ffa_dev_ops *ffa_dev_ops_get(struct ffa_device *dev);
-=20
- #else
- static inline
-@@ -70,6 +71,10 @@ static inline void ffa_driver_unregister(struct ffa_d=
river *driver) {}
- static inline
- bool ffa_device_is_valid(struct ffa_device *ffa_dev) { return false; }
-=20
-+const struct ffa_dev_ops *ffa_dev_ops_get(struct ffa_device *dev)
-+{
-+	return NULL;
-+}
- #endif /* CONFIG_ARM_FFA_TRANSPORT */
-=20
- #define ffa_register(driver) \
-@@ -88,4 +93,35 @@ bool ffa_device_is_valid(struct ffa_device *ffa_dev) =
{ return false; }
- #define module_ffa_driver(__ffa_driver)	\
- 	module_driver(__ffa_driver, ffa_register, ffa_unregister)
-=20
-+/* FFA transport related */
-+struct ffa_partition_info {
-+	u16 id;
-+	u16 exec_ctxt;
-+/* partition supports receipt of direct requests */
-+#define FFA_PARTITION_DIRECT_RECV	BIT(0)
-+/* partition can send direct requests. */
-+#define FFA_PARTITION_DIRECT_SEND	BIT(1)
-+/* partition can send and receive indirect messages. */
-+#define FFA_PARTITION_INDIRECT_MSG	BIT(2)
-+	u32 properties;
-+};
-+
-+/* For use with FFA_MSG_SEND_DIRECT_{REQ,RESP} which pass data via regi=
sters */
-+struct ffa_send_direct_data {
-+	unsigned long data0; /* w3/x3 */
-+	unsigned long data1; /* w4/x4 */
-+	unsigned long data2; /* w5/x5 */
-+	unsigned long data3; /* w6/x6 */
-+	unsigned long data4; /* w7/x7 */
-+};
-+
-+struct ffa_dev_ops {
-+	u32 (*api_version_get)(void);
-+	int (*partition_info_get)(const char *uuid_str,
-+				  struct ffa_partition_info *buffer);
-+	void (*mode_32bit_set)(struct ffa_device *dev);
-+	int (*sync_send_receive)(struct ffa_device *dev,
-+				 struct ffa_send_direct_data *data);
-+};
-+
- #endif /* _LINUX_ARM_FFA_H */
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
17-optee-refactor-driver-with-internal-callbacks.patch b/meta-arm-bsp/rec=
ipes-kernel/linux/linux-arm64-ack-5.10/tc/0012-optee-refactor-driver-with=
-internal-callbacks.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/001=
7-optee-refactor-driver-with-internal-callbacks.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0012-=
optee-refactor-driver-with-internal-callbacks.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
13-firmware-arm_ffa-Add-support-for-MEM_-interfaces.patch b/meta-arm-bsp/=
recipes-kernel/linux/linux-arm64-ack-5.10/tc/0013-firmware-arm_ffa-Add-su=
pport-for-MEM_-interfaces.patch
deleted file mode 100644
index 897ba0a2..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0013-firm=
ware-arm_ffa-Add-support-for-MEM_-interfaces.patch
+++ /dev/null
@@ -1,406 +0,0 @@
-From f4b26dbe513b342f8774810f91d526f545a7202d Mon Sep 17 00:00:00 2001
-From: Sudeep Holla <sudeep.holla@arm.com>
-Date: Fri, 30 Apr 2021 11:24:51 +0100
-Subject: [PATCH 13/22] firmware: arm_ffa: Add support for MEM_* interfac=
es
-
-Most of the MEM_* APIs share the same parameters, so they can be
-generalised. Currently only MEM_SHARE is implemented and the user space
-interface for that is not added yet.
-
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/g=
it/sudeep.holla/linux.git/commit/?h=3Dv5.10/ffa&id=3Df27cbd0b3f83cb40ff73=
85f00d05afe1be7577b2]
----
- drivers/firmware/arm_ffa/driver.c | 199 ++++++++++++++++++++++++++++++
- include/linux/arm_ffa.h           | 139 +++++++++++++++++++++
- 2 files changed, 338 insertions(+)
-
-diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ff=
a/driver.c
-index cefbb3edf142..056a3fca14d1 100644
---- a/drivers/firmware/arm_ffa/driver.c
-+++ b/drivers/firmware/arm_ffa/driver.c
-@@ -28,6 +28,8 @@
- #include <linux/io.h>
- #include <linux/kernel.h>
- #include <linux/module.h>
-+#include <linux/mm.h>
-+#include <linux/scatterlist.h>
- #include <linux/slab.h>
- #include <linux/uuid.h>
-=20
-@@ -348,6 +350,192 @@ static int ffa_msg_send_direct_req(u16 src_id, u16=
 dst_id, bool mode_32bit,
- 	return -EINVAL;
- }
-=20
-+static int ffa_mem_first_frag(u32 func_id, phys_addr_t buf, u32 buf_sz,
-+			      u32 frag_len, u32 len, u64 *handle)
-+{
-+	ffa_value_t ret;
-+
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D func_id, .a1 =3D len, .a2 =3D frag_len,
-+		      .a3 =3D buf, .a4 =3D buf_sz,
-+		      }, &ret);
-+
-+	while (ret.a0 =3D=3D FFA_MEM_OP_PAUSE)
-+		invoke_ffa_fn((ffa_value_t){
-+			      .a0 =3D FFA_MEM_OP_RESUME,
-+			      .a1 =3D ret.a1, .a2 =3D ret.a2,
-+			      }, &ret);
-+
-+	if (ret.a0 =3D=3D FFA_ERROR)
-+		return ffa_to_linux_errno((int)ret.a2);
-+
-+	if (ret.a0 !=3D FFA_SUCCESS)
-+		return -EOPNOTSUPP;
-+
-+	if (handle)
-+		*handle =3D PACK_HANDLE(ret.a2, ret.a3);
-+
-+	return frag_len;
-+}
-+
-+static int ffa_mem_next_frag(u64 handle, u32 frag_len)
-+{
-+	ffa_value_t ret;
-+
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D FFA_MEM_FRAG_TX,
-+		      .a1 =3D HANDLE_LOW(handle), .a2 =3D HANDLE_HIGH(handle),
-+		      .a3 =3D frag_len,
-+		      }, &ret);
-+
-+	while (ret.a0 =3D=3D FFA_MEM_OP_PAUSE)
-+		invoke_ffa_fn((ffa_value_t){
-+			      .a0 =3D FFA_MEM_OP_RESUME,
-+			      .a1 =3D ret.a1, .a2 =3D ret.a2,
-+			      }, &ret);
-+
-+	if (ret.a0 =3D=3D FFA_ERROR)
-+		return ffa_to_linux_errno((int)ret.a2);
-+
-+	if (ret.a0 !=3D FFA_MEM_FRAG_RX)
-+		return -EOPNOTSUPP;
-+
-+	return ret.a3;
-+}
-+
-+static int
-+ffa_transmit_fragment(u32 func_id, phys_addr_t buf, u32 buf_sz, u32 fra=
g_len,
-+		      u32 len, u64 *handle, bool first)
-+{
-+	if (!first)
-+		return ffa_mem_next_frag(*handle, frag_len);
-+
-+	return ffa_mem_first_frag(func_id, buf, buf_sz, frag_len, len, handle)=
;
-+}
-+
-+static u32 ffa_get_num_pages_sg(struct scatterlist *sg)
-+{
-+	u32 num_pages =3D 0;
-+
-+	do {
-+		num_pages +=3D sg->length / FFA_PAGE_SIZE;
-+	} while ((sg =3D sg_next(sg)));
-+
-+	return num_pages;
-+}
-+
-+static int
-+ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
-+		       struct ffa_mem_ops_args *args)
-+{
-+	int rc =3D 0;
-+	bool first =3D true;
-+	phys_addr_t addr =3D 0;
-+	struct ffa_composite_mem_region *composite;
-+	struct ffa_mem_region_addr_range *constituents;
-+	struct ffa_mem_region_attributes *ep_mem_access;
-+	struct ffa_mem_region *mem_region =3D buffer;
-+	u32 idx, frag_len, length, buf_sz =3D 0, num_entries =3D sg_nents(args=
->sg);
-+
-+	mem_region->tag =3D args->tag;
-+	mem_region->flags =3D args->flags;
-+	mem_region->sender_id =3D drv_info->vm_id;
-+	mem_region->attributes =3D FFA_MEM_NORMAL | FFA_MEM_WRITE_BACK |
-+				 FFA_MEM_INNER_SHAREABLE;
-+	ep_mem_access =3D &mem_region->ep_mem_access[0];
-+
-+	for (idx =3D 0; idx < args->nattrs; idx++, ep_mem_access++) {
-+		ep_mem_access->receiver =3D args->attrs[idx].receiver;
-+		ep_mem_access->attrs =3D args->attrs[idx].attrs;
-+		ep_mem_access->composite_off =3D COMPOSITE_OFFSET(args->nattrs);
-+	}
-+	mem_region->ep_count =3D args->nattrs;
-+
-+	composite =3D buffer + COMPOSITE_OFFSET(args->nattrs);
-+	composite->total_pg_cnt =3D ffa_get_num_pages_sg(args->sg);
-+	composite->addr_range_cnt =3D num_entries;
-+
-+	length =3D COMPOSITE_CONSTITUENTS_OFFSET(args->nattrs, num_entries);
-+	frag_len =3D COMPOSITE_CONSTITUENTS_OFFSET(args->nattrs, 0);
-+	if (frag_len > max_fragsize)
-+		return -ENXIO;
-+
-+	if (!args->use_txbuf) {
-+		addr =3D virt_to_phys(buffer);
-+		buf_sz =3D max_fragsize / FFA_PAGE_SIZE;
-+	}
-+
-+	constituents =3D buffer + frag_len;
-+	idx =3D 0;
-+	do {
-+		if (frag_len =3D=3D max_fragsize) {
-+			rc =3D ffa_transmit_fragment(func_id, addr, buf_sz,
-+						   frag_len, length,
-+						   &args->g_handle, first);
-+			if (rc < 0)
-+				return -ENXIO;
-+
-+			first =3D false;
-+			idx =3D 0;
-+			frag_len =3D 0;
-+			constituents =3D buffer;
-+		}
-+
-+		if ((void *)constituents - buffer > max_fragsize) {
-+			pr_err("Memory Region Fragment > Tx Buffer size\n");
-+			return -EFAULT;
-+		}
-+
-+		constituents->address =3D sg_phys(args->sg);
-+		constituents->pg_cnt =3D args->sg->length / FFA_PAGE_SIZE;
-+		constituents++;
-+		frag_len +=3D sizeof(struct ffa_mem_region_addr_range);
-+	} while ((args->sg =3D sg_next(args->sg)));
-+
-+	return ffa_transmit_fragment(func_id, addr, buf_sz, frag_len,
-+				     length, &args->g_handle, first);
-+}
-+
-+static int ffa_memory_ops(u32 func_id, struct ffa_mem_ops_args *args)
-+{
-+	int ret;
-+	void *buffer;
-+
-+	if (!args->use_txbuf) {
-+		buffer =3D alloc_pages_exact(RXTX_BUFFER_SIZE, GFP_KERNEL);
-+		if (!buffer)
-+			return -ENOMEM;
-+	} else {
-+		buffer =3D drv_info->tx_buffer;
-+		mutex_lock(&drv_info->tx_lock);
-+	}
-+
-+	ret =3D ffa_setup_and_transmit(func_id, buffer, RXTX_BUFFER_SIZE, args=
);
-+
-+	if (args->use_txbuf)
-+		mutex_unlock(&drv_info->tx_lock);
-+	else
-+		free_pages_exact(buffer, RXTX_BUFFER_SIZE);
-+
-+	return ret < 0 ? ret : 0;
-+}
-+
-+static int ffa_memory_reclaim(u64 g_handle, u32 flags)
-+{
-+	ffa_value_t ret;
-+
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D FFA_MEM_RECLAIM,
-+		      .a1 =3D HANDLE_LOW(g_handle), .a2 =3D HANDLE_HIGH(g_handle),
-+		      .a3 =3D flags,
-+		      }, &ret);
-+
-+	if (ret.a0 =3D=3D FFA_ERROR)
-+		return ffa_to_linux_errno((int)ret.a2);
-+
-+	return 0;
-+}
-+
- static u32 ffa_api_version_get(void)
- {
- 	return drv_info->version;
-@@ -386,11 +574,22 @@ static int ffa_sync_send_receive(struct ffa_device=
 *dev,
- 				       dev->mode_32bit, data);
- }
-=20
-+static int
-+ffa_memory_share(struct ffa_device *dev, struct ffa_mem_ops_args *args)
-+{
-+	if (dev->mode_32bit)
-+		return ffa_memory_ops(FFA_MEM_SHARE, args);
-+
-+	return ffa_memory_ops(FFA_FN_NATIVE(MEM_SHARE), args);
-+}
-+
- static const struct ffa_dev_ops ffa_ops =3D {
- 	.api_version_get =3D ffa_api_version_get,
- 	.partition_info_get =3D ffa_partition_info_get,
- 	.mode_32bit_set =3D ffa_mode_32bit_set,
- 	.sync_send_receive =3D ffa_sync_send_receive,
-+	.memory_reclaim =3D ffa_memory_reclaim,
-+	.memory_share =3D ffa_memory_share,
- };
-=20
- const struct ffa_dev_ops *ffa_dev_ops_get(struct ffa_device *dev)
-diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
-index b242fbbce4f0..6dc0f4e425b9 100644
---- a/include/linux/arm_ffa.h
-+++ b/include/linux/arm_ffa.h
-@@ -115,6 +115,142 @@ struct ffa_send_direct_data {
- 	unsigned long data4; /* w7/x7 */
- };
-=20
-+struct ffa_mem_region_addr_range {
-+	/* The base IPA of the constituent memory region, aligned to 4 kiB */
-+	u64 address;
-+	/* The number of 4 kiB pages in the constituent memory region. */
-+	u32 pg_cnt;
-+	u32 reserved;
-+};
-+
-+struct ffa_composite_mem_region {
-+	/*
-+	 * The total number of 4 kiB pages included in this memory region. Thi=
s
-+	 * must be equal to the sum of page counts specified in each
-+	 * `struct ffa_mem_region_addr_range`.
-+	 */
-+	u32 total_pg_cnt;
-+	/* The number of constituents included in this memory region range */
-+	u32 addr_range_cnt;
-+	u64 reserved;
-+	/** An array of `addr_range_cnt` memory region constituents. */
-+	struct ffa_mem_region_addr_range constituents[];
-+};
-+
-+struct ffa_mem_region_attributes {
-+	/* The ID of the VM to which the memory is being given or shared. */
-+	u16 receiver;
-+	/*
-+	 * The permissions with which the memory region should be mapped in th=
e
-+	 * receiver's page table.
-+	 */
-+#define FFA_MEM_EXEC		BIT(3)
-+#define FFA_MEM_NO_EXEC		BIT(2)
-+#define FFA_MEM_RW		BIT(1)
-+#define FFA_MEM_RO		BIT(0)
-+	u8 attrs;
-+	/*
-+	 * Flags used during FFA_MEM_RETRIEVE_REQ and FFA_MEM_RETRIEVE_RESP
-+	 * for memory regions with multiple borrowers.
-+	 */
-+#define FFA_MEM_RETRIEVE_SELF_BORROWER	BIT(0)
-+	u8 flag;
-+	u32 composite_off;
-+	/*
-+	 * Offset in bytes from the start of the outer `ffa_memory_region` to
-+	 * an `struct ffa_mem_region_addr_range`.
-+	 */
-+	u64 reserved;
-+};
-+
-+struct ffa_mem_region {
-+	/* The ID of the VM/owner which originally sent the memory region */
-+	u16 sender_id;
-+#define FFA_MEM_NORMAL		BIT(5)
-+#define FFA_MEM_DEVICE		BIT(4)
-+
-+#define FFA_MEM_WRITE_BACK	(3 << 2)
-+#define FFA_MEM_NON_CACHEABLE	(1 << 2)
-+
-+#define FFA_DEV_nGnRnE		(0 << 2)
-+#define FFA_DEV_nGnRE		(1 << 2)
-+#define FFA_DEV_nGRE		(2 << 2)
-+#define FFA_DEV_GRE		(3 << 2)
-+
-+#define FFA_MEM_NON_SHAREABLE	(0)
-+#define FFA_MEM_OUTER_SHAREABLE	(2)
-+#define FFA_MEM_INNER_SHAREABLE	(3)
-+	u8 attributes;
-+	u8 reserved_0;
-+/*
-+ * Clear memory region contents after unmapping it from the sender and
-+ * before mapping it for any receiver.
-+ */
-+#define FFA_MEM_CLEAR			BIT(0)
-+/*
-+ * Whether the hypervisor may time slice the memory sharing or retrieva=
l
-+ * operation.
-+ */
-+#define FFA_TIME_SLICE_ENABLE		BIT(1)
-+
-+#define FFA_MEM_RETRIEVE_TYPE_IN_RESP	(0 << 3)
-+#define FFA_MEM_RETRIEVE_TYPE_SHARE	(1 << 3)
-+#define FFA_MEM_RETRIEVE_TYPE_LEND	(2 << 3)
-+#define FFA_MEM_RETRIEVE_TYPE_DONATE	(3 << 3)
-+
-+#define FFA_MEM_RETRIEVE_ADDR_ALIGN_HINT	BIT(9)
-+#define FFA_MEM_RETRIEVE_ADDR_ALIGN(x)		((x) << 5)
-+	/* Flags to control behaviour of the transaction. */
-+	u32 flags;
-+#define HANDLE_LOW_MASK		GENMASK_ULL(31, 0)
-+#define HANDLE_HIGH_MASK	GENMASK_ULL(63, 32)
-+#define HANDLE_LOW(x)		((u32)(FIELD_GET(HANDLE_LOW_MASK, (x))))
-+#define	HANDLE_HIGH(x)		((u32)(FIELD_GET(HANDLE_HIGH_MASK, (x))))
-+
-+#define PACK_HANDLE(l, h)		\
-+	(FIELD_PREP(HANDLE_LOW_MASK, (l)) | FIELD_PREP(HANDLE_HIGH_MASK, (h)))
-+	/*
-+	 * A globally-unique ID assigned by the hypervisor for a region
-+	 * of memory being sent between VMs.
-+	 */
-+	u64 handle;
-+	/*
-+	 * An implementation defined value associated with the receiver and th=
e
-+	 * memory region.
-+	 */
-+	u64 tag;
-+	u32 reserved_1;
-+	/*
-+	 * The number of `ffa_mem_region_attributes` entries included in this
-+	 * transaction.
-+	 */
-+	u32 ep_count;
-+	/*
-+	 * An array of endpoint memory access descriptors.
-+	 * Each one specifies a memory region offset, an endpoint and the
-+	 * attributes with which this memory region should be mapped in that
-+	 * endpoint's page table.
-+	 */
-+	struct ffa_mem_region_attributes ep_mem_access[];
-+};
-+
-+#define	COMPOSITE_OFFSET(x)	\
-+	(offsetof(struct ffa_mem_region, ep_mem_access[x]))
-+#define CONSTITUENTS_OFFSET(x)	\
-+	(offsetof(struct ffa_composite_mem_region, constituents[x]))
-+#define COMPOSITE_CONSTITUENTS_OFFSET(x, y)	\
-+	(COMPOSITE_OFFSET(x) + CONSTITUENTS_OFFSET(y))
-+
-+struct ffa_mem_ops_args {
-+	bool use_txbuf;
-+	u32 nattrs;
-+	u32 flags;
-+	u64 tag;
-+	u64 g_handle;
-+	struct scatterlist *sg;
-+	struct ffa_mem_region_attributes *attrs;
-+};
-+
- struct ffa_dev_ops {
- 	u32 (*api_version_get)(void);
- 	int (*partition_info_get)(const char *uuid_str,
-@@ -122,6 +258,9 @@ struct ffa_dev_ops {
- 	void (*mode_32bit_set)(struct ffa_device *dev);
- 	int (*sync_send_receive)(struct ffa_device *dev,
- 				 struct ffa_send_direct_data *data);
-+	int (*memory_reclaim)(u64 g_handle, u32 flags);
-+	int (*memory_share)(struct ffa_device *dev,
-+			    struct ffa_mem_ops_args *args);
- };
-=20
- #endif /* _LINUX_ARM_FFA_H */
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
18-optee-add-a-FF-A-memory-pool.patch b/meta-arm-bsp/recipes-kernel/linux=
/linux-arm64-ack-5.10/tc/0013-optee-add-a-FF-A-memory-pool.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/001=
8-optee-add-a-FF-A-memory-pool.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0013-=
optee-add-a-FF-A-memory-pool.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
19-optee-add-FF-A-support.patch b/meta-arm-bsp/recipes-kernel/linux/linux=
-arm64-ack-5.10/tc/0014-optee-add-FF-A-support.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/001=
9-optee-add-FF-A-support.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0014-=
optee-add-FF-A-support.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
22-coresight-etm4x-Save-restore-TRFCR_EL1.patch b/meta-arm-bsp/recipes-ke=
rnel/linux/linux-arm64-ack-5.10/tc/0015-coresight-etm4x-Save-restore-TRFC=
R_EL1.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/002=
2-coresight-etm4x-Save-restore-TRFCR_EL1.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0015-=
coresight-etm4x-Save-restore-TRFCR_EL1.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
23-coresight-etm4x-Use-Trace-Filtering-controls-dynamic.patch b/meta-arm-=
bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0016-coresight-etm4x-Use=
-Trace-Filtering-controls-dynamic.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/002=
3-coresight-etm4x-Use-Trace-Filtering-controls-dynamic.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0016-=
coresight-etm4x-Use-Trace-Filtering-controls-dynamic.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
24-perf-arm-cmn-Use-irq_set_affinity.patch b/meta-arm-bsp/recipes-kernel/=
linux/linux-arm64-ack-5.10/tc/0017-perf-arm-cmn-Use-irq_set_affinity.patc=
h
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/002=
4-perf-arm-cmn-Use-irq_set_affinity.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0017-=
perf-arm-cmn-Use-irq_set_affinity.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
25-perf-arm-cmn-Fix-CPU-hotplug-unregistration.patch b/meta-arm-bsp/recip=
es-kernel/linux/linux-arm64-ack-5.10/tc/0018-perf-arm-cmn-Fix-CPU-hotplug=
-unregistration.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/002=
5-perf-arm-cmn-Fix-CPU-hotplug-unregistration.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0018-=
perf-arm-cmn-Fix-CPU-hotplug-unregistration.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
26-perf-arm-cmn-Account-for-NUMA-affinity.patch b/meta-arm-bsp/recipes-ke=
rnel/linux/linux-arm64-ack-5.10/tc/0019-perf-arm-cmn-Account-for-NUMA-aff=
inity.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/002=
6-perf-arm-cmn-Account-for-NUMA-affinity.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0019-=
perf-arm-cmn-Account-for-NUMA-affinity.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
27-perf-arm-cmn-Drop-compile-test-restriction.patch b/meta-arm-bsp/recipe=
s-kernel/linux/linux-arm64-ack-5.10/tc/0020-perf-arm-cmn-Drop-compile-tes=
t-restriction.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/002=
7-perf-arm-cmn-Drop-compile-test-restriction.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0020-=
perf-arm-cmn-Drop-compile-test-restriction.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
21-arm_ffa-add-support-for-FFA-v1.1.patch b/meta-arm-bsp/recipes-kernel/l=
inux/linux-arm64-ack-5.10/tc/0021-arm_ffa-add-support-for-FFA-v1.1.patch
deleted file mode 100644
index bebac41c..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0021-arm_=
ffa-add-support-for-FFA-v1.1.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From abb29275dc4965e015f7719951645acfa58bcab4 Mon Sep 17 00:00:00 2001
-From: Usama Arif <usama.arif@arm.com>
-Date: Wed, 11 Aug 2021 09:45:35 +0100
-Subject: [PATCH 21/22] arm_ffa: add support for FFA v1.1
-
-Change-Id: I3d5a72981c6a66a0a034fd76d5e38eeb33318d20
-Signed-off-by: Usama Arif <usama.arif@arm.com>
-
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- drivers/firmware/arm_ffa/driver.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ff=
a/driver.c
-index 82c84fe10be2..84d5a513fb94 100644
---- a/drivers/firmware/arm_ffa/driver.c
-+++ b/drivers/firmware/arm_ffa/driver.c
-@@ -35,7 +35,7 @@
-=20
- #include "common.h"
-=20
--#define FFA_DRIVER_VERSION	FFA_VERSION_1_0
-+#define FFA_DRIVER_VERSION	FFA_VERSION_1_1
-=20
- #define FFA_SMC(calling_convention, func_num)				\
- 	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, (calling_convention),	\
-@@ -111,6 +111,7 @@
- 	(FIELD_PREP(MAJOR_VERSION_MASK, (major)) |	\
- 	 FIELD_PREP(MINOR_VERSION_MASK, (minor)))
- #define FFA_VERSION_1_0		PACK_VERSION_INFO(1, 0)
-+#define FFA_VERSION_1_1		PACK_VERSION_INFO(1, 1)
- #define FFA_MIN_VERSION		FFA_VERSION_1_0
-=20
- #define SENDER_ID_MASK		GENMASK(31, 16)
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
28-perf-arm-cmn-Refactor-node-ID-handling.patch b/meta-arm-bsp/recipes-ke=
rnel/linux/linux-arm64-ack-5.10/tc/0021-perf-arm-cmn-Refactor-node-ID-han=
dling.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/002=
8-perf-arm-cmn-Refactor-node-ID-handling.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0021-=
perf-arm-cmn-Refactor-node-ID-handling.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
29-perf-arm-cmn-Streamline-node-iteration.patch b/meta-arm-bsp/recipes-ke=
rnel/linux/linux-arm64-ack-5.10/tc/0022-perf-arm-cmn-Streamline-node-iter=
ation.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/002=
9-perf-arm-cmn-Streamline-node-iteration.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0022-=
perf-arm-cmn-Streamline-node-iteration.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
30-drivers-perf-arm-cmn-Add-space-after.patch b/meta-arm-bsp/recipes-kern=
el/linux/linux-arm64-ack-5.10/tc/0023-drivers-perf-arm-cmn-Add-space-afte=
r.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/003=
0-drivers-perf-arm-cmn-Add-space-after.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0023-=
drivers-perf-arm-cmn-Add-space-after.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
31-perf-arm-cmn-Refactor-DTM-handling.patch b/meta-arm-bsp/recipes-kernel=
/linux/linux-arm64-ack-5.10/tc/0024-perf-arm-cmn-Refactor-DTM-handling.pa=
tch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/003=
1-perf-arm-cmn-Refactor-DTM-handling.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0024-=
perf-arm-cmn-Refactor-DTM-handling.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
32-perf-arm-cmn-Optimise-DTM-counter-reads.patch b/meta-arm-bsp/recipes-k=
ernel/linux/linux-arm64-ack-5.10/tc/0025-perf-arm-cmn-Optimise-DTM-counte=
r-reads.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/003=
2-perf-arm-cmn-Optimise-DTM-counter-reads.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0025-=
perf-arm-cmn-Optimise-DTM-counter-reads.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
33-perf-arm-cmn-Optimise-DTC-counter-accesses.patch b/meta-arm-bsp/recipe=
s-kernel/linux/linux-arm64-ack-5.10/tc/0026-perf-arm-cmn-Optimise-DTC-cou=
nter-accesses.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/003=
3-perf-arm-cmn-Optimise-DTC-counter-accesses.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0026-=
perf-arm-cmn-Optimise-DTC-counter-accesses.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
34-perf-arm-cmn-Move-group-validation-data-off-stack.patch b/meta-arm-bsp=
/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0027-perf-arm-cmn-Move-grou=
p-validation-data-off-stack.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/003=
4-perf-arm-cmn-Move-group-validation-data-off-stack.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0027-=
perf-arm-cmn-Move-group-validation-data-off-stack.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
35-perf-arm-cmn-Demarcate-CMN-600-specifics.patch b/meta-arm-bsp/recipes-=
kernel/linux/linux-arm64-ack-5.10/tc/0028-perf-arm-cmn-Demarcate-CMN-600-=
specifics.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/003=
5-perf-arm-cmn-Demarcate-CMN-600-specifics.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0028-=
perf-arm-cmn-Demarcate-CMN-600-specifics.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
36-perf-arm-cmn-Support-new-IP-features.patch b/meta-arm-bsp/recipes-kern=
el/linux/linux-arm64-ack-5.10/tc/0029-perf-arm-cmn-Support-new-IP-feature=
s.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/003=
6-perf-arm-cmn-Support-new-IP-features.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0029-=
perf-arm-cmn-Support-new-IP-features.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
37-perf-arm-cmn-Add-CI-700-Support.patch b/meta-arm-bsp/recipes-kernel/li=
nux/linux-arm64-ack-5.10/tc/0030-perf-arm-cmn-Add-CI-700-Support.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/003=
7-perf-arm-cmn-Add-CI-700-Support.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0030-=
perf-arm-cmn-Add-CI-700-Support.patch
--=20
2.30.2


