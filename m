Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.460.1597339691582700415
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 13 Aug 2020 10:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=e0pxx4Kw;
 spf=pass (domain: burtonini.com, ip: 209.85.167.45, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f45.google.com with SMTP id m15so3452884lfp.7
        for <meta-arm@lists.yoctoproject.org>; Thu, 13 Aug 2020 10:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JxO+j6f/8PEw445MS6+hDWaCrKmEXNIOi0tb0t0qfC8=;
        b=e0pxx4KwMcylAaC9cw5lJ39AufBEH69q0/f0B4z5bMqH2nF68NONuS/kO7DlvCitpa
         zRvnaPJLxhPsg24sVu/IcGjKsib8CJ81DZ8SEkBBsEf0Q9aZgpeipwkU3XLoN5ZpAkp4
         zP/25ply9wVpam0W58Zo53TtqrPX5DdDd8fbCKNRd49J0mkUJmA0CDXe7cp/oQjrl5MZ
         Z+YcdeAlEnGdBeDxn4TSWVKIh+tu03XA/axJPThCbMc61iLjwE8gU/0qp7o+sNfx8YJA
         zxBBGCEt5nGH7aPcrjxOuamkEk2oIMmdW+hlFFGgpRz3Q8kBWUqW2PT1mX9gJMn/SMNs
         tlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JxO+j6f/8PEw445MS6+hDWaCrKmEXNIOi0tb0t0qfC8=;
        b=DivbCSGyuyw+tA0i5ss0hFDYNyg5BMfQrkvMq0RlMsi7TIy9ILtdd4b5nDYn+Q+Pxy
         nIP9aq1F7dXnETEZM8KfUbHh7d5w1+XH79q/tkaF9rUUdqd+o60VKx2Zt8zjPbz77Nhg
         Ee+vgJMal92/j/yPGxjf/SWBM+77sRDJO8C+48CDrwpxir9pGIsQDhHhpxqO0L0ytNLT
         ZI4Y558C0TpdV0mcYJPGF//JAGohv5zxgYBlMHeLmSAXbBf6Jfya54JiypQ8od9ThCIL
         dn4F8UpOvCRJJSGUCWsHmm12NVRPDprWW6rHOnNufUMdUQlZkXZRdV+aY8eKtq2MsNOw
         wNHw==
X-Gm-Message-State: AOAM531fGLwvDIG76eJzH3gzorj7xqwAvnK44BJpJrdiGfTF/U8Op7qw
	D6ONL0fK5twE2j4kHOhXIabGC7xnN6lEYardQnmmZA==
X-Google-Smtp-Source: ABdhPJzl5ajtWCIJzoz2PD390kjPHwkbErch+X2WR5gjlvUSrLE91L0YoLvzeJ6h3mcr/RcC0JMla4wMaho7IkZeTCY=
X-Received: by 2002:ac2:5548:: with SMTP id l8mr2712226lfk.39.1597339689341;
 Thu, 13 Aug 2020 10:28:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200810173216.10411-1-prabin.ca@arm.com> <CAAnfSTvM01ZG6F3eUf9ohYW1fOoELGO0eNa_1GO_J-HHDKMU5A@mail.gmail.com>
In-Reply-To: <CAAnfSTvM01ZG6F3eUf9ohYW1fOoELGO0eNa_1GO_J-HHDKMU5A@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 13 Aug 2020 18:27:57 +0100
Message-ID: <CAAnfSTtUJjbbG-hEPQbp9dDOgAu4UUQWNiM7TteBwzTrXSH6rQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/7] arm-bsp/scp-firmware: Build SCP/MCP for sgi575
To: Prabin CA <prabin.ca@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

All merged to master, thanks.

Ross

On Wed, 12 Aug 2020 at 11:22, Ross Burton <ross@burtonini.com> wrote:
>
> Hi Prabin,
>
> This branch needs rebasing, can you do that please?
>
> error: patch failed:
> meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend:4
>
> Ross
>
> On Mon, 10 Aug 2020 at 21:56, Prabin CA <prabin.ca@arm.com> wrote:
> >
> >     - Add bbappend recipe to build SCP and MCP firmware
> >       for SGI575.
> >     - Add machine conf to add image dependency
> >       for SCP-firmware components
> >
> > Change-Id: Ic888ee11178979e5ec068f85a5e0d7f2cabb7f5e
> > Signed-off-by: Prabin CA <prabin.ca@arm.com>
> > ---
> >  meta-arm-bsp/conf/machine/sgi575.conf         | 11 +++++++++++
> >  .../scp-firmware/scp-firmware-sgi575.inc      | 19 ++++++++++++++++++=
+
> >  .../scp-firmware/scp-firmware_%.bbappend      |  1 +
> >  3 files changed, 31 insertions(+)
> >  create mode 100644 meta-arm-bsp/conf/machine/sgi575.conf
> >  create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware=
-sgi575.inc
> >
> > diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf=
/machine/sgi575.conf
> > new file mode 100644
> > index 0000000..04c4900
> > --- /dev/null
> > +++ b/meta-arm-bsp/conf/machine/sgi575.conf
> > @@ -0,0 +1,11 @@
> > +# Configuration for Arm SGI575 development board
> > +
> > +#@TYPE: Machine
> > +#@NAME: SGI575
> > +#@DESCRIPTION: Machine configuration for SGI575
> > +
> > +TUNE_FEATURES =3D "aarch64"
> > +
> > +require conf/machine/include/arm/arch-armv8a.inc
> > +
> > +EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
> > diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575=
.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.inc
> > new file mode 100644
> > index 0000000..158f481
> > --- /dev/null
> > +++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.inc
> > @@ -0,0 +1,19 @@
> > +# SGI575 specific SCP configurations and build instructions
> > +
> > +#it=E2=80=99s a tested tag post-2.6.0
> > +SRCREV    =3D "7a025658d8318e95dbab4259a8ff7834ae6d8061"
> > +SCP_PLATFORM  =3D "sgi575"
> > +SCP_LOG_LEVEL =3D "INFO"
> > +
> > +COMPATIBLE_MACHINE_sgi575 =3D "sgi575"
> > +
> > +do_install() {
> > +    install -d ${D}/firmware
> > +    install -D "${B}/product/${SCP_PLATFORM}/scp_romfw/release/bin/sc=
p_romfw.bin" "${D}/firmware/"
> > +    install -D "${B}/product/${SCP_PLATFORM}/scp_ramfw/release/bin/sc=
p_ramfw.bin" "${D}/firmware/"
> > +    install -D "${B}/product/${SCP_PLATFORM}/mcp_romfw/release/bin/mc=
p_romfw.bin" "${D}/firmware/"
> > +}
> > +
> > +
> > +PV =3D "2.6.0+git${SRCPV}"
> > +
> > diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbap=
pend b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
> > index 33ae7fe..9594cb4 100644
> > --- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
> > +++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
> > @@ -4,5 +4,6 @@ MACHINE_SCP_REQUIRE ?=3D ""
> >
> >  MACHINE_SCP_REQUIRE_n1sdp =3D "scp-firmware-n1sdp.inc"
> >  MACHINE_SCP_REQUIRE_tc0 =3D "scp-firmware-tc0.inc"
> > +MACHINE_SCP_REQUIRE_sgi575 =3D "scp-firmware-sgi575.inc"
> >
> >  require ${MACHINE_SCP_REQUIRE}
> > --
> > 2.28.0
> >
> >=20
