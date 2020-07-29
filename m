Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.3001.1596017515596641297
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Jul 2020 03:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=wrHafOxn;
 spf=pass (domain: burtonini.com, ip: 209.85.221.49, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f49.google.com with SMTP id 88so21054549wrh.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 29 Jul 2020 03:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SnsdK+zxL7EcQ5KAVjjkNP0QvgoekCrlP7y3nEPaM+c=;
        b=wrHafOxnhLehLyE2nzbw8g8BT+CMJVvTfvRMI6ZLDekXTNXFqt27uaoPoOwCQ3uzl5
         JoVPWP5Ub+/x6pnkEY5tgsyezVFFVrrH6vwxPy270S0e+kLRFSgdPhP5qFEbl3y2B7ij
         0geZTN094gkepSeOdr88Yg4DgXYupfMrxNU1DVpuk8HxHEGtvAYjtK8gcf9XNJo7RHex
         0e0siTVV10qFwLT8e2mPJsue+dbm6LCJExg27AgCuOQNWOci5RpzkBHbWt8zCpkBQ5Fp
         EZeK7LiS3z1k0rUQaiEen07jxeC1XNupJasBQmP4+Pyv+tfdAt9Mm/B5VQSZbUlIbHHi
         Npsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SnsdK+zxL7EcQ5KAVjjkNP0QvgoekCrlP7y3nEPaM+c=;
        b=tngrQ+yAgfCuJKoRciqriaJfZ0j9HKkzZEVvoQKaJLeAd9t99oQsXaNXwvd141nAFK
         KArOwFabkRLvmx3jdl+IGDECVjrDnScVN1gMXutsWU36tjaJaAns9bq9H3wnnvo8x0Wk
         EuKjEKKeneO9RqM2/NrV/ZmChedNL61IPQEybLjmcx9lpJZ63IZNWZpBuWVpe50Piyus
         E3rDezq/IW40SK9S6gM+hhyDGqfaZJQWaRBMfZBLf4HAhKvI3AFiQEjRN23X4Cnp4SJs
         ixWAk+Iz4GqJ/sBLo5D6ndPVdAM1UTe6mPU9XEVMFPfi5eCeeHYE7J0qkQA3667kMEAT
         1NKA==
X-Gm-Message-State: AOAM530pk2/4JCXXUx2gbJxX945/V3JNyvtUm9hnch7kuBxprFZt7ewh
	goAeSXgP2VuNz+TA5FutSlR+nHXu6iRyI0F7
X-Google-Smtp-Source: ABdhPJy7TZzObZTi5RE0MXKpAitM+wlvuGQsIYXPHlsfTWzmQxgG0We1oDVY7KqBQAKZ54lavfFl0w==
X-Received: by 2002:a5d:55c9:: with SMTP id i9mr28103074wrw.31.1596017513823;
        Wed, 29 Jul 2020 03:11:53 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id h11sm4648780wrb.68.2020.07.29.03.11.52
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 03:11:53 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/9] arm-bsp/scp-firmware: remove cmsis SRCREV
Date: Wed, 29 Jul 2020 11:11:41 +0100
Message-Id: <20200729101145.1794231-5-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200729101145.1794231-1-ross@burtonini.com>
References: <20200729101145.1794231-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

This repository is no longer fetched explicitly by bitbake so remove the SRCREVs.

Change-Id: I2de11d354f1f708de941485d5cc4463d53e6018e
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc         | 3 +--
 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc  | 6 ++----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
index ddbaac4..4886a44 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
@@ -1,7 +1,6 @@
 # N1SDP specific SCP configurations and build instructions
 
-SRCREV_scp    = "fd7c83561a7d76c7681d5d017fb23aa3664c028c"
-SRCREV_cmsis  = "refs/tags/5.2.0"
+SRCREV        = "fd7c83561a7d76c7681d5d017fb23aa3664c028c"
 SCP_PLATFORM  = "n1sdp"
 SCP_LOG_LEVEL = "INFO"
 
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
index 5b29305..b4e86fb 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
@@ -1,9 +1,7 @@
-# TC0 specicif SCP configuration
+# TC0 specific SCP configuration
 
 # Intermediate SHA with 2.6 baseline version
-SRCREV_scp    = "ba1db5fb0ee4a520836722f7a694177d461ab716"
-# 5.2.0 tag commit
-SRCREV_cmsis  = "80cc44bba16cb4c8f495b7aa9709d41ac50e9529"
+SRCREV = "ba1db5fb0ee4a520836722f7a694177d461ab716"
 
 COMPATIBLE_MACHINE = "tc0"
 
-- 
2.26.2

