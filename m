Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.9655.1617702235976220335
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 02:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=TZZrT/+m;
 spf=pass (domain: burtonini.com, ip: 209.85.221.49, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f49.google.com with SMTP id e12so419738wro.11
        for <meta-arm@lists.yoctoproject.org>; Tue, 06 Apr 2021 02:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YWCJmTKc1GisL8PGfrEX1zOoWvLei8xibBFO6OyUCCA=;
        b=TZZrT/+mNFDn4vGFVZXLdODVRbcWQ1t3BOAnvzjHYOUMpIKP77UWX8G2vx5029MA9+
         DxJO3Q59BlL83g8YBNVZqDMBfoInIf8i4tAPiIXTh/SMipndOFoqXVoiuXzt0p2/C469
         9VgWZVuvKEQsJeMtF76pCmxat3iMeizi4Tap0XaTv1756sk/Q22GEi3ThVAi0NErEbPJ
         5F+f7g41mzxg9xmGP+lVHpS8lZdilBQRFInb0bDzDXx7MjUoIfVQCvDaFUy2g0omYI/J
         sFmCkPcFM6/6qPDQBUHlrCHdhFpQZiOQH9aZknRbulXG7y/EGwwCV2hgkxi7cDJ6jK5l
         6uRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YWCJmTKc1GisL8PGfrEX1zOoWvLei8xibBFO6OyUCCA=;
        b=DCTbgXMBl3tymJeG+BQ020X9uxTiuRRzTvllaqqcU05X/x43uxlpi5jkaVQxSixfu0
         j7XFtm/zBcE1wU7vKC+MyumqUsQiAB9PcJ70+rUI7GY3bOXCq4qERJfu4cuuI5rl0AbG
         bgB7NF423U8dlClT0ESop8JwBK+DjxaxS5d5a9Qz3EeXC2uc5a5iGzwDFzLV9I/3B9Bg
         uH5pYNXaKKLMPtzaO4ngsrP5yjsxji87ErV2eWAwkvn/tm+j9/X7BX/mSjx2JVX5xY3e
         HUv+bEZ4o80Da12R6zUSpTT5PIy1ccodJqd2VV368SO4K/9QPjVKFjVuVeIyrI5ofSLR
         M/PQ==
X-Gm-Message-State: AOAM532aQOUPZtSgmdALfENUxODYbkS8jkpMXjiLR3kLYr8Bpona32Lb
	pW2MGo8cpa6lGvBKXHY/VqChhlOWUYMpq14tbCKHRg==
X-Google-Smtp-Source: ABdhPJzfA8EGbaq/X7zJzTySWEMlvld53JeSmRr6nTdXPiFa8X2J8+9piHHLgogEY4raLVMM0wOEmS70j+HoZzbHyCY=
X-Received: by 2002:a5d:4ac7:: with SMTP id y7mr34520388wrs.395.1617702234428;
 Tue, 06 Apr 2021 02:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1soZtavUBVCiGjFdOWU=LChYs-yUX81LTr1Jqcj7CxHUtg@mail.gmail.com>
In-Reply-To: <CAMKF1soZtavUBVCiGjFdOWU=LChYs-yUX81LTr1Jqcj7CxHUtg@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 6 Apr 2021 10:43:43 +0100
Message-ID: <CAAnfSTuaWcDA66CA9reeST+2LBk1eqvccJEhjDRkjqeG0atKZw@mail.gmail.com>
Subject: Re: [meta-arm] sbsa-acs failing to build for not qemuarm64 machines
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Patch incoming.

Ross

On Sat, 3 Apr 2021 at 01:19, Khem Raj <raj.khem@gmail.com> wrote:
>
> https://errors.yoctoproject.org/Errors/Details/575311/
> https://errors.yoctoproject.org/Errors/Details/575302/
>
> is this recipe aarch64 only? if so then it should appropriate
> compatible_host
>
> 
>
