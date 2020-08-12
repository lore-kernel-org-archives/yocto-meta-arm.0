Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.11869.1597227792369840727
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 12 Aug 2020 03:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=pevIeKTl;
 spf=pass (domain: burtonini.com, ip: 209.85.208.182, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f182.google.com with SMTP id v12so1598372ljc.10
        for <meta-arm@lists.yoctoproject.org>; Wed, 12 Aug 2020 03:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/h5unC0KrmcPtF0bcoW+XFTc/b0baH19QEOgvot5YoY=;
        b=pevIeKTlfiWKsGSs9RnGsk6z3H/0wZqDOqQG753IHlBggo3yuwpRvaToJpedW/WWQK
         njQpG9F/ZmsHmXFvSmn5SAP1bjRKvg6ooGwIzkmU18zS08rqZZhA+zT9uttp01/oVkFH
         RWG8/gpGgvFBnUQV0SHPL9HR9HOzQddE6Y22v7ceiVaTQDrW9r8tOues38MyMSU7nJ11
         M04fgW3ppYpQtiG+Q/BYLN0KNMdC33rIsvNCt5cRUp4gMhrNLCgRTacIFL5Puu4/paAK
         kNr//uyLxi38xENQZ6B5qx3kpL4GzwJMu9sYbJvMsZ6VO2eLecB/3eD49dDBi/qXZmjT
         6LeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/h5unC0KrmcPtF0bcoW+XFTc/b0baH19QEOgvot5YoY=;
        b=Xt+wIZOqnHy35v97v1LNtSBbWXlCSC72LEBFZi+MPojgohOJooA5krKvRNVwOdD4oR
         s6IrXLc2vOxkOI7tC2LbIlgVbf+KMkEF0LMdFDigMLOIsEv8ZUALpyqQdXqXFpTHcvIU
         DJUAW9b1mHeFgtu5aVuitJCmPDT0jVDppVgNNaIv0di6s7eEq2zJpUGY33y99br/le7x
         kim9Imthd0LXvV+9OMHHeHXVuST88AQGGmzD+hdBwmnhEd3ST0zjSefvzbeqsC+rCzkG
         uxYzrUTUKyIvFf/XJ5+Gf2yWPxxlqtj7724YbFT+1IyIQ6ZIlko5UOqsCZnH+maZsT1z
         gBAQ==
X-Gm-Message-State: AOAM533Oy7+hX4/HilJCaew337PvF0wSOPjGrwgWxyGmGVKISVve2gQ/
	o9oipJOUEqN6CYjUG8l9CHk+2Wsg4MebuAL9KPlOkg==
X-Google-Smtp-Source: ABdhPJwfIlpeb+IKFCM6SK3ZYU3tiZZTWVxFVMwjf8NhAQzWx4IUOLH4z352PcYgV6zGqj9NFPvApQvF7whBFG8o6vA=
X-Received: by 2002:a2e:97d3:: with SMTP id m19mr2183421ljj.340.1597227790521;
 Wed, 12 Aug 2020 03:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200810173216.10411-1-prabin.ca@arm.com>
In-Reply-To: <20200810173216.10411-1-prabin.ca@arm.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 12 Aug 2020 11:22:59 +0100
Message-ID: <CAAnfSTvM01ZG6F3eUf9ohYW1fOoELGO0eNa_1GO_J-HHDKMU5A@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/7] arm-bsp/scp-firmware: Build SCP/MCP for sgi575
To: Prabin CA <prabin.ca@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabin,

This branch needs rebasing, can you do that please?

error: patch failed:
meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend:4

Ross

On Mon, 10 Aug 2020 at 21:56, Prabin CA <prabin.ca@arm.com> wrote:
>
>     - Add bbappend recipe to build SCP and MCP firmware
>       for SGI575.
>     - Add machine conf to add image dependency
>       for SCP-firmware components
>
> Change-Id: Ic888ee11178979e5ec068f85a5e0d7f2cabb7f5e
> Signed-off-by: Prabin CA <prabin.ca@arm.com>
> ---
>  meta-arm-bsp/conf/machine/sgi575.conf         | 11 +++++++++++
>  .../scp-firmware/scp-firmware-sgi575.inc      | 19 +++++++++++++++++++
>  .../scp-firmware/scp-firmware_%.bbappend      |  1 +
>  3 files changed, 31 insertions(+)
>  create mode 100644 meta-arm-bsp/conf/machine/sgi575.conf
>  create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-s=
gi575.inc
>
> diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/m=
achine/sgi575.conf
> new file mode 100644
> index 0000000..04c4900
> --- /dev/null
> +++ b/meta-arm-bsp/conf/machine/sgi575.conf
> @@ -0,0 +1,11 @@
> +# Configuration for Arm SGI575 development board
> +
> +#@TYPE: Machine
> +#@NAME: SGI575
> +#@DESCRIPTION: Machine configuration for SGI575
> +
> +TUNE_FEATURES =3D "aarch64"
> +
> +require conf/machine/include/arm/arch-armv8a.inc
> +
> +EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
> diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.i=
nc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.inc
> new file mode 100644
> index 0000000..158f481
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.inc
> @@ -0,0 +1,19 @@
> +# SGI575 specific SCP configurations and build instructions
> +
> +#it=E2=80=99s a tested tag post-2.6.0
> +SRCREV    =3D "7a025658d8318e95dbab4259a8ff7834ae6d8061"
> +SCP_PLATFORM  =3D "sgi575"
> +SCP_LOG_LEVEL =3D "INFO"
> +
> +COMPATIBLE_MACHINE_sgi575 =3D "sgi575"
> +
> +do_install() {
> +    install -d ${D}/firmware
> +    install -D "${B}/product/${SCP_PLATFORM}/scp_romfw/release/bin/scp_=
romfw.bin" "${D}/firmware/"
> +    install -D "${B}/product/${SCP_PLATFORM}/scp_ramfw/release/bin/scp_=
ramfw.bin" "${D}/firmware/"
> +    install -D "${B}/product/${SCP_PLATFORM}/mcp_romfw/release/bin/mcp_=
romfw.bin" "${D}/firmware/"
> +}
> +
> +
> +PV =3D "2.6.0+git${SRCPV}"
> +
> diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappe=
nd b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
> index 33ae7fe..9594cb4 100644
> --- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
> +++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
> @@ -4,5 +4,6 @@ MACHINE_SCP_REQUIRE ?=3D ""
>
>  MACHINE_SCP_REQUIRE_n1sdp =3D "scp-firmware-n1sdp.inc"
>  MACHINE_SCP_REQUIRE_tc0 =3D "scp-firmware-tc0.inc"
> +MACHINE_SCP_REQUIRE_sgi575 =3D "scp-firmware-sgi575.inc"
>
>  require ${MACHINE_SCP_REQUIRE}
> --
> 2.28.0
>
>=20
