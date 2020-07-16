Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.17186.1594911351166329082
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Jul 2020 07:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=FKEGeV4s;
 spf=pass (domain: burtonini.com, ip: 209.85.221.46, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f46.google.com with SMTP id z13so7381289wrw.5
        for <meta-arm@lists.yoctoproject.org>; Thu, 16 Jul 2020 07:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wXkGEIr8iuMgqPF1Q0SBOEnteFxIRNcjwBlwXNUCA6Y=;
        b=FKEGeV4shztS0/gITjXPMtYIZNl3wbN3XhhaYjkuPiUj0Tb824PO2NikbiyTKc/o4S
         u0K/IixaBDUE5Ly0TJsYEQ9VBPHRtYvB1iBM0fjymw8gnbybbR0T3XjxBpOdtgzyK4Yd
         TS/1sMAnPKKFlmB1esx52UypYEzmkla8dXG1WwWdhOk1UUIn9sW84C0x6cbxqUhOEbtb
         9XGJrljYH9/HWxky9MgFRLQPVMh7UaMp/TaaZnnv4ZD5DZ2aU98DTXoSP2UN6o/EAg9Z
         ptszbtWfhsWanXu08O66SlbYdxCZ44d3Yo7R7El4JXsNqgPpDsDJ3lG/CaldJYwQqiOY
         +bEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wXkGEIr8iuMgqPF1Q0SBOEnteFxIRNcjwBlwXNUCA6Y=;
        b=B0VNCNuG6aDImSrZYUYlKU+rLGqZlPV27ykYYMEY61hKesUb7fKTQSRB5sdBx9QXXG
         nv7rkKFXqlsV93w2Pd3qUyfCOMNfwVrKXrik02CRRPCimDS2e4tfg/mbxjHqKQSHH+Vm
         a5lQEaSAXqVMNG2I0DVKo3flGtxAiV6uWr05ohaBPtVa5tHK3zG9Yj4swnC7V48gZefX
         6mTe0D9g7VXMLD6UZ4EO84IdJ6xiCrpM8VZ5FVJ8bnPPS/ESrbg0/CNetomZYySKARxH
         RyP0fi1w2T7vv14te76ww20kNlYC8xHxoI+M5vAG2vwQztK6cmZwJHziCZoZwuNjitK2
         a38g==
X-Gm-Message-State: AOAM5319jJbqgW3trmVzh8K7Yh+AZQCW6SoEGUoK022cWWo6aV8eGoTw
	NT6ffgxMWWJFGemw4ie9z+z0gIHbpso=
X-Google-Smtp-Source: ABdhPJweUaU2UP50NMQRsLOvBcfYI8qtirCWD2ZIFJfhq7/CB1DpePFwTQ24c3jpCrsmGQ02dpndOA==
X-Received: by 2002:a05:6000:d0:: with SMTP id q16mr5822557wrx.166.1594911349456;
        Thu, 16 Jul 2020 07:55:49 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id h13sm9379361wml.42.2020.07.16.07.55.48
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 07:55:48 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/6] arm-toolchain/gcc-aarch64-none-elf: support aarch64 hosts
Date: Thu, 16 Jul 2020 15:55:41 +0100
Message-Id: <20200716145542.232165-5-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200716145542.232165-1-ross@burtonini.com>
References: <20200716145542.232165-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

This binary toolchain is also available for aarch64, so support fetching
that too.

Change-Id: I788fcd95c30b97f095593059e85de9a99710be05
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gcc-aarch64-none-elf_9.2-2019.12.bb             | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
index 5de0f96..221c07a 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
@@ -3,16 +3,19 @@
 
 require arm-binary-toolchain.inc
 
-COMPATIBLE_HOST = "x86_64.*-linux"
+COMPATIBLE_HOST = "(x86_64|aarch64).*-linux"
 
 SUMMARY = "Baremetal GCC for Aarch64 processors"
 LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
 
-LIC_FILES_CHKSUM = "file://share/doc/gcc/Copying.html;md5=c1df856e21b17e58b0adbe29cacf4bd4"
+LIC_FILES_CHKSUM = "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH}"))}"
+LIC_FILES_CHKSUM_aarch64 = "file://share/doc/gcc/Copying.html;md5=1b548d9c341b3b5c82bc88551964aa60"
+LIC_FILES_CHKSUM_x86-64 = "file://share/doc/gcc/Copying.html;md5=c1df856e21b17e58b0adbe29cacf4bd4"
 
 PROVIDES = "virtual/aarch64-none-elf-gcc"
 
-SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-a/${PV}/binrel/gcc-arm-${PV}-x86_64-${BINNAME}.tar.xz"
-SRC_URI[sha256sum] = "36d2cbe7c2984f2c20f562ac2f3ba524c59151adfa8ee10f1326c88de337b6d1"
+SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-a/${PV}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=gnu-a-${HOST_ARCH}"
+SRC_URI[gnu-a-x86_64.sha256sum] = "36d2cbe7c2984f2c20f562ac2f3ba524c59151adfa8ee10f1326c88de337b6d1"
+SRC_URI[gnu-a-aarch64.sha256sum] = "041ca53bdd434b1a48f32161e957da1b84543c373d1881e2fd84a1579f87f243"
 
-S = "${WORKDIR}/gcc-arm-${PV}-x86_64-${BINNAME}"
+S = "${WORKDIR}/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}"
-- 
2.26.2

