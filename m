Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1479C433F5
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 00:50:27 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.406.1647046226495019677
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 16:50:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=T6UTM3Bj;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id a1so8740372qta.13
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 16:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gEmUCn/q/QCpo3Uyw0rH/oCXpUcNvCfI0W/XOLriIWk=;
        b=T6UTM3BjVFV5HAvQoYe7qsBj8EPh9Rq/ILqXPhqS4wugneFn241AZkTE4cpV4QswZE
         4icvtNwpkRxEK1muGi4e3XMmsLQiAvWZv3RW/4PLt/UG5atvBu/C3fLosoHJ9uQ/IoS1
         XNJAdS/LZUJ03wtOmtNQt9kC0S1ooAlel0JSqCopOyNi9tr1OPdAsU9yj2qIJcYP2nBq
         54KH2lT++Ef+vccYM2vwuIMvx3Q9GwihSD456tmAxoh6CJ0rIi4E3RU+EnGuLYpxXS0f
         h/4IWGKdNBfuZztyGHJuJDELC0+JgKQdAx8Pjlbn8g6bY/q0FY6resiiSkJz5XzBA7Lh
         7ADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gEmUCn/q/QCpo3Uyw0rH/oCXpUcNvCfI0W/XOLriIWk=;
        b=mI1LC+T8yRzFE8EMaym+LMTslm11T1zEz3ovtMnKSZaswkCbhXC+PtOokK7e0FUMdZ
         Sy34g/WN2X8ndIKk6CoecGcBEV+TZeXLhnkiiep25tNFWJmoycpFKExLjA8OGy8EfImg
         1AUmZjbiLxxRbJovzMiY/jyZMOS6+JzWpHzuKI9pBUkmVQ3P6vkJ1rNocsk4ZysDnADu
         QV5QmVvGoJfecbENYSJb7VVo9TbSRoQbh844apb5BIQV6HehmiJkMc6wdJCK8SKGB4sz
         OlZaFNG/I7WODe3KuXdAmK3EdwT0MQLTXiELMo1Ytgz582vHKdVFA1lmFaivrqzWb0b4
         ixWA==
X-Gm-Message-State: AOAM533rCx+mUjF+028fjFTvfV5/9/EOFObgPoRxs/BUR+UyuwMeWPTA
	NRiihgFMMZK/NhJRNqY0AN250+MrFtsM2g==
X-Google-Smtp-Source: 
 ABdhPJz8j0QuspK/e1Ep4LlwvcsRacURGjzNIA8G1cfinAXCE13NhylohWZ9e8YcG7gF2p9G0rRTfg==
X-Received: by 2002:a05:622a:448:b0:2de:2d2f:9cae with SMTP id
 o8-20020a05622a044800b002de2d2f9caemr10546748qtx.6.1647046225238;
        Fri, 11 Mar 2022 16:50:25 -0800 (PST)
Received: from localhost ([2605:a601:a66c:b900:77d1:5990:d885:810c])
        by smtp.gmail.com with ESMTPSA id
 c145-20020a379a97000000b0067d943f7586sm1002901qke.123.2022.03.11.16.50.24
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 16:50:24 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH honister 2/2] arm-bsp: update linux-yocto 5.4 to the latest
 version
Date: Fri, 11 Mar 2022 19:50:23 -0500
Message-Id: <20220312005023.3864751-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220312005023.3864751-1-jon.mason@arm.com>
References: <20220312005023.3864751-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 12 Mar 2022 00:50:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3159

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bb b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bb
index 0a67f8780760..6c9fe5139b68 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -2,14 +2,14 @@ KBRANCH ?= "v5.4/standard/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "807b4668ff7fe3be031ace442a84d70821ef9571"
-SRCREV_meta ?= "98ba88191b7c489bc0d83b6c87a31b2330fcd886"
+SRCREV_machine ?= "f840db108606f987e174f1658dc120795798e808"
+SRCREV_meta ?= "63746f1a36196425c38a1bc45dfddbcd6f979850"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.139"
+LINUX_VERSION ?= "5.4.183"
 
 DEPENDS += "openssl-native util-linux-native"
 
-- 
2.30.2


