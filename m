Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.8308.1616168566126824263
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 Mar 2021 08:42:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=tnr51djg;
 spf=pass (domain: burtonini.com, ip: 209.85.221.49, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f49.google.com with SMTP id t9so9551478wrn.11
        for <meta-arm@lists.yoctoproject.org>; Fri, 19 Mar 2021 08:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ErPumZ929+b1owpjXcTrymZaJmXVbxxj+buaqSYwWE4=;
        b=tnr51djgDl3JqjMjcxyIyltVaMqbXAtpyF/zj5lw9lrMgPh8uaJXNLh7N4k5U+/Grb
         9F1bM/BWaAZX1SmgF63hXroBBvNA65gsJGqUgj1NZd+VHB7iCPx7wj4UL2N1I39u/C4s
         YuUyhlRirP7wrs2GRhZBSXpfqfN2SRlKX3dMoJTmkWKbgqPWCGwOToxtPVazlrQquKpb
         vTuL273YEWdu1yw6z3zuzC0vLE5lPvHIJokwiSqEGaH1SOYlRuVxbn653/aVbDJgoK2S
         lmz4AmFbZ1J9lffrfXrnFr17Rwk7Fh6ZYU9+D3IFFPXfge6Ja1N403W5NHrUxcTDy7BG
         P+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ErPumZ929+b1owpjXcTrymZaJmXVbxxj+buaqSYwWE4=;
        b=fjFnC6M0JEfCy3r/JHh8OlHdxlhYwOSJpnjn5ao7lyR/NNYnPtbQkxdD2y3lui5h8K
         wCA5YfK8jVHcZCam4V0r9nNimnjdmZG+RoLz4K0CsEg8g/P1pcDB2htrlHG3Yun7bZT8
         ecsNUuByattIR/ZZnzCnbjjRJnXhHV+jr1dcRPs2jdWqnshsASyYrn69+GWq2uolUUUU
         7rN3ZXtavdxmX4Bn2cFLKHfCRVmn6IEQmlyKndZBz2oSRlS2v628bkWHpyQEuPG94dpH
         1me1VA51qIJ+iRZXUxov1eLlNTMQhukcVJ6RTxj1bxBQ4yMgFKz5eCGD12II5TX9hEQk
         Si+Q==
X-Gm-Message-State: AOAM533oy2UX1th0Apm0OuEAFMXoncsL70v5LkdiQb/zg/EBnmolQ0fZ
	cxY2EzJrNpwfSnJjVvKzLVG/fP1oVA3mPdofnVgadg==
X-Google-Smtp-Source: ABdhPJwnMu/BPJcO/6Ru6r8dqJDxXb8eeDbZStOzCvrGj9gE1vC+1Dw48d7dq26z8KSPaHP84wPR0oNh+VYUz8XNrUY=
X-Received: by 2002:a5d:6404:: with SMTP id z4mr5268448wru.109.1616168564388;
 Fri, 19 Mar 2021 08:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1soMNKrKD6Pi94wu6KHUE83rY-zDdurWRtJjbOb=pXDmaA@mail.gmail.com>
 <20210318070302.GU18041@denix.org>
In-Reply-To: <20210318070302.GU18041@denix.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 19 Mar 2021 15:42:33 +0000
Message-ID: <CAAnfSTuWmZ8+YgEL7fzKDSvT_Mvi-BmfkxrmuaBULcGFsZjWMQ@mail.gmail.com>
Subject: Re: [meta-arm] python3-intelhex recipe duplication
To: Denys Dmytriyenko <denis@denix.org>
Cc: Khem Raj <raj.khem@gmail.com>, meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Mar 2021 at 07:03, Denys Dmytriyenko <denis@denix.org> wrote:
> So, it was meant to be temporarily.
>
> On the other hand, as one of the consumers of meta-arm, I'd hate other
> BSP layers that depend on meta-arm to also require meta-oe/meta-python
> dependency. I know we've discussed separating meta-python into own layer
> for years, but it's still part of huge meta-openembedded collection. So,
> my vote would be for #1 above.

python3-intelhex is only needed by TF-M, which already basically
depends on meta-python, so this is basically moot.

Jon has a patch locally to drop the recipe and we'll use the one in meta-python.

Ross
