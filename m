Return-Path: <jerome.forissier@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB48FC19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 15:45:38 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.13546.1660059935552338419
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 08:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=EM982lh8;
 spf=pass (domain: linaro.org, ip: 209.85.208.46,
 mailfrom: jerome.forissier@linaro.org)
Received: by mail-ed1-f46.google.com with SMTP id b96so15730947edf.0
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 08:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=76UbkWGg6VG0hS/Tnq/2vutHsBU+zyo8JkU1AoXsYc0=;
        b=EM982lh8j4eO3khCK3BiAO9dTwFet0n/+MOcNsrxvxteOOsZ+fG78DrL3Xg1iSA56T
         FTCSHPrxW5Kx76qL+aTSc/4v6zeOXNEG0ZrQQG4mEzEYXbdA06KlA3MPVtsn7TWQ45Rj
         QFU96fr+kL/uj9wossuqK6gk95NSsoI2ZJlY+XTGJue94PgbW3n+sj1r9tfFEDhOvTGi
         /HsHbA6NMBAeeo15pyosO9UASqpv+WgJWIGH1bydJna2ThH57tPMuNbmJYjRXjAVmutj
         PdUjENcUfz6191oxWrp1ymECfvkUJWkMQe6kmKdqFtoGOZKYbeVr66HHl87XE5QwfBSl
         IIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=76UbkWGg6VG0hS/Tnq/2vutHsBU+zyo8JkU1AoXsYc0=;
        b=melYlNkzMM4aXUpSKAX/2T+Ntrrd32L9KoqWYgAVQZIe104OlC3+SGVk1NikaSTubq
         4iuc2QdBezyUY9W+NoKgnLa1BRoNn5u5fdFkIH2xgofDFi9NDMeB5nCdYdYcNzRrHcj2
         gFNvLEahgGsbH9xKB6Zli3dv1RgVdg9Vn2niKxm6W4X6FPkv6/x8Z2XZ/oduDmKcqyPq
         MqPgnOWDiDwVEV0707h6ygVqah5VVN4BttlOKlOUm4V8oO1Az5aBsTEvqBMEuxSDKwoX
         qDUDyjwRNdIt2gdihK94F5o/np0GNZUimZA/T5a7dEqzUF220/AfpK3deAilhTy2KWqU
         IePw==
X-Gm-Message-State: ACgBeo32DqMV/FhmGn9zXbAWfHioNnwxOhk/cPvv7DPNJ0Q2MZ2wCvW3
	5P7IiT9RcF5ZK6F5aN8vVUOg175OodJ7S2p+
X-Google-Smtp-Source: 
 AA6agR5nr/IN0lKOa3vtXf7h/WCR8RGwIu6M+hS+fb2wP/oM0Alv8Kx+5OvUaogdmIB2ueqAnrVdmw==
X-Received: by 2002:a05:6402:27d3:b0:43e:5490:27ca with SMTP id
 c19-20020a05640227d300b0043e549027camr23399605ede.307.1660059933534;
        Tue, 09 Aug 2022 08:45:33 -0700 (PDT)
Received: from jerome-XPS-13-9310.localdomain ([82.180.148.108])
        by smtp.gmail.com with ESMTPSA id
 k21-20020aa7c395000000b0043cc66d7accsm6236639edq.36.2022.08.09.08.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 08:45:33 -0700 (PDT)
From: Jerome Forissier <jerome.forissier@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Jerome Forissier <jerome.forissier@linaro.org>
Subject: [PATCH] optee: use CFLAGS{32,64} to pass --sysroot
Date: Tue,  9 Aug 2022 17:42:44 +0200
Message-Id: <20220809154244.2040759-1-jerome.forissier@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Aug 2022 15:45:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3668

Since upstream OP-TEE 3.16.0, CFLAGS32 and CFLAGS64 can be used to set
the sysroot option that previously required the LIBGCC_LOCATE_CFLAGS
patches.

Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
---
 meta-arm/recipes-security/optee/optee-os_3.14.0.bb | 2 ++
 meta-arm/recipes-security/optee/optee-os_3.16.0.bb | 5 -----
 meta-arm/recipes-security/optee/optee.inc          | 3 ++-
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-os_3.14.0.bb b/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
index 92e1f88..88f683c 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
@@ -7,3 +7,5 @@ SRC_URI:append = " \
     file://0007-allow-setting-sysroot-for-clang.patch \
 "
 DEPENDS = "python3-pycryptodome-native python3-pyelftools-native"
+
+EXTRA_OEMAKE += "LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST}"
diff --git a/meta-arm/recipes-security/optee/optee-os_3.16.0.bb b/meta-arm/recipes-security/optee/optee-os_3.16.0.bb
index 873e964..ec83100 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.16.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.16.0.bb
@@ -1,8 +1,3 @@
 require optee-os.inc
 
 SRCREV = "d0b742d1564834dac903f906168d7357063d5459"
-
-SRC_URI:append = " \
-    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
-    file://0007-allow-setting-sysroot-for-clang.patch \
-"
diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-security/optee/optee.inc
index 2ad7c95..417f56f 100644
--- a/meta-arm/recipes-security/optee/optee.inc
+++ b/meta-arm/recipes-security/optee/optee.inc
@@ -21,7 +21,8 @@ OPTEE_COMPILER = "${@bb.utils.contains("BBFILE_COLLECTIONS", "clang-layer", "${O
 TA_DEV_KIT_DIR = "${STAGING_INCDIR}/optee/export-user_ta"
 
 EXTRA_OEMAKE += "V=1 \
-                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
+                 CFLAGS32=--sysroot=${STAGING_DIR_HOST} \
+                 CFLAGS64=--sysroot=${STAGING_DIR_HOST} \
                  COMPILER=${OPTEE_COMPILER} \
                  OPTEE_CLIENT_EXPORT=${STAGING_DIR_HOST}${prefix} \
                  TEEC_EXPORT=${STAGING_DIR_HOST}${prefix} \
-- 
2.34.1


