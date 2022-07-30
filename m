Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BFEBC04A68
	for <webhook@archiver.kernel.org>; Sat, 30 Jul 2022 16:27:55 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.4662.1659198467534795361
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 30 Jul 2022 09:27:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qamb5yC+;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id y15so7018992plp.10
        for <meta-arm@lists.yoctoproject.org>;
 Sat, 30 Jul 2022 09:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hWWFXcsvNk1mCYUZyMj71J+fQ6ki7XR2x1CBTcocpWU=;
        b=Qamb5yC+8fGKkxtZvd8qeira1Yobbhd5HQneGM1LdARRgRE2+GLVtdnXZDo31umJlB
         xZDDSq2zE2wLTuM4c974b+TMIO+MvnQYJ+SDIRYukBya/RLwYBOQSxUE6Gu1bKzYg2Eg
         Zo/F0CvC2es/GFqLEhJS8vYcBm9+n+No01ULS2oYHkDfwyrO734a8jhOaTRUoommGiAk
         YS+UH9j3bNhYxSGcfQWPgz4sqKdluUf380kkJrELTPz12JOrl2EmCMo/rBCzQw3jjFjk
         bNKjQEpycTBWbQ196EMldLGgcHg9new3aV+lF34FKlkr+r4o/90BrjLdNAkDUvvMgNl4
         0a3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hWWFXcsvNk1mCYUZyMj71J+fQ6ki7XR2x1CBTcocpWU=;
        b=YrvimjOqMGZzwa5X62IMX9kGrpkaE5lI66rW7TNEcz/NqolmbkKJZ6Y9gqZr3zO1rx
         Oq5V2g7xZ4YG00E0lwUFUFLvYI8lwSlgCykWU8gop3lnMuMmpYQUaX1lcuTYb+BybSPR
         /8Y5vHnTSLVPKtTiiMkMFaRPhjAo0j1+Z51YlOXuZxYnqFGI2nTKzjjy22d5TOI1qEeA
         RpFWjJQtZ9ycdgsZvh/SZ1W7I7qZA7KEpiwwBtYxJmZa9+75cG/zlXSQN3LUEOKU8TtC
         gUpX3+rG4ifWEdrSifcj6FruNUdhFjp3sGvWMFhtmxa2UXYErqkUcVKq6Fitk698PmsC
         0W/Q==
X-Gm-Message-State: ACgBeo3RxogFma1edWGBP9TGN/xn4G8Iz+mSwhFAHiTpG2ay0F9LNSG5
	RUsHMEf12gH+Pi3SoUXXRaMlVSd5aN3ATA==
X-Google-Smtp-Source: 
 AA6agR4UFfhB65eOu+1vJoLKyflqkDOLvCOyups8hZJV/DqSgL1DvdsqLJ8jQoBJ30uh1CkRTBaFfw==
X-Received: by 2002:a17:902:a516:b0:16c:ef6f:fec7 with SMTP id
 s22-20020a170902a51600b0016cef6ffec7mr8822562plq.140.1659198466370;
        Sat, 30 Jul 2022 09:27:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8ca5])
        by smtp.gmail.com with ESMTPSA id
 x25-20020aa79ad9000000b0052ba88f2de0sm5022975pfp.131.2022.07.30.09.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jul 2022 09:27:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] optee-test: Use system openssl on musl
Date: Sat, 30 Jul 2022 09:27:41 -0700
Message-Id: <20220730162741.3624780-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 30 Jul 2022 16:27:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3622

bundled libcrypto.a in optee-test sources is built using glibc based
toolchain and expects foritied _chk version of the libc functions e.g. __sprintf_chk
which wont work for musl. Therefore rely on freshly built openssl by OE
instead

Fixes errors like

arm-yoe-linux-musleabi/gcc/arm-yoe-linux-musleabi/12.1.0/ld: ../openssl/lib/arm/libcrypto.a(dso_dlfcn.o): in function `dlfcn_name_converter':
dso_dlfcn.c:(.text+0x19e): undefined reference to `__sprintf_chk'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm/recipes-security/optee/optee-test_3.17.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee-test_3.17.0.bb b/meta-arm/recipes-security/optee/optee-test_3.17.0.bb
index 6fa10e7..18870da 100644
--- a/meta-arm/recipes-security/optee/optee-test_3.17.0.bb
+++ b/meta-arm/recipes-security/optee/optee-test_3.17.0.bb
@@ -3,5 +3,8 @@ require optee-test.inc
 SRC_URI:append = " \
     file://musl-workaround.patch \
    "
-
 SRCREV = "44a31d02379bd8e50762caa5e1592ad81e3339af"
+
+EXTRA_OEMAKE:append:libc-musl = " OPTEE_OPENSSL_EXPORT=${STAGING_INCDIR}"
+DEPENDS:append:libc-musl = " openssl"
+CFLAGS:append:libc-musl = " -Wno-error=deprecated-declarations"
-- 
2.37.1


