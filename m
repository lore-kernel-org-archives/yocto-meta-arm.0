Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2BFC61DA4
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 01:14:56 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.458.1675386892202022327
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Feb 2023 17:14:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZbnsraBk;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id m2so3774573plg.4
        for <meta-arm@lists.yoctoproject.org>; Thu, 02 Feb 2023 17:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=95J8QdukBFaJjAIL3c0d0ryihqPYD0ZUNU2Vma3DoTs=;
        b=ZbnsraBkb37mv8EScxgp9xEFnbTSMGeE/SET/3S+WlCqB1qltSYuzqQB1iq74PBM6v
         Ih7GauJEmy0nJuj7vdnpDWS3xL7WhFp2fXZbNtzlewte3FIfGUA+DLqkt+GSnurLSzyf
         9wT3XxNVcl/LXpBT6DPRojFYyOI+G7yhNbq2iBeXHMc0BcwgDwbq8TbEiBO9TNJqvk+A
         Hg5SjRNvoaeYNB2iH9R6wjCknxPvGKtyT5lqRKYGHLx+uye5DW3uw8CXS20q4NwDJO1d
         Mso4BTYsWQbQ6pAc048tfTP4Z67EfGtKC/k8hoim/yyA3lcMjbaqRkoQSCSCSOlRO1pE
         sDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=95J8QdukBFaJjAIL3c0d0ryihqPYD0ZUNU2Vma3DoTs=;
        b=6BqJdLDvm73zUlpJ4Eeyudk+XHg0WL8+38ynIzbOKewBcp3b6vqvkcEAScdRxAJgR3
         dgQhcQhA58pnDp9jfeWGQ3AtEezCfrKYigOzUkjUOAlGeFkgIJNfhDH8yvwBF3IMLRSz
         hj6cnW3cH3VLKkpgm8CXQgnDMYzF3b44JBWLmIk6C7AkXRdYkjo1jNj6h9vlg/CWniYw
         XRGwu95fegsEXwoTncdMr6gVOTzuVG/qWXr8UU8B+OtDT4+MDbrwqEMFe2wK6LEMpdrl
         yAfD+UtcyRJfZz8jHsG8e93ahUjOVzitEY7knVvAaiDdEFd2BTZMQiyTSAbyfWd5Zux6
         YTkw==
X-Gm-Message-State: AO0yUKVAPOspOizfXSOWVaTsR9xy9qppeu/wb+DaaaJ44cblHnsN0G9x
	dAZnF2kwoZCQwmyEHT70kNq4EMmJsRpuSQ==
X-Google-Smtp-Source: AK7set/hLHl/cauO5fh1Xi2D9H8RpFkUrs3wau3H1JvY9Rno2+SkUrq+Eav00Ix+pUIoZ5sDGPXwXA==
X-Received: by 2002:a17:902:e54d:b0:196:4814:2a2d with SMTP id n13-20020a170902e54d00b0019648142a2dmr10439927plf.39.1675386891069;
        Thu, 02 Feb 2023 17:14:51 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::868f])
        by smtp.gmail.com with ESMTPSA id p6-20020a170902eac600b0019324fbec59sm308377pld.41.2023.02.02.17.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 17:14:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gator-daemon: Fix build with gcc13
Date: Thu,  2 Feb 2023 17:14:40 -0800
Message-Id: <20230203011440.3673351-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 03 Feb 2023 01:14:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4355

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Include-missing-cstdint.patch        | 32 +++++++++++++++++++
 .../gator-daemon/gator-daemon_7.8.0.bb        |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Include-missing-cstdint.patch

diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Include-missing-cstdint.patch b/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Include-missing-cstdint.patch
new file mode 100644
index 00000000..294f804f
--- /dev/null
+++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Include-missing-cstdint.patch
@@ -0,0 +1,32 @@
+From 87745a6cad0f7819ac8f8d3826f5e228ebd843c5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 2 Feb 2023 16:39:26 -0800
+Subject: [PATCH] Include missing <cstdint>
+
+gcc 13 moved some includes around and as a result <cstdint> is no
+longer transitively included [1]. Explicitly include it
+for uintXX_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Upstream-Status: Submitted [https://github.com/ARM-software/gator/pull/40]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ daemon/xml/CurrentConfigXML.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/daemon/xml/CurrentConfigXML.h b/daemon/xml/CurrentConfigXML.h
+index 0b239fd..d9047e3 100644
+--- a/daemon/xml/CurrentConfigXML.h
++++ b/daemon/xml/CurrentConfigXML.h
+@@ -1,6 +1,7 @@
+ /* Copyright (C) 2020-2021 by Arm Limited. All rights reserved. */
+ #pragma once
+ 
++#include <cstdint>
+ #include <set>
+ #include <string>
+ 
+-- 
+2.39.1
+
diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
index 0daebfde..6188b07e 100644
--- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
+++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
@@ -18,6 +18,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRCREV = "6a944e7ee1f1c3ab9b2a57efd24c58503122db02"
 SRC_URI = "git://github.com/ARM-software/gator.git;protocol=http;branch=main;protocol=https \
            file://0001-daemon-mxml-Define-_GNU_SOURCE.patch;striplevel=2 \
+           file://0001-Include-missing-cstdint.patch;striplevel=2 \
           "
 
 S = "${WORKDIR}/git/daemon"
-- 
2.39.1


