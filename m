Return-Path: <davidson.kumaresan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A0CECAAA1
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 07:00:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.3759.1662706796238245951
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 08 Sep 2022 23:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: davidson.kumaresan@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E3D015DB;
	Fri,  9 Sep 2022 00:00:01 -0700 (PDT)
Received: from usa.arm.com (unknown [10.162.16.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5A2B33F73D;
	Fri,  9 Sep 2022 00:00:22 -0700 (PDT)
From: Davidson K <davidson.kumaresan@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Davidson K <davidson.kumaresan@arm.com>
Subject: [PATCH 2/3] arm-bsp/tc: upgrade version of hafnium
Date: Fri,  9 Sep 2022 12:29:26 +0530
Message-Id: <20220909065927.11581-2-davidson.kumaresan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909065927.11581-1-davidson.kumaresan@arm.com>
References: <20220909065927.11581-1-davidson.kumaresan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 09 Sep 2022 07:00:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3751

Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
Change-Id: I7ccc2ab23955291bcf7d87384ba1ac94c1568443
---
 ...nterrupt-controller-register-access.patch} |   0
 ..._INTERRUPT-to-signal-an-interrupted-.patch | 152 ---------
 ..._SECONDARY_EP_REGISTER_64-to-list-of.patch |  28 --
 ...atch =3D> 0003-tc-increase-heap-pages.patch} |   0
 ...check-receiver-s-attributes-on-memor.patch | 318 ------------------
 .../recipes-bsp/hafnium/hafnium-tc.inc        |  12 +-
 .../hafnium/hafnium/pkg-config-native.patch   |  16 +-
 7 files changed, 14 insertions(+), 512 deletions(-)
 rename meta-arm-bsp/recipes-bsp/hafnium/files/tc/{0004-feat-emulate-inte=
rrupt-controller-register-access.patch =3D> 0002-feat-emulate-interrupt-c=
ontroller-register-access.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-fix-ff=
-a-Use-FFA_INTERRUPT-to-signal-an-interrupted-.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-fix-ff=
-a-Add-FFA_SECONDARY_EP_REGISTER_64-to-list-of.patch
 rename meta-arm-bsp/recipes-bsp/hafnium/files/tc/{0006-tc-increase-heap-=
pages.patch =3D> 0003-tc-increase-heap-pages.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc/0005-Revert=
-fix-ff-a-check-receiver-s-attributes-on-memor.patch

diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0004-feat-emulate-=
interrupt-controller-register-access.patch b/meta-arm-bsp/recipes-bsp/haf=
nium/files/tc/0002-feat-emulate-interrupt-controller-register-access.patc=
h
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/hafnium/files/tc/0004-feat-emulate-i=
nterrupt-controller-register-access.patch
rename to meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-feat-emulate-int=
errupt-controller-register-access.patch
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-fix-ff-a-Use-=
FFA_INTERRUPT-to-signal-an-interrupted-.patch b/meta-arm-bsp/recipes-bsp/=
hafnium/files/tc/0002-fix-ff-a-Use-FFA_INTERRUPT-to-signal-an-interrupted=
-.patch
deleted file mode 100644
index 2b57b239..00000000
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-fix-ff-a-Use-FFA_INT=
ERRUPT-to-signal-an-interrupted-.patch
+++ /dev/null
@@ -1,152 +0,0 @@
-From e6bcc390749f0560b3bc92507ecbaaabc7145200 Mon Sep 17 00:00:00 2001
-From: Lucian Paul-Trifu <lucian.paul-trifu@arm.com>
-Date: Wed, 10 Mar 2021 11:31:02 +0000
-Subject: [PATCH 2/5] fix(ff-a): Use FFA_INTERRUPT to signal an interrupt=
ed
- FFA_MSG_WAIT
-
-Rather than FFA_ERROR(INTERRUPTED).
-
-Change-Id: I6b23a442714852b6183e0e46af6f0504ec0ee8f4
-Signed-off-by: Ben Horgan <ben.horgan@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- src/api.c                                                  | 2 +-
- test/inc/test/vmapi/ffa.h                                  | 7 +++++++
- test/vmapi/arch/aarch64/gicv3/services/common.c            | 3 +--
- test/vmapi/arch/aarch64/gicv3/services/timer.c             | 2 +-
- test/vmapi/el0_partitions/services/interruptible.c         | 3 +--
- test/vmapi/el0_partitions/services/interruptible_echo.c    | 3 +--
- test/vmapi/el0_partitions/services/receive_block.c         | 2 +-
- .../primary_with_secondaries/services/interruptible.c      | 3 +--
- .../primary_with_secondaries/services/receive_block.c      | 2 +-
- 9 files changed, 15 insertions(+), 12 deletions(-)
-
-diff --git a/src/api.c b/src/api.c
-index b713b7c..00c4d44 100644
---- a/src/api.c
-+++ b/src/api.c
-@@ -1588,7 +1588,7 @@ struct ffa_value api_ffa_msg_recv(bool block, stru=
ct vcpu *current,
- 	 * received. If a message is received the return value will be set at
- 	 * that time to FFA_SUCCESS.
- 	 */
--	return_code =3D ffa_error(FFA_INTERRUPTED);
-+	return_code =3D (struct ffa_value){.func =3D FFA_INTERRUPT_32};
- 	if (api_ffa_msg_recv_block_interrupted(current)) {
- 		goto out;
- 	}
-diff --git a/test/inc/test/vmapi/ffa.h b/test/inc/test/vmapi/ffa.h
-index 8fc1223..f0f3e75 100644
---- a/test/inc/test/vmapi/ffa.h
-+++ b/test/inc/test/vmapi/ffa.h
-@@ -24,6 +24,13 @@
- 		EXPECT_EQ(ffa_error_code(v), (ffa_error)); \
- 	} while (0)
-=20
-+#define EXPECT_FFA_INTERRUPT(value)                        \
-+	do {                                               \
-+		struct ffa_value v =3D (value);              \
-+		EXPECT_EQ(v.func, FFA_INTERRUPT_32);       \
-+	} while (0)
-+
-+
- /*
-  * The bit 15 of the FF-A ID indicates whether the partition is executi=
ng
-  * in the normal world, in case it is a Virtual Machine (VM); or in the
-diff --git a/test/vmapi/arch/aarch64/gicv3/services/common.c b/test/vmap=
i/arch/aarch64/gicv3/services/common.c
-index 06df28d..4ada9e2 100644
---- a/test/vmapi/arch/aarch64/gicv3/services/common.c
-+++ b/test/vmapi/arch/aarch64/gicv3/services/common.c
-@@ -22,8 +22,7 @@ struct ffa_value mailbox_receive_retry(void)
-=20
- 	do {
- 		received =3D ffa_msg_wait();
--	} while (received.func =3D=3D FFA_ERROR_32 &&
--		 received.arg2 =3D=3D FFA_INTERRUPTED);
-+	} while (received.func =3D=3D FFA_INTERRUPT_32);
-=20
- 	return received;
- }
-diff --git a/test/vmapi/arch/aarch64/gicv3/services/timer.c b/test/vmapi=
/arch/aarch64/gicv3/services/timer.c
-index 156f160..d5d2816 100644
---- a/test/vmapi/arch/aarch64/gicv3/services/timer.c
-+++ b/test/vmapi/arch/aarch64/gicv3/services/timer.c
-@@ -104,7 +104,7 @@ TEST_SERVICE(timer)
- 		} else if (receive) {
- 			struct ffa_value res =3D ffa_msg_wait();
-=20
--			EXPECT_FFA_ERROR(res, FFA_INTERRUPTED);
-+			EXPECT_FFA_INTERRUPT(res);
- 		} else {
- 			/* Busy wait until the timer fires. */
- 			while (!timer_fired) {
-diff --git a/test/vmapi/el0_partitions/services/interruptible.c b/test/v=
mapi/el0_partitions/services/interruptible.c
-index 0d00b16..4c9f099 100644
---- a/test/vmapi/el0_partitions/services/interruptible.c
-+++ b/test/vmapi/el0_partitions/services/interruptible.c
-@@ -50,8 +50,7 @@ static struct ffa_value mailbox_receive_retry()
- 	do {
- 		irq();
- 		received =3D ffa_msg_wait();
--	} while (received.func =3D=3D FFA_ERROR_32 &&
--		 ffa_error_code(received) =3D=3D FFA_INTERRUPTED);
-+	} while (received.func =3D=3D FFA_INTERRUPT_32);
-=20
- 	return received;
- }
-diff --git a/test/vmapi/el0_partitions/services/interruptible_echo.c b/t=
est/vmapi/el0_partitions/services/interruptible_echo.c
-index b618cf2..a857783 100644
---- a/test/vmapi/el0_partitions/services/interruptible_echo.c
-+++ b/test/vmapi/el0_partitions/services/interruptible_echo.c
-@@ -39,8 +39,7 @@ static struct ffa_value mailbox_receive_retry()
- 	do {
- 		irq();
- 		received =3D ffa_msg_wait();
--	} while (received.func =3D=3D FFA_ERROR_32 &&
--		 received.arg2 =3D=3D FFA_INTERRUPTED);
-+	} while (received.func =3D=3D FFA_INTERRUPT_32);
-=20
- 	return received;
- }
-diff --git a/test/vmapi/el0_partitions/services/receive_block.c b/test/v=
mapi/el0_partitions/services/receive_block.c
-index 05a22f3..60da28b 100644
---- a/test/vmapi/el0_partitions/services/receive_block.c
-+++ b/test/vmapi/el0_partitions/services/receive_block.c
-@@ -27,7 +27,7 @@ TEST_SERVICE(receive_block)
-=20
- 	for (i =3D 0; i < 10; ++i) {
- 		struct ffa_value res =3D ffa_msg_wait();
--		EXPECT_FFA_ERROR(res, FFA_INTERRUPTED);
-+		EXPECT_FFA_INTERRUPT(res);
- 	}
-=20
- 	memcpy_s(SERVICE_SEND_BUFFER(), FFA_MSG_PAYLOAD_MAX, message,
-diff --git a/test/vmapi/primary_with_secondaries/services/interruptible.=
c b/test/vmapi/primary_with_secondaries/services/interruptible.c
-index cc1c1f9..005d1ff 100644
---- a/test/vmapi/primary_with_secondaries/services/interruptible.c
-+++ b/test/vmapi/primary_with_secondaries/services/interruptible.c
-@@ -46,8 +46,7 @@ struct ffa_value mailbox_receive_retry()
-=20
- 	do {
- 		received =3D ffa_msg_wait();
--	} while (received.func =3D=3D FFA_ERROR_32 &&
--		 ffa_error_code(received) =3D=3D FFA_INTERRUPTED);
-+	} while (received.func =3D=3D FFA_INTERRUPT_32);
-=20
- 	return received;
- }
-diff --git a/test/vmapi/primary_with_secondaries/services/receive_block.=
c b/test/vmapi/primary_with_secondaries/services/receive_block.c
-index edb4e3c..a6805ae 100644
---- a/test/vmapi/primary_with_secondaries/services/receive_block.c
-+++ b/test/vmapi/primary_with_secondaries/services/receive_block.c
-@@ -40,7 +40,7 @@ TEST_SERVICE(receive_block)
-=20
- 	for (i =3D 0; i < 10; ++i) {
- 		struct ffa_value res =3D ffa_msg_wait();
--		EXPECT_FFA_ERROR(res, FFA_INTERRUPTED);
-+		EXPECT_FFA_INTERRUPT(res);
- 	}
-=20
- 	memcpy_s(SERVICE_SEND_BUFFER(), FFA_MSG_PAYLOAD_MAX, message,
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-fix-ff-a-Add-=
FFA_SECONDARY_EP_REGISTER_64-to-list-of.patch b/meta-arm-bsp/recipes-bsp/=
hafnium/files/tc/0003-fix-ff-a-Add-FFA_SECONDARY_EP_REGISTER_64-to-list-o=
f.patch
deleted file mode 100644
index 8d2cc139..00000000
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-fix-ff-a-Add-FFA_SEC=
ONDARY_EP_REGISTER_64-to-list-of.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From a6f466c2594b2f56d34fee72494fbd29ea9c7d21 Mon Sep 17 00:00:00 2001
-From: Ben Horgan <ben.horgan@arm.com>
-Date: Tue, 26 Apr 2022 12:59:42 +0000
-Subject: [PATCH 3/5] fix(ff-a): Add FFA_SECONDARY_EP_REGISTER_64 to list=
 of
- features
-
-Signed-off-by: Ben Horgan <ben.horgan@arm.com>
-Change-Id: Ic1344eb2c982c195210dc2c86aa6845f3e037077
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- src/api.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/api.c b/src/api.c
-index 00c4d44..33a9b42 100644
---- a/src/api.c
-+++ b/src/api.c
-@@ -2021,6 +2021,7 @@ struct ffa_value api_ffa_features(uint32_t feature=
_function_id)
- 	case FFA_MEM_PERM_SET_32:
- 	case FFA_MEM_PERM_GET_64:
- 	case FFA_MEM_PERM_SET_64:
-+	case FFA_SECONDARY_EP_REGISTER_64:
- #endif
- 		return (struct ffa_value){.func =3D FFA_SUCCESS_32};
-=20
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0006-tc-increase-h=
eap-pages.patch b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-tc-incre=
ase-heap-pages.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/hafnium/files/tc/0006-tc-increase-he=
ap-pages.patch
rename to meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-tc-increase-heap=
-pages.patch
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0005-Revert-fix-ff=
-a-check-receiver-s-attributes-on-memor.patch b/meta-arm-bsp/recipes-bsp/=
hafnium/files/tc/0005-Revert-fix-ff-a-check-receiver-s-attributes-on-memo=
r.patch
deleted file mode 100644
index e5f9489e..00000000
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0005-Revert-fix-ff-a-chec=
k-receiver-s-attributes-on-memor.patch
+++ /dev/null
@@ -1,318 +0,0 @@
-From 64d5628c8439e4649e9c1da9b9e02ebd5c7fb8cf Mon Sep 17 00:00:00 2001
-From: Ben Horgan <ben.horgan@arm.com>
-Date: Thu, 28 Apr 2022 15:53:31 +0000
-Subject: [PATCH 5/5] Revert "fix(ff-a): check receiver's attributes on m=
emory
- retrieve"
-
-This reverts commit a98603aa965e3ff3ca5383249213e2fd1a96d850.
-
-Change-Id: Ia71ce3ac52e9b2e85578372c24eb8d593b62435f
-Signed-off-by: Ben Horgan <ben.horgan@arm.com>
----
- src/ffa_memory.c                              | 76 ++++++-----------
- test/vmapi/el0_partitions/memory_sharing.c    | 81 -------------------
- .../primary_with_secondaries/memory_sharing.c | 81 -------------------
- 3 files changed, 25 insertions(+), 213 deletions(-)
-
-diff --git a/src/ffa_memory.c b/src/ffa_memory.c
-index ab47929..2fcc386 100644
---- a/src/ffa_memory.c
-+++ b/src/ffa_memory.c
-@@ -1344,42 +1344,6 @@ static struct ffa_value ffa_memory_send_complete(
- 	return ffa_mem_success(share_state->memory_region->handle);
- }
-=20
--/**
-- * Check that the memory attributes match Hafnium expectations:
-- * Normal Memory, Inner shareable, Write-Back Read-Allocate
-- * Write-Allocate Cacheable.
-- */
--static struct ffa_value ffa_memory_attributes_validate(
--	ffa_memory_access_permissions_t attributes)
--{
--	enum ffa_memory_type memory_type;
--	enum ffa_memory_cacheability cacheability;
--	enum ffa_memory_shareability shareability;
--
--	memory_type =3D ffa_get_memory_type_attr(attributes);
--	if (memory_type !=3D FFA_MEMORY_NORMAL_MEM) {
--		dlog_verbose("Invalid memory type %#x, expected %#x.\n",
--			     memory_type, FFA_MEMORY_NORMAL_MEM);
--		return ffa_error(FFA_DENIED);
--	}
--
--	cacheability =3D ffa_get_memory_cacheability_attr(attributes);
--	if (cacheability !=3D FFA_MEMORY_CACHE_WRITE_BACK) {
--		dlog_verbose("Invalid cacheability %#x, expected %#x.\n",
--			     cacheability, FFA_MEMORY_CACHE_WRITE_BACK);
--		return ffa_error(FFA_DENIED);
--	}
--
--	shareability =3D ffa_get_memory_shareability_attr(attributes);
--	if (shareability !=3D FFA_MEMORY_INNER_SHAREABLE) {
--		dlog_verbose("Invalid shareability %#x, expected #%x.\n",
--			     shareability, FFA_MEMORY_INNER_SHAREABLE);
--		return ffa_error(FFA_DENIED);
--	}
--
--	return (struct ffa_value){.func =3D FFA_SUCCESS_32};
--}
--
- /**
-  * Check that the given `memory_region` represents a valid memory send =
request
-  * of the given `share_func` type, return the clear flag and permission=
s via the
-@@ -1400,7 +1364,10 @@ static struct ffa_value ffa_memory_send_validate(
- 	uint32_t constituents_length;
- 	enum ffa_data_access data_access;
- 	enum ffa_instruction_access instruction_access;
--	struct ffa_value ret;
-+	ffa_memory_access_permissions_t attributes;
-+	enum ffa_memory_type memory_type;
-+	enum ffa_memory_cacheability memory_cacheability;
-+	enum ffa_memory_shareability memory_shareability;
-=20
- 	assert(permissions !=3D NULL);
-=20
-@@ -1536,9 +1503,26 @@ static struct ffa_value ffa_memory_send_validate(
- 	 * Normal Memory, Inner shareable, Write-Back Read-Allocate
- 	 * Write-Allocate Cacheable.
- 	 */
--	ret =3D ffa_memory_attributes_validate(memory_region->attributes);
--	if (ret.func !=3D FFA_SUCCESS_32) {
--		return ret;
-+	attributes =3D memory_region->attributes;
-+	memory_type =3D ffa_get_memory_type_attr(attributes);
-+	if (memory_type !=3D FFA_MEMORY_NORMAL_MEM) {
-+		dlog_verbose("Invalid memory type %#x, expected %#x.\n",
-+			     memory_type, FFA_MEMORY_NORMAL_MEM);
-+		return ffa_error(FFA_INVALID_PARAMETERS);
-+	}
-+
-+	memory_cacheability =3D ffa_get_memory_cacheability_attr(attributes);
-+	if (memory_cacheability !=3D FFA_MEMORY_CACHE_WRITE_BACK) {
-+		dlog_verbose("Invalid cacheability %#x, expected %#x.\n",
-+			     memory_cacheability, FFA_MEMORY_CACHE_WRITE_BACK);
-+		return ffa_error(FFA_INVALID_PARAMETERS);
-+	}
-+
-+	memory_shareability =3D ffa_get_memory_shareability_attr(attributes);
-+	if (memory_shareability !=3D FFA_MEMORY_INNER_SHAREABLE) {
-+		dlog_verbose("Invalid shareability %#x, expected %#x.\n",
-+			     memory_shareability, FFA_MEMORY_INNER_SHAREABLE);
-+		return ffa_error(FFA_INVALID_PARAMETERS);
- 	}
-=20
- 	return (struct ffa_value){.func =3D FFA_SUCCESS_32};
-@@ -2376,6 +2360,7 @@ struct ffa_value ffa_memory_retrieve(struct vm_loc=
ked to_locked,
- 	 * Check permissions from sender against permissions requested by
- 	 * receiver.
- 	 */
-+	/* TODO: Check attributes too. */
- 	sent_permissions =3D
- 		memory_region->receivers[0].receiver_permissions.permissions;
- 	sent_data_access =3D ffa_get_data_access_attr(sent_permissions);
-@@ -2453,17 +2438,6 @@ struct ffa_value ffa_memory_retrieve(struct vm_lo=
cked to_locked,
- 		panic("Got unexpected FFA_INSTRUCTION_ACCESS_RESERVED. Should "
- 		      "be checked before this point.");
- 	}
--
--	/*
--	 * Ensure receiver's attributes are compatible with how Hafnium maps
--	 * memory: Normal Memory, Inner shareable, Write-Back Read-Allocate
--	 * Write-Allocate Cacheable.
--	 */
--	ret =3D ffa_memory_attributes_validate(retrieve_request->attributes);
--	if (ret.func !=3D FFA_SUCCESS_32) {
--		goto out;
--	}
--
- 	memory_to_attributes =3D ffa_memory_permissions_to_mode(
- 		permissions, share_state->sender_orig_mode);
- 	ret =3D ffa_retrieve_check_update(
-diff --git a/test/vmapi/el0_partitions/memory_sharing.c b/test/vmapi/el0=
_partitions/memory_sharing.c
-index 3756d7d..c29f029 100644
---- a/test/vmapi/el0_partitions/memory_sharing.c
-+++ b/test/vmapi/el0_partitions/memory_sharing.c
-@@ -2160,87 +2160,6 @@ TEST(memory_sharing, ffa_validate_retrieve_req_mb=
z)
- 	}
- }
-=20
--/**
-- * Memory can't be shared with arbitrary attributes because Hafnium map=
s pages
-- * with hardcoded values and doesn't support custom mappings.
-- */
--TEST(memory_sharing, ffa_validate_retrieve_req_attributes)
--{
--	struct ffa_value ret;
--	struct mailbox_buffers mb =3D set_up_mailbox();
--	uint32_t msg_size;
--	ffa_memory_handle_t handle;
--
--	struct ffa_value (*send_function[])(uint32_t, uint32_t) =3D {
--		ffa_mem_share,
--		ffa_mem_lend,
--	};
--
--	struct ffa_memory_region_constituent constituents[] =3D {
--		{.address =3D (uint64_t)pages, .page_count =3D 2},
--		{.address =3D (uint64_t)pages + PAGE_SIZE * 3, .page_count =3D 1},
--	};
--
--	SERVICE_SELECT(SERVICE_VM1, "ffa_memory_share_fail", mb.send);
--
--	struct {
--		enum ffa_memory_type memory_type;
--		enum ffa_memory_cacheability memory_cacheability;
--		enum ffa_memory_shareability memory_shareability;
--	} invalid_attributes[] =3D {
--		/* Invalid memory type */
--		{FFA_MEMORY_DEVICE_MEM, FFA_MEMORY_CACHE_WRITE_BACK,
--		 FFA_MEMORY_INNER_SHAREABLE},
--		/* Invalid cacheability */
--		{FFA_MEMORY_NORMAL_MEM, FFA_MEMORY_CACHE_NON_CACHEABLE,
--		 FFA_MEMORY_INNER_SHAREABLE},
--		/* Invalid shareability */
--		{FFA_MEMORY_NORMAL_MEM, FFA_MEMORY_CACHE_WRITE_BACK,
--		 FFA_MEMORY_SHARE_NON_SHAREABLE},
--		{FFA_MEMORY_NORMAL_MEM, FFA_MEMORY_CACHE_WRITE_BACK,
--		 FFA_MEMORY_OUTER_SHAREABLE}};
--
--	for (uint32_t i =3D 0; i < ARRAY_SIZE(send_function); i++) {
--		/* Prepare memory region, and set all flags */
--		EXPECT_EQ(ffa_memory_region_init(
--				  mb.send, HF_MAILBOX_SIZE, HF_PRIMARY_VM_ID,
--				  SERVICE_VM1, constituents,
--				  ARRAY_SIZE(constituents), 0, 0,
--				  FFA_DATA_ACCESS_RW,
--				  FFA_INSTRUCTION_ACCESS_NOT_SPECIFIED,
--				  FFA_MEMORY_NORMAL_MEM,
--				  FFA_MEMORY_CACHE_WRITE_BACK,
--				  FFA_MEMORY_INNER_SHAREABLE, NULL, &msg_size),
--			  0);
--
--		ret =3D send_function[i](msg_size, msg_size);
--		EXPECT_EQ(ret.func, FFA_SUCCESS_32);
--
--		handle =3D ffa_mem_success_handle(ret);
--
--		for (uint32_t j =3D 0; j < ARRAY_SIZE(invalid_attributes); ++j) {
--			msg_size =3D ffa_memory_retrieve_request_init(
--				mb.send, handle, HF_PRIMARY_VM_ID, SERVICE_VM1,
--				0, 0, FFA_DATA_ACCESS_RW,
--				FFA_INSTRUCTION_ACCESS_NOT_SPECIFIED,
--				invalid_attributes[j].memory_type,
--				invalid_attributes[j].memory_cacheability,
--				invalid_attributes[j].memory_shareability);
--
--			EXPECT_LE(msg_size, HF_MAILBOX_SIZE);
--
--			EXPECT_EQ(ffa_msg_send(HF_PRIMARY_VM_ID, SERVICE_VM1,
--					       msg_size, 0)
--					  .func,
--				  FFA_SUCCESS_32);
--
--			ffa_run(SERVICE_VM1, 0);
--		}
--
--		EXPECT_EQ(ffa_mem_reclaim(handle, 0).func, FFA_SUCCESS_32);
--	}
--}
--
- /**
-  * If memory is shared can't request zeroing of memory at both send and
-  * relinquish.
-diff --git a/test/vmapi/primary_with_secondaries/memory_sharing.c b/test=
/vmapi/primary_with_secondaries/memory_sharing.c
-index 6080709..4bcf252 100644
---- a/test/vmapi/primary_with_secondaries/memory_sharing.c
-+++ b/test/vmapi/primary_with_secondaries/memory_sharing.c
-@@ -2307,87 +2307,6 @@ TEST(memory_sharing, ffa_validate_retrieve_req_mb=
z)
- 	}
- }
-=20
--/**
-- * Memory can't be shared with arbitrary attributes because Hafnium map=
s pages
-- * with hardcoded values and doesn't support custom mappings.
-- */
--TEST(memory_sharing, ffa_validate_retrieve_req_attributes)
--{
--	struct ffa_value ret;
--	struct mailbox_buffers mb =3D set_up_mailbox();
--	uint32_t msg_size;
--	ffa_memory_handle_t handle;
--
--	struct ffa_value (*send_function[])(uint32_t, uint32_t) =3D {
--		ffa_mem_share,
--		ffa_mem_lend,
--	};
--
--	struct ffa_memory_region_constituent constituents[] =3D {
--		{.address =3D (uint64_t)pages, .page_count =3D 2},
--		{.address =3D (uint64_t)pages + PAGE_SIZE * 3, .page_count =3D 1},
--	};
--
--	SERVICE_SELECT(SERVICE_VM1, "ffa_memory_share_fail_denied", mb.send);
--
--	struct {
--		enum ffa_memory_type memory_type;
--		enum ffa_memory_cacheability memory_cacheability;
--		enum ffa_memory_shareability memory_shareability;
--	} invalid_attributes[] =3D {
--		/* Invalid memory type */
--		{FFA_MEMORY_DEVICE_MEM, FFA_MEMORY_CACHE_WRITE_BACK,
--		 FFA_MEMORY_INNER_SHAREABLE},
--		/* Invalid cacheability */
--		{FFA_MEMORY_NORMAL_MEM, FFA_MEMORY_CACHE_NON_CACHEABLE,
--		 FFA_MEMORY_INNER_SHAREABLE},
--		/* Invalid shareability */
--		{FFA_MEMORY_NORMAL_MEM, FFA_MEMORY_CACHE_WRITE_BACK,
--		 FFA_MEMORY_SHARE_NON_SHAREABLE},
--		{FFA_MEMORY_NORMAL_MEM, FFA_MEMORY_CACHE_WRITE_BACK,
--		 FFA_MEMORY_OUTER_SHAREABLE}};
--
--	for (uint32_t i =3D 0; i < ARRAY_SIZE(send_function); i++) {
--		/* Prepare memory region, and set all flags */
--		EXPECT_EQ(ffa_memory_region_init(
--				  mb.send, HF_MAILBOX_SIZE, HF_PRIMARY_VM_ID,
--				  SERVICE_VM1, constituents,
--				  ARRAY_SIZE(constituents), 0, 0,
--				  FFA_DATA_ACCESS_RW,
--				  FFA_INSTRUCTION_ACCESS_NOT_SPECIFIED,
--				  FFA_MEMORY_NORMAL_MEM,
--				  FFA_MEMORY_CACHE_WRITE_BACK,
--				  FFA_MEMORY_INNER_SHAREABLE, NULL, &msg_size),
--			  0);
--
--		ret =3D send_function[i](msg_size, msg_size);
--		EXPECT_EQ(ret.func, FFA_SUCCESS_32);
--
--		handle =3D ffa_mem_success_handle(ret);
--
--		for (uint32_t j =3D 0; j < ARRAY_SIZE(invalid_attributes); ++j) {
--			msg_size =3D ffa_memory_retrieve_request_init(
--				mb.send, handle, HF_PRIMARY_VM_ID, SERVICE_VM1,
--				0, 0, FFA_DATA_ACCESS_RW,
--				FFA_INSTRUCTION_ACCESS_NOT_SPECIFIED,
--				invalid_attributes[j].memory_type,
--				invalid_attributes[j].memory_cacheability,
--				invalid_attributes[j].memory_shareability);
--
--			EXPECT_LE(msg_size, HF_MAILBOX_SIZE);
--
--			EXPECT_EQ(ffa_msg_send(HF_PRIMARY_VM_ID, SERVICE_VM1,
--					       msg_size, 0)
--					  .func,
--				  FFA_SUCCESS_32);
--
--			ffa_run(SERVICE_VM1, 0);
--		}
--
--		EXPECT_EQ(ffa_mem_reclaim(handle, 0).func, FFA_SUCCESS_32);
--	}
--}
--
- /**
-  * If memory is shared can't request zeroing of memory at both send and
-  * relinquish.
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc b/meta-arm-b=
sp/recipes-bsp/hafnium/hafnium-tc.inc
index c8f77dc6..9da9c117 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
+++ b/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
@@ -3,7 +3,10 @@
 COMPATIBLE_MACHINE =3D "(tc?)"
 HAFNIUM_PLATFORM =3D "secure_tc"
=20
-SRCREV =3D "4eb7b54348234d7f4bbac64bac28f683d6574ba9"
+# Intermediate SHA with 2.7 baseline version
+SRCREV =3D "dd0561820946fe23bcd57cc129140437f72102a5"
+PV =3D "2.7+git${SRCPV}"
+
 FILESEXTRAPATHS:prepend:tc :=3D "${THISDIR}/files/tc:"
=20
 SRC_URI:remove =3D " \
@@ -12,11 +15,8 @@ SRC_URI:remove =3D " \
=20
 SRC_URI:append =3D " \
         file://0001-feat-emulate-cntp-timer-register-accesses-using-cnth=
.patch \
-        file://0002-fix-ff-a-Use-FFA_INTERRUPT-to-signal-an-interrupted-=
.patch \
-        file://0003-fix-ff-a-Add-FFA_SECONDARY_EP_REGISTER_64-to-list-of=
.patch \
-        file://0004-feat-emulate-interrupt-controller-register-access.pa=
tch \
-        file://0005-Revert-fix-ff-a-check-receiver-s-attributes-on-memor=
.patch \
-        file://0006-tc-increase-heap-pages.patch \
+        file://0002-feat-emulate-interrupt-controller-register-access.pa=
tch \
+        file://0003-tc-increase-heap-pages.patch \
         "
=20
 do_compile() {
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/pkg-config-native.patch=
 b/meta-arm/recipes-bsp/hafnium/hafnium/pkg-config-native.patch
index bc031956..cccf28a1 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium/pkg-config-native.patch
+++ b/meta-arm/recipes-bsp/hafnium/hafnium/pkg-config-native.patch
@@ -4,17 +4,17 @@ Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
=20
 diff --git a/scripts/Makefile b/scripts/Makefile
-index b4b7d8b58..26a5160ee 100644
+index 9adb6d247..5fe371c7d 100644
 --- a/third_party/linux/scripts/Makefile
 +++ b/third_party/linux/scripts/Makefile
-@@ -10,8 +10,8 @@
-
- HOST_EXTRACFLAGS +=3D -I$(srctree)/tools/include
-
+@@ -3,8 +3,8 @@
+ # scripts contains sources for various helper programs used throughout
+ # the kernel for the build process.
+=20
 -CRYPTO_LIBS =3D $(shell pkg-config --libs libcrypto 2> /dev/null || ech=
o -lcrypto)
 -CRYPTO_CFLAGS =3D $(shell pkg-config --cflags libcrypto 2> /dev/null)
 +CRYPTO_LIBS =3D $(shell pkg-config-native --libs libcrypto 2> /dev/null=
 || echo -lcrypto)
 +CRYPTO_CFLAGS =3D $(shell pkg-config-native --cflags libcrypto 2> /dev/=
null)
-
- hostprogs-$(CONFIG_BUILD_BIN2C)  +=3D bin2c
- hostprogs-$(CONFIG_KALLSYMS)     +=3D kallsyms
+=20
+ hostprogs-always-$(CONFIG_BUILD_BIN2C)			+=3D bin2c
+ hostprogs-always-$(CONFIG_KALLSYMS)			+=3D kallsyms
--=20
2.34.1


