Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 105F7C433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 14:48:55 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web12.21.1651589327806315480
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 May 2022 07:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B96ikMMd;
 spf=pass (domain: gmail.com, ip: 209.85.160.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id hh4so13577974qtb.10
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 May 2022 07:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UNikiDx0bE6hy7SM1XYfbGHhmyM0P5MvwPH1L3jGVmQ=;
        b=B96ikMMdUN8PdeZyZIWqBUCeyExNmg3WLj0CPX5SHizXtOlTv+NiPtm3n+UmjBPkGX
         iQUrrj355Nia3FcRuvPebR+yXRTEhDSIMihou67aWjlm8ve0Q29GbjVtyGZLZqfS4myt
         icRU3FlItE8mxeiSwR99yKVJkM7/xd8A8bL/TOBaBnXIGf8pV0jeTc+oDgjVb3gIEavH
         z2zzAtsAbFcnxkD6JFbCZxxuRVkOTOoxA/4vnDdNL+BNhki5Z12Tyajow+YcC9fs9IvB
         fA2pdVXD+EQh4nJjI0Ne02ZWikq+ugZSgN6XLIH8cr0kJ73Mv6FMBDspe9TWafVDGFUe
         1S4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UNikiDx0bE6hy7SM1XYfbGHhmyM0P5MvwPH1L3jGVmQ=;
        b=2u7kwzq0CIlzb/uxb8rxhn7r0lQBUEe1bJ1Q26jjPIyE+67ETwl0M9o7DdqT+P7l13
         u5DARD/I62appBZfzaO2Gnx+/QT6SCp1dS1pg8PMqmwewSbi7A9jGSweaNJE57AaPs6M
         JR97gKZi0RUwWNV2B/oqlSrrZVaOLWV6kWptGSAFzTunV11FF1PEVdP4RlnqOufwUxBk
         1vLQJajrycuWxXBWgCTCT+HuaDaUTBA5WWjDR4xSASqdrcjtLDgBDsM5xxir87YCtD86
         N7ohOh4iaFTR2jTACWm6hwi+6kkdFu0F/1I0tld/gdDoRngpBNVyAHNdQg5+rSeXHg4G
         obJg==
X-Gm-Message-State: AOAM530n2Jgx1ayo6g9rC7zZ97ClJtlC0+ji/YlvoLdTG3J+DvZQyf9Z
	UKpztbn1GsSOt2Bg7bse56fgg2fzktbPiGoVAsc=
X-Google-Smtp-Source: 
 ABdhPJwVt23ORKkuRVkkOz4kBjJLcO0kAocErQMdwhpXQNAZH9XS/QfMr4xE2tMilnHpP+sI1NOMYbkN9B4ga0LBjdQ=
X-Received: by 2002:ac8:7f86:0:b0:2f3:953f:6036 with SMTP id
 z6-20020ac87f86000000b002f3953f6036mr14972157qtj.330.1651589326916; Tue, 03
 May 2022 07:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220501184731.3730441-1-raj.khem@gmail.com>
 <YnEo7I/HCeTzmtBY@kudzu.us>
In-Reply-To: <YnEo7I/HCeTzmtBY@kudzu.us>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 May 2022 07:48:20 -0700
Message-ID: 
 <CAMKF1sqk4PSVJJsc-5d=Csf+fPNHjh=k+8ZDw0OzmHHkPiXOaA@mail.gmail.com>
Subject: Re: [PATCH] ffa-debugfs-mod: Do not build for TI SOCs
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 03 May 2022 14:48:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3339

On Tue, May 3, 2022 at 6:06 AM Jon Mason <jdmason@kudzu.us> wrote:
>
> On Sun, May 01, 2022 at 11:47:31AM -0700, Khem Raj wrote:
> > The module can not be compiled without patching kernel 5.10
> > This helps meta-ti to live in multi-BSP envs
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
> > index 4051c34..a4dd38c 100644
> > --- a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
> > +++ b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
> > @@ -27,6 +27,7 @@ do_install:append() {
> >  }
> >
> >  COMPATIBLE_HOST = "(arm|aarch64).*-linux"
> > +COMPATIBLE_HOST:ti-soc = "null"
>
> Shouldn't this live in meta-ti?

yeah perhaps better there.

>
> >
> >  # Kernel modules currently RDEPEND on the kernel, which is troublesome when you want to put a
> >  # kernel module into a initramfs without pulling the kernel into the initramfs, which would be
> > --
> > 2.36.0
> >
> >

