Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4438BCE8347
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 13:40:22 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.54648.1727703618004773117
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Sep 2024 06:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=OwvSVjik;
 spf=pass (domain: linaro.org, ip: 209.85.208.172, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fad6de2590so3911681fa.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 06:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727703616; x=1728308416; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NkfXn9XnBpC/JC8z4/RU+dbdOZg88phBUSAfEf11CLk=;
        b=OwvSVjiksDDFcAsaUcQC8rejreeUopW593RSHg25vE/9sFAQgCQxNfWGHPSUq23jaQ
         x/9tlY+6TtgmYz/3CNYJqtzXdvlrPTX60/RSHyY+PYSxRrfLCeJmd+dv/6lA6UAtke79
         wFqgV4UpqToMxXgNgiiT1SJax3G5AVMh4OdJECEek2Xaso8biRejzJ9k6B77ZmJLnmJh
         kknzJQvWwh7Mw2iTFjRgjZiJItQGPuQubqUEIyoe9/vgvXg1cnsVzynXdlOCxKSOEyjd
         yBH17v3awM+JPBJp2vsPPyADvtD1hDnQYxhLdqBkuUQDxr/Jb2fsjR1d2Bg3+6+PkUeb
         KL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727703616; x=1728308416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NkfXn9XnBpC/JC8z4/RU+dbdOZg88phBUSAfEf11CLk=;
        b=QvJX7pmrOmhbGIjvgmLiCyY/odS6qZzDglbX+Gd1/GWaTdOOOK99DHAXxRCnOjrcgU
         HR1RXcCn57dnC+sq20GtyGfhfUX/ncMSbLNhjAhXM97N2Ij8m4VTvCIVW5s5u+b46d94
         iAaJCikhF8UFS3WVsEtDTrZ7fyfQqE9VdvZbDmjqSkW8fOcNykJo9jiIAWxMWudbtDxK
         tiI9Y5/h7UfHzGEUW6hNcV4KrBlh5QA7uMWrTy1JEWo/pJxBlTapEfqUEe26QuFaaDOx
         a3+G0RUmuXA6zCDFE5G1iI85Swu2Y8syn08yVHgcsMyjAV5jbVmp5FAgdCs69Q4H+roq
         zaNQ==
X-Gm-Message-State: AOJu0YyN3vxQDGo0+Zt40rmNvNyHryP2ZmEgpAWS1X7JKTdXBDp2Kqye
	Upv/TpoGtAJz6oDep7MdxO+5DuVHavb0kZrKgMANz+zi7EOBcWaVV43R7wFDLKcoSNXt4N2OuNQ
	gkno=
X-Google-Smtp-Source: AGHT+IG6W9SS1kU1RGC4FN5mtgXY+LE1fg0t8x5mhCIDXbGMsrEdz7MxdpssE7y9VHi3/ySmkhP07g==
X-Received: by 2002:a2e:719:0:b0:2f6:4a89:9afa with SMTP id 38308e7fff4ca-2f9d3e59e96mr60109411fa.22.1727703616047;
        Mon, 30 Sep 2024 06:40:16 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f9d45e198csm13272421fa.62.2024.09.30.06.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 06:40:13 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	MaheedharSai.Bollapalli@amd.com,
	michal.simek@amd.com
Subject: [PATCH] trusted-firmware-a: fix panic on kv260/zynqmp
Date: Mon, 30 Sep 2024 16:39:29 +0300
Message-ID: <20240930133929.10654-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 13:40:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6138

kv260 with optee and secure-boot panics without this fix:

https://ledge.validation.linaro.org/scheduler/job/93620

Xilinx Zynq MP First Stage Boot Loader

Release 2022.2   Oct  7 2022  -  04:56:16
MultiBootOffset: 0x40
Reset Mode	:	System Reset
Platform: Silicon (4.0), Running on A53-0 (64-bit) Processor, Device
Name: XCZUUNKNEG

QSPI 32 bit Boot Mode

FlashID=0x20 0xBB 0x20

PMU Firmware 2022.2	Oct  7 2022   04:56:16
PMU_ROM Version: xpbr-v8.1.0-0
�I/TC:
I/TC: OP-TEE version: 4.2.0-dev (gcc version 14.1.0 (GCC)) #1 Fri Apr 12
09:51:21 UTC 2024 aarch64
I/TC: WARNING: This OP-TEE configuration might be insecure!
I/TC: WARNING: Please check
https://optee.readthedocs.io/en/latest/architecture/porting_guidelines.html
I/TC: Primary CPU initializing
I/TC: Primary CPU switching to normal world boot
PANIC at PC : 0x00000000fffed94c

Fix proposed by MaheedharSai.Bollapalli@amd.com

Cc: MaheedharSai.Bollapalli@amd.com
Cc: michal.simek@amd.com
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ...-handle-secure-SGI-at-EL1-for-OP-TEE.patch | 33 +++++++++++++++++++
 .../trusted-firmware-a_2.10.4.bb              |  1 +
 .../trusted-firmware-a_2.11.0.bb              |  1 +
 3 files changed, 35 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0001-fix-zynqmp-handle-secure-SGI-at-EL1-for-OP-TEE.patch

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-fix-zynqmp-handle-secure-SGI-at-EL1-for-OP-TEE.patch b/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-fix-zynqmp-handle-secure-SGI-at-EL1-for-OP-TEE.patch
new file mode 100644
index 00000000..3dcc2de8
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-fix-zynqmp-handle-secure-SGI-at-EL1-for-OP-TEE.patch
@@ -0,0 +1,33 @@
+From f5b2fa90e0c0324f31e72429e7a7382f49a25912 Mon Sep 17 00:00:00 2001
+From: Shen Jiamin <shen_jiamin@comp.nus.edu.sg>
+Date: Wed, 24 Jul 2024 18:58:55 +0800
+Subject: [PATCH] fix(zynqmp): handle secure SGI at EL1 for OP-TEE
+
+OP-TEE requires SGIs to be handled at S-EL1. The
+Makefile was not properly setting the flag
+GICV2_G0_FOR_EL3 to 0 when the SPD is OP-TEE.
+
+Change-Id: I256afa37ddf4ad4a154c43d51807de670c3689bb
+Signed-off-by: Shen Jiamin <shen_jiamin@comp.nus.edu.sg>
+---
+ plat/xilinx/zynqmp/platform.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Upstream-Status: Backport
+
+diff --git a/plat/xilinx/zynqmp/platform.mk b/plat/xilinx/zynqmp/platform.mk
+index c340009d0..22eceb621 100644
+--- a/plat/xilinx/zynqmp/platform.mk
++++ b/plat/xilinx/zynqmp/platform.mk
+@@ -21,7 +21,7 @@ ENABLE_LTO := 1
+ EL3_EXCEPTION_HANDLING := $(SDEI_SUPPORT)
+ 
+ # pncd SPD requires secure SGI to be handled at EL1
+-ifeq (${SPD}, $(filter ${SPD},pncd tspd))
++ifeq (${SPD}, $(filter ${SPD},pncd tspd opteed))
+ ifeq (${ZYNQMP_WDT_RESTART},1)
+ $(error "Error: ZYNQMP_WDT_RESTART and SPD=pncd are incompatible")
+ endif
+-- 
+2.34.1
+
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.4.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.4.bb
index f7da5082..8cdfda44 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.4.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.4.bb
@@ -16,4 +16,5 @@ LIC_FILES_CHKSUM_MBEDTLS = "file://mbedtls/LICENSE;md5=3b83ef96387f14655fc854ddc
 # continue to boot also without TPM
 SRC_URI += "\
     file://0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch \
+    file://0001-fix-zynqmp-handle-secure-SGI-at-EL1-for-OP-TEE.patch \
 "
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.11.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.11.0.bb
index 27cdfc09..cb73b48d 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.11.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.11.0.bb
@@ -16,4 +16,5 @@ LIC_FILES_CHKSUM_MBEDTLS = "file://mbedtls/LICENSE;md5=379d5819937a6c2f1ef1630d3
 # continue to boot also without TPM
 SRC_URI += "\
     file://0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch \
+    file://0001-fix-zynqmp-handle-secure-SGI-at-EL1-for-OP-TEE.patch \
 "
-- 
2.34.1


