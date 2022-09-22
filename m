Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB02BC6FA8E
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 00:54:22 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web09.2046.1663808054164853474
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Sep 2022 17:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fLN8+I28;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id q9so7597909pgq.8
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Sep 2022 17:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=+k5FIHQw8ESaftVWBVe/IYJQ2SrUVBbEr2C+P5S9tNI=;
        b=fLN8+I283Y/1hWNVnfB8q+iInQpPs6GGY9PeoNu+XbVFX2CcXoalC/VUk62WseRpnt
         he+IBepkQlYCIc6RpBPRFtXU2GTMU+85NLPoQKN2wOaffzU8lhYglos4yH6doozqs0Mg
         cm7GxLayDkWTGYBDDhjp7BWhFGL410o8VLHfYH9m86f0PlFEpV3CgUUGPiBg0aKtLqC1
         t/rgHalLDbts4GuuScVKlfneEcqMdzFSomUg6t1q+a7xJ6TuDfoUerUnLvq5ub8ZautS
         CbIOKSfmEhmaxMi+541r53BiM4lpvvbuirpmbVwJo1zWwh8xCGCSgY3UcXctLhaIqN5U
         bpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=+k5FIHQw8ESaftVWBVe/IYJQ2SrUVBbEr2C+P5S9tNI=;
        b=uvXZO1nTy10Ht2i13s9FML550orjL8g1qrp5LPnVEdEmsUDyAqNqsMrv9UhtxRZJlS
         uHH5Ry8tkaWGeYq9X8pXl711WLPJGbsVZk6LXucZBzPiQr6CqteJ/opdwm+fyE28/ByC
         bMcYjowdf2BW09VqCGgMytjyB03XWn8aRyJS4XIVS0lpnTHsImj3sKwTPGnxS0NlPx8Y
         ctGeD0Gs9P7nvpe7IAg8fxaCVylUNXVY2E+zEDH6MRAIzzNqZIahVZnjLnueZ4dBAwtB
         NmIvD3fVtMqDiNmNzSxYsh7XuIUrDV517wAIDBjqPPbDFFGbsrchyVcwxq7ygC94gL5k
         7z7Q==
X-Gm-Message-State: ACrzQf3AfCjT40w2NPy44hnDrTyCmnNqdodCs9DKgEjuhTskwLyj4zG5
	1cXxe5OSPaBdoPwyXQmY1qGFodBUnD89ng==
X-Google-Smtp-Source: 
 AMsMyM6Cg7ot1Wle9EObGYzCzeYC7HYtmtM8+CD1yIXUcZMP2f3VwSHYNjbtAsttFyOBtk12B3oUNg==
X-Received: by 2002:a63:da06:0:b0:43b:e50f:d2bb with SMTP id
 c6-20020a63da06000000b0043be50fd2bbmr844375pgh.112.1663808053409;
        Wed, 21 Sep 2022 17:54:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7ab3])
        by smtp.gmail.com with ESMTPSA id
 u9-20020a1709026e0900b00176953f7997sm476597plk.158.2022.09.21.17.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 17:54:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/4] trusted-services: Pin to use gcc
Date: Wed, 21 Sep 2022 17:54:07 -0700
Message-Id: <20220922005409.3378701-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922005409.3378701-1-raj.khem@gmail.com>
References: <20220922005409.3378701-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Sep 2022 00:54:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3805

These recipes are not buildable with clang in its current state

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebased

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


