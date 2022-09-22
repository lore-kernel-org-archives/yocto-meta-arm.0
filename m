Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB14DC6FA91
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 00:54:22 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.2133.1663808055149519353
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Sep 2022 17:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M3PZU2uo;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d82so7678589pfd.10
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Sep 2022 17:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=LHwxLQKeB7DmmhyH4gujx9W2buBB9NvFeiIkGoYApWs=;
        b=M3PZU2uoq4IFryouv43dJfOYET4PgSrJeVgXlToSC57vojPhnw99nBm7YuO9ghDoiK
         1Ba5Z/O3cUpw5NfyHH3eQ5HY3UDK7K3K7wW85HmQvzEiDjVSbpF3RNd6et6TbgHXgvqr
         T8IrOkC+LxXUDRbhK52C1zT6Qlez+qnsIYYRL10R6u5NxcORV0UWUy/VbKcnMtRg1lvd
         EHMr4dbWKSFbeyve7lWynQFNAzcfekrae931RhxKWZXwtZrBIZCmHteRVseE3f3vdJKa
         sp/5qSkUybQ09KzuM99jcO2Ft3nYCMEuvQq4+bKbBEFJES5QgNunm7/mw2KFKB8om61S
         h84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=LHwxLQKeB7DmmhyH4gujx9W2buBB9NvFeiIkGoYApWs=;
        b=WIMv9F4xtnCNli5SwGmJsUsL/TPF8pC59HXVPzh6BUTE9addoMGjDiTZYLIrDUpv75
         wECy172XkAgTZpradTdQD7S/LzmlKRUyI4cNwSZQ+6B5uxIoseQ3ustNCKxZ2pLZ0YST
         jjfvr0WMoOwHyW7kLq7/w7OeGaie0H6fX2RIcfnaLmgmZ4kgwHgvETVeJOcS5V0E8+86
         Hc6QuAmwTgXc1NUZjkidsAEEkzw2HVxeQ25oth7bwmrDrm5wAocbIUWkMXbJcDFw4wQX
         lOQJHvKElm8ASyp+gwxqMGwU8dmUOKMIPh8EzQvDrDz9QROvME7PJ+MEvjd6XfsFJ5+S
         Fqaw==
X-Gm-Message-State: ACrzQf1SbkjmXVsFWik3t+RS+INhnQnjEzgQwo/HgJQaCuwoahxijrXL
	b4LYYSPydmdAFaY21DzxAaH70wSKz/pSWQ==
X-Google-Smtp-Source: 
 AMsMyM58zl5d/ZPKeIgmBP+ufAsyxovPff8+gSt3Ca4gvIkMR2IaXiKk6VVfXW4Gt429kYkx2f+MEw==
X-Received: by 2002:a05:6a00:e1b:b0:537:7c74:c405 with SMTP id
 bq27-20020a056a000e1b00b005377c74c405mr773955pfb.43.1663808054406;
        Wed, 21 Sep 2022 17:54:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7ab3])
        by smtp.gmail.com with ESMTPSA id
 u9-20020a1709026e0900b00176953f7997sm476597plk.158.2022.09.21.17.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 17:54:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 3/4] linux-yocto: Add bbappend for 5.19
Date: Wed, 21 Sep 2022 17:54:08 -0700
Message-Id: <20220922005409.3378701-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922005409.3378701-1-raj.khem@gmail.com>
References: <20220922005409.3378701-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Sep 2022 00:54:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3806

Enable tee and arm-ffa driver on qemuarm/qemuarm64 by default

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebased

 meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend
new file mode 100644
index 0000000..7dec2f5
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend
@@ -0,0 +1,9 @@
+# enable arm_ffa regardless on 5.19
+SRC_URI:append:qemuarm = " \
+    file://tee.cfg \
+    file://arm-ffa-transport.cfg \
+"
+SRC_URI:append:qemuarm64 = " \
+    file://tee.cfg \
+    file://arm-ffa-transport.cfg \
+"
-- 
2.37.3


