Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71332C678DB
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 16:59:46 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.12820.1677949180752002218
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 04 Mar 2023 08:59:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=Izgw1+fE;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id d7so6231161qtr.12
        for <meta-arm@lists.yoctoproject.org>; Sat, 04 Mar 2023 08:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1677949179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0tqaHdo/BGIWIdRh5Ay0pjOS6Kf2y7weUIxIn+YX58=;
        b=Izgw1+fEcb3raruVeBnrDp//UGSlwctYdTy+BL8EZIVPbmOenev3T60+/rnSXLRG16
         cT5YZRgB3YvXeEiOlK5x7ljA/iK2BayErv5GWuLSTexgvvZxUYKJkW9UH+vHSsiq/3x6
         Vc3IFdXw/vzzt+j85V5UEZG/nJ2TRd6BDZiuAAd/92X/2wUAJvKFntEYZKcrqnsWt1Qf
         BS0eZW6IQefj4UhCZzEaKUyd9Ktc/O3vB4824eNmByUhmyJWUeG4Og/wFfEWpBTGl2H3
         d9CdnYEaVm9ycJFwvEitopXb79snSOkIAv5Qr0GTNyRtIxBhs5dVqKdCC3NpDIfoEuCC
         0Wig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0tqaHdo/BGIWIdRh5Ay0pjOS6Kf2y7weUIxIn+YX58=;
        b=XdVBt6D1FHXpC22Qw+zoGJLdghD69yzho4yah03Pny3SQmTnL3XKk0lq3O82ihGPTG
         w6+8r/K3pLLE248vqnh83pN9GAnnQvG3q9yKgN60RWcSm2/d84ILXy8ekFqfPgsPgjTw
         0JViyCHuuD36Orsn91b8xJ6V3xg+npgtgo62Kg8xKsR+BFU7dJY1PTtevp6NxpEEJizq
         kg1cjEne+047n7vA9G3VzQx4C3TZFX2mA3zxTq9U8Ue+Dqkv+kehOH0oN9axDYKsfo8+
         JzeFuP5uCyAZ27XuztFQg9D/lVC9RuD4zrBvIERE+00zIJ0VAY3cXcYpmPFu2+J9qVRA
         5G1g==
X-Gm-Message-State: AO0yUKWs4e8tvxUeIiYTGNr2zCS+cSFLJB7cMUkY51zr/3PQ0bYAO3hg
	i1h4w1rkxH004ppsS4xa4REVzf6E2Ar3ekjsccQ=
X-Google-Smtp-Source: AK7set+RfdsMPQiyVau+INALm5GYcz9PAfv1ebTiKpGf42In8sS7U6xKC951RTdk+nXlEYO21twYSg==
X-Received: by 2002:a05:622a:174b:b0:3bf:d9d2:4866 with SMTP id l11-20020a05622a174b00b003bfd9d24866mr7166698qtk.24.1677949179343;
        Sat, 04 Mar 2023 08:59:39 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id j63-20020a37b942000000b0073b3316bbd0sm4076122qkf.29.2023.03.04.08.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 08:59:38 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"gowtham.sureshkumar@arm.com" <gowtham.sureshkumar@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/3] Add UEFI capsule generation support
Date: Sat,  4 Mar 2023 11:59:09 -0500
Message-Id: <167794915041.51440.14510661131019350803.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230127192122.19338-1-gowtham.sureshkumar@arm.com>
References: <20230127192122.19338-1-gowtham.sureshkumar@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 04 Mar 2023 16:59:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4471

On Fri, 27 Jan 2023 19:21:19 +0000, gowtham.sureshkumar@arm.com wrote:
> The following patches adds a class for UEFI capsule generation,
> a recipe for installing edk2 base tools in the sysroot and
> configures the corstone1000 recipe to build a UEFI capsule.
> 
> 
> Gowtham Suresh Kumar (3):
>   arm/edk2-basetools: Add edk2 base tool native recipe
>   arm-bsp/uefi_capsule: Add UEFI capsule generation class
>   arm-bsp/corstone1000-image: Generate UEFI capsule for corstone1000
>     platform
> 
> [...]

Applied, thanks!

[1/3] arm/edk2-basetools: Add edk2 base tool native recipe
      commit: ccf216ce4d5e149d907ab2777b2b39d71b90bd53
[2/3] arm-bsp/uefi_capsule: Add UEFI capsule generation class
      commit: 7a1649137389bff0ad1a4825a2dc148290437a3b
[3/3] arm-bsp/corstone1000-image: Generate UEFI capsule for corstone1000 platform
      commit: 2792359e0a6d2663b0d8b523e2290b14029cc4fb

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

