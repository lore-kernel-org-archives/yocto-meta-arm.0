Return-Path: <mohamed.omarasaker@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC297C43217
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 16:42:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.11995.1666284133547223814
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Oct 2022 09:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mohamed.omarasaker@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31EA11063;
	Thu, 20 Oct 2022 09:42:19 -0700 (PDT)
Received: from e126544.arm.com (unknown [10.57.37.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A79F3F792;
	Thu, 20 Oct 2022 09:42:11 -0700 (PDT)
From: mohamed.omarasaker@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
Subject: [PATCH 1/1] arm-bsp/u-boot: corstone1000: support 32bit ffa direct messaging
Date: Thu, 20 Oct 2022 17:41:54 +0100
Message-Id: <20221020164154.3334033-2-mohamed.omarasaker@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020164154.3334033-1-mohamed.omarasaker@arm.com>
References: <20221020164154.3334033-1-mohamed.omarasaker@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Oct 2022 16:42:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3990

From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>

Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
---
 ...-support-for-32-bit-direct-messaging.patch | 182 ++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   3 +-
 2 files changed, 184 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
031-ffa-add-support-for-32-bit-direct-messaging.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-ffa=
-add-support-for-32-bit-direct-messaging.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0031-ffa-add-support-for-32-bit-direct-messag=
ing.patch
new file mode 100644
index 00000000..ac0638e0
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-ffa-add-su=
pport-for-32-bit-direct-messaging.patch
@@ -0,0 +1,182 @@
+From 6cb8e5f83d53357fbc6e58c2c5c5a3450654f9e6 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Wed, 19 Oct 2022 17:51:10 +0100
+Subject: [PATCH] arm_ffa: add support for 32-bit direct messaging
+
+add 32-bit mode for FFA_MSG_SEND_DIRECT_REQ and FFA_MSG_SEND_DIRECT_RESP
+
+Tested-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ cmd/armffa.c                       |  2 +-
+ drivers/firmware/arm-ffa/core.c    | 17 ++++++++++++++---
+ drivers/firmware/arm-ffa/sandbox.c |  2 +-
+ include/arm_ffa.h                  |  2 +-
+ lib/efi_loader/efi_capsule.c       |  2 +-
+ lib/efi_loader/efi_setup.c         |  2 +-
+ lib/efi_loader/efi_variable_tee.c  |  2 +-
+ test/dm/ffa.c                      |  6 +++---
+ 8 files changed, 23 insertions(+), 12 deletions(-)
+=E2=80=8B
+diff --git a/cmd/armffa.c b/cmd/armffa.c
+index 9b56e8a830..9842b99181 100644
+--- a/cmd/armffa.c
++++ b/cmd/armffa.c
+@@ -129,7 +129,7 @@ int  do_ffa_msg_send_direct_req(struct cmd_tbl *cmdt=
p, int flag, int argc,
+ 		return -EINVAL;
+ 	}
+=20
+-	ret =3D ffa_bus_ops_get()->sync_send_receive(part_id, &msg);
++	ret =3D ffa_bus_ops_get()->sync_send_receive(part_id, &msg, 1);
+ 	if (ret =3D=3D 0) {
+ 		u8 cnt;
+=20
+diff --git a/drivers/firmware/arm-ffa/core.c b/drivers/firmware/arm-ffa/=
core.c
+index caba10caae..ba1ba59937 100644
+--- a/drivers/firmware/arm-ffa/core.c
++++ b/drivers/firmware/arm-ffa/core.c
+@@ -1032,6 +1032,7 @@ static int ffa_cache_partitions_info(void)
+  * ffa_msg_send_direct_req - FFA_MSG_SEND_DIRECT_{REQ,RESP} handler fun=
ction
+  * @dst_part_id: destination partition ID
+  * @msg: pointer to the message data preallocated by the client (in/out=
)
++ * @is_smc64: select 64-bit or 32-bit FF-A ABI
+  *
+  * This is the runtime function that implements FFA_MSG_SEND_DIRECT_{RE=
Q,RESP}
+  * FF-A functions.
+@@ -1048,10 +1049,12 @@ static int ffa_cache_partitions_info(void)
+  *
+  * 0 on success. Otherwise, failure
+  */
+-static int __ffa_runtime ffa_msg_send_direct_req(u16 dst_part_id, struc=
t ffa_send_direct_data *msg)
++static int __ffa_runtime ffa_msg_send_direct_req(u16 dst_part_id, struc=
t ffa_send_direct_data *msg,
++						 u8 is_smc64)
+ {
+ 	ffa_value_t res =3D {0};
+ 	int ffa_errno;
++	u64 req_mode, resp_mode;
+=20
+ 	if (!ffa_priv_data || !ffa_priv_data->invoke_ffa_fn)
+ 		return -EINVAL;
+@@ -1060,8 +1063,16 @@ static int __ffa_runtime ffa_msg_send_direct_req(=
u16 dst_part_id, struct ffa_sen
+ 	if (!ffa_priv_data->partitions.count || !ffa_priv_data->partitions.des=
cs)
+ 		return -ENODEV;
+=20
++	if(is_smc64) {
++		req_mode =3D FFA_SMC_64(FFA_MSG_SEND_DIRECT_REQ);
++		resp_mode =3D FFA_SMC_64(FFA_MSG_SEND_DIRECT_RESP);
++	} else {
++		req_mode =3D FFA_SMC_32(FFA_MSG_SEND_DIRECT_REQ);
++		resp_mode =3D FFA_SMC_32(FFA_MSG_SEND_DIRECT_RESP);
++	}
++
+ 	ffa_priv_data->invoke_ffa_fn((ffa_value_t){
+-			.a0 =3D FFA_SMC_64(FFA_MSG_SEND_DIRECT_REQ),
++			.a0 =3D req_mode,
+ 			.a1 =3D PREP_SELF_ENDPOINT_ID(ffa_priv_data->id) |
+ 				PREP_PART_ENDPOINT_ID(dst_part_id),
+ 			.a2 =3D 0,
+@@ -1083,7 +1094,7 @@ static int __ffa_runtime ffa_msg_send_direct_req(u=
16 dst_part_id, struct ffa_sen
+ 		return 0;
+ 	}
+=20
+-	if (res.a0 =3D=3D FFA_SMC_64(FFA_MSG_SEND_DIRECT_RESP)) {
++	if (res.a0 =3D=3D resp_mode){
+ 		/*
+ 		 * Message sent with response
+ 		 * extract the return data
+diff --git a/drivers/firmware/arm-ffa/sandbox.c b/drivers/firmware/arm-f=
fa/sandbox.c
+index 16e1fdc809..8e8549441d 100644
+--- a/drivers/firmware/arm-ffa/sandbox.c
++++ b/drivers/firmware/arm-ffa/sandbox.c
+@@ -430,7 +430,7 @@ static int sandbox_ffa_sp_valid(u16 part_id)
+  * @{a0-a7} , res: The SMC call arguments and return structure.
+  *
+  * This is the function that emulates FFA_MSG_SEND_DIRECT_{REQ,RESP}
+- * FF-A functions.
++ * FF-A functions. Only SMC 64-bit is supported in Sandbox.
+  *
+  * Emulating interrupts is not supported. So, FFA_RUN and FFA_INTERRUPT=
 are not supported.
+  * In case of success FFA_MSG_SEND_DIRECT_RESP is returned with default=
 pattern data (0xff).
+diff --git a/include/arm_ffa.h b/include/arm_ffa.h
+index 665413a0c5..4a7c59ff28 100644
+--- a/include/arm_ffa.h
++++ b/include/arm_ffa.h
+@@ -97,7 +97,7 @@ struct __packed ffa_send_direct_data {
+ struct ffa_bus_ops {
+ 	int (*partition_info_get)(const char *uuid_str,
+ 				  u32 *parts_size, struct ffa_partition_info *buffer);
+-	int (*sync_send_receive)(u16 dst_part_id, struct ffa_send_direct_data =
*msg);
++	int (*sync_send_receive)(u16 dst_part_id, struct ffa_send_direct_data =
*msg, u8 is_smc64);
+ 	int (*rxtx_unmap)(void);
+ };
+=20
+diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
+index 65e2fc8296..c479c53d04 100644
+--- a/lib/efi_loader/efi_capsule.c
++++ b/lib/efi_loader/efi_capsule.c
+@@ -591,7 +591,7 @@ static int __efi_runtime efi_corstone1000_buffer_rea=
dy_event(u32 capsule_image_s
+ 	msg.data1 =3D PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) =
|
+ 		PREP_SEPROXY_EVT(CORSTONE1000_BUFFER_READY_EVT); /* w4 */
+=20
+-	return ffa_bus_ops_get()->sync_send_receive(CORSTONE1000_SEPROXY_PART_=
ID, &msg);
++	return ffa_bus_ops_get()->sync_send_receive(CORSTONE1000_SEPROXY_PART_=
ID, &msg, 0);
+ }
+ #endif
+=20
+diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
+index 6ccda175ff..416af8d663 100644
+--- a/lib/efi_loader/efi_setup.c
++++ b/lib/efi_loader/efi_setup.c
+@@ -153,7 +153,7 @@ static int efi_corstone1000_uboot_efi_started_event(=
void)
+ 	msg.data1 =3D PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) =
|
+ 			PREP_SEPROXY_EVT(CORSTONE1000_UBOOT_EFI_STARTED_EVT); /* w4 */
+=20
+-	return ffa_bus_ops_get()->sync_send_receive(CORSTONE1000_SEPROXY_PART_=
ID, &msg);
++	return ffa_bus_ops_get()->sync_send_receive(CORSTONE1000_SEPROXY_PART_=
ID, &msg, 0);
+ }
+ #endif
+=20
+diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_vari=
able_tee.c
+index 7d9d577281..05f3c02911 100644
+--- a/lib/efi_loader/efi_variable_tee.c
++++ b/lib/efi_loader/efi_variable_tee.c
+@@ -201,7 +201,7 @@ static int __efi_runtime ffa_notify_mm_sp(void)
+=20
+ 	msg.data0 =3D FFA_SHARED_MM_BUFFER_OFFSET; /* x3 */
+=20
+-	ret =3D ffa_bus_ops_get()->sync_send_receive(mm_sp_id, &msg);
++	ret =3D ffa_bus_ops_get()->sync_send_receive(mm_sp_id, &msg, 1);
+ 	if (ret !=3D 0)
+ 		return ret;
+=20
+diff --git a/test/dm/ffa.c b/test/dm/ffa.c
+index 052d5fc3f4..14b19cf71e 100644
+--- a/test/dm/ffa.c
++++ b/test/dm/ffa.c
+@@ -170,7 +170,7 @@ static int  test_ffa_msg_send_direct_req(u16 part_id=
, struct unit_test_state *ut
+ 	struct ffa_send_direct_data msg =3D {0};
+ 	u8 cnt;
+=20
+-	ut_assertok(ffa_bus_ops_get()->sync_send_receive(part_id, &msg));
++	ut_assertok(ffa_bus_ops_get()->sync_send_receive(part_id, &msg, 1));
+=20
+ 	for (cnt =3D 0; cnt < sizeof(struct ffa_send_direct_data) / sizeof(u64=
); cnt++)
+ 		ut_assertok(((u64 *)&msg)[cnt] !=3D 0xffffffffffffffff);
+@@ -380,12 +380,12 @@ static int dm_test_ffa_nack(struct unit_test_state=
 *uts)
+ 	ut_assertok(count !=3D SANDBOX_SP_COUNT_PER_VALID_SERVICE);
+=20
+ 	/* send data to an invalid partition */
+-	ret =3D ffa_bus_ops_get()->sync_send_receive(part_id, &msg);
++	ret =3D ffa_bus_ops_get()->sync_send_receive(part_id, &msg, 1);
+ 	ut_assertok(ret !=3D -EINVAL);
+=20
+ 	/* send data to a valid partition */
+ 	part_id =3D prvdata->partitions.descs[0].info.id;
+-	ret =3D ffa_bus_ops_get()->sync_send_receive(part_id, &msg);
++	ret =3D ffa_bus_ops_get()->sync_send_receive(part_id, &msg, 1);
+ 	ut_assertok(ret !=3D 0);
+=20
+ 	return CMD_RET_SUCCESS;
+--=20
+2.17.1
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 465f0349..6144e97a 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -48,7 +48,8 @@ SRC_URI:append:corstone1000 =3D " \
         file://0028-Introduce-external-sys-driver-to-device-tree.patch \
         file://0029-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch=
 \
         file://0030-arm-corstone1000-esrt-support.patch \
-      "
+        file://0031-ffa-add-support-for-32-bit-direct-messaging.patch  \
+        "
=20
 #
 # FVP BASE
--=20
2.25.1


