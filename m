Return-Path: <rui.silva@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A334C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 21:19:43 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.915.1646687982032381774
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Mar 2022 13:19:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=pbebAijs;
 spf=pass (domain: linaro.org, ip: 209.85.218.52,
 mailfrom: rui.silva@linaro.org)
Received: by mail-ej1-f52.google.com with SMTP id r13so34855508ejd.5
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Mar 2022 13:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DK6ygaRjDiY8Z2T21WMT0mCI+OmhNV2diGha+D1Zzcs=;
        b=pbebAijsygvNlQL/Ae6550WMqjyjhWm4nvwm4IQmax4z4mptOh1PY6pvYY4nJhFSLU
         Zc+KCazUYWsK0ysjJ+vBCol2EXGagMb+1gZev/MSgC/ZlSF3BJ/7/XTkHKfpYFjPP9N6
         3PddDbs45A/Ar1sKGrKZ2sDF0hmj3LXK615NKGJvNM0xJj6C1BUHc1cPojfZ6uRFKcGP
         V3IoGfIlO4wuRA/tVvEuSBs4XPqva/sqSGHxzbPG/NsdH52YWIDLtwvD9dUstDyk6F1k
         hlRo7tUspYnvBKfyBevtbFYGkWjWRiNVnz+Ei48a1a18klzv8WeqY3Rfatuzt3cExCoa
         tjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DK6ygaRjDiY8Z2T21WMT0mCI+OmhNV2diGha+D1Zzcs=;
        b=G5UuEX/fwucl3FFVMdaDjCFXIDVA+gyNlGLPx+i5wFVzawvvN2j3PZSi7eoIq8ULYD
         Yu8VBxgiZTNZ+qzbAcGcTV8+cCCpkT9la4KRYaJPSSZSJ5iDj+4Rdj65d4uY6NbWpwLt
         6bkVcY/bsTucy+S6JuFH9L5ooHfYmfHoLcOPiuV91VZNL84QlXwWYdvDCLUZxeMKZmFd
         GyjcLeq9bB481S1/a//89oKZuxYEnByunAU+naZ7/Q6cNIlmtHPPOXa8i5YVCy9R2QLI
         Ym9a/3w/syq7YQGvD41zNUY2DjxI4Zk8quhtRZP8wes4YzAvM+Y4MVrGV+dT9mSauqEH
         v2VQ==
X-Gm-Message-State: AOAM530TJ0bq4jVYNCXbLSw0dLMEsAzJlTmpqmqW4oyKI/xQ3jwpqMiy
	lslhzhMFFjb+z32wElpsc9d6Ep6odeaeyA==
X-Google-Smtp-Source: 
 ABdhPJxyyvui9brPoL9ji2wxbeHVnUM1tZGdnjjcpsJSkNTkSDKE1aUCar9a4ADfnyThPcICWI0LsA==
X-Received: by 2002:a17:907:2d25:b0:6d7:c831:5714 with SMTP id
 gs37-20020a1709072d2500b006d7c8315714mr10686779ejc.137.1646687980216;
        Mon, 07 Mar 2022 13:19:40 -0800 (PST)
Received: from arch-thunder.local (a109-49-33-111.cpe.netcabo.pt.
 [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id
 q2-20020a170906144200b006ceb8723de9sm5050572ejc.120.2022.03.07.13.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 13:19:39 -0800 (PST)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 0/2] meta-bsp/corstone500: update u-boot and kernel
Date: Mon,  7 Mar 2022 21:19:29 +0000
Message-Id: <20220307211931.457610-1-rui.silva@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Mar 2022 21:19:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3124

Update patches and recipes to bump u-boot and kernel version.
u-boot -> 2022.01
kernel -> 5.15

Cheers,
   Rui

Rui Miguel Silva (2):
  arm-bsp/corstone500: move to u-boot 2022.01
  arm-bsp/corstone500: move to linux-yocto 5.15

 meta-arm-bsp/conf/machine/corstone500.conf    |   6 +-
 ...0002-board-arm-add-corstone500-board.patch | 312 ------------------
 ...ng-generic-timer-access-through-MMIO.patch |  67 ++--
 ...0002-board-arm-add-corstone500-board.patch | 305 +++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   7 +
 .../u-boot/u-boot_2020.07.bbappend            |   7 -
 6 files changed, 354 insertions(+), 350 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/corstone500/0002-board-arm-add-corstone500-board.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/{u-boot-2020.07 => u-boot}/corstone500/0001-armv7-adding-generic-timer-access-through-MMIO.patch (64%)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0002-board-arm-add-corstone500-board.patch

-- 
2.35.1


