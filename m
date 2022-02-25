Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202AFC433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 05:08:06 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web08.3519.1645765684951431894
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 21:08:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=c2/z+Xjf;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.182,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f182.google.com with SMTP id c7so3678269qka.7
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 21:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rkD5gmrjxElfg8pMBhDOP5SyMqgIdBxfWe5MGwwHbSk=;
        b=c2/z+XjfguS7flp76a4seXwl8OwV5wNOo9VtyfLttuV/ZXGa8JJl6lPS3b6IKDMdki
         IvB5O8DBhmX8uyUnMRDzFBrwOhgaK4/CEJJoaWVyt92myUAEY+53SkR9aprtF0fGGnwm
         e6kzzyi9ZIQpMaVBYf0UYubJ75R8SoVWLEb/V2MvSkv74NI/iKf0GwlYbj4ynpDIGvuf
         1qUFIJInd8+lSEciBMkxJ4KokTrX1ijztOnE1rxZZI0ePHVbPcdEzLkai6+r5nYvIdc1
         QN1IQh0jU0Wxi1MrKIguTOwe4RkGO1NLJjCpj/9A/OhVpbOW127xJTH0Udgh+iEW7p1t
         4SAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rkD5gmrjxElfg8pMBhDOP5SyMqgIdBxfWe5MGwwHbSk=;
        b=oE0i5/Yul3fZ9v1t61pWx9//T48ZJQTmYoFDHMPO3+Asnb7w0JLeGwV6DX7Daw0DLh
         QqpH9Fd1sqfx062F5TSDPRQZS9wTt4aDtu3nbMXXObY2wxASy8WwR8NaNnAG6cPSua1c
         ZWLisfNXx/5ihh6VJBAQZXqVk2AjMFgJWQX2eGw8wm2mcmoPudORW+kePd0lrFB1Njl/
         OVaDpvoGMZtmAH1JnXVlOK6KtaBroKBV+KWTWlzQrqJTMzPk1XRGbPiKyDtAfO7eoOOF
         iSj7T7iF2qxzsmicAhRMJ1OJ7CWd5l0LnTVDYHQCNFpuCfT3XR+TkUnAIJSmIY93T58U
         0vJA==
X-Gm-Message-State: AOAM5309wzIqLXFnXOfNPu0Dgdm5pF/7CGKmLpbmUN+BBAFxIwp8oJ4t
	mZ36XGDWvjKWHoVs5KttsXfcQK4qyrm85Q==
X-Google-Smtp-Source: 
 ABdhPJzAU/ynuGqoXADwEDbHRcN5y0GiIf0twcyVPWnyl3enRaC3tqNg8q9CU0NJlocvQXuW2BOB8Q==
X-Received: by 2002:a37:6591:0:b0:60d:d457:3a79 with SMTP id
 z139-20020a376591000000b0060dd4573a79mr3777971qkb.639.1645765683989;
        Thu, 24 Feb 2022 21:08:03 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:97ee:8b84:aa35:fed0])
        by smtp.gmail.com with ESMTPSA id
 w1-20020a05620a094100b00648e56836ffsm749675qkw.82.2022.02.24.21.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 21:08:03 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 1/8] arm-toolchain/external-arm-toolchain: fix missing license
 updates
Date: Fri, 25 Feb 2022 00:07:56 -0500
Message-Id: <20220225050803.2517279-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Feb 2022 05:08:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3058

From: Ross Burton <ross.burton@arm.com>

Commit 53a40b1 updates the license names to use the SPDX terms, but as
intermediate variables are used in this recipe a few instances were
missed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/external-arm-toolchain/license.inc   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
index 10f2542292b4..4260dc710d7d 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
@@ -1,9 +1,9 @@
 LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only & GPL-2.0-only & LGPL-3.0-only & LGPL-2.1-only & LGPL-2.0-only"
 
-EAT_BFD_LICENSE = "GPL-3.0"
-EAT_GCC_LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
-EAT_GDB_LICENSE = "GPL-3.0"
-EAT_LIBC_LICENSE = "GPLv2 & LGPLv2.1"
+EAT_BFD_LICENSE = "GPL-3.0-only"
+EAT_GCC_LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
+EAT_GDB_LICENSE = "GPL-3.0-only"
+EAT_LIBC_LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 EAT_RLE_LICENSE = "GPL-3.0-with-GCC-exception"
 
 LICENSE:${PN} = "${EAT_LIBC_LICENSE}"
-- 
2.30.2


