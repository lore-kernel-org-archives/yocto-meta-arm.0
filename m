Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web12.51941.1606224911073076494
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 24 Nov 2020 05:35:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=1AX+EvXu;
 spf=pass (domain: burtonini.com, ip: 209.85.208.196, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f196.google.com with SMTP id j10so9588834lja.5
        for <meta-arm@lists.yoctoproject.org>; Tue, 24 Nov 2020 05:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uWQY2xD6PexVgp42Zdi8+rxJCq9IseYg4aDGsz502f4=;
        b=1AX+EvXu3qZRSJS5qYHY7uBv/JbuolfP2U+qZTyowI5dE9HddrAVLqGSmuc+fVZUMk
         2M1c2XGQh0FzthicFJtemHRFVcl4wW5z1ufdS1OtSgS/hqChmiMGSbDT0GhXJ3FH1HsH
         6SNbIJoCpWKQtFOgcFUKGY2yHrhD5s82wiltIltHk2+rD/TcLiTMW9Dbv8YDiKb+UBch
         OuyGU1XWdVzEEcyTqarkojtFUTAE2QGTuUpDubNyNvask4xHUq5TQixQ3gH/SOZ4gVRB
         rUFYpkwXydvzLOBnnZouIGhPAUGDJ0taujsuXh7diAVTMho4BXTZ1ex5d0J0Khq8vPGB
         B6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uWQY2xD6PexVgp42Zdi8+rxJCq9IseYg4aDGsz502f4=;
        b=onUUEapLXad7wHr0k4KpompbWYt+LcXs4dC+NBa/nMiKUyWYlemwbkgxrxn4aita0g
         l4fs86FWTglfZVbH6m9v+r0x/yy3nYydC9f8lZ0pHb9oelDLBRqr9DFveA9o+EG5cnGv
         WdADewOgyoHMj9PMk1usdHZ8bBVTQl2TQU/MkOlB840fDDi1WL/kcoiAnrpN8FXLQGL1
         M1g8MhuKFgEn3umm3wu/XQC1eKzvBAO2M+coDO+AZ7mUaNdPfCkloWtVvqVnituCW4j+
         q4VCPNMTfKaLcvnc5Tu63CCaKw6GwAr4HpW/BuT8HuPGcZHptinLgwFl9HSW/YnZ0VNh
         a5aA==
X-Gm-Message-State: AOAM533HZ+oYV/k7l4BK4SlyQqG4mfBmxkuzhL2Ndm9Z+Z95sDkeAqIR
	njqiSMg1hWWJOc1OA0QB0ohxXBvdX3bErbvxJ0m3Rg==
X-Google-Smtp-Source: ABdhPJydLM3PjI1UythwFQgVq3jPUHiVXvonnaESNG+eIjmEsx4IRq9HhhGaPn3VZZAsnfgR6cX1d51SdIQqSFa518E=
X-Received: by 2002:a05:651c:2005:: with SMTP id s5mr1879411ljo.36.1606224908867;
 Tue, 24 Nov 2020 05:35:08 -0800 (PST)
MIME-Version: 1.0
References: <20201119084505.2718682-1-ross.burton@arm.com> <20201120161203.GB4483@kudzu.us>
In-Reply-To: <20201120161203.GB4483@kudzu.us>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 24 Nov 2020 13:34:57 +0000
Message-ID: <CAAnfSTvkSsqT_m6b=EFr1fbA2rjs-eKCg43Pi2nrr-G6R2xe-w@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/2] arm/optee-os: add CVE_PRODUCT tag
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Nov 2020 at 16:12, Jon Mason <jdmason@kudzu.us> wrote:
> Should this be applied to dunfell and gatesgarth?

Yes, please.

Ross
