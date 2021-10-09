Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A755DC433EF
	for <webhook@archiver.kernel.org>; Sat,  9 Oct 2021 20:03:13 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.11035.1633809793146696920
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 09 Oct 2021 13:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WdXyTtqf;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id q12so5992100pgq.12
        for <meta-arm@lists.yoctoproject.org>;
 Sat, 09 Oct 2021 13:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uQdkXikQCUkOKiZcv2m3ZIhBXaE/VZB79bc1JNMrUxE=;
        b=WdXyTtqfd9ZkrkPwkmDvvCDhiSDTr7JajgtwWzLtE9U6QizGcfDheLskeqy9ZTuQhO
         xWoefJ8t+zspyBjHYTnAEihvQVL3bbWSRHdUbNWoed+pMNap/khq2OHzPR+iBUzLn6ho
         JQqixfBY7bjfAluX46cqZfZZrlYHm0q4k62NbD2DK97PfrMlaNpOLmkc/SEw+H7pGQ6T
         Ww5CbMjo0PBydMIY/TjeO2UAjaTz70ZGYjZVycG3RnZh842qVdB3XvdNuCB8mUOrHJ6/
         lDW94CaqMt+L55SVfe9E2LZBhUNq4MBDme4SZuvFVdUv0aV0UgylFRuwNr0CmqqYI0ZM
         rJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uQdkXikQCUkOKiZcv2m3ZIhBXaE/VZB79bc1JNMrUxE=;
        b=NBCh2RWBMsEvhbH0rTBP4tLjFyaZ2WVdhAov84xFLVTBgvk3OIwNJzJgGR53eT9FpI
         atFXV9E5p+xToDe4L7XPncey0pKGNpVlQKsoeneLmhjy5Wq5xkRbCSEjrSyllTwXGg6f
         uW4vdy+eoSJqR9i06rGT2H8iO6Aco59MautnQmOhXoSlpYAVRKbdBI7n+C5QXCt4NYpc
         e+ld9M/BF0k5a7JOfxHUcocGVA5Y9Avfrdb7eiQMkMuus0hY3FZqlDD7ytc+mvBsSrvt
         DqsyYwQe3AF5hwqYv81MF0khi8o6ca8mc0m+msd/3hoA8ofgCEPSfZxxj5S8Kel2sAL2
         MVYA==
X-Gm-Message-State: AOAM530U3Naq4ddkD+iapME6Bb+cP0xWmxMGYn4JoJ6h+WuEWxW0O2PN
	fWgrAvAfxAKPqqudJCb743aCE8hn+ROTbg==
X-Google-Smtp-Source: 
 ABdhPJyZFfS7A0spSRXGw1JcjlU4NxCFkG5+fnDOlU9gSnEv3k25wjAZI+HPGiQqfQVVHBpBSSdGjQ==
X-Received: by 2002:a63:b00e:: with SMTP id
 h14mr11008387pgf.135.1633809792441;
        Sat, 09 Oct 2021 13:03:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ba74])
        by smtp.gmail.com with ESMTPSA id
 n202sm2985350pfd.160.2021.10.09.13.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Oct 2021 13:03:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] gn: Disable for riscv32
Date: Sat,  9 Oct 2021 13:03:09 -0700
Message-Id: <20211009200309.4731-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 09 Oct 2021 20:03:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2265

Architecture not supported yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use a regexp instead of override

 meta-arm/recipes-devtools/gn/gn_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-devtools/gn/gn_git.bb b/meta-arm/recipes-devtools/gn/gn_git.bb
index 5600222..9b3906c 100644
--- a/meta-arm/recipes-devtools/gn/gn_git.bb
+++ b/meta-arm/recipes-devtools/gn/gn_git.bb
@@ -45,3 +45,5 @@ do_install() {
 }
 
 BBCLASSEXTEND = "native"
+
+COMPATIBLE_HOST = "^(?!riscv32).*"
-- 
2.33.0


