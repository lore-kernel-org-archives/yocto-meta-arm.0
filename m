Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.4242.1596098583135687419
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 01:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=mJ7/m1F6;
 spf=pass (domain: burtonini.com, ip: 209.85.221.41, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f41.google.com with SMTP id f18so24092665wrs.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 Jul 2020 01:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dBjKgL8rO9xioGErCDyQnXYc2Nc+mrLfw+t9HKWl8DA=;
        b=mJ7/m1F6tXwmxnd/8vG161zLFbFg70jDf8l7cEphhFu1GPFavOaZUB4lFhQDUFRmpm
         JN/c9spW7L4Xit9xyW9r4dHAq+mQsXr3yrEMYflPXD9xJjlBHh2KxgeTZ2+DCYvfKnzZ
         SrwSYuXtZ4BokOTCmE0l7xc2//703oyF32KtWU/+MPDpAtlpZ/vcqeIbGI/WvbB4eG6B
         /YWOqS71siiENMXpRHBWAS9Xb+tuYrKWJmzpYvoqalm4+RVl5pyhD1ecGikAzzdRQkOn
         F/13MCBGeZmHIFtVsf+8C88cPO4Rjs9PW7/bbLvEzTBuzI2GQEIGTayEGqsibSkGQaQO
         xLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dBjKgL8rO9xioGErCDyQnXYc2Nc+mrLfw+t9HKWl8DA=;
        b=LuKkA5Lt/TsbZIgQnAgAtUZQi5H67GZaPK+RtKPXom8D2MchsV7PyFy/uJQeel1Go6
         ly7+2sgKoiUXetron+P3mZQTI9HXN34apub/TT92dUhDlqyHKgjauDgTQ+JWkOW45OCt
         qkzPRF3LXYKb8J7LQEsnnF0iRAMvOYowIYhPvvGYfABFbP/Pl6VNlx+ZBwrDdSQQtHb6
         tsKd0G8mNtmheGmAjKARLlMupEeaQDGk/+FtOiYe3uMKB8+ZqMmETySD/U4hXTKRYXyV
         ZbAn6GLeIg440KEaz/6C6HIoHIROlUtvi/fLCi5loGcsH+BOEpWE77zzf/wqWps+MNAp
         B8Bw==
X-Gm-Message-State: AOAM530p6cqkX8J1s4alU8BSHJcgOwOAT+7uCIYXELPP/dQnEJ98ZCI1
	+W/B/11NyJxpewp5r9LKmWp35Tehzgk=
X-Google-Smtp-Source: ABdhPJx9jZBDaAfBee1cYWAOJ9+StFZJ0grGIVsh9BwzHVypgrZSRrqcLX05ZfdS0ZaszYAlyxhKTg==
X-Received: by 2002:adf:fd41:: with SMTP id h1mr1853374wrs.124.1596098581200;
        Thu, 30 Jul 2020 01:43:01 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id k1sm9113073wrw.91.2020.07.30.01.43.00
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 01:43:00 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2] arm/scp-firmware: use gitsm fetcher
Date: Thu, 30 Jul 2020 09:42:57 +0100
Message-Id: <20200730084257.1826181-1-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

The standard git fetcher ignores submodules but as scp-firmware uses
submodules it should use the gitsm: fetcher to automatically fetch cmsis
instead of doing it manually.

Change-Id: I2f83100fa53070b6560be6fb7322383345224bb1
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../scp-firmware/scp-firmware_git.bb          | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
index d7d67e0..a6bfaa2 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
@@ -3,20 +3,11 @@ DESCRIPTION = "Firmware for SCP and MCP software reference implementation"
 HOMEPAGE = "https://github.com/ARM-software/SCP-firmware"
 
 LICENSE = "BSD-3-Clause & Apache-2.0"
+LIC_FILES_CHKSUM = "file://license.md;beginline=5;md5=9db9e3d2fb8d9300a6c3d15101b19731 \
+                    file://cmsis/LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
 
-# SCP
-LIC_FILES_CHKSUM = "file://license.md;beginline=5;md5=9db9e3d2fb8d9300a6c3d15101b19731"
-# CMSIS
-LIC_FILES_CHKSUM += "file://cmsis/LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
-
-SRC_URI = "\
-    git://github.com/ARM-software/SCP-firmware.git;protocol=https;name=scp;destsuffix=src;nobranch=1 \
-    git://github.com/ARM-software/CMSIS_5.git;protocol=https;name=cmsis;destsuffix=src/cmsis;lfs=0;nobranch=1 \
-"
-
-SRCREV_scp    = "fd7c83561a7d76c7681d5d017fb23aa3664c028c"
-SRCREV_cmsis  = "refs/tags/5.2.0"
-SRCREV_FORMAT = "scp_cmsis"
+SRC_URI = "gitsm://github.com/ARM-software/SCP-firmware.git;protocol=https"
+SRCREV  = "fd7c83561a7d76c7681d5d017fb23aa3664c028c"
 
 PROVIDES += "virtual/control-processor-firmware"
 
@@ -33,7 +24,7 @@ inherit python3native
 inherit deploy
 
 B = "${WORKDIR}/build"
-S = "${WORKDIR}/src"
+S = "${WORKDIR}/git"
 
 # Allow platform specific copying of only scp or both scp & mcp, default to both
 FW_TARGETS ?= "scp mcp"
-- 
2.26.2

