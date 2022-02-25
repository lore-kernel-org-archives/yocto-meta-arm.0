Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABB9C433FE
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 05:08:07 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.3608.1645765685568669512
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 21:08:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=5Fmucu67;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id j78so3699532qke.2
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 21:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=++3bpLT7mPOoprQQ8girzHVGMwGExQA8e1A31XkYyvQ=;
        b=5Fmucu67qFSG+YWYFZEI8fteWBgVdZpEkNGbTqqUe1cGBciiJOruNDQoRtelq2U0Z9
         HMcUMeLTIcSoSTKhoaKylW1u9kV6ky2Nwi+pdz9l0H4xo2r8cYqMF6LdEOr/TPXyHJnU
         Z4y4CJL5Ysc9w5kphyNnEWMzVHsQuCKce53RXyoCvZwoIuPnTb85C9yQi8a5YEgfs2Sx
         41Bt43x6J8puykLjgq8betrz7AZdnQspNXKMtF4DIBqxwd1nyFyJcIZMsd941VNyVJrg
         mVqxoUxVIQphO4/qMZ9K2njfpQJXFOszRl0fzm5CVG/t8jWY1rwDp+rG33hDH2dr/lnc
         Ty+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=++3bpLT7mPOoprQQ8girzHVGMwGExQA8e1A31XkYyvQ=;
        b=b68iVouo/tDQMlpE0cAhpvigUzOI2HtMp24GbJ3ZSl67Eu/2ff7iDzdPclG0B7+6/a
         0qHv1vY7jCcwggPko7YZ+ZRSVIp5ve4TujkIkzyIrX1Sn+UNg/NK/e8sFcUPV7/LXNci
         vrmxddADvcpu7ATs2ZeKMSIBBerMZD3EG8Zb+rPDfmcA+gIrmWs4dcsVHcvckes2vHfC
         RIzFEBXyOvqZIFEwIYjU6beRgW3u47l4PTnkP+BzFW0++e2DJLxcKgb5RAy8dSs/IOi1
         iP6DZLs0tMFyuqC+gNdMqIV5g4UwbJ5NLF5se/fw6nE+pOAB8AiSfE2S7naTwZphV57m
         Pq+g==
X-Gm-Message-State: AOAM532roZAZDeGY3yJeqS5b2WRMWReFbvwG+69oHDkY8HsjdO4j/t9f
	1FLEf32tn8SNqwbvFlVNQW8WYSO4DNNc6w==
X-Google-Smtp-Source: 
 ABdhPJx82qBYOFcmBKHNRZD++0kgRgwAJdow+gO9PLtoFKKB5Q29tFor8nVHjtPZ7sKLL6N0xrs9xw==
X-Received: by 2002:a37:c84:0:b0:47e:17f0:4ea with SMTP id
 126-20020a370c84000000b0047e17f004eamr3811232qkm.477.1645765684621;
        Thu, 24 Feb 2022 21:08:04 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:97ee:8b84:aa35:fed0])
        by smtp.gmail.com with ESMTPSA id
 20-20020ac84e94000000b002de8f564305sm997905qtp.1.2022.02.24.21.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 21:08:04 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 2/8] arm/edk2-firmware: expand comment
Date: Fri, 25 Feb 2022 00:07:57 -0500
Message-Id: <20220225050803.2517279-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225050803.2517279-1-jon.mason@arm.com>
References: <20220225050803.2517279-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Feb 2022 05:08:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3059

From: Ross Burton <ross.burton@arm.com>

We currently disable release builds with Clang, but it appears the
underlying issue has been fixed upstream so make a note that we should
be able to turn release builds back on with EDK2 202202.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
index 8057e8870212..b1595e858b25 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -27,7 +27,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 EDK2_BUILD_RELEASE = "1"
 # Release builds don't work with clang yet:
-# https://bugzilla.tianocore.org/show_bug.cgi?id=3758
+# https://bugzilla.tianocore.org/show_bug.cgi?id=3758.
+# Can be removed in 202202 (c9b7c6e)
 EDK2_BUILD_RELEASE:toolchain-clang = "0"
 
 EDK2_PLATFORM      = "unset"
-- 
2.30.2


