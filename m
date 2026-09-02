Return-Path: <floss@jetm.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76276C624D7
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 22:26:56 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7590.1788388012006330736
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Sep 2026 15:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@peridio.com header.s=google header.b=Ew4rik+V;
 spf=pass (domain: peridio.com, ip: 209.85.217.54, mailfrom: javier@peridio.com)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-77c3fe2851cso111961137.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 02 Sep 2026 15:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=peridio.com; s=google; t=1788388011; x=1788992811; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cXoKMi4lEJJ1g09rNqCkz+Rz8Hgt+Dq0M2MR1cGLGSI=;
        b=Ew4rik+VqtWno5Cghz+s+evgRyTphUNaWdMR2tfj5Zbta4B3oUqw68vyovVbm0DJcY
         L8HG1RDQwQKL+d4SlfiVcKSGKe//WlkMUWJdfpQRQ6puDyT5LM1VIEClCDdeATeAL+u8
         rTlE8wXYpAMUNxcjlqRGb1mVkjAkDNQRdWrlaLKY1dIPiTSls6MNHJpyBjtDGdOgmVZy
         3tWQu+TZH93QbEWyUUC/1UmF6DhihZd0V/41YLRFkmMfuFzkmwlIVDvs0ve5syp3apwG
         DQD2eCUKSBlFHJGm3DFV6k1ZmRJW9slpPU8wI2qv4fTw45Vl0ZsaZTS67XklKDcr2oif
         PR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788388011; x=1788992811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cXoKMi4lEJJ1g09rNqCkz+Rz8Hgt+Dq0M2MR1cGLGSI=;
        b=Fu+D6hTeuDN7xAy5B5Y8U2ktdXxx8t3AwV5xHGGFff106+qyOwDBLP/HigYiDVy9vu
         AgDrLAdIQVpSM9U2JZXscRM4bUXK3kRdCDwY2DDBMuvpZOHuo9RW2G8NM6JhXtClSaDO
         GIAVJ2v4ibx1kcE/b1RyNiWM16LG/xaZN2T5ygmsq80hZV0GF+TJd7w6tqU5cRLKmzPx
         1wWaIYx7/q3ZCCEc6NbOrUDj+C5+qcxRAARiZCuqCIlVTKhob80Xxv4YJgseVNemLHlm
         iRKLyA7gGp7BF37luOitcVegKKTezYRrxtMGAdH/jJhUYE7HeuM3RlJan6HXngjWmNs9
         NLcw==
X-Gm-Message-State: AFuF++mPTNTM2RG2Uk9t5s0i8nmZOdg0523ceINXnHkHZRtxVYv3JZMC
	y38A8yhk6P+7AUDIRiXq7zDJwyX9Zivvw9uYtxnVqNB4Xq75RT1p60sHvlhZimST6pkJIG2HxOk
	AIWlloqQ=
X-Gm-Gg: AYBFou2d8wOaIrqhTfY4rdO9GTeCW6tvPLBTQfuW8Bee0lb89+RAAlGcT1RRtKvwOar
	7Hao7QFA3u/VHSA5k7vJTHj9O58O7qKEPp5tqtj2fLNRouZ41OrcVte1x7/ZsOOdOy1Z56GNpC6
	V85vw7DgPmB8epKYIYqdNtKbGsO3pUg4bo3dWGkvrt4+ZudQ4tIzx7QsA+dBN9lpWcjanG9zYZg
	3H04BCJEOeIbDaqrLS622oyO3ES3rBdXOEIbIvNl6lFdQw5N2XiKoxEcCNaOv0ddkGShNlrIGuz
	jFLxD5haCc/JcQnCALDmdXwmGGDAaL+TEgSaxpHQLWTK1u/Iy3nU+XKVX10k2OYKPQB2PV2cNUr
	RZnynL2x6UPY9wKrKhWvZgvb94BPfwumcxQUByPo0X6YNaVW5ky5ib/z5Wj6zf4xp6YzTPvrSls
	X0qkbrESQ0SQWwFZIJfm6mOmZcisOt0I1v/nduXfru5lfymEKncfLbZNY=
X-Received: by 2002:a05:6102:14a5:b0:786:c254:b7f6 with SMTP id ada2fe7eead31-78a1eefb2dfmr1349823137.0.1788388010852;
        Wed, 02 Sep 2026 15:26:50 -0700 (PDT)
Received: from localhost ([190.113.101.40])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a1b89ee0asm3097692137.8.2026.09.02.15.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:26:50 -0700 (PDT)
From: Javier Tia <javier@peridio.com>
To: meta-arm@lists.yoctoproject.org
Cc: Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier@peridio.com>
Subject: [wrynose PATCH 2/4] arm/trusted-firmware-a: modify CVE_PRODUCT
Date: Wed,  2 Sep 2026 16:26:44 -0600
Message-ID: <20260902222646.2945592-3-javier@peridio.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902222646.2945592-1-javier@peridio.com>
References: <20260902222646.2945592-1-javier@peridio.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Sep 2026 22:26:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7154

From: Jon Mason <jon.mason@arm.com>

Per https://nvd.nist.gov/products/cpe/detail/2E1BD3E8-DF65-42E3-A0BA-747137D6DEF2
Adding "trustedfirmware:trusted_firmware-a"

We can probably remove "arm:trusted_firmware-a", since it has been
depreciated.  Fearing unintended issues, leaving it in for now.

Signed-off-by: Jon Mason <jon.mason@arm.com>
(cherry picked from commit e2e63f20b504c31a4600f95764d3561c32b4b2f7)
Signed-off-by: Javier Tia <javier@peridio.com>
---
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 6a2c0da9..fc8779f9 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -242,4 +242,5 @@ INSANE_SKIP:${PN}-dbg += "buildpaths"
 CVE_PRODUCT = "arm:arm-trusted-firmware \
                arm:trusted_firmware-a \
                arm:arm_trusted_firmware \
-               arm_trusted_firmware_project:arm_trusted_firmware"
+               arm_trusted_firmware_project:arm_trusted_firmware \
+               trustedfirmware:trusted_firmware-a"
-- 
Javier Tia


