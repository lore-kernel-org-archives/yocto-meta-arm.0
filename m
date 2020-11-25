Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web12.6286.1606308661633740003
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Nov 2020 04:51:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=jNxe+cel;
 spf=pass (domain: burtonini.com, ip: 209.85.208.178, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f178.google.com with SMTP id b17so2126272ljf.12
        for <meta-arm@lists.yoctoproject.org>; Wed, 25 Nov 2020 04:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MmRS9qGPsnwRGeXCz0KwITtbu2JiGdXUHcd5Xh4iUr4=;
        b=jNxe+celT6jLGafw13oZux/um9zsoxZzgr0VPAHBhlA3pUFx5bRra1BLFH25IgHP2l
         kXpRtrfgezN77yvPDIntzQkQTw3zF13ZjteErR6OE+brgpGW306lBPuVq0+yd6MeOg6k
         sF6TzVNPPaiYH0n4WLqWa9tJUjYaIF9wR0KPtgRa/uCnWFJK6KFeye4N0+KmOt+CkhKQ
         J2c0tMfV4JY6l7uzMt3aYH4MVkUu58jS3fMIXZKElqxoVZlbGT3Yrx1f61+WG9C/oBDP
         A0esvupl9oiBKyhtdQ/Ud80Ci3FdrD5oCFjaIw8CWiR3K0ewZJmMp64DDswNvOY875QW
         Lf1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MmRS9qGPsnwRGeXCz0KwITtbu2JiGdXUHcd5Xh4iUr4=;
        b=new5RxikQflO8NCOeRAtUMFSDmhhMORYwF8WTJM3e3bzLrmjd4uAkwdWvYH7thK+Gy
         fD4DAdHC5OLfH4NkcNVli//m50LFpBQWUkGfv6gkIwe/+SyxQOq6izEwq75dF3R9G5w6
         VXRPaVD13VgnQ12uZRvD1dlE2B2jnBtKJA6blco+7ApQ7jiyPMrUsp8mZ1UwD4nu0Hq5
         fhnZadjM4E9ieKJ2QBd6BsVtSK1MDrWr3khG7qt4hccm6zOK7jH4I9ZYeXF5AJaSVfxE
         TnH92xrl/u2LWGEPIJGv/JczJaxrBS6pPyg2enOV6dZYiobpVZd7WT1+nrTB/PuTLuy8
         j7uQ==
X-Gm-Message-State: AOAM533fCoQlbc/imnikYhT65/Z5r3AL8AJuaC/dTTxP14DTuO6wLqV3
	otN6UJTlRt450otXzEzpFrbHjWrU/uVXt+IIDP42Zg==
X-Google-Smtp-Source: ABdhPJyPW5xYI0KjthCPEBIq2H33WB1fWK6AH7Bks2BgpmnFG5AI2RB6jEHWH5b0J07LMQXeFkGqL3IGEooKHS2fFPY=
X-Received: by 2002:a2e:89d7:: with SMTP id c23mr1262957ljk.397.1606308659615;
 Wed, 25 Nov 2020 04:50:59 -0800 (PST)
MIME-Version: 1.0
References: <20201120113725.30265-1-kamil.dziezyk@arm.com> <13381.1606226535861892295@lists.yoctoproject.org>
In-Reply-To: <13381.1606226535861892295@lists.yoctoproject.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 25 Nov 2020 12:50:48 +0000
Message-ID: <CAAnfSTs3c7Xdzn1vWxWz6PfRnTKm3_fHE_unKu35dKSb+ZGGjQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/2] arm-autonomy/firmware-image-juno: update offset addresses for NOR flash images
To: Kamil Dziezyk <kamil.dziezyk@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Both pushed to gatesgarth.

Thanks
Ross

On Tue, 24 Nov 2020 at 14:02, Kamil Dziezyk <kamil.dziezyk@arm.com> wrote:
>
> Please backport this patch to gatesgarth.
> 
>
