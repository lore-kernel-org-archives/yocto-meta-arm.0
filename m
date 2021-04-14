Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web10.9785.1618386520321511583
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 00:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=McOIR8/P;
 spf=pass (domain: blade-group.com, ip: 209.85.221.177, mailfrom: yann.dirson@blade-group.com)
Received: by mail-vk1-f177.google.com with SMTP id k12so875252vkn.7
        for <meta-arm@lists.yoctoproject.org>; Wed, 14 Apr 2021 00:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZAqWQponMWTMI/zrTR7vN/hBsx/VQvMEAusLARXp0lM=;
        b=McOIR8/PzPS0fTXOY1vLQt/llxUn4YwAmYK1x4A291tBBxX2hxiuc1ZWzAJnWCif5X
         T2EXL3VgnpfZCGwt4Ij0sFg3Equ05gYzDjXSLxmDAjVpddt9Jnc/5kCOwNZEXJ5+mJ6p
         I+jOi5RUEAhnni9z7qoRUizI11vwlcv/8wzs8Fiu3HNpy0DjvePn5WfOS1iobLAsMLk9
         A5lbzmj36+TY14byF4p42aYmLi1kRB681Ov6s3PYNPWT+UC6mHMcieiZgX6E1HtWhZzR
         vh6b8dj08x4PfPa/PLH9Je959+SD99u8dx5bDWCUCYY4ufpfz1MmVF5UfJ3HCORVvKwh
         VMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZAqWQponMWTMI/zrTR7vN/hBsx/VQvMEAusLARXp0lM=;
        b=uOzqnUrDSQsmNo3KJFAaM1jajVqLjuhUT486062aYyDWFxDttF0maG3BJfMm3RCJrZ
         1ay8MN42HQVFihNW7FCasqrdcEJMq8QV+FOtpfQaQgbyCSrLgv0Vj1Wh6L2+ufvGETfz
         L6M9OylUU3qidRxRQgRch95qszKiQVnCuwfDUzQiM6sptPrUfrrGMItg0drkYM0AzVWk
         sdl/5KZRUrDxVopqmx4qi2xLSE7aWAhTs0eiNf9od3P2qMYWbAFluye9hwKLFdOGMWk2
         +VU0nxKOg9kY/NY5itkBU817bmDx6h3WdWWGvr0KDBCNc3oFPPriMcJLbvOExx6vUAiK
         5INA==
X-Gm-Message-State: AOAM533du0xuxCVqpFo7KRJCovqGG8LCVeb2/rSJv3BzV8dORr4fe5kh
	SKE8rwJ31EHKcW346wBEPIcxZD6oiNPsEqY1CWuRHA==
X-Google-Smtp-Source: ABdhPJwCkmD1slARCI9kqRYTRTGgkQ8G2rSe9w/ar5LudlfTBqaweSHQSWrYQIBEpLYPJdZy6cgAbVrp1CrJlukis94=
X-Received: by 2002:a1f:2c58:: with SMTP id s85mr26742741vks.15.1618386519469;
 Wed, 14 Apr 2021 00:48:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210413094038.3577754-1-yann@blade-group.com>
 <20210413094038.3577754-5-yann@blade-group.com> <CAAaKDhFKmaoNqxe9QYUTAYbdBGcAz_nZmAqMbXnkw96h=h9yDQ@mail.gmail.com>
In-Reply-To: <CAAaKDhFKmaoNqxe9QYUTAYbdBGcAz_nZmAqMbXnkw96h=h9yDQ@mail.gmail.com>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Wed, 14 Apr 2021 09:48:28 +0200
Message-ID: <CA+4=imZM=bZbM4pdi54oGQ8Pkyhq2E6G5-9M0fZrR2TksAESTg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 4/4] arm/optee-client: create the /data/tee/ directory needed by tee-supplicant
To: Ricardo Salveti <ricardo@foundries.io>
Cc: meta-arm@lists.yoctoproject.org, Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 14 avr. 2021 =C3=A0 00:10, Ricardo Salveti <ricardo@foundries.io> a=
 =C3=A9crit :
>
> On Tue, Apr 13, 2021 at 6:41 AM Yann Dirson <yann.dirson@blade-group.com>=
 wrote:
> >
> > From: Yann Dirson <yann@blade-group.com>
> >
> > With a writable rootfs, tee-supplicant will create this directory as ne=
eded,
> > but on a readonly rootfs it's obviously not possible.
> >
> > Getting a readonly-rootfs use-case fully working still require a proper=
 writable
> > filesystem to be mounted there, but how to do that is distro policy, an=
d correct
> > OP-TEE can be at least be checked by mounting a tmpfs there.
>
> It might be better here to follow FHS and use a standard directory for
> the writable content (e.g. /var) instead. This should cover most
> distro configuration.

Right, that does make sense!

>
> > Signed-off-by: Yann Dirson <yann@blade-group.com>
> > ---
> >  meta-arm/recipes-security/optee/optee-client.inc | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-ar=
m/recipes-security/optee/optee-client.inc
> > index f697386..0198433 100644
> > --- a/meta-arm/recipes-security/optee/optee-client.inc
> > +++ b/meta-arm/recipes-security/optee/optee-client.inc
> > @@ -24,6 +24,8 @@ do_install_append() {
> >      install -D -p -m0644 ${WORKDIR}/tee-supplicant.service ${D}${syste=
md_system_unitdir}/tee-supplicant.service
> >      install -D -p -m0755 ${WORKDIR}/tee-supplicant.sh ${D}${sysconfdir=
}/init.d/tee-supplicant
> >
> > +    install -d -m755 ${D}/data/tee
> > +
>
> You could give 'CFG_TEE_FS_PARENT_PATH=3D${localstatedir}/tee' to
> EXTRA_OEMAKE, for example.
>
> Cheers,
> --
> Ricardo Salveti



--=20
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech
