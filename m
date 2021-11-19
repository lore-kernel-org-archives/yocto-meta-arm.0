Return-Path: <maxim.uvarov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA13C433FE
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 09:33:40 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web08.6568.1637314419904479176
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 01:33:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=fQOJpnb9;
 spf=pass (domain: linaro.org, ip: 209.85.167.52,
 mailfrom: maxim.uvarov@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id m27so40396923lfj.12
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 01:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2GYNtTCCdz+2Y3l+N/dF2+hY3/2c0t2v5UhFuoL+5o4=;
        b=fQOJpnb9CZGmWbpjqLF+osEjXLSkQqi6Jek6CtxxORl/MCQedv0mOvuD91jfVfil0s
         h1RckRNELtZYQKIIlhOEa2ZmNbM3abSswSG2gOc8zcz06a4q9dILTafZLHnP8hR8M6II
         AQXto6ZR8d/b6aBCE2ISj4atl1kN4q2okLa9wVlKd/r8RpEPI4DFeONTksyf9DObykoO
         ADIrfgpkJA6blMUxtSi5O9U9aY99NI19QJ1v8JzRRKeU/+ZlF0RFE9Mq6xbkkxCW0/hX
         uQeQWTqmGsXCK3GoF01rd2ofrT5ja2iwPmNps629fDX1EctQS05FemldUqB1wbl1qCRD
         Yhhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2GYNtTCCdz+2Y3l+N/dF2+hY3/2c0t2v5UhFuoL+5o4=;
        b=m/oKMV2FgJJlipYuL5dit3VLX9o/u3r/ygP8HyfHYimeryhJZj/89AS75A2EtizCPi
         7O/rBCafNp5gFx64kIxLjrGV704Rt8CO2OzXbcnAeYzycJIrbHU240Xa6CmmF2uc5pmM
         b9QeOS8E5dS3m80wukc+su6yblTwlkQnfTLAqlHv8tZtMdAqrUQpAuDdBRWDrXMk3+W1
         dgG/tTnGHY8YUrXCutZgK/7TnmXcYKxSJ5f8lCVemtZ/GEQQKSFUr4c/rIrAsaKH/1YS
         /oZOIba7ong13I0h9fwjg0v69XFxoDa4pFuN8jl04BmZ/jI4E+5huXSWGX4sugLaU4g2
         bsHg==
X-Gm-Message-State: AOAM530HustkGr9MTcSiHw1CKHOboyGWH8H1m+/CPbayGbyT6o5CbcCD
	egMSjMfGKVxvg9S4oUhU4p97GZpyZ91gFw==
X-Google-Smtp-Source: 
 ABdhPJy/BI2x1/NRnMo2k8I++X2eSVdWKQQMJU/CQAw+hlPr5fgsIRvumY4eo7FNIFizGAj8HG1hsw==
X-Received: by 2002:a2e:8991:: with SMTP id
 c17mr23093492lji.361.1637314417681;
        Fri, 19 Nov 2021 01:33:37 -0800 (PST)
Received: from localhost.localdomain ([91.193.176.69])
        by smtp.gmail.com with ESMTPSA id
 x17sm242296ljp.95.2021.11.19.01.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 01:33:37 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	Maxim Uvarov <maxim.uvarov@linaro.org>
Subject: [PATCHv6 3/3] machine/qemuarm64-secureboot.conf: add optee-ftpm
Date: Fri, 19 Nov 2021 12:33:31 +0300
Message-Id: <20211119093331.4536-3-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211119093331.4536-1-maxim.uvarov@linaro.org>
References: <20211119093331.4536-1-maxim.uvarov@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 19 Nov 2021 09:33:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2426

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 - no change from v4.

 meta-arm/conf/machine/qemuarm64-secureboot.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
index c45924a..b664dac 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -20,4 +20,6 @@ WKS_FILE ?= "qemuarm64.wks"
 WKS_FILE_DEPENDS = "trusted-firmware-a"
 IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
 
+MACHINE_FEATURES += "optee-ftpm"
+
 PREFERRED_VERSION_linux-yocto ?= "5.10%"
-- 
2.17.1


