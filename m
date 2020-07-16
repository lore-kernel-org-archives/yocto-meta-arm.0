Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.17187.1594911352101989552
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Jul 2020 07:55:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=q/JQkWhT;
 spf=pass (domain: burtonini.com, ip: 209.85.128.45, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f45.google.com with SMTP id f139so11900579wmf.5
        for <meta-arm@lists.yoctoproject.org>; Thu, 16 Jul 2020 07:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MlANCLgiHXuYqmjq6AKXTxjliA7UL2I9J3/c3lSjXZw=;
        b=q/JQkWhTGKz/LIaW7xmfyWEu89fB1V3N5gtSB7SAP9nzVS/gMInh7er/XVCVmhYKRo
         yicDc0zpD0UqTDsE5b69NaB7Y9u3rRhKih3yBko5YXeJ1CQ78s0XqK+ccwNTkIqBwdo9
         ZfhV5g1K5sfldccOELCVVjnEiNE8qcJqeLL4/hPdSoiGdmgh+IPEhX+M2Yuy93q8jmoF
         71nF95HkEk+6OH+U5ACRCrTskUmPvN3EEmCj9FtoZ8VT9qHD6ObknIfL5aII5zRecR1R
         GYwtw2r67scZ8CGsBMhzeOWFY/6eYB5M8flr2mWYa2GDdJKoJ49VcFPUGTha6I5ENtYI
         7Dbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MlANCLgiHXuYqmjq6AKXTxjliA7UL2I9J3/c3lSjXZw=;
        b=tZpC9ykbnvB5B2oMOHlUetgB6gVlY2VrLVr0RkXDEVOtI4K3ApqHy+xsTo1H1NRzD1
         HeQHEVk+H1ljNa8eqI3kbO5GP7tZGQbl3yVYsGILIzxcs4+bQzcA2E9B721TDqGoT2L4
         1cL1o3oceWjsHRBH+PuLHyAiFaCGZdPMlluSDUxqp7E0o3eWe8Q+f3Z4PJ5SjvrRu69a
         eTozR6CIiOZ/1wixra2LXFAnDO/XTsNfOtVEbIaji2dAnSshoee7002p4qSw9cytyUl8
         NShtU0R4cU85mDzl2WpD3M5topkXbRMEBluipWj97dhRom5RhZRN4ZuzqW+jq8MhV7Rs
         r3Fg==
X-Gm-Message-State: AOAM533m5OhGT1/0vrBSlkc6/+bpfK05TF7lZakRfISGnTjZx24x3gsj
	ouUEsHDmRJBsz0FpYunvoP2hZtdeBqo=
X-Google-Smtp-Source: ABdhPJwG6oOXgustIbn0nXUPBSk22Wg+1cYbSrUCKh2YI8BYZNODDy7TYe/8jUMl933BEckQS09Jsw==
X-Received: by 2002:a7b:c44d:: with SMTP id l13mr4960854wmi.66.1594911350469;
        Thu, 16 Jul 2020 07:55:50 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id h13sm9379361wml.42.2020.07.16.07.55.49
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 07:55:49 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/6] arm-toolchain/gcc-arm-none-eabi: support aarch64 hosts
Date: Thu, 16 Jul 2020 15:55:42 +0100
Message-Id: <20200716145542.232165-6-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200716145542.232165-1-ross@burtonini.com>
References: <20200716145542.232165-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

This binary toolchain is also available for aarch64, so support fetching
that too.

Change-Id: I6206d8a9b4221d8461070d0cb7fff40c712c3df0
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gcc-arm-none-eabi_9-2019-q4-major.bb                 | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
index dcc76a9..ede9ae9 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
@@ -3,7 +3,7 @@
 
 require arm-binary-toolchain.inc
 
-COMPATIBLE_HOST = "x86_64.*-linux"
+COMPATIBLE_HOST = "(x86_64|aarch64).*-linux"
 
 SUMMARY = "Baremetal GCC for ARM-R and ARM-M processors"
 LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c18349634
 
 PROVIDES = "virtual/arm-none-eabi-gcc"
 
-SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/${BPN}-${PV}-x86_64-linux.tar.bz2"
-
-SRC_URI[md5sum] = "fe0029de4f4ec43cf7008944e34ff8cc"
-SRC_URI[sha256sum] = "bcd840f839d5bf49279638e9f67890b2ef3a7c9c7a9b25271e83ec4ff41d177a"
+SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/${BPN}-${PV}-${HOST_ARCH}-linux.tar.bz2;name=gnu-rm-${HOST_ARCH}"
+SRC_URI[gnu-rm-x86_64.sha256sum] = "bcd840f839d5bf49279638e9f67890b2ef3a7c9c7a9b25271e83ec4ff41d177a"
+SRC_URI[gnu-rm-aarch64.sha256sum] = "1f5b9309006737950b2218250e6bb392e2d68d4f1a764fe66be96e2a78888d83"
-- 
2.26.2

