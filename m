Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web12.43905.1597064280729089813
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Aug 2020 05:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=MmNVqk2+;
 spf=pass (domain: burtonini.com, ip: 209.85.208.196, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f196.google.com with SMTP id t23so9448654ljc.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 10 Aug 2020 05:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5AMf/mneRdZRCHgLOT/sKjiwFAxWlcPz62P9EEtt8KA=;
        b=MmNVqk2+VsTwl88lML8nOfWp1vWqqRtFrk65hFqapXHLVZNUX/JVmjOaRpT0r/GlhW
         CJoFy1dQb5ZBkYDKRE6U0PbzYK3DWGWNLQ8nGjjYtMFnRE2uHzKAxR9WMHjxW3jxYR+S
         pq21sySFSUvNURknQiJAai0wlK0F9xBqodJQp7dTzyBF2YSHJHh2LoG+HdqN8pgOaf9v
         jhnHlZDEj1zH+gCrkH1LhLJeicq1TxFzCfbU7oG9LKo9TggrUretGDq3UkObkf9Mw35o
         /KzFYpJsrFbcTXoTupAewvhxwM0ObssUMt2qrgyI46X8CT47d6HKyMx7tYOWDLllsj8N
         Mt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5AMf/mneRdZRCHgLOT/sKjiwFAxWlcPz62P9EEtt8KA=;
        b=Vc6zYyjuXOoLUr1LiV28C5boXQ7a69JaJBleksU+v2JinTm5U3qeMsFiIhmTrOysUV
         Y5wbPYO3hFmchzvtErKLRypyT+o1rD5rKwcMLP8PGu7XR/Rkc/P1l227in1ucDCQOBZB
         JZMC+GfOpjsIa/mdGC5wMPP2Ii5eLApucvoC+u4fSIeaUnYNvdCggv8rTxtMnVsXEH0a
         YWAjAe07CAJQT19Cf9gwIF/ZHzqK4bVn7XK/w1fvu2PWHOE9VVP/q1STH1ZY6r5Q3KGk
         s/QxxRBCtRu3G93R/S4dzYOBxYz0aazdiGYLj1ElnqoexyGY2oVX0cwkWP2RvW/pHShg
         KoIA==
X-Gm-Message-State: AOAM530m0D9l/t1zvDIjhpszxZGFtM/lONTKL/XzbL+LeQuP+10a1NLI
	rZueu1RIGYPKZAB4hMGdUEjXHfe9WnU8nTYbrplQ5w==
X-Google-Smtp-Source: ABdhPJwjQMQChJznpOj7ZzDE2igGBJtrXTLtkWM14H5r5mdVgR3P76MsoTklIkWkW7fSshKg639TYDZ+4o45y0Rj75w=
X-Received: by 2002:a05:651c:1122:: with SMTP id e2mr518258ljo.36.1597064278863;
 Mon, 10 Aug 2020 05:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200807194253.14748-1-abdellatif.elkhlifi@arm.com>
 <20200807194253.14748-7-abdellatif.elkhlifi@arm.com> <20200807223936.GC440@kudzu.us>
In-Reply-To: <20200807223936.GC440@kudzu.us>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 10 Aug 2020 13:57:48 +0100
Message-ID: <CAAnfSTtw_tPcMZbSjikVUV221vFRA8LKqY=HJa-8xvfbYJ5fHA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 6/9] arm-bsp/u-boot: adding corstone700 platform to u-boot
To: Jon Mason <jdmason@kudzu.us>
Cc: abdellatif.elkhlifi@arm.com, meta-arm@lists.yoctoproject.org, 
	nd <nd@arm.com>, Rui Miguel Silva <rui.silva@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Aug 2020 at 23:39, Jon Mason <jdmason@kudzu.us> wrote:
> This patch breaks Juno, a5ds, and fvp-base-arm32.  So, I'm asking you
> to correct the issue and resubmit the series.

I was wondering when the layer priorities being set as they are would bite us.

The root of the problem is that oe-core has priority 5 and meta-arm-*
have priority 6.  Where there is no preferred version, recipes that
are in a higher priority layer win. So, meta-arm adding u-boot 2020.04
promptly downgrades *everyone* using oe-core master (with u-boot
2020.07) that doesn't explicitly pick a version.

The correct fix is to sort out the layer priorities.  Patch incoming shortly.

Note that this doesn't solve the problem entirely, as there are still
warnings when building a5ds u-boot:

WARNING: /home/ross/Yocto/meta-arm/meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb:
Unable to get checksum for u-boot SRC_URI entry
0001-armv7-add-mmio-timer.patch: file could not be found
WARNING: /home/ross/Yocto/meta-arm/meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb:
Unable to get checksum for u-boot SRC_URI entry
0002-board-arm-add-designstart-cortex-a5-board.patch: file could not
be found

Ross
