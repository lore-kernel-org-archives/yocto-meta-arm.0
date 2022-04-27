Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D82DC433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 23:48:51 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web09.3917.1651103327485115498
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 16:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=cI6u0EFd;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id b17so2156568qvf.12
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 16:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GhDfqMyzeB2/MCUW2jEnWRvS0n3oGVn7rm8CjX1eMuw=;
        b=cI6u0EFdoitc97khDaEUzK4L2StjWe6/bGb+vFgZfguBdjDdebCQfIGVxG814FVz8J
         eJjyVuc/uvZMoAN8jQwNYnR6nE+TQGZ6Hw43RfkVAKiyo1ALE9Nov3LkYT+D3gobD99e
         ryvm7lT4qOf7omx4m7SV5atBtSVD6EeNVzBqGR2VBLoKR1VWFklLUfGnjEKDBILFGMCy
         pEwhlLRTPRbYnJ57/F6umRyVuqLnLbUy6Jnkx2AVpWu8G29QFfDA2Ztr/b1L+2CH9145
         eBkL0cIznlMHyWiEIPOR4kfvz/1SGO/M0xzCNSSuPI7epcfaYp9y5yo1Q/yGZJtLPs9K
         xrLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GhDfqMyzeB2/MCUW2jEnWRvS0n3oGVn7rm8CjX1eMuw=;
        b=dZifzBa3hVjeG1v1PGvERogQYD1jBfZrx2OxFQZr3IIM+DO7y5MQ7NzbxK2YY+Pubv
         yPUxUjpMyXBZS98BLXrTsUgIv+L9p08Cn13DcmP9WgkgGbfLbbhSg7tetLahWKTuQiiK
         cy/ZmsNm6tG78g4k0CUF6RYkJ66bjz8qJ8fCWkEQO7if3ic7mCP2+7ul/8C1Rc3R8SWD
         u55u7kNbnGnPyYQyDlZKB8roMG+X4BcgNp0erjZM/MohpTDb/+T/SK2+3dhQGB+v+hu/
         l6G1ToM8I/yTlML3dau2BMXDt4wPXX+WhxZkhyS2RHjp/PrMbeiDYixOuVMn/Zs/7n9q
         Fu4Q==
X-Gm-Message-State: AOAM531Y+moov7wljskjN7o5sDnhHqGOmdi9UzMs7YLeRxUyMmJhxhon
	BZDFj4KEkikfUhh+d0cmTCCcyLKrp9Zrdg==
X-Google-Smtp-Source: 
 ABdhPJy+yMK6LPqnGOQtg5kDtI9IJwnWcLLYOMIioRXCp27D5zbqwvGGNmDJAdmWCx83jiSWYSpriA==
X-Received: by 2002:a05:6214:4006:b0:432:ea2b:5aad with SMTP id
 kd6-20020a056214400600b00432ea2b5aadmr22152829qvb.39.1651103326564;
        Wed, 27 Apr 2022 16:48:46 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 b129-20020a376787000000b0069f66fd4a4asm4673989qkc.133.2022.04.27.16.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 16:48:46 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] arm-bsp/juno: use virtual/bootloader for u-boot/edk2
Date: Wed, 27 Apr 2022 19:48:35 -0400
Message-Id: <165110331935.2615227.11782036100097680094.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220422151326.23359-1-jon.mason@arm.com>
References: <20220422151326.23359-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Apr 2022 23:48:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3317

On Fri, 22 Apr 2022 11:13:24 -0400, Jon Mason wrote:
> To setup juno to use either u-boot or edk2 in CI, abstract out the
> relevant parts and setup the parts to allow for it to be done
> dynamically.

Applied, thanks!

[1/3] arm-bsp/juno: use virtual/bootloader for u-boot/edk2
      commit: 2b6e3fc1d160566d31e1dad4630da0b8ce5686ed
[2/3] arm/edk2-firmware: add PROVIDES virtual/bootloader
      commit: b37441921d732a707181619f6dfc40f602a77081
[3/3] CI: add testing for edk2
      commit: 9f0c90506661b34d5546f5f9ae9a43f07ed78ee9

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

