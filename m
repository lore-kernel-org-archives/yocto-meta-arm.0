Return-Path: <maciek@thing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A48C00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 18:03:24 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web08.128.1659117795600509959
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Jul 2022 11:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thing-com.20210112.gappssmtp.com header.s=20210112
 header.b=1PiiK7uy;
 spf=pass (domain: thing.com, ip: 209.85.219.170, mailfrom: maciek@thing.com)
Received: by mail-yb1-f170.google.com with SMTP id c131so9461974ybf.9
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Jul 2022 11:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thing-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TO7WFx4iYwGZ+jKtQBEB8wHK+ssfuu6jChIMkWG42yg=;
        b=1PiiK7uyTOo1EUEmFTm++nDjyzFIk72y8LK7z1+yN9xgZ7U3TzQCT5KVgM5T943Ie/
         vtXf/65yw0JJH5XTAKqypf1/ULJniW+Q89IqCB154JJuCdedGpsdNdjHBNeOR/tH0jwT
         HIOGb/1R9/WNB7t8ji7dh0JHxPd88WnMJJJBfgjvOACh6SzzUyj4NzkjyXr4bUC1ejNN
         dqUaHT7kIZ5clT//o2ea/W+ij8+I83r1gi0kVfipXupTbSN/3niIJGclNR0eZbm7rwim
         UgKfrSoA9TwEz4uxJ/8tPJtuW7D1vm9c0hK4DZjp9dLtJ1DFL0qG6fVgjKS+WpiSbCDj
         Ywag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TO7WFx4iYwGZ+jKtQBEB8wHK+ssfuu6jChIMkWG42yg=;
        b=xkgDSGMoWHd59X/mI4Or+hvvEwJX4fAUVC6vS2HLBpS/5OuyoT4/Iq8p5nDttm+3wa
         ySlnqbrNoL5hYGteyC5KCNiTbywU556d6Y+3clMZGLmt+bmvmF3xIX41uakyqWSvsCRR
         GSZRmckH6GRP9/f05lN5vVe6stWvMxzclF4wT0jRdQt1UwfDiXQTV/Dkde6mxA4409zL
         fayXQ59BD9+4f1LtRKDu6SGPlEZF/ntr/C9xukwF0S+Fnyf1mjZciErpJ3+JJ6/ZLTmP
         cMkvKN/Y8HH9/NXCer6nIV+RKcJNtBRvtKsf7a/HTLEZcG5Amj1RaFXeJIUFmTK3CgL2
         wKfg==
X-Gm-Message-State: ACgBeo1CAx7fNVXuP/4iDxbI4UKTumiUyAdh1a1MwkwrH9LrTE87+TNf
	2ZAxhQlSSA6fapsPWvj0NHO99Hl8TNVIH2e1OIfP7Q==
X-Google-Smtp-Source: 
 AA6agR5DfJ1rngcS3v9CSYS0T5FML7L4jJ/tsPEpPgmDiCheAp74w5+CAU5fJi0nkeuyY2DtEPh6qSv2VTAAmhowMMg=
X-Received: by 2002:a5b:24a:0:b0:66f:939c:a643 with SMTP id
 g10-20020a5b024a000000b0066f939ca643mr3534642ybp.415.1659117794715; Fri, 29
 Jul 2022 11:03:14 -0700 (PDT)
MIME-Version: 1.0
References: 
 <0a972044b11f7e469f122f3dc7b6778145b60133.1659090751.git.maciek@thing.com>
 <YuQeY0ZhY7c7eG7A@kudzu.us>
In-Reply-To: <YuQeY0ZhY7c7eG7A@kudzu.us>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciek@thing.com>
Date: Fri, 29 Jul 2022 20:03:03 +0200
Message-ID: 
 <CAJgHQz0y2KwQH-NFc=C=LkAbcKYZxaDd-bLoN9y2kW7o4eMfeQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm/edk2-firmware: cherry pick gcc 12.x compatibility
 patches
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, Ross Burton <Ross.Burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Jul 2022 18:03:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3615

On Fri, Jul 29, 2022 at 7:52 PM Jon Mason <jdmason@kudzu.us> wrote:
>
> On Fri, Jul 29, 2022 at 12:34:46PM +0200, Maciej Borzecki wrote:
> > Cherry pick gcc 12.x compatibility patches from the upstream.
> >
> > Signed-off-by: Maciej Borzecki <maciek@thing.com>
> > ---
> >  meta-arm/recipes-bsp/uefi/edk2-firmware.inc   |  3 ++
> >  ...001-Basetools-turn-off-gcc12-warning.patch | 39 +++++++++++++++
> >  .../0002-BaseTools-fix-gcc12-warning.patch    | 49 +++++++++++++++++++
> >  .../0003-BaseTools-fix-gcc12-warning.patch    | 47 ++++++++++++++++++
> >  4 files changed, 138 insertions(+)
> >  create mode 100644 meta-arm/recipes-bsp/uefi/files/0001-Basetools-turn-off-gcc12-warning.patch
> >  create mode 100644 meta-arm/recipes-bsp/uefi/files/0002-BaseTools-fix-gcc12-warning.patch
> >  create mode 100644 meta-arm/recipes-bsp/uefi/files/0003-BaseTools-fix-gcc12-warning.patch
> >
> > diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> > index e0dfa28b22fca06807cbdc5034618ede3c53a8f2..2219cae76ee79ee23b75b225dd489413f03ed224 100644
> > --- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> > +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> > @@ -19,6 +19,9 @@ SRC_URI = "\
> >      ${EDK2_PLATFORMS_SRC_URI};name=edk2-platforms;destsuffix=edk2/edk2-platforms;nobranch=1 \
> >      file://unaligned.patch \
> >      file://default.patch;patchdir=edk2-platforms \
> > +    file://0001-Basetools-turn-off-gcc12-warning.patch \
> > +    file://0002-BaseTools-fix-gcc12-warning.patch \
> > +    file://0003-BaseTools-fix-gcc12-warning.patch \
>
> All 3 of these patches are in the version of edk2 that the master
> branch is using.  Was your intention to send these for the kirkstone
> branch?  If so, it does not apply cleanly.
>

Yes, sorry for the confusion. My brain is already fried waiting for
the weekend. Let me resend this for kirkstone.

Thanks,
--
Maciej

