Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web11.1530.1589318547727051381
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 May 2020 14:22:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=t1/wswTh;
 spf=pass (domain: burtonini.com, ip: 209.85.208.195, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f195.google.com with SMTP id g4so15381832ljl.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 12 May 2020 14:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t2AobzsjAkDwKml+06cbnHlqaFvYMYlmo4tAajQmIRE=;
        b=t1/wswThEouGTLROnVc+y4Ep5WLGftn7tl11oiFlV6RMgoVby9AYl90ER15qXXVPEc
         EWF7SbfDiF7K/fY2DQTVxinpFgNIqwNkfQOc01OZISc3P3BLqADSSyjngxNIHxMTagfP
         Nf7ZO50pyFpNkHhzLqsX5ogY9RTjKrDtRvxSS4qEzXm5Rc15e6pGTgvkT0vBOSBXHN6Q
         R9wFpiEQCKIiQhC3gmavWje6c8hytroyozezBjE2xZY+/SHdAU6MpJbaacNYoFv3TPFF
         WUDvijsLKpSLKr4YDRPOSQcwhcEdzjVlFl8c7attVxRieL2WibUPHOAhXA4nzODXXPnq
         GUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t2AobzsjAkDwKml+06cbnHlqaFvYMYlmo4tAajQmIRE=;
        b=dbpEfjuv77L2kulyH8CShZLx6Q3CLhXURBj+9XsrVXiQZpPUGWajwlYyoOcUnO/C0w
         NH3EH7KtXbmiUBAHMccvscOMqNOAr29aEV7qEvq+Fxp0wrcxv2oFvY1OxZDH9T+rMaVF
         k2fdF39TKl29Qs8aNgYy4JCHh2d7+uwVi2O/cdhPC/epdc5jCyc6TqMYiNyRyCkETHec
         pk2JPZlruiE3nsUPKnAwRwktFwYssTRKMMi7p5nTWk0gFROIuIDOlShTenjwsRbImSpr
         Tk3eJTtA+URKo6boZrgY0ZpSlms8rX/WQhgwk1ZTFQH+UZO4xYmIyUc1cWU0p9sIPyxa
         X5Eg==
X-Gm-Message-State: AOAM532u5sJYpUOS4a6LpIYvx7gT2dRlZBGThIg/lU6aKjA2D3fd+Nbe
	PXlm4ExM1dUjTLZO1F3VagYQW2MrML3QIsuCZkWIVw==
X-Google-Smtp-Source: ABdhPJz7eUb+cuAMh4V+Br3Hli4qc6BLjI7J7ZiUnccNHNOkUFGU1rbSwbgX2BeLNoZRNdu2sMwYfgnFdr2qUqu37xo=
X-Received: by 2002:a05:651c:201a:: with SMTP id s26mr723918ljo.207.1589318545784;
 Tue, 12 May 2020 14:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200511142604.11860-1-JPEWhacker@gmail.com> <20200512211219.19262-1-JPEWhacker@gmail.com>
 <20200512211219.19262-2-JPEWhacker@gmail.com>
In-Reply-To: <20200512211219.19262-2-JPEWhacker@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 12 May 2020 22:22:13 +0100
Message-ID: <CAAnfSTvCvLvO_8cPMvCkCkN7r5HxMzR2TPx0aqWkS2WY9JPLYg@mail.gmail.com>
Subject: Re: [meta-arm][PATCH v2 1/2] trusted-firmware-a: Build out of tree
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 May 2020 at 22:12, Joshua Watt <JPEWhacker@gmail.com> wrote:
> +B = "${WORKDIR}/build"

You'll want to do_configure[cleandirs] = "${B}" too, right?

Ross
