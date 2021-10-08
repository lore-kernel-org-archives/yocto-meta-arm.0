Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F046EC433EF
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 17:41:54 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.666.1633714914238830639
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 Oct 2021 10:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ke/NNoBv;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id g5so3581038plg.1
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 Oct 2021 10:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Woqtxg53qGbZeJ7yeP45A0MkzQlJZwYVdD5z27le3v0=;
        b=ke/NNoBvhE3EZVbQL0ZmB7Em/Ce166cNC+fbJQYN2SslvmJEt5VgZKVjG4NowOs6k8
         PBE4InFC9divWh9wHi2hEBkG53hsuCU8reZThOkLK/bPdUy4mUexZzLwStvm25oYy8Ie
         idEIJwBuCEh1jWTA3rJpMbdiWzkBi0N0lM/CIfYrrScT6uOKhvwBAlj5zH5sIC733oM5
         Q6HjsyQdVVAFpvrVg7Fjztx4Gea9x6x4QmK4ZgQ8lrwKKIjm8UN2TsK+U4Bc2gmUfJkE
         M+Bfju/eE3GTByP3SmSeYzdTcQfZsrjUplUqnmYtIoiAwE6sfHend6t4nEkm9f+Z3fln
         NaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Woqtxg53qGbZeJ7yeP45A0MkzQlJZwYVdD5z27le3v0=;
        b=RQKcd/r0kkIQ/aZGEqCRvlNJvLX/DBYlHeXSVYam/qC5KIvH3WkU37wxAq8K/BpouG
         aIAznHgPJQ4hwOR0hv39ke9DhKA32XOW/bhFoWSNUfNYptHhxew2ePuFuMov45/23vOO
         rEXuYM4wGwwCZkElnt6JngEHrQOm0OcvV/FR5JKMEQqotT9iUR1yAyLO6mN1nch3fLXj
         TIwe3j00ihghUZ+9PzLLrr6/HfwpZOg2783dGki+/Hx+MnRr0nfbgjY4Q02ZIoezgVbL
         6+7BGs0341z9buTIWihTkfFbp/SXs7MhwMlsay+lY9DQ9KuYPLgG0NKGBA49QjNEAx/g
         3rcg==
X-Gm-Message-State: AOAM531OKDJg3PaMNXSaZA+4rJqQwikDGCIJjAws2hEkj0Gvua3D2dlR
	uTbA7035IPPSUJCDJAYqsjEyKcVZ9ZuWMQ==
X-Google-Smtp-Source: 
 ABdhPJwExX4WegG/l5WNm8G32ViZlOo1Opku21AFf2vz9J8OTRAFLlqCZIwCNNnRna0qUEPGr6olFQ==
X-Received: by 2002:a17:90a:ab15:: with SMTP id
 m21mr13813875pjq.166.1633714913366;
        Fri, 08 Oct 2021 10:41:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2d85])
        by smtp.gmail.com with ESMTPSA id
 om5sm2582012pjb.36.2021.10.08.10.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 10:41:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gn: Disable for riscv32
Date: Fri,  8 Oct 2021 10:41:50 -0700
Message-Id: <20211008174150.2669608-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 08 Oct 2021 17:41:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2264

Architecture not supported yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm/recipes-devtools/gn/gn_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-devtools/gn/gn_git.bb b/meta-arm/recipes-devtools/gn/gn_git.bb
index 5600222..630c302 100644
--- a/meta-arm/recipes-devtools/gn/gn_git.bb
+++ b/meta-arm/recipes-devtools/gn/gn_git.bb
@@ -45,3 +45,5 @@ do_install() {
 }
 
 BBCLASSEXTEND = "native"
+
+COMPATIBLE_HOST_riscv32 = "null"
-- 
2.33.0


