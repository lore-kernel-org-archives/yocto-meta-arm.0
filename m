Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FAC4C36014
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 08:35:21 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.14261.1743496515727837620
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Apr 2025 01:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=rfcQU1GB;
 spf=pass (domain: linaro.org, ip: 209.85.208.179, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30db1bc464dso47096231fa.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 01 Apr 2025 01:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743496514; x=1744101314; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WTzhXCx3MVqcet1ys0YQ1gxpC6UcMq+uwduwHuOnRFg=;
        b=rfcQU1GBcUqsSnb25BlpS3eaWJtN3MSmDoTkUqP7mF4UoiUS++BLi1PtQtXXse9AXR
         VdUGaQhF8IZIXVbcO/EXC+brbcHKSH/KjfEa1vkM9z9pRF3AhYjsLuPoNWv1z2f6SP1+
         JKIDILYsGNv0GS/L2c1t0+Mt3uUZC115u/wIIx9K16nL0PzHh/QMC5jfs/sVRFbBYoES
         VE9oPh+Xm1LMXCBFmHh9Hq60l6DV9hHk5KXyMGFYKJD/FZJpxFTWUiOl9534hNFxqgt9
         9QRm4JVJ1oH9oAuISDN3uBoEFQMtMuStzeK9syhY13BlN8j8u5SN4XO/PjrGMHreTkpV
         lgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743496514; x=1744101314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTzhXCx3MVqcet1ys0YQ1gxpC6UcMq+uwduwHuOnRFg=;
        b=GFtTLPRTbxYjVd4HN1m122sEJ6OmyeMsgrgqDZSguL6N15aamPjgmUhYJOPqEJR0SP
         DCZhVOwSzFIt/ze9wK/sasLjkSRkq+gcwTsASeuNVVLvRnLn53+0AtnZ4sqYgvm28zOd
         6K4l02SnlTVfwTBkooJ6sBiRJ6xc4T3k13xkru5Wl4Yhr91+DjR80kSrzuPNVv5Oxj7u
         jC2RyQAdmpUxvpD0cMpz0mMQf4FQGJg6nAkBFPL8xs9E/iI1IYDHooJFQbxcvykd1lwd
         yo9HUwLl3uSRrr+N6Jd+apQq4QhXQ40deSUnL6QPmolC4qh/Bb1lauq5JpMT6sz0VGep
         BAgA==
X-Gm-Message-State: AOJu0YznuyP0Qmb21HiGgipeyhYVCmZKQdw+J7Pqv/UPMAUic51V9k36
	KYBdjR6eFN6jQgJQmmJ7r/g0UQ9bEkV/AFYK1xApW8CFPPuSuw8WDHYzk/lRJ4wcdV/JYGskVlA
	GM3w=
X-Gm-Gg: ASbGncvVhe6EuaWUk6FgsiMZckGJchh2jxQ3J1P3Z4Eboy8MEFJqANFRJk5FONhPhkF
	kOlXzhFF/Uc1xKi2EAdcUKgLTnKXDY01JplEq8ghlchThMUAuidvan/iH+H0mfOscBJZs7C+5Ud
	VyNrFHw0Nl5YrcqXtlUmM3d+Qp6Gxa6VuftOPQCodDXf/gf4v0bLyCl0SMjqh5p0c/KIErDkwzE
	6+kHYiH/PdtlDUj8zCM0Dbh8MUGaIH2sbvV/SuTtm1PJ40/sc4njLfgKzpbtgf8X/oQ6iNLrVB1
	R55sXQsOccsbRY3eUVbOXSam0EmmQgzltHtaY8QVPoGw1hyWJnxXx+zaViaTIQHIEk+/p1Vme+z
	HstlhlRWdb59H6FdQma7BaA==
X-Google-Smtp-Source: AGHT+IE3fZsuVOkrdC3XmQoypczoySEMFu0DY70ICA9EswEkCjyiQ/4FrJMiuUbS6pevDqu/qDAHzA==
X-Received: by 2002:a05:6512:68f:b0:549:86c8:113a with SMTP id 2adb3069b0e04-54b10dc7dc7mr2774029e87.15.1743496513612;
        Tue, 01 Apr 2025 01:35:13 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c1ae8sm1314210e87.79.2025.04.01.01.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 01:35:13 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] trusted-firmare-a: update qemu patch status
Date: Tue,  1 Apr 2025 11:34:59 +0300
Message-ID: <20250401083459.95056-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 01 Apr 2025 08:35:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6426

Submitted to upstream and worked through review
comments and CI issues:

https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/36514

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ...1-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch b/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch
index 75103332..733fa370 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch
@@ -10,7 +10,7 @@ Enables testing boot without TPM device to see that
 missing TPM is detected further up the SW stack and correct
 fallback actions are taken.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/36514]
 
 Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
 ---
-- 
2.43.0


