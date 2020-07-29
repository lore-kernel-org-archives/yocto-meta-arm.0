Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.3000.1596017514611318098
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Jul 2020 03:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=a0+sv1TF;
 spf=pass (domain: burtonini.com, ip: 209.85.128.67, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f67.google.com with SMTP id f18so2351818wml.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 29 Jul 2020 03:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Gz2lEWrWbT0pDZubC4Xijbn9QKrs0KrKb+4cuADKYpo=;
        b=a0+sv1TFj2QKsHVk9uhPjM/aGfLSci4ILDmzQt5DWgK9pi8rfilDJtxZPGZsn5HLYn
         N5HKEjgDfNrNmr2n7NFPNG3Al5JUw5QKLIaqWxG8g/Ygd8x6d6hpkU8ZgNCwGeXOL1xh
         /v2wZtbqCGMcOVkl57MC+yu5s/WbXoet6wxJ1f55hG94Xyw07hyO3mQylb+F3HuoLAqL
         dP0sbuffy9Z1qMCJHsxPv+nWFveLKuCvt3e7quk0FdGnJyFmELtQJMzc6iC4HFwy3lYu
         OKe5+ydX7emxxna/3taJsYUsUtWeg/Y4S8E4EuuYl0ettpFWpTCTeQj8GQON7n8kuisP
         U4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gz2lEWrWbT0pDZubC4Xijbn9QKrs0KrKb+4cuADKYpo=;
        b=qHdbkzKPcSuKUcTm5Wn8/kC9w0j8Pgd/OPtob2nDlDPrb15GTwu3UcN+QvzLmnSUbl
         Nx/togXiFm+yE9kUKQ/6RWKgn2HH137J5I2NUF7j7vpbB2NS7zGMPBVQ8n9kzhDTBx7z
         t7QGUMkx6lF/s0WO5Iszb8te+yjzMYLYAPNvzfKPzRWqwm+Cg9ZPml7uEnX18VzkhRrM
         9rf70s20ezFywIqwHmMLqzsI/U/pS0Vu0fWqykDaiFlUVEeNvhVkgVhFIqSdDq8Bm0tN
         csolm7I2WlbKvXOvhrRpBxhCPF91iycv2q4IQDQnyT+bozJHooj0GJ0jZsVFWyWJs7YZ
         Pzew==
X-Gm-Message-State: AOAM532H6XBSZzkF3xVgwbXMSG3vdzZpeA3X5PwdFeVC+giofPAf0Wlq
	nTCtfENngWCGAXXi8qKlm4CjCMqgsaVNe1Zq
X-Google-Smtp-Source: ABdhPJxSa8KHQEQ3LDvP3xa+q4kh2TpkE4vpD40DSJs5YhfDo9cYfMuw402Znum5dnROeEzjOFcvBQ==
X-Received: by 2002:a1c:f016:: with SMTP id a22mr7605166wmb.47.1596017512869;
        Wed, 29 Jul 2020 03:11:52 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id h11sm4648780wrb.68.2020.07.29.03.11.52
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 03:11:52 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/9] arm/scp-firmware: use gitsm fetcher
Date: Wed, 29 Jul 2020 11:11:40 +0100
Message-Id: <20200729101145.1794231-4-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200729101145.1794231-1-ross@burtonini.com>
References: <20200729101145.1794231-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

The standard git fetcher ignores submodules but as scp-firmware uses
submodules it should use the gitsm: fetcher to automatically fetch cmsis
instead of doing it manually.

Change-Id: I2f83100fa53070b6560be6fb7322383345224bb1
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/scp-firmware/scp-firmware_git.bb | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
index d7d67e0..a211621 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
@@ -3,20 +3,10 @@ DESCRIPTION = "Firmware for SCP and MCP software reference implementation"
 HOMEPAGE = "https://github.com/ARM-software/SCP-firmware"
 
 LICENSE = "BSD-3-Clause & Apache-2.0"
-
-# SCP
 LIC_FILES_CHKSUM = "file://license.md;beginline=5;md5=9db9e3d2fb8d9300a6c3d15101b19731"
-# CMSIS
-LIC_FILES_CHKSUM += "file://cmsis/LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
-
-SRC_URI = "\
-    git://github.com/ARM-software/SCP-firmware.git;protocol=https;name=scp;destsuffix=src;nobranch=1 \
-    git://github.com/ARM-software/CMSIS_5.git;protocol=https;name=cmsis;destsuffix=src/cmsis;lfs=0;nobranch=1 \
-"
 
-SRCREV_scp    = "fd7c83561a7d76c7681d5d017fb23aa3664c028c"
-SRCREV_cmsis  = "refs/tags/5.2.0"
-SRCREV_FORMAT = "scp_cmsis"
+SRC_URI = "gitsm://github.com/ARM-software/SCP-firmware.git;protocol=https"
+SRCREV  = "fd7c83561a7d76c7681d5d017fb23aa3664c028c"
 
 PROVIDES += "virtual/control-processor-firmware"
 
@@ -33,7 +23,7 @@ inherit python3native
 inherit deploy
 
 B = "${WORKDIR}/build"
-S = "${WORKDIR}/src"
+S = "${WORKDIR}/git"
 
 # Allow platform specific copying of only scp or both scp & mcp, default to both
 FW_TARGETS ?= "scp mcp"
-- 
2.26.2

