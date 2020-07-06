Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web12.2941.1594070615047669393
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Jul 2020 14:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=j6Yxv8Rv;
 spf=pass (domain: burtonini.com, ip: 209.85.208.193, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f193.google.com with SMTP id f5so31479082ljj.10
        for <meta-arm@lists.yoctoproject.org>; Mon, 06 Jul 2020 14:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GCsMoGqEqpM51qRRkAyrsljDSv6WF5gqf3MLCn/zgCk=;
        b=j6Yxv8Rv/n1Gm3XTkgLqMpnlUtPljmV5gKPH2Isw/7LQpeE+rY5OrDROVESLgq4HVw
         7EgFvC4u+9aQxZMQ4oncsSWj06cHBa4xzl2G3du9xKM0cyqFnG0kuc7hkO8Y4HSGr1w7
         a8To07irO2qjz5f5D5spQlg8kpjJWY+Xbyj+fKAQ1u6Iu5QrVvyFf4mCjgn20tkbINQ8
         ZdTeXX00+aGNRUKXIufQDG56gnUlfSiqJ8kLHgkXCPZgmqmbIbrDByeutMjbWAzwB3Hj
         g2WZpQ6Ne8l5WI2ekcDZbTKlH2G4SmSHOnvrn4Xgtu0JAtT8JlATUN2l5yFlYBYR8wn7
         i/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GCsMoGqEqpM51qRRkAyrsljDSv6WF5gqf3MLCn/zgCk=;
        b=dkmvZpDjXj5nLltDGHmPAJlb3yPF49I56j6IM1uSkTSH9Y1cU4jCr85YgBnG/ecVac
         /862VtHAoQthhOeNIyd401sU5yCdcRg2Gd/9TiO3IPSx9w+lrhQ+FAH/jCS9pB7SkUq/
         dR4EMeFs3iH7vQuvwzy5FkyAfv1z8Ae1H9KBUpjAcz829VMLCTsFRyUvXmMfCC6U1byV
         vsN/dZ4/ZF444dk9wWF8wUOHMZSs7g9cnzcePhLrG9oxOKj0R9Rsute6T9y08PgfBCgX
         f6Xovo44RE4wS4mzBYO7EljuzJW67rnnB0xYj1kSqnmyP0ljOrGcdnmBIvFI1JkhQpaH
         0x/Q==
X-Gm-Message-State: AOAM530Pplw/+e/X2WXwMzHhmkpwrkgU2SAqJ/GfPPMjRHVl7cj0PZIZ
	CS2gLX0/c+VDtdTEx2hl+XIECiwUMVxLNeGkY+sKDg==
X-Google-Smtp-Source: ABdhPJyivgmzP+4kix8Wh6pngx5C83kHPdEM/eE0WCwXFEqA2X2ypWe1JuDF00kPrMadv3l5RpchtaQsP60l2FMuN1g=
X-Received: by 2002:a2e:9908:: with SMTP id v8mr24188135lji.186.1594070613192;
 Mon, 06 Jul 2020 14:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200703145233.2494070-1-raj.khem@gmail.com>
In-Reply-To: <20200703145233.2494070-1-raj.khem@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 6 Jul 2020 22:23:22 +0100
Message-ID: <CAAnfSTsByeHUS9daP_L7M9qF8AhMdPVP9i+ri9b1ZzV8VCkfGw@mail.gmail.com>
Subject: Re: [meta-arm][PATCH] meta-arm: Use dynamic layer magic to build trusted-firmware-m
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 Jul 2020 at 15:52, Khem Raj <raj.khem@gmail.com> wrote:
> +BBFILES_DYNAMIC += " \
> +    arm-toolchain:${LAYERDIR}/dynamic-layers/arm-toolchain/*/*/*.bb \
> +    arm-toolchain:${LAYERDIR}/dynamic-layers/arm-toolchain/*/*/*.bbappend \

What I dislike about dynamic layers is how nested everything gets.
How about something more like:

BBFILES_DYNAMIC +=
"arm-toolchain:${LAYERDIR}/with-arm-toolchain/recipes-*/*/*.bb"

One less directory level, and all of the dynamic layers are at the
top-level alongside the recipes.

I'm also still unsure why there's so much pushback towards adding
arm-toolchain.  It doesn't do anything by simply adding the layer, if
you don't build tf-m it won't get used at all, and I want to get rid
of it anyway (using multiconfig to build a gcc).  Can you explain why
this dependency is so important to you?  I'm obviously not
understanding something, and I'm on the record for hating on binary
toolchains over many years!

Ross
