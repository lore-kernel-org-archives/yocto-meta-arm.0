Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B014EC433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 17:13:09 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web08.14075.1651770788006266578
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 05 May 2022 10:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=bsJNOT31;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id x9so3644219qts.6
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 05 May 2022 10:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ouDgOXs/dS+F5AeAl3vCETwBZVx+K4ElHXCXiePYMoQ=;
        b=bsJNOT31rpQelEdCbV9P1Y+LZhX6M8k3lxOszAEtdoujOTgC162C089awfxMXfzgdT
         ERFJ6kGoRVEQKtWRwDMV9sjjXXFpYcK60BctDbnDz/HFrd75UhgaeGFU2sZKvrPtHgQg
         Qsh156B0gcdjLK+fnxu9vrWO2JjWgMrjmrK1HTbhV7A5S7jstXxUs3sHI8JByWCIHkMO
         yb7jPw8RwPrpzPZmEsCkHqQSdDE0R2XMpRbyQXkZfJSq2Qqh4JivQHbicmoRwkHDKQ9k
         bOQBcWNUU3P35RGj/ku18MQ7q2tXYXRoz41f9aH9auGkGq0k9IAm2n/IvMIw3rCCTdxz
         BvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ouDgOXs/dS+F5AeAl3vCETwBZVx+K4ElHXCXiePYMoQ=;
        b=i2sQ8RKludtj6VuBGOY6BXkxNCQ1RWVBHJ2X6NgR9F1hMi8WDq2I2W5Nz7gUGs62Xf
         bSoVFZwKc8TB0ZMQl3wBRDHf8y4VjhKIpk7V3piKE+SKS0vrZKC70WFEVuXTC3UX89V0
         Mxw6dppV1txCDm5zNUMW8mJuDHvOKMplMxZ8NgnmPY/yYfN1iGZYIDPl5uiJ1TM9claG
         8NmLpyY+vhhyO4vZ+iw9FSiPTEjGnJc/BqqFbmz4V8q9pSHfXHu0b8DztLExyvofPWZb
         gLlh8Ne4cgsCJIo5HfKjxBetLrOH0loof8akvKP+4KwaRiRfh9ar8YekAfka2VI9cSDv
         nAmg==
X-Gm-Message-State: AOAM531ybu2M/QxG5Br2r4PTUqZttyxIxAvZdv+1Rp4l/M5FD+BbFmp6
	GODEFOadXwAJg5FuBIZjYCwOve3DstYLivGw
X-Google-Smtp-Source: 
 ABdhPJwGkswvmIrsSR12y0vLdLgZVPsG/HSD41OteX4FRzLdtml+qFItUpPTmntGmRAAhvbdGRVDlg==
X-Received: by 2002:a05:622a:4c7:b0:2f3:64bd:d8be with SMTP id
 q7-20020a05622a04c700b002f364bdd8bemr25231978qtx.0.1651770786899;
        Thu, 05 May 2022 10:13:06 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 l14-20020ac84a8e000000b002f39b99f68dsm1118093qtq.39.2022.05.05.10.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 10:13:06 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 01/10] arm/optee: Add optee 3.14 recipes
Date: Thu,  5 May 2022 13:13:01 -0400
Message-Id: <165171962770.1050116.1700557551021133988.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504165820.882784-1-arunachalam.ganapathy@arm.com>
References: <20220504165820.882784-1-arunachalam.ganapathy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 05 May 2022 17:13:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3368

On Wed, 4 May 2022 17:58:11 +0100, Arunachalam Ganapathy wrote:
> Add back v3.14 optee-examples, optee-test, and optee-os-tadevkit for
> TC platform compatibility. These files were removed as part of v3.16
> upgrade.

Applied, thanks!

[01/10] arm/optee: Add optee 3.14 recipes
        commit: 35445203d2a1e555db652e632d8ddeb1b7147c1e
[02/10] arm-bsp/optee: TC: Set preferred version of OP-TEE to v3.14
        commit: c9bb1eab4427e2ac8a09b5561bf00bdf6ec98e05
[03/10] arm-bsp/u-boot: TC: Upgrade to 2022.01 and add patch for secure DRAM size
        commit: 55d4a414e7dba3820e99c37100e1b405ffa4c20f
[04/10] arm-bsp/hafnium: TC: update SHA and remove upstreamed patches
        commit: 7ade3a68b2247156d888dd04c925020a08a85243
[05/10] arm-bsp/trusted-firmware-a: TC: Add Trusty SP support
        commit: 559ecba813f898ede2d5114d1bc0885a92b41c67
[06/10] arm-bsp/hafnium: TC: Support for trusty as a secure partition
        commit: 006503d94f56b07aa17afaa0f7edf413ddccc07f
[07/10] arm-bsp/linux: TC: Update backport patches of FFA driver
        commit: 1ce52a31ae3845330d6a72c1be14d5b40336cf7e
[08/10] arm-bsp/linux: TC: Add fixes in FFA driver
        commit: ad88391e957876b84ab0f6f1393c50dd386973a4
[09/10] arm-bsp/linux: TC: Add backport of Trusty driver
        commit: b36889fe71d5b7905a3af5dd945928bcac243d09
[10/10] arm-bsp/linux: TC: Add Trusty FFA adoption patches
        commit: cdb6c65f0ac3089a03561073be404229be3270a9

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

