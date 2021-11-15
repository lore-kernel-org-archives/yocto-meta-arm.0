Return-Path: <maxim.uvarov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1491DC433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 14:01:15 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web09.22791.1636984873980757824
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 06:01:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=sSCuQIfU;
 spf=pass (domain: linaro.org, ip: 209.85.208.175,
 mailfrom: maxim.uvarov@linaro.org)
Received: by mail-lj1-f175.google.com with SMTP id 207so35699288ljf.10
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 06:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/3bTR9BWDny2Ek7OeqfRSvXTVB0A7POLE7G7Mw2F0Gs=;
        b=sSCuQIfUtGxDWLVkYlSwpJ7OYw8I4MER+PxmIlGNZEUN4rJ8Ny6RB/mHewDSGCx6ND
         dpgv6Xay/pD7PH6CHFFxVCScmvbo0f/GhovyN0zXohqvdxr+Xj6KG9g6TG+FCqNy2GUW
         ZNNrO6kCJ24ycidx40hOeNqyOTJYCR6xxnSOxnWZoRvq6oV/CgcOxENPCIc+uSmdHAgb
         Ud8/EuBHwcvPuipe9xnepTdEUNkgPBR8PN6JkBMnAkx4AXNZ9PiEr2pUFC5I5PbTJWFL
         kWSZimh+DKqWEZ/MuT9giV/a+y0eMf8NsejZ0RekD0VJcdVpaXBNuAn6FecyqLeXS3sT
         aJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/3bTR9BWDny2Ek7OeqfRSvXTVB0A7POLE7G7Mw2F0Gs=;
        b=ierrTNVj8K0ADmmGUqpO7CbWl00HHO0Oku6A10RAWms5vrKJE1lTfhkOWATNu9xXUK
         phFOWIncSgjZOcBi/Ky2cw4rfVDIG35rYaT38FreHGzZ0GT38KNTBMCyDzW2F1aFh294
         rUUajotA6wMzGeksvNLLczUW6meosi/t36vqqetmQ+iU2X3o7BLcugvUbm/BpvTMRaIu
         +sdYXSXFfv6E8bk1OsxxV8LwaKZhuCxyBYIuptKfhKLqYJxeRt7GCYDDMBObCNYbjHoL
         Mkplq+65D4qsy6PuQoUwB4DdRwGbhikeJnyVegznhNgXneaRJLm8VjtXm49TTAjEfvXh
         ZZxg==
X-Gm-Message-State: AOAM530nqdDLggmzPswSHY0TkS5xWFaHy3ny0az+AaCr47tTmah1shbr
	sgp+SZxa6DM7692TlX+TTVxrNPcMpCmFuQ==
X-Google-Smtp-Source: 
 ABdhPJzEt9VGLicmTcpuxfzawIqGg8fuKfsqvlFd637i7wh8CbKCkgLyCicv1yD2MUIB+ufrllircw==
X-Received: by 2002:a05:651c:1505:: with SMTP id
 e5mr24292298ljf.232.1636984869147;
        Mon, 15 Nov 2021 06:01:09 -0800 (PST)
Received: from maximlap.d-systems.local ([45.87.143.160])
        by smtp.gmail.com with ESMTPSA id
 d3sm1513699ljl.93.2021.11.15.06.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 06:01:08 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	Maxim Uvarov <maxim.uvarov@linaro.org>
Subject: [PATCHv3 5/5] tfa: add depends on openssl
Date: Mon, 15 Nov 2021 17:01:00 +0300
Message-Id: <20211115140100.24634-5-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211115140100.24634-1-maxim.uvarov@linaro.org>
References: <20211115140100.24634-1-maxim.uvarov@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Nov 2021 14:01:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2389

build ci/corstone1000-fvp.yml: generated the following error for me:
libcrypto.so.3: cannot open shared object file: No such file or directory
Add openssl to DEPENDS.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 243e641..0f7d3de 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -87,7 +87,7 @@ DEPENDS:remove = "virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
 
 # We need dtc for dtbs compilation
 # We need openssl for fiptool
-DEPENDS = "dtc-native openssl-native"
+DEPENDS = "dtc-native openssl-native openssl"
 DEPENDS:append:toolchain-clang = " compiler-rt"
 
 # CC and LD introduce arguments which conflict with those otherwise provided by
-- 
2.17.1


