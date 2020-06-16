Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web11.4720.1592286681723215860
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Jun 2020 22:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FnWLzCfs;
 spf=pass (domain: linaro.org, ip: 209.85.208.193, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f193.google.com with SMTP id z9so21983596ljh.13
        for <meta-arm@lists.yoctoproject.org>; Mon, 15 Jun 2020 22:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Euhom4Om//AuTdYdtudIwyr6TEnhCY2CK3fHj4FijJY=;
        b=FnWLzCfsDXGTrTdUtMU2GCoxSBweGej5cDPbjBbJxBkrjQnDcGjn7uPELFKS+L8jHW
         MVhdurIb73vHO7nTArc6ODDwGxZBNrjeM6j5LHbwCuz6UEVvtC6QulOUIf0IoFtDZCJ7
         +RxXJfKL1NOwsN0whfOlcPJ+gWRPo4ePwCz4mq9E8rqYpZ8sN875PGRwcvlfBoWIbusJ
         OD55Wn8nj0ZFNwBJl/uezb6W2Bycpfj/FjqIQUyisqAd0PnycGTQF33qJdMEYBiTqDwb
         hPfxG6Rq81ieFeH5zBIa7orvpo1hTGPo63s36GmAW7c20d3U3PyvwHLxONELD9zg1O5h
         v3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Euhom4Om//AuTdYdtudIwyr6TEnhCY2CK3fHj4FijJY=;
        b=TprEXPD9i9Ao3FLlFuzoL+9j6NY78GoUnox54RTqdpAakWe4lpiasOzi+zUeh7cWRi
         u1WOYDsKN9x+7inHfdGJgEfKuXX8QZdmSAAG2DgJpeRk6lKDUMyBpoLKZ/WoWguRKRg6
         1nJ7yZ49sX2d1WPTT5gav50E7tTNcUbk2FuYJ0eCVmOBegmg0BjpR5+piLXpPvej5q+s
         p5UaZILhOoVPovQ/RMBLUZ6DLmx20X7G1nT1A4QXl3b6ndUPxmRX2iuXCOh/RzZd51k3
         ZAbH0PnHSuZR28sTMJvgY0NjmA8Rx8hr6Z3MvIG3i7h5CRZI7hB0BX/ot7jXNsB0aWLK
         OKkw==
X-Gm-Message-State: AOAM532PaZUdrW589fSxS78kAnMBLpVgrFu2biYKIieI2o6YSHOImrEJ
	Y8gJnbB0jGkyWjixk4WKXhNemim3QXXRgHilN1GG5Q==
X-Google-Smtp-Source: ABdhPJwRED6PGR6Rc4fedkSB8dRjlO98aHGVmm/987ZLTC/PiN8wFKdjpwIuqVVky8Mp8s7FTnUniXpO6HkXTmLmLTQ=
X-Received: by 2002:a05:651c:106c:: with SMTP id y12mr521368ljm.427.1592286679819;
 Mon, 15 Jun 2020 22:51:19 -0700 (PDT)
MIME-Version: 1.0
References: <1592208433-28086-1-git-send-email-denis@denix.org>
 <1592208433-28086-2-git-send-email-denis@denix.org> <CAFA6WYMxS_tMVZOVgv_gj_e4P1BKdMRjmj9WPO9EkyAJuv1cpw@mail.gmail.com>
 <20200615181447.GV17660@denix.org>
In-Reply-To: <20200615181447.GV17660@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Tue, 16 Jun 2020 11:21:08 +0530
Message-ID: <CAFA6WYMN9Dz9yPTaL56iY6z__XRdc6etndDRsi1xKY2AbPQtBA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 2/4] external-arm-toolchain-versions: set per-components license based on version
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2020 at 23:44, Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Mon, Jun 15, 2020 at 04:25:13PM +0530, Sumit Garg wrote:
> > On Mon, 15 Jun 2020 at 13:37, Denys Dmytriyenko <denis@denix.org> wrote:
> > >
> > > From: Denys Dmytriyenko <denys@ti.com>
> > >
> > > This code is upstreamed from meta-arago layer.
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > >  .../include/external-arm-toolchain-versions.inc    | 28 ++++++++++++++++++++++
> > >  1 file changed, 28 insertions(+)
> > >
> > > diff --git a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> > > index a89f2f0..6121adf 100644
> > > --- a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> > > +++ b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> > > @@ -126,6 +126,20 @@ def eat_get_bfd_version(d):
> > >          first_line = stdout.splitlines()[0]
> > >          return first_line.split()[-1]
> > >
> > > +# Licenses set for main components of the toolchain:
> > > +# (g)libc is always LGPL version 2 (or later)
> > > +# gcc has switched from GPL version 2 (or later) to version 3 (or later) after 4.2.1,
> > > +#    see this announcement - http://gcc.gnu.org/ml/gcc-announce/2007/msg00003.html
> > > +# libgcc and libstdc++ always had exceptions to GPL called Runtime Library Exception, but
> > > +#    it was based on GPL version 2 (or later), until new GPL version 3 (or later) exception
> > > +#    was introduced on 27 Jan 2009 - http://gcc.gnu.org/ml/gcc-announce/2009/msg00000.html
> > > +#    and http://www.gnu.org/licenses/gcc-exception.html, which was several days after
> > > +#    gcc 4.3.3 was released - http://gcc.gnu.org/releases.html
> > > +# gdb/gdbserver version 6.6 was the last one under GPL version 2 (or later), according
> > > +#    to the release schedule - http://www.gnu.org/software/gdb/schedule/
> > > +# binutils version 2.17 was the last one under GPL version 2 (or later), according
> > > +#    to the published releases - http://ftp.gnu.org/gnu/binutils/
> > > +
> > >  python external_arm_toolchain_version_handler () {
> > >      if not isinstance(e, bb.event.ConfigParsed):
> > >          return
> > > @@ -139,5 +153,19 @@ python external_arm_toolchain_version_handler () {
> > >      d.setVar('EAT_VER_KERNEL', eat_get_kernel_version(ld))
> > >      d.setVar('EAT_VER_GDB', eat_get_gdb_version(ld))
> > >      d.setVar('EAT_VER_BFD', eat_get_bfd_version(ld))
> > > +
> > > +    lc_libc = "LGPL-2.1"
> > > +    lc_gcc = ["GPL-3.0", "GPL-2.0"][eat_get_gcc_version(ld) <= "4.2.1"]
> > > +    lc_rle = ["GPL-3.0-with-GCC-exception", "GPL-2.0-with-GCC-exception"][eat_get_gcc_version(ld) <= "4.3.3"]
> > > +    lc_gdb = ["GPL-3.0", "GPL-2.0"][eat_get_gdb_version(ld) <= "6.6"]
> > > +    lc_bfd = ["GPL-3.0", "GPL-2.0"][eat_get_bfd_version(ld) <= "2.17"]
> > > +
> > > +    d.setVar('EAT_LIBC_LICENSE', lc_libc)
> > > +    d.setVar('EAT_GCC_LICENSE', lc_gcc)
> > > +    d.setVar('EAT_RLE_LICENSE', lc_rle)
> > > +    d.setVar('EAT_GDB_LICENSE', lc_gdb)
> > > +    d.setVar('EAT_BFD_LICENSE', lc_bfd)
> > > +
> > > +    d.setVar('EAT_LICENSE', "%s & %s & %s & %s & %s" % (lc_libc, lc_gcc, lc_rle, lc_gdb, lc_bfd))
> >
> > Do we really need this dynamic computation of license based on
> > toolchain versions? As pre-built GNU Arm toolchains [1] only support
> > versions > 8.
>
> I needed gcc, gdb and binutils licenses set in central location for the new
> recipe and I already had this code handy, so I just copied it over.
>
> I guess we can drop the conditional part of it and set the vars statically.
> But setting them here is better than in the recipe, as they can be re-used
> in multiple recipes.
>

Sounds reasonable. Could you rebase it on top of mine patch-set and
let license.inc [1] reuse these static defines?

[1] https://lists.yoctoproject.org/g/meta-arm/message/647

-Sumit

> --
> Denys
>
>
> > [1] https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads
> >
> > -Sumit
> >
> > >  }
> > >  addhandler external_arm_toolchain_version_handler
> > > --
> > > 2.7.4
> > >
> > > 
> >
