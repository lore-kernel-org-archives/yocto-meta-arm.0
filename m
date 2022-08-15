Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51948C00140
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 15:11:51 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.3335.1660576301214204857
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Aug 2022 08:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ImH65XHF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id j7so9417960wrh.3
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Aug 2022 08:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=ZZj8RiR+38Y98DO0rCr7uKFJCOlUjEx9srF6nUIi8vY=;
        b=ImH65XHFl+0VE3tnxS2hGUhhkd9NhLqWBxQ8tFKpKH4GyHh+dzZ4a0GEJMvPwFWczB
         cgLoT3oTKWcXDUIm5UwhIRWtHwBUmQkaGjewaJPclVjePruf3w5kk9GGts1/OaWXUdUS
         7kUAUTnwq6SE7Xwpps9GjwJCYZNtiJFPQ5rN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=ZZj8RiR+38Y98DO0rCr7uKFJCOlUjEx9srF6nUIi8vY=;
        b=FBcoVpIejFON6t6PLmVj+deh32Oe8siTrPJ5AgAfyg8TEFCK6xeJQAPY3PQO+k1Wox
         5ceILfC8LS00d7awwjhWUUXslDM7OzI+xbPV675m9m8Q8lrqpy+a3uKNze+imqTDCJLe
         V3bBBJpyceMM4YJF0Yz1uHZeA0mHAttB9q+iCYLrWT6WHMaHAFQjPt2a50vgOM70cQw4
         zyZPt2eL6LV9kPZSbNiGVxnXW+tHxUcT9g7eM/TNJQmjwjJMQKK8ESBHvv1IGzgODtGe
         UOv1G7KrPGinKH6Vdv/d0XrFQJ9fMFIOlWcCWQiPbWQw8l0bB6QqI5E/fiBUuw5PF1Wh
         QtWA==
X-Gm-Message-State: ACgBeo0kT/UUOywRfAwoqKKPkL0sMTFkwL983nzdB7T3srhNrpFatlCh
	USHfxl3PxoSrDmtLgsrV/T3u4Vff9wWK0A==
X-Google-Smtp-Source: 
 AA6agR7YixFzyfISeLcCg1psVFxBxFEpyWAD0NGs5Zc27lzjU6ta7LwH8U2TsRVg0wvubw5Maaf7ig==
X-Received: by 2002:a05:6000:1acb:b0:223:5de3:f8bf with SMTP id
 i11-20020a0560001acb00b002235de3f8bfmr8922330wry.691.1660576298888;
        Mon, 15 Aug 2022 08:11:38 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:27d9:5f4a:b4:2f81])
        by smtp.gmail.com with ESMTPSA id
 p11-20020a05600c358b00b003a5ca627333sm10676366wmq.8.2022.08.15.08.11.38
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 08:11:38 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] gem5/gem5-m5ops: Drop uneeded package inherit
Date: Mon, 15 Aug 2022 16:11:37 +0100
Message-Id: <20220815151137.1396680-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Aug 2022 15:11:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3684

package is always inheritted by the base classes so the recipe does not
need to do this. This became an error with recent bitbake changes, fix
things by removing it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-gem5/recipes-devtools/gem5/gem5-m5ops_20.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gem5/recipes-devtools/gem5/gem5-m5ops_20.bb b/meta-gem5/recipes-devtools/gem5/gem5-m5ops_20.bb
index 8ff4826..d55ed85 100644
--- a/meta-gem5/recipes-devtools/gem5/gem5-m5ops_20.bb
+++ b/meta-gem5/recipes-devtools/gem5/gem5-m5ops_20.bb
@@ -1,5 +1,5 @@
 require gem5-source_20.inc
-inherit scons package
+inherit scons
 
 HOMEPAGE = "https://www.gem5.org/documentation/general_docs/m5ops"
 SUMMARY = "m5ops provide pseudo-instructions to trigger gem5 functionality"
-- 
2.34.1


