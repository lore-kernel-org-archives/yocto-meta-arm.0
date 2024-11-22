Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13079D75E46
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 13:40:06 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.24609.1732282801433197923
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Nov 2024 05:40:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=UAo3H3J9;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539e8607c2aso2436253e87.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 22 Nov 2024 05:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732282799; x=1732887599; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5Gb+B8Ng07D4VAKHnbsNuIL/ZNhZJbKdy2PnwsKBUg=;
        b=UAo3H3J9R3xkiCEio3UIqMfXSttPM3HHhfCtYiimWYzOb0ARIRRjN99kd39URQN+s3
         g+5FKvoVyOBexQxTrRNqe2Ke3mAzKIq4+kMwOUfhaGKJ0Gkgx+wcx7CUmYabdbk7U7KI
         +dHxViwgCn5fQYa05aJ7G+VTgsVtRN4cYYsEKRJLzn4Gzqgwh095VleySlFSkbXRlMhR
         1HplYUJhlfZpjXeNmWV8/eicCOgpOqEu5dysSigq/jo5ygzHAyOyz/xPbHftiHGHqleL
         KRUHVHebxMeb9KSPXvfm3gtL1qDpnS5TFwU+6qQ6wgx5npH/vEKAFtdJZyWl0DhZeEkr
         5z3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732282799; x=1732887599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t5Gb+B8Ng07D4VAKHnbsNuIL/ZNhZJbKdy2PnwsKBUg=;
        b=j8L3C9poqOIY586n7RtaooaTNwPmq1wLbIgbwiy47HEZ44ucfDpoQQA1nbDnnRbSrJ
         LuMeeL249FqH4nsDX4Tff3E3b/8Hp6dK3v66uPBYgwTwjcAquJHqb3hCluWRDA2DC6H2
         nLlw0kbPlApyWdWPadZQrNjbJAfsW/ue1cYEO3JFSZRUVYxteLX6U9WoArDTqm/UCauc
         WudTGMwaXIU02QtlOVZNfmzjSIzI2kUGFvJ6HHlQTXqvAcprxoPkoxiF0dSj4ftNp23H
         UUA59ynLisFGAZ3OIxQJSC5IaK0EIoMEREluujUzuTt+XI79FcHXteHST/tg80Hs8iPZ
         wtNA==
X-Gm-Message-State: AOJu0YzzuYTqb64yjN8k7+iViEuHNhPLjtXyqLUgzJg+36IzQmaJMTOu
	q12BzXEeG4GYY2RArTWeVoUd7W40d6Nruq3OBelzE04z9PKJpSacU2bCJ46wg6eIYNpjw6ytnET
	a
X-Gm-Gg: ASbGnctLe8fNV3TbwlefScioAmJSPIb/RNCTsyR2Fue4WnOsbsX6JAcFuhT30o0Alkq
	/HmWwk/80hbJXtfqGCpT2xGdnaDxw9nNVYVFY9r7r+1b1TYhEHTKh8QxFIf/KWrkNQuqMNwqibZ
	CdbV1QNZE86gQcaKRn4oeBmfDr13ErmFnF67GUtCKBnwUNPJlMyHPMQcDyMC5H9mNI9f8/KDoAt
	yqIBXj3JG8eOqhszAoyTVSrCitalstUeQOyX3cls7ovJ4NZB9rOb7SiKUMHq6JZVGINYbgrw27X
	nOV8llxJXgO/M8+ahMy+oiX8Ag==
X-Google-Smtp-Source: AGHT+IFmLZJGx8yeWrgeVZK5jSsWV+tais4Yt1smDJhMmfJmxxkfVJFmiy0uIQD7qglKoUh+XG5rrw==
X-Received: by 2002:a05:6512:3994:b0:53d:cfe0:5937 with SMTP id 2adb3069b0e04-53dd369f6b3mr1339981e87.13.1732282799563;
        Fri, 22 Nov 2024 05:39:59 -0800 (PST)
Received: from localhost.localdomain (2001-14ba-7452-eb00--133.rev.dnainternet.fi. [2001:14ba:7452:eb00::133])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd248b1dcsm375253e87.203.2024.11.22.05.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 05:39:59 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 4/4] linux-yocto: remove signing
Date: Fri, 22 Nov 2024 15:39:04 +0200
Message-ID: <20241122133904.202082-5-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241122133904.202082-1-mikko.rapeli@linaro.org>
References: <20241122133904.202082-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Nov 2024 13:40:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6256

Remove secure boot signature from kernel image.
It's signed as part of uki image now which signs
kernel, initramfs etc.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../linux/linux-yocto-uefi-secureboot.inc              | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc b/meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc
index 5c1f4de7..93c0581a 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc
+++ b/meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc
@@ -1,14 +1,4 @@
 KERNEL_FEATURES += "cfg/efi-ext.scc"
 
-inherit sbsign
-
-# shell variable set inside do_compile task
-SBSIGN_TARGET_BINARY = "$KERNEL_IMAGE"
-
-do_compile:append() {
-    KERNEL_IMAGE=$(find ${B} -name ${KERNEL_IMAGETYPE} -print -quit)
-    do_sbsign
-}
-
 RRECOMMENDS:${PN} += "kernel-module-efivarfs"
 RRECOMMENDS:${PN} += "kernel-module-efivars"
-- 
2.43.0


