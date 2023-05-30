Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3E4C77B7A
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 09:57:31 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.6094.1685440644520362109
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 May 2023 02:57:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=p45fz6f+;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: peron.clem@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4f3b5881734so4764425e87.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 May 2023 02:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685440642; x=1688032642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49dWzkjuNWHSkI0YOx+RV7Bsaq2YhzsvKaESsX/5cOY=;
        b=p45fz6f+XFypayi+6PyA/6RdlJSzPDgom9Qumkcdgt4d+KD/6v+3fdeMFsVKX7+cpq
         mkfvr3C5KHMeqXeOddfMVm7+VAz0p9oOdgsfwm6hdPwu5jSk/Eqh+WR7H1549GvnxAoR
         OWNishs24mL33NpmWT1rKiFiVyDzKQpbw8ABcDBf1NfJPAHwHGxQfrudsblgPaNzyyW8
         YfEn4KOuSHuuHM8V3E0b9jkEPdRB18a2AndUCaqnD+L31m7iJJsRNm6bhnj0uemr1VZa
         8wOVmSAiHrBN8RMogUVoSQOJ49ArbjBJJqrvYR4/8iEDKzpRXA2I2dZMFH4z/SKH/Nm5
         NSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685440642; x=1688032642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49dWzkjuNWHSkI0YOx+RV7Bsaq2YhzsvKaESsX/5cOY=;
        b=L3x4k7DygJLZC0h5eqYT/gJblNMVGSyDmDfpQ8ioXGbnE89F0mx6GsMSUckgPbLBKA
         WxhsiuSKNxzoZLDj5RJQSARhjXCYxBSpoxgfB7CqmWSergZxWtpu+HNuW+fGrmOfZtq6
         ckfF2VK5lq4fBjRKMvhpBVyxADTVlNpax7HMzxpZ1X5Wn9TYm0yOI2g/r0xI5jygjgT/
         G4wFaY1G5xxrK/ZHfFSJbXV9XAj1/aKjwQboLuLFI/Uk5vqNjb6msg5dDJ/XvAeaaoYl
         zJKWvytGwqQDHcT/jcGLZWOSUJ9E0jMIBv+RbZEZ1Z9kq7YTgvm/Zfi2y0g6if99BalH
         8c/Q==
X-Gm-Message-State: AC+VfDxQe3a26lkyyoywZW8jDoMdXnPx9737QTWUJHPZIPgKE4Eev0tB
	6shPgLw9whL78//ulXRK+JjyrvKlx9WjVlGrcnc=
X-Google-Smtp-Source: ACHHUZ7boiuKU7BDg5Au1oOsSInJInSnm5e4j1VnquYr/bIJco+kzBKVlRpRWBXTeUYBnSjctCw6rUR9gtKRT7cJq3Q=
X-Received: by 2002:a2e:924b:0:b0:2a8:a6a5:e26e with SMTP id
 v11-20020a2e924b000000b002a8a6a5e26emr530240ljg.20.1685440641627; Tue, 30 May
 2023 02:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAJiuCcdj20VWVHkAtiTB_VA9ENssbF_RmaWaxPNvBoPQC7MbNw@mail.gmail.com>
 <16f91472-4f18-e8f5-38fd-e58a0a2106ea@arm.com>
In-Reply-To: <16f91472-4f18-e8f5-38fd-e58a0a2106ea@arm.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 30 May 2023 11:57:10 +0200
Message-ID: <CAJiuCccN=N+6czcF7CqOOWHyUNh=ttTruSjgZ3Z1UmhTdsSXAQ@mail.gmail.com>
Subject: Re: [meta-arm] runFVP with FoundationModel
To: Peter Hoyes <Peter.Hoyes@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 May 2023 09:57:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4716

Hi Peter,

On Tue, 30 May 2023 at 10:13, Peter Hoyes <Peter.Hoyes@arm.com> wrote:
>
> On 29/05/2023 14:41, Cl=C3=A9ment P=C3=A9ron via lists.yoctoproject.org w=
rote:
> > Hi,
> >
> > At the moment I'm running FVP with the Base Model (FVP_Base_RevC-2xAEMv=
A).
> >
> > As I understand, the FoundationModel is much lighter and I would like
> > to test it.
> >
> > I have tried to simply switch the FVP_EXE argument of my fvpconf to
> > "Foundation_Platform" but without success..
> >
> > My machine inherits from "fvp-base" and as I understand it, it should
> > be both compatible with Foundation and Base model, right?
> >
> > Before looking a bit deeper, is there any documentation of script that
> > could help me to run the FoundationModel?
>
> Hi Clement,
>
>  From a quick look at the TF-A device trees [1], there do seem to be
> significant hardware differences between the Foundation and Base/RevC
> models. I'm not aware of any recent BSP work for the Foundation model so
> it would probably be a significant undertaking to port and support this
> in meta-arm.

Thanks for the answer, do you know if there are some advantages using
the Foundation model compared to the Base one?

I would expect a speedup in the simulation time but maybe it's really
negligible?

Regards,
Clement


>
> Peter
>
> [1] https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/tree/fdts
>

