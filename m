Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web11.953.1592850217213456714
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Jun 2020 11:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=wP690JmI;
 spf=pass (domain: burtonini.com, ip: 209.85.167.67, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f67.google.com with SMTP id u25so10235184lfm.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 22 Jun 2020 11:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZT4Z2wTQ4I1A01b/xCLxWCLH07o7ocRjQVxf9knewzk=;
        b=wP690JmI7igkYOhSa9Llzwb6cLMsjBhDAX3GSY3a6JI6az17OgXGVL1T82SKwuMkEp
         yIduEkJs9i2t4RECqFe5rXqaVnD5In6SzzzmxUJjioGRD+l8hLRVJNqno6/y0pxIXwlX
         vVzOO25O2cXTNeE7E0hgrF8a4fDKXSCnDrg1j/nMyvcRj6sSEEKgamAPS5f0Sh0OZomB
         rfagZ1dhm5Dd1Lymy/KBoCBmSubDsMfnS1mP0xFqX7T7jTGkLRdv/Qwsxr6LGHKh9w/S
         H/LwysQECt22Sejn8Ugx6FXPxG4iEov+3/Uymv2kW2buYeW+K7mcibH3uBnimlfESa+D
         ADhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZT4Z2wTQ4I1A01b/xCLxWCLH07o7ocRjQVxf9knewzk=;
        b=AnN3QEcAd+1FwIp+Zx2ccGRayt4a612DUk5nEUNQyYMxBUQIHtHXPrLtbOQwxmUiY2
         Nl8lDpeCK7YC4y9o/VfJopwzboZBCjgHkyon5YK4MNv70+k4K/Ip7f97Dnxex69s6uoN
         u+uvV4LysfY+liAnBm9zkybd0ig3qW9r05Lu553prZGRSYpIzF60aXj5ICKzpozw+d+C
         w9qDlGHux6FbDJJJwXLXS+wBq3j+T4UPgEVts7HlM4/oERqsMPJ7mQamc8A1YIGM6R+9
         /InckDNQK1rc1NqJKVB5amY2VZ/041BHwc1pvAOKBmiza4mAK7X8rh5pzRLQ5Cs2HX+Q
         3I5Q==
X-Gm-Message-State: AOAM530oekzon3N4Cwo4CnQuMvbA9nakqZtxUlT63tDLaSlfpIV1n+Fx
	EX+Aes/9x/2yKc18vo2ivMq5BzEglbnAOxKmpGS0MA==
X-Google-Smtp-Source: ABdhPJxdwaEBYOEDxxSPmctiZqBNMkFzovKZYcT5cNzcqsncB4/ixvzbt+kXQjto5gLfVFuf8QRnWUle0wyUqQcetdg=
X-Received: by 2002:a05:6512:108f:: with SMTP id j15mr10482147lfg.19.1592850215380;
 Mon, 22 Jun 2020 11:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200622071401.2570-1-gabor.abonyi@arm.com> <20200622071401.2570-5-gabor.abonyi@arm.com>
In-Reply-To: <20200622071401.2570-5-gabor.abonyi@arm.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 22 Jun 2020 19:23:24 +0100
Message-ID: <CAAnfSTsX81c+YWMV1X1cNFaKfVCkB2gP0bykdwwondGYDBUDxw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 4/6] arm: trusted-firmware-m: Add recipe
To: Gabor Abonyi <gabor.abonyi@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Jun 2020 at 08:15, Gabor Abonyi <gabor.abonyi@arm.com> wrote:
> Adds a recipe to pull down the trusted-firmware-m repository and the
> ones it depends on. The recipe can either use gcc-arm-none-eabi-native
> or armcompiler-native Clang toolchain to compile the firmware.

Looks like it's time to start that multiconfig experiment where we
just build another cross compiler inside Yocto.

Ross
