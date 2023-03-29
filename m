Return-Path: <rui.silva@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B28C761AF
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 16:15:46 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.743.1680106539526142171
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Mar 2023 09:15:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Ks6zXPkP;
 spf=pass (domain: linaro.org, ip: 209.85.128.52, mailfrom: rui.silva@linaro.org)
Received: by mail-wm1-f52.google.com with SMTP id u1so9270399wmn.5
        for <meta-arm@lists.yoctoproject.org>; Wed, 29 Mar 2023 09:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680106538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D0J8OjgD0dn3doIgsOrYtVE8NaqGiY7NFzyJniJajEQ=;
        b=Ks6zXPkP0mB5SgmiDPhIJcDPVnnWZ0X08DRDYxv5rAylhW5njSlBGNhh+HDP9oNoqM
         0qao8niu8faqEdIPcvjYIns6J52SlzP43aCl4SHJIpP++DxaDga/MeNDYEbuzaqAn+Rr
         XWGiAxY8cIg4XRNTEcUWJCi1G6FWkw3hNjK+Mreq8bHV3pegm2NJaBvY6ygj4IMK5yrR
         uQsjwyjv7Roa7UBNpTLnqyI87u24Mi3RBfP9Xh17M3J+QyGp0d+s96tZd+Il6UcRpxQB
         +rW9X0i1gTILdQMuWzTCxbg5n1Nu0/Fho6yMyt1RyHfNLE5OL5SKomHOZDOsiVucpKbN
         zjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680106538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0J8OjgD0dn3doIgsOrYtVE8NaqGiY7NFzyJniJajEQ=;
        b=BOoryQK6LA/e8Z7LWzU26z/a9kOVXYWCZh6y1diDgOeErEnFwe2uUsPeaTKw2U2jNp
         0xVbin41ki1u2pl53u4nXJhsW5iFSI602g07bw2xh0JnOY5tIDRyuC/47VBgYgsDvSkL
         w2/hSZEbAOtz3qKNuykyoT6c85gxcjZgL8cshNrWvFnfkoOppkYOPYErFCeot0Bo0gvs
         y3GMX5uKtlysekC8LzD3lV8VeL8svkzwqeK5n86yqrLTs9tkuheAdWi3/z019rj9Xso4
         TKYmbQ+qILgKOIPz3ZKJIa4Et4qT58lnFUOjpZ250/iV0cNTQqUKu8Qy2Ggsbf9+Kwkd
         592w==
X-Gm-Message-State: AO0yUKVdHOldI7oKXD7xn87qindGkepmUnzCHzUoy4y0mLhVe6OnWecr
	RezqF9orKT6D+jpJ1qTa1F8jBnuHfQb8GRB2yGg=
X-Google-Smtp-Source: AK7set9si+IqWI5ansGm4FDI9aZHSR29XOCEavGBm2xIxxrr6k8Yo/z8CXbJmo+57xMEUlNYBOR49Q==
X-Received: by 2002:a1c:f702:0:b0:3ed:a80e:6dfa with SMTP id v2-20020a1cf702000000b003eda80e6dfamr14891905wmh.40.1680106537683;
        Wed, 29 Mar 2023 09:15:37 -0700 (PDT)
Received: from localhost.localdomain (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id l9-20020a7bc449000000b003ee20b4b2dasm2662206wmi.46.2023.03.29.09.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 09:15:37 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH] arm-bsp/optee: bump corstone1000 to v3.20
Date: Wed, 29 Mar 2023 17:16:13 +0100
Message-Id: <20230329161613.812217-1-rui.silva@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 29 Mar 2023 16:15:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4506

Bump the preferred corstone1000 to v3.20, drop patch
that is already included in this version.
Create the 3.20 bbappend and remove the entry in 3.18 bbappend.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 .../conf/machine/include/corstone1000.inc     |  2 +-
 .../0004-Handle-logging-syscall.patch         | 33 -------------------
 .../optee/optee-os-corstone1000-common.inc    |  8 -----
 .../optee/optee-os_3.18.0.bbappend            |  1 -
 .../optee/optee-os_3.20.0.bbappend            |  6 ++++
 5 files changed, 7 insertions(+), 43 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-Handle-logging-syscall.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
index 7f25cd54455f..3915d18b5627 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -34,7 +34,7 @@ UBOOT_ARCH = "arm"
 UBOOT_EXTLINUX = "0"
 
 #optee
-PREFERRED_VERSION_optee-os ?= "3.18.%"
+PREFERRED_VERSION_optee-os ?= "3.20.%"
 PREFERRED_VERSION_optee-client ?= "3.18.%"
 EXTRA_IMAGEDEPENDS += "optee-os"
 OPTEE_ARCH = "arm64"
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-Handle-logging-syscall.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-Handle-logging-syscall.patch
deleted file mode 100644
index 356be9e04f9e..000000000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-Handle-logging-syscall.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-From b3fde6c2e1a950214f760ab9f194f3a6572292a8 Mon Sep 17 00:00:00 2001
-From: Balint Dobszay <balint.dobszay@arm.com>
-Date: Fri, 15 Jul 2022 13:45:54 +0200
-Subject: [PATCH] Handle logging syscall
-
-Signed-off-by: Balint Dobszay <balint.dobszay@arm.com>
-Change-Id: Ib8151cc9c66aea8bcc8fe8b1ecdc3f9f9c5f14e4
-
-%% original patch: 0004-Handle-logging-syscall.patch
-
-diff --git a/core/arch/arm/kernel/spmc_sp_handler.c b/core/arch/arm/kernel/spmc_sp_handler.c
-index e0fa0aa6..c7a45387 100644
---- a/core/arch/arm/kernel/spmc_sp_handler.c
-+++ b/core/arch/arm/kernel/spmc_sp_handler.c
-@@ -1004,6 +1004,12 @@ void spmc_sp_msg_handler(struct thread_smc_args *args,
- 			ffa_mem_reclaim(args, caller_sp);
- 			sp_enter(args, caller_sp);
- 			break;
-+		case 0xdeadbeef:
-+			ts_push_current_session(&caller_sp->ts_sess);
-+			IMSG("%s", (char *)args->a1);
-+			ts_pop_current_session();
-+			sp_enter(args, caller_sp);
-+			break;
- 		default:
- 			EMSG("Unhandled FFA function ID %#"PRIx32,
- 			     (uint32_t)args->a0);
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
index 71b5ee62b902..30f99666626c 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
@@ -1,15 +1,7 @@
-SRCREV = "42f6617108fa43712652ef52f9d5b4ec5b2665f8"
-PV = "3.18.0+git${SRCPV}"
-
 SRC_URI:remove = " \
                   file://0003-core-link-add-no-warn-rwx-segments.patch \
                  "
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/files/optee-os/corstone1000:"
-SRC_URI:append = " \
-                  file://0004-Handle-logging-syscall.patch \
-		  "
-
 COMPATIBLE_MACHINE = "corstone1000"
 
 OPTEEMACHINE = "corstone1000"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend
index 4b03985ac97a..bc933dd54c48 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend
@@ -3,6 +3,5 @@
 MACHINE_OPTEE_OS_REQUIRE ?= ""
 MACHINE_OPTEE_OS_REQUIRE:n1sdp = "optee-os-n1sdp.inc"
 MACHINE_OPTEE_OS_REQUIRE:tc = "optee-os-tc.inc"
-MACHINE_OPTEE_OS_REQUIRE:corstone1000 = "optee-os-corstone1000-common.inc"
 
 require ${MACHINE_OPTEE_OS_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend
new file mode 100644
index 000000000000..e732c80f880b
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend
@@ -0,0 +1,6 @@
+# Machine specific configurations
+
+MACHINE_OPTEE_OS_REQUIRE ?= ""
+MACHINE_OPTEE_OS_REQUIRE:corstone1000 = "optee-os-corstone1000-common.inc"
+
+require ${MACHINE_OPTEE_OS_REQUIRE}
-- 
2.34.1


