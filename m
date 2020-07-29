Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.3030.1596017513622056691
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Jul 2020 03:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=PcAMqr1Q;
 spf=pass (domain: burtonini.com, ip: 209.85.128.66, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f66.google.com with SMTP id q76so1149243wme.4
        for <meta-arm@lists.yoctoproject.org>; Wed, 29 Jul 2020 03:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FLQCfgfZtlcjT11vB9G//Of7Zo1ZdrzM+6Htn6Exgb0=;
        b=PcAMqr1QzL8q3AZE69Qgqvg13xyjgnI2gH2Cvnf2BURBMmU0avqWl5oZOITKIVCCxS
         Bv4vyExHrfzSoFcQ/oWXEJFwM/wx3dDA0Zd4MVxhHINNbRqWGx2FUI2fCfrXwWTZprWu
         upG0saDRlPAKZe96slM7X/vx+QYsfsAU7LGibWDxrFy/DV5NnhOj3JvvwWK1lk7P+vdu
         /kUVvwWlO6Ub2HY5sx/1UvcVYhACwpnUVntytkrW+LUM+HEkRngKNoZr4QyzmEKRjPeV
         I/7rPcnuOrAxzO2CvJ+CMIaxF1lj2EbhC5ls8mhsaVksGCHwRJsXiyMYdkHCsmPa4UZg
         aPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FLQCfgfZtlcjT11vB9G//Of7Zo1ZdrzM+6Htn6Exgb0=;
        b=d8u8XGG2ifYvq6Q/WdS6WtYlHmjcJWyerAVsWEVTV+hwKOFgHgP39YVquzM+HgToSm
         GTIb9P40319XEDOw6PbdKHy3N0Wx0ZZCPcMnneUXvuTBwyZqA3B4RBMavczONKGnqivz
         3vioD4E/eAYyev/DE9WJ16pzM46rx/ubY0J/AOBZT/dS+2yZl6XFZ5W9dUevqspqvI0S
         eVqCnC6jVsAKN04Sgo9+e4s/y2NQ1Q6iDANfIilZ3j8yu/vi9ja/qbgSJoj2ak3y9xeH
         TDgnkgGC/v/2Qwz9Ylx99MQ36JDiUW992HokhkuvH8sDaHbPg2LK4abQVc+TltQT0DOX
         xAhA==
X-Gm-Message-State: AOAM530JOiCHHFZWcoAtPzU81tn78kTYYkjh/COaRlavzbvpombTRkQN
	oBIixHk+NhZf4it4HF2qOJbxU2RmlBX2WlsD
X-Google-Smtp-Source: ABdhPJwYRIMnvzvFy1iZKIuaoMHDrM084vZ7nyUDI52rM4u5guPEaeK9pTkzuyF/AQiv/0j8zQ6TRQ==
X-Received: by 2002:a05:600c:2302:: with SMTP id 2mr1978208wmo.151.1596017512039;
        Wed, 29 Jul 2020 03:11:52 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id h11sm4648780wrb.68.2020.07.29.03.11.51
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 03:11:51 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/9] arm/scp-firmware: always compile verbosely
Date: Wed, 29 Jul 2020 11:11:39 +0100
Message-Id: <20200729101145.1794231-3-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200729101145.1794231-1-ross@burtonini.com>
References: <20200729101145.1794231-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

The only downside of verbose builds is that the compile logs are larger,
but non-verbose logs are useless for debugging mysterious build failures.

Remove the option and always do a verbose build.

Change-Id: Ibfd0414f0f6d0d69e20ec1fadcae8e86b516d3fc
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
index 886d56c..d7d67e0 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
@@ -21,7 +21,6 @@ SRCREV_FORMAT = "scp_cmsis"
 PROVIDES += "virtual/control-processor-firmware"
 
 SCP_BUILD_RELEASE   ?= "1"
-SCP_COMPILE_VERBOSE ?= "0"
 SCP_PLATFORM        ?= "invalid"
 SCP_COMPILER        ?= "arm-none-eabi"
 SCP_LOG_LEVEL       ?= "WARN"
@@ -29,7 +28,6 @@ SCP_LOG_LEVEL       ?= "WARN"
 DEPENDS += "virtual/arm-none-eabi-gcc-native"
 
 SCP_BUILD_STR = "${@bb.utils.contains('SCP_BUILD_RELEASE', '1', 'release', 'debug', d)}"
-SCP_COMP_STR  = "${@bb.utils.contains('SCP_COMPILE_VERBOSE', '0', '', 'V=1', d)}"
 
 inherit python3native
 inherit deploy
@@ -54,7 +52,7 @@ DEBUG_PREFIX_MAP_pn-scp = "\
 # No configure
 do_configure[noexec] = "1"
 
-EXTRA_OEMAKE = "${SCP_COMP_STR} \
+EXTRA_OEMAKE = "V=1 \
                 BUILD_PATH='${B}' \
                 PRODUCT='${SCP_PLATFORM}' \
                 MODE='${SCP_BUILD_STR}' \
-- 
2.26.2

