Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web12.844.1603315432827067580
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 14:23:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=dO2pjQOQ;
 spf=pass (domain: burtonini.com, ip: 209.85.167.66, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f66.google.com with SMTP id 77so4992831lfl.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 21 Oct 2020 14:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jwFc1SuKkcdqmrh7VOh0gZjpA45I37YiZSdVMAvVUtI=;
        b=dO2pjQOQCaYua4MrtWEJygwBdSDwSZtCeVlsTZBZMDf+TZ21g7tTsGAFbQFjggKVt6
         Iz/7nCqCw+o/ZLcgiEqJmWzdnSGT1IDlhxNTP3s4Aao630Et+0Dex+1+S44CVHxnK8/I
         luaIUiWfy4xA+9VsrbuBIWxYXNMC/WyGNQWkMOxu38ewXec9xv4cK/N6rFqX84yQCKdL
         pH8tCYVlhtM34RtfgI1Y3ZXMdtzolkSdNvSO7rp29lpqWKgpnaHQG8F8cabrXi4H+JN7
         7EVoHb8BWydPrWqKm7BVLj9h1vhR5lawfJIT4ePwZGBksbHvZHro/GjglkDeyczE2gQg
         UEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jwFc1SuKkcdqmrh7VOh0gZjpA45I37YiZSdVMAvVUtI=;
        b=rk/rNRgwRFhhTyiQLCVJT7i9LnkltG5M+eqUSU6TIna/Gn0CpkNN426cdykxW+PdaK
         2ddkxTXXe9kZ2taefzQaHG6aeB0yjzNkPDw2vymvmrGU7wo6s5pJERAPBz8WLgLswRz8
         5UNHV7Wd35B0cGJNY7Eh7cQSDVUgbdHsAG3kULL8TXJOEXT/StrUyCOFPoRpeubj1avE
         CTlBYsmxMbnFUobx39NFO0hpzLGNeCmvMROBnMEXeYaeIhNImFsSSo3I2GfmXPOkPvIH
         pbaWIfvjjaNF65GiPlPWwScBQr0heOnJA+Z4nrX8q83mjRjpC/iaPOAraWv08N6NeEen
         1uhw==
X-Gm-Message-State: AOAM531Vx96ZHKDuieEkps5wXrXKtGlB2ZF7pwH6Mw2cRGFGyxEO8nZZ
	1WsbrArguZ98UDijZ8ud0xgukchcP/O2Q3jHSGDvkQ==
X-Google-Smtp-Source: ABdhPJyOuGv6+zZSOo6nOsaHaiXhcwbUFxeYX35FIYxR19WpFSaVNndVAAk9l1p6YRFszhZH8mjC/Py+C2Ld+iGgYj8=
X-Received: by 2002:a19:4b44:: with SMTP id y65mr1926932lfa.189.1603315430930;
 Wed, 21 Oct 2020 14:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <a151eaf39d450b9461ea9d259206956bd5a9fd49.1603291792.git.diego.sueiro@arm.com>
In-Reply-To: <a151eaf39d450b9461ea9d259206956bd5a9fd49.1603291792.git.diego.sueiro@arm.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 21 Oct 2020 22:23:40 +0100
Message-ID: <CAAnfSTsa++N5NcfAR+mi0CN39AuZMMu8Vv6tHju7sUXM3Yb=NA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/2] arm-autonomy/xen: Backport improvements to xen 4.14
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2020 at 15:51, Diego Sueiro <diego.sueiro@arm.com> wrote:
> +Upstream-Status: backport

Uppercase, please.

Ross
