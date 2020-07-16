Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.17231.1594911349648369212
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Jul 2020 07:55:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=C9+F4ZPS;
 spf=pass (domain: burtonini.com, ip: 209.85.221.51, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f51.google.com with SMTP id r12so7295498wrj.13
        for <meta-arm@lists.yoctoproject.org>; Thu, 16 Jul 2020 07:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KneVs5xwFJgWvyI/MGYQSViP6Qmr6JHVQsxZEtSLB9Y=;
        b=C9+F4ZPSqXDdKk70CU0qwmfH5srPDtZkIfa8rO2VftqTjZl4/3jQYTPl+K02E6+WLm
         6tsXcdQojg1RGXYC8Pxo/CKETIaPZV+mBz5jQGvY8mjF5ctufaagPY0LpuiMOq3XaPtX
         bYUKV6o3RhBpLlCP47eMcsBpSDf12fQEMzeCP3ko4JkDEdr4neNTXSzoRrmza3wEZg2X
         Dv/lawsSfVNgsVy7+nZx7ItcITGklxs5chUBo3mvQ15iT08EOolSnpEgqi4XZTpesaUu
         P1gclnltIsst/uIsENEhhvC1+mEmBBf8F9E9Oph2b8QB3s1Sb5jGjJrzOIeKClN7eIkv
         H5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KneVs5xwFJgWvyI/MGYQSViP6Qmr6JHVQsxZEtSLB9Y=;
        b=ooMkkIfynHJXnVNqwNy97YoVTQNeYsHF4fmWzY4z2JXWHLT2TZnE/K4BfEFsIifs9Y
         gPCU28kxdxaMPKJPnJ019RUgs9gikcaSJKwAolsGREXnYriJDFInGDLRArkGUAao8cAl
         YYC6fioYXpLZ31jl4WgB+ZA2PfDmW2Z8XOunl4hBWmXPasaGgr2x1d6pBPN2nzN32q1c
         eMLBusrfw5I0Z3T7guW2zhcPF0CyCI/YSdqUVUzI9qvvj51R048sq6SDkof3TdFKyXyT
         Js0sxJ/luD5aSZwdkAyO00yWzzFBmzXMB5Q0nneLlKMpHVGLhRw1VDkeEdlSWGf/UVik
         OXdQ==
X-Gm-Message-State: AOAM532ezsiDeKkESenBaXaCU6B1wNut6lpEIHade40vMoIal6ahh6Yj
	vxub9xTZnjF/pQZWNbQ83t5UOkE8iRQ=
X-Google-Smtp-Source: ABdhPJyKV6ELmHdfzt4J3At+E+yAHNQZeP1IptyEUDDxMqVbhH0M227j9gqpSaiO8SL1Tj6vH0B/kQ==
X-Received: by 2002:a5d:420e:: with SMTP id n14mr5793581wrq.164.1594911347857;
        Thu, 16 Jul 2020 07:55:47 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id h13sm9379361wml.42.2020.07.16.07.55.47
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 07:55:47 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/6] arm-toolchain/recipes-devtools: move compatible host assignments
Date: Thu, 16 Jul 2020 15:55:39 +0100
Message-Id: <20200716145542.232165-3-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200716145542.232165-1-ross@burtonini.com>
References: <20200716145542.232165-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

Some of the toolchains are available in more than just x86-64, so move
the COMPATIBLE_HOST assignment out of the include and into the recipes.

Change-Id: I10977593935bc7dc50196132d43541aed585cc18
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../external-arm-toolchain/arm-binary-toolchain.inc             | 2 --
 .../recipes-devtools/external-arm-toolchain/armcompiler_6.13.bb | 2 ++
 .../external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb  | 2 ++
 .../external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb | 2 ++
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
index d262e39..d099481 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
@@ -1,5 +1,3 @@
-COMPATIBLE_HOST = "x86_64.*-linux"
-
 FILES_${PN} = "${datadir} ${bindir}"
 
 BINNAME = "${@d.getVar("BPN").strip("gcc-")}"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler_6.13.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler_6.13.bb
index 7a7673b..8fbb8d0 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler_6.13.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler_6.13.bb
@@ -26,6 +26,8 @@ PROVIDES = "virtual/armcompiler"
 
 ARMCLANG_VERSION = "DS500-BN-00026-r5p0-15rel0"
 
+COMPATIBLE_HOST = "x86_64.*-linux"
+
 SRC_URI = "https://developer.arm.com/-/media/Files/downloads/compiler/${ARMCLANG_VERSION}.tgz;subdir=${ARMCLANG_VERSION}"
 
 SRC_URI[md5sum] = "fbed6edf5eb211c45df7b8548a10535a"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
index f156143..5de0f96 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
@@ -3,6 +3,8 @@
 
 require arm-binary-toolchain.inc
 
+COMPATIBLE_HOST = "x86_64.*-linux"
+
 SUMMARY = "Baremetal GCC for Aarch64 processors"
 LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
 
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
index 77e44ce..dcc76a9 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
@@ -3,6 +3,8 @@
 
 require arm-binary-toolchain.inc
 
+COMPATIBLE_HOST = "x86_64.*-linux"
+
 SUMMARY = "Baremetal GCC for ARM-R and ARM-M processors"
 LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
 
-- 
2.26.2

