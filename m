Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.17184.1594911348448343212
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Jul 2020 07:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=HC9dPlUD;
 spf=pass (domain: burtonini.com, ip: 209.85.128.41, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f41.google.com with SMTP id f139so11900367wmf.5
        for <meta-arm@lists.yoctoproject.org>; Thu, 16 Jul 2020 07:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T8NR3Rsp/h9CIe3JVdTtuHTE/I6vR/2YDyUmfkVCxU4=;
        b=HC9dPlUDPfwfZ0OihJM2G5O4m8d5YT9HCMvumd1cfdOvr5+XQdYauVi8aZ8Guk9Vvd
         jZHf5HG/WfQ7eab9dsGPGqE28QGTUNcnHdzSmtOHeapSJD/nFiviqmPBENNyaJvdhgl8
         gFQhagcQ/AfHf/ediI26teuJIVugB7jxDHEEldzfMJbLg50QyJUe1kcKB3mZUDDZah8Z
         EQujJowt9QTdcHRg5PQWXd+yK+wM5UqFhgSTa4IbZWMcbeRr3544PzXYFIZnl7mPsDMU
         y2dikDWU8tm7mXe9oLjrjabj2y0RSVA+2jMZ+RfIJplh5ZvKghKindSl5i3qMjZnspD3
         DuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T8NR3Rsp/h9CIe3JVdTtuHTE/I6vR/2YDyUmfkVCxU4=;
        b=bgqNDiFx1tbyCYZzSqNFcLjPIv58X6YBxFqhGONmPlmGC4oqoQqk46oUK9dqfY4cdb
         yFMSJ+yBCKtnOy3wphUM+ZaWW1422xW8gDSx3nVNbk1J64xOGBbmD8S4FL9WPwCFox5Q
         ZQMALS561GtWbT2X3OIdqMVfC00sBHVJfATz6nyDewjRnQdF5OfLOR2kOdXqD0zJQFLt
         wqbUcds9lV3LxI4mXCSGYCySCc5fgdgl7i6Om48JnIv0nOwUbExdBDyPVHdUGV2V331C
         hW5VFI5/29bDUXW6vvp3ZDG5E33whYi3Hf5+WyQp/5FL39+0yPPo63dRwZOI9FlVuEcp
         uEvA==
X-Gm-Message-State: AOAM531+A7LJNGFwQVMha5s9PCtgEIC7WBFzH/hGG8HZ6VTUkRZfTGQU
	DYBAjCohEdU+qG0ab8BNphBxknqNbtI=
X-Google-Smtp-Source: ABdhPJxD2PPgzK4BtVX0fzGpUMl/mNtV4POum+5mTTjtwtlVJSWYOJgAM7BuYhITbkBKxK9WZVFxnA==
X-Received: by 2002:a7b:ca52:: with SMTP id m18mr4689546wml.92.1594911346499;
        Thu, 16 Jul 2020 07:55:46 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id h13sm9379361wml.42.2020.07.16.07.55.45
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 07:55:46 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/6] arm-toolchain/external-arm-toolchain: rename common include
Date: Thu, 16 Jul 2020 15:55:37 +0100
Message-Id: <20200716145542.232165-1-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

These recipes all used a common include
external-arm-toolchain-x86host.inc, but that name isn't very meaningful:
the recipes are for x86-64, there typically are more than x86-64
binaries available, and it's not for an external toolchain but
integrating a binary toolchain.

Rename the include to arm-binary-toolchain.inc, as they're all the Arm
binary toolchain.

Change-Id: I59f5faa7373686958e226db0aa68e7880d36400e
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ernal-arm-toolchain-x86host.inc => arm-binary-toolchain.inc} | 0
 .../recipes-devtools/external-arm-toolchain/armcompiler_6.13.bb | 2 +-
 .../external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb  | 2 +-
 .../external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{external-arm-toolchain-x86host.inc => arm-binary-toolchain.inc} (100%)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain-x86host.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain-x86host.inc
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler_6.13.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler_6.13.bb
index 4aeba68..7a7673b 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler_6.13.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler_6.13.bb
@@ -3,7 +3,7 @@
 # Copyright (c) 2020 Arm Limited
 #
 
-require external-arm-toolchain-x86host.inc
+require arm-binary-toolchain.inc
 
 SUMMARY = "Baremetal Armcompiler for Cortex-A, Cortex-R and Cortex-M processors"
 HOMEPAGE = "https://developer.arm.com/tools-and-software/embedded/arm-compiler/downloads/version-6"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
index a45fee0..020bbf8 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
@@ -1,7 +1,7 @@
 # Copyright (C) 2020 Texas Instruments Inc.
 # Released under the MIT license (see COPYING.MIT for the terms)
 
-require external-arm-toolchain-x86host.inc
+require arm-binary-toolchain.inc
 
 SUMMARY = "Baremetal GCC for Aarch64 processors"
 LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
index 6403fe1..77e44ce 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
@@ -1,7 +1,7 @@
 # Copyright (C) 2019 Garmin Ltd. or its subsidiaries
 # Released under the MIT license (see COPYING.MIT for the terms)
 
-require external-arm-toolchain-x86host.inc
+require arm-binary-toolchain.inc
 
 SUMMARY = "Baremetal GCC for ARM-R and ARM-M processors"
 LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
-- 
2.26.2

