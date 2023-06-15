Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC53FEB64DD
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 14:20:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19754.1686838796434355335
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Jun 2023 07:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 448ED2F4;
	Thu, 15 Jun 2023 07:20:40 -0700 (PDT)
Received: from R91284ZP.arm.com (unknown [10.57.33.138])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6F9533F663;
	Thu, 15 Jun 2023 07:19:55 -0700 (PDT)
From: Gyorgy Szing <Gyorgy.Szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <Gyorgy.Szing@arm.com>
Subject: [PATCH mickledore 14/17] optee-os: unblock NWd interrupts
Date: Thu, 15 Jun 2023 16:19:27 +0200
Message-Id: <20230615141930.2407-14-Gyorgy.Szing@arm.com>
X-Mailer: git-send-email 2.39.1.windows.1
In-Reply-To: <20230615141930.2407-1-Gyorgy.Szing@arm.com>
References: <20230615141930.2407-1-Gyorgy.Szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 15 Jun 2023 14:20:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4797

Update Trusted Services and backport an OP-TEE update which allows
interrupting the SPs by NWd interrupts. This solves the kernel stall
problems which are due to long cryptographic operations being executed
in the SWd.

Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
---
 ...re-spmc-handle-non-secure-interrupts.patch | 279 ++++++++++++++++++
 ...ure-SP-s-NS-interrupt-action-based-o.patch | 150 ++++++++++
 .../recipes-security/optee/optee-os_3.20.0.bb |   2 +
 .../trusted-services/trusted-services-src.inc |   4 +-
 4 files changed, 433 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm/recipes-security/optee/optee-os-3.20.0/0007-=
core-spmc-handle-non-secure-interrupts.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os-3.20.0/0008-=
core-spmc-configure-SP-s-NS-interrupt-action-based-o.patch

diff --git a/meta-arm/recipes-security/optee/optee-os-3.20.0/0007-core-sp=
mc-handle-non-secure-interrupts.patch b/meta-arm/recipes-security/optee/o=
ptee-os-3.20.0/0007-core-spmc-handle-non-secure-interrupts.patch
new file mode 100644
index 00000000..a0377aba
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-3.20.0/0007-core-spmc-hand=
le-non-secure-interrupts.patch
@@ -0,0 +1,279 @@
+From f4b4f5bccc1be9a709008cc8e6107302745796c8 Mon Sep 17 00:00:00 2001
+From: Imre Kis <imre.kis@arm.com>
+Date: Tue, 18 Apr 2023 16:41:51 +0200
+Subject: [PATCH] core: spmc: handle non-secure interrupts
+
+Add FFA_INTERRUPT and FFA_RUN support for signaling non-secure
+interrupts and for resuming to the secure world. If a secure partition
+is preempted by a non-secure interrupt OP-TEE saves the SP's state and
+sends an FFA_INTERRUPT to the normal world. After handling the interrupt
+the normal world should send an FFA_RUN to OP-TEE so it can continue
+running the SP.
+If OP-TEE is the active FF-A endpoint (i.e. it is running TAs) the
+non-secure interrupts are signaled by the existing
+OPTEE_FFA_YIELDING_CALL_RETURN_INTERRUPT message instead of
+FFA_INTERRUPT.
+
+Upstream-Status: Pending
+
+Signed-off-by: Imre Kis <imre.kis@arm.com>
+Change-Id: I577ebe86d416ee494963216a66a3bfc8206921b4
+
+---
+ core/arch/arm/include/ffa.h                   |  2 +-
+ .../arch/arm/include/kernel/spmc_sp_handler.h | 11 +++++++
+ core/arch/arm/kernel/secure_partition.c       | 17 ++++++++++
+ core/arch/arm/kernel/spmc_sp_handler.c        | 26 ++++++++++++++++
+ core/arch/arm/kernel/thread.c                 |  7 +++++
+ core/arch/arm/kernel/thread_spmc.c            | 31 ++++++++++++++++++-
+ core/arch/arm/kernel/thread_spmc_a64.S        | 30 ++++++++++++++++++
+ 7 files changed, 122 insertions(+), 2 deletions(-)
+
+diff --git a/core/arch/arm/include/ffa.h b/core/arch/arm/include/ffa.h
+index 5a19fb0c..b3d1d354 100644
+--- a/core/arch/arm/include/ffa.h
++++ b/core/arch/arm/include/ffa.h
+@@ -50,7 +50,7 @@
+ #define FFA_ID_GET			U(0x84000069)
+ #define FFA_MSG_WAIT			U(0x8400006B)
+ #define FFA_MSG_YIELD			U(0x8400006C)
+-#define FFA_MSG_RUN			U(0x8400006D)
++#define FFA_RUN				U(0x8400006D)
+ #define FFA_MSG_SEND			U(0x8400006E)
+ #define FFA_MSG_SEND_DIRECT_REQ_32	U(0x8400006F)
+ #define FFA_MSG_SEND_DIRECT_REQ_64	U(0xC400006F)
+diff --git a/core/arch/arm/include/kernel/spmc_sp_handler.h b/core/arch/=
arm/include/kernel/spmc_sp_handler.h
+index f5bda7bf..30c1e469 100644
+--- a/core/arch/arm/include/kernel/spmc_sp_handler.h
++++ b/core/arch/arm/include/kernel/spmc_sp_handler.h
+@@ -25,6 +25,8 @@ void spmc_sp_start_thread(struct thread_smc_args *args=
);
+ int spmc_sp_add_share(struct ffa_rxtx *rxtx,
+ 		      size_t blen, uint64_t *global_handle,
+ 		      struct sp_session *owner_sp);
++void spmc_sp_set_to_preempted(struct ts_session *ts_sess);
++int spmc_sp_resume_from_preempted(uint16_t endpoint_id);
+ #else
+ static inline void spmc_sp_start_thread(struct thread_smc_args *args __=
unused)
+ {
+@@ -37,6 +39,15 @@ static inline int spmc_sp_add_share(struct ffa_rxtx *=
rxtx __unused,
+ {
+ 	return FFA_NOT_SUPPORTED;
+ }
++
++static inline void spmc_sp_set_to_preempted(struct ts_session *ts_sess =
__unused)
++{
++}
++
++static inline int spmc_sp_resume_from_preempted(uint16_t endpoint_id __=
unused)
++{
++	return FFA_NOT_SUPPORTED;
++}
+ #endif
+=20
+ #endif /* __KERNEL_SPMC_SP_HANDLER_H */
+diff --git a/core/arch/arm/kernel/secure_partition.c b/core/arch/arm/ker=
nel/secure_partition.c
+index 1d36e90b..6e351e43 100644
+--- a/core/arch/arm/kernel/secure_partition.c
++++ b/core/arch/arm/kernel/secure_partition.c
+@@ -999,6 +999,8 @@ static TEE_Result sp_enter_invoke_cmd(struct ts_sess=
ion *s,
+ 	struct sp_session *sp_s =3D to_sp_session(s);
+ 	struct ts_session *sess =3D NULL;
+ 	struct thread_ctx_regs *sp_regs =3D NULL;
++	uint32_t thread_id =3D THREAD_ID_INVALID;
++	uint32_t rpc_target_info =3D 0;
+ 	uint32_t panicked =3D false;
+ 	uint32_t panic_code =3D 0;
+=20
+@@ -1011,8 +1013,23 @@ static TEE_Result sp_enter_invoke_cmd(struct ts_s=
ession *s,
+ 	sp_regs->cpsr =3D read_daif() & (SPSR_64_DAIF_MASK << SPSR_64_DAIF_SHI=
FT);
+=20
+ 	exceptions =3D thread_mask_exceptions(THREAD_EXCP_ALL);
++
++	/*
++	 * Store endpoint ID and thread ID in rpc_target_info. This will be us=
ed
++	 * as w1 in FFA_INTERRUPT in case of a NWd interrupt.
++	 */
++	rpc_target_info =3D thread_get_tsd()->rpc_target_info;
++	thread_id =3D thread_get_id();
++	assert((thread_id & ~0xffff) =3D=3D 0);
++	thread_get_tsd()->rpc_target_info =3D (sp_s->endpoint_id << 16) |
++					    (thread_id & 0xffff);
++
+ 	__thread_enter_user_mode(sp_regs, &panicked, &panic_code);
++
+ 	sp_regs->cpsr =3D cpsr;
++	/* Restore rpc_target_info */
++	thread_get_tsd()->rpc_target_info =3D rpc_target_info;
++
+ 	thread_unmask_exceptions(exceptions);
+=20
+ 	thread_user_clear_vfp(&ctx->uctx);
+diff --git a/core/arch/arm/kernel/spmc_sp_handler.c b/core/arch/arm/kern=
el/spmc_sp_handler.c
+index 5d3326fc..f4c7ff81 100644
+--- a/core/arch/arm/kernel/spmc_sp_handler.c
++++ b/core/arch/arm/kernel/spmc_sp_handler.c
+@@ -366,6 +366,32 @@ cleanup:
+ 	return res;
+ }
+=20
++void spmc_sp_set_to_preempted(struct ts_session *ts_sess)
++{
++	if (ts_sess && is_sp_ctx(ts_sess->ctx)) {
++		struct sp_session *sp_sess =3D to_sp_session(ts_sess);
++
++		assert(sp_sess->state =3D=3D sp_busy);
++
++		sp_sess->state =3D sp_preempted;
++	}
++}
++
++int spmc_sp_resume_from_preempted(uint16_t endpoint_id)
++{
++	struct sp_session *sp_sess =3D sp_get_session(endpoint_id);
++
++	if (!sp_sess)
++		return FFA_INVALID_PARAMETERS;
++
++	if (sp_sess->state !=3D sp_preempted)
++		return FFA_DENIED;
++
++	sp_sess->state =3D sp_busy;
++
++	return FFA_OK;
++}
++
+ static bool check_rxtx(struct ffa_rxtx *rxtx)
+ {
+ 	return rxtx && rxtx->rx && rxtx->tx && rxtx->size > 0;
+diff --git a/core/arch/arm/kernel/thread.c b/core/arch/arm/kernel/thread=
.c
+index 1e7f9f96..8cd4dc96 100644
+--- a/core/arch/arm/kernel/thread.c
++++ b/core/arch/arm/kernel/thread.c
+@@ -531,6 +531,13 @@ int thread_state_suspend(uint32_t flags, uint32_t c=
psr, vaddr_t pc)
+ 		core_mmu_set_user_map(NULL);
+ 	}
+=20
++	if (IS_ENABLED(CFG_SECURE_PARTITION)) {
++		struct ts_session *ts_sess =3D
++			TAILQ_FIRST(&threads[ct].tsd.sess_stack);
++
++		spmc_sp_set_to_preempted(ts_sess);
++	}
++
+ 	l->curr_thread =3D THREAD_ID_INVALID;
+=20
+ 	if (IS_ENABLED(CFG_VIRTUALIZATION))
+diff --git a/core/arch/arm/kernel/thread_spmc.c b/core/arch/arm/kernel/t=
hread_spmc.c
+index 3b4ac0b4..bc4e7687 100644
+--- a/core/arch/arm/kernel/thread_spmc.c
++++ b/core/arch/arm/kernel/thread_spmc.c
+@@ -45,7 +45,7 @@ struct mem_frag_state {
+ #endif
+=20
+ /* Initialized in spmc_init() below */
+-static uint16_t my_endpoint_id;
++uint16_t my_endpoint_id;
+=20
+ /*
+  * If struct ffa_rxtx::size is 0 RX/TX buffers are not mapped or initia=
lized.
+@@ -437,6 +437,32 @@ out:
+ 		      FFA_PARAM_MBZ, FFA_PARAM_MBZ);
+ 	cpu_spin_unlock(&rxtx->spinlock);
+ }
++
++static void spmc_handle_run(struct thread_smc_args *args)
++{
++	uint16_t endpoint =3D (args->a1 >> 16) & 0xffff;
++	uint16_t thread_id =3D (args->a1 & 0xffff);
++	uint32_t rc =3D 0;
++
++	if (endpoint !=3D my_endpoint_id) {
++		/*
++		 * The endpoint should be an SP, try to resume the SP from
++		 * preempted into busy state.
++		 */
++		rc =3D spmc_sp_resume_from_preempted(endpoint);
++		if (rc)
++			goto out;
++	}
++
++	thread_resume_from_rpc(thread_id, 0, 0, 0, 0);
++
++	/* thread_resume_from_rpc return only of the thread_id is invalid */
++	rc =3D FFA_INVALID_PARAMETERS;
++
++out:
++	spmc_set_args(args, FFA_ERROR, FFA_PARAM_MBZ, rc, FFA_PARAM_MBZ,
++		      FFA_PARAM_MBZ, FFA_PARAM_MBZ);
++}
+ #endif /*CFG_CORE_SEL1_SPMC*/
+=20
+ static void handle_yielding_call(struct thread_smc_args *args)
+@@ -970,6 +996,9 @@ void thread_spmc_msg_recv(struct thread_smc_args *ar=
gs)
+ 	case FFA_PARTITION_INFO_GET:
+ 		spmc_handle_partition_info_get(args, &nw_rxtx);
+ 		break;
++	case FFA_RUN:
++		spmc_handle_run(args);
++		break;
+ #endif /*CFG_CORE_SEL1_SPMC*/
+ 	case FFA_INTERRUPT:
+ 		itr_core_handler();
+diff --git a/core/arch/arm/kernel/thread_spmc_a64.S b/core/arch/arm/kern=
el/thread_spmc_a64.S
+index 21cb6251..7297005a 100644
+--- a/core/arch/arm/kernel/thread_spmc_a64.S
++++ b/core/arch/arm/kernel/thread_spmc_a64.S
+@@ -14,6 +14,20 @@
+ #include <kernel/thread.h>
+ #include <optee_ffa.h>
+=20
++#if CFG_SECURE_PARTITION
++LOCAL_FUNC thread_ffa_interrupt , :
++	mov_imm	x0, FFA_INTERRUPT		/* FID */
++	/* X1: Endpoint/vCPU IDs is set by caller */
++	mov	x2, #FFA_PARAM_MBZ		/* Param MBZ */
++	mov	x3, #FFA_PARAM_MBZ		/* Param MBZ */
++	mov	x4, #FFA_PARAM_MBZ		/* Param MBZ */
++	mov	x5, #FFA_PARAM_MBZ		/* Param MBZ */
++	mov	x6, #FFA_PARAM_MBZ		/* Param MBZ */
++	mov	x7, #FFA_PARAM_MBZ		/* Param MBZ */
++	b	.ffa_msg_loop
++END_FUNC thread_ffa_msg_wait
++#endif /* CFG_SECURE_PARTITION */
++
+ FUNC thread_ffa_msg_wait , :
+ 	mov_imm	x0, FFA_MSG_WAIT		/* FID */
+ 	mov	x1, #FFA_TARGET_INFO_MBZ	/* Target info MBZ */
+@@ -171,6 +185,14 @@ END_FUNC thread_rpc
+  * The current thread as indicated by @thread_index has just been
+  * suspended.  The job here is just to inform normal world the thread i=
d to
+  * resume when returning.
++ * If the active FF-A endpoint is OP-TEE (or a TA) then an this functio=
n send an
++ * OPTEE_FFA_YIELDING_CALL_RETURN_INTERRUPT message to the normal world=
 via the
++ * FFA_MSG_SEND_DIRECT_RESP interface. This is handled by the OP-TEE
++ * driver in Linux so it can schedule task to the thread.
++ * If the active endpoint is an SP the function sends an FFA_INTERRUPT.=
 This is
++ * handled by the FF-A driver and after taking care of the NWd interrup=
ts it
++ * returns via an FFA_RUN call.
++ * The active endpoint is determined by the upper 16 bits of rpc_target=
_info.
+  */
+ FUNC thread_foreign_intr_exit , :
+ 	/* load threads[w0].tsd.rpc_target_info into w1 */
+@@ -178,6 +200,14 @@ FUNC thread_foreign_intr_exit , :
+ 	adr_l	x2, threads
+ 	madd	x1, x1, x0, x2
+ 	ldr	w1, [x1, #THREAD_CTX_TSD_RPC_TARGET_INFO]
++#if CFG_SECURE_PARTITION
++	adr_l	x2, my_endpoint_id
++	ldrh	w2, [x2]
++	lsr	w3, w1, #16
++	cmp	w2, w3
++	/* (threads[w0].tsd.rpc_target_info >> 16) !=3D my_endpoint_id */
++	bne	thread_ffa_interrupt
++#endif /* CFG_SECURE_PARTITION */
+ 	mov	x2, #FFA_PARAM_MBZ
+ 	mov	w3, #FFA_PARAM_MBZ
+ 	mov	w4, #OPTEE_FFA_YIELDING_CALL_RETURN_INTERRUPT
+
+--=20
+2.17.1
diff --git a/meta-arm/recipes-security/optee/optee-os-3.20.0/0008-core-sp=
mc-configure-SP-s-NS-interrupt-action-based-o.patch b/meta-arm/recipes-se=
curity/optee/optee-os-3.20.0/0008-core-spmc-configure-SP-s-NS-interrupt-a=
ction-based-o.patch
new file mode 100644
index 00000000..32e56068
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-3.20.0/0008-core-spmc-conf=
igure-SP-s-NS-interrupt-action-based-o.patch
@@ -0,0 +1,150 @@
+From cad33cffb5be17fc0654aaf03c4d5227ae682e7a Mon Sep 17 00:00:00 2001
+From: Imre Kis <imre.kis@arm.com>
+Date: Tue, 25 Apr 2023 14:19:14 +0200
+Subject: [PATCH] core: spmc: configure SP's NS interrupt action based on
+ the manifest
+
+Used mandatory ns-interrupts-action SP manifest property to configure
+signaled or queued non-secure interrupt handling.
+
+Upstream-Status: Pending
+
+Signed-off-by: Imre Kis <imre.kis@arm.com>
+Change-Id: I843e69e5dbb9613ecd8b95654e8ca1730a594ca6
+---
+ .../arm/include/kernel/secure_partition.h     |  2 +
+ core/arch/arm/kernel/secure_partition.c       | 66 +++++++++++++++++--
+ 2 files changed, 63 insertions(+), 5 deletions(-)
+
+diff --git a/core/arch/arm/include/kernel/secure_partition.h b/core/arch=
/arm/include/kernel/secure_partition.h
+index 290750936..3bf339d3c 100644
+--- a/core/arch/arm/include/kernel/secure_partition.h
++++ b/core/arch/arm/include/kernel/secure_partition.h
+@@ -43,6 +43,8 @@ struct sp_session {
+ 	unsigned int spinlock;
+ 	const void *fdt;
+ 	bool is_initialized;
++	uint32_t ns_interrupts_action;
++	uint32_t ns_interrupts_action_inherited;
+ 	TAILQ_ENTRY(sp_session) link;
+ };
+=20
+diff --git a/core/arch/arm/kernel/secure_partition.c b/core/arch/arm/ker=
nel/secure_partition.c
+index 52365553b..e54069c17 100644
+--- a/core/arch/arm/kernel/secure_partition.c
++++ b/core/arch/arm/kernel/secure_partition.c
+@@ -46,6 +46,10 @@
+ 					 SP_MANIFEST_ATTR_WRITE | \
+ 					 SP_MANIFEST_ATTR_EXEC)
+=20
++#define SP_MANIFEST_NS_INT_QUEUED	(0x0)
++#define SP_MANIFEST_NS_INT_MANAGED_EXIT	(0x1)
++#define SP_MANIFEST_NS_INT_SIGNALED	(0x2)
++
+ #define SP_PKG_HEADER_MAGIC (0x474b5053)
+ #define SP_PKG_HEADER_VERSION_V1 (0x1)
+ #define SP_PKG_HEADER_VERSION_V2 (0x2)
+@@ -907,6 +911,30 @@ static TEE_Result sp_init_uuid(const TEE_UUID *uuid=
, const void * const fdt)
+ 		return res;
+ 	DMSG("endpoint is 0x%"PRIx16, sess->endpoint_id);
+=20
++	res =3D sp_dt_get_u32(fdt, 0, "ns-interrupts-action",
++			    &sess->ns_interrupts_action);
++
++	if (res) {
++		EMSG("Mandatory property is missing: ns-interrupts-action");
++		return res;
++	}
++
++	switch (sess->ns_interrupts_action) {
++	case SP_MANIFEST_NS_INT_QUEUED:
++	case SP_MANIFEST_NS_INT_SIGNALED:
++		/* OK */
++		break;
++
++	case SP_MANIFEST_NS_INT_MANAGED_EXIT:
++		EMSG("Managed exit is not implemented");
++		return TEE_ERROR_NOT_IMPLEMENTED;
++
++	default:
++		EMSG("Invalid ns-interrupts-action value: %d",
++		     sess->ns_interrupts_action);
++		return TEE_ERROR_BAD_PARAMETERS;
++	}
++
+ 	return TEE_SUCCESS;
+ }
+=20
+@@ -989,17 +1017,45 @@ TEE_Result sp_enter(struct thread_smc_args *args,=
 struct sp_session *sp)
+ 	return res;
+ }
+=20
++/*
++ * According to FF-A v1.1 section 8.3.1.4 if a caller requires less per=
missive
++ * active on NS interrupt than the callee, the callee must inherit the =
caller's
++ * configuration.
++ * Each SP's own NS action setting is stored in ns_interrupts_action. T=
he
++ * effective action will be MIN([self action], [caller's action]) which=
 is
++ * stored in the ns_interrupts_action_inherited field.
++ */
++static void sp_cpsr_configure_foreing_interrupts(struct sp_session *s,
++						 struct ts_session *caller,
++						 uint64_t *cpsr)
++{
++	if (caller) {
++		struct sp_session *caller_sp =3D to_sp_session(caller);
++
++		s->ns_interrupts_action_inherited =3D
++			MIN(caller_sp->ns_interrupts_action_inherited,
++			    s->ns_interrupts_action);
++	} else {
++		s->ns_interrupts_action_inherited =3D s->ns_interrupts_action;
++	}
++
++	if (s->ns_interrupts_action_inherited =3D=3D SP_MANIFEST_NS_INT_QUEUED=
)
++		*cpsr |=3D (THREAD_EXCP_FOREIGN_INTR << ARM32_CPSR_F_SHIFT);
++	else
++		*cpsr &=3D ~(THREAD_EXCP_FOREIGN_INTR << ARM32_CPSR_F_SHIFT);
++}
++
+ static TEE_Result sp_enter_invoke_cmd(struct ts_session *s,
+ 				      uint32_t cmd __unused)
+ {
+ 	struct sp_ctx *ctx =3D to_sp_ctx(s->ctx);
+ 	TEE_Result res =3D TEE_SUCCESS;
+ 	uint32_t exceptions =3D 0;
+-	uint64_t cpsr =3D 0;
+ 	struct sp_session *sp_s =3D to_sp_session(s);
+ 	struct ts_session *sess =3D NULL;
+ 	struct thread_ctx_regs *sp_regs =3D NULL;
+ 	uint32_t thread_id =3D THREAD_ID_INVALID;
++	struct ts_session *caller =3D NULL;
+ 	uint32_t rpc_target_info =3D 0;
+ 	uint32_t panicked =3D false;
+ 	uint32_t panic_code =3D 0;
+@@ -1009,11 +1065,12 @@ static TEE_Result sp_enter_invoke_cmd(struct ts_=
session *s,
+ 	sp_regs =3D &ctx->sp_regs;
+ 	ts_push_current_session(s);
+=20
+-	cpsr =3D sp_regs->cpsr;
+-	sp_regs->cpsr =3D read_daif() & (SPSR_64_DAIF_MASK << SPSR_64_DAIF_SHI=
FT);
+-
+ 	exceptions =3D thread_mask_exceptions(THREAD_EXCP_ALL);
+=20
++	/* Enable/disable foreign interrupts in CPSR/SPSR */
++	caller =3D ts_get_calling_session();
++	sp_cpsr_configure_foreing_interrupts(sp_s, caller, &sp_regs->cpsr);
++
+ 	/*
+ 	 * Store endpoint ID and thread ID in rpc_target_info. This will be us=
ed
+ 	 * as w1 in FFA_INTERRUPT in case of a NWd interrupt.
+@@ -1026,7 +1083,6 @@ static TEE_Result sp_enter_invoke_cmd(struct ts_se=
ssion *s,
+=20
+ 	__thread_enter_user_mode(sp_regs, &panicked, &panic_code);
+=20
+-	sp_regs->cpsr =3D cpsr;
+ 	/* Restore rpc_target_info */
+ 	thread_get_tsd()->rpc_target_info =3D rpc_target_info;
+=20
+--=20
+2.17.1
diff --git a/meta-arm/recipes-security/optee/optee-os_3.20.0.bb b/meta-ar=
m/recipes-security/optee/optee-os_3.20.0.bb
index 661a807d..2d4d6d6d 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.20.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.20.0.bb
@@ -9,5 +9,7 @@ SRC_URI:append =3D " \
     file://0004-core-Define-section-attributes-for-clang.patch \
     file://0005-core-arm-S-EL1-SPMC-boot-ABI-update.patch \
     file://0006-core-ffa-add-TOS_FW_CONFIG-handling.patch \
+    file://0007-core-spmc-handle-non-secure-interrupts.patch \
+    file://0008-core-spmc-configure-SP-s-NS-interrupt-action-based-o.pat=
ch \
    "
 EXTRA_OEMAKE +=3D " CFG_MAP_EXT_DT_SECURE=3Dy"
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-=
src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src=
.inc
index 34827e5d..2bb4a8a1 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
@@ -11,8 +11,8 @@ SRC_URI:append =3D "\
 	file://0001-Limit-nanopb-build-to-single-process.patch \
 "
=20
-#Latest on 2023 April 25
-SRCREV=3D"0d292e7c879076ea36cc39e30e0ac930b71e8cd8"
+#Latest on 2023 April 28
+SRCREV=3D"08b3d39471f4914186bd23793dc920e83b0e3197"
 LIC_FILES_CHKSUM =3D "file://${S}/license.rst;md5=3Dea160bac7f690a069c60=
8516b17997f4"
=20
 S =3D "${WORKDIR}/git/trusted-services"
--=20
2.39.1.windows.1


