Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
 by mx.groups.io with SMTP id smtpd.web11.4371.1589852279473348653
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 May 2020 18:37:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ft/d55/A;
 spf=pass (domain: gmail.com, ip: 209.85.166.65, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f65.google.com with SMTP id d7so12831463ioq.5
        for <meta-arm@lists.yoctoproject.org>; Mon, 18 May 2020 18:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=epU/LiC8h8P8y3FhwrfvA7wPt9IA4OnZUPMGBU9gK6c=;
        b=ft/d55/A5cOf2yiiLIzn4JumrTRcGorEYnudX5qOcUOCV5ux2MdPs69AG9jdUUwSLK
         +jv/qp/dYDNPgNWS3VihdyeMDKE5uhgS5HzwlBc6tjAvF5tYbeRpEGRndF7xeBjNO5hc
         SBB10v6wbBluwxMsn42ryoMhI6X49ee9gs2UlFNTEGXy6iR9jEwkBA3NJea0llauzMMN
         iSmdQB8SDDzFoJjHpk+cfBQqLevT3NB3oyoRKMNfQsyQaMZDsUMBIQi/Po89LqiaAAX1
         qktShTnX7EfI9jpBoTXVO0HsDT+nRbt7WODaQB/PR8RQug9xTukesMcip4Ud0aXyX/p7
         IKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=epU/LiC8h8P8y3FhwrfvA7wPt9IA4OnZUPMGBU9gK6c=;
        b=VooTyW4zouuRBJJblksjed4Q5sOLGLLIyUmwoUehd9zAGQzEKD9+5AZ9gJK1bz8tZA
         vGXA6y9N0ibt4dHgR9QRPkZYcl5neOySjg18imlR/jmwe/gv5DBHZRiD1BTln8nFe2+J
         I+VmTUC/rJUQGcxsQzBH3mfcyWTzv9aAss4n6f0TcSP5QGhSfUiBLYbKvwxj+i4cuCcg
         +byvq2+AIKVX3OxfFvPmB92nepVPCfLGGp6X5TihOeSGZgnfeXssgjIUqHj0r7bdAviT
         XJvKBjQUE/zXVrEWLbkTPy5wjwV0bpMA4YvJQz5vy2Whczx2z8JnoeZ3s1UXNmC/JTwx
         lA/Q==
X-Gm-Message-State: AOAM530WcF+V9FlEHNJ7DH7MC//dRomA2EuI4ws0RU4X/WABLzA25AF6
	7so0gPMs3JfKS0nfTYsUOqLwWGb4TGc=
X-Google-Smtp-Source: ABdhPJytsjje3vzW2heePfJCS5crd7G1BSBGuAamhVaUtX2qvSEvDOO4inRZEoXp59Pw6AonAhp/nQ==
X-Received: by 2002:a05:6638:2ad:: with SMTP id d13mr17923871jaq.119.1589852278322;
        Mon, 18 May 2020 18:37:58 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:3995:b857:4ddd:5854])
        by smtp.gmail.com with ESMTPSA id s71sm5455526ilc.32.2020.05.18.18.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 18:37:57 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: denys@ti.com,
	jdmason@kudzu.us,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-arm][PATCH] optee-os: Fix compile with GCC 10
Date: Mon, 18 May 2020 20:37:53 -0500
Message-Id: <20200519013753.28782-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1

Adds a patch to fix compiles with GCC 10 due to the way that libgcc
detects LSE support using __getauxval().

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 ...sable-outline-atomics-when-compiling.patch | 41 +++++++++++++++++++
 .../recipes-security/optee/optee-os_git.bb    |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee/optee-os/0001-core-Disable-outline-atomics-when-compiling.patch

diff --git a/meta-arm/recipes-security/optee/optee-os/0001-core-Disable-outline-atomics-when-compiling.patch b/meta-arm/recipes-security/optee/optee-os/0001-core-Disable-outline-atomics-when-compiling.patch
new file mode 100644
index 0000000..2fd8636
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/0001-core-Disable-outline-atomics-when-compiling.patch
@@ -0,0 +1,41 @@
+From f7136c2fade707d0287dbeed031da3def3abdc79 Mon Sep 17 00:00:00 2001
+From: Joshua Watt <JPEWhacker@gmail.com>
+Date: Mon, 18 May 2020 20:00:00 -0500
+Subject: [PATCH] core: Disable outline-atomics when compiling
+
+Disables the automatic detection of LSE (Large System Extension)
+instructions when compiling AArch64 code. GCC 10 implements this
+detection in libgcc using __getauxval(), which optee doesn't implement.
+This requires that the proper -mcpu is passed to GCC so that the code
+can be correctly compiled to use either LSE or load-store-exclusive.
+
+Fixes linker errors like the following when compiling with GCC 10:
+
+ aarch64-linux-ld.bfd: libgcc.a(lse-init.o): in function
+  `init_have_lse_atomics':
+ lse-init.c:44: undefined reference to `__getauxval'
+ core/arch/arm/kernel/link.mk:38: recipe for target
+  'build/core/all_objs.o' failed
+
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+Upstream-Status: Submitted [https://github.com/OP-TEE/optee_os/pull/3874]
+---
+ core/arch/arm/arm.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/core/arch/arm/arm.mk b/core/arch/arm/arm.mk
+index a18eda3b..c13fad35 100644
+--- a/core/arch/arm/arm.mk
++++ b/core/arch/arm/arm.mk
+@@ -115,7 +115,7 @@ arm32-platform-aflags-no-hard-float ?=
+ 
+ arm64-platform-cflags-no-hard-float ?= -mgeneral-regs-only
+ arm64-platform-cflags-hard-float ?=
+-arm64-platform-cflags-generic ?= -mstrict-align
++arm64-platform-cflags-generic ?= -mstrict-align -mno-outline-atomics
+ 
+ ifeq ($(DEBUG),1)
+ # For backwards compatibility
+-- 
+2.17.1
+
diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/recipes-security/optee/optee-os_git.bb
index dfff6d1..c13289b 100644
--- a/meta-arm/recipes-security/optee/optee-os_git.bb
+++ b/meta-arm/recipes-security/optee/optee-os_git.bb
@@ -16,6 +16,7 @@ SRCREV = "023e33656e2c9557ce50ad63a98b2e2c9b51c118"
 SRC_URI = " \
     git://github.com/OP-TEE/optee_os.git \
     file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
+    file://0001-core-Disable-outline-atomics-when-compiling.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.17.1

