Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24AFAEB64D8
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 18:17:20 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.6025.1686939436064982427
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 16 Jun 2023 11:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=VhA8eEXQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1a9db19d663so687982fac.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 16 Jun 2023 11:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686939435; x=1689531435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/miFEOA9UMBF/bkGpCVTMZDgi6gLVEJnVAu/MOCPpJY=;
        b=VhA8eEXQvOxbN+372ivXwQWrDyWgi4nxtE3qsnxEoLjEfB6Eq0mIqkqi498r/NCvPv
         O2u+gP8qcitGgovffmPq5rYEbJn5Av52/uCeJ3UrZ6vZFjKumuWGgEyO7qw8RgfGVC8o
         IDX1uT0nhyLY/Zkv7A7Td1N6vaLaaaL8a1eDWsUJIks204asg2uiMf9BNr0BIj1pNa7c
         0XyTVIi/nP2oHxi+DAxHzKqF1Ie4rhye2UmluG5UGRwhk064sRyceRs7IUp+81otW9AZ
         EZdWhuKsbKKv/jEgS9JVs1VEz9Ihsfbkde9mBqapAppkd+hrHyYDm73PCjngM8ffQzXn
         mqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686939435; x=1689531435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/miFEOA9UMBF/bkGpCVTMZDgi6gLVEJnVAu/MOCPpJY=;
        b=PRjl5U6lgUehMu+qCA8Q9Om7ueg9kR2GVKWhqRHvWJwPFDJpcPC/+RCRcyT1ltqRKJ
         m5b9T8SeDsixTuOEyDgVjujvUMRBrSCFvuFWmdsJGpDIKHa37Tb+GLSjhtwErFNtcxTG
         5y94l1C0W2qNucE5i0RblbP3lRQwqBI+HY1g3WzZ9nHkDipJFTlqIT5HI0akrjM3XWti
         JAgLvgQ9HsCT3lsxCFnsNj1WvKetzsg868jcfw9b9xvZhKIWKtEMaVTMEMyr2JVM81fm
         /zXnpkrfTWb4Y11Y8zQu9VnzIrxb85mv30VlnO/N95krvD2U+FULnN8wGKyARrw6lp/n
         dlCA==
X-Gm-Message-State: AC+VfDzPsWlwNOfyVhA3VmXZj6ebN30KpmvYOY+mZqy2XHjmni3j8cHQ
	BZSR+OkzoovC0b72DAdsh0820gmFnzg=
X-Google-Smtp-Source: ACHHUZ5gBJZ+Mt6szFxWb0ogbbMATABxqsG5Hgtg9AfK8m6OFOhEAXU8MDII/9MTDg96Aa0LabINPA==
X-Received: by 2002:a05:6808:1a8a:b0:398:5adf:3609 with SMTP id bm10-20020a0568081a8a00b003985adf3609mr2756849oib.44.1686939435027;
        Fri, 16 Jun 2023 11:17:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id t15-20020a17090ad50f00b0024e05b7ba8bsm1697777pju.25.2023.06.16.11.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 11:17:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] gn: update to latest
Date: Fri, 16 Jun 2023 11:17:11 -0700
Message-ID: <20230616181712.4168591-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 16 Jun 2023 18:17:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4802

Brings fixes to build with gcc-13

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-devtools/gn/gn_git.bb b/meta-arm/recipes-devtools/gn/gn_git.bb
index 20832016..4e7fa9f7 100644
--- a/meta-arm/recipes-devtools/gn/gn_git.bb
+++ b/meta-arm/recipes-devtools/gn/gn_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main \
            file://0001-Replace-lstat64-stat64-functions-on-linux.patch"
-SRCREV = "edf6ef4b06b42c58292faea78498aff76bdf68ed"
+SRCREV = "4bd1a77e67958fb7f6739bd4542641646f264e5d"
 PV = "0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
-- 
2.41.0


