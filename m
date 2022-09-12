Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD3AC6FA82
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 06:21:47 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web09.4526.1662963700328013242
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 11 Sep 2022 23:21:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hFHLiAES;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 8so1975542pga.8
        for <meta-arm@lists.yoctoproject.org>;
 Sun, 11 Sep 2022 23:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=3OT8YaCHnHgvWA6v8MfSIBXQRTI63Ot9vtJtPQQh2vA=;
        b=hFHLiAESHQUHQGqVs67O3e89ElNAhfL6WocLQ+837rDA35yfW6YyiB6fZgI3yXQ/Na
         ycfdY5NXrp0R6zTpuqT8w5m1X2YSx8tLGGlPkeMQB+qAJCPK+pTEmDhSel0UafAQ/K3k
         AqNF/G5T67x/am83SoZeliCIa23QoTDrzmd9z8ibBt8lgcwNtyXhriaRdXQIX24TasWt
         LghFMj+DwtWfgd7u87/hO9KguO1DygtaE9aHjycAvzd+14fcOC5Xtm2cbtdJ8wMWKW4E
         krefffI8364+CTn/PM307E293/ZINji2V4lfVkn97GMvSAQSBYR6g3WyLyFUW/SCTCwR
         EhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=3OT8YaCHnHgvWA6v8MfSIBXQRTI63Ot9vtJtPQQh2vA=;
        b=aL80QgOS2dzubwNn1jqKT8agFxhtUK6F8iwJx2Qwkv/ss9xuX7bJfW/GH6iuh9+Mzm
         TWP+T/OONnxpVAb0lShjQSjhwMmaLCzHjijjF1wxzo2A3aCHSGoOaH56X5A5SHVNLwwL
         PVXctxueyGFscvUkH62d0aihSH9jsPRjIDuussxGHhPiKn1CtMdZ+LYWY/jOSGLudWh9
         dOWDgHAmZwvdjX2r0KxHOaMozSMuJzqvr2y2sKsPqbLmTYkq8ZFRK9XdpxnAWVD1VmUc
         tZ8WUgubzo13DOKDk15uWuoCKIszzBFcauoDi34dETtV3X6935+aMyOvLC/GrMMGZqF2
         cRWw==
X-Gm-Message-State: ACgBeo3keJdSNPayhau5C4GGHfm8vG7/ML2amPDTPY47PXcW6N9DuLCO
	lL232p53sQRSIewTwoBbHsR5RQv2oNWLYQ==
X-Google-Smtp-Source: 
 AA6agR6rYvdj0LUj554cemfAjRl6J6cekxcSB5w+WawQcHF4R19SM6r6hD/Yhe9D7jcXcAt7oED7aQ==
X-Received: by 2002:a63:8943:0:b0:434:f94c:4682 with SMTP id
 v64-20020a638943000000b00434f94c4682mr20484284pgd.531.1662963699565;
        Sun, 11 Sep 2022 23:21:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8fc7])
        by smtp.gmail.com with ESMTPSA id
 h16-20020a17090aea9000b001f22647cb56sm4447265pjz.27.2022.09.11.23.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:21:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-arm][PATCH v2] trusted-services: Pin to use gcc
Date: Sun, 11 Sep 2022 23:21:36 -0700
Message-Id: <20220912062136.3091652-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 12 Sep 2022 06:21:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3766

These recipes are not buildable with clang in its current state

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Extend the fix to all trusted-services recipes

 meta-arm/recipes-security/trusted-services/trusted-services.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-security/trusted-services/trusted-services.inc b/meta-arm/recipes-security/trusted-services/trusted-services.inc
index 80c0849..a8f49a5 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services.inc
@@ -50,3 +50,5 @@ EXTRA_OECMAKE += "${@oe.utils.conditional('TS_ENV', 'opteesp', \
 EXTRA_OECMAKE += "-Dlibts_DIR=${STAGING_DIR_HOST}${TS_INSTALL}/lib/cmake/ \
                   -DNEWLIB_INSTALL_DIR=${STAGING_DIR_HOST}${TS_INSTALL}/newlib_install \
                  "
+# Newlib does not compile with clang
+TOOLCHAIN = "gcc"
-- 
2.37.3


