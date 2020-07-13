Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.16808.1594637290633034878
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Jul 2020 03:48:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=QOwkvIBS;
 spf=pass (domain: burtonini.com, ip: 209.85.128.67, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f67.google.com with SMTP id j18so12839340wmi.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 13 Jul 2020 03:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6Zw83d0NyySCcZDmildlV3elfQpyJFiP1TmuQaOpL+I=;
        b=QOwkvIBSMoj9XUUTGzSbx7u7MwNRZQ+93jd6K/TtzxztJATRZNThQ4zmJF9zuZwjmT
         3LVt2n4aIS1aXwIlhffglMi5eSacKAQxISIcf9h76fa46ASxzWotUEFjf2yVGrx0Jxnl
         Yqj4zY3UdYhto7jzn2k8ygvb/YENom/jsI5waVMHCkzV33enV08PgCx+/OyOooUMNq2r
         vpyydqF8eCdMWibuYmCc3P3PAIZ6uumrusJCMzWVTDNen4d7NMsBf6ZRRNPJWDV5p88G
         XuIjvYJWtcCRc5fZF0Vym0SlpekNoZL2efzJ5n4kG8NUqCMp+HvXXe2cKeFmIXCMw2x3
         43ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6Zw83d0NyySCcZDmildlV3elfQpyJFiP1TmuQaOpL+I=;
        b=K4RBH66VfhcAN19QusK2VrQRWSF2MaAUo1/drnux0RjHeJaPuLRklwFZP6B5o0fEOd
         LbKBqcVuf9F4FU268mAFmNmw76o6r/HOxGu3ZIw830fsi4g9B1p6EfH49FiMlmw/VKy6
         KcN8F+A400um0cowiSNXXhjh+JEf132t89ny/2JURJXBimmOfSFVhtUp4dy5xGCnkM5y
         gDQmUsAi2t55xqTLEIQ93RpecL3u4rFhgVDNSDecntt6O3IWS4EGLtebzxfAVgi43NTa
         JBYg4SK6kDS6Xy56EjuqchF/vo8yW/+tBD3PYiiWZD+Ep8KlbbuZLfiYV1cPD/u/PK+/
         FVrA==
X-Gm-Message-State: AOAM530yKx4FqIOiAMVqUK9cwC+jaWMeUjxZczUi/gxy0uv1iqcxIpw0
	6ipH8992hiBTxiNGc5b+yQFCf3rSZ/s=
X-Google-Smtp-Source: ABdhPJzRVHzvlOo56QSn7rpE/jiKBZExOUYJc3zLVdjt+H0SRIXKwgCKcLRi75tk4MR7luJZv3bF4Q==
X-Received: by 2002:a05:600c:2182:: with SMTP id e2mr18034037wme.186.1594637289038;
        Mon, 13 Jul 2020 03:48:09 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id y16sm23890747wro.71.2020.07.13.03.48.08
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 03:48:08 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/edk2-firmware: mark as machine-specific
Date: Mon, 13 Jul 2020 11:48:04 +0100
Message-Id: <20200713104804.174263-2-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200713104804.174263-1-ross@burtonini.com>
References: <20200713104804.174263-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

As this recipe needs per-machine configuration to be set, mark the
package archicture as the machine architecture to ensure that multiple
BSPs don't conflict in the package feed.

Change-Id: I3db0be2621987290a0c9e7b689554cd5f51cb61e
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
index 350af79..a343e07 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
@@ -35,6 +35,7 @@ inherit deploy
 B = "${WORKDIR}/build"
 S = "${WORKDIR}/git"
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE ?= "invalid"
 
 LDFLAGS[unexport] = "1"
-- 
2.26.2

