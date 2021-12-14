Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30889C433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 04:35:51 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.21807.1639456549920244701
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 20:35:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=MDJGFOWT;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id 132so15821024qkj.11
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 20:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dPz0qYRKZ45w/wIVQ+GNbkS2tHeMCQiP/xZRjYYYsCA=;
        b=MDJGFOWTHnXGZEA0LfCgLLKvWIlcg8xQPnHb/wjkeJhklOfgkgCjHdo3wfJDx5t1t1
         EFn79luAQ7Jj26qW5OQdma49HjsjvHeS7uYaGCMIer4CYhQ0zDA8WF2lvOab+gkjBX9G
         vQj62SWSmKEA8/yOW/N+J+Q+Fj2WeYh0VBifOveA8WioJWXJFoi4BvLSh/DvmgqZKjI0
         ZrNyIm8al7KWxfY8XcidlIORIB5AZUCdIoLWe3JyuLL8/Ttg/byTR9roDVIXx6EOHnKP
         mMKDJsFN0DRZ9CBnHh/wSLjM9os7gUSvingbB8Cln4Kk+b3SQASdBY0c6dpCqpEDmbey
         gI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dPz0qYRKZ45w/wIVQ+GNbkS2tHeMCQiP/xZRjYYYsCA=;
        b=kiqg52XUvnv1rrYlT2EH5AErltdhX91Ihz+791EqoZJ68SwSjLUE+2NUlZD6abV9CH
         Z9DO6f5M3OJbcvT03PsAlLY4GSXXYHlZfxpv2aYKIKRba0xecCfC2asIk+rYL+kKBIls
         fexJQOtJUrwEDVaXn3HoYM1I+7h21NH5FTmvxBVqAUADwByQwkV/9sruFyZFCFvCsqdA
         PiNvRyz6x/AYwrN5/f/E/SGDkkFleD2Haedm4j3gBKpo/CCDJYMLru9heQdxME5ZF8/G
         p+YMCKLbGxhy0nyIutrOzLzKFkB2730ZmJNbbfPvwUmY1yCKRQ5HL8+KOeLg8n9KzafI
         Q4Tg==
X-Gm-Message-State: AOAM531wPCQqzOzoyY1ViEpK00K8y0HLOay6+mmxz1cGfoiFqdAxWWug
	RkCD3Cwt38KGk9wGfHgTdkFOpTkbi+wO5s1N
X-Google-Smtp-Source: 
 ABdhPJwoeVZduIGDzlObNgKK+UWKwWPBUPfo4DOB7gBuCQ839zA4QNoBnxQPuOYoM8QyQyTRSlBanw==
X-Received: by 2002:a05:620a:123a:: with SMTP id
 v26mr2222578qkj.431.1639456548916;
        Mon, 13 Dec 2021 20:35:48 -0800 (PST)
Received: from localhost ([2605:a601:a628:a600:d1ff:1ef4:15c8:ccc1])
        by smtp.gmail.com with ESMTPSA id
 f8sm11151843qtk.1.2021.12.13.20.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 20:35:48 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	abdellatif.elkhlifi@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/4] corstone1000: out-of-tree u-boot patches
Date: Mon, 13 Dec 2021 23:33:36 -0500
Message-Id: <163945641994.7376.4840434260794617777.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211213132227.5490-1-abdellatif.elkhlifi@arm.com>
References: <20211213132227.5490-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Dec 2021 04:35:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2672

On Mon, 13 Dec 2021 13:22:23 +0000, abdellatif.elkhlifi@arm.com wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> Platform specific patches for Corstone1000.
> 
> Abdellatif El Khlifi (2):
>   arm-bsp/u-boot: corstone1000: arm_ffa: removing the cast when using
>     binary OR on FIELD_PREP macros
>   arm-bsp/u-boot: corstone1000: add the header file for
>     invalidate_dcache_all function
> 
> [...]

Applied, thanks!

[1/2] arm/sbsa-acs: reset PACKAGE_ARCH
      (no commit info)
[2/2] arm/sbsa-acs: upgrade to 3.1
      (no commit info)
[3/4] arm-bsp/u-boot: corstone1000: arm_ffa: removing the cast when using binary OR on FIELD_PREP macros
      commit: aaad1117abd3b5d073837477e208a53da5e1eab1
[4/4] arm-bsp/u-boot: corstone1000: add the header file for invalidate_dcache_all function
      commit: d206e22c088c160a95e62d94a65690bb6e118081

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

