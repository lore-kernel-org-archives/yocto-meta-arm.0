Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.404.1620666889706604285
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 May 2021 10:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=RCT+6lwV;
 spf=pass (domain: burtonini.com, ip: 209.85.128.50, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f50.google.com with SMTP id n205so9639221wmf.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 10 May 2021 10:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=No6IP+MKGZDeGQtHmxgv7qJLxBSuZCeT9xAx3DZr2dY=;
        b=RCT+6lwV2dr5MDvEPgVBXe4+H+De4haBH+/v7OrmhaljZkXTm/S0H4yloIZd67TQFs
         mKcux6n6y0RWPkzoW/jrX+c9yCsTtiW4EbtUh3muJOAVROBZpD9r83K0Ha5gIl97iQOg
         YrG6xqlvgH6bE1xVLxAxXO4Um7XOm/tqgWN2UbAMHzQ71rnVI1HMcMdWwDjkma6JtGMp
         NmqUV8LP14sjlAAqoA84515JmANa/78a01thl7+/xgnrMEzGEPZI8Xh97bKFoqWomIJa
         Oxs0YAHj+wTz0aCz+gOfTXFwhxW3CMCog1LmUVw54UqACP+mF/NEoSFb9OhmAQuFtXab
         4lMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=No6IP+MKGZDeGQtHmxgv7qJLxBSuZCeT9xAx3DZr2dY=;
        b=HvzPervzmnrAYcxU1QO+bjPLQ12v7NMLOtNdzAGH7Fq7JUZHst8aAGyPqJrEn9KRje
         D+M7Q4g50hK/1XSgUx1t8TwBW/CnkoamD1e1y092S2Z+fRYOodklo95NKtDlUxM4Ydhl
         Km7g18bgqeIhZwwT4/gr6YoTzGtw3KYm9N+RU4CvcBoYjNxCRI/Hh5ek8xKLexlRhRrm
         md7J/tqkWVfAmG820uzxiErGsyDlGYjpOXGpbsFrndNOdFgO+WTnHrZAmfD7AQvVV3l9
         GmcS4ng3jGPOWJ0XsTR8tiPFeX2tv19entmH+5LaMNDo/jrqfBS1djzVtz/sfgvXpS6p
         wTPg==
X-Gm-Message-State: AOAM531ZL/YS6Pihg04XwVuF9xjM/qKsC85+kgZn3dJXYw+FBUM/fV+q
	qw7CPNpJKhuPbgC+juhUECudOVDDChV5larxvQP0pQ==
X-Google-Smtp-Source: ABdhPJzkOCkAiBCAWWgnxZHwDgCQWnjSxGua/Fd/IO8On0iVVnBcWavbWkZaWkYSMdCIwUmMkqFDhHFyZB7jte+XyMM=
X-Received: by 2002:a1c:a507:: with SMTP id o7mr190317wme.130.1620666888101;
 Mon, 10 May 2021 10:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210501185313.606401-1-peron.clem@gmail.com>
In-Reply-To: <20210501185313.606401-1-peron.clem@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 10 May 2021 18:14:37 +0100
Message-ID: <CAAnfSTvyRQEL5Qjt40tgoMouDeerzzQYE7jvBhtnJoSfVdsruw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] gator: Add new package
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 1 May 2021 at 19:53, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>=
 wrote:
> +SUMMARY =3D "DS-5 Streamine Gator daemon"

Typo in "Streamline"

> +DESCRIPTION =3D "Target-side daemon gathering data for ARM Streamline \
> +Performance Analyzer. Note that Gator uses the Linux Perf API for \
> +most of its data collection. Check that your Kernel follow the \
> +configuration requirement specified here: \
> +https://github.com/ARM-software/gator#kernel-configuration"

Far too verbose a DESCRIPTION, the first sentence is sufficient. You
can put the kernel configuration in a comment in the recipe.

>SRC_URI =3D "git://github.com/ARM-software/gator.git;protocol=3Dhttp;branc=
h=3Dmaster \
>. file://0001-gator-don-t-strip-debug.patch;patchdir=3D.. \
>. "

There's a mix of spaces and tabs on the line with the patch, just spaces pl=
ease.

> EXTRA_OEMAKE =3D "'CFLAGS=3D${CFLAGS} ${TARGET_CC_ARCH} -D_DEFAULT_SOURCE=
 -DETCDIR=3D\"${sysconfdir}\"' \

Also pass V=3D1 so the build log is verbose.

I'm guessing this doesn't work on x86-64 hosts?  If so add
COMPATIBLE_HOST =3D "aarch64.*-linux" to make that explicit (as
otherwise a world build with meta-arm present will try to build it).

As this is just the daemon, should the recipe be gator-daemon? Or do
you plan to add the rest of the tools in the future?

Ross
