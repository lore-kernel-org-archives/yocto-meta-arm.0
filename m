Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.8439.1595604590123855098
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 24 Jul 2020 08:29:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=H/SSzg3t;
 spf=pass (domain: burtonini.com, ip: 209.85.128.65, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f65.google.com with SMTP id 184so8634091wmb.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 24 Jul 2020 08:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lDwLuSer0504vlaKyvSeYjhRLg52XHp8B6OKe1OnAWA=;
        b=H/SSzg3trb48O18oW6iX3LJAPQrAzXFrBy++t8VD/JnaLOvM2VPO7mqva2SwXzXeeg
         yvg4G+gPnFoRgCI84ej86XP0eQx/ITZqFlPiiQkb0RkHsrw8GoV5XLrUuVDKLOwPt5BW
         qeQG1hRFIec/cD6SOMz14W5cyZDHOb83cpQ1lMk6usIO7ZAOdNmIDmo2zydmQdqfNac6
         c3wYP6yNCfhB7wuWraWO91DGKF5odS0af7K1+0Miz2r3NkJLS/AEPHXjQdCCCnAtbWZ5
         WycTYsTsnRsVgr5EzoBkrDQ5VQJSPvWOYMNYzSUboLEFmvheD7BQToLLet4yYh/WRSip
         XuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lDwLuSer0504vlaKyvSeYjhRLg52XHp8B6OKe1OnAWA=;
        b=jgA9XiCSz2xQm2LTOmi5aHii0EThuKDONewPCx4Vh4oNDzr8X8N3RSXuozVAajcZ7Z
         h/f8jTWxRG37uy4N5cwD2y4wh4qg69waeHhTgIEuA8OZUPk9dk4q64l3Wpqz50xX3e8n
         LMyusxrLaK5EmUO3l3jfVuJB8eZ8yd/RImp+/LZto8eDsp8W1f9BmG2txWHr5RdcW3kM
         U/yfvLYUr6pQcpgWsnkBoZbS3Haps6BSQidN5dKjl510m872TeqRpAaLvoKHX43atvoh
         kDIK4BEqvaQtNNqdIuHPf5irDyvmj7Vt4T1jcgnp9RH2PlVIwBO5qwgZh2YXaWtg1aZ0
         P1IQ==
X-Gm-Message-State: AOAM530RLrvEJGEOwsaXFpDFmNIBZiS52zAFZdiz9ArrKBQAvUMs1MOx
	/kqiGOdpKIpuvBiUUIy4fj8zNNxV0E3B6A==
X-Google-Smtp-Source: ABdhPJwv7hgY1nWAGDvlS+lRPh/JKkpdyoYnGKopb5CtM2/8N8m7Hv+3C11ZopYgJjs39VInPKiKjQ==
X-Received: by 2002:a7b:ca57:: with SMTP id m23mr8989648wml.35.1595604587833;
        Fri, 24 Jul 2020 08:29:47 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id o3sm224086wru.64.2020.07.24.08.29.47
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 08:29:47 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] gem5: recommend haveged, don't depend
Date: Fri, 24 Jul 2020 16:29:42 +0100
Message-Id: <20200724152942.453874-2-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200724152942.453874-1-ross@burtonini.com>
References: <20200724152942.453874-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

Instead of explicitly adding haveged to IMAGE_INSTALL, add it to
MACHINE_EXTRA_RECOMMENDS.

This means people without haveged don't have failing builds, and tiny
images which don't need haveged are not forced to contain it.

Change-Id: I190cdd26dde38fc9039ca1017da3cd2d9ac78721
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-gem5/conf/machine/gem5-arm64.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gem5/conf/machine/gem5-arm64.conf b/meta-gem5/conf/machine/gem5-arm64.conf
index 4db86c9..9ca2bb0 100644
--- a/meta-gem5/conf/machine/gem5-arm64.conf
+++ b/meta-gem5/conf/machine/gem5-arm64.conf
@@ -50,4 +50,4 @@ EXTRA_IMAGEDEPENDS += "gem5-aarch64-native"
 # Use haveged as a source of entropy instead of rng-tools (Needed for ssh).
 # rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow boot time.
 PACKAGE_EXCLUDE_append = " rng-tools"
-IMAGE_INSTALL_append = " haveged"
+MACHINE_EXTRA_RRECOMMENDS += "haveged"
-- 
2.26.2

