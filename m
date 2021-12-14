Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95FA2C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 11:07:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.24307.1639480061755950526
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 03:07:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64D50106F;
	Tue, 14 Dec 2021 03:07:41 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.34.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B9C43F5A1;
	Tue, 14 Dec 2021 03:07:40 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Satish Kumar <satish.kumar01@arm.com>
Subject: [PATCH 1/9] arm-bsp/secure-partitions: fixes required to run
 psa-arch-test
Date: Tue, 14 Dec 2021 11:07:23 +0000
Message-Id: <20211214110731.9081-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211214110731.9081-1-abdellatif.elkhlifi@arm.com>
References: <20211214110731.9081-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Dec 2021 11:07:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2679

From: Satish Kumar <satish.kumar01@arm.com>

Fixes needed to run psa-arch-test

Change-Id: Iba090e151298a216f8f1bf81a72bba4587bec389
Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
---
 .../0019-Run-psa-arch-test.patch              | 87 +++++++++++++++++++
 .../trusted-services/ts-corstone1000.inc      |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0019-Run-psa-arch-test.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0019-Run-psa-arch-test.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0019-Run-psa-arch-test.patch
new file mode 100644
index 0000000..f471d33
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0019-Run-psa-arch-test.patch
@@ -0,0 +1,87 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+From 0059e7e18bff28a29c4f8a043d7f3d6d2b98ba7f Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Sun, 12 Dec 2021 10:43:48 +0000
+Subject: [PATCH 1/5] Run psa-arch-test
+
+Fixes needed to run psa-arch-test
+
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+---
+ components/service/common/psa_ipc/service_psa_ipc.c       | 1 +
+ .../backend/secure_storage_ipc/secure_storage_ipc.c       | 8 --------
+ .../service/secure_storage/include/psa/storage_common.h   | 4 ++--
+ external/openamp/openamp.cmake                            | 2 +-
+ 4 files changed, 4 insertions(+), 11 deletions(-)
+
+diff --git a/components/service/common/psa_ipc/service_psa_ipc.c b/components/service/common/psa_ipc/service_psa_ipc.c
+index 95a07c1..5e5815d 100644
+--- a/components/service/common/psa_ipc/service_psa_ipc.c
++++ b/components/service/common/psa_ipc/service_psa_ipc.c
+@@ -185,6 +185,7 @@ psa_status_t psa_call(struct rpc_caller *caller, psa_handle_t psa_handle,
+ 						     resp_msg->params.out_vec);
+ 
+ 	for (i = 0; i < resp_msg->params.out_len; i++) {
++                out_vec[i].len = out_vec_param[i].len;
+ 		memcpy(out_vec[i].base, rpc_caller_phys_to_virt(caller, out_vec_param[i].base),
+ 		       out_vec[i].len);
+ 	}
+diff --git a/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
+index 9b55f77..a1f369d 100644
+--- a/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
++++ b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
+@@ -31,10 +31,6 @@ static psa_status_t secure_storage_ipc_set(void *context, uint32_t client_id,
+ 
+ 	ipc->client.rpc_status = TS_RPC_CALL_ACCEPTED;
+ 
+-	/* Validating input parameters */
+-	if (p_data == NULL)
+-		return PSA_ERROR_INVALID_ARGUMENT;
+-
+ 	psa_status = psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
+ 			      TFM_PS_SET, in_vec, IOVEC_LEN(in_vec), NULL, 0);
+ 	if (psa_status < 0)
+@@ -96,10 +92,6 @@ static psa_status_t secure_storage_ipc_get_info(void *context,
+ 
+ 	(void)client_id;
+ 
+-	/* Validating input parameters */
+-	if (!p_info)
+-		return PSA_ERROR_INVALID_ARGUMENT;
+-
+ 	psa_status = psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
+ 			      TFM_PS_GET_INFO, in_vec,
+ 			      IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
+diff --git a/components/service/secure_storage/include/psa/storage_common.h b/components/service/secure_storage/include/psa/storage_common.h
+index 4f6ba2a..1fd6b40 100644
+--- a/components/service/secure_storage/include/psa/storage_common.h
++++ b/components/service/secure_storage/include/psa/storage_common.h
+@@ -20,8 +20,8 @@ typedef uint64_t psa_storage_uid_t;
+ typedef uint32_t psa_storage_create_flags_t;
+ 
+ struct psa_storage_info_t {
+-	size_t capacity;
+-	size_t size;
++	uint32_t capacity;
++	uint32_t size;
+ 	psa_storage_create_flags_t flags;
+ };
+ 
+diff --git a/external/openamp/openamp.cmake b/external/openamp/openamp.cmake
+index aae13ba..75ab229 100644
+--- a/external/openamp/openamp.cmake
++++ b/external/openamp/openamp.cmake
+@@ -61,7 +61,7 @@ execute_process(COMMAND
+ 			-DCMAKE_SYSTEM_PROCESSOR=arm
+ 			-DEXTERNAL_INCLUDE_PATHS=${OPENAMP_EXTERNAL_INCLUDE_PATHS}
+ 			-DMACHINE=template
+-			-DRPMSG_BUFFER_SIZE=512
++			-DRPMSG_BUFFER_SIZE=8192
+ 			${openamp_SOURCE_DIR}
+ 	WORKING_DIRECTORY
+ 			${openamp_BINARY_DIR}
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
index e7165d5..80cc8dc 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -29,6 +29,7 @@ SRC_URI:append = " \
                   file://0016-Add-uefi-test-deployment.patch \
                   file://0017-Fix-interface-ID-parameter-setting-in-sp-ffarpc_call.patch \
                   file://0018-Support-FFARPC-call-requests-with-no-shared-buffer.patch \
+                  file://0019-Run-psa-arch-test.patch \
                   "
 
 SRC_URI_MBED = "git://github.com/ARMmbed/mbed-crypto.git;protocol=https;branch=development;name=mbed;destsuffix=git/mbedcrypto"
-- 
2.17.1


