Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC61FC7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 12:54:16 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.6510.1750251253618632668
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 05:54:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=soH1We0l;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.54, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2eb6c422828so456889fac.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 18 Jun 2025 05:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1750251252; x=1750856052; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+sfJpDN6Gj1O6sJA0BUUHR/4L0bPutQOo8GvvcrWF0I=;
        b=soH1We0lEuAC1zpiPNmKgbETcuBWUQ1rKw9BmXNFgmChDrZfsMQxc89VTwp8xoddr/
         aGJCe9OOfog7ZH+nwOQwWigUx+BiZpDNbztAWkt+JOBpLn7uYeShfJAISLOKoB001TQP
         zuRiBgg8vEAvpvBosZwHOQ9T+s4ScMcCNe0qAGsdQvqrDwNN8yYjWn6gyrYPDuBNq+7k
         ZkYk/rssYkKKKjja7/j9uAQJCxKYfBbFhGtcyR7/oA5XIURgoMS78N6l3gXP1bBBH0G9
         PDclTNjTfANBwgMXpEqLt/WzbcRDdHvvlXcgW2VY/+z8HuYF1GOYfqxx+qJGK90XW+57
         JHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251252; x=1750856052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+sfJpDN6Gj1O6sJA0BUUHR/4L0bPutQOo8GvvcrWF0I=;
        b=kn1HQM8X5xxvtKmbAskk4rEk7IX1xDH4pwxQWBQTFMnNIzoAZELylFWtEgmjJxmy5V
         O/SHx8o2MjdiveG4W4h0qmJrzaosasIYR/fp7tzo9wp2zEESMqFp+xvlHPSjQ5pMKIGJ
         gwAAqhmOljUpeUUAuNxthhL+NRuIN8wvJ4NUhUo3zUXcmmN4rScyrki0PV4k1Xq2Aat7
         rvEbGkzyuqkjNnV4Rv6HY4K3OtvlAB2glANMx78sYWdQH8csAhxv1AMG5Hs7u4uwz0in
         f2sSc1d5KxjI5a/Fx7iR6dU7BvwQc83xBL5dFFhMivP27kQyI04QPFf35CFzw/LWrv56
         SX5Q==
X-Gm-Message-State: AOJu0YxX9coFOMlt9FkvWtmpQYKXm3xt57drQCVKIXEVKXuB+MyOBxEl
	8cHm/rfmkV3BBozjp9AyBTOMZOq/K67aXINuE8iF+P39FCI3FbY7nIjnTmrEv7MpXUnNdFczuCM
	eVcuOy5v1KjJpGJQ+K+2QWsq6zviEZJhYFKeKIdfp
X-Gm-Gg: ASbGnct2j2un2LNbiDslbK0KY+iOOFzFGkHIp4XbawwPwEbjA6j323dsPNfoQdzKh7i
	u0GINTQgaCASqxVjYP5rAKgXBkyoCZYX+MF59KI5kyVbnS0RtPskoL4tcrL1F93+2aGZwv6FMvz
	hHqZ8JMuo6EqsWiW0V+2Tj+7XOU/51+jO60zEp8AuhTcs=
X-Google-Smtp-Source: AGHT+IHmpqLa+DzKJlwr2iv8NQSU37DrJXdqyyqSyGerL2G50DLGDoo9VZuuH/zB7w1JQEIJlbuOXBgU90tJdmYQT30=
X-Received: by 2002:a05:6870:c89:b0:2c1:4d18:383a with SMTP id
 586e51a60fabf-2eb882999f1mr1382440fac.3.1750251252512; Wed, 18 Jun 2025
 05:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <339cab03-66a4-2b93-2964-6eee4eb057bc@crashcourse.ca>
 <CAPoiz9xd+n0on5FfkquhMLvU+LfDEr3p+T2YVCKgrPFEp1_TSQ@mail.gmail.com> <0f756c1f-1277-ce79-310c-82f013718128@crashcourse.ca>
In-Reply-To: <0f756c1f-1277-ce79-310c-82f013718128@crashcourse.ca>
From: Jon Mason <jdmason@kudzu.us>
Date: Wed, 18 Jun 2025 08:54:01 -0400
X-Gm-Features: AX0GCFsCrfC1yUTNUZmB1ULYLUWdbHgq12Qoir1hit08lucX5uK1yu_87TLiqys
Message-ID: <CAPoiz9y+DE7ij-tMH--9zRzz++JQR5xdLYQ8Xt77EEpN7C52YQ@mail.gmail.com>
Subject: Re: [meta-arm] if this meta-arm .inc file missing a trailing colon?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Jun 2025 12:54:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6571

On Wed, Jun 18, 2025 at 8:41=E2=80=AFAM Robert P. J. Day <rpjday@crashcours=
e.ca> wrote:
>
> On Wed, 18 Jun 2025, Jon Mason wrote:
>
> > On Wed, Jun 18, 2025 at 6:07=E2=80=AFAM Robert P. J. Day via
> > lists.yoctoproject.org <rpjday=3Dcrashcourse.ca@lists.yoctoproject.org>
> > wrote:
> > >
> > >
> > > here:
> > >
> > > https://git.yoctoproject.org/meta-arm/tree/meta-arm-bsp/recipes-bsp/t=
rusted-firmware-a/trusted-firmware-a-fvp-base.inc#n7
> > >
> > > should there not be a trailing ":" at the end of that prepend
> > > operation?
> >
> > I think you are correct, and a quick grep shows 10 other instances of
> > this in meta-arm.  Thanks for the heads up.
> >
> > I wonder if there is a way to add a check for prepend and
> > FILESEXTRAPATHS in the sanity checkers.
>
>   i'm not sure where you counted 10 other instances but i did notice
> the following, which confused me briefly: this appears to be an
> example that is missing the trailing colon:
>
>   meta-arm/recipes-kernel/linux/arm-ffa-transport.inc:
>     FILESEXTRAPATHS:prepend :=3D "${ARMFILESPATHS}"
>
> except that the variable ARMFILESPATHS is defined to (you guessed it)
> have a trailing colon.
>
>   aaarrrggghhh.
>
> i hate that sort of thing.

Yes, this is what bit me.  I need another cup of coffee.  Thanks.
I'll credit you in the committ.

>
> rday

