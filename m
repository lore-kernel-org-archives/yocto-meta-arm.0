Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web12.35669.1610377435200944388
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 Jan 2021 07:03:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=XRtcd7HQ;
 spf=pass (domain: burtonini.com, ip: 209.85.167.54, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f54.google.com with SMTP id s26so38103870lfc.8
        for <meta-arm@lists.yoctoproject.org>; Mon, 11 Jan 2021 07:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UC75vO+lhMHjwnFfuavrIq2ZYX7NrAVo0RYOB3Yuetw=;
        b=XRtcd7HQwXXwKrUctRQ915Pm0/fA+bNT0S7IMG7LKTBCfNiSqzp42kzZAf4e0JSbwt
         wUZ5O50uqADnUqNY0FxSs39HEmZ2JCOk/a8AO1He4lynIvwUlMTmFmMxTqGBOYmFmA+D
         kHbd1rZDt8X/jEKBRBbduqEPjJ376jgJhYXRCBuNb1mnw1ttTT8+RyQdSB1eHx+yWMb6
         rcux0kkhKEF14u0dVlnBAg8q/8JycM0/xaZ36k+BItsLNlPJ26I0f0Zn0D+jJkOiSfM9
         0xwWBgZJL/rA5HgJYWZ2yD/YaYfu/WgQYr2w1OV8Rc48fwYHRf6VtEj67hm0OqsQNym9
         0CMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UC75vO+lhMHjwnFfuavrIq2ZYX7NrAVo0RYOB3Yuetw=;
        b=lk1U+GyBfPKw3WRYdL/fHctNhNYZ6GxgoccfAVwzYgPN1WrUFFez8vdZj/2kwupAZn
         Mg92bsapYaJjMH2ESWuNAoYFiNZ33VGEDlhK0QhgP2nPL5svtMAhK+ogUMQhuvdSCiRc
         XCSN+76S/wULaANLTJvLm6SqSRnEmz0e484zlg4oEpEK+t/MqfJmqwxXQH0CW7TEpSbq
         pBLHrAZlV6cNGHeCOehdEQif13sVb/Mn34KtCc5ERU7d1+yCTc1wWWGrhztWBYaLDqwu
         JikA4skg9Q+GDdU8P4mHdqh22ze55utkbapOvwoDlWb6pMJiC88dAxdxixwiEJG2bGbd
         TziQ==
X-Gm-Message-State: AOAM533/W0NpbQP4JvU5HLduFxemoj9qLSilULQ6sgZh/ezwlaDCz4X7
	NDpSSu0x3RoLhUEipaa7w4GpuQO6qe9EcYP1dg6wdw==
X-Google-Smtp-Source: ABdhPJwP78CD1WXHaDMLV0+eLyHPO348IiUOxt3A/1VIvaSg4+R9FePgQTLcMhtr9o9Mn1QRpYYskNovXBiokwpk5tA=
X-Received: by 2002:a19:4008:: with SMTP id n8mr17656lfa.660.1610377433274;
 Mon, 11 Jan 2021 07:03:53 -0800 (PST)
MIME-Version: 1.0
References: <db7M.1610369317172636984.vXd0@lists.yoctoproject.org>
In-Reply-To: <db7M.1610369317172636984.vXd0@lists.yoctoproject.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 11 Jan 2021 15:03:42 +0000
Message-ID: <CAAnfSTsnLJ_nd+f335Fj32T6AaZMeFFriystRft0GKKjf4YwsA@mail.gmail.com>
Subject: Re: [meta-arm] invalid characters in license '${EAT_GCC_LICENSE}'
To: Piotr <piotr.piwko@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Jan 2021 at 12:48, Piotr <piotr.piwko@gmail.com> wrote:
> I've analyzed that and it seems like there is missing a license.inc including, as it is done in external-arm-toolchain.bb recipe. The same issue occurs with EAT_GDB_LICENSE:

I've not really used the external toolchain support, but license.inc does exist:

meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc:EAT_GCC_LICENSE
= "GPL-3.0-with-GCC-exception & GPLv3"

Ross
