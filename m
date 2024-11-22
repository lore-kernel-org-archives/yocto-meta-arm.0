Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C760D75E45
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 13:39:36 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.24126.1732282766959434567
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Nov 2024 05:39:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=OkWtzkjc;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539d9fffea1so2130229e87.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 22 Nov 2024 05:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732282765; x=1732887565; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZwIjXW5TxlU0iK/kJtxivnqKjJJmZwvz08aIe/198oU=;
        b=OkWtzkjcr1xvmX00Ahr205OEJe9AlyNt/PQqfQv09+D+r7M2ScWUNDk4VsfSO6DlYS
         iQCNu84Jm5g/zFIISbhz1ADWqExv0oSnauk3d3GkL5bdB0iNE3hc9EynglHd/j3gUWby
         vjS4UqzTqvSYlnn7Je67Mto6geyPcIqOD7JQqJXvR47wJZuenitkpY7JQMo3MHojnc+A
         2Z7BVcT7E9TViO/kQjlgPXvnADWkvu4GyxjyzHbzxeadJdy/nBFEaMRFNuR4TwKdIeLd
         0g8gAGZcgMZKILU/OdVQxMnXC+y8aLok7vNZmXSPChncpuH9/m5QiW0vc6Z6XlDtN2Sj
         v/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732282765; x=1732887565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZwIjXW5TxlU0iK/kJtxivnqKjJJmZwvz08aIe/198oU=;
        b=mURnXmCOqvW1XLo8/h+Fu/aHyWRpyTUA8owtWsuqUC02Uw/ayAQ0jhOsqGjhXmtWOP
         9g1K7xiYbOsLpY4ZOl5n0QLr6mnmZHpzF4WThw2KyCIxGGAgG7z5NoJUpru6UvN/9805
         qltVQqcsR791N3V4Qj70wKIZCntO5nl1uask2jn0rIPpRY8L8RNzW4jMZQluV4oxtnXy
         h6xCtbhkL33J98zL+j6w6XflCM/uacXvwFp27JE8bLXyYsDjOxa5ZzPIWF1V9eRwh/tI
         q1ZRXT5bGow82NjbSD1nAEQNUU22EcmtKhDFf0Y6lhxs3a5YK8JWdF5OcXvwbSHEv1xK
         qGVg==
X-Gm-Message-State: AOJu0YxcDK07wR77gfuqAV/gTqc7QrPkUns4OVVlImsFpsLILbNNPxLY
	BUEYUgOiDElZ5kCF2Qw1yrOXkZVVbKgMvuclQRM1GjOq0fSvFaXa9bA/gXKotjeB1rxY8RwlU2u
	o
X-Gm-Gg: ASbGncupLMTjhcGMbgcuV+oKZGjoYvw0FNLTC59v8tzAnIPM9L2wNqpCT8HMb56tTrg
	JmiHdey7mKKbZEwuE2C8x0S2LMnWyerC7OzYI8xK45K1RH8v8XpKTfa0myZWdB4hXTvuylB3wK0
	frsZmYhzrOG16ZRFXWgczT6IRBMUC6695hn9eXEDCa6UMPtjzfWCpwD1sKWOu8v+SNqtsuxKBUg
	wUhrUxpsAPWEaeFGcK/4njOXXhOVsPz7ZkHjv3ehV65MdQ9Fsh1QuMZz24rh4UUpJ5UIKJlUK53
	Al97qv4oTtMpagCVYrfzFn8EGg==
X-Google-Smtp-Source: AGHT+IEBG5hjxG7T8RcRvfG1PBCzdszMwQ2nTaWbviVrulotPIyulbO6tKDA6B1yKSsNsL0lz+Xngw==
X-Received: by 2002:a05:6512:4028:b0:53d:d727:a93b with SMTP id 2adb3069b0e04-53dd727b376mr936375e87.36.1732282764993;
        Fri, 22 Nov 2024 05:39:24 -0800 (PST)
Received: from localhost.localdomain (2001-14ba-7452-eb00--133.rev.dnainternet.fi. [2001:14ba:7452:eb00::133])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd248b1dcsm375253e87.203.2024.11.22.05.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 05:39:24 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/4] qemuarm64-secureboot.conf: append to WKS_FILE_DEPENDS
Date: Fri, 22 Nov 2024 15:39:01 +0200
Message-ID: <20241122133904.202082-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241122133904.202082-1-mikko.rapeli@linaro.org>
References: <20241122133904.202082-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Nov 2024 13:39:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6253

Various classes add dependencies so don't overwrite them.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-arm/conf/machine/qemuarm64-secureboot.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
index 78a39c03..10216631 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -18,7 +18,7 @@ QB_KERNEL_ROOT = "/dev/vda2"
 IMAGE_FSTYPES += "wic wic.qcow2"
 
 WKS_FILE ?= "qemuarm64.wks"
-WKS_FILE_DEPENDS = "trusted-firmware-a"
+WKS_FILE_DEPENDS:append = " trusted-firmware-a"
 IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
 
 MACHINE_FEATURES += "optee-ftpm"
-- 
2.43.0


