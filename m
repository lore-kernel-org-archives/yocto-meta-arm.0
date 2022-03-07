Return-Path: <rui.silva@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D29C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 21:19:45 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.998.1646687985024422072
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Mar 2022 13:19:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=I0Bp8Qse;
 spf=pass (domain: linaro.org, ip: 209.85.218.44,
 mailfrom: rui.silva@linaro.org)
Received: by mail-ej1-f44.google.com with SMTP id a8so34810767ejc.8
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Mar 2022 13:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fX19s8dQavwLwijFQBirm4IYZiuQIIWZJIVFYc+4Sx0=;
        b=I0Bp8QsenK7uf8qtxHaiLkhRFe7I3WAtG/O0yBxy6U08GBCopIOFyUFsFiyAz0OJoF
         T5Yek1yI5KPi5vI6eP34fLjb84+7uWRp3s9ZLZwgJlTYzSwBHxhFLJd+uw0Xnf/R5Oh2
         f2XjRofyx3MzdQi4V1+ZKU86EPYEYzpv5Gyw/Z5QNLokRylESZ0ldi4ne/bs9YKsQaD2
         o+L9ChbC7VDB9hCHdYKRuDgk03wOWuWGY9FU6iR8sHO92Cpq7HbcQQq5hALHil4OT+w8
         MF1QgyMuoB5IwzUK0wXrnjbG5JrlT0OIt6YhMDiOeJRjunBbQZLQVikoFLwWhIx//tuZ
         VMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fX19s8dQavwLwijFQBirm4IYZiuQIIWZJIVFYc+4Sx0=;
        b=HKbDwpQqIeJa3yJ1gGq4YGBDWii8MidGvN70E3MgqtykA3683NPpP5U6QfhMg84wG8
         H3CI7/HMeD9B+Uj1yudvvMwIjKwT3Ug/9DElzL/DlOImBbx9iHlIBMfYQAW1ikdFFdK2
         ay062oSPu/92+zvJza8/oUobJVND0oBBYdxoMFLX8NOW0bPAttrIiIbroRfRFmHVxGHi
         h3Xja3nfaU3w8nnaNLoyhh5EE98q2hiQX/VdE63pL7nvj+LXN/raHdJ/wjnjOEhMi/6M
         hwJ4dEKUoVkU6gONIc4n2uMMMGCEleU6mHkmi/TzQiL1XyzN3uiZ0c7pHGY0YLZIkc0q
         yw+g==
X-Gm-Message-State: AOAM531PrKQqotr7+if8u3i9q5rkAdmwI6C528BjOeV0n7OAoL1sihmz
	GK6qyIaSLqwjbBZJOccLIBD+aYTUzTP3CA==
X-Google-Smtp-Source: 
 ABdhPJx20OX6XkceS4nO3yZM2l0RnVE3YjTdGRIER2PKNGtmYWuwlK5CrwuPYCLNbNRqC1yxel15/A==
X-Received: by 2002:a17:907:1b15:b0:6d7:13bd:dd62 with SMTP id
 mp21-20020a1709071b1500b006d713bddd62mr10595168ejc.673.1646687983429;
        Mon, 07 Mar 2022 13:19:43 -0800 (PST)
Received: from arch-thunder.local (a109-49-33-111.cpe.netcabo.pt.
 [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id
 q2-20020a170906144200b006ceb8723de9sm5050572ejc.120.2022.03.07.13.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 13:19:43 -0800 (PST)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 2/2] arm-bsp/corstone500: move to linux-yocto 5.15
Date: Mon,  7 Mar 2022 21:19:31 +0000
Message-Id: <20220307211931.457610-3-rui.silva@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220307211931.457610-1-rui.silva@linaro.org>
References: <20220307211931.457610-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Mar 2022 21:19:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3126

Update linux yocto version in configure file for the
corstone500 platform from 5.4 to 5.15

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 meta-arm-bsp/conf/machine/corstone500.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/conf/machine/corstone500.conf
index 79afa1c1338c..ca0ca7b55b6f 100644
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -12,7 +12,7 @@ require conf/machine/include/arm/armv7a/tune-cortexa5.inc
 # apply.
 #
 PREFERRED_PROVIDER_virtual/kernel:forcevariable = "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?= "5.4%"
+PREFERRED_VERSION_linux-yocto ?= "5.15%"
 
 EXTRA_IMAGEDEPENDS += "trusted-firmware-a u-boot"
 
-- 
2.35.1


