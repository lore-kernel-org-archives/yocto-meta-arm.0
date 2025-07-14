Return-Path: <mariam.elshakfy@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081F0C83F1A
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 12:07:32 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.76466.1752494842274278486
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Jul 2025 05:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=F5fuoHWz;
 spf=pass (domain: linaro.org, ip: 209.85.221.45, mailfrom: mariam.elshakfy@linaro.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ab112dea41so2259540f8f.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 14 Jul 2025 05:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752494840; x=1753099640; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmhe04NutJ+1hMAEZiMwsbqsi7Sr1yJNUAJDmsKYcf4=;
        b=F5fuoHWzxfEJPZdpopPt+W20fiNqaiSPKN4D5TGeFlMCAAJD6cL/eb7eAifZM0B9yS
         xZmlQkDY6wPwk1E4uUbKtivNfeyipy49vzVQSTFNXB5CUvMPqJ0oJ+3vxmdyu3d3sL4H
         gWoqaMLLb3SdHZPv6mh0Uw4qauI9g4QlvsW/jhd3Pk0X0t+1kDQUXPKpv9pwNgpk0QTq
         f4Zp1oBBtDWFLcd/gLT7KDy5uxT5rQfyScbiyUmMnuK3E2K0VYlUP4rx9ZaqTimhjB9r
         5onRvobZXdSrcUWIVi8prDt2pqmstq9gDpsgcMP/cJDr5iDAw5mCWADR5/HZjUHrd+KS
         V2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752494840; x=1753099640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmhe04NutJ+1hMAEZiMwsbqsi7Sr1yJNUAJDmsKYcf4=;
        b=DjDMwB4u2dJgV2zxVJegCY2TKPzUxC24tkFSffeUCMbNG/LPKaEWQN/brh212CzmjY
         5mQeZkxSznQk+qvvtzK7S19vAXz2R41MJqpKnwvZ5HWz2n2ON5/Q5gXgaSJtdpj0F2KH
         xA1sF24hPP8Rp0tubS2oAoDxJtapzW/91khxKUBYFYsLhOT/q/rupRAF+kIu5/2FkjJZ
         Eb12Bs0hUdV62rofl8HzvjzYTxDBeVCSytkHU8+NkMqlqol+t/wxj9ecMtodQ+vRFik9
         ADEhe76pRm+NJKqXkv8UU2xlbbFhroq81alioblwVxmvokHfNbGIryWG5GPnrUT/HSZY
         +A9A==
X-Gm-Message-State: AOJu0Yy5r1RcV6BAXswKHsU2eeZRr9Db25uOkI1KWQShdWL26ge9TndV
	1GIWo+yp1LgjUuOfCurLdyL+fRBGqOAF9NQ7GK265gBFg/lcYvXEsRlL4U/SNZCRq2DR9JvCnXL
	ZUZ8/
X-Gm-Gg: ASbGncvuAvcLoxVOcO22EZcC9L0ZU6hiXNND2NlRL72C060UoBqYbJm+SwfAyi9y/N0
	TsGGgM/K6DuXrLU1PkJwHbZXrJLH6Vqgzj6/s7Td/2Hf4mh8PKoLwe9p2edID0+l1cAuX8pd2hO
	Lb43bs7JykltcRpeS2nPfVE/S0kb1fpdHCJdatdFKXKLGADU48UgbUuzH1MRQtun72rciHuKv/Z
	oybB0zoH1+PvJyP2u/6xGZif9bJyzt2w7qFiWApvJo5SbthrAkm5Yld1rHW5wvJRMpZG9QDliZh
	hjGrdcMaRw8L6HeiTtvtYG0XMOe4lQILyKJdngXgLVx6xc+5JrTWWpH4JI/f5FCNeFMVqAjmUcQ
	xSXe6lbDEn7RaIatmVzA8hz3Gir4cwkBs+7TKYuXIgjDpHxlx83IzvtRX9yrFSbLY1hlisB4=
X-Google-Smtp-Source: AGHT+IFt4nnB79VNSo/nVb7qO+7NxiOZhiZrBdElNYXzilXlY6bUw0IakgBkNc+dMv6yd5r1ZyYkcg==
X-Received: by 2002:a05:6000:40de:b0:3a4:d9fa:f1ed with SMTP id ffacd0b85a97d-3b5f3530763mr8984616f8f.13.1752494840241;
        Mon, 14 Jul 2025 05:07:20 -0700 (PDT)
Received: from ip-10-252-32-24.eu-west-1.compute.internal ([217.140.109.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8bd1997sm12472060f8f.10.2025.07.14.05.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 05:07:19 -0700 (PDT)
From: Mariam Elshakfy <mariam.elshakfy@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mariam Elshakfy <mariam.elshakfy@linaro.org>
Subject: [PATCH 2/2] arm/optee: Backport fix for CVE-2025-46733
Date: Mon, 14 Jul 2025 12:07:14 +0000
Message-Id: <20250714120714.337891-3-mariam.elshakfy@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714120714.337891-1-mariam.elshakfy@linaro.org>
References: <20250714120714.337891-1-mariam.elshakfy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 14 Jul 2025 12:07:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6609

This CVE is fixed in optee 4.7, so backport for 4.6
For optee-ftpm, the change is submitted right after
the 4.6 tag, so update the SHA instead of holding an
out-of-tree patch.

Signed-off-by: Mariam Elshakfy <mariam.elshakfy@linaro.org>
---
 .../optee-ftpm/optee-ftpm_4.6.0.bb            |  4 +-
 ... => 0001-optee-enable-clang-support.patch} |  0
 ...002-Add-optee-ta-instanceKeepCrashed.patch | 89 +++++++++++++++++++
 .../recipes-security/optee/optee-os_4.6.0.bb  |  3 +-
 4 files changed, 93 insertions(+), 3 deletions(-)
 rename meta-arm/recipes-security/optee/optee-os/{0003-optee-enable-clang-support.patch => 0001-optee-enable-clang-support.patch} (100%)
 create mode 100644 meta-arm/recipes-security/optee/optee-os/0002-Add-optee-ta-instanceKeepCrashed.patch

diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.6.0.bb b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.6.0.bb
index f611a451..9f328c25 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.6.0.bb
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.6.0.bb
@@ -35,8 +35,8 @@ SRC_URI = "\
 # As per optee-ftpm TA documentation, we have to use this SHA of MS TPM reference
 SRCREV_ms-tpm   ?= "98b60a44aba79b15fcce1c0d1e46cf5918400f6a"
 
-# v4.6.0
-SRCREV_optee-ta ?= "6f99e783eb9bb57c314a881433d4ec970de87959"
+# v4.6.0 + fix for CVE-2025-46733
+SRCREV_optee-ta ?= "ce33372ab772e879826361a1ca91126260bd9be1"
 
 SRCREV_FORMAT    = "ms-tpm_optee-ta"
 
diff --git a/meta-arm/recipes-security/optee/optee-os/0003-optee-enable-clang-support.patch b/meta-arm/recipes-security/optee/optee-os/0001-optee-enable-clang-support.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os/0003-optee-enable-clang-support.patch
rename to meta-arm/recipes-security/optee/optee-os/0001-optee-enable-clang-support.patch
diff --git a/meta-arm/recipes-security/optee/optee-os/0002-Add-optee-ta-instanceKeepCrashed.patch b/meta-arm/recipes-security/optee/optee-os/0002-Add-optee-ta-instanceKeepCrashed.patch
new file mode 100644
index 00000000..6ba379aa
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/0002-Add-optee-ta-instanceKeepCrashed.patch
@@ -0,0 +1,89 @@
+From 941a58d78c99c4754fbd4ec3079ec9e1d596af8f Mon Sep 17 00:00:00 2001
+From: Jens Wiklander <jens.wiklander@linaro.org>
+Date: Fri, 4 Apr 2025 10:24:34 +0200
+Subject: [PATCH] Add optee.ta.instanceKeepCrashed property
+
+Add the optee.ta.instanceKeepCrashed property to prevent a TA with
+gpd.ta.instanceKeepAlive=true to be restarted. This prevents unexpected
+resetting of the state of the TA.
+
+Upstream-Status: Backport
+CVE: CVE-2025-46733
+Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
+Reviewed-by: Jerome Forissier <jerome.forissier@linaro.org>
+Reviewed-by: Alex Lewontin <alex.lewontin@canonical.com>
+Reviewed-by: Etienne Carriere <etienne.carriere@foss.st.com>
+---
+ core/kernel/tee_ta_manager.c         | 10 +++++++---
+ lib/libutee/include/user_ta_header.h |  8 +++++++-
+ ta/user_ta_header.c                  |  3 +++
+ 3 files changed, 17 insertions(+), 4 deletions(-)
+
+diff --git a/core/kernel/tee_ta_manager.c b/core/kernel/tee_ta_manager.c
+index e4740468873..75e55a8e475 100644
+--- a/core/kernel/tee_ta_manager.c
++++ b/core/kernel/tee_ta_manager.c
+@@ -455,6 +455,7 @@ TEE_Result tee_ta_close_session(struct tee_ta_session *csess,
+	struct tee_ta_session *sess = NULL;
+	struct tee_ta_ctx *ctx = NULL;
+	struct ts_ctx *ts_ctx = NULL;
++	bool keep_crashed = false;
+	bool keep_alive = false;
+
+	DMSG("csess 0x%" PRIxVA " id %u",
+@@ -501,9 +502,12 @@ TEE_Result tee_ta_close_session(struct tee_ta_session *csess,
+		panic();
+
+	ctx->ref_count--;
+-	keep_alive = (ctx->flags & TA_FLAG_INSTANCE_KEEP_ALIVE) &&
+-			(ctx->flags & TA_FLAG_SINGLE_INSTANCE);
+-	if (!ctx->ref_count && (ctx->panicked || !keep_alive)) {
++	if (ctx->flags & TA_FLAG_SINGLE_INSTANCE)
++		keep_alive = ctx->flags & TA_FLAG_INSTANCE_KEEP_ALIVE;
++	if (keep_alive)
++		keep_crashed = ctx->flags & TA_FLAG_INSTANCE_KEEP_CRASHED;
++	if (!ctx->ref_count &&
++	    ((ctx->panicked && !keep_crashed) || !keep_alive)) {
+		if (!ctx->is_releasing) {
+			TAILQ_REMOVE(&tee_ctxes, ctx, link);
+			ctx->is_releasing = true;
+diff --git a/lib/libutee/include/user_ta_header.h b/lib/libutee/include/user_ta_header.h
+index 0336c64b2f7..c5622982f2e 100644
+--- a/lib/libutee/include/user_ta_header.h
++++ b/lib/libutee/include/user_ta_header.h
+@@ -52,8 +52,13 @@
+					BIT32(11)
+ #define TA_FLAG_DEVICE_ENUM_TEE_STORAGE_PRIVATE	\
+					BIT32(12) /* with TEE_STORAGE_PRIVATE */
++/*
++ * Don't restart a TA with TA_FLAG_INSTANCE_KEEP_ALIVE set if it has
++ * crashed.
++ */
++#define TA_FLAG_INSTANCE_KEEP_CRASHED	BIT32(13)
+
+-#define TA_FLAGS_MASK			GENMASK_32(12, 0)
++#define TA_FLAGS_MASK			GENMASK_32(13, 0)
+
+ struct ta_head {
+	TEE_UUID uuid;
+@@ -133,6 +138,7 @@ extern struct __elf_phdr_info __elf_phdr_info;
+ #define TA_PROP_STR_SINGLE_INSTANCE	"gpd.ta.singleInstance"
+ #define TA_PROP_STR_MULTI_SESSION	"gpd.ta.multiSession"
+ #define TA_PROP_STR_KEEP_ALIVE		"gpd.ta.instanceKeepAlive"
++#define TA_PROP_STR_KEEP_CRASHED	"optee.ta.instanceKeepCrashed"
+ #define TA_PROP_STR_DATA_SIZE		"gpd.ta.dataSize"
+ #define TA_PROP_STR_STACK_SIZE		"gpd.ta.stackSize"
+ #define TA_PROP_STR_VERSION		"gpd.ta.version"
+diff --git a/ta/user_ta_header.c b/ta/user_ta_header.c
+index 3125af55c44..aa804c1efaa 100644
+--- a/ta/user_ta_header.c
++++ b/ta/user_ta_header.c
+@@ -142,6 +142,9 @@ const struct user_ta_property ta_props[] = {
+	{TA_PROP_STR_KEEP_ALIVE, USER_TA_PROP_TYPE_BOOL,
+	 &(const bool){(TA_FLAGS & TA_FLAG_INSTANCE_KEEP_ALIVE) != 0}},
+
++	{TA_PROP_STR_KEEP_CRASHED, USER_TA_PROP_TYPE_BOOL,
++	 &(const bool){(TA_FLAGS & TA_FLAG_INSTANCE_KEEP_CRASHED) != 0}},
++
+	{TA_PROP_STR_DATA_SIZE, USER_TA_PROP_TYPE_U32,
+	 &(const uint32_t){TA_DATA_SIZE}},
diff --git a/meta-arm/recipes-security/optee/optee-os_4.6.0.bb b/meta-arm/recipes-security/optee/optee-os_4.6.0.bb
index c9a6b261..3e0eea20 100644
--- a/meta-arm/recipes-security/optee/optee-os_4.6.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_4.6.0.bb
@@ -7,5 +7,6 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 # v4.6.0
 SRCREV = "71785645fa6ce42db40dbf5a54e0eaedc4f61591"
 SRC_URI += " \
-    file://0003-optee-enable-clang-support.patch \
+    file://0001-optee-enable-clang-support.patch \
+    file://0002-Add-optee-ta-instanceKeepCrashed.patch \
    "

