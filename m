Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.6689.1587402154120822802
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Apr 2020 10:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kx9Kdvyc;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id m67so11347535qke.12
        for <meta-arm@lists.yoctoproject.org>; Mon, 20 Apr 2020 10:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WPQ5eWfAPsLz58JSRvf75ymm+s3kFHszG9A/4XDlbZM=;
        b=kx9KdvycGsuJJ4/TTbmkbL5bNPKKv2EanCdwAwb87p9ZefbWyF3D+It4jhpHcmCzLG
         5MWZ3cqV1amIg0d52yKNsOqjxadM0r4hqXUVbgkFVo+GI9b73yzqYPbtzdhZq4wfNb8c
         lQWAVKaFKJ7k7nat8mUScHeB2VzNOSiow2QjBMUSFoR7+23p5pl7tyK8IH+qla/3AvSK
         trEUVzSJ9ih28lX7yv80eRjFN8NAb0YT00JqW0O//Ct7jGsEWcz3zjT1GiCKJWms132m
         W+jrLVh4IK12bofA3xp/ku2p8GR7OPjSSCv0Q3fYBQkckS7KuO0AbdcA9SCioLngQ7Bj
         5hEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WPQ5eWfAPsLz58JSRvf75ymm+s3kFHszG9A/4XDlbZM=;
        b=ViFHEDNSpk/RPb9qo/IM0sjRz8UXkx6OeCk2+Yhi+BqyTyfjpX9XqG0VOu867u8Kyl
         SmY2R4dKuigPdqrGxwYqNDFEdqvBUdybEFCinwvU35bscZ+FqhQhmPx40MJwD40X+CAi
         1Djpqup98JS6zzEtPWyywTdbiDMzIVtn6rgIgjBB2ri/WBoW0eB+l9D3ZBqemLQHKR+S
         YZuQLlOAelVIcZadRpeTbQpVTqpvJ04iIT96GkC/53Olt5Hrm8ZQ5Gf1ir6EMifs/Zwb
         koaF4E7jp/U0bootU1ZDFiKGMJJbkl+r15rSH22YiUuw6ExrNVNaakxA70t7xuSQ5C7b
         JU6Q==
X-Gm-Message-State: AGi0PualtBwAWPAml3v8JHSXzLuF43BYcMiMq0YBQg/jt1FMXn6IeZio
	+KTLd0iZMr0wMMMSZIv5v5uPyhDu1WLrQ8HriLIvW089
X-Google-Smtp-Source: APiQypIZ6muVZV7sXOa0xuXF1ycOUopi7Ns8y32+ywr0/KzfSxw/gl9REB9SJuZ/6OMRGCgaeHu2Th/yyOXOFh6681s=
X-Received: by 2002:a05:620a:16aa:: with SMTP id s10mr16804051qkj.225.1587402153048;
 Mon, 20 Apr 2020 10:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200412054531.1804159-1-raj.khem@gmail.com> <20200413220519.GD30105@kudzu.us>
 <16058061C39D13E2.17445@lists.yoctoproject.org> <20200413224013.GB11927@denix.org>
 <CAMKF1soD3EJLe4tLfH-t8ovh0rMc5T4hAy+862aeGr_cRU1uww@mail.gmail.com>
 <20200414004844.GC11927@denix.org> <AM0PR08MB3987E41E58DDE8D91684320192D40@AM0PR08MB3987.eurprd08.prod.outlook.com>
In-Reply-To: <AM0PR08MB3987E41E58DDE8D91684320192D40@AM0PR08MB3987.eurprd08.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 20 Apr 2020 10:02:06 -0700
Message-ID: <CAMKF1sqw0nt8W+g_BEJHCj72L44ebm81bo+L4vG6ThVXxKhFVg@mail.gmail.com>
Subject: Re: [meta-arm][PATCH] optee-os: Mark recipes dormant by default
To: Diego Sueiro <Diego.Sueiro@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 20, 2020 at 6:50 AM Diego Sueiro <Diego.Sueiro@arm.com> wrote:
>
> > -----Original Message-----
> > From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> > On Behalf Of Denys Dmytriyenko via lists.yoctoproject.org
> > Sent: 14 April 2020 01:49
> > To: Khem Raj <raj.khem@gmail.com>
> > Cc: meta-arm@lists.yoctoproject.org
> > Subject: Re: [meta-arm][PATCH] optee-os: Mark recipes dormant by default
> >
> > On Mon, Apr 13, 2020 at 04:55:25PM -0700, Khem Raj wrote:
> > > On Mon, Apr 13, 2020 at 3:40 PM Denys Dmytriyenko <denis@denix.org>
> > wrote:
> > > >
> > > > On Mon, Apr 13, 2020 at 06:06:37PM -0400, Denys Dmytriyenko wrote:
> > > > > On Mon, Apr 13, 2020 at 06:05:19PM -0400, Jon Mason wrote:
> > > > > > On Sat, Apr 11, 2020 at 10:45:31PM -0700, Khem Raj wrote:
> > > > > > > all arm SOCs may not support optee and there are non-arm
> > > > > > > machines too this makes this recipe fit into mutli-BSP
> > > > > > > environments, platforms which support optee should be
> > > > > > > specifically called out via COMPATIBLE_MACHINE, for general case it
> > remains 'null'
> > > > > >
> > > > > > Pulled into the master branch.
> > > > >
> > > > > I think this was due to the parsing issues, resolved by another
> > > > > patch. What's the point of masking this recipes now?
> > > > >
> > > > >
> > > > > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > > > ---
> > > > > > >
> > > > > > > diff --git a/meta-arm/recipes-security/optee/optee.inc
> > > > > > > b/meta-arm/recipes-security/optee/optee.inc
> > > > > > > new file mode 100644
> > > > > > > index 0000000..a12521d
> > > > > > > --- /dev/null
> > > > > > > +++ b/meta-arm/recipes-security/optee/optee.inc
> > > > > > > @@ -0,0 +1,2 @@
> > > > > > > +COMPATIBLE_MACHINE = "null"
> > > > > > > +# Please add supported machines below
> > > >
> > > > Can we instead of neutering all OPTEE recipes and requiring BSPs to
> > > > provide bbappends with COMPATIBLE_MACHINE for opt-in, add
> > EXCLUDE_FROM_WORLD = "1"?
> > >
> > > its fine to provide it via bbappends, as long as it is per machine,
> > > which really supports Optee it is also educational to understand the
> > > recipes thats way, excluding from world is then not required.
> >
> > This is rather backwards. OPTEE is widely used these days.
> >
> > What's the harm for the recipe to be fully open and compatible, if it's not
> > being built by default?
> >
> > Otherwise, we should similarly neuter ATF, U-boot and even kernel - not all
> > platforms are supported by those and require per-machine support and
> > configarion added. Why not require those to be opt-in via bbappends?
>
> For `trusted-firmware-a` recipe we use `COMPATIBLE_MACHINE ?= "invalid"`
> and I think  we should we use the same strategy for optee (use the `invalid`
> term instead of `null`) to maintain consistency.
>

sure send a patch, I think that's fine.

> --
> *dS
>
> >
> > --
> > Denys
