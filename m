Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1106EC433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 15:32:15 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web08.93364.1638372733607826188
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 07:32:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n0D8B6Ys;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id b11so21991215qvm.7
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 07:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A/5kOLXs6mNC7WYH+h151ICLvvP9OfSYJ6se1Djpbhg=;
        b=n0D8B6Ys/7jhrEK+agWft+6Sx6foHYddWQhYMB0MzO78ID0+ETX6ss1p5bxACYcVQL
         +eAMI3Obc56xoEbMUabyNW9kefRRBWTh1bRioJHdlvW7YcEPe0ClMRMHW7Jc1lkRn4wY
         XJEDz3pXD6bq1hjkD4ceUJB5oyLSviDIQIID2FO0llKoB+NQv42vsF11s6uXMxYr4ATW
         Sj8aL3fdix4HwJbKDw5VRXWlIAhSQhsaX8zcFphRufhW6iozPd/a3EljHlRCR8BeMQvz
         HTQv0CbVJMfOjd3Loj9IAS4itBNOImiCai/5uHq5KMH9uH1QVAHWyyOpQjj5u+uowxQ6
         K0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A/5kOLXs6mNC7WYH+h151ICLvvP9OfSYJ6se1Djpbhg=;
        b=pQp4jqP/71zpqNiUjTccxcEM79kWjcg/bEHB9B7JCCMTdUvAAsqOWfXGgDHdJwc/0F
         mAk6oJx0HE1lNfA08fi1XvsghxOTdGBJSYrj/QDLnIxeLWqdyQqrWkfqzMcEyfvoz2yq
         pgrbLNS8V9itB1MfprqJ3TVIxs+6z+TzZKaoCUzdvBkRqI688YZ1T/YA+Gdn2XtaoIUQ
         h0Mt2IPTMMfECVYJ795oH2FJC8lNUWN7MOFpdM8fyE/Lv5ROR1CWWT5Z1XHCVIa5T4a9
         WKA4y1X9Tpe2nZsT4jrTrLcLZAr+wcMwGMtsoUI9L3eDOO8I5M/+8mLSv6d7DutN1+6l
         tSwg==
X-Gm-Message-State: AOAM532QnjLWNdi+j8kud921ADC1aJkQhKGi/13FscX+F19scY7Nr81o
	SwogU59GCRgLbFy3Y/r/YB0Ay3RAblB7YDkYcjaC29yuD/s=
X-Google-Smtp-Source: 
 ABdhPJxp/aphiIvByWN/2SbhhmcHFJRMjkBCm3k6u7OWo115aB8vD0XMDEj5ydrIQ939M5jn75GiFu+hIaxLeQWEU0g=
X-Received: by 2002:a05:6214:2623:: with SMTP id
 gv3mr7262492qvb.63.1638372732595;
 Wed, 01 Dec 2021 07:32:12 -0800 (PST)
MIME-Version: 1.0
References: <20211201024555.1102657-1-raj.khem@gmail.com>
 <CAAnfSTtFMaWHesACnK2g2BuY123qhci3J-Sxjx0B72jL5CakYQ@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTtFMaWHesACnK2g2BuY123qhci3J-Sxjx0B72jL5CakYQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Dec 2021 07:31:46 -0800
Message-ID: 
 <CAMKF1spkLNRnjBab-9jzfi5F0bj=TT8861QSKmmuXtSE=hLDiA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/2] edk2-firmware: Use --platform option only
 when EDK2_PLATFORM_DSC is set
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 Dec 2021 15:32:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2508

On Wed, Dec 1, 2021 at 2:37 AM Ross Burton <ross@burtonini.com> wrote:
>
> My understanding is that --platform is pretty much mandatory.  The
> recipe shouldn't be built if those are unset, so I'll add blanket
> COMPATIBLE_MACHINES to the base recipe instead.
>

thats fine too, as long as its build for machines it should be built for.
> Ross
>
> On Wed, 1 Dec 2021 at 02:45, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > This ensures that --platform is not left dangling for platforms which do
> > not set EDK2_PLATFORM_DSC
> >
> > Fixes build errors like
> > build.exe: error: --platform option requires 1 argument
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-arm/recipes-bsp/uefi/edk2-firmware.inc | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> > index 66e0cc3..0a1275e 100644
> > --- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> > +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> > @@ -29,8 +29,8 @@ EDK2_PLATFORM_DSC  = ""
> >  EDK2_BIN_NAME      = ""
> >  # build --arch
> >  EDK2_ARCH          = ""
> > -# Extra arguments passed to build
> > -EDK2_EXTRA_BUILD   = ""
> > +# Extra arguments passed to build. Pass --platform if it is set
> > +EDK2_EXTRA_BUILD:append   = "${@' --platform ${EDK2_PLATFORM_DSC}' if '${EDK2_PLATFORM_DSC}' else ''}"
> >
> >  # build --buildtarget
> >  EDK2_BUILD_MODE ?= "${@bb.utils.contains('EDK2_BUILD_RELEASE', '1', 'RELEASE', 'DEBUG', d)}"
> > @@ -84,7 +84,6 @@ do_compile() {
> >         --arch "${EDK2_ARCH}" \
> >         --buildtarget ${EDK2_BUILD_MODE} \
> >         --tagname ${EDK_COMPILER} \
> > -       --platform ${EDK2_PLATFORM_DSC} \
> >         ${EDK2_EXTRA_BUILD}
> >  }
> >
> > --
> > 2.34.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#2495): https://lists.yoctoproject.org/g/meta-arm/message/2495
> > Mute This Topic: https://lists.yoctoproject.org/mt/87419544/1676615
> > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ross@burtonini.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

