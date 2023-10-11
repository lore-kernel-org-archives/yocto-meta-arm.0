Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9204CDB47E
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 19:52:13 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.26389.1697053931960503171
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 12:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=qk3F11Cy;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-775810b032aso13450785a.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 11 Oct 2023 12:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1697053931; x=1697658731; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vrU6sHeOuza7skZotxZBsCaXlbUp4z87bLCqGNwFY1U=;
        b=qk3F11CyQM9C4AaAdxSXc6R1RGh6Kpsizg67xlJ+KnIgeVX17tLZOdTGFS3M/nWAUu
         FceAe2Iiwg2I6XaH+SSsZiHH3Tf5VawZ+QOq5I0EYKJP18aL7oZFdvbp86irpXbj1p76
         lp8u3tQWuc51eBfI39bUAUAckGZls6W0O+VRAj2dTgg/8oVR2gCZsuD96mrhraojfOhK
         rDPtUUAqjF8Tl0HTVfXRwZb23TuCH6rHOPXhuFYn3UuV9HylGR6qcAxF+evy/dv5vyi2
         aIa/0/lKkzPu1Wc4hY8N5IfVMKEhgJTwa2kwvOi8JBNx4SLhqSaD0swZkS7DYC7lLxpd
         zGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697053931; x=1697658731;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vrU6sHeOuza7skZotxZBsCaXlbUp4z87bLCqGNwFY1U=;
        b=k7JBv3U97qbeqDaWL+aJJeXKAopSpERrTO3/htKcbacQOy7sqmOJ0PWZOM1x/+m2qB
         YPvW1adJOjTR488GQqz1F8+9kveb712wwYW8od4zwbQChDvtW2zs8wh1Eo3ggj8YjSAo
         t+4REFqHLIuFwKWpSIsN8Y2qo2wFclQxL5qT9+D6qnHQWoU6z6Em651sh6jo+gHItvAT
         NnFF1TsN52zhkqNZE+zhCacb5L8uIu7/6AKrhf0ogpAsATpWkBrBeE4SVA1+pWj0wNx+
         Q5d57ig800h8CtaWx4Z1VwpsgC3RpxOTaaSTHFRrY50YjHWtx62LUC30hkPdwjSU8e/g
         2TOw==
X-Gm-Message-State: AOJu0Yxhmk0OuHSJ+JsjXLfeoBWbUtmmaclCDvDrOIoHXJb38Hz2hlww
	6ca6y6jC0oPr3pvGKLGSdJfxEGnZibr8gnHen3s=
X-Google-Smtp-Source: AGHT+IHUHsMd73xCbOWksrA9b1cnwWv+KDxYpFVbuzu3SsTdehRw0vNtAbFw7yOkAER+yIXQ77pWRA==
X-Received: by 2002:a05:620a:4456:b0:775:8fad:5102 with SMTP id w22-20020a05620a445600b007758fad5102mr28241593qkp.62.1697053930997;
        Wed, 11 Oct 2023 12:52:10 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id g6-20020a37e206000000b00767721aebc0sm5466230qki.32.2023.10.11.12.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 12:52:10 -0700 (PDT)
Date: Wed, 11 Oct 2023 15:52:02 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Ross Burton <Ross.Burton@arm.com>, Jon Mason <Jon.Mason@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH 1/2] arm/boot-wrapper-aarch64: remove recipe
Message-ID: <ZSb84neDYE3BkU3g@kudzu.us>
References: <20231011130203.3871606-1-jon.mason@arm.com>
 <20231011170803.GF2408@denix.org>
 <515F76C4-6343-422A-AAF9-13B90492C599@arm.com>
 <20231011183605.GG2408@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231011183605.GG2408@denix.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 11 Oct 2023 19:52:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5112

On Wed, Oct 11, 2023 at 02:36:05PM -0400, Denys Dmytriyenko wrote:
> On Wed, Oct 11, 2023 at 05:28:29PM +0000, Ross Burton wrote:
> > On 11 Oct 2023, at 18:08, Denys Dmytriyenko via lists.yoctoproject.org <denis=denix.org@lists.yoctoproject.org> wrote:
> > > 
> > > On Wed, Oct 11, 2023 at 08:02:02AM -0500, Jon Mason wrote:
> > >> fvp-baser was the only user of this recipe.  Since that has been
> > >> removed, remove this as well.
> > > 
> > > Is *common* meta-arm layer now being relegated to only serve ARM's own BSP?
> > > 
> > > I don't know what fvp-baser is or was, but I do know that boot-wrapper-aarch64 
> > > is commonly used by other BSPs for early stages of new platform development 
> > > and board bringup, and/or custom bootflows.
> > > 
> > > Removing this crucial common component sends the wrong message…
> > 
> > It’s aim is to be a common source of recipes, certainly.
> > 
> > Can you point us at a BSP layer that uses this recipe?
> 
> Unfortunately, early stages of new platform development and board bringup 
> activities aren't done in the open and are not public. By the time a new 
> platform is made public, it usually has all the other pieces of the boot 
> chain integrated - U-boot/EFI, TF-A, OPTEE, etc.
> 
> Back when I was still with TI we used boot-wrapper-aarch64 to bring up the 
> new K3 family of processors and the first 2 platforms - AM65x (A53) and 
> J721e (A72). Though it was before meta-arm was established, so I maintained 
> own version of the recipe inside internal-only layers.
> 
> A similar situation was with TF-A and OPTEE where BSPs would have own recipes 
> for those components back then. But the only difference is that those would 
> eventually have to become public, and hence we all worked hard to unify those 
> recipes under meta-arm around early 2020. I'd argue same applies to this 
> boot-wrapper-aarch64 recipe, although it's less visible.
> 
> I know it's been added to meta-arm as part of Gem5 and you never heard of 
> anyone else using it, but it is still useful and having a common recipe for 
> it is quite beneficial and probably worth a bit extra maintenance burden...

I/we didn't know of any current users besides fvp-baser, which was
recently removed.  Per your comment, it is (potentially) in use by
many other layers.  So, I think it best we keep it in.

That being said, it would be nice to point to something that is using
it.  This way we know if changes to it break them.  Specifically, when
we update it.  Some time ago, I had a change queued to update it to
the newest version, but I dropped it when I was told internally that
the only known user was going to be removed.  So, I'll resurrect this
change.

Thanks,
Jon

> 
> -- 
> Denys
> 

