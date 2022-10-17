Return-Path: <rui.silva@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6CFEC4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 21:01:58 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.1781.1666040510040792437
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Oct 2022 14:01:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=fY+Jl6M6;
 spf=pass (domain: linaro.org, ip: 209.85.128.48, mailfrom: rui.silva@linaro.org)
Received: by mail-wm1-f48.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so10934639wmb.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 17 Oct 2022 14:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UT98FDXgnxKgdOrlS2KsIJ8gv3N+bdvMkJk6I/Z1dug=;
        b=fY+Jl6M6Qew8YpshQ1w81LLBFdM1N/SNXimNTNISUD4Jm5YU9vYJpRN7QgA1bPnL0p
         s7URtPp7NV4NU0A5YxraIz1gmG58hpDIodWLLAGsrwQdx24QkF92Nep+4sCVdw4N985x
         gb7wksAskSBToK6mq4kmChD938iVX2chUSft9Afhw8VkTp7Bsd4MJrqO3G40r4teMSog
         T8nGDewn0NRSRdaqMcPga4VEcb+Q8cGplBi5lgoxnJXdaOf7dE+4glGAPh1/xwjAWOF1
         DQJL7D6cUMHwr2CUTlcigedKSLgNzpWUL/IegQHnTjKOf2ZOdo79rtsLFT6fA7fo99VS
         T9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UT98FDXgnxKgdOrlS2KsIJ8gv3N+bdvMkJk6I/Z1dug=;
        b=8PzoC59lt1JvIPDiuzYfWWChHmK22d8nxxSh9J0AVxFhfkgJoze6/TylyUI9e4lWhL
         JL/9fdMAU9+/iQRCOfpDcuDZ5fYbEAY02y1sXOvERi5e5lulgXDsgUIasUAwYpiq9t+m
         pjKqbrbVGCC9zcIlwbW/TShHod5cl0SaMMQVuv8f3iychaKjzQJSjdgN6WBuVzbaCNPR
         t4+1vTliAR1f4mm34UagAewodRDYeAZu9TjDJ54YbrrWbFoc//YvtFjEBvR6OP0HasLq
         CdXp7TrPUW+0Yq5Evrk8o3qJOvtizNjObhUu868OaTt0BGZOBaiQA4acDD794PmDr/mk
         EPSA==
X-Gm-Message-State: ACrzQf1080yxRCpi9iGrsH70UnuW4ApSypELfEBnB+mw0oR6/QBjY11L
	30YUnQCtTMRKYH9t+tlG6AUSICJHaTYisQ==
X-Google-Smtp-Source: AMsMyM5CetmHXukcRWG+FP/tr2EBmgCtKj33cNLUj/O/lIPF2JPs4QBLjW/VSxdoaX+BirA+1HUTyg==
X-Received: by 2002:a05:600c:1906:b0:3c6:f154:d4b5 with SMTP id j6-20020a05600c190600b003c6f154d4b5mr8267654wmq.94.1666040508212;
        Mon, 17 Oct 2022 14:01:48 -0700 (PDT)
Received: from arch-thunder.local (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id j19-20020a05600c1c1300b003c6c1686b10sm18091805wms.7.2022.10.17.14.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 14:01:47 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 1/2] arm-bsp/optee: add log handler
Date: Mon, 17 Oct 2022 22:01:35 +0100
Message-Id: <20221017210136.352276-2-rui.silva@linaro.org>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221017210136.352276-1-rui.silva@linaro.org>
References: <20221017210136.352276-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Oct 2022 21:01:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3976

Add log handler for SP sending logs over ffa to spmc.

Upstream-Status: Pending
Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 .../0004-Handle-logging-syscall.patch         | 33 +++++++++++++++++++
 .../optee/optee-os-corstone1000-common.inc    |  7 ++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-Handle-logging-syscall.patch

diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-Handle-logging-syscall.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-Handle-logging-syscall.patch
new file mode 100644
index 000000000000..356be9e04f9e
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-Handle-logging-syscall.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From b3fde6c2e1a950214f760ab9f194f3a6572292a8 Mon Sep 17 00:00:00 2001
+From: Balint Dobszay <balint.dobszay@arm.com>
+Date: Fri, 15 Jul 2022 13:45:54 +0200
+Subject: [PATCH] Handle logging syscall
+
+Signed-off-by: Balint Dobszay <balint.dobszay@arm.com>
+Change-Id: Ib8151cc9c66aea8bcc8fe8b1ecdc3f9f9c5f14e4
+
+%% original patch: 0004-Handle-logging-syscall.patch
+
+diff --git a/core/arch/arm/kernel/spmc_sp_handler.c b/core/arch/arm/kernel/spmc_sp_handler.c
+index e0fa0aa6..c7a45387 100644
+--- a/core/arch/arm/kernel/spmc_sp_handler.c
++++ b/core/arch/arm/kernel/spmc_sp_handler.c
+@@ -1004,6 +1004,12 @@ void spmc_sp_msg_handler(struct thread_smc_args *args,
+ 			ffa_mem_reclaim(args, caller_sp);
+ 			sp_enter(args, caller_sp);
+ 			break;
++		case 0xdeadbeef:
++			ts_push_current_session(&caller_sp->ts_sess);
++			IMSG("%s", (char *)args->a1);
++			ts_pop_current_session();
++			sp_enter(args, caller_sp);
++			break;
+ 		default:
+ 			EMSG("Unhandled FFA function ID %#"PRIx32,
+ 			     (uint32_t)args->a0);
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
index 1aca3a91a2d7..c54e00412d09 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
@@ -5,6 +5,11 @@ SRC_URI:remove = " \
                   file://0008-no-warn-rwx-segments.patch \
                  "
 
+FILESEXTRAPATHS:prepend := "${THISDIR}/files/optee-os/corstone1000:"
+SRC_URI:append = " \
+                  file://0004-Handle-logging-syscall.patch \
+		  "
+
 COMPATIBLE_MACHINE = "corstone1000"
 
 OPTEEMACHINE = "corstone1000"
@@ -15,3 +20,5 @@ EXTRA_OEMAKE += " CFG_TEE_CORE_LOG_LEVEL=4"
 EXTRA_OEMAKE += " CFG_TEE_BENCHMARK=n"
 
 EXTRA_OEMAKE += " CFG_CORE_SEL1_SPMC=y CFG_CORE_FFA=y"
+
+EXTRA_OEMAKE += " CFG_WITH_SP=y"
-- 
2.38.0


