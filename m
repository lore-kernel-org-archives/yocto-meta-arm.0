Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D92FC6FA8E
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 22:36:57 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web12.3590.1663713411800071522
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 15:36:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=PBLXl9jI;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id z9so3158702qvn.9
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 15:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Ik9vligT8o2/qAI0tMRAXXbvsahSq0hwvvsufALQBy8=;
        b=PBLXl9jI2kIlAvk5Fon9aLNKsee8cTdZUO1aQ7a6ZUdb6PM95fzqT04TSOrz/7NPUr
         HmsrYvSHAeJrcBgMGJwxGgGuE+bW+o8OQeYiQlJ+IoMkG2zujtlieTAazSI5dhjb268w
         PvzNQX4MtO7HY1JvX2Q1ATA3wg8RC1l7W/z81rvH760WgJJntl3Gf9IFYDijBfYMtHq8
         e1qVZncb/wTyHHvu749383wOYcPFLG5HfrpMJPy5MLH5exLMtrIuuePEUQRPhG5H/fVO
         KyWj5L1Kg1ND6F86LXMU12YfHoND7yRy56LeQI/anAN8DodaA89Vv5RGt00kdn9fspmI
         D1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Ik9vligT8o2/qAI0tMRAXXbvsahSq0hwvvsufALQBy8=;
        b=hL4lZ+xSrK0KyhQRFQJUbQDchgtX+976GIXCCjkC6CQMe1XEHRlmHxW6oY6ubkfNn3
         LsOlAQTpL2O7uvs6dd4oP/UUCXlFLGf9AXYMdNN428v2YGNbc6NwAX25dn1TVYT4oLsT
         r0v98pspgAsLOuF5RL+OjAE4bdXATasHKKKPpH3mZBfy401JA355bo9ySc6JJO1CmPp7
         FKQ8NMZd7ZON3doMfCQqmt2XZUocoy9Gartrvda75NQ14Uj/6HlRLmc03pAVWtkx/wMo
         zhXf39MOHw2vJeqxSJXtRFXDUqH/dl7RnsYpq1+JU/jDEa2v/UzlLwJdPtt1fOi0j8cg
         ENvA==
X-Gm-Message-State: ACrzQf2iPctoYRwT+M0ZXe8gnUpmzCUPfmcf+wSc7n6NtqzR6EnExVwy
	eUqXH/xjaosdfrxpRHzvuN+9G2kzQEaXyA==
X-Google-Smtp-Source: 
 AMsMyM41amS3yfaauPVq4BpHsjGvbxvBJUbz8MSrPS0iXasDqpVIaDnRM5cYKDjU2Tx38l88MgS2Ww==
X-Received: by 2002:a0c:916c:0:b0:4ac:7d0a:5f47 with SMTP id
 q99-20020a0c916c000000b004ac7d0a5f47mr21760943qvq.22.1663713410404;
        Tue, 20 Sep 2022 15:36:50 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 s14-20020a05620a29ce00b006ce60f5d8e4sm714769qkp.130.2022.09.20.15.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 15:36:49 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Andrei Gherzan <andrei@gherzan.com>
Cc: Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: Re: [PATCH] edk2-firmware: Fix configure sed typo
Date: Tue, 20 Sep 2022 18:36:44 -0400
Message-Id: <166371340602.2604237.14459561646818257716.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220915131530.1677573-1-andrei@gherzan.com>
References: <20220915131530.1677573-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 Sep 2022 22:36:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3793

On Thu, 15 Sep 2022 15:15:30 +0200, Andrei Gherzan wrote:
> The configure sed operation will not behave as expected because '*'
> match misses a preceeding '.'.

Applied, thanks!

[1/1] edk2-firmware: Fix configure sed typo
      commit: fde0575aeac3b86102d521a55f4a26e6afa623fd

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

