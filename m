Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web11.2633.1594284929887022353
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Jul 2020 01:55:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=ediOI2m7;
 spf=pass (domain: burtonini.com, ip: 209.85.208.194, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f194.google.com with SMTP id j11so1495482ljo.7
        for <meta-arm@lists.yoctoproject.org>; Thu, 09 Jul 2020 01:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TJpQ4ck1/lBWiomJlTjZYhq0HuiTuMMHll461CuxE/c=;
        b=ediOI2m7ADkNm8Lnq3dgYsBsfe+B7BrX3xZ86MhhNDW9O11f2k5LsbHwsk8W/jkCv6
         ncs60safwdt/THOEIv9UUFAOdEvjXBbGe0dfkjNXGxYko3jx/rq6TUdm4yMa5cQ0LmGt
         1b/p9O9ZNNMhvxTMt8anVc/41Jr8soqGwITJ34BXYCuK835ay2GdaXhOYvbqsvExrxUs
         lnjwhe3+9QaXt8rirxTTjz9EnFOFbGcMft3dyNMyMLiMUsLWXKklThOJoXe0/HwfgCML
         O8wGgtCoxUk19oNdSWhnBz9Pbl+arg+TQc8vBIrkqeP4AAO0lUMkz/TdsDRrIYHuQbSk
         S1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TJpQ4ck1/lBWiomJlTjZYhq0HuiTuMMHll461CuxE/c=;
        b=XvReaUEkMNHqtmdqWNyqjD3iM6w+myGdLZwGfBNJNg+1z9Pd41V4umBi3Spbe7CQ44
         Broj5SQMbQb+ZOWio4k4maHzh+eesEJI+BnB6ug/yXoWo3AYQ6Jhr/HGVQN9jrMFEyfe
         WFze9Gkn1M3i0Ng8ElWPOUnX8fZpxtWIS5SpeYX6uIPOIgmcaF3jSySMOdxfwJA+w/4G
         3Sjcz7nFgjZE3qIdYQUnHxfUHKJbfuklZf922Fugylx2njKfIsJNt9mOgY089WcIGM4r
         j9bgI60PG/EhCvaWHDH3znpBLQ8R81aSeeQRv3x6TjCc2cMnzqJg9MLTgkONN48EVAZV
         BcQQ==
X-Gm-Message-State: AOAM533nDvs46DrogGE2CW3LnH3ujJLr/FNluwlD3vyIKR20YH9wjYqT
	nggSEEoTjtmVjtH7yq8dzJW770Wf4vtRHvdUA60XxQ==
X-Google-Smtp-Source: ABdhPJyKAE1flbyIW+FSFyyZRgMA6dECLH83o32RPLGdGYrckWXYTK2fSAQ21MIlbowYx5Mq3BbCDEMUX+FSQskhrTM=
X-Received: by 2002:a2e:8882:: with SMTP id k2mr25623773lji.352.1594284927773;
 Thu, 09 Jul 2020 01:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200704154301.15546-1-jon.mason@arm.com> <CAP71Wjxp9P1T-gKehWz-eio7JD4H8_DhdvorEtiEf37L49cY2A@mail.gmail.com>
 <7372fed9b3d2942e5b3b2a2e9cce9c3c55fea53e.camel@linuxfoundation.org> <CAP71WjyrP2QEbJCYeXF0yQ0SvTPyVKn99RE9qZThvd=55=HRNQ@mail.gmail.com>
In-Reply-To: <CAP71WjyrP2QEbJCYeXF0yQ0SvTPyVKn99RE9qZThvd=55=HRNQ@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 9 Jul 2020 09:55:15 +0100
Message-ID: <CAAnfSTvE31Yj94sgLZuYb=e72+utruowVNLY_vEsi-ssCy2jVw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp: yocto-check-layer fixes
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Jon Mason <jon.mason@arm.com>, 
	meta-arm@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 9 Jul 2020 at 09:14, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> right.. the recipe does:
> PACKAGE_ARCH_qemuall =3D "${MACHINE_ARCH}"
>
> So it's a luck situation for yocto-check-layer.. since it computes world =
signature with a qemu machine by default. so they indeed don't change after=
 adding meta-arm-bsp! however for someone not using qemu in the first place=
, adding meta-arm-bsp would change them!

Ha, thanks for digging.  I guess we should:
1) make the PACKAGE_ARCH change in meta-arm use an override
2) change this recipe in oe-core to always be MACHINE_ARCH

Ross
