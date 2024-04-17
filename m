Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A06C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 11:08:02 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.10078.1713352075801442648
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Apr 2024 04:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ZzHHxW+q;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5194cebd6caso495095e87.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 17 Apr 2024 04:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713352074; x=1713956874; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msknvOtn+PK6DVBy+6oqWzRBRfl5bPhcqLPbfEE0rqo=;
        b=ZzHHxW+q6z02Dtxy5mtAXJWWAClZ5RFwdzU53/QjH1G8yu1FSToOtDryMtjPFoHs1c
         EbKJeQ8qLax5YQUaoxA4tTmoITMUE4PQG4xp+STqo/vGe80GTHimjAz9Upt+s4/rXvQ5
         2N1V/R1VFHoc+QV1kQY8wXQ0rhgIcUy3SlDYmc/HULxjlFO0IAmlm4rWCwx1a2zTz/2o
         4xKkU689dzT+aIeGl+xADA1EFewu1094jv4nuG43Vgj4ywV4Xde9JlEyn5ZJTDwKbINg
         dRpsLNvkK4gD8RDXWzeXVGc/xfBmHLCAAAjrZZ4F2LW5LiB7sPRYTrBj6Ihc+Y80CL4o
         wrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713352074; x=1713956874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=msknvOtn+PK6DVBy+6oqWzRBRfl5bPhcqLPbfEE0rqo=;
        b=ZiImo34606eyixfxzhZu6Zxr0Ykj8VvjnbnPWqyE/Ln2oEwiyKjAQ/T0zdrWsnIJ88
         OYGSsWeTt/DVn/wrxfBQ+q/omX+lYxFdZRQvFXCc5DOR9vcbjUYcs0W8mAbUYtznyWo9
         MbGPWEm4TBKauyaxBDi6LqEnFVLy9rA1lNZS7DDJ27sdQ/5/W4T1XC6GuU/is9ML1qwm
         cg87PwAAU1AFkpMc2LNMAihF1N77QV453bYaSltYRFFD2e66TaaNVyt/5JKr2Kx+y2l6
         Kn4/MMWd4xYCmR9BXR7hsorQ6aVSPoGgi0neJS5XRb09nJv7NRXeRcMpHPu7k0GCaRJk
         9Kdw==
X-Gm-Message-State: AOJu0YyPEPhbcd/a7I/hG0JHAaBVeFeUYPatkt78hlTbhAJNfpJtnRXg
	cNHRH11CLeSopjY4cw27O9izdcx1630hWZivkfXETBuHMM3d6IUEb+RidqtpbTye5WVUAF+tYRv
	zBqE=
X-Google-Smtp-Source: AGHT+IFnoUlfVlczh21YxBJRsPcWNmGUkO34fiyi9/TC7f26N060p/UgS4WyD6pRWcj18Y8gyZcVhQ==
X-Received: by 2002:a05:6512:3137:b0:515:a733:2e0e with SMTP id p23-20020a056512313700b00515a7332e0emr9950469lfd.25.1713352073973;
        Wed, 17 Apr 2024 04:07:53 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id cf4-20020a056512280400b00518bf12488csm1194790lfb.160.2024.04.17.04.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 04:07:53 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/2] optee-ftpm: enumerate also without tee-supplicant
Date: Wed, 17 Apr 2024 14:07:22 +0300
Message-Id: <20240417110722.283283-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240417110722.283283-1-mikko.rapeli@linaro.org>
References: <20240417110722.283283-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 Apr 2024 11:08:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5555

Userspace like systemd boot manager would need to know
how to find TPM and fTPM devices for rootfs encryption.
Thus expose an fTPM TA enumeration also without tee-supplicant
so that early boot managers can start tee-supplicant and
wait for the fTPM device before continuing with TPM2
use cases.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch
index 7c61105b..175875c1 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch
@@ -21,7 +21,7 @@ index 92c33c1..e83619d 100644
  #define TA_UUID                     TA_FTPM_UUID
  
 -#define TA_FLAGS                    (TA_FLAG_SINGLE_INSTANCE | TA_FLAG_INSTANCE_KEEP_ALIVE)
-+#define TA_FLAGS                    (TA_FLAG_SINGLE_INSTANCE | TA_FLAG_INSTANCE_KEEP_ALIVE | TA_FLAG_DEVICE_ENUM_SUPP)
++#define TA_FLAGS                    (TA_FLAG_SINGLE_INSTANCE | TA_FLAG_INSTANCE_KEEP_ALIVE | TA_FLAG_DEVICE_ENUM )
  #define TA_STACK_SIZE               (64 * 1024)
  #define TA_DATA_SIZE                (32 * 1024)
  
-- 
2.34.1


