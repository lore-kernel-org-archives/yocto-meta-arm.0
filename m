Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web10.522.1589220078482481018
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 May 2020 11:01:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hhlQ0GuI;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id 190so5160850qki.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 11 May 2020 11:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ooJbEeJp8Qyr2YiT9Becxv43PPdR9oDXMhRoNeyJUPM=;
        b=hhlQ0GuIBXL9b1vgb9rvaRywnIW83BVO8xOb1u2UDDN222hCxYui6i7dqWaK1usU2M
         j7NTBMc5/rp3xLeNlh5CHE3R3bTdNutlbUyPT/qyrqSatI2E2zdf/WykIaT/BXxl5mDZ
         k7IFJ/CVCauszRafhhlTFIiNlQ7se0iFirnah01KNQbjtDo/U17qrt98nckQK9wNJ8PV
         rz97uVZ+RoeyzxgjKD+/yCPrVzVprNzEDQK7M3cAF+cR9yBVbDKQ1RfPZWgZOQ2kxWwU
         epzBk+cK8KaQm3B8e+ta5HnXGk6GsWxvbAyrRm7S9c5hRhIVmfmLvAABmkKuVKf5wlMb
         y5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ooJbEeJp8Qyr2YiT9Becxv43PPdR9oDXMhRoNeyJUPM=;
        b=DmLdg7jg7lPIYK6agdplN8lxGd22LkNHexaeWg+MBpAqf3QMGExsCRAQwV6JRutJWa
         FNlJYTldSFLkZhegvLjJJKxWirt1ml7GCrclUvM7WUbbEvO2AKvH0yaCoNRLvLqDOTKh
         77Z9MKA1+ORFCxgN34fx1wLUaIa+aGPlDEFrB0ewMZnRh6TOj08tsZ/4VEFiQoAPWoL3
         BAtovbwCBgNZ2H4IBjdHtmAwg9l3kAdImOZgWZwXjpUsH68YijXIKi9GoqFpW29fwtTe
         +RE1KuPjeexA1k/GeewekFXd8cmFYY6PGWAIUs1BH0TddUvas/mtZn9Ia2ERZCD7DeTt
         0emA==
X-Gm-Message-State: AGi0Pub/1b5rkkZXCN13mygynj3hFrNxcVB3/3a671kylVEqoZl/J/pQ
	av3BZGzr9F/A9TsQKVngoFgqSWQkG+8oyAitVjA=
X-Google-Smtp-Source: APiQypKJHvIfeivjiH09Uz+k1/DSzJtvDixxKDBT9MLMqagSjGsQjoPUBlIneTdlrYZgQFfK6gJBQNA1mJ+jNC8wbNk=
X-Received: by 2002:a37:a5d0:: with SMTP id o199mr16604933qke.225.1589220077399;
 Mon, 11 May 2020 11:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <2fb20adc-6d54-fefc-dfe7-007ee02fc01d@gmail.com>
 <160E09F2270E9334.31760@lists.yoctoproject.org> <20200511174807.GL11927@denix.org>
In-Reply-To: <20200511174807.GL11927@denix.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 11 May 2020 11:00:51 -0700
Message-ID: <CAMKF1sp+ywOQF0YbBC3H7Jv=1J-Vw+5U8Q36spFk4cf7VKi_8Q@mail.gmail.com>
Subject: Re: [meta-arm] Sharing TF-A with multiple BSP
To: Denys Dmytriyenko <denis@denix.org>
Cc: Joshua Watt <JPEWhacker@gmail.com>, meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, May 11, 2020 at 10:48 AM Denys Dmytriyenko <denis@denix.org> wrote:
>
> + Khem
>
> [apparently, nobody follows the list, so need to round up everyone interested] :)
>

Admittedly I don't follow and this layer shows up because I need
meta-ti just for beaglebone
which does not use optee, so not that interesting but I am on
receiving end of this.  I agree
option 5 is best and if, we could also move the recipe to meta-oe at
least that can be a lesser
common place if not core.

> Please see below for possible discussed options. IMHO, #5 would be ideal.
>
>
> On Mon, May 11, 2020 at 01:37:30PM -0400, Denys Dmytriyenko wrote:
> > On Mon, May 11, 2020 at 09:47:49AM -0500, Joshua Watt wrote:
> > > Continuing the outcome from a discussion that was on the OE-core
> > > mailing list, I've started converting some of the BSP layers I work
> > > on to use the trusted-firmware-a recipe from meta-arm as the
> > > canonical source of ATF instead of each of the implementing their
> > > own recipe. So far this has gone well except for one annoyance I've
> > > found: meta-arm has a layer dependency on meta-python, specifically
> > > for the optee recipe. Normally, this wouldn't be such a big deal,
> > > but in a ideal world there will now be a lot of BSP layers that
> > > depend on meta-arm to provide ATF, and it seems annoying to have to
> > > make all of those layers (transitively) depend on meta-python.
> >
> > Yeah, I raised this issue over a month ago - unfortunately, nobody replied
> > or acknowledged...
> >
> >
> > > I can think of a few possible options:
> > >
> > > 1) Do nothing because no one other than me thinks this is a problem :)
> >
> > Don't flatter yourself... :) :D J/k
> >
> >
> > > 2) Use BBFILES_DYNAMIC to make optee optional based on the presence
> > > of meta-python
> > >
> > > 3) Use PACKAGECONFIG to remove the python parts of optee (if that's
> > > even possible). They can be automatically added back if meta-python
> > > is present via BBFILES_DYNAMIC.
> >
> > I don't think those are optional - they are used during the build to
> > sign some parts. And also for ELF manipulations.
> >
> >
> > > 4) Remove the hard requirement of meta-python from meta-arm; it's
> > > only needed to build optee so the users can figure it out?
> > >
> > >
> > > Anyone else have any ideas or thoughts?
> >
> > I can think of couple more options:
> >
> > 5) there are only 3 python modules needed - pycrypto, pycryptodomex (actually
> > a replacement for pycrypto, so upstream can drop first one) and pyelftools.
> > Could probably try to make a case of moving them to OE-Core?
> >
> > 6) Like optee was inside own sub-layer meta-optee within meta-linaro, can look
> > into separating it into meta-optee within meta-arm.
> >
> >
> > > Thanks,
> > > Joshua Watt
> > >
> >
> > >
> >
>
> > 
>
