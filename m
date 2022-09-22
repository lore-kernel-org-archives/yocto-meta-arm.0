Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C1FC32771
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 00:54:22 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.2048.1663808056288925673
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Sep 2022 17:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IPv1mIqE;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id a80so7705951pfa.4
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Sep 2022 17:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=TmW4X46UYW57mxHeMfVictkfapnrbareQ+kmeZwndjQ=;
        b=IPv1mIqEGCI+Lk6YpWZCvxLnQ9VH9BSJzmMq41xBHzuhpUf3jqm1/uWE8TaL0lrgh8
         +3KHxGDCuSCvqHTsJVCcY2aElhs70Zu0hQzj1r1XmH0fglDKnXt4f4mWXMjfH9s3QUIm
         IjtX7NCGYfV+/TRyzIh5zsecGg+cIBXl1gSXr2j1EkJdHq2feWiIr1F7apiyQ7xIGtmA
         MvetQRPHNkMfzdAFk495wpKj5DlpYj044cJGoKjvSoS1Pbj/eknoU/mDEu+mul5k6VNq
         IYGRmBJjEthrHrZQevdKq7are+ELLQv6n5CuQtRAa73znWtwsRZ8gYDuU9UAZyfCZhcS
         2abQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=TmW4X46UYW57mxHeMfVictkfapnrbareQ+kmeZwndjQ=;
        b=5F9YC9/YYXn6K/HagQMkmiwFd5xo6L55qW2qsW7ZNA8w+vzkFgfTemV8OrBO+FrVzy
         +hpwGQ97eKt/JUhXV50rZnY6nyeDQNF3+O7WVwIcSZl0RHKh4Pc68lu2zTJqitbNZKuA
         hyiEVJwd5K29qtaM4SBsfk5Z/URToNFNyJrG8TxoHboAXgEpKB2dCBhOq8a8gp/jgDS1
         FXhNBQ+7m3ro1LdzqAFFiKfu+In+MPNvtfxTFfWoOrOES9M9hBKg0OshULjwS2z88Ffb
         M0O6bnDLvdaPUNf23hStF/Tg4wyqL1RuplRjr5+Xy0pIKrgNNq8wN0suuMftmIpQSmYy
         C2wA==
X-Gm-Message-State: ACrzQf0st6rowV+Cc082YvJxTBC8N7Y2/TDtb96+/w1lY83Ti+CBjNr9
	KYw994OrhIBeyjZhXFf1XbpZ4Jf3o1U9aA==
X-Google-Smtp-Source: 
 AMsMyM5ePwbxTtKFkhLw3lso/Y5Kl0vXpOafB2LAk92XhBlC8fzexwU8+7O4/NjjuGuy2KaiwBjYwQ==
X-Received: by 2002:a05:6a00:852:b0:544:5907:7520 with SMTP id
 q18-20020a056a00085200b0054459077520mr1016072pfk.31.1663808055395;
        Wed, 21 Sep 2022 17:54:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7ab3])
        by smtp.gmail.com with ESMTPSA id
 u9-20020a1709026e0900b00176953f7997sm476597plk.158.2022.09.21.17.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 17:54:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 4/4] ffa-debugfs-mod: Exclude from world builds
Date: Wed, 21 Sep 2022 17:54:09 -0700
Message-Id: <20220922005409.3378701-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922005409.3378701-1-raj.khem@gmail.com>
References: <20220922005409.3378701-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Sep 2022 00:54:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3807

It installs arm_ffa_user.h and so does arm-ffa-user recipe, lets not
build ffa-debugfs-mod in world builds since it does not appear as much
in other package dependencies as arm-ffa-user

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebased

 meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
index 1b265a5..2b5dd64 100644
--- a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
+++ b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
@@ -37,3 +37,5 @@ python remove_kernel_dependency() {
   key = "RDEPENDS:kernel-module-arm-ffa-user-" + d.getVar("KERNEL_VERSION")
   d.delVar(key)
 }
+# Conflicts installing arm_ffa_user.h with arm-ffa-user recipe, lets build only one during world builds
+EXCLUDE_FROM_WORLD = "1"
-- 
2.37.3


