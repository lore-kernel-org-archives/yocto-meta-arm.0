Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.3033.1596017519253132632
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Jul 2020 03:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=U82xU2ie;
 spf=pass (domain: burtonini.com, ip: 209.85.128.67, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f67.google.com with SMTP id x5so2190936wmi.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 29 Jul 2020 03:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0qDO8sVTTwlRvXffe/FzerSjhzKrDiCM162O+b+dOzw=;
        b=U82xU2iecdxhSAoUq2WoVZdI/sgYe32tp+e1cDtWbBtYWmDYjSdws363p/ozq6+scq
         pi6t0fzeAhTUrtvW494P74VbPOlgcNdBh0csJelDGJXdiRjqL+sK4O4viYVGTRDecZqH
         iReaAwXn2j2LKI7tXcKXRmij+tRmWbF3QAzgvG0ElAnsjzCVQVzV8oqmhdX1mu7br9hq
         1KMLpIRCZqg0AYcyPqQe1vOQ35Unuslr9TSv1IkdoWs9ES7MA5H3cRplCE3D2mYwNvZF
         LfaeHVnbqij85s5jpJ6O63tVYIW9RHdla7RBPgBAeF93xMVXbxqTDsuSUrLRijCk7kpO
         RYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0qDO8sVTTwlRvXffe/FzerSjhzKrDiCM162O+b+dOzw=;
        b=SeG5qLF8UjVCyQQdkR0/oPolCGjFLjpVAEggTBE29Z4MGZe9ru1z96EInCXkncaalb
         0MYmEcpDTX6NX+zNtNQrMqDH00GbIoAJdvXcEdhETrHxXGrVHLZ+immXlMmBEwaUXZkL
         pbQH80u4C84QuEy69fWvrGvFP01KDzEWyoqJW/MiuT/XS2HU4l2lMbtqow3GOagvxx8v
         o1QbD72i7pCULQHv1dJJcL8fjdnd69G94RAads6TshVjXCW5vZw+7RrbGq+t1tgHbLyV
         EfN+sEikiU4luhidj5EYJ0jUliQk7glbOHbac7HwYHdlQYBSjf8rGxb9EVWXrgLEgL88
         KYMQ==
X-Gm-Message-State: AOAM530qh3Rk3Pi9jIi0Fby51vuMKQiUT7topbjvJBRRvyP8ORvdCO/9
	4n0QslMy8XL5T7wZIbsehK/Y1D5MKyXVejmf
X-Google-Smtp-Source: ABdhPJyQJks/moqReSRq3gabRwoPw3YdTEAlh50a16O9wcZrxP5SeRInWA0RdXkDQSe9t5QCJsfx/Q==
X-Received: by 2002:a1c:28c4:: with SMTP id o187mr7620958wmo.62.1596017517570;
        Wed, 29 Jul 2020 03:11:57 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id h11sm4648780wrb.68.2020.07.29.03.11.56
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 03:11:56 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 9/9] arm-bsp/scp-firmware: bump TC0 SRCREV and fix PV
Date: Wed, 29 Jul 2020 11:11:45 +0100
Message-Id: <20200729101145.1794231-9-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200729101145.1794231-1-ross@burtonini.com>
References: <20200729101145.1794231-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

This is 2.6.0, not 2.6.

Also bump the SRCREV to match N1 SDP so that the core code is the same,
that BSP uses a newer commit.

Change-Id: I83168aa5973d83e4d93869019d91c05daf1e71e9
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
index b4e86fb..a04f729 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
@@ -1,11 +1,11 @@
 # TC0 specific SCP configuration
 
 # Intermediate SHA with 2.6 baseline version
-SRCREV = "ba1db5fb0ee4a520836722f7a694177d461ab716"
+SRCREV = "fd7c83561a7d76c7681d5d017fb23aa3664c028c"
 
 COMPATIBLE_MACHINE = "tc0"
 
 SCP_PLATFORM = "tc0"
 FW_TARGETS = "scp"
 
-PV = "2.6+git${SRCPV}"
+PV = "2.6.0+git${SRCPV}"
-- 
2.26.2

