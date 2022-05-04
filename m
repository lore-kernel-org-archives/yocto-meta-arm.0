Return-Path: <arunachalam.ganapathy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E75C4167D
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 16:58:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.615.1651683514283639690
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 May 2022 09:58:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: arunachalam.ganapathy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA6151042;
	Wed,  4 May 2022 09:58:33 -0700 (PDT)
Received: from ts710.cambridge.arm.com (ts710.cambridge.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F27FE3FA27;
	Wed,  4 May 2022 09:58:32 -0700 (PDT)
From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH 06/10] arm-bsp/hafnium: TC: Support for trusty as a secure
 partition
Date: Wed,  4 May 2022 17:58:16 +0100
Message-Id: <20220504165820.882784-6-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504165820.882784-1-arunachalam.ganapathy@arm.com>
References: <20220504165820.882784-1-arunachalam.ganapathy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 May 2022 16:58:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3362

From: Ben Horgan <ben.horgan@arm.com>

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Change-Id: I2bbb77aa2f220f013cff53efe557df9960d237e3
---
 ...p-timer-register-accesses-using-cnth.patch | 252 ++++++++++++++
 ..._INTERRUPT-to-signal-an-interrupted-.patch | 152 +++++++++
 ..._SECONDARY_EP_REGISTER_64-to-list-of.patch |  28 ++
 ...interrupt-controller-register-access.patch | 159 +++++++++
 ...check-receiver-s-attributes-on-memor.patch | 318 ++++++++++++++++++
 .../tc/0006-tc-increase-heap-pages.patch      |  26 ++
 .../recipes-bsp/hafnium/hafnium-tc.inc        |   9 +
 7 files changed, 944 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-feat-e=
mulate-cntp-timer-register-accesses-using-cnth.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-fix-ff=
-a-Use-FFA_INTERRUPT-to-signal-an-interrupted-.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-fix-ff=
-a-Add-FFA_SECONDARY_EP_REGISTER_64-to-list-of.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc/0004-feat-e=
mulate-interrupt-controller-register-access.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc/0005-Revert=
-fix-ff-a-check-receiver-s-attributes-on-memor.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc/0006-tc-inc=
rease-heap-pages.patch

diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-feat-emulate-=
cntp-timer-register-accesses-using-cnth.patch b/meta-arm-bsp/recipes-bsp/=
hafnium/files/tc/0001-feat-emulate-cntp-timer-register-accesses-using-cnt=
h.patch
new file mode 100644
index 00000000..7094c8bc
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-feat-emulate-cntp-ti=
mer-register-accesses-using-cnth.patch
@@ -0,0 +1,252 @@
+From c8bd941579fb062359b683b184b851eea2ddb761 Mon Sep 17 00:00:00 2001
+From: Ben Horgan <ben.horgan@arm.com>
+Date: Fri, 4 Mar 2022 16:48:14 +0000
+Subject: [PATCH 1/5] feat: emulate cntp timer register accesses using cn=
thps
+
+Upstream-Status: Inappropriate [Experimental feature]
+Signed-off-by: Ben Horgan <ben.horgan@arm.com>
+Change-Id: I67508203273baf3bd8e6be2d99717028db945715
+---
+ Makefile                                |   3 +-
+ src/arch/aarch64/hypervisor/BUILD.gn    |   1 +
+ src/arch/aarch64/hypervisor/cpu.c       |  11 ++-
+ src/arch/aarch64/hypervisor/handler.c   |   6 ++
+ src/arch/aarch64/hypervisor/timer_el1.c | 104 ++++++++++++++++++++++++
+ src/arch/aarch64/hypervisor/timer_el1.h |  20 +++++
+ src/arch/aarch64/msr.h                  |   8 ++
+ 7 files changed, 150 insertions(+), 3 deletions(-)
+ create mode 100644 src/arch/aarch64/hypervisor/timer_el1.c
+ create mode 100644 src/arch/aarch64/hypervisor/timer_el1.h
+
+diff --git a/Makefile b/Makefile
+index c9fb16f..6371a8a 100644
+--- a/Makefile
++++ b/Makefile
+@@ -59,7 +59,8 @@ CHECKPATCH :=3D $(CURDIR)/third_party/linux/scripts/ch=
eckpatch.pl \
+ # debug_el1.c : uses XMACROS, which checkpatch doesn't understand.
+ # perfmon.c : uses XMACROS, which checkpatch doesn't understand.
+ # feature_id.c : uses XMACROS, which checkpatch doesn't understand.
+-CHECKPATCH_IGNORE :=3D "src/arch/aarch64/hypervisor/debug_el1.c\|src/ar=
ch/aarch64/hypervisor/perfmon.c\|src/arch/aarch64/hypervisor/feature_id.c=
"
++# timer_el1.c : uses XMACROS, which checkpatch doesn't understand.
++CHECKPATCH_IGNORE :=3D "src/arch/aarch64/hypervisor/debug_el1.c\|src/ar=
ch/aarch64/hypervisor/perfmon.c\|src/arch/aarch64/hypervisor/feature_id.c=
\|src/arch/aarch64/hypervisor/timer_el1.c"
+=20
+ OUT ?=3D out/$(PROJECT)
+ OUT_DIR =3D out/$(PROJECT)
+diff --git a/src/arch/aarch64/hypervisor/BUILD.gn b/src/arch/aarch64/hyp=
ervisor/BUILD.gn
+index 6068d1e..de1a414 100644
+--- a/src/arch/aarch64/hypervisor/BUILD.gn
++++ b/src/arch/aarch64/hypervisor/BUILD.gn
+@@ -45,6 +45,7 @@ source_set("hypervisor") {
+     "handler.c",
+     "perfmon.c",
+     "psci_handler.c",
++    "timer_el1.c",
+     "vm.c",
+   ]
+=20
+diff --git a/src/arch/aarch64/hypervisor/cpu.c b/src/arch/aarch64/hyperv=
isor/cpu.c
+index c6cebdd..cb41e6e 100644
+--- a/src/arch/aarch64/hypervisor/cpu.c
++++ b/src/arch/aarch64/hypervisor/cpu.c
+@@ -91,13 +91,20 @@ void arch_regs_reset(struct vcpu *vcpu)
+ 	if (is_primary) {
+ 		/*
+ 		 * cnthctl_el2 is redefined when VHE is enabled.
+-		 * EL1PCTEN, don't trap phys cnt access.
+-		 * EL1PCEN, don't trap phys timer access.
++		 * EL1PCTEN, don't trap phys cnt access. Except when in
++		 * secure world without vhe.
++		 * EL1PCEN, don't trap phys timer access. Except when in
++		 * secure world without vhe.
+ 		 */
+ 		if (has_vhe_support()) {
+ 			cnthctl |=3D (1U << 10) | (1U << 11);
+ 		} else {
++#if SECURE_WORLD =3D=3D 1
++			cnthctl &=3D ~(1U << 0);
++			cnthctl &=3D ~(1U << 1);
++#else
+ 			cnthctl |=3D (1U << 0) | (1U << 1);
++#endif
+ 		}
+ 	}
+=20
+diff --git a/src/arch/aarch64/hypervisor/handler.c b/src/arch/aarch64/hy=
pervisor/handler.c
+index cd64d68..c9068c5 100644
+--- a/src/arch/aarch64/hypervisor/handler.c
++++ b/src/arch/aarch64/hypervisor/handler.c
+@@ -34,6 +34,7 @@
+ #include "psci_handler.h"
+ #include "smc.h"
+ #include "sysregs.h"
++#include "timer_el1.h"
+=20
+ /**
+  * Hypervisor Fault Address Register Non-Secure.
+@@ -1276,6 +1277,11 @@ void handle_system_register_access(uintreg_t esr_=
el2)
+ 			inject_el1_unknown_exception(vcpu, esr_el2);
+ 			return;
+ 		}
++	} else if (timer_el1_is_register_access(esr_el2)) {
++		if (!timer_el1_process_access(vcpu, vm_id, esr_el2)) {
++			inject_el1_unknown_exception(vcpu, esr_el2);
++			return;
++		}
+ 	} else {
+ 		inject_el1_unknown_exception(vcpu, esr_el2);
+ 		return;
+diff --git a/src/arch/aarch64/hypervisor/timer_el1.c b/src/arch/aarch64/=
hypervisor/timer_el1.c
+new file mode 100644
+index 0000000..c30e554
+--- /dev/null
++++ b/src/arch/aarch64/hypervisor/timer_el1.c
+@@ -0,0 +1,104 @@
++/*
++ * Copyright 2022 The Hafnium Authors.
++ *
++ * Use of this source code is governed by a BSD-style
++ * license that can be found in the LICENSE file or at
++ * https://opensource.org/licenses/BSD-3-Clause.
++ */
++
++#include "timer_el1.h"
++
++#include "hf/dlog.h"
++
++#include "msr.h"
++#include "sysregs.h"
++
++/*
++ * Physical timer (CNTP) register encodings as defined in
++ * table D13-8 of the ARMv8 ARM (DDI0487F).
++ * TYPE, op0, op1, crn, crm, op2
++ * The register names are the concatenation of
++ * "CNTP_", TYPE and "_EL2".
++ */
++#define CNTP_REGISTERS          \
++	X(CTL,  3, 3, 14, 2, 1) \
++	X(CVAL, 3, 3, 14, 2, 2) \
++	X(TVAL, 3, 3, 14, 2, 0) \
++
++bool timer_el1_is_register_access(uintreg_t esr)
++{
++	uintreg_t sys_register =3D GET_ISS_SYSREG(esr);
++	bool is_timer_access;
++	switch (sys_register) {
++#define X(type, op0, op1, crn, crm, op2)                  \
++	case (GET_ISS_ENCODING(op0, op1, crn, crm, op2)): \
++		is_timer_access =3D true;                   \
++		break;
++			CNTP_REGISTERS
++#undef X
++	case (GET_ISS_ENCODING(3, 3, 14, 0, 1)):
++		is_timer_access =3D true;
++		break;
++	default:
++		is_timer_access =3D false;
++	}
++
++	return is_timer_access;
++}
++
++/* Accesses to CNTP timer emulated with CNTHPS */
++bool timer_el1_process_access(struct vcpu *vcpu, ffa_vm_id_t vm_id,
++			      uintreg_t esr)
++{
++	uintreg_t sys_register =3D GET_ISS_SYSREG(esr);
++	uintreg_t rt_register =3D GET_ISS_RT(esr);
++	uintreg_t value;
++
++	if (ISS_IS_READ(esr)) {
++		switch (sys_register) {
++#define X(type, op0, op1, crn, crm, op2)                           \
++		case (GET_ISS_ENCODING(op0, op1, crn, crm, op2)):  \
++			value =3D read_msr(MSR_CNTHPS_##type##_EL2); \
++			vcpu->regs.r[rt_register] =3D value;         \
++			break;
++				CNTP_REGISTERS
++#undef X
++		case (GET_ISS_ENCODING(3, 3, 14, 0, 1)):
++			value =3D read_msr(cntpct_el0);
++			vcpu->regs.r[rt_register] =3D value;
++			break;
++		default:
++			dlog_notice(
++				"Unsupported timer register "
++				"read: "
++				"op0=3D%d, op1=3D%d, crn=3D%d, crm=3D%d, op2=3D%d, "
++				"rt=3D%d.\n",
++				GET_ISS_OP0(esr), GET_ISS_OP1(esr),
++				GET_ISS_CRN(esr), GET_ISS_CRM(esr),
++				GET_ISS_OP2(esr), GET_ISS_RT(esr));
++			break;
++		}
++	} else {
++		value =3D vcpu->regs.r[rt_register];
++		switch (sys_register) {
++#define X(type, op0, op1, crn, crm, op2)                           \
++		case (GET_ISS_ENCODING(op0, op1, crn, crm, op2)):  \
++			write_msr(MSR_CNTHPS_##type##_EL2, value); \
++			break;
++				CNTP_REGISTERS
++#undef X
++		default:
++			dlog_notice(
++				"Unsupported timer register "
++				"write: "
++				"op0=3D%d, op1=3D%d, crn=3D%d, crm=3D%d, op2=3D%d, "
++				"rt=3D%d, value=3D%d.\n",
++				GET_ISS_OP0(esr), GET_ISS_OP1(esr),
++				GET_ISS_CRN(esr), GET_ISS_CRM(esr),
++				GET_ISS_OP2(esr), GET_ISS_RT(esr), value);
++			break;
++		}
++	}
++
++	return true;
++}
+diff --git a/src/arch/aarch64/hypervisor/timer_el1.h b/src/arch/aarch64/=
hypervisor/timer_el1.h
+new file mode 100644
+index 0000000..04a43b6
+--- /dev/null
++++ b/src/arch/aarch64/hypervisor/timer_el1.h
+@@ -0,0 +1,20 @@
++/*
++ * Copyright 2022 The Hafnium Authors.
++ *
++ * Use of this source code is governed by a BSD-style
++ * license that can be found in the LICENSE file or at
++ * https://opensource.org/licenses/BSD-3-Clause.
++ */
++
++#pragma once
++
++#include "hf/arch/types.h"
++
++#include "hf/cpu.h"
++
++#include "vmapi/hf/ffa.h"
++
++bool timer_el1_is_register_access(uintreg_t esr);
++
++bool timer_el1_process_access(struct vcpu *vcpu, ffa_vm_id_t vm_id,
++			      uintreg_t esr);
+diff --git a/src/arch/aarch64/msr.h b/src/arch/aarch64/msr.h
+index cd6778b..55e7833 100644
+--- a/src/arch/aarch64/msr.h
++++ b/src/arch/aarch64/msr.h
+@@ -126,3 +126,11 @@
+ #define MSR_ELR_EL12 S3_5_C4_C0_1
+=20
+ #endif
++
++/*
++ * Secure EL2 Physical timer (CNTHPS) register encodings as defined in
++ * table D13-8 of the ARMv8 ARM (DDI0487F).
++ */
++#define MSR_CNTHPS_CTL_EL2 S3_4_C14_C5_1
++#define MSR_CNTHPS_CVAL_EL2 S3_4_C14_C5_2
++#define MSR_CNTHPS_TVAL_EL2 S3_4_C14_C5_0
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-fix-ff-a-Use-=
FFA_INTERRUPT-to-signal-an-interrupted-.patch b/meta-arm-bsp/recipes-bsp/=
hafnium/files/tc/0002-fix-ff-a-Use-FFA_INTERRUPT-to-signal-an-interrupted=
-.patch
new file mode 100644
index 00000000..2b57b239
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-fix-ff-a-Use-FFA_INT=
ERRUPT-to-signal-an-interrupted-.patch
@@ -0,0 +1,152 @@
+From e6bcc390749f0560b3bc92507ecbaaabc7145200 Mon Sep 17 00:00:00 2001
+From: Lucian Paul-Trifu <lucian.paul-trifu@arm.com>
+Date: Wed, 10 Mar 2021 11:31:02 +0000
+Subject: [PATCH 2/5] fix(ff-a): Use FFA_INTERRUPT to signal an interrupt=
ed
+ FFA_MSG_WAIT
+
+Rather than FFA_ERROR(INTERRUPTED).
+
+Change-Id: I6b23a442714852b6183e0e46af6f0504ec0ee8f4
+Signed-off-by: Ben Horgan <ben.horgan@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ src/api.c                                                  | 2 +-
+ test/inc/test/vmapi/ffa.h                                  | 7 +++++++
+ test/vmapi/arch/aarch64/gicv3/services/common.c            | 3 +--
+ test/vmapi/arch/aarch64/gicv3/services/timer.c             | 2 +-
+ test/vmapi/el0_partitions/services/interruptible.c         | 3 +--
+ test/vmapi/el0_partitions/services/interruptible_echo.c    | 3 +--
+ test/vmapi/el0_partitions/services/receive_block.c         | 2 +-
+ .../primary_with_secondaries/services/interruptible.c      | 3 +--
+ .../primary_with_secondaries/services/receive_block.c      | 2 +-
+ 9 files changed, 15 insertions(+), 12 deletions(-)
+
+diff --git a/src/api.c b/src/api.c
+index b713b7c..00c4d44 100644
+--- a/src/api.c
++++ b/src/api.c
+@@ -1588,7 +1588,7 @@ struct ffa_value api_ffa_msg_recv(bool block, stru=
ct vcpu *current,
+ 	 * received. If a message is received the return value will be set at
+ 	 * that time to FFA_SUCCESS.
+ 	 */
+-	return_code =3D ffa_error(FFA_INTERRUPTED);
++	return_code =3D (struct ffa_value){.func =3D FFA_INTERRUPT_32};
+ 	if (api_ffa_msg_recv_block_interrupted(current)) {
+ 		goto out;
+ 	}
+diff --git a/test/inc/test/vmapi/ffa.h b/test/inc/test/vmapi/ffa.h
+index 8fc1223..f0f3e75 100644
+--- a/test/inc/test/vmapi/ffa.h
++++ b/test/inc/test/vmapi/ffa.h
+@@ -24,6 +24,13 @@
+ 		EXPECT_EQ(ffa_error_code(v), (ffa_error)); \
+ 	} while (0)
+=20
++#define EXPECT_FFA_INTERRUPT(value)                        \
++	do {                                               \
++		struct ffa_value v =3D (value);              \
++		EXPECT_EQ(v.func, FFA_INTERRUPT_32);       \
++	} while (0)
++
++
+ /*
+  * The bit 15 of the FF-A ID indicates whether the partition is executi=
ng
+  * in the normal world, in case it is a Virtual Machine (VM); or in the
+diff --git a/test/vmapi/arch/aarch64/gicv3/services/common.c b/test/vmap=
i/arch/aarch64/gicv3/services/common.c
+index 06df28d..4ada9e2 100644
+--- a/test/vmapi/arch/aarch64/gicv3/services/common.c
++++ b/test/vmapi/arch/aarch64/gicv3/services/common.c
+@@ -22,8 +22,7 @@ struct ffa_value mailbox_receive_retry(void)
+=20
+ 	do {
+ 		received =3D ffa_msg_wait();
+-	} while (received.func =3D=3D FFA_ERROR_32 &&
+-		 received.arg2 =3D=3D FFA_INTERRUPTED);
++	} while (received.func =3D=3D FFA_INTERRUPT_32);
+=20
+ 	return received;
+ }
+diff --git a/test/vmapi/arch/aarch64/gicv3/services/timer.c b/test/vmapi=
/arch/aarch64/gicv3/services/timer.c
+index 156f160..d5d2816 100644
+--- a/test/vmapi/arch/aarch64/gicv3/services/timer.c
++++ b/test/vmapi/arch/aarch64/gicv3/services/timer.c
+@@ -104,7 +104,7 @@ TEST_SERVICE(timer)
+ 		} else if (receive) {
+ 			struct ffa_value res =3D ffa_msg_wait();
+=20
+-			EXPECT_FFA_ERROR(res, FFA_INTERRUPTED);
++			EXPECT_FFA_INTERRUPT(res);
+ 		} else {
+ 			/* Busy wait until the timer fires. */
+ 			while (!timer_fired) {
+diff --git a/test/vmapi/el0_partitions/services/interruptible.c b/test/v=
mapi/el0_partitions/services/interruptible.c
+index 0d00b16..4c9f099 100644
+--- a/test/vmapi/el0_partitions/services/interruptible.c
++++ b/test/vmapi/el0_partitions/services/interruptible.c
+@@ -50,8 +50,7 @@ static struct ffa_value mailbox_receive_retry()
+ 	do {
+ 		irq();
+ 		received =3D ffa_msg_wait();
+-	} while (received.func =3D=3D FFA_ERROR_32 &&
+-		 ffa_error_code(received) =3D=3D FFA_INTERRUPTED);
++	} while (received.func =3D=3D FFA_INTERRUPT_32);
+=20
+ 	return received;
+ }
+diff --git a/test/vmapi/el0_partitions/services/interruptible_echo.c b/t=
est/vmapi/el0_partitions/services/interruptible_echo.c
+index b618cf2..a857783 100644
+--- a/test/vmapi/el0_partitions/services/interruptible_echo.c
++++ b/test/vmapi/el0_partitions/services/interruptible_echo.c
+@@ -39,8 +39,7 @@ static struct ffa_value mailbox_receive_retry()
+ 	do {
+ 		irq();
+ 		received =3D ffa_msg_wait();
+-	} while (received.func =3D=3D FFA_ERROR_32 &&
+-		 received.arg2 =3D=3D FFA_INTERRUPTED);
++	} while (received.func =3D=3D FFA_INTERRUPT_32);
+=20
+ 	return received;
+ }
+diff --git a/test/vmapi/el0_partitions/services/receive_block.c b/test/v=
mapi/el0_partitions/services/receive_block.c
+index 05a22f3..60da28b 100644
+--- a/test/vmapi/el0_partitions/services/receive_block.c
++++ b/test/vmapi/el0_partitions/services/receive_block.c
+@@ -27,7 +27,7 @@ TEST_SERVICE(receive_block)
+=20
+ 	for (i =3D 0; i < 10; ++i) {
+ 		struct ffa_value res =3D ffa_msg_wait();
+-		EXPECT_FFA_ERROR(res, FFA_INTERRUPTED);
++		EXPECT_FFA_INTERRUPT(res);
+ 	}
+=20
+ 	memcpy_s(SERVICE_SEND_BUFFER(), FFA_MSG_PAYLOAD_MAX, message,
+diff --git a/test/vmapi/primary_with_secondaries/services/interruptible.=
c b/test/vmapi/primary_with_secondaries/services/interruptible.c
+index cc1c1f9..005d1ff 100644
+--- a/test/vmapi/primary_with_secondaries/services/interruptible.c
++++ b/test/vmapi/primary_with_secondaries/services/interruptible.c
+@@ -46,8 +46,7 @@ struct ffa_value mailbox_receive_retry()
+=20
+ 	do {
+ 		received =3D ffa_msg_wait();
+-	} while (received.func =3D=3D FFA_ERROR_32 &&
+-		 ffa_error_code(received) =3D=3D FFA_INTERRUPTED);
++	} while (received.func =3D=3D FFA_INTERRUPT_32);
+=20
+ 	return received;
+ }
+diff --git a/test/vmapi/primary_with_secondaries/services/receive_block.=
c b/test/vmapi/primary_with_secondaries/services/receive_block.c
+index edb4e3c..a6805ae 100644
+--- a/test/vmapi/primary_with_secondaries/services/receive_block.c
++++ b/test/vmapi/primary_with_secondaries/services/receive_block.c
+@@ -40,7 +40,7 @@ TEST_SERVICE(receive_block)
+=20
+ 	for (i =3D 0; i < 10; ++i) {
+ 		struct ffa_value res =3D ffa_msg_wait();
+-		EXPECT_FFA_ERROR(res, FFA_INTERRUPTED);
++		EXPECT_FFA_INTERRUPT(res);
+ 	}
+=20
+ 	memcpy_s(SERVICE_SEND_BUFFER(), FFA_MSG_PAYLOAD_MAX, message,
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-fix-ff-a-Add-=
FFA_SECONDARY_EP_REGISTER_64-to-list-of.patch b/meta-arm-bsp/recipes-bsp/=
hafnium/files/tc/0003-fix-ff-a-Add-FFA_SECONDARY_EP_REGISTER_64-to-list-o=
f.patch
new file mode 100644
index 00000000..8d2cc139
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-fix-ff-a-Add-FFA_SEC=
ONDARY_EP_REGISTER_64-to-list-of.patch
@@ -0,0 +1,28 @@
+From a6f466c2594b2f56d34fee72494fbd29ea9c7d21 Mon Sep 17 00:00:00 2001
+From: Ben Horgan <ben.horgan@arm.com>
+Date: Tue, 26 Apr 2022 12:59:42 +0000
+Subject: [PATCH 3/5] fix(ff-a): Add FFA_SECONDARY_EP_REGISTER_64 to list=
 of
+ features
+
+Signed-off-by: Ben Horgan <ben.horgan@arm.com>
+Change-Id: Ic1344eb2c982c195210dc2c86aa6845f3e037077
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ src/api.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/api.c b/src/api.c
+index 00c4d44..33a9b42 100644
+--- a/src/api.c
++++ b/src/api.c
+@@ -2021,6 +2021,7 @@ struct ffa_value api_ffa_features(uint32_t feature=
_function_id)
+ 	case FFA_MEM_PERM_SET_32:
+ 	case FFA_MEM_PERM_GET_64:
+ 	case FFA_MEM_PERM_SET_64:
++	case FFA_SECONDARY_EP_REGISTER_64:
+ #endif
+ 		return (struct ffa_value){.func =3D FFA_SUCCESS_32};
+=20
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0004-feat-emulate-=
interrupt-controller-register-access.patch b/meta-arm-bsp/recipes-bsp/haf=
nium/files/tc/0004-feat-emulate-interrupt-controller-register-access.patc=
h
new file mode 100644
index 00000000..95f1651a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0004-feat-emulate-interru=
pt-controller-register-access.patch
@@ -0,0 +1,159 @@
+From 380f2cf944dd5db36c168a11d31a46ad14cdcb6d Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Tue, 26 Apr 2022 14:43:58 +0100
+Subject: [PATCH 4/5] feat: emulate interrupt controller register access
+
+This emulates ICC_SGI1R_EL1 and ICC_IGRPEN1_EL1 register
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: I0c11f034f3676067597461a183a341c809adcaa4
+Upstream-Status: Inappropriate [Experimental feature]
+---
+ src/arch/aarch64/hypervisor/handler.c |  5 ++
+ src/arch/aarch64/hypervisor/perfmon.c | 84 +++++++++++++++++++++++++++
+ src/arch/aarch64/hypervisor/perfmon.h |  5 ++
+ src/arch/aarch64/msr.h                |  3 +
+ 4 files changed, 97 insertions(+)
+
+diff --git a/src/arch/aarch64/hypervisor/handler.c b/src/arch/aarch64/hy=
pervisor/handler.c
+index c9068c5..b9aa5d8 100644
+--- a/src/arch/aarch64/hypervisor/handler.c
++++ b/src/arch/aarch64/hypervisor/handler.c
+@@ -1282,6 +1282,11 @@ void handle_system_register_access(uintreg_t esr_=
el2)
+ 			inject_el1_unknown_exception(vcpu, esr_el2);
+ 			return;
+ 		}
++	} else if (intr_ctrl_is_register_access(esr_el2)) {
++		if (!intr_ctrl_el1_process_access(vcpu, vm_id, esr_el2)) {
++			inject_el1_unknown_exception(vcpu, esr_el2);
++			return;
++		}
+ 	} else {
+ 		inject_el1_unknown_exception(vcpu, esr_el2);
+ 		return;
+diff --git a/src/arch/aarch64/hypervisor/perfmon.c b/src/arch/aarch64/hy=
pervisor/perfmon.c
+index f13b035..05e216c 100644
+--- a/src/arch/aarch64/hypervisor/perfmon.c
++++ b/src/arch/aarch64/hypervisor/perfmon.c
+@@ -116,6 +116,10 @@
+ 	X(PMEVTYPER30_EL0   , 3, 3, 14, 15, 6) \
+ 	X(PMCCFILTR_EL0     , 3, 3, 14, 15, 7)
+=20
++#define INTR_CTRL_REGISTERS                    \
++	X(ICC_IGRPEN1_EL1   , 3, 0, 12, 12, 7) \
++	X(ICC_SGI1R_EL1     , 3, 0, 12, 11, 5) \
++
+ /* clang-format on */
+=20
+ /**
+@@ -232,3 +236,83 @@ uintreg_t perfmon_get_pmccfiltr_el0_init_value(ffa_=
vm_id_t vm_id)
+=20
+ 	return 0;
+ }
++
++bool intr_ctrl_is_register_access(uintreg_t esr)
++{
++	uintreg_t op0 =3D GET_ISS_OP0(esr);
++	uintreg_t op1 =3D GET_ISS_OP1(esr);
++	uintreg_t crn =3D GET_ISS_CRN(esr);
++	uintreg_t crm =3D GET_ISS_CRM(esr);
++
++	if (op0 =3D=3D 3 && op1 =3D=3D 0 && crn =3D=3D 12 && crm =3D=3D 12) {
++		return true;
++	}
++
++	if (op0 =3D=3D 3 && op1 =3D=3D 0 && crn =3D=3D 12 && crm =3D=3D 11) {
++		return true;
++	}
++
++	return false;
++}
++
++bool intr_ctrl_el1_process_access(struct vcpu *vcpu, ffa_vm_id_t vm_id,
++				  uintreg_t esr)
++{
++	uintreg_t sys_register =3D GET_ISS_SYSREG(esr);
++	uintreg_t rt_register =3D GET_ISS_RT(esr);
++	uintreg_t value;
++
++	/* +1 because Rt can access register XZR */
++	CHECK(rt_register < NUM_GP_REGS + 1);
++
++	if (ISS_IS_READ(esr)) {
++		switch (sys_register) {
++#define X(reg_name, op0, op1, crn, crm, op2)              \
++	case (GET_ISS_ENCODING(op0, op1, crn, crm, op2)): \
++		value =3D read_msr(reg_name);               \
++		break;
++			INTR_CTRL_REGISTERS
++#undef X
++		default:
++			value =3D vcpu->regs.r[rt_register];
++			dlog_notice(
++				"Unsupported interrupt control register "
++				"read: "
++				"op0=3D%d, op1=3D%d, crn=3D%d, crm=3D%d, op2=3D%d, "
++				"rt=3D%d.\n",
++				GET_ISS_OP0(esr), GET_ISS_OP1(esr),
++				GET_ISS_CRN(esr), GET_ISS_CRM(esr),
++				GET_ISS_OP2(esr), GET_ISS_RT(esr));
++			break;
++		}
++		if (rt_register !=3D RT_REG_XZR) {
++			vcpu->regs.r[rt_register] =3D value;
++		}
++	} else {
++		if (rt_register !=3D RT_REG_XZR) {
++			value =3D vcpu->regs.r[rt_register];
++		} else {
++			value =3D 0;
++		}
++		switch (sys_register) {
++#define X(reg_name, op0, op1, crn, crm, op2)              \
++	case (GET_ISS_ENCODING(op0, op1, crn, crm, op2)): \
++		write_msr(reg_name, value);               \
++		break;
++			INTR_CTRL_REGISTERS
++#undef X
++		default:
++			dlog_notice(
++				"Unsupported interrupt control register "
++				"write: "
++				"op0=3D%d, op1=3D%d, crn=3D%d, crm=3D%d, op2=3D%d, "
++				"rt=3D%d.\n",
++				GET_ISS_OP0(esr), GET_ISS_OP1(esr),
++				GET_ISS_CRN(esr), GET_ISS_CRM(esr),
++				GET_ISS_OP2(esr), GET_ISS_RT(esr));
++			break;
++		}
++	}
++
++	return true;
++}
+diff --git a/src/arch/aarch64/hypervisor/perfmon.h b/src/arch/aarch64/hy=
pervisor/perfmon.h
+index 81669ba..c90d45b 100644
+--- a/src/arch/aarch64/hypervisor/perfmon.h
++++ b/src/arch/aarch64/hypervisor/perfmon.h
+@@ -70,3 +70,8 @@ bool perfmon_process_access(struct vcpu *vcpu, ffa_vm_=
id_t vm_id,
+ 			    uintreg_t esr_el2);
+=20
+ uintreg_t perfmon_get_pmccfiltr_el0_init_value(ffa_vm_id_t vm_id);
++
++bool intr_ctrl_is_register_access(uintreg_t esr);
++
++bool intr_ctrl_el1_process_access(struct vcpu *vcpu, ffa_vm_id_t vm_id,
++				  uintreg_t esr);
+diff --git a/src/arch/aarch64/msr.h b/src/arch/aarch64/msr.h
+index 55e7833..82aa884 100644
+--- a/src/arch/aarch64/msr.h
++++ b/src/arch/aarch64/msr.h
+@@ -134,3 +134,6 @@
+ #define MSR_CNTHPS_CTL_EL2 S3_4_C14_C5_1
+ #define MSR_CNTHPS_CVAL_EL2 S3_4_C14_C5_2
+ #define MSR_CNTHPS_TVAL_EL2 S3_4_C14_C5_0
++
++#define ICC_IGRPEN1_EL1 S3_0_C12_C12_7
++#define ICC_SGI1R_EL1 S3_0_C12_C11_5
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0005-Revert-fix-ff=
-a-check-receiver-s-attributes-on-memor.patch b/meta-arm-bsp/recipes-bsp/=
hafnium/files/tc/0005-Revert-fix-ff-a-check-receiver-s-attributes-on-memo=
r.patch
new file mode 100644
index 00000000..e5f9489e
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0005-Revert-fix-ff-a-chec=
k-receiver-s-attributes-on-memor.patch
@@ -0,0 +1,318 @@
+From 64d5628c8439e4649e9c1da9b9e02ebd5c7fb8cf Mon Sep 17 00:00:00 2001
+From: Ben Horgan <ben.horgan@arm.com>
+Date: Thu, 28 Apr 2022 15:53:31 +0000
+Subject: [PATCH 5/5] Revert "fix(ff-a): check receiver's attributes on m=
emory
+ retrieve"
+
+This reverts commit a98603aa965e3ff3ca5383249213e2fd1a96d850.
+
+Change-Id: Ia71ce3ac52e9b2e85578372c24eb8d593b62435f
+Signed-off-by: Ben Horgan <ben.horgan@arm.com>
+---
+ src/ffa_memory.c                              | 76 ++++++-----------
+ test/vmapi/el0_partitions/memory_sharing.c    | 81 -------------------
+ .../primary_with_secondaries/memory_sharing.c | 81 -------------------
+ 3 files changed, 25 insertions(+), 213 deletions(-)
+
+diff --git a/src/ffa_memory.c b/src/ffa_memory.c
+index ab47929..2fcc386 100644
+--- a/src/ffa_memory.c
++++ b/src/ffa_memory.c
+@@ -1344,42 +1344,6 @@ static struct ffa_value ffa_memory_send_complete(
+ 	return ffa_mem_success(share_state->memory_region->handle);
+ }
+=20
+-/**
+- * Check that the memory attributes match Hafnium expectations:
+- * Normal Memory, Inner shareable, Write-Back Read-Allocate
+- * Write-Allocate Cacheable.
+- */
+-static struct ffa_value ffa_memory_attributes_validate(
+-	ffa_memory_access_permissions_t attributes)
+-{
+-	enum ffa_memory_type memory_type;
+-	enum ffa_memory_cacheability cacheability;
+-	enum ffa_memory_shareability shareability;
+-
+-	memory_type =3D ffa_get_memory_type_attr(attributes);
+-	if (memory_type !=3D FFA_MEMORY_NORMAL_MEM) {
+-		dlog_verbose("Invalid memory type %#x, expected %#x.\n",
+-			     memory_type, FFA_MEMORY_NORMAL_MEM);
+-		return ffa_error(FFA_DENIED);
+-	}
+-
+-	cacheability =3D ffa_get_memory_cacheability_attr(attributes);
+-	if (cacheability !=3D FFA_MEMORY_CACHE_WRITE_BACK) {
+-		dlog_verbose("Invalid cacheability %#x, expected %#x.\n",
+-			     cacheability, FFA_MEMORY_CACHE_WRITE_BACK);
+-		return ffa_error(FFA_DENIED);
+-	}
+-
+-	shareability =3D ffa_get_memory_shareability_attr(attributes);
+-	if (shareability !=3D FFA_MEMORY_INNER_SHAREABLE) {
+-		dlog_verbose("Invalid shareability %#x, expected #%x.\n",
+-			     shareability, FFA_MEMORY_INNER_SHAREABLE);
+-		return ffa_error(FFA_DENIED);
+-	}
+-
+-	return (struct ffa_value){.func =3D FFA_SUCCESS_32};
+-}
+-
+ /**
+  * Check that the given `memory_region` represents a valid memory send =
request
+  * of the given `share_func` type, return the clear flag and permission=
s via the
+@@ -1400,7 +1364,10 @@ static struct ffa_value ffa_memory_send_validate(
+ 	uint32_t constituents_length;
+ 	enum ffa_data_access data_access;
+ 	enum ffa_instruction_access instruction_access;
+-	struct ffa_value ret;
++	ffa_memory_access_permissions_t attributes;
++	enum ffa_memory_type memory_type;
++	enum ffa_memory_cacheability memory_cacheability;
++	enum ffa_memory_shareability memory_shareability;
+=20
+ 	assert(permissions !=3D NULL);
+=20
+@@ -1536,9 +1503,26 @@ static struct ffa_value ffa_memory_send_validate(
+ 	 * Normal Memory, Inner shareable, Write-Back Read-Allocate
+ 	 * Write-Allocate Cacheable.
+ 	 */
+-	ret =3D ffa_memory_attributes_validate(memory_region->attributes);
+-	if (ret.func !=3D FFA_SUCCESS_32) {
+-		return ret;
++	attributes =3D memory_region->attributes;
++	memory_type =3D ffa_get_memory_type_attr(attributes);
++	if (memory_type !=3D FFA_MEMORY_NORMAL_MEM) {
++		dlog_verbose("Invalid memory type %#x, expected %#x.\n",
++			     memory_type, FFA_MEMORY_NORMAL_MEM);
++		return ffa_error(FFA_INVALID_PARAMETERS);
++	}
++
++	memory_cacheability =3D ffa_get_memory_cacheability_attr(attributes);
++	if (memory_cacheability !=3D FFA_MEMORY_CACHE_WRITE_BACK) {
++		dlog_verbose("Invalid cacheability %#x, expected %#x.\n",
++			     memory_cacheability, FFA_MEMORY_CACHE_WRITE_BACK);
++		return ffa_error(FFA_INVALID_PARAMETERS);
++	}
++
++	memory_shareability =3D ffa_get_memory_shareability_attr(attributes);
++	if (memory_shareability !=3D FFA_MEMORY_INNER_SHAREABLE) {
++		dlog_verbose("Invalid shareability %#x, expected %#x.\n",
++			     memory_shareability, FFA_MEMORY_INNER_SHAREABLE);
++		return ffa_error(FFA_INVALID_PARAMETERS);
+ 	}
+=20
+ 	return (struct ffa_value){.func =3D FFA_SUCCESS_32};
+@@ -2376,6 +2360,7 @@ struct ffa_value ffa_memory_retrieve(struct vm_loc=
ked to_locked,
+ 	 * Check permissions from sender against permissions requested by
+ 	 * receiver.
+ 	 */
++	/* TODO: Check attributes too. */
+ 	sent_permissions =3D
+ 		memory_region->receivers[0].receiver_permissions.permissions;
+ 	sent_data_access =3D ffa_get_data_access_attr(sent_permissions);
+@@ -2453,17 +2438,6 @@ struct ffa_value ffa_memory_retrieve(struct vm_lo=
cked to_locked,
+ 		panic("Got unexpected FFA_INSTRUCTION_ACCESS_RESERVED. Should "
+ 		      "be checked before this point.");
+ 	}
+-
+-	/*
+-	 * Ensure receiver's attributes are compatible with how Hafnium maps
+-	 * memory: Normal Memory, Inner shareable, Write-Back Read-Allocate
+-	 * Write-Allocate Cacheable.
+-	 */
+-	ret =3D ffa_memory_attributes_validate(retrieve_request->attributes);
+-	if (ret.func !=3D FFA_SUCCESS_32) {
+-		goto out;
+-	}
+-
+ 	memory_to_attributes =3D ffa_memory_permissions_to_mode(
+ 		permissions, share_state->sender_orig_mode);
+ 	ret =3D ffa_retrieve_check_update(
+diff --git a/test/vmapi/el0_partitions/memory_sharing.c b/test/vmapi/el0=
_partitions/memory_sharing.c
+index 3756d7d..c29f029 100644
+--- a/test/vmapi/el0_partitions/memory_sharing.c
++++ b/test/vmapi/el0_partitions/memory_sharing.c
+@@ -2160,87 +2160,6 @@ TEST(memory_sharing, ffa_validate_retrieve_req_mb=
z)
+ 	}
+ }
+=20
+-/**
+- * Memory can't be shared with arbitrary attributes because Hafnium map=
s pages
+- * with hardcoded values and doesn't support custom mappings.
+- */
+-TEST(memory_sharing, ffa_validate_retrieve_req_attributes)
+-{
+-	struct ffa_value ret;
+-	struct mailbox_buffers mb =3D set_up_mailbox();
+-	uint32_t msg_size;
+-	ffa_memory_handle_t handle;
+-
+-	struct ffa_value (*send_function[])(uint32_t, uint32_t) =3D {
+-		ffa_mem_share,
+-		ffa_mem_lend,
+-	};
+-
+-	struct ffa_memory_region_constituent constituents[] =3D {
+-		{.address =3D (uint64_t)pages, .page_count =3D 2},
+-		{.address =3D (uint64_t)pages + PAGE_SIZE * 3, .page_count =3D 1},
+-	};
+-
+-	SERVICE_SELECT(SERVICE_VM1, "ffa_memory_share_fail", mb.send);
+-
+-	struct {
+-		enum ffa_memory_type memory_type;
+-		enum ffa_memory_cacheability memory_cacheability;
+-		enum ffa_memory_shareability memory_shareability;
+-	} invalid_attributes[] =3D {
+-		/* Invalid memory type */
+-		{FFA_MEMORY_DEVICE_MEM, FFA_MEMORY_CACHE_WRITE_BACK,
+-		 FFA_MEMORY_INNER_SHAREABLE},
+-		/* Invalid cacheability */
+-		{FFA_MEMORY_NORMAL_MEM, FFA_MEMORY_CACHE_NON_CACHEABLE,
+-		 FFA_MEMORY_INNER_SHAREABLE},
+-		/* Invalid shareability */
+-		{FFA_MEMORY_NORMAL_MEM, FFA_MEMORY_CACHE_WRITE_BACK,
+-		 FFA_MEMORY_SHARE_NON_SHAREABLE},
+-		{FFA_MEMORY_NORMAL_MEM, FFA_MEMORY_CACHE_WRITE_BACK,
+-		 FFA_MEMORY_OUTER_SHAREABLE}};
+-
+-	for (uint32_t i =3D 0; i < ARRAY_SIZE(send_function); i++) {
+-		/* Prepare memory region, and set all flags */
+-		EXPECT_EQ(ffa_memory_region_init(
+-				  mb.send, HF_MAILBOX_SIZE, HF_PRIMARY_VM_ID,
+-				  SERVICE_VM1, constituents,
+-				  ARRAY_SIZE(constituents), 0, 0,
+-				  FFA_DATA_ACCESS_RW,
+-				  FFA_INSTRUCTION_ACCESS_NOT_SPECIFIED,
+-				  FFA_MEMORY_NORMAL_MEM,
+-				  FFA_MEMORY_CACHE_WRITE_BACK,
+-				  FFA_MEMORY_INNER_SHAREABLE, NULL, &msg_size),
+-			  0);
+-
+-		ret =3D send_function[i](msg_size, msg_size);
+-		EXPECT_EQ(ret.func, FFA_SUCCESS_32);
+-
+-		handle =3D ffa_mem_success_handle(ret);
+-
+-		for (uint32_t j =3D 0; j < ARRAY_SIZE(invalid_attributes); ++j) {
+-			msg_size =3D ffa_memory_retrieve_request_init(
+-				mb.send, handle, HF_PRIMARY_VM_ID, SERVICE_VM1,
+-				0, 0, FFA_DATA_ACCESS_RW,
+-				FFA_INSTRUCTION_ACCESS_NOT_SPECIFIED,
+-				invalid_attributes[j].memory_type,
+-				invalid_attributes[j].memory_cacheability,
+-				invalid_attributes[j].memory_shareability);
+-
+-			EXPECT_LE(msg_size, HF_MAILBOX_SIZE);
+-
+-			EXPECT_EQ(ffa_msg_send(HF_PRIMARY_VM_ID, SERVICE_VM1,
+-					       msg_size, 0)
+-					  .func,
+-				  FFA_SUCCESS_32);
+-
+-			ffa_run(SERVICE_VM1, 0);
+-		}
+-
+-		EXPECT_EQ(ffa_mem_reclaim(handle, 0).func, FFA_SUCCESS_32);
+-	}
+-}
+-
+ /**
+  * If memory is shared can't request zeroing of memory at both send and
+  * relinquish.
+diff --git a/test/vmapi/primary_with_secondaries/memory_sharing.c b/test=
/vmapi/primary_with_secondaries/memory_sharing.c
+index 6080709..4bcf252 100644
+--- a/test/vmapi/primary_with_secondaries/memory_sharing.c
++++ b/test/vmapi/primary_with_secondaries/memory_sharing.c
+@@ -2307,87 +2307,6 @@ TEST(memory_sharing, ffa_validate_retrieve_req_mb=
z)
+ 	}
+ }
+=20
+-/**
+- * Memory can't be shared with arbitrary attributes because Hafnium map=
s pages
+- * with hardcoded values and doesn't support custom mappings.
+- */
+-TEST(memory_sharing, ffa_validate_retrieve_req_attributes)
+-{
+-	struct ffa_value ret;
+-	struct mailbox_buffers mb =3D set_up_mailbox();
+-	uint32_t msg_size;
+-	ffa_memory_handle_t handle;
+-
+-	struct ffa_value (*send_function[])(uint32_t, uint32_t) =3D {
+-		ffa_mem_share,
+-		ffa_mem_lend,
+-	};
+-
+-	struct ffa_memory_region_constituent constituents[] =3D {
+-		{.address =3D (uint64_t)pages, .page_count =3D 2},
+-		{.address =3D (uint64_t)pages + PAGE_SIZE * 3, .page_count =3D 1},
+-	};
+-
+-	SERVICE_SELECT(SERVICE_VM1, "ffa_memory_share_fail_denied", mb.send);
+-
+-	struct {
+-		enum ffa_memory_type memory_type;
+-		enum ffa_memory_cacheability memory_cacheability;
+-		enum ffa_memory_shareability memory_shareability;
+-	} invalid_attributes[] =3D {
+-		/* Invalid memory type */
+-		{FFA_MEMORY_DEVICE_MEM, FFA_MEMORY_CACHE_WRITE_BACK,
+-		 FFA_MEMORY_INNER_SHAREABLE},
+-		/* Invalid cacheability */
+-		{FFA_MEMORY_NORMAL_MEM, FFA_MEMORY_CACHE_NON_CACHEABLE,
+-		 FFA_MEMORY_INNER_SHAREABLE},
+-		/* Invalid shareability */
+-		{FFA_MEMORY_NORMAL_MEM, FFA_MEMORY_CACHE_WRITE_BACK,
+-		 FFA_MEMORY_SHARE_NON_SHAREABLE},
+-		{FFA_MEMORY_NORMAL_MEM, FFA_MEMORY_CACHE_WRITE_BACK,
+-		 FFA_MEMORY_OUTER_SHAREABLE}};
+-
+-	for (uint32_t i =3D 0; i < ARRAY_SIZE(send_function); i++) {
+-		/* Prepare memory region, and set all flags */
+-		EXPECT_EQ(ffa_memory_region_init(
+-				  mb.send, HF_MAILBOX_SIZE, HF_PRIMARY_VM_ID,
+-				  SERVICE_VM1, constituents,
+-				  ARRAY_SIZE(constituents), 0, 0,
+-				  FFA_DATA_ACCESS_RW,
+-				  FFA_INSTRUCTION_ACCESS_NOT_SPECIFIED,
+-				  FFA_MEMORY_NORMAL_MEM,
+-				  FFA_MEMORY_CACHE_WRITE_BACK,
+-				  FFA_MEMORY_INNER_SHAREABLE, NULL, &msg_size),
+-			  0);
+-
+-		ret =3D send_function[i](msg_size, msg_size);
+-		EXPECT_EQ(ret.func, FFA_SUCCESS_32);
+-
+-		handle =3D ffa_mem_success_handle(ret);
+-
+-		for (uint32_t j =3D 0; j < ARRAY_SIZE(invalid_attributes); ++j) {
+-			msg_size =3D ffa_memory_retrieve_request_init(
+-				mb.send, handle, HF_PRIMARY_VM_ID, SERVICE_VM1,
+-				0, 0, FFA_DATA_ACCESS_RW,
+-				FFA_INSTRUCTION_ACCESS_NOT_SPECIFIED,
+-				invalid_attributes[j].memory_type,
+-				invalid_attributes[j].memory_cacheability,
+-				invalid_attributes[j].memory_shareability);
+-
+-			EXPECT_LE(msg_size, HF_MAILBOX_SIZE);
+-
+-			EXPECT_EQ(ffa_msg_send(HF_PRIMARY_VM_ID, SERVICE_VM1,
+-					       msg_size, 0)
+-					  .func,
+-				  FFA_SUCCESS_32);
+-
+-			ffa_run(SERVICE_VM1, 0);
+-		}
+-
+-		EXPECT_EQ(ffa_mem_reclaim(handle, 0).func, FFA_SUCCESS_32);
+-	}
+-}
+-
+ /**
+  * If memory is shared can't request zeroing of memory at both send and
+  * relinquish.
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0006-tc-increase-h=
eap-pages.patch b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0006-tc-incre=
ase-heap-pages.patch
new file mode 100644
index 00000000..671f6a5c
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0006-tc-increase-heap-pag=
es.patch
@@ -0,0 +1,26 @@
+From e918cc5179241e1d35ba4b465b035b74b88e55d2 Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Fri, 29 Apr 2022 20:07:50 +0100
+Subject: [PATCH] tc: increase heap pages
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+---
+ project/reference/BUILD.gn | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/project/reference/BUILD.gn b/project/reference/BUILD.gn
+index 5d84d13..4ea0890 100644
+--- a/project/reference/BUILD.gn
++++ b/project/reference/BUILD.gn
+@@ -233,7 +233,7 @@ aarch64_toolchains("secure_tc") {
+   gicd_base_address =3D "0x30000000"
+   gicr_base_address =3D "0x30080000"
+   gicr_frames =3D 8
+-  heap_pages =3D 60
++  heap_pages =3D 120
+   max_cpus =3D 8
+   max_vms =3D 16
+   branch_protection =3D "standard"
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc b/meta-arm-b=
sp/recipes-bsp/hafnium/hafnium-tc.inc
index 14330856..c8f77dc6 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
+++ b/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
@@ -10,6 +10,15 @@ SRC_URI:remove =3D " \
     file://host-ld.patch \
     file://native-dtc.patch"
=20
+SRC_URI:append =3D " \
+        file://0001-feat-emulate-cntp-timer-register-accesses-using-cnth=
.patch \
+        file://0002-fix-ff-a-Use-FFA_INTERRUPT-to-signal-an-interrupted-=
.patch \
+        file://0003-fix-ff-a-Add-FFA_SECONDARY_EP_REGISTER_64-to-list-of=
.patch \
+        file://0004-feat-emulate-interrupt-controller-register-access.pa=
tch \
+        file://0005-Revert-fix-ff-a-check-receiver-s-attributes-on-memor=
.patch \
+        file://0006-tc-increase-heap-pages.patch \
+        "
+
 do_compile() {
     PATH=3D"${S}/prebuilts/linux-x64/clang/bin:$PATH" oe_runmake -C ${S}
 }
--=20
2.30.2


