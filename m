Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EED8C46CA1
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 19:05:08 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.60320.1695063904519771783
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Sep 2023 12:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=JcCXaff+;
 spf=pass (domain: linaro.org, ip: 209.85.218.53, mailfrom: javier.tia@linaro.org)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9adcb89b48bso445855266b.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 18 Sep 2023 12:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695063902; x=1695668702; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vfKU2YrxAmQzqGo+AnCJEO1qqv34QW5TReIplbzK+uw=;
        b=JcCXaff+AlV05I9AcIpuVs/slNKJ9ulET6Fi7YCCgVutBzywL0dv8uKli1SDRUTJ6y
         ocBcdwLfKe6Dyvi7rr/ysvivdkcDe873kNbZ1pQGVAbEZH9VA4XKDgI0nzydad7owDM5
         WFjRNboHRyjaneMDO4eMx+A9f/n6v8eFSa3r9bqQ6ui8F0IhjHdn/NSZnVbmnlRTnnW5
         xVzjnCDFvJXYyjboVzR22VTpHTWi57wN/Ab8XSrYLLFm4eWKyKMzjA4B7YhTX7U0pMVe
         3+MKmeIs0wskjFHDsPcmjjYN6LA4w6lntq0rIlCNxLDWt7VZ/tDgbMTSFtvpN727CcJf
         xkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695063902; x=1695668702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfKU2YrxAmQzqGo+AnCJEO1qqv34QW5TReIplbzK+uw=;
        b=AiMdQYqbd/vtoEhvy8IVKVV/cBFDoeocHGnIyfkGsjDsWwKifyfl9VIstMkM8kdhEH
         Ar377G2TCeCLM4aKwLTFGan995j5ck1XMZZLeI5cJeXuKGMrhNeaDcb7xFr1lFwwCLJ2
         aB5hCX40PipVWMy/1LidDE0mUNrViTWGcgg6CO1T16urP9Wa58mKJXx/5kt+z0GuORVR
         rpdavEKvwt9rqG4FR4tprNJyWi+PHYxq+nq/bLOiuGDT7gb46L+WQnwOW5jKt5dUOvAC
         W7Ph8Ludtu+Utkz5zQzWu2vubuejTn+yZhFZQ3STQn7RFH8D0LyCypjNOjrZHOj0ZBQ9
         9HGA==
X-Gm-Message-State: AOJu0YzX8z+mhSwpYco5y2OVHCem7LtXpisp0L4P4LKJM99ZTVVRiwlF
	N0oiQYSVAaAAVqm060gBS9HVxOhEWf8iUuXXDYC/Ng==
X-Google-Smtp-Source: AGHT+IGVr23p/gMx1p/2ReYh49EGsjK4pwrhRZj6RB28ZTGvv+ef/+aW87K3qKhYJO2f2xgmVyvQhg==
X-Received: by 2002:a17:906:1baa:b0:9ad:7f8a:3720 with SMTP id r10-20020a1709061baa00b009ad7f8a3720mr8036228ejg.73.1695063902567;
        Mon, 18 Sep 2023 12:05:02 -0700 (PDT)
Received: from jetm-carbonx1.. (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id s22-20020a1709066c9600b00993a9a951fasm6938530ejr.11.2023.09.18.12.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 12:05:02 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Javier Tia <javier.tia@linaro.org>
Subject: [PATCH] libts: tee-udev.rules: Change ownership to tee group
Date: Mon, 18 Sep 2023 21:04:52 +0200
Message-ID: <20230918190452.62938-1-javier.tia@linaro.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Sep 2023 19:05:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5057

tee and teeclnt are there to avoid running client applications (CAs) and
tee-supplicant as root.

- The teeclnt group stands for "TEE client" and is for CAs (CAs need
  access to /dev/tee[0-9]* but not /dev/teepriv[0-9]*).

- tee is just for tee-supplicant to open its device /dev/teepriv[0-9]*.
  No other process is supposed to open that one.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 meta-arm/recipes-security/trusted-services/libts/tee-udev.rules | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/trusted-services/libts/tee-udev.rules b/meta-arm/recipes-security/trusted-services/libts/tee-udev.rules
index af428974..43fafd8c 100644
--- a/meta-arm/recipes-security/trusted-services/libts/tee-udev.rules
+++ b/meta-arm/recipes-security/trusted-services/libts/tee-udev.rules
@@ -3,5 +3,5 @@ KERNEL=="tee[0-9]*", TAG+="systemd", MODE="0660", GROUP="teeclnt"
 
 # If a /dev/teepriv[0-9]* device is detected, start an instance of
 # tee-supplicant.service with the device name as parameter
-KERNEL=="teepriv[0-9]*", MODE="0660", OWNER="root", GROUP="teeclnt", \
+KERNEL=="teepriv[0-9]*", MODE="0660", OWNER="root", GROUP="tee", \
     TAG+="systemd", ENV{SYSTEMD_WANTS}+="tee-supplicant@%k.service"
-- 
2.42.0


