Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.220.1596644105626775500
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Aug 2020 09:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=a1vjxMlt;
 spf=pass (domain: burtonini.com, ip: 209.85.128.50, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f50.google.com with SMTP id k8so6928546wma.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 05 Aug 2020 09:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oiDQqq7hBJ0275+CI0WdVVypnETK9UbeabvDrO6grT8=;
        b=a1vjxMltP/bcqITyhBuvjkxox0C6MU0oFg1ZvlORVoduVhsVZmI5qCfxK3w72pikiJ
         8E2aegvH8hCr/jh/BeSz7UhdGPxXqJHHo2fYxHwfDq4fTSHWH7DSHqFKKy0LF3X/d2X3
         Zsxfo9bDzULPT4UjK/pKgiIUqUBf/fEvEMKCDOk0yNjb1PrZWVd38uEqlUdSm2dVFlut
         PAztgumf38KnS2q41EUHv7VO34RD54uYu70bMoG10I57gub2tBMqjPwvbDTSAGHOZ9lL
         vXgKvwUZRkYyG/XeCA5uLALI74rSj8yAYAhpsxCWlIp1ve/ib0iUjEmVR7cq5TtsOHX6
         6nLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oiDQqq7hBJ0275+CI0WdVVypnETK9UbeabvDrO6grT8=;
        b=FTdvz1IFLupF6G6B+r/sIDWiRFyNAxyzmC1260dT0Gi0q3h/k6afmeN1EV65eXd+tE
         5mW+UgxIyy1CtYyIwEyeKGqBiIcOkPE8LwISeiCxc85uZRGdWBGvCHcWBSAg+Y6MwM5a
         GDi6Bv9ekQE37neaYeg0yvMcbIWVYFn/JW2FXtpqoE2LDZSuRFwiJznvgDE1Fejsgtee
         lAG8UKVFg5Xf4CmvLQuFA+7EfjV9ttLtb0IlglMQ31j8B/tI2XVj22kMMgmR6LJwdMMD
         7ct89FZ9WRiFG5nu26kJwRzuHINDP2bblMD62JRQ1cTS8dtKdUZ3R7+m9BMKjajK7AnE
         BXJA==
X-Gm-Message-State: AOAM533eQbRhk8Qte1NLpiUtlXDXF6YJbx/D18U0d0DReCEN52cwQRZY
	s5c5pX92a9TU4bexKb/5Cht03uB37KE=
X-Google-Smtp-Source: ABdhPJxmO/WCaAMOEaIRdCTOKWR2HWmu59Otnt29/gwSsWPfEQnffGS1K0v8oTVQLaPRbV2N1bul8A==
X-Received: by 2002:a1c:1d91:: with SMTP id d139mr4108865wmd.144.1596644103527;
        Wed, 05 Aug 2020 09:15:03 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id c10sm3014468wrn.24.2020.08.05.09.15.02
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 09:15:02 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/scp-firmware: mark as machine-specific
Date: Wed,  5 Aug 2020 17:14:55 +0100
Message-Id: <20200805161456.1558010-1-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

Firmware is machine-specific, so set PACKAGE_ARCH.

Change-Id: Ib3247d04eaacd2b4240a1e11353f06ebd381a4c6
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb
index 1c66bf7..a5a4c06 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb
@@ -29,6 +29,7 @@ S = "${WORKDIR}/git"
 # Allow platform specific copying of only scp or both scp & mcp, default to both
 FW_TARGETS ?= "scp mcp"
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE ?= "invalid"
 
 LDFLAGS[unexport] = "1"
-- 
2.26.2

