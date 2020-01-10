Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web09.13249.1578675913520252080
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Jan 2020 09:05:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=JWLchIS/;
 spf=pass (domain: linaro.org, ip: 209.85.208.176, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-lj1-f176.google.com with SMTP id a13so2836816ljm.10
        for <meta-arm@lists.yoctoproject.org>; Fri, 10 Jan 2020 09:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yczZJ+axx5k6Dx6ICZsd0TSY0ExA97zxwGo46Sc5rIg=;
        b=JWLchIS/L3eqVvkjJu+IbcSpsp/xZY1FVJ66wkAwwZaMxqgc+PZUKCyozPtahZa/Vy
         Z13osr6y/v0PINMx6e1JWuc+HiYTGg6BNORlmFwFQGsuC6hx3sV3HQ4aUKTHmrI767N+
         yHVlR/ZEfy4LDi4W73/05uzCCp/rgvC4k5GjOAYvo3YjhD7RcPcyWDp/lxtkj7pFA3xf
         E/LOhLm9x2IRkvJ7F/9oZckutrzaSg3qqSiCJY2E20LiedTN1Pko9EV/aIdfgWz8fZYy
         4O7TbvtdBtZ0+G4px0Ml1BiCFpGw3XGF+HPUg0qYYR/deU5f+JaBhCK61KBO0ozrohYp
         6lEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yczZJ+axx5k6Dx6ICZsd0TSY0ExA97zxwGo46Sc5rIg=;
        b=A43ebvKy0ryhMoHSRLfNlChVxiI+yMq71vsc+Jz4k3C2xo9d8kuy65WWlv0B0CUIxY
         aHEoQ+y4YU9D9DlTNigsqHQDTPzcCpSB1ayW56AoPoQJGbat/U7pWsNAgqry6XI77fhE
         up0vsGO4UT3y+HtGj4v3udlG3zaAzqUA/6qNAXpOTnyLWhPm1Kr2NjoLQyuTkmxnepjH
         IgW1pEyNthvcD/k9mtWES0xGwaFxWaR5RVCOPydjDK0DDDj4MH4c2Ag0BjOt7p19pxWu
         mObUZQABg8ldM//cIf8gj+JbPc8yBEunwQ+3p2+wR8JH5WJqQ52uJmbWHmq9l48bMlyq
         0Vdg==
X-Gm-Message-State: APjAAAUo6S1gg5DRDOXB94sp3F7jt4igkrurn1TQyweK4/6HUdn9EYVz
	ai8TOmeqYsow3KYZDV5k1FXjt1Hc3/RVfQ3q7zuyQA==
X-Google-Smtp-Source: APXvYqz3ktxIOWnZ+vArHixpQvuHHyfnP93gRbDS3/cVLBan09Jraqohu02ApIEoBnQclrNKQldHqRyEknotgy5lxHE=
X-Received: by 2002:a2e:b5ac:: with SMTP id f12mr3438337ljn.0.1578675911599;
 Fri, 10 Jan 2020 09:05:11 -0800 (PST)
MIME-Version: 1.0
References: <f328d6db-3432-7b9b-2981-3bb18aa0b857@arm.com> <CAP71Wjwxwxxzxn=4ErvE7C4mPa+UnhQQH_b+-13QLDxsTp4Lkg@mail.gmail.com>
 <CAMKF1sqDm=6b_DDGLFRDkc96jS1tokbGN=az2svQmnfd7+t1gA@mail.gmail.com>
In-Reply-To: <CAMKF1sqDm=6b_DDGLFRDkc96jS1tokbGN=az2svQmnfd7+t1gA@mail.gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 10 Jan 2020 18:05:00 +0100
Message-ID: <CAP71WjwiAViFWPC4cRvsCuFjfAVU5Lvn58c3i=zu9UVV9cSAPg@mail.gmail.com>
Subject: Re: [meta-arm] meta-arm layer update
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org, Peter Griffin <peter.griffin@linaro.org>, 
	Fathi Boudra <fathi.boudra@linaro.org>, Vishal Bhoj <vishal.bhoj@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

khem,

On Fri, Jan 10, 2020 at 5:41 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi Nico and Jon
>
> I think the current layer is a jumbo layer and it has
>
> - A machine layer
> - A Distro layer
> - A Generic recipes layer

meta-arm (the top level) is a layer collection. is that what you are
complaining about? e.g. would you rather have each individual layer in
their own tree? During initial review I insisted on having multiple
layers for each purpose, for sure.. but I thought having a layer
collection would still be ok.

>
> I think mixing this way it going to be not crisp. Perhaps, iota can
> use poky-tiny
>
> Thanks
> -Khem
> On Fri, Jan 10, 2020 at 12:33 AM Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
> >
> > hi Jon!
> >
> > On Tue, Jan 7, 2020 at 11:35 PM Jon Mason <jon.mason@arm.com> wrote:
> > >
> > > The meta-arm layer is now publicly available at
> > > https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/
> > >
> > > It is still under active development, and I encourage everyone who w=
ould
> > > like to contribute to read
> > > https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/README.md
> >
> > many thanks for starting this effort!
> >
> > Some initial comments/thoughts:
> >
> > 1. We are interested in moving the OP-TEE recipes that we've
> > maintained in meta-linaro for quite some time, over there. We will be
> > looking into that soon.
> > 2. I have very quickly browsed through the files, and noticed that you
> > are setting DISTRO_FEATURES within machine configuration meta data
> > (juno.conf), this really needs to be removed, as it's a bad practice.
> > If someone builds their own distro/apps for 'juno' you shouldn't
> > change their distro config.
> > 3. We have some juno machine definition in meta-96boards, and we
> > should look at cleaning things up a bit to avoid duplication
> >
> > >
> > >
> > > Also, some of the layers are now present on the OpenEmbedded layer
> > > index.  Specifically,
> > > http://layers.openembedded.org/layerindex/branch/master/layer/meta-a=
rm-bsp/
> > > http://layers.openembedded.org/layerindex/branch/master/layer/meta-a=
rm/
> > >
> > > The meta-arm-iota layer was rejected due to not having a distro
> > > definition in it, and generally being empty.  I will attempt to add =
it
> > > again once code has been pushed to that location.
> > >
> > >
> > > Thanks,
> > > Jon
> > > IMPORTANT NOTICE: The contents of this email and any attachments are=
 confidential and may also be privileged. If you are not the intended recip=
ient, please notify the sender immediately and do not disclose the contents=
 to any other person, use it for any purpose, or store or copy the informat=
ion in any medium. Thank you.
> > >=20
