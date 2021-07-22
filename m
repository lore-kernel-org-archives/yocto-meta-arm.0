Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.4944.1626940330320246936
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Jul 2021 00:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=SSdwyogI;
 spf=pass (domain: linaro.org, ip: 209.85.216.54, mailfrom: sumit.garg@linaro.org)
Received: by mail-pj1-f54.google.com with SMTP id pf12-20020a17090b1d8cb0290175c085e7a5so3130895pjb.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 22 Jul 2021 00:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=my7muHxY/xgZvWx8DuKI18x8NrlIeAmGgLbbTJ1lUUk=;
        b=SSdwyogIQR1HokOv+2xQibhiWWAXPwnuU9JMQ6GvpJ3osrsv7erwY+tj6Gd3DdKVy8
         nUtoCAbH7NgiTTtFq1eyI3H0cN+i4NCoE7RBoqwQVrqWozeUx7rmeJOl/2+W5Bdyia7M
         DSjqhe1ZJqDYuc5bmtlelAZ3gR1aULwAjlYzX9A3UbpNljmF2tL/KY74T9OnQLQUC+yA
         SwDgUiaWy95d62xb5xAor13KNrc8CGI4Z8m6GK8eLFkANhYLhLojvZZTBd6VZEJ0jwP7
         wsy97MbdROG31ydvMvJCHqbCL/JONA7y0zCQcSFZi/D9J7ED2fceBsNp4/E3lPfAqDn2
         3Y1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=my7muHxY/xgZvWx8DuKI18x8NrlIeAmGgLbbTJ1lUUk=;
        b=skAdl+H51h00ytDjjildoBfIBQXK0gF+sjGjUUij6Sr2kStGgHgTDTGDdPw8PsLXca
         wTmD2qmZYuOkB3jR3pPryYULX0bj5HJ/RuCGPMIbENud/maJoD+2xK5doqCb+Tr4l2WZ
         Rj9QFA0Ckln06zVXk4LG+I/oQG9bOktBHEY45/oCESs8gPf2KZJpV8+D8Q3f26Wl3tIX
         s37Je/FryP2NabPuzS1EVhIwEKd+lg4rYk2ZnBqrbyCUGKe5TY6f+Sc0m9/EJn2VhUQl
         6zQKV2uxYgUQ/9aqCaiZL82Oz/alXhrVB/geKfEUtFfeOkq8FMVC11aOpyJcnHVyJ3mR
         9TZg==
X-Gm-Message-State: AOAM532gOhW8J3zyinaHOMcINS5K6gayqQLh2d5ZzL3m7eww3rc3yOX2
	Z9DXrWnS4mOOeBCUDtbKAz8wHbFUpn2m5A==
X-Google-Smtp-Source: ABdhPJyLBsYQgY+jg6+hWAi55gDGxjY3wlPN/YLSKptPZ1H7MIkQSrsXiVhQRxU8nGqdWQKdSN7tFw==
X-Received: by 2002:a62:1b58:0:b029:33a:e814:312d with SMTP id b85-20020a621b580000b029033ae814312dmr28831904pfb.62.1626940328435;
        Thu, 22 Jul 2021 00:52:08 -0700 (PDT)
Return-Path: <sumit.garg@linaro.org>
Received: from localhost.localdomain ([223.178.210.84])
        by smtp.gmail.com with ESMTPSA id x18sm28015912pfh.48.2021.07.22.00.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 00:52:07 -0700 (PDT)
From: "Sumit Garg" <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	arunachalam.ganapathy@arm.com,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [RFT] arm-bsp/tc0: Migrate to OP-TEE v3.14.0
Date: Thu, 22 Jul 2021 13:21:46 +0530
Message-Id: <20210722075146.1105757-1-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support for plat-totalcompute was recently merged in upstream OP-TEE
[1]. On that basis migrate to OP-TEE v3.14.0.

[1] https://github.com/OP-TEE/optee_os/pull/4736

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---

This patch is only build tested as I don't have access to total compute
platform. Give it a try and let me know if I missed something.

 ...e-page-aligned-shared-memory-buffers.patch |  95 ---
 ...ore-SPMC-update-for-FF-A-version-1.0.patch |  50 --
 ...-arm-Total-Compute-platform-support.patch} |  43 +-
 .../tc0/0002-core-add-thread_smccc.patch      |  89 ---
 ...e-define-tzdram-start-address-for-S-.patch |  34 +
 ...e-enable-SPCI-with-SPM-Core-at-S-EL2.patch | 623 ------------------
 ...lcompute-Add-OP-TEE-SP-manifest-file.patch |  62 ++
 ...fixes-to-align-with-upstream-hafnium.patch | 188 ------
 ...alcompute-Add-support-for-S-EL2-SPMC.patch | 152 +++++
 ...alcompute-Add-support-for-S-EL2-SPMC.patch | 108 ---
 ...e-add-optee-manifest-file-and-sp-lay.patch |  73 --
 ...e-define-tzdram-start-address-for-S-.patch |  36 -
 ...totalcompute-add-Theodul-DSU-support.patch |  93 ---
 ...P-declare-device-regions-in-manifest.patch |  47 --
 ...TEE-SP-use-CNTVCT-in-place-of-CNTVCT.patch | 173 -----
 .../optee/optee-client-tc0.inc                |   5 -
 ....bbappend => optee-client_3.14.0.bbappend} |   0
 .../recipes-security/optee/optee-os-tc0.inc   |  34 +-
 ...11.0.bbappend => optee-os_3.14.0.bbappend} |   0
 .../recipes-security/optee/optee-test-tc0.inc |  11 -
 ....0.bbappend => optee-test_3.14.0.bbappend} |   0
 21 files changed, 274 insertions(+), 1642 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-client/tc0/0002-Allocate-page-aligned-shared-memory-buffers.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0001-core-SPMC-update-for-FF-A-version-1.0.patch
 rename meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/{0005-core-arm-Total-Compute-platform-support.patch => 0001-core-arm-Total-Compute-platform-support.patch} (83%)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0002-core-add-thread_smccc.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0002-plat-totalcompute-define-tzdram-start-address-for-S-.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0003-core-enable-SPCI-with-SPM-Core-at-S-EL2.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0003-plat-totalcompute-Add-OP-TEE-SP-manifest-file.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0004-core-fixes-to-align-with-upstream-hafnium.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0004-plat-totalcompute-Add-support-for-S-EL2-SPMC.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0006-plat-totalcompute-Add-support-for-S-EL2-SPMC.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0007-plat-totalcompute-add-optee-manifest-file-and-sp-lay.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0008-plat-totalcompute-define-tzdram-start-address-for-S-.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0009-plat-totalcompute-add-Theodul-DSU-support.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0010-WIP-OP-TEE-SP-declare-device-regions-in-manifest.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0011-WIP-OP-TEE-SP-use-CNTVCT-in-place-of-CNTVCT.patch
 rename meta-arm-bsp/recipes-security/optee/{optee-client_3.11.0.bbappend => optee-client_3.14.0.bbappend} (100%)
 rename meta-arm-bsp/recipes-security/optee/{optee-os_3.11.0.bbappend => optee-os_3.14.0.bbappend} (100%)
 rename meta-arm-bsp/recipes-security/optee/{optee-test_3.11.0.bbappend => optee-test_3.14.0.bbappend} (100%)

diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-client/tc0/0002-Allocate-page-aligned-shared-memory-buffers.patch b/meta-arm-bsp/recipes-security/optee/files/optee-client/tc0/0002-Allocate-page-aligned-shared-memory-buffers.patch
deleted file mode 100644
index 5928bfd..0000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-client/tc0/0002-Allocate-page-aligned-shared-memory-buffers.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-Upstream-Status: Pending [https://github.com/jenswi-linaro/optee_client/commit/7a67f8b7681ecf3abb5b09e5e320857d16f4a7e6]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From 7a67f8b7681ecf3abb5b09e5e320857d16f4a7e6 Mon Sep 17 00:00:00 2001
-From: Jens Wiklander <jens.wiklander@linaro.org>
-Date: Mon, 16 Nov 2020 17:34:07 +0100
-Subject: [PATCH 2/2] Allocate page aligned shared memory buffers
-
-Allocate page aligned shared memory buffer guarantee that each shared
-memory buffer doesn't accidentally share a page of memory or they may
-become aliased when mapped in secure world. This is normally not a big
-problem but may make it a bit harder to track down buffer overruns in
-shared memory buffers.
-
-In a post Arm v8.4 architecture with FF-A [1] there's trouble since it's
-not permitted to share the same physical page twice.
-
-Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
----
- libteec/src/tee_client_api.c        | 14 ++++++++++++--
- tee-supplicant/src/tee_supplicant.c | 12 +++++++++++-
- 2 files changed, 23 insertions(+), 3 deletions(-)
-
-diff --git a/libteec/src/tee_client_api.c b/libteec/src/tee_client_api.c
-index b8ccdfa..676d373 100644
---- a/libteec/src/tee_client_api.c
-+++ b/libteec/src/tee_client_api.c
-@@ -74,6 +74,16 @@ static void teec_mutex_unlock(pthread_mutex_t *mu)
- 	pthread_mutex_unlock(mu);
- }
- 
-+static void *teec_paged_aligned_alloc(size_t sz)
-+{
-+	void *p = NULL;
-+
-+	if (!posix_memalign(&p, sysconf(_SC_PAGESIZE), sz))
-+		return p;
-+
-+	return NULL;
-+}
-+
- static int teec_open_dev(const char *devname, const char *capabilities,
- 			 uint32_t *gen_caps)
- {
-@@ -790,7 +800,7 @@ TEEC_Result TEEC_RegisterSharedMemory(TEEC_Context *ctx, TEEC_SharedMemory *shm)
- 		 * we're not making matters worse by trying to allocate and
- 		 * register a shadow buffer before giving up.
- 		 */
--		shm->shadow_buffer = malloc(s);
-+		shm->shadow_buffer = teec_paged_aligned_alloc(s);
- 		if (!shm->shadow_buffer)
- 			return TEEC_ERROR_OUT_OF_MEMORY;
- 		fd = teec_shm_register(ctx->fd, shm->shadow_buffer, s,
-@@ -873,7 +883,7 @@ TEEC_Result TEEC_AllocateSharedMemory(TEEC_Context *ctx, TEEC_SharedMemory *shm)
- 		s = 8;
- 
- 	if (ctx->reg_mem) {
--		shm->buffer = malloc(s);
-+		shm->buffer = teec_paged_aligned_alloc(s);
- 		if (!shm->buffer)
- 			return TEEC_ERROR_OUT_OF_MEMORY;
- 
-diff --git a/tee-supplicant/src/tee_supplicant.c b/tee-supplicant/src/tee_supplicant.c
-index 94cf382..d590c2b 100644
---- a/tee-supplicant/src/tee_supplicant.c
-+++ b/tee-supplicant/src/tee_supplicant.c
-@@ -127,6 +127,16 @@ static size_t num_waiters_dec(struct thread_arg *arg)
- 	return ret;
- }
- 
-+static void *paged_aligned_alloc(size_t sz)
-+{
-+	void *p = NULL;
-+
-+	if (!posix_memalign(&p, sysconf(_SC_PAGESIZE), sz))
-+		return p;
-+
-+	return NULL;
-+}
-+
- static int get_value(size_t num_params, struct tee_ioctl_param *params,
- 		     const uint32_t idx, struct param_value **value)
- {
-@@ -336,7 +346,7 @@ static struct tee_shm *register_local_shm(int fd, size_t size)
- 
- 	memset(&data, 0, sizeof(data));
- 
--	buf = malloc(size);
-+	buf = paged_aligned_alloc(size);
- 	if (!buf)
- 		return NULL;
- 
--- 
-2.26.2
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0001-core-SPMC-update-for-FF-A-version-1.0.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0001-core-SPMC-update-for-FF-A-version-1.0.patch
deleted file mode 100644
index d3b2319..0000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0001-core-SPMC-update-for-FF-A-version-1.0.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-Upstream-Status: Pending [https://github.com/jenswi-linaro/optee_os/commit/7c3b052b871420618a08402f626923fe85a139db]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From 7c3b052b871420618a08402f626923fe85a139db Mon Sep 17 00:00:00 2001
-From: Marc Bonnici <marc.bonnici@arm.com>
-Date: Wed, 23 Sep 2020 13:55:22 +0100
-Subject: [PATCH 1/3] core: SPMC: update for FF-A version 1.0
-
-Update expected memory attributes. As per the FF-A spec (5.11.3)  a
-lender of a memory region should not specify the instruction access
-permission, therefore update the expected memory attribute.
-
-Updates the version number to 1.0 replacing the previous version number
-0.9.
----
- core/arch/arm/include/optee_ffa.h  | 4 ++--
- core/arch/arm/kernel/thread_spmc.c | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/core/arch/arm/include/optee_ffa.h b/core/arch/arm/include/optee_ffa.h
-index 8498fbab..9daca732 100644
---- a/core/arch/arm/include/optee_ffa.h
-+++ b/core/arch/arm/include/optee_ffa.h
-@@ -27,8 +27,8 @@
-  * w3-w7: Implementation defined, free to be used below
-  */
- 
--#define OPTEE_FFA_VERSION_MAJOR	UINT32_C(0)
--#define OPTEE_FFA_VERSION_MINOR	UINT32_C(9)
-+#define OPTEE_FFA_VERSION_MAJOR	UINT32_C(1)
-+#define OPTEE_FFA_VERSION_MINOR	UINT32_C(0)
- 
- #define OPTEE_FFA_BLOCKING_CALL(id)	UINT32_C(id)
- #define OPTEE_FFA_YIELDING_CALL_BIT	31
-diff --git a/core/arch/arm/kernel/thread_spmc.c b/core/arch/arm/kernel/thread_spmc.c
-index 81edf03a..16f3bbe1 100644
---- a/core/arch/arm/kernel/thread_spmc.c
-+++ b/core/arch/arm/kernel/thread_spmc.c
-@@ -433,7 +433,7 @@ static int mem_share_init(void *buf, size_t blen, unsigned int *page_count,
- {
- 	struct mem_region_descr *region_descr = NULL;
- 	struct mem_transaction_descr *descr = NULL;
--	const uint8_t exp_mem_acc_perm = 0x6; /* Not executable, Read-write */
-+	const uint8_t exp_mem_acc_perm = 0x2; /* Read-write */
- 	/* Normal memory, Write-Back cacheable, Inner shareable */
- 	const uint8_t exp_mem_reg_attr = 0x2f;
- 	unsigned int num_mem_accs = 0;
--- 
-2.26.2
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0005-core-arm-Total-Compute-platform-support.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0001-core-arm-Total-Compute-platform-support.patch
similarity index 83%
rename from meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0005-core-arm-Total-Compute-platform-support.patch
rename to meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0001-core-arm-Total-Compute-platform-support.patch
index 52270ec..d329790 100644
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0005-core-arm-Total-Compute-platform-support.patch
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0001-core-arm-Total-Compute-platform-support.patch
@@ -1,10 +1,7 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From 0c427d7f164a46862f6267b616d4ade28865b57a Mon Sep 17 00:00:00 2001
+From 37e9518efd62699a31cf51c09f4ef1f07b83f163 Mon Sep 17 00:00:00 2001
 From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Date: Wed, 15 Jul 2020 12:51:04 +0100
-Subject: [PATCH 2/5] core: arm: Total Compute platform support
+Date: Wed, 7 Jul 2021 16:52:29 +0100
+Subject: [PATCH 1/4] core: arm: Total Compute platform support
 
 Initial support for Total Compute platform[1]
     - defines tc0 platform configuration
@@ -13,14 +10,16 @@ Initial support for Total Compute platform[1]
 
 Link: [1] https://community.arm.com/developer/tools-software/oss-platforms/w/docs/606/total-compute
 
-Change-Id: Icddafbdfac40bb6ff3c367910acf632688343721
+Upstream-Status: Merged [https://github.com/OP-TEE/optee_os/pull/4736]
+
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
 ---
  core/arch/arm/plat-totalcompute/conf.mk       | 32 +++++++++++
- core/arch/arm/plat-totalcompute/main.c        | 55 +++++++++++++++++++
- .../arm/plat-totalcompute/platform_config.h   | 43 +++++++++++++++
+ core/arch/arm/plat-totalcompute/main.c        | 54 +++++++++++++++++++
+ .../arm/plat-totalcompute/platform_config.h   | 42 +++++++++++++++
  core/arch/arm/plat-totalcompute/sub.mk        |  2 +
- 4 files changed, 132 insertions(+)
+ 4 files changed, 130 insertions(+)
  create mode 100644 core/arch/arm/plat-totalcompute/conf.mk
  create mode 100644 core/arch/arm/plat-totalcompute/main.c
  create mode 100644 core/arch/arm/plat-totalcompute/platform_config.h
@@ -28,7 +27,7 @@ Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 
 diff --git a/core/arch/arm/plat-totalcompute/conf.mk b/core/arch/arm/plat-totalcompute/conf.mk
 new file mode 100644
-index 00000000..4fe894c7
+index 00000000..ba78f2a5
 --- /dev/null
 +++ b/core/arch/arm/plat-totalcompute/conf.mk
 @@ -0,0 +1,32 @@
@@ -56,7 +55,7 @@ index 00000000..4fe894c7
 +endif
 +
 +ifeq ($(PLATFORM_FLAVOR),tc0)
-+CFG_TEE_CORE_NB_CORE = 4
++CFG_TEE_CORE_NB_CORE = 8
 +
 +CFG_TZDRAM_START ?= 0xff000000
 +CFG_TZDRAM_SIZE  ?= 0x01000000
@@ -66,14 +65,13 @@ index 00000000..4fe894c7
 +endif
 diff --git a/core/arch/arm/plat-totalcompute/main.c b/core/arch/arm/plat-totalcompute/main.c
 new file mode 100644
-index 00000000..e775abfc
+index 00000000..6819b928
 --- /dev/null
 +++ b/core/arch/arm/plat-totalcompute/main.c
-@@ -0,0 +1,55 @@
+@@ -0,0 +1,54 @@
++// SPDX-License-Identifier: BSD-2-Clause
 +/*
-+ * Copyright (c) 2020, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
++ * Copyright (c) 2021, Arm Limited. All rights reserved.
 + */
 +
 +#include <arm.h>
@@ -127,14 +125,13 @@ index 00000000..e775abfc
 +}
 diff --git a/core/arch/arm/plat-totalcompute/platform_config.h b/core/arch/arm/plat-totalcompute/platform_config.h
 new file mode 100644
-index 00000000..dfc58857
+index 00000000..ee005e66
 --- /dev/null
 +++ b/core/arch/arm/plat-totalcompute/platform_config.h
-@@ -0,0 +1,43 @@
+@@ -0,0 +1,42 @@
++/* SPDX-License-Identifier: BSD-2-Clause */
 +/*
-+ * Copyright (c) 2020, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
++ * Copyright (c) 2021, Arm Limited. All rights reserved.
 + */
 +
 +#ifndef PLATFORM_CONFIG_H
@@ -183,5 +180,5 @@ index 00000000..8ddc2fd4
 +global-incdirs-y += .
 +srcs-y += main.c
 -- 
-2.26.2
+2.25.1
 
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0002-core-add-thread_smccc.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0002-core-add-thread_smccc.patch
deleted file mode 100644
index 32a420e..0000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0002-core-add-thread_smccc.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-Upstream-Status: Pending [https://github.com/jenswi-linaro/optee_os/commit/269e226eea2b2f26a6f844b7d25bc2b2a9b26315]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From 269e226eea2b2f26a6f844b7d25bc2b2a9b26315 Mon Sep 17 00:00:00 2001
-From: Jens Wiklander <jens.wiklander@linaro.org>
-Date: Tue, 4 Feb 2020 17:30:55 +0100
-Subject: [PATCH 2/3] core: add thread_smccc()
-
-Adds the assembly function thread_smccc() which loads the first 8
-registers with the argument and executes an SMC or HVC instruction as
-appropriate. The result in the first 8 registers is then saved in the
-argument struct.
-
-Change-Id: Ie14154fb38de5ced3cfdebdb0bf19e48caaf2279
-Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
----
- core/arch/arm/include/kernel/thread.h |  1 +
- core/arch/arm/kernel/thread_a32.S     | 16 ++++++++++++++++
- core/arch/arm/kernel/thread_a64.S     | 15 +++++++++++++++
- 3 files changed, 32 insertions(+)
-
-diff --git a/core/arch/arm/include/kernel/thread.h b/core/arch/arm/include/kernel/thread.h
-index b9c0ba4b..4f0520e9 100644
---- a/core/arch/arm/include/kernel/thread.h
-+++ b/core/arch/arm/include/kernel/thread.h
-@@ -704,6 +704,7 @@ uint32_t thread_rpc_cmd(uint32_t cmd, size_t num_params,
- 
- unsigned long thread_smc(unsigned long func_id, unsigned long a1,
- 			 unsigned long a2, unsigned long a3);
-+void thread_smccc(struct thread_smc_args *arg_res);
- 
- /**
-  * Allocate data for payload buffers.
-diff --git a/core/arch/arm/kernel/thread_a32.S b/core/arch/arm/kernel/thread_a32.S
-index 199e90a9..75d85c32 100644
---- a/core/arch/arm/kernel/thread_a32.S
-+++ b/core/arch/arm/kernel/thread_a32.S
-@@ -210,6 +210,22 @@ FUNC thread_smc , :
- 	bx	lr
- END_FUNC thread_smc
- 
-+/* void thread_smccc(struct thread_smc_args *arg_res) */
-+FUNC thread_smccc , :
-+	push	{r4-r7}
-+	push	{r0, lr}
-+	ldm	r0, {r0-r7}
-+#ifdef CFG_CORE_SEL2_SPMC
-+	hvc	#0
-+#else
-+	smc	#0
-+#endif
-+	pop	{r12, lr}
-+	stm	r12, {r0-r7}
-+	pop	{r4-r7}
-+	bx	lr
-+END_FUNC thread_smccc
-+
- FUNC thread_init_vbar , :
- 	/* Set vector (VBAR) */
- 	write_vbar r0
-diff --git a/core/arch/arm/kernel/thread_a64.S b/core/arch/arm/kernel/thread_a64.S
-index 9ce31eb2..3e0f5115 100644
---- a/core/arch/arm/kernel/thread_a64.S
-+++ b/core/arch/arm/kernel/thread_a64.S
-@@ -65,6 +65,21 @@ FUNC thread_smc , :
- 	ret
- END_FUNC thread_smc
- 
-+/* void thread_smccc(struct thread_smc_args *arg_res) */
-+FUNC thread_smccc , :
-+	push	x0, xzr
-+	mov	x8, x0
-+	load_xregs x8, 0, 0, 7
-+#ifdef CFG_CORE_SEL2_SPMC
-+	hvc	#0
-+#else
-+	smc	#0
-+#endif
-+	pop	x8, xzr
-+	store_xregs x8, 0, 0, 7
-+	ret
-+END_FUNC thread_smccc
-+
- FUNC thread_init_vbar , :
- 	msr	vbar_el1, x0
- 	ret
--- 
-2.26.2
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0002-plat-totalcompute-define-tzdram-start-address-for-S-.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0002-plat-totalcompute-define-tzdram-start-address-for-S-.patch
new file mode 100644
index 0000000..c780bde
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0002-plat-totalcompute-define-tzdram-start-address-for-S-.patch
@@ -0,0 +1,34 @@
+From b50e1d8ead89293428bc3931e35ad83337a275d4 Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Wed, 7 Jul 2021 16:54:08 +0100
+Subject: [PATCH 2/4] plat-totalcompute: define tzdram start address for S-EL1
+ SPMC config
+
+Define TZDRAM_START for CFG_CORE_SEL1_SPMC config
+
+Upstream-Status: Merged [https://github.com/OP-TEE/optee_os/pull/4736]
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
+---
+ core/arch/arm/plat-totalcompute/conf.mk | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/core/arch/arm/plat-totalcompute/conf.mk b/core/arch/arm/plat-totalcompute/conf.mk
+index ba78f2a5..ab978053 100644
+--- a/core/arch/arm/plat-totalcompute/conf.mk
++++ b/core/arch/arm/plat-totalcompute/conf.mk
+@@ -24,6 +24,10 @@ endif
+ ifeq ($(PLATFORM_FLAVOR),tc0)
+ CFG_TEE_CORE_NB_CORE = 8
+ 
++ifeq ($(CFG_CORE_SEL1_SPMC),y)
++CFG_TZDRAM_START ?= 0xfd000000
++CFG_TZDRAM_SIZE  ?= 0x02000000
++else
+ CFG_TZDRAM_START ?= 0xff000000
+ CFG_TZDRAM_SIZE  ?= 0x01000000
+ 
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0003-core-enable-SPCI-with-SPM-Core-at-S-EL2.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0003-core-enable-SPCI-with-SPM-Core-at-S-EL2.patch
deleted file mode 100644
index c3967dc..0000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0003-core-enable-SPCI-with-SPM-Core-at-S-EL2.patch
+++ /dev/null
@@ -1,623 +0,0 @@
-Upstream-Status: Pending [https://github.com/jenswi-linaro/optee_os/commit/80f0ec4ba2af33584e99e917fa165b77028a511f]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From 80f0ec4ba2af33584e99e917fa165b77028a511f Mon Sep 17 00:00:00 2001
-From: Marc Bonnici <marc.bonnici@arm.com>
-Date: Fri, 5 Jun 2020 13:47:40 +0100
-Subject: [PATCH 3/3] core: enable SPCI with SPM Core at S-EL2
-
-This is a port of a pre-exisiting patch to support the case where
-the SPM Core is implementation at S-EL2, that is, in a secure hypervisor.
-This configuration is also know as "S-EL2 SPMC" in the FFA specification.
-
-Compile with CFG_CORE_SEL2_SPMC=y
-
-Note that this is an experimental feature, ABIs etc may have
-incompatible changes.
-
-Sqaushed in:
-	core: Update cookie to uint64 in S-EL2 code
-
-	As part of the update to FF-A 1.0 the globally
-	unique handle to identify a shared memory object is now 64
-	bits wide instead of 32. This commit updates the
-	remaining usage of 32 bit values.
-
-	core: Remove page count from S-EL2 code
-
-	The page count field has been dropped from upstream OP-TEE to
-	accommodate using a 64 bit handle in the same size message param struct,
-	therefore update our implementation to support this.
-
-	core: Update remaining FF-A structures to EAC
-
-	Update relinquish data structures and ABI invocations to the FFA
-	EAC spec
----
- core/arch/arm/arm.mk                   |   7 ++
- core/arch/arm/include/kernel/thread.h  |   6 +
- core/arch/arm/include/mm/mobj.h        |   6 +
- core/arch/arm/kernel/thread_spmc.c     | 164 ++++++++++++++++++++++++-
- core/arch/arm/kernel/thread_spmc_a64.S |   3 +-
- core/arch/arm/mm/mobj_ffa.c            | 104 +++++++++++-----
- core/arch/arm/plat-vexpress/conf.mk    |   5 +
- 7 files changed, 260 insertions(+), 35 deletions(-)
-
-diff --git a/core/arch/arm/arm.mk b/core/arch/arm/arm.mk
-index f495f3c9..7c5e8fb0 100644
---- a/core/arch/arm/arm.mk
-+++ b/core/arch/arm/arm.mk
-@@ -97,6 +97,13 @@ endif
- # changes
- ifeq ($(CFG_CORE_SEL1_SPMC),y)
- $(call force,CFG_CORE_FFA,y)
-+$(call force,CFG_CORE_SEL2_SPMC,n)
-+endif
-+# SPMC configuration "S-EL2 SPMC" where SPM Core is implemented at S-EL2,
-+# that is, the hypervisor sandboxing OP-TEE
-+ifeq ($(CFG_CORE_SEL2_SPMC),y)
-+$(call force,CFG_CORE_FFA,y)
-+$(call force,CFG_CORE_SEL1_SPMC,n)
- endif
- 
- # Unmaps all kernel mode code except the code needed to take exceptions
-diff --git a/core/arch/arm/include/kernel/thread.h b/core/arch/arm/include/kernel/thread.h
-index 4f0520e9..95f48589 100644
---- a/core/arch/arm/include/kernel/thread.h
-+++ b/core/arch/arm/include/kernel/thread.h
-@@ -759,6 +759,12 @@ enum thread_shm_cache_user {
- void *thread_rpc_shm_cache_alloc(enum thread_shm_cache_user user,
- 				 enum thread_shm_type shm_type,
- 				 size_t size, struct mobj **mobj);
-+
-+#if defined(CFG_CORE_SEL2_SPMC)
-+struct mobj_ffa *thread_spmc_populate_mobj_from_rx(uint64_t cookie);
-+void thread_spmc_relinquish(uint64_t memory_region_handle);
-+#endif
-+
- #endif /*__ASSEMBLER__*/
- 
- #endif /*KERNEL_THREAD_H*/
-diff --git a/core/arch/arm/include/mm/mobj.h b/core/arch/arm/include/mm/mobj.h
-index 2b9bd90c..3f820666 100644
---- a/core/arch/arm/include/mm/mobj.h
-+++ b/core/arch/arm/include/mm/mobj.h
-@@ -216,6 +216,12 @@ struct mobj_ffa *mobj_ffa_sel1_spmc_new(unsigned int num_pages);
- void mobj_ffa_sel1_spmc_delete(struct mobj_ffa *mobj);
- TEE_Result mobj_ffa_sel1_spmc_reclaim(uint64_t cookie);
- #endif
-+#ifdef CFG_CORE_SEL2_SPMC
-+struct mobj_ffa *mobj_ffa_sel2_spmc_new(uint64_t cookie,
-+                                        unsigned int num_pages);
-+void mobj_ffa_sel2_spmc_delete(struct mobj_ffa *mobj);
-+#endif
-+
- uint64_t mobj_ffa_get_cookie(struct mobj_ffa *mobj);
- TEE_Result mobj_ffa_add_pages_at(struct mobj_ffa *mobj, unsigned int *idx,
- 				 paddr_t pa, unsigned int num_pages);
-diff --git a/core/arch/arm/kernel/thread_spmc.c b/core/arch/arm/kernel/thread_spmc.c
-index 16f3bbe1..3d7dc035 100644
---- a/core/arch/arm/kernel/thread_spmc.c
-+++ b/core/arch/arm/kernel/thread_spmc.c
-@@ -7,6 +7,7 @@
- #include <assert.h>
- #include <ffa.h>
- #include <io.h>
-+#include <initcall.h>
- #include <kernel/interrupt.h>
- #include <kernel/panic.h>
- #include <kernel/spinlock.h>
-@@ -88,6 +89,18 @@ struct mem_frag_state {
- 
- static uint16_t my_sp_id = 0x8001;
- 
-+
-+/* Table 149: FFA_MEM_RELINQUISH. */
-+struct ffa_relinquish_descriptor {
-+       uint64_t handle;
-+       uint32_t flags;
-+       uint32_t endpoint_count;
-+       uint16_t endpoint_id_array[];
-+};
-+
-+/* Our VM ID is 0x8001, non-secure VM ID 0x0001 */
-+const uint32_t thread_spmc_target_info = 0x80010001;
-+
- /*
-  * If @rxtx_size is 0 RX/TX buffers are not mapped or initialized.
-  *
-@@ -101,8 +114,16 @@ static uint16_t my_sp_id = 0x8001;
-  * these buffers so we must always be careful when reading. while we hold
-  * the lock.
-  */
-+
-+#ifdef CFG_CORE_SEL2_SPMC
-+static uint8_t rx_buf[SMALL_PAGE_SIZE] __aligned(SMALL_PAGE_SIZE);
-+static uint8_t tx_buf[SMALL_PAGE_SIZE] __aligned(SMALL_PAGE_SIZE);
-+#else
- static void *rx_buf;
- static void *tx_buf;
-+#endif
-+
-+
- static unsigned int rxtx_size;
- static unsigned int rxtx_spinlock;
- static bool tx_buf_is_mine;
-@@ -127,6 +148,28 @@ static void set_args(struct thread_smc_args *args, uint32_t fid,
- 					  .a5 = w5, };
- }
- 
-+static int __maybe_unused
-+set_pages(struct constituent_address_range *regions, unsigned int num_regions,
-+	  unsigned int num_pages, struct mobj_ffa *mf)
-+{
-+	unsigned int n = 0;
-+	unsigned int idx = 0;
-+
-+	for (n = 0; n < num_regions; n++) {
-+		unsigned int page_count = READ_ONCE(regions[n].page_count);
-+		uint64_t addr = READ_ONCE(regions[n].address);
-+
-+		if (mobj_ffa_add_pages_at(mf, &idx, addr, page_count))
-+			return FFA_INVALID_PARAMETERS;
-+	}
-+
-+	if (idx != num_pages)
-+		return FFA_INVALID_PARAMETERS;
-+
-+	return 0;
-+}
-+
-+
- static void handle_version(struct thread_smc_args *args)
- {
- 	/*
-@@ -188,6 +231,7 @@ static void handle_features(struct thread_smc_args *args)
- 		 FFA_PARAM_MBZ, FFA_PARAM_MBZ, FFA_PARAM_MBZ);
- }
- 
-+#ifdef CFG_CORE_SEL1_SPMC
- static int map_buf(paddr_t pa, unsigned int sz, void **va_ret)
- {
- 	tee_mm_entry_t *mm = NULL;
-@@ -293,6 +337,7 @@ out:
- 	set_args(args, ret_fid, FFA_PARAM_MBZ, rc,
- 		 FFA_PARAM_MBZ, FFA_PARAM_MBZ, FFA_PARAM_MBZ);
- }
-+#endif
- 
- static void handle_rx_release(struct thread_smc_args *args)
- {
-@@ -408,6 +453,7 @@ static void handle_blocking_call(struct thread_smc_args *args)
- 	}
- }
- 
-+#if CFG_CORE_SEL1_SPMC
- static int get_acc_perms(struct mem_accsess_descr *mem_acc,
- 			 unsigned int num_mem_accs, uint8_t *acc_perms,
- 			 unsigned int *region_offs)
-@@ -531,7 +577,11 @@ static int add_mem_share_frag(struct mem_frag_state *s, void *buf, size_t flen)
- 
- 	SLIST_REMOVE(&frag_state_head, s, mem_frag_state, link);
- 	if (rc < 0)
-+#ifdef CFG_CORE_SEL2_SPMC
-+		mobj_ffa_sel2_spmc_delete(s->share.mf);
-+#else
- 		mobj_ffa_sel1_spmc_delete(s->share.mf);
-+#endif
- 	else
- 		mobj_ffa_push_to_inactive(s->share.mf);
- 	free(s);
-@@ -559,8 +609,8 @@ static int add_mem_share(tee_mm_entry_t *mm, void *buf, size_t blen,
- 			 sizeof(struct constituent_address_range), &n) ||
- 	    ADD_OVERFLOW(n, addr_range_offs, &n) || n > blen)
- 		return FFA_INVALID_PARAMETERS;
--
- 	share.mf = mobj_ffa_sel1_spmc_new(share.page_count);
-+
- 	if (!share.mf)
- 		return FFA_NO_MEMORY;
- 
-@@ -601,6 +651,7 @@ static int add_mem_share(tee_mm_entry_t *mm, void *buf, size_t blen,
- 	return 0;
- err:
- 	mobj_ffa_sel1_spmc_delete(share.mf);
-+
- 	return rc;
- }
- 
-@@ -809,6 +860,7 @@ static void handle_mem_reclaim(struct thread_smc_args *args)
- out:
- 	set_args(args, ret_fid, ret_val, 0, 0, 0, 0);
- }
-+#endif
- 
- /* Only called from assembly */
- void thread_spmc_msg_recv(struct thread_smc_args *args);
-@@ -822,6 +874,7 @@ void thread_spmc_msg_recv(struct thread_smc_args *args)
- 	case FFA_FEATURES:
- 		handle_features(args);
- 		break;
-+#if CFG_CORE_SEL1_SPMC
- #ifdef ARM64
- 	case FFA_RXTX_MAP_64:
- #endif
-@@ -831,6 +884,7 @@ void thread_spmc_msg_recv(struct thread_smc_args *args)
- 	case FFA_RXTX_UNMAP:
- 		handle_rxtx_unmap(args);
- 		break;
-+#endif
- 	case FFA_RX_RELEASE:
- 		handle_rx_release(args);
- 		break;
-@@ -847,6 +901,7 @@ void thread_spmc_msg_recv(struct thread_smc_args *args)
- 		else
- 			handle_blocking_call(args);
- 		break;
-+#if CFG_CORE_SEL1_SPMC
- #ifdef ARM64
- 	case FFA_MEM_SHARE_64:
- #endif
-@@ -859,6 +914,7 @@ void thread_spmc_msg_recv(struct thread_smc_args *args)
- 	case FFA_MEM_FRAG_TX:
- 		handle_mem_frag_tx(args);
- 		break;
-+#endif
- 	default:
- 		EMSG("Unhandled FFA function ID %#"PRIx32, (uint32_t)args->a0);
- 		set_args(args, FFA_ERROR, FFA_PARAM_MBZ, FFA_NOT_SUPPORTED,
-@@ -1185,3 +1241,109 @@ void thread_rpc_free_global_payload(struct mobj *mobj __unused)
- 
- 	assert(!cant_happen);
- }
-+
-+#ifdef CFG_CORE_SEL2_SPMC
-+static void spmc_rxtx_map(void)
-+{
-+	struct thread_smc_args args = {
-+		.a0 = FFA_RXTX_MAP_64,
-+		.a1 = (vaddr_t)tx_buf,
-+		.a2 = (vaddr_t)rx_buf,
-+		.a3 = 1,
-+	};
-+
-+	thread_smccc(&args);
-+	if (args.a0 == FFA_ERROR) {
-+		EMSG("ERROR rxtx map failed with error %ld\n", args.a2);
-+		panic();
-+	}
-+}
-+
-+static struct mem_transaction_descr *spmc_retrieve_req(uint64_t cookie)
-+{
-+	struct mem_transaction_descr *retrieve_region = (void *)tx_buf;
-+
-+	struct thread_smc_args args = {
-+		.a0 = FFA_MEM_RETRIEVE_REQ_64,
-+		.a1 =   sizeof(*retrieve_region),  	// Total Length
-+		.a2 =	sizeof(*retrieve_region),	// Frag Length == Total length
-+		.a3 =	0,				// Address, Using TX -> MBZ
-+		.a4 =   0 				// Using TX -> MBZ
-+	};
-+
-+	/* TODO pass all the information required by the spec */
-+	memset(retrieve_region, 0, sizeof(*retrieve_region));
-+	retrieve_region->global_handle = cookie;
-+
-+	thread_smccc(&args);
-+	if (args.a0 == FFA_ERROR /*TODO != FFA_MEM_RETRIEVE_RESP_64 */) {
-+		EMSG("Failed to fetch cookie %#"PRIx64, cookie);
-+		return NULL;
-+	}
-+
-+	return (void *)rx_buf;
-+}
-+
-+void thread_spmc_relinquish(uint64_t cookie)
-+{
-+	struct ffa_relinquish_descriptor *relinquish_desc = (void *)tx_buf;
-+
-+	struct thread_smc_args args = {
-+		.a0 = FFA_MEM_RELINQUISH,
-+	};
-+
-+	memset(relinquish_desc, 0, sizeof(*relinquish_desc));
-+	relinquish_desc->handle = cookie;
-+	relinquish_desc->flags = 0;
-+	/* TODO: Add endpoint details. */
-+	thread_smccc(&args);
-+	if (args.a0 != FFA_SUCCESS_32)
-+		EMSG("Failed to relinquish cookie %#"PRIx64, cookie);
-+}
-+
-+struct mobj_ffa *thread_spmc_populate_mobj_from_rx(uint64_t cookie)
-+{
-+	struct mem_transaction_descr *retrieve_desc;
-+	struct mem_region_descr *descr;
-+	struct mobj_ffa *mf;
-+	uint32_t num_pages;
-+
-+
-+	/* XXX Support single mem_region. */
-+	retrieve_desc = spmc_retrieve_req(cookie);
-+
-+	if (!retrieve_desc) {
-+	    EMSG("Failed to retrieve cookie from rx buffer %#"PRIx64, cookie);
-+	    return NULL;
-+	}
-+
-+	descr = (struct mem_region_descr *)
-+			((uint8_t *)retrieve_desc +
-+				retrieve_desc->mem_accsess_descr_array[0].mem_region_offs);
-+
-+	num_pages = descr->total_page_count;
-+	mf = mobj_ffa_sel2_spmc_new(cookie, num_pages);
-+
-+	if (!mf)
-+		return NULL;
-+
-+	if (set_pages(descr->address_range_array,
-+				  descr->address_range_count,
-+				  num_pages, mf)) {
-+		mobj_ffa_sel2_spmc_delete(mf);
-+		return NULL;
-+
-+	}
-+
-+	return mf;
-+}
-+
-+static TEE_Result spmc_init(void)
-+{
-+	spmc_rxtx_map();
-+
-+	return TEE_SUCCESS;
-+}
-+service_init(spmc_init);
-+
-+#endif /*CFG_CORE_SEL2_SPMC*/
-diff --git a/core/arch/arm/kernel/thread_spmc_a64.S b/core/arch/arm/kernel/thread_spmc_a64.S
-index 3d57da4d..66f9d0b4 100644
---- a/core/arch/arm/kernel/thread_spmc_a64.S
-+++ b/core/arch/arm/kernel/thread_spmc_a64.S
-@@ -17,7 +17,8 @@
- 
- FUNC thread_ffa_msg_wait , :
- 	mov_imm	x0, FFA_MSG_WAIT		/* FID */
--	mov	x1, #FFA_TARGET_INFO_MBZ	/* Target info MBZ */
-+	adr     x1, thread_spmc_target_info
-+	ldr     w1, [x1]
- 	mov	x2, #FFA_PARAM_MBZ		/* Param MBZ */
- 	mov	x3, #FFA_PARAM_MBZ		/* Param MBZ */
- 	mov	x4, #FFA_PARAM_MBZ		/* Param MBZ */
-diff --git a/core/arch/arm/mm/mobj_ffa.c b/core/arch/arm/mm/mobj_ffa.c
-index fd5e66ea..e2c585a2 100644
---- a/core/arch/arm/mm/mobj_ffa.c
-+++ b/core/arch/arm/mm/mobj_ffa.c
-@@ -19,8 +19,10 @@ struct mobj_ffa {
- 	tee_mm_entry_t *mm;
- 	struct refcount mapcount;
- 	uint16_t page_offset;
-+#ifdef CFG_CORE_SEL1_SPMC
- 	bool registered_by_cookie;
- 	bool unregistered_by_cookie;
-+#endif
- 	paddr_t pages[];
- };
- 
-@@ -186,6 +188,24 @@ void mobj_ffa_sel1_spmc_delete(struct mobj_ffa *mf)
- }
- #endif /*CFG_CORE_SEL1_SPMC*/
- 
-+#ifdef CFG_CORE_SEL2_SPMC
-+struct mobj_ffa *mobj_ffa_sel2_spmc_new(uint64_t cookie,
-+					unsigned int num_pages)
-+{
-+	struct mobj_ffa *mf = NULL;
-+
-+	mf = ffa_new(num_pages);
-+	if (mf)
-+		mf->cookie = cookie;
-+	return mf;
-+}
-+
-+void mobj_ffa_sel2_spmc_delete(struct mobj_ffa *mf)
-+{
-+	free(mf);
-+}
-+#endif /*CFG_CORE_SEL2_SPMC*/
-+
- TEE_Result mobj_ffa_add_pages_at(struct mobj_ffa *mf, unsigned int *idx,
- 				 paddr_t pa, unsigned int num_pages)
- {
-@@ -234,7 +254,9 @@ static void unmap_helper(struct mobj_ffa *mf)
- 	}
- }
- 
--TEE_Result mobj_ffa_unregister_by_cookie(uint64_t cookie)
-+
-+#ifdef CFG_CORE_SEL1_SPMC
-+TEE_Result mobj_ffa_sel1_spmc_reclaim(uint64_t cookie)
- {
- 	TEE_Result res = TEE_SUCCESS;
- 	struct mobj_ffa *mf = NULL;
-@@ -244,7 +266,7 @@ TEE_Result mobj_ffa_unregister_by_cookie(uint64_t cookie)
- 	mf = find_in_list(&shm_head, cmp_cookie, cookie);
- 	/*
- 	 * If the mobj is found here it's still active and cannot be
--	 * unregistered.
-+	 * reclaimed.
- 	 */
- 	if (mf) {
- 		DMSG("cookie %#"PRIx64" busy refc %u",
-@@ -252,24 +274,34 @@ TEE_Result mobj_ffa_unregister_by_cookie(uint64_t cookie)
- 		res = TEE_ERROR_BUSY;
- 		goto out;
- 	}
-+
- 	mf = find_in_list(&shm_inactive_head, cmp_cookie, cookie);
-+	if (!mf) {
-+		res = TEE_ERROR_ITEM_NOT_FOUND;
-+		goto out;
-+	}
- 	/*
--	 * If the mobj isn't found or if it already has been unregistered.
-+	 * If the mobj has been registered via mobj_ffa_get_by_cookie()
-+	 * but not unregistered yet with mobj_ffa_unregister_by_cookie().
- 	 */
--	if (!mf || mf->unregistered_by_cookie) {
--		res = TEE_ERROR_ITEM_NOT_FOUND;
-+	if (mf->registered_by_cookie && !mf->unregistered_by_cookie) {
-+		DMSG("cookie %#"PRIx64" busy", cookie);
-+		res = TEE_ERROR_BUSY;
- 		goto out;
- 	}
--	mf->unregistered_by_cookie = true;
--	res = TEE_SUCCESS;
- 
-+	if (!pop_from_list(&shm_inactive_head, cmp_ptr, (vaddr_t)mf))
-+		panic();
-+	res = TEE_SUCCESS;
- out:
- 	cpu_spin_unlock_xrestore(&shm_lock, exceptions);
-+	if (!res)
-+		mobj_ffa_sel1_spmc_delete(mf);
- 	return res;
- }
-+#endif /*CFG_CORE_SEL1_SPMC*/
- 
--#ifdef CFG_CORE_SEL1_SPMC
--TEE_Result mobj_ffa_sel1_spmc_reclaim(uint64_t cookie)
-+TEE_Result mobj_ffa_unregister_by_cookie(uint64_t cookie)
- {
- 	TEE_Result res = TEE_SUCCESS;
- 	struct mobj_ffa *mf = NULL;
-@@ -279,7 +311,7 @@ TEE_Result mobj_ffa_sel1_spmc_reclaim(uint64_t cookie)
- 	mf = find_in_list(&shm_head, cmp_cookie, cookie);
- 	/*
- 	 * If the mobj is found here it's still active and cannot be
--	 * reclaimed.
-+	 * unregistered.
- 	 */
- 	if (mf) {
- 		DMSG("cookie %#"PRIx64" busy refc %u",
-@@ -287,43 +319,42 @@ TEE_Result mobj_ffa_sel1_spmc_reclaim(uint64_t cookie)
- 		res = TEE_ERROR_BUSY;
- 		goto out;
- 	}
--
- 	mf = find_in_list(&shm_inactive_head, cmp_cookie, cookie);
--	if (!mf) {
--		res = TEE_ERROR_ITEM_NOT_FOUND;
--		goto out;
--	}
- 	/*
--	 * If the mobj has been registered via mobj_ffa_get_by_cookie()
--	 * but not unregistered yet with mobj_ffa_unregister_by_cookie().
-+	 * If the mobj isn't found or if it already has been unregistered.
- 	 */
--	if (mf->registered_by_cookie && !mf->unregistered_by_cookie) {
--		DMSG("cookie %#"PRIx64" busy", cookie);
--		res = TEE_ERROR_BUSY;
-+#ifdef CFG_CORE_SEL2_SPMC
-+	if (!mf) {
-+#else
-+	if (!mf || mf->unregistered_by_cookie) {
-+#endif
-+		res = TEE_ERROR_ITEM_NOT_FOUND;
- 		goto out;
- 	}
- 
--	if (!pop_from_list(&shm_inactive_head, cmp_ptr, (vaddr_t)mf))
--		panic();
-+
-+#ifdef CFG_CORE_SEL2_SPMC
-+	mf = pop_from_list(&shm_inactive_head, cmp_cookie, cookie);
-+	mobj_ffa_sel2_spmc_delete(mf);
-+	thread_spmc_relinquish(cookie);
-+#else
-+	mf->unregistered_by_cookie = true;
-+#endif
- 	res = TEE_SUCCESS;
-+
- out:
- 	cpu_spin_unlock_xrestore(&shm_lock, exceptions);
--	if (!res)
--		mobj_ffa_sel1_spmc_delete(mf);
- 	return res;
- }
--#endif /*CFG_CORE_SEL1_SPMC*/
- 
--struct mobj *mobj_ffa_get_by_cookie(uint64_t cookie, unsigned int internal_offs)
-+struct mobj *mobj_ffa_get_by_cookie(uint64_t cookie,
-+				    unsigned int internal_offs)
- {
- 	struct mobj_ffa *mf = NULL;
- 	uint32_t exceptions = 0;
--
- 	if (internal_offs >= SMALL_PAGE_SIZE)
- 		return NULL;
--
- 	exceptions = cpu_spin_lock_xsave(&shm_lock);
--
- 	mf = find_in_list(&shm_head, cmp_cookie, cookie);
- 	if (mf) {
- 		if (mf->page_offset == internal_offs) {
-@@ -345,9 +376,19 @@ struct mobj *mobj_ffa_get_by_cookie(uint64_t cookie, unsigned int internal_offs)
- 		}
- 	} else {
- 		mf = pop_from_list(&shm_inactive_head, cmp_cookie, cookie);
-+#if defined(CFG_CORE_SEL2_SPMC)
-+		/* Try to retrieve it from the SPM at S-EL2 */
-+		if (mf)
-+			DMSG("cookie %#"PRIx64" resurrecting", cookie);
-+		if (!mf)
-+			EMSG("Populating mobj from rx buffer\n");
-+			mf = thread_spmc_populate_mobj_from_rx(cookie);
-+#endif
- 		if (mf) {
-+#if defined(CFG_CORE_SEL1_SPMC)
- 			mf->unregistered_by_cookie = false;
- 			mf->registered_by_cookie = true;
-+#endif
- 			assert(refcount_val(&mf->mobj.refc) == 0);
- 			refcount_set(&mf->mobj.refc, 1);
- 			refcount_set(&mf->mapcount, 0);
-@@ -358,15 +399,12 @@ struct mobj *mobj_ffa_get_by_cookie(uint64_t cookie, unsigned int internal_offs)
- 			SLIST_INSERT_HEAD(&shm_head, mf, link);
- 		}
- 	}
--
- 	cpu_spin_unlock_xrestore(&shm_lock, exceptions);
--
- 	if (!mf) {
- 		EMSG("Failed to get cookie %#"PRIx64" internal_offs %#x",
--		     cookie, internal_offs);
-+			cookie, internal_offs);
- 		return NULL;
- 	}
--
- 	return &mf->mobj;
- }
- 
-diff --git a/core/arch/arm/plat-vexpress/conf.mk b/core/arch/arm/plat-vexpress/conf.mk
-index 26b9f51e..dd6530a6 100644
---- a/core/arch/arm/plat-vexpress/conf.mk
-+++ b/core/arch/arm/plat-vexpress/conf.mk
-@@ -58,8 +58,13 @@ CFG_WITH_STATS ?= y
- 
- ifeq ($(PLATFORM_FLAVOR),fvp)
- CFG_TEE_CORE_NB_CORE = 8
-+ifeq ($(CFG_CORE_SEL2_SPMC),y)
-+CFG_TZDRAM_START ?= 0x06280000
-+CFG_TZDRAM_SIZE  ?= 0x01D80000
-+else
- CFG_TZDRAM_START ?= 0x06000000
- CFG_TZDRAM_SIZE  ?= 0x02000000
-+endif
- CFG_SHMEM_START  ?= 0x83000000
- CFG_SHMEM_SIZE   ?= 0x00200000
- # DRAM1 is defined above 4G
--- 
-2.26.2
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0003-plat-totalcompute-Add-OP-TEE-SP-manifest-file.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0003-plat-totalcompute-Add-OP-TEE-SP-manifest-file.patch
new file mode 100644
index 0000000..a7d5e0b
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0003-plat-totalcompute-Add-OP-TEE-SP-manifest-file.patch
@@ -0,0 +1,62 @@
+From f5f79333261cdd3b627d7551b675eb0457a02727 Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Wed, 7 Jul 2021 16:55:31 +0100
+Subject: [PATCH 3/4] plat-totalcompute: Add OP-TEE SP manifest file
+
+Add Secure Partition manifest file. This file is used when OP-TEE is build
+with CFG_CORE_SEL2_SPMC support when creating the SP binary image.
+
+Upstream-Status: Merged [https://github.com/OP-TEE/optee_os/pull/4736]
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
+---
+ .../fdts/optee_sp_manifest.dts                | 36 +++++++++++++++++++
+ 1 file changed, 36 insertions(+)
+ create mode 100644 core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
+
+diff --git a/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts b/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
+new file mode 100644
+index 00000000..4b8b3681
+--- /dev/null
++++ b/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
+@@ -0,0 +1,36 @@
++// SPDX-License-Identifier: BSD-2-Clause
++/*
++ * Copyright (c) 2021, Arm Limited. All rights reserved.
++ *
++ * This file is a Partition Manifest (PM) for OP-TEE as a Secure Partition (SP)
++ *
++ */
++
++/dts-v1/;
++
++/ {
++	compatible = "arm,ffa-manifest-1.0";
++
++	/* Properties */
++	description = "op-tee";
++	ffa-version = <0x00010000>; /* 31:16 - Major, 15:0 - Minor */
++	uuid = <0x486178e0 0xe7f811e3 0xbc5e0002 0xa5d5c51b>;
++	id = <1>;
++	execution-ctx-count = <8>;
++	exception-level = <2>; /* S-EL1 */
++	execution-state = <0>; /* AARCH64 */
++	load-address = <0xfd280000>;
++	entrypoint-offset = <0x1000>;
++	xlat-granule = <0>; /* 4KiB */
++	boot-order = <0>;
++	messaging-method = <0>; /* Direct messaging only */
++
++	device-regions {
++		compatible = "arm,ffa-manifest-device-regions";
++		uart0 {
++			base-address = <0x00000000 0x7ff70000>;
++			pages-count = <1>;
++			attributes = <0x3>; /* read-write */
++		};
++	};
++};
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0004-core-fixes-to-align-with-upstream-hafnium.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0004-core-fixes-to-align-with-upstream-hafnium.patch
deleted file mode 100644
index a36a510..0000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0004-core-fixes-to-align-with-upstream-hafnium.patch
+++ /dev/null
@@ -1,188 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From 5ca96d9ff7fa5481282fb8f59a54d3cc91a1ae36 Mon Sep 17 00:00:00 2001
-From: Olivier Deprez <olivier.deprez@arm.com>
-Date: Thu, 1 Oct 2020 07:59:54 +0200
-Subject: [PATCH 1/5] core: fixes to align with upstream hafnium
-
-FF-A: fix call to thread_spmc_populate_mobj_from_rx
-
-FF-A: fix typos in thread_spmc.c
-
-FF-A: fix mem retrieve request
-
-FF-A. fix mem relinquish
-
-FF-A: call rx release from thread_spmc_populate_mobj_from_rx
-
-Change-Id: I38794b34bf17428d62218e30bdd0180f75498ed4
-Signed-off-by: Olivier Deprez <olivier.deprez@arm.com>
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
----
- core/arch/arm/kernel/thread_spmc.c | 52 +++++++++++++++++++++---------
- core/arch/arm/mm/mobj_ffa.c        |  3 +-
- 2 files changed, 39 insertions(+), 16 deletions(-)
-
-diff --git a/core/arch/arm/kernel/thread_spmc.c b/core/arch/arm/kernel/thread_spmc.c
-index 3d7dc035..872221d6 100644
---- a/core/arch/arm/kernel/thread_spmc.c
-+++ b/core/arch/arm/kernel/thread_spmc.c
-@@ -48,7 +48,7 @@ struct mem_access_perm_descr {
- };
- 
- /* Table 41: Endpoint memory access descriptor */
--struct mem_accsess_descr {
-+struct mem_access_descr {
- 	struct mem_access_perm_descr mem_access_perm_descr;
- 	uint32_t mem_region_offs;
- 	uint64_t reserved;
-@@ -64,7 +64,7 @@ struct mem_transaction_descr {
- 	uint64_t tag;
- 	uint32_t reserved1;
- 	uint32_t mem_access_descr_count;
--	struct mem_accsess_descr mem_accsess_descr_array[];
-+	struct mem_access_descr mem_access_descr_array[];
- };
- 
- struct ffa_partition_info {
-@@ -453,8 +453,8 @@ static void handle_blocking_call(struct thread_smc_args *args)
- 	}
- }
- 
--#if CFG_CORE_SEL1_SPMC
--static int get_acc_perms(struct mem_accsess_descr *mem_acc,
-+#ifdef CFG_CORE_SEL1_SPMC
-+static int get_acc_perms(struct mem_access_descr *mem_acc,
- 			 unsigned int num_mem_accs, uint8_t *acc_perms,
- 			 unsigned int *region_offs)
- {
-@@ -495,7 +495,7 @@ static int mem_share_init(void *buf, size_t blen, unsigned int *page_count,
- 
- 	/* Check that the endpoint memory access descriptor array fits */
- 	num_mem_accs = READ_ONCE(descr->mem_access_descr_count);
--	if (MUL_OVERFLOW(sizeof(struct mem_accsess_descr), num_mem_accs, &n) ||
-+	if (MUL_OVERFLOW(sizeof(struct mem_access_descr), num_mem_accs, &n) ||
- 	    ADD_OVERFLOW(sizeof(*descr), n, &n) || n > blen)
- 		return FFA_INVALID_PARAMETERS;
- 
-@@ -503,7 +503,7 @@ static int mem_share_init(void *buf, size_t blen, unsigned int *page_count,
- 		return FFA_INVALID_PARAMETERS;
- 
- 	/* Check that the access permissions matches what's expected */
--	if (get_acc_perms(descr->mem_accsess_descr_array,
-+	if (get_acc_perms(descr->mem_access_descr_array,
- 			  num_mem_accs, &mem_acc_perm, &region_descr_offs) ||
- 	    mem_acc_perm != exp_mem_acc_perm)
- 		return FFA_INVALID_PARAMETERS;
-@@ -1263,17 +1263,29 @@ static struct mem_transaction_descr *spmc_retrieve_req(uint64_t cookie)
- {
- 	struct mem_transaction_descr *retrieve_region = (void *)tx_buf;
- 
-+	uint64_t size = sizeof(*retrieve_region) +
-+		1 * sizeof(struct mem_access_descr);
- 	struct thread_smc_args args = {
- 		.a0 = FFA_MEM_RETRIEVE_REQ_64,
--		.a1 =   sizeof(*retrieve_region),  	// Total Length
--		.a2 =	sizeof(*retrieve_region),	// Frag Length == Total length
-+		.a1 =   size,  	// Total Length
-+		.a2 =	size,	// Frag Length == Total length
- 		.a3 =	0,				// Address, Using TX -> MBZ
- 		.a4 =   0 				// Using TX -> MBZ
- 	};
- 
- 	/* TODO pass all the information required by the spec */
--	memset(retrieve_region, 0, sizeof(*retrieve_region));
-+	memset(retrieve_region, 0, size);
- 	retrieve_region->global_handle = cookie;
-+	retrieve_region->flags = 1;
-+	retrieve_region->mem_access_descr_count = 1;
-+	retrieve_region->mem_access_descr_array[0].mem_region_offs = 0;
-+	retrieve_region->mem_access_descr_array[0].reserved = 0;
-+	retrieve_region->mem_access_descr_array[0].mem_access_perm_descr =
-+		(struct mem_access_perm_descr) {
-+			.endpoint_id = my_sp_id,
-+			.access_perm = 0,
-+			.flags = 0
-+		};
- 
- 	thread_smccc(&args);
- 	if (args.a0 == FFA_ERROR /*TODO != FFA_MEM_RETRIEVE_RESP_64 */) {
-@@ -1296,6 +1308,8 @@ void thread_spmc_relinquish(uint64_t cookie)
- 	relinquish_desc->handle = cookie;
- 	relinquish_desc->flags = 0;
- 	/* TODO: Add endpoint details. */
-+	relinquish_desc->endpoint_count = 1;
-+	relinquish_desc->endpoint_id_array[0] = my_sp_id;
- 	thread_smccc(&args);
- 	if (args.a0 != FFA_SUCCESS_32)
- 		EMSG("Failed to relinquish cookie %#"PRIx64, cookie);
-@@ -1303,11 +1317,14 @@ void thread_spmc_relinquish(uint64_t cookie)
- 
- struct mobj_ffa *thread_spmc_populate_mobj_from_rx(uint64_t cookie)
- {
-+	struct mobj_ffa *ret = NULL;
- 	struct mem_transaction_descr *retrieve_desc;
- 	struct mem_region_descr *descr;
- 	struct mobj_ffa *mf;
- 	uint32_t num_pages;
--
-+	struct thread_smc_args ffa_rx_release_args = {
-+		.a0 = FFA_RX_RELEASE
-+	};
- 
- 	/* XXX Support single mem_region. */
- 	retrieve_desc = spmc_retrieve_req(cookie);
-@@ -1319,23 +1336,28 @@ struct mobj_ffa *thread_spmc_populate_mobj_from_rx(uint64_t cookie)
- 
- 	descr = (struct mem_region_descr *)
- 			((uint8_t *)retrieve_desc +
--				retrieve_desc->mem_accsess_descr_array[0].mem_region_offs);
-+				retrieve_desc->mem_access_descr_array[0].mem_region_offs);
- 
- 	num_pages = descr->total_page_count;
- 	mf = mobj_ffa_sel2_spmc_new(cookie, num_pages);
- 
- 	if (!mf)
--		return NULL;
-+		goto out;
- 
- 	if (set_pages(descr->address_range_array,
- 				  descr->address_range_count,
- 				  num_pages, mf)) {
- 		mobj_ffa_sel2_spmc_delete(mf);
--		return NULL;
--
-+		goto out;
- 	}
- 
--	return mf;
-+	ret = mf;
-+
-+out:
-+	/* Release RX buffer after the mem retrieve request. */
-+	thread_smccc(&ffa_rx_release_args);
-+
-+	return ret;
- }
- 
- static TEE_Result spmc_init(void)
-diff --git a/core/arch/arm/mm/mobj_ffa.c b/core/arch/arm/mm/mobj_ffa.c
-index e2c585a2..8e334f04 100644
---- a/core/arch/arm/mm/mobj_ffa.c
-+++ b/core/arch/arm/mm/mobj_ffa.c
-@@ -380,9 +380,10 @@ struct mobj *mobj_ffa_get_by_cookie(uint64_t cookie,
- 		/* Try to retrieve it from the SPM at S-EL2 */
- 		if (mf)
- 			DMSG("cookie %#"PRIx64" resurrecting", cookie);
--		if (!mf)
-+		if (!mf) {
- 			EMSG("Populating mobj from rx buffer\n");
- 			mf = thread_spmc_populate_mobj_from_rx(cookie);
-+		}
- #endif
- 		if (mf) {
- #if defined(CFG_CORE_SEL1_SPMC)
--- 
-2.26.2
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0004-plat-totalcompute-Add-support-for-S-EL2-SPMC.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0004-plat-totalcompute-Add-support-for-S-EL2-SPMC.patch
new file mode 100644
index 0000000..5177e19
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0004-plat-totalcompute-Add-support-for-S-EL2-SPMC.patch
@@ -0,0 +1,152 @@
+From 49dbb9ef65643c4322cf3f848910fa880d1c02f6 Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Wed, 7 Jul 2021 17:00:12 +0100
+Subject: [PATCH 4/4] plat-totalcompute: Add support for S-EL2 SPMC
+
+This patch adds CFG_CORE_SEL2_SPMC support. Defines CFG_TZDRAM_START
+address with memory region reserved for SPMC. Adds secondary cpu boot
+request handler. Disables configuring GIC if SEL2 SPMC is enabled.
+
+Upstream-Status: Merged [https://github.com/OP-TEE/optee_os/pull/4736]
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
+---
+ core/arch/arm/plat-totalcompute/conf.mk       |  9 ++++++++
+ core/arch/arm/plat-totalcompute/main.c        | 10 ++++++++
+ .../arm/plat-totalcompute/platform_config.h   |  2 ++
+ core/arch/arm/plat-totalcompute/sub.mk        |  3 +++
+ core/arch/arm/plat-totalcompute/tc0_spmc_pm.c | 23 +++++++++++++++++++
+ 5 files changed, 47 insertions(+)
+ create mode 100644 core/arch/arm/plat-totalcompute/tc0_spmc_pm.c
+
+diff --git a/core/arch/arm/plat-totalcompute/conf.mk b/core/arch/arm/plat-totalcompute/conf.mk
+index ab978053..39c1e97e 100644
+--- a/core/arch/arm/plat-totalcompute/conf.mk
++++ b/core/arch/arm/plat-totalcompute/conf.mk
+@@ -7,8 +7,13 @@ endif
+ 
+ $(call force,CFG_WITH_ARM_TRUSTED_FW,y)
+ $(call force,CFG_GENERIC_BOOT,y)
++ifeq ($(CFG_CORE_SEL2_SPMC),y)
++$(call force,CFG_GIC,n)
++$(call force,CFG_ARM_GICV3,n)
++else
+ $(call force,CFG_GIC,y)
+ $(call force,CFG_ARM_GICV3,y)
++endif
+ $(call force,CFG_PL011,y)
+ $(call force,CFG_PM_STUBS,y)
+ $(call force,CFG_SECURE_TIME_SOURCE_CNTPCT,y)
+@@ -27,9 +32,13 @@ CFG_TEE_CORE_NB_CORE = 8
+ ifeq ($(CFG_CORE_SEL1_SPMC),y)
+ CFG_TZDRAM_START ?= 0xfd000000
+ CFG_TZDRAM_SIZE  ?= 0x02000000
++else ifeq ($(CFG_CORE_SEL2_SPMC),y)
++CFG_TZDRAM_START ?= 0xfd281000
++CFG_TZDRAM_SIZE  ?= 0x01d7f000
+ else
+ CFG_TZDRAM_START ?= 0xff000000
+ CFG_TZDRAM_SIZE  ?= 0x01000000
++endif
+ 
+ CFG_SHMEM_START  ?= 0xfce00000
+ CFG_SHMEM_SIZE   ?= 0x00200000
+diff --git a/core/arch/arm/plat-totalcompute/main.c b/core/arch/arm/plat-totalcompute/main.c
+index 6819b928..42acf8dd 100644
+--- a/core/arch/arm/plat-totalcompute/main.c
++++ b/core/arch/arm/plat-totalcompute/main.c
+@@ -16,14 +16,19 @@
+ #include <mm/core_mmu.h>
+ #include <platform_config.h>
+ 
++#ifndef CFG_CORE_SEL2_SPMC
+ static struct gic_data gic_data __nex_bss;
++#endif
+ static struct pl011_data console_data __nex_bss;
+ 
+ register_phys_mem_pgdir(MEM_AREA_IO_SEC, CONSOLE_UART_BASE, PL011_REG_SIZE);
++#ifndef CFG_CORE_SEL2_SPMC
+ register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICD_BASE, GIC_DIST_REG_SIZE);
++#endif
+ 
+ register_ddr(DRAM0_BASE, DRAM0_SIZE);
+ 
++#ifndef CFG_CORE_SEL2_SPMC
+ void main_init_gic(void)
+ {
+ 	vaddr_t gicc_base;
+@@ -40,10 +45,15 @@ void main_init_gic(void)
+ 	gic_init_base_addr(&gic_data, gicc_base, gicc_base);
+ 	itr_init(&gic_data.chip);
+ }
++#endif
+ 
+ void itr_core_handler(void)
+ {
++#ifdef CFG_CORE_SEL2_SPMC
++	panic("Secure interrupt handler not defined");
++#else
+ 	gic_it_handle(&gic_data);
++#endif
+ }
+ 
+ void console_init(void)
+diff --git a/core/arch/arm/plat-totalcompute/platform_config.h b/core/arch/arm/plat-totalcompute/platform_config.h
+index ee005e66..21a5902e 100644
+--- a/core/arch/arm/plat-totalcompute/platform_config.h
++++ b/core/arch/arm/plat-totalcompute/platform_config.h
+@@ -12,9 +12,11 @@
+ #define STACK_ALIGNMENT		64
+ 
+ #if defined(PLATFORM_FLAVOR_tc0)
++#ifndef CFG_CORE_SEL2_SPMC
+ #define GIC_BASE		0x30000000
+ #define GICD_OFFSET		0x0
+ #define GICC_OFFSET		0x0
++#endif
+ 
+ #define UART0_BASE		0x7FF70000
+ #define UART1_BASE		0x7FF80000
+diff --git a/core/arch/arm/plat-totalcompute/sub.mk b/core/arch/arm/plat-totalcompute/sub.mk
+index 8ddc2fd4..ffd76ee9 100644
+--- a/core/arch/arm/plat-totalcompute/sub.mk
++++ b/core/arch/arm/plat-totalcompute/sub.mk
+@@ -1,2 +1,5 @@
+ global-incdirs-y += .
+ srcs-y += main.c
++ifeq ($(CFG_CORE_FFA),y)
++srcs-y += tc0_spmc_pm.c
++endif
+diff --git a/core/arch/arm/plat-totalcompute/tc0_spmc_pm.c b/core/arch/arm/plat-totalcompute/tc0_spmc_pm.c
+new file mode 100644
+index 00000000..b6ced20e
+--- /dev/null
++++ b/core/arch/arm/plat-totalcompute/tc0_spmc_pm.c
+@@ -0,0 +1,23 @@
++// SPDX-License-Identifier: BSD-2-Clause
++/*
++ * Copyright (c) 2021, Arm Limited
++ */
++
++#include <arm.h>
++#include <kernel/boot.h>
++#include <ffa.h>
++#include <sm/psci.h>
++
++void ffa_secondary_cpu_ep_register(vaddr_t secondary_ep)
++{
++	unsigned int ret = 0;
++
++	/* Invoke FFA_SECONDARY_EP_REGISTER_64 to the SPMC */
++	ret = thread_smc(FFA_SECONDARY_EP_REGISTER_64, secondary_ep, 0, 0);
++
++	if (ret != FFA_SUCCESS_32 && ret != FFA_SUCCESS_64) {
++		EMSG("FFA_SECONDARY_EP_REGISTER_64 ret %"PRId32, ret);
++	}
++
++	return;
++}
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0006-plat-totalcompute-Add-support-for-S-EL2-SPMC.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0006-plat-totalcompute-Add-support-for-S-EL2-SPMC.patch
deleted file mode 100644
index 3070d5f..0000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0006-plat-totalcompute-Add-support-for-S-EL2-SPMC.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From 8c21a8c7ac92839f36f83ebff9a208f24302c780 Mon Sep 17 00:00:00 2001
-From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Date: Mon, 16 Nov 2020 17:29:09 +0000
-Subject: [PATCH 3/5] plat-totalcompute: Add support for S-EL2 SPMC
-
-This patch adds CFG_CORE_SEL2_SPMC support. Defines CFG_TZDRAM_START
-address with memory region reserved for SPMC. Adds secondary cpu boot
-request handler.
-
-Change-Id: I3f274c7bb6b7df2706ea81aee0f2a8f8f39c1d80
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
----
- core/arch/arm/plat-totalcompute/conf.mk       |  5 ++
- core/arch/arm/plat-totalcompute/sub.mk        |  3 ++
- core/arch/arm/plat-totalcompute/tc0_spmc_pm.c | 50 +++++++++++++++++++
- 3 files changed, 58 insertions(+)
- create mode 100644 core/arch/arm/plat-totalcompute/tc0_spmc_pm.c
-
-diff --git a/core/arch/arm/plat-totalcompute/conf.mk b/core/arch/arm/plat-totalcompute/conf.mk
-index 4fe894c7..34095acf 100644
---- a/core/arch/arm/plat-totalcompute/conf.mk
-+++ b/core/arch/arm/plat-totalcompute/conf.mk
-@@ -24,8 +24,13 @@ endif
- ifeq ($(PLATFORM_FLAVOR),tc0)
- CFG_TEE_CORE_NB_CORE = 4
- 
-+ifeq ($(CFG_CORE_SEL2_SPMC),y)
-+CFG_TZDRAM_START ?= 0xfd281000
-+CFG_TZDRAM_SIZE  ?= 0x01d7f000
-+else
- CFG_TZDRAM_START ?= 0xff000000
- CFG_TZDRAM_SIZE  ?= 0x01000000
-+endif
- 
- CFG_SHMEM_START  ?= 0xfce00000
- CFG_SHMEM_SIZE   ?= 0x00200000
-diff --git a/core/arch/arm/plat-totalcompute/sub.mk b/core/arch/arm/plat-totalcompute/sub.mk
-index 8ddc2fd4..ffd76ee9 100644
---- a/core/arch/arm/plat-totalcompute/sub.mk
-+++ b/core/arch/arm/plat-totalcompute/sub.mk
-@@ -1,2 +1,5 @@
- global-incdirs-y += .
- srcs-y += main.c
-+ifeq ($(CFG_CORE_FFA),y)
-+srcs-y += tc0_spmc_pm.c
-+endif
-diff --git a/core/arch/arm/plat-totalcompute/tc0_spmc_pm.c b/core/arch/arm/plat-totalcompute/tc0_spmc_pm.c
-new file mode 100644
-index 00000000..8e59a8cc
---- /dev/null
-+++ b/core/arch/arm/plat-totalcompute/tc0_spmc_pm.c
-@@ -0,0 +1,50 @@
-+// SPDX-License-Identifier: BSD-2-Clause
-+/*
-+ * Copyright (c) 2020, Arm Limited
-+ */
-+
-+#include <arm.h>
-+#include <kernel/boot.h>
-+#include <ffa.h>
-+#include <sm/psci.h>
-+
-+/*
-+ * Lookup table of core and cluster affinities on the TC0. In the absence of a
-+ * DT that provides the same information, this table is used to initialise
-+ * OP-TEE on secondary cores.
-+ */
-+static const uint64_t core_clus_aff_array[] = {
-+	0x0000,		/* Cluster 0 Cpu 0 */
-+	0x0001,		/* Cluster 0 Cpu 1 */
-+	0x0002,		/* Cluster 0 Cpu 2 */
-+	0x0003		/* Cluster 0 Cpu 3 */
-+};
-+
-+void ffa_secondary_cpu_boot_req(vaddr_t secondary_ep, uint64_t cookie)
-+{
-+	unsigned long mpidr = read_mpidr();
-+	unsigned int aff_shift = 0;
-+	unsigned long a1 = 0;
-+	unsigned int cnt = 0;
-+	int32_t ret = 0;
-+
-+	if (mpidr & MPIDR_MT_MASK)
-+		aff_shift = MPIDR_CLUSTER_SHIFT;
-+
-+	for (cnt = 0; cnt < ARRAY_SIZE(core_clus_aff_array); cnt++) {
-+		/* Clear out the affinity fields until level 2 */
-+		a1 = mpidr & ~(unsigned long)MPIDR_AARCH32_AFF_MASK;
-+
-+		/* Create an mpidr from core_clus_aff_array */
-+		a1 |= core_clus_aff_array[cnt] << aff_shift;
-+
-+		/* Invoke the PSCI_CPU_ON_SMC64 function */
-+		ret = thread_smc(PSCI_CPU_ON_SMC64, a1, secondary_ep, cookie);
-+
-+		if (ret != PSCI_RET_SUCCESS)
-+			EMSG("PSCI_CPU_ON op on mpidr 0x%lx failed %"PRId32,
-+			     a1, ret);
-+		else
-+			DMSG("PSCI_CPU_ON op on mpidr 0x%lx done", a1);
-+	}
-+}
--- 
-2.26.2
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0007-plat-totalcompute-add-optee-manifest-file-and-sp-lay.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0007-plat-totalcompute-add-optee-manifest-file-and-sp-lay.patch
deleted file mode 100644
index 6535496..0000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0007-plat-totalcompute-add-optee-manifest-file-and-sp-lay.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From 582bf63102ec37dadff2147dcebcb62783dcf377 Mon Sep 17 00:00:00 2001
-From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Date: Mon, 16 Nov 2020 18:03:21 +0000
-Subject: [PATCH 4/5] plat-totalcompute: add optee manifest file and sp layout
-
-For S-EL2 SPMC, add optee manifest file and sp layout file
-
-Change-Id: Ic3179987decf4e017cd4a0ad91b3beeea2bd6ca1
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
----
- .../arm/plat-totalcompute/optee_manifest.dts  | 33 +++++++++++++++++++
- .../arch/arm/plat-totalcompute/sp_layout.json |  6 ++++
- 2 files changed, 39 insertions(+)
- create mode 100644 core/arch/arm/plat-totalcompute/optee_manifest.dts
- create mode 100644 core/arch/arm/plat-totalcompute/sp_layout.json
-
-diff --git a/core/arch/arm/plat-totalcompute/optee_manifest.dts b/core/arch/arm/plat-totalcompute/optee_manifest.dts
-new file mode 100644
-index 00000000..4e60cbe1
---- /dev/null
-+++ b/core/arch/arm/plat-totalcompute/optee_manifest.dts
-@@ -0,0 +1,33 @@
-+/*
-+ * Copyright (c) 2020, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ *
-+ * This file is a Partition Manifest (PM) for a minimal Secure Partition (SP)
-+ * that has additional optional properties defined.
-+ *
-+ */
-+
-+/dts-v1/;
-+
-+/ {
-+	compatible = "arm,ffa-manifest-1.0";
-+
-+	/* Properties */
-+	description = "op-tee";
-+	ffa-version = <0x00010000>; /* 31:16 - Major, 15:0 - Minor */
-+	uuid = <0x486178e0 0xe7f811e3 0xbc5e0002 0xa5d5c51b>;
-+	id = <1>;
-+	execution-ctx-count = <4>;
-+	exception-level = <2>; /* S-EL1 */
-+	execution-state = <0>; /* AARCH64 */
-+	load-address = <0xfd280000>;
-+	entrypoint-offset = <0x1000>;
-+	xlat-granule = <0>; /* 4KiB */
-+	boot-order = <0>;
-+	messaging-method = <0>; /* Direct messaging only */
-+	run-time-model = <1>; /* Run to completion */
-+
-+	/* Boot protocol */
-+	gp-register-num = <0x0>;
-+};
-diff --git a/core/arch/arm/plat-totalcompute/sp_layout.json b/core/arch/arm/plat-totalcompute/sp_layout.json
-new file mode 100644
-index 00000000..05bc7851
---- /dev/null
-+++ b/core/arch/arm/plat-totalcompute/sp_layout.json
-@@ -0,0 +1,6 @@
-+{
-+	"op-tee" : {
-+		"image": "tee-pager_v2.bin",
-+		"pm": "optee_manifest.dts"
-+	}
-+}
--- 
-2.26.2
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0008-plat-totalcompute-define-tzdram-start-address-for-S-.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0008-plat-totalcompute-define-tzdram-start-address-for-S-.patch
deleted file mode 100644
index 015bdc9..0000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0008-plat-totalcompute-define-tzdram-start-address-for-S-.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From 1827607c6381339d051a36a84d749c3a50e3463d Mon Sep 17 00:00:00 2001
-From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Date: Mon, 16 Nov 2020 17:38:07 +0000
-Subject: [PATCH 5/5] plat-totalcompute: define tzdram start address for S-EL1
- SPMC config
-
-Define TZDRAM_START for CFG_CORE_SEL1_SPMC config
-
-Change-Id: I71aaa92a0ecdb791802336ca31ab52e97ee52955
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
----
- core/arch/arm/plat-totalcompute/conf.mk | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/core/arch/arm/plat-totalcompute/conf.mk b/core/arch/arm/plat-totalcompute/conf.mk
-index 34095acf..d330eb92 100644
---- a/core/arch/arm/plat-totalcompute/conf.mk
-+++ b/core/arch/arm/plat-totalcompute/conf.mk
-@@ -24,7 +24,10 @@ endif
- ifeq ($(PLATFORM_FLAVOR),tc0)
- CFG_TEE_CORE_NB_CORE = 4
- 
--ifeq ($(CFG_CORE_SEL2_SPMC),y)
-+ifeq ($(CFG_CORE_SEL1_SPMC),y)
-+CFG_TZDRAM_START ?= 0xfd000000
-+CFG_TZDRAM_SIZE  ?= 0x02000000
-+else ifeq ($(CFG_CORE_SEL2_SPMC),y)
- CFG_TZDRAM_START ?= 0xfd281000
- CFG_TZDRAM_SIZE  ?= 0x01d7f000
- else
--- 
-2.26.2
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0009-plat-totalcompute-add-Theodul-DSU-support.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0009-plat-totalcompute-add-Theodul-DSU-support.patch
deleted file mode 100644
index e52a9d0..0000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0009-plat-totalcompute-add-Theodul-DSU-support.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From 3563e39d66404ff2415d29c4018757a85cd0ad97 Mon Sep 17 00:00:00 2001
-From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Date: Wed, 13 Jan 2021 13:49:54 +0000
-Subject: [PATCH 1/3] plat-totalcompute: add Theodul DSU support
-
-- Change CPU count from 4 to 8
-- Set heap size to 128K
-- In debug print, change EMSG to DMSG
-
-Change-Id: Ic426f5e08ac4e7ce1be37333486c75a3228e3415
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
----
- core/arch/arm/mm/mobj_ffa.c                        |  2 +-
- core/arch/arm/plat-totalcompute/conf.mk            |  4 +++-
- core/arch/arm/plat-totalcompute/optee_manifest.dts |  2 +-
- core/arch/arm/plat-totalcompute/tc0_spmc_pm.c      | 10 +++++++++-
- 4 files changed, 14 insertions(+), 4 deletions(-)
-
-diff --git a/core/arch/arm/mm/mobj_ffa.c b/core/arch/arm/mm/mobj_ffa.c
-index 8e334f04..500404c3 100644
---- a/core/arch/arm/mm/mobj_ffa.c
-+++ b/core/arch/arm/mm/mobj_ffa.c
-@@ -381,7 +381,7 @@ struct mobj *mobj_ffa_get_by_cookie(uint64_t cookie,
- 		if (mf)
- 			DMSG("cookie %#"PRIx64" resurrecting", cookie);
- 		if (!mf) {
--			EMSG("Populating mobj from rx buffer\n");
-+			DMSG("Populating mobj from rx:  %#"PRIx64"", cookie);
- 			mf = thread_spmc_populate_mobj_from_rx(cookie);
- 		}
- #endif
-diff --git a/core/arch/arm/plat-totalcompute/conf.mk b/core/arch/arm/plat-totalcompute/conf.mk
-index d330eb92..c35437aa 100644
---- a/core/arch/arm/plat-totalcompute/conf.mk
-+++ b/core/arch/arm/plat-totalcompute/conf.mk
-@@ -22,7 +22,9 @@ platform-aflags-debug-info = -gdwarf-2
- endif
- 
- ifeq ($(PLATFORM_FLAVOR),tc0)
--CFG_TEE_CORE_NB_CORE = 4
-+CFG_TEE_CORE_NB_CORE = 8
-+
-+CFG_CORE_HEAP_SIZE ?= 131072
- 
- ifeq ($(CFG_CORE_SEL1_SPMC),y)
- CFG_TZDRAM_START ?= 0xfd000000
-diff --git a/core/arch/arm/plat-totalcompute/optee_manifest.dts b/core/arch/arm/plat-totalcompute/optee_manifest.dts
-index 4e60cbe1..60cb5957 100644
---- a/core/arch/arm/plat-totalcompute/optee_manifest.dts
-+++ b/core/arch/arm/plat-totalcompute/optee_manifest.dts
-@@ -18,7 +18,7 @@
- 	ffa-version = <0x00010000>; /* 31:16 - Major, 15:0 - Minor */
- 	uuid = <0x486178e0 0xe7f811e3 0xbc5e0002 0xa5d5c51b>;
- 	id = <1>;
--	execution-ctx-count = <4>;
-+	execution-ctx-count = <8>;
- 	exception-level = <2>; /* S-EL1 */
- 	execution-state = <0>; /* AARCH64 */
- 	load-address = <0xfd280000>;
-diff --git a/core/arch/arm/plat-totalcompute/tc0_spmc_pm.c b/core/arch/arm/plat-totalcompute/tc0_spmc_pm.c
-index 8e59a8cc..3fb32823 100644
---- a/core/arch/arm/plat-totalcompute/tc0_spmc_pm.c
-+++ b/core/arch/arm/plat-totalcompute/tc0_spmc_pm.c
-@@ -17,7 +17,11 @@ static const uint64_t core_clus_aff_array[] = {
- 	0x0000,		/* Cluster 0 Cpu 0 */
- 	0x0001,		/* Cluster 0 Cpu 1 */
- 	0x0002,		/* Cluster 0 Cpu 2 */
--	0x0003		/* Cluster 0 Cpu 3 */
-+	0x0003,		/* Cluster 0 Cpu 3 */
-+	0x0004,		/* Cluster 0 Cpu 4 */
-+	0x0005,		/* Cluster 0 Cpu 5 */
-+	0x0006,		/* Cluster 0 Cpu 6 */
-+	0x0007		/* Cluster 0 Cpu 7 */
- };
- 
- void ffa_secondary_cpu_boot_req(vaddr_t secondary_ep, uint64_t cookie)
-@@ -38,6 +42,10 @@ void ffa_secondary_cpu_boot_req(vaddr_t secondary_ep, uint64_t cookie)
- 		/* Create an mpidr from core_clus_aff_array */
- 		a1 |= core_clus_aff_array[cnt] << aff_shift;
- 
-+		/* Ignore current cpu */
-+		if (a1 == mpidr)
-+			continue;
-+
- 		/* Invoke the PSCI_CPU_ON_SMC64 function */
- 		ret = thread_smc(PSCI_CPU_ON_SMC64, a1, secondary_ep, cookie);
- 
--- 
-2.29.2
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0010-WIP-OP-TEE-SP-declare-device-regions-in-manifest.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0010-WIP-OP-TEE-SP-declare-device-regions-in-manifest.patch
deleted file mode 100644
index fbc5161..0000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0010-WIP-OP-TEE-SP-declare-device-regions-in-manifest.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From fd325f731da694057a2738411faa2ccbeea71778 Mon Sep 17 00:00:00 2001
-From: Olivier Deprez <olivier.deprez@arm.com>
-Date: Thu, 3 Dec 2020 22:29:37 +0100
-Subject: [PATCH 2/3] WIP OP-TEE SP declare device regions in manifest
-
-Secure Partitions must declare peripherals they access such
-that the SPMC maps IO regions in SP's Stage-2 translation
-regime. OP-TEE currently directly accesses the GIC Distributor
-and the UART0 peripheral hence declare those device regions in
-OP-TEE's manifest.
-
-Change-Id: I1fda46e5cf17153dfaf499042dceff325729d041
-Signed-off-by: Olivier Deprez <olivier.deprez@arm.com>
----
- .../arch/arm/plat-totalcompute/optee_manifest.dts | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
-
-diff --git a/core/arch/arm/plat-totalcompute/optee_manifest.dts b/core/arch/arm/plat-totalcompute/optee_manifest.dts
-index 60cb5957..cdc28d98 100644
---- a/core/arch/arm/plat-totalcompute/optee_manifest.dts
-+++ b/core/arch/arm/plat-totalcompute/optee_manifest.dts
-@@ -30,4 +30,19 @@
- 
- 	/* Boot protocol */
- 	gp-register-num = <0x0>;
-+
-+	device-regions {
-+		compatible = "arm,ffa-manifest-device-regions";
-+		uart0 {
-+			base-address = <0x00000000 0x7ff70000>;
-+			pages-count = <1>;
-+			attributes = <0x3>; /* read-write */
-+		};
-+
-+		gicd {
-+			base-address = <0x00000000 0x30000000>;
-+			pages-count = <16>;
-+			attributes = <0x3>; /* read-write */
-+		};
-+	};
- };
--- 
-2.29.2
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0011-WIP-OP-TEE-SP-use-CNTVCT-in-place-of-CNTVCT.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0011-WIP-OP-TEE-SP-use-CNTVCT-in-place-of-CNTVCT.patch
deleted file mode 100644
index 323ace7..0000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0011-WIP-OP-TEE-SP-use-CNTVCT-in-place-of-CNTVCT.patch
+++ /dev/null
@@ -1,173 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From 85110aaf32b6d3b19fdca301f7a07a4683825802 Mon Sep 17 00:00:00 2001
-From: Olivier Deprez <olivier.deprez@arm.com>
-Date: Thu, 3 Dec 2020 17:33:09 +0100
-Subject: [PATCH 3/3] WIP OP-TEE SP use CNTVCT in place of CNTVCT
-
-The SPMC forbids access to the physical counter and Secure Partitions
-shall rather access the virtual counter (for which virtual offset is
-set to 0). More information at [1].
-
-[1] https://lists.trustedfirmware.org/pipermail/hafnium/2020-December/000092.html
-
-Change-Id: Ifab083921fa12154cafc31bd80ce91fa8da0db82
-Signed-off-by: Olivier Deprez <olivier.deprez@arm.com>
----
- core/arch/arm/include/arm64.h              | 2 +-
- core/arch/arm/include/kernel/delay.h       | 4 ++--
- core/arch/arm/kernel/arm32_sysreg.txt      | 2 +-
- core/arch/arm/kernel/tee_time_arm_cntpct.c | 4 ++--
- core/kernel/tee_ta_manager.c               | 4 ++--
- lib/libutee/arch/arm/arm32_user_sysreg.txt | 2 +-
- lib/libutee/include/arm64_user_sysreg.h    | 2 +-
- lib/libutils/ext/ftrace/ftrace.c           | 6 +++---
- 8 files changed, 13 insertions(+), 13 deletions(-)
-
-diff --git a/core/arch/arm/include/arm64.h b/core/arch/arm/include/arm64.h
-index 40a6b113..46c5431f 100644
---- a/core/arch/arm/include/arm64.h
-+++ b/core/arch/arm/include/arm64.h
-@@ -322,7 +322,7 @@ DEFINE_U32_REG_READ_FUNC(sctlr_el1)
- 
- /* ARM Generic timer functions */
- DEFINE_REG_READ_FUNC_(cntfrq, uint32_t, cntfrq_el0)
--DEFINE_REG_READ_FUNC_(cntpct, uint64_t, cntpct_el0)
-+DEFINE_REG_READ_FUNC_(cntvct, uint64_t, cntvct_el0)
- DEFINE_REG_READ_FUNC_(cntkctl, uint32_t, cntkctl_el1)
- DEFINE_REG_WRITE_FUNC_(cntkctl, uint32_t, cntkctl_el1)
- DEFINE_REG_READ_FUNC_(cntps_ctl, uint32_t, cntps_ctl_el1)
-diff --git a/core/arch/arm/include/kernel/delay.h b/core/arch/arm/include/kernel/delay.h
-index 00510059..34629ba2 100644
---- a/core/arch/arm/include/kernel/delay.h
-+++ b/core/arch/arm/include/kernel/delay.h
-@@ -44,12 +44,12 @@ static inline uint64_t arm_cnt_us2cnt(uint32_t us)
- 
- static inline uint64_t timeout_init_us(uint32_t us)
- {
--	return read_cntpct() + arm_cnt_us2cnt(us);
-+	return read_cntvct() + arm_cnt_us2cnt(us);
- }
- 
- static inline bool timeout_elapsed(uint64_t expire)
- {
--	return read_cntpct() > expire;
-+	return read_cntvct() > expire;
- }
- 
- #endif
-diff --git a/core/arch/arm/kernel/arm32_sysreg.txt b/core/arch/arm/kernel/arm32_sysreg.txt
-index b69ebcb4..155773f8 100644
---- a/core/arch/arm/kernel/arm32_sysreg.txt
-+++ b/core/arch/arm/kernel/arm32_sysreg.txt
-@@ -117,7 +117,7 @@ VBAR  c12 0 c0 0 RW Vector Base Address Register
- 
- @ B8.2 Generic Timer registers summary
- CNTFRQ    c14 0 c0  0 RW Counter Frequency register
--CNTPCT    -   0 c14 - RO Physical Count register
-+CNTVCT    -   1 c14 - RO Physical Count register
- CNTKCTL   c14 0 c1  0 RW Timer PL1 Control register
- CNTP_TVAL c14 0 c2  0 RW PL1 Physical TimerValue register
- CNTP_CTL  c14 0 c2  1 RW PL1 Physical Timer Control register
-diff --git a/core/arch/arm/kernel/tee_time_arm_cntpct.c b/core/arch/arm/kernel/tee_time_arm_cntpct.c
-index 3c41e4c2..04e673d9 100644
---- a/core/arch/arm/kernel/tee_time_arm_cntpct.c
-+++ b/core/arch/arm/kernel/tee_time_arm_cntpct.c
-@@ -16,7 +16,7 @@
- 
- static TEE_Result arm_cntpct_get_sys_time(TEE_Time *time)
- {
--	uint64_t cntpct = read_cntpct();
-+	uint64_t cntpct = read_cntvct();
- 	uint32_t cntfrq = read_cntfrq();
- 
- 	time->seconds = cntpct / cntfrq;
-@@ -49,7 +49,7 @@ REGISTER_TIME_SOURCE(arm_cntpct_time_source)
- 
- void plat_prng_add_jitter_entropy(enum crypto_rng_src sid, unsigned int *pnum)
- {
--	uint64_t tsc = read_cntpct();
-+	uint64_t tsc = read_cntvct();
- 	int bytes = 0, n;
- 	static uint8_t first, bits;
- 	static uint16_t acc;
-diff --git a/core/kernel/tee_ta_manager.c b/core/kernel/tee_ta_manager.c
-index 46632ce7..4153fbd8 100644
---- a/core/kernel/tee_ta_manager.c
-+++ b/core/kernel/tee_ta_manager.c
-@@ -923,7 +923,7 @@ static void gprof_update_session_utime(bool suspend, struct ts_session *s,
- static void tee_ta_update_session_utime(bool suspend)
- {
- 	struct ts_session *s = ts_get_current_session();
--	uint64_t now = read_cntpct();
-+	uint64_t now = read_cntvct();
- 
- 	gprof_update_session_utime(suspend, s, now);
- }
-@@ -947,7 +947,7 @@ static void ftrace_update_times(bool suspend)
- 	uint64_t now = 0;
- 	uint32_t i = 0;
- 
--	now = read_cntpct();
-+	now = read_cntvct();
- 
- 	fbuf = s->fbuf;
- 	if (!fbuf)
-diff --git a/lib/libutee/arch/arm/arm32_user_sysreg.txt b/lib/libutee/arch/arm/arm32_user_sysreg.txt
-index 8baefd10..13e28f20 100644
---- a/lib/libutee/arch/arm/arm32_user_sysreg.txt
-+++ b/lib/libutee/arch/arm/arm32_user_sysreg.txt
-@@ -10,4 +10,4 @@
- 
- @ B8.2 Generic Timer registers summary
- CNTFRQ    c14 0 c0  0 RW Counter Frequency register
--CNTPCT    -   0 c14 - RO Physical Count register
-+CNTVCT    -   1 c14 - RO Physical Count register
-diff --git a/lib/libutee/include/arm64_user_sysreg.h b/lib/libutee/include/arm64_user_sysreg.h
-index db4ee188..722a08c9 100644
---- a/lib/libutee/include/arm64_user_sysreg.h
-+++ b/lib/libutee/include/arm64_user_sysreg.h
-@@ -31,7 +31,7 @@ static inline __noprof void write_##reg(type val)		\
- 
- /* ARM Generic timer functions */
- DEFINE_REG_READ_FUNC_(cntfrq, uint32_t, cntfrq_el0)
--DEFINE_REG_READ_FUNC_(cntpct, uint64_t, cntpct_el0)
-+DEFINE_REG_READ_FUNC_(cntvct, uint64_t, cntvct_el0)
- DEFINE_REG_READ_FUNC_(tpidr_el0, uint64_t, tpidr_el0)
- DEFINE_REG_WRITE_FUNC_(tpidr_el0, uint64_t, tpidr_el0)
- 
-diff --git a/lib/libutils/ext/ftrace/ftrace.c b/lib/libutils/ext/ftrace/ftrace.c
-index 101aa594..637cbd19 100644
---- a/lib/libutils/ext/ftrace/ftrace.c
-+++ b/lib/libutils/ext/ftrace/ftrace.c
-@@ -165,7 +165,7 @@ void __noprof ftrace_enter(unsigned long pc, unsigned long *lr)
- 
- 	if (fbuf->ret_idx < FTRACE_RETFUNC_DEPTH) {
- 		fbuf->ret_stack[fbuf->ret_idx] = *lr;
--		fbuf->begin_time[fbuf->ret_idx] = read_cntpct();
-+		fbuf->begin_time[fbuf->ret_idx] = read_cntvct();
- 		fbuf->ret_idx++;
- 	} else {
- 		/*
-@@ -269,7 +269,7 @@ unsigned long __noprof ftrace_return(void)
- 		dur_loc = curr_buf - (fbuf->ret_idx +
- 				      (2 * sizeof(unsigned long)) + 11);
- 		ftrace_duration(dur_loc, fbuf->begin_time[fbuf->ret_idx],
--				read_cntpct());
-+				read_cntvct());
- 	} else {
- 		bool full = false;
- 
-@@ -297,7 +297,7 @@ unsigned long __noprof ftrace_return(void)
- 			dur_loc = curr_buf - fbuf->ret_idx - 6;
- 			ftrace_duration(dur_loc,
- 					fbuf->begin_time[fbuf->ret_idx],
--					read_cntpct());
-+					read_cntvct());
- 		}
- 	}
- 
--- 
-2.29.2
-
diff --git a/meta-arm-bsp/recipes-security/optee/optee-client-tc0.inc b/meta-arm-bsp/recipes-security/optee/optee-client-tc0.inc
index ad9c475..5e06ed5 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-client-tc0.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-client-tc0.inc
@@ -1,12 +1,7 @@
 # TC0 specific configuration
 
-# Intermediate SHA with 3.11 baseline version
-SRCREV = "3f44b870299514ad8c6b7dee776eb2994d9c1cd4"
-PV = "3.11.0+git${SRCPV}"
-
 FILESEXTRAPATHS_prepend_tc0 := "${THISDIR}/files/optee-client/tc0:"
 
 SRC_URI_append = " \
     file://0001-Revert-libteec-Avoid-memcpy-when-using-TEEC_TempMemo.patch \
-    file://0002-Allocate-page-aligned-shared-memory-buffers.patch \
     "
diff --git a/meta-arm-bsp/recipes-security/optee/optee-client_3.11.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/optee-client_3.11.0.bbappend
rename to meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bbappend
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc b/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc
index 1b03a35..2e03f11 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc
@@ -1,30 +1,12 @@
 # TC0 specific configuration
 
-# Intermediate SHA with 3.11 baseline version
-SRCREV = "3284d935bc7e7bf7abfb5b19394a387d975d6dd4"
-PV = "3.11.0+git${SRCPV}"
-
-# This is incorporated into the SRCREV above
-SRC_URI_remove = " \
-    file://0001-libutils-provide-empty-__getauxval-implementation.patch \
-    file://0002-link.mk-implement-support-for-libnames-after-libgcc-.patch \
-    file://0003-ta_dev_kit.mk-make-sure-that-libutils-is-linked-seco.patch \
-    "
-
 FILESEXTRAPATHS_prepend_tc0 := "${THISDIR}/files/optee-os/tc0:"
 
 SRC_URI_append = " \
-    file://0001-core-SPMC-update-for-FF-A-version-1.0.patch \
-    file://0002-core-add-thread_smccc.patch \
-    file://0003-core-enable-SPCI-with-SPM-Core-at-S-EL2.patch \
-    file://0004-core-fixes-to-align-with-upstream-hafnium.patch \
-    file://0005-core-arm-Total-Compute-platform-support.patch \
-    file://0006-plat-totalcompute-Add-support-for-S-EL2-SPMC.patch \
-    file://0007-plat-totalcompute-add-optee-manifest-file-and-sp-lay.patch \
-    file://0008-plat-totalcompute-define-tzdram-start-address-for-S-.patch \
-    file://0009-plat-totalcompute-add-Theodul-DSU-support.patch \
-    file://0010-WIP-OP-TEE-SP-declare-device-regions-in-manifest.patch \
-    file://0011-WIP-OP-TEE-SP-use-CNTVCT-in-place-of-CNTVCT.patch \
+    file://0001-core-arm-Total-Compute-platform-support.patch \
+    file://0002-plat-totalcompute-define-tzdram-start-address-for-S-.patch \
+    file://0003-plat-totalcompute-Add-OP-TEE-SP-manifest-file.patch \
+    file://0004-plat-totalcompute-Add-support-for-S-EL2-SPMC.patch \
     "
 
 COMPATIBLE_MACHINE = "tc0"
@@ -42,13 +24,9 @@ EXTRA_OEMAKE += " CFG_WITH_STATS=y"
 
 EXTRA_OEMAKE += " CFG_CORE_SEL2_SPMC=y"
 
-# Copy optee manifest file and sp_layout
-# This function will be modified or removed once upstream optee-os adds support
-# for SEL2 SPMC config
+# Copy optee sp manifest file
 do_install_append() {
     install -d ${D}${nonarch_base_libdir}/firmware/
-    install -m 644 ${S}/core/arch/arm/plat-totalcompute/sp_layout.json \
-        ${D}${nonarch_base_libdir}/firmware/
-    install -m 644 ${S}/core/arch/arm/plat-totalcompute/optee_manifest.dts \
+    install -m 644 ${S}/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts \
         ${D}${nonarch_base_libdir}/firmware/
 }
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.11.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/optee-os_3.11.0.bbappend
rename to meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test-tc0.inc b/meta-arm-bsp/recipes-security/optee/optee-test-tc0.inc
index cca5076..832fea1 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-test-tc0.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-test-tc0.inc
@@ -1,14 +1,3 @@
 # TC0 specific configuration
 
-# Intermediate SHA with 3.11 baseline version
-SRCREV = "b35df64954ef96e09c0d5573014f4d1432dbc92f"
-PV = "3.11.0+git${SRCPV}"
-
-# This is incorporated into the SRCREV above
-SRC_URI_remove = " \
-    file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
-    file://0002-make-remove-Wno-unsafe-loop-for-clang.patch \
-    file://0003-make-remove-Wmissing-noreturn-for-clang.patch \
-"
-
 COMPATIBLE_MACHINE = "tc0"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_3.11.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/optee-test_3.11.0.bbappend
rename to meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappend
-- 
2.25.1

