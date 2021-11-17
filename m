Return-Path: <maxim.uvarov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7768BC433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 20:24:25 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web09.1355.1637180664948628914
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Nov 2021 12:24:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ihRZOyAM;
 spf=pass (domain: linaro.org, ip: 209.85.210.174,
 mailfrom: maxim.uvarov@linaro.org)
Received: by mail-pf1-f174.google.com with SMTP id 8so3737065pfo.4
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Nov 2021 12:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q7mvC94oFsY8keiJPjSRn09h2/9uHy0CypEv+MBx+Tc=;
        b=ihRZOyAMlAiDGs7nLsHj6X1VoJKPEHwUG0EXm0D/TaP82XJ7t41dqF8Y3RB8go0E7F
         E1D3pcnu4fYyP4i3m3ux1QWadcZ21AkDcxyPdiyBdf1AbzyoS4TcmHHfp9+PNOzzqxEn
         VFH+eRqCU00ELXYL2tws5r6XgIAhrjM4jYeCuFFcgfbYa0jgpiskx9vM3o4dk/OTFiae
         6iuojgXfDopDg8zuqD0eT+eCrCY+S7QB9IhsFFHeY/cVkglPvQ1vWoKIpa7gHAd46zxS
         Vewq/PcJZGTSVhmmAGsT9hEmJLiDDrw4nn1n86FjrV2ud+Sk0T6POpK6rXcQ0zp+6xom
         L0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q7mvC94oFsY8keiJPjSRn09h2/9uHy0CypEv+MBx+Tc=;
        b=A//Wqc/08DbXYDPG3+o5sQsGZZLL99eLP2iUby4v5sXbx1qZct1WmQrFhXzhT32lOb
         XDGVtSP+X1A6ENyOo0uWys1QfpRJfUwz9YPuRLAKUQ392WRC1QxL+n+hr/FXYxm6jsXo
         CH2NOBadoXBrScdCO+cCsHREIgaP8ZZkix7q8GC3xnACvips0BJgMI4CItxXs5PFpbll
         R1c/9ssLCJYxipu89NDqJqlV24EKooa9tDsGs+IRucj07rdRIT11BoWapUHCOIwNKade
         guxcWutjCnl7TbsTHBDRnp4cSRgRq7Lr4RU2lQQsWKLX+jqfkROwTXqmqbxEbXyB7t4U
         1Ujw==
X-Gm-Message-State: AOAM531xseQa/u5nhgjxz4i5jNw/l713YLok63n0oxAKXdZ1ynHsskiS
	4HAPaQdU/I4xPQlRbSvK88YxFr8YSNN+Et/W/TmgVA==
X-Google-Smtp-Source: 
 ABdhPJzMTDVl9LJPp9Mi++Jr42CX36ZadsS/IJqUFMZnX90R9ciNU9Z4sLCGjuuihgwkoVkphqmK2H0JDDNdlocwdJI=
X-Received: by 2002:aa7:8105:0:b0:4a0:2f7c:81b with SMTP id
 b5-20020aa78105000000b004a02f7c081bmr9615280pfi.25.1637180664436; Wed, 17 Nov
 2021 12:24:24 -0800 (PST)
MIME-Version: 1.0
References: <20211117100210.1401-1-maxim.uvarov@linaro.org>
 <20211117100210.1401-2-maxim.uvarov@linaro.org>
 <CAAnfSTve86ukvNZSPgGSxP-ACVMBQTygOeX81U2tHexRa8umhw@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTve86ukvNZSPgGSxP-ACVMBQTygOeX81U2tHexRa8umhw@mail.gmail.com>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Wed, 17 Nov 2021 23:24:13 +0300
Message-ID: 
 <CAD8XO3Zzfr9DpFboe=9YaOKjVR8G0YXXBuBg_p_5BS0ZpsvdnQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCHv5 2/3] add optee-ftpm
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org, Jon.Mason@arm.com, Ross.Burton@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 Nov 2021 20:24:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2419

On Wed, 17 Nov 2021 at 20:50, Ross Burton <ross@burtonini.com> wrote:
>
> On Wed, 17 Nov 2021 at 10:02, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
> > @@ -0,0 +1,20 @@
> > +fix gcc compilation
> > +
> > +just fix compilation under gcc.
> > +Upstream-Status: Submitted [https://github.com/wolfSSL/wolfssl/pull/4563]
>
> Good news!  This can be Backport now as the change was merged. Please
> refer to the commit SHA so we can easily verify in the future.
>
> > +inherit autotools-brokensep deploy pkgconfig gettext python3native
>
> The package doesn't use autotools, so don't inherit autotools.
>
> Also suspicious of pkgconfig and gettext.
>
ok.

> > +B = "${S}"
>
> Not needed.
>

ok.
> > +# fails with j > 1
> > +PARALLEL_MAKE = ""
>
> Please file a bug with whatever component fails.
>
> Ross

This  chunk is for a long time in our layer and I might not restore
what the error was there. Will try to build it a few times.

BR,
Maxim.

