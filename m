Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web12.13438.1589899881816646818
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 May 2020 07:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FOhZnqy9;
 spf=pass (domain: gmail.com, ip: 209.85.166.196, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f196.google.com with SMTP id b15so13630644ilq.12
        for <meta-arm@lists.yoctoproject.org>; Tue, 19 May 2020 07:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=oFjV/cp9KhmoskEaJFQd/zyw36xRJM98b+A2vMHbJbE=;
        b=FOhZnqy9ecqOblewC119xzSYGG3Z5I2DrMBiuYGvRuo+pFkivGpvA7c3+ho6kd2803
         GHLwONZdyZkqYbDP1n9mUrFuDAkJB7c2R8jIEVp9lqW6XggktQHhScDBRllCpml9gnqZ
         qgDsK67i8fXv06chb/NEHYznf/2thm3elND4AJg6DRQaOYI8cQBFIs5ZJPth4ZlSNdHm
         pel5WZy7wKmdtgfHMsWeOv0lkBJIo4Gt1TpZUuv31XoFk1yxjPc5Fae7TEyWiw7QY9ox
         tnumxqHAnCKsCy1kYeBo40kP+OiVugUQ1v2c3iJYL51xJJB5CSi01yocbJa/i8zIdGfb
         5YIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=oFjV/cp9KhmoskEaJFQd/zyw36xRJM98b+A2vMHbJbE=;
        b=G7WRmlsKJshW/+ICxA7zUnA2K9MGDTizTiHIoB83RwKT965fV7fxM+MWalFPJCppgK
         avst6VvWKE9SFfD+rw6GkTgnTjpFj2+JsIN7m04XyYY9xrMdsFE2uBD+bffdxnM5Kq4J
         fXLdKtbJEbx6s9jurUHXu+AFEW5PlQFiIqP/Pr5/Ua4FzICP5nYF0QnILGkqUrAZTpbY
         tcYDcIXG8GVO8X20wdZrrPaYj4ha6Ghvb6MwxEPt47kKOgqmACrTVuyptd0auR4vFxP4
         4IbgyyQ1NAUFPvZeQPsUUGtybGPx0+nBZDiubHC1z3cuRP/zxpbCayPHtQmvcmEupNKN
         Rerw==
X-Gm-Message-State: AOAM530KyEoex8NHCAG6hSIFhRGYFl9SCbqpOOEpdX434ywYvuLakMW7
	0rcFNtNH2He84C5Ns/IgKSUB1J2UJLs=
X-Google-Smtp-Source: ABdhPJzvrEjmJ9iViqq5U3Xqu2uTZZtRdBBvnbyNOb7mEpnTdJALiutH78XE+to9SBp0kFWA5iEaWw==
X-Received: by 2002:a92:358d:: with SMTP id c13mr13867600ilf.259.1589899880822;
        Tue, 19 May 2020 07:51:20 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:b034:bbe0:4a36:f99])
        by smtp.gmail.com with ESMTPSA id q75sm6202388ili.11.2020.05.19.07.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 07:51:20 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: denys@ti.com,
	jdmason@kudzu.us,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-arm][PATCH v2] optee-os: Fix compile with GCC 10
Date: Tue, 19 May 2020 09:51:15 -0500
Message-Id: <20200519145115.13708-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519013753.28782-1-JPEWhacker@gmail.com>
References: <20200519013753.28782-1-JPEWhacker@gmail.com>

Adds a patch to fix compiles with GCC 10 due to the way that libgcc
detects LSE support using __getauxval().

V2: Incorporate patch changes suggested by upstream

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 ...sable-outline-atomics-when-compiling.patch | 41 +++++++++++++++++++
 .../recipes-security/optee/optee-os_git.bb    |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee/optee-os/0001-arm64-Disable-outline-atomics-when-compiling.patch

diff --git a/meta-arm/recipes-security/optee/optee-os/0001-arm64-Disable-outline-atomics-when-compiling.patch b/meta-arm/recipes-security/optee/optee-os/0001-arm64-Disable-outline-atomics-when-compiling.patch
new file mode 100644
index 0000000..086d433
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/0001-arm64-Disable-outline-atomics-when-compiling.patch
@@ -0,0 +1,41 @@
+From f94d9558d9eae48e92ce8d651539b6cf69eb4394 Mon Sep 17 00:00:00 2001
+From: Joshua Watt <JPEWhacker@gmail.com>
+Date: Mon, 18 May 2020 20:00:00 -0500
+Subject: [PATCH] arm64: Disable outline-atomics when compiling
+
+Disables the automatic detection of LSE (Large System Extension)
+instructions when compiling AArch64 code. GCC 10 implements this
+detection in libgcc using __getauxval(), which optee doesn't implement.
+This requires that the proper -mcpu is passed to GCC so that the code
+can be correctly compiled to use either LSE or load-store-exclusive.
+
+Fixes linker errors like the following when compiling with GCC 10:
+
+ aarch64-linux-ld.bfd: libgcc.a(lse-init.o):
+    in function `init_have_lse_atomics':
+ lse-init.c:44: undefined reference to `__getauxval'
+ core/arch/arm/kernel/link.mk:38:
+    recipe for target 'build/core/all_objs.o' failed
+
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+Upstream-Status: Submitted [https://github.com/OP-TEE/optee_os/pull/3874]
+---
+ core/arch/arm/arm.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/core/arch/arm/arm.mk b/core/arch/arm/arm.mk
+index a18eda3b..07069c66 100644
+--- a/core/arch/arm/arm.mk
++++ b/core/arch/arm/arm.mk
+@@ -115,7 +115,7 @@ arm32-platform-aflags-no-hard-float ?=
+ 
+ arm64-platform-cflags-no-hard-float ?= -mgeneral-regs-only
+ arm64-platform-cflags-hard-float ?=
+-arm64-platform-cflags-generic ?= -mstrict-align
++arm64-platform-cflags-generic ?= -mstrict-align $(call cc-option,-mno-outline-atomics,)
+ 
+ ifeq ($(DEBUG),1)
+ # For backwards compatibility
+-- 
+2.17.1
+
diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/recipes-security/optee/optee-os_git.bb
index dfff6d1..07c17f0 100644
--- a/meta-arm/recipes-security/optee/optee-os_git.bb
+++ b/meta-arm/recipes-security/optee/optee-os_git.bb
@@ -16,6 +16,7 @@ SRCREV = "023e33656e2c9557ce50ad63a98b2e2c9b51c118"
 SRC_URI = " \
     git://github.com/OP-TEE/optee_os.git \
     file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
+    file://0001-arm64-Disable-outline-atomics-when-compiling.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.17.1

