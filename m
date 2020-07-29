Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.3002.1596017518330662302
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Jul 2020 03:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=IeI8wwu7;
 spf=pass (domain: burtonini.com, ip: 209.85.128.42, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f42.google.com with SMTP id 184so2372007wmb.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 29 Jul 2020 03:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=byew6AN/ufsRqA2gP91l3qo1liN6IpQSLEVBRo7wzZo=;
        b=IeI8wwu7NQ+MbBDEdZIwdeWWT4RN88vfavziUwg5RNsCtEFr7TTpsIcv2wUNaOSktp
         Pu/2+d4faBDzu7c1iWzz3DTFkrBctbvs9wRyUmmiaXQtw5ElgUi48stGs7d4ewrxTdI1
         B7zRksvkt1RXwRM4eJFZ16KVwwN+HchF3RiiYHIK+XvMWpkzMX6XkfNZIFej+/Hq3mxY
         6tlcwTqxereJ9O/hIpKyAbC4UvpZQ7juOO5CKDmAohH9ArJb19J60eKtrJBVJRQhoG6m
         21sf3XxifpqOe4d9siUNqtwadhCZWo7voiWSFuC/F7eW6goSK6opjjk8r8evyU8eDdR4
         VcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=byew6AN/ufsRqA2gP91l3qo1liN6IpQSLEVBRo7wzZo=;
        b=XxMT1+69O5z6ZElyPEfzPIrZPHUDCG1tzXnEMx3H0Np8S83C7704JjvGQfr6HHQTSg
         zflt4AMWIIfO2/9kvCFCTDYclve21TI2pex7epAPbtZ4UCmLbFy6wE/xD5LgBddP1N6E
         KPO8ARqQI1EQ8dgEYkQn6Sb95TviAqwnFnJn0+4uDIRFSy9/uX4zM4jgjjSIV199BPyH
         /48k06awgCBwqvGO6kGZxcCQttTetwCRlFwhw7VqGl3mFh4t6ZK77XTGhtHoCQ17Bf7n
         opQm/TmiLOJhLClVK6Nk7tsRbIC0nCzvUtGezjcJzEAG+70EkzNFh3YM2UynC2WvrJBq
         z59w==
X-Gm-Message-State: AOAM533WZGRkiyBL0W1fWb+Lhfa3/7d/uwukhrcMDgU08/OmP9Xooj3E
	n7WhlDLKdElRv1gMakcde2KlUPkR0RwYNtGh
X-Google-Smtp-Source: ABdhPJw4BtM4F2C/4X2mzcOHYJIObzSfK+5I1EwYHSrU8mDK5ffjZOJknVRVAIwfsrG6DWLGgKwtnw==
X-Received: by 2002:a1c:7311:: with SMTP id d17mr7893919wmb.60.1596017516696;
        Wed, 29 Jul 2020 03:11:56 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id h11sm4648780wrb.68.2020.07.29.03.11.55
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 03:11:55 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 8/9] arm-bsp/scp-firmware: use full version number 2.6.0, not 2.6
Date: Wed, 29 Jul 2020 11:11:44 +0100
Message-Id: <20200729101145.1794231-8-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200729101145.1794231-1-ross@burtonini.com>
References: <20200729101145.1794231-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

Change-Id: I34928c09d89eb836cfef80d824b3c5a060af7491
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
index 4886a44..ce7acff 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
@@ -6,7 +6,7 @@ SCP_LOG_LEVEL = "INFO"
 
 COMPATIBLE_MACHINE_n1sdp = "n1sdp"
 
-PV = "2.6+git${SRCPV}"
+PV = "2.6.0+git${SRCPV}"
 
 DEPENDS += "fiptool-native"
 DEPENDS += "virtual/trusted-firmware-a"
-- 
2.26.2

