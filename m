Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web10.967.1594232205343471792
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Jul 2020 11:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=S+wMc0zj;
 spf=pass (domain: burtonini.com, ip: 209.85.208.194, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f194.google.com with SMTP id s9so55301256ljm.11
        for <meta-arm@lists.yoctoproject.org>; Wed, 08 Jul 2020 11:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LSJ5+V9UPXbdHJqv5pQWGbHK70rTBdpvgslTQNKVdtU=;
        b=S+wMc0zjl6beD+xqCLkMSMEXRJiff7mNhzQ0n/TjJPBmwzQ7w7g+vW60C9+gikMbU8
         j1fnN8kSforVhAqc+ZXzzOLSb+07mmrQ/chtzrHNn7Q4nX2i24KCrCbbzz95Biw7SPCY
         EoxOHUiWAgnDf8Ax3opOxBPM1wrOBrlbTBYv9Nk0TbmgVg5V1HiSWOsz8KKbdgBMwato
         3pSHpv9CxmW0nguCabJ4zT8xqqQIlMrSmV6dRRR8a8ZBZBB1jVPWI32lImrz/5OvdLAz
         jqDGhh2FWU5kxv9fxnIs2vMOKNnjTDLHHssh17WaI2AAQQ5LTKO4yxOsWXZ8prtoT8Lw
         f+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LSJ5+V9UPXbdHJqv5pQWGbHK70rTBdpvgslTQNKVdtU=;
        b=VIY7MOKRPUkG5eoHVOFJf/gMpuIiIu9ZwAV4oWUsPuKoN8ml0GA6FKYAl2RhKxGhya
         cgbjcbThqLp8x19GvvNQxRhI7GHBEdyRxKJrz7FNIXTjllGKSVffAoAyw0OgfAz/1qgc
         462LVa+cF/d4AiGPX0sFLsugUHWl8KrDq75+QYMhnzZ/BCF2KVxHsXxGpm/j6mjIwOCL
         TW+bCa4gdV1OSjpUcEjIFYv2steoOvzzRrWCmDn0vLHqjzkFvZgnTMsDyZIZT6gMumFD
         zPSjgqJF1074oHrKcKJ16K3U8tGvV6LHhXxnrO6aujU4Te63p3AZLeFxwQIrlzOmZhqi
         C/7A==
X-Gm-Message-State: AOAM531NYpW9w1ubUjtWnfO9uhJcxHJMfD2T68YAvLHcYrk3SVtoiPwt
	ccO3g+O9DWGzY9G1GRgvCNyWVNksghEHR4G8T6fyHw==
X-Google-Smtp-Source: ABdhPJxwouQ3gwZ9khDKW3xYdX5Uqjbp0mQpGXixy2vbnH9GH93EbLidRb/iW7VXuvQaLYdBdCR8cXxCiE1h9/jaZoY=
X-Received: by 2002:a2e:3211:: with SMTP id y17mr22722852ljy.340.1594232203495;
 Wed, 08 Jul 2020 11:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200704154301.15546-1-jon.mason@arm.com> <CAP71Wjxp9P1T-gKehWz-eio7JD4H8_DhdvorEtiEf37L49cY2A@mail.gmail.com>
 <7372fed9b3d2942e5b3b2a2e9cce9c3c55fea53e.camel@linuxfoundation.org>
In-Reply-To: <7372fed9b3d2942e5b3b2a2e9cce9c3c55fea53e.camel@linuxfoundation.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 8 Jul 2020 19:16:32 +0100
Message-ID: <CAAnfSTvp2LPDtZrtTvmeF0A8tWUQ1=4ueT0mn-MbDAm1R-Ockg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp: yocto-check-layer fixes
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>, Jon Mason <jon.mason@arm.com>, 
	meta-arm@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jul 2020 at 11:02, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I have to admit I saw this patch and was wondering that too. Unless the
> recipe is already machine specific in core?

Good point.  Do we get points for finding bugs in the check layer tool?

Ross
