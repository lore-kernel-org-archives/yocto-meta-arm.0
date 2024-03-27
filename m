Return-Path: <mathieu.poirier@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1656C47DD9
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 15:13:27 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.40442.1711552401145982214
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Mar 2024 08:13:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=kxM5KdkO;
 spf=pass (domain: linaro.org, ip: 209.85.208.46, mailfrom: mathieu.poirier@linaro.org)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-56bdf81706aso7330923a12.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 27 Mar 2024 08:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711552399; x=1712157199; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ryvLeldeLxiGYgezPcS6oOOYh1PBUOiaHba2Ec9spS0=;
        b=kxM5KdkOb0UFD7+eRQp3hCo/4mP8o4QEYCUYoZoc/y6qidPCVsByB7q3F1Fk0hBXIs
         O0KkcYbCNWiUXsY+Pp+dtaj8YbrF85P9RtOicxvCYeJV59QF97gcTtYH6pFtR650a0ze
         bz+X30QmeW3k0xd12uuSbHVp0K9mGEvp2fe1Fb+8dGrnIfE5mxpxXGUTGItrHNfhmKX5
         LpWUzfTEGhndBPq+ZoFsbdxRKZsmM/zAJeIgWZ/z2q2hxrVKFCDtT1igp17LEjK4Sfq8
         BR1DcAwws5EOX2MCzCSQHaexLOxtKN81fOitp9zFHgHFzWatsvINkCpnO8Ti2+cuuVjT
         OCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711552399; x=1712157199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ryvLeldeLxiGYgezPcS6oOOYh1PBUOiaHba2Ec9spS0=;
        b=qttFssGBR8uQ330kmNp6cbkF5T5uaKCNcXlR+5XOybgrN4RlEYMyNQWNXV5lM4vhd8
         6A30RJdOTuU7dlqPAyBcufWZLvXJtn7vlPOoHguMQkAX5wbrkK2AW3gIgcRN/r8BDz5u
         pWLzBj1kW/RaH5AReBx8Wn3BqPybaIpXPx2PJaYEk3vIW/g3QUkXozJZ0oRTgus7icPX
         GeXzS1Qo5mktSN/LxSGEkwN9vemO+Hnm0r7l4AFIVoLFe3wFLLq+i4vHmLCKabjCbLyC
         PWUBFHrm0sCcZ1dTGa2YnoOSPhP1l5k2m4Zb91vPd7XzNxqiypLasoachvE+MhvZBeV6
         MjEw==
X-Forwarded-Encrypted: i=1; AJvYcCVyJonaTCJKH4p3Z3cTdE9sAfIbXD9lOqM+0Bac9CTMorDlwmXDzlS0Ds80t00066M15L/hIhb57B3rJjk9Gf9siixJGFvipP2aSwk2nunA
X-Gm-Message-State: AOJu0Yy1BxmVYPZIgIxSs2FL+WUuagwfmw6qsKqL2Cjj0jhYpSWuX4B0
	b+1OEzzlyClO4hvChcWz/nZUDtNlh6A1zsthtGoIg1PAmEFh9TtvtF85F+CojM8P42qb56TDVOB
	SwPc5I48DHop2Md5UBct9g6+cfarWosXuajlmpg==
X-Google-Smtp-Source: AGHT+IFg5bUatpcoWrrzQj9vUV0kuyY8dh12JjPOuLp/+bS8Q6nBH4y4tH25aifGDpihvW51OYlzi41sbmXlNZBxR08=
X-Received: by 2002:a50:8d57:0:b0:568:bfcd:e895 with SMTP id
 t23-20020a508d57000000b00568bfcde895mr36024edt.41.1711552399446; Wed, 27 Mar
 2024 08:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240326202001.1075940-1-mathieu.poirier@linaro.org>
 <86E1B306-3BC6-45B7-821B-D24DA64F42B5@arm.com> <ZgQiK6tpa8RdI_cy@nuoska> <2D90A79C-0BA3-453F-928D-8D132515F474@arm.com>
In-Reply-To: <2D90A79C-0BA3-453F-928D-8D132515F474@arm.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 27 Mar 2024 09:13:08 -0600
Message-ID: <CANLsYkyNAaJO_RR6tt278mAktQ2gTbMRXT2++GLrugq501f8dQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v2] arm/trusted-firmware-rmm: Add bitbake,
 include and patch file for RMM
To: Ross Burton <Ross.Burton@arm.com>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, Jon Mason <Jon.Mason@arm.com>, 
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Mar 2024 15:13:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5496

On Wed, 27 Mar 2024 at 09:06, Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 27 Mar 2024, at 13:42, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> >> CMake class should be doing this, remove.
> >
> > Sadly RMM build scripts really don't want to support compiling
> > with an external CMake toolchain file:
>
> Joy.
>
> One day I need to sit down with a CMake expert and design the one true wa=
y for eg firmware to build using relatively standardised toolchain files.  =
TF-M does use its own toolchain files but mixes basic logic like =E2=80=9Cw=
here the compiler is=E2=80=9D with innate TF-M knowledge, which doesn=E2=80=
=99t help.
>
> Maybe in this case the solution is to not inherit cmake and reinvent the =
wheel: the class will be doing a lot of things, but most of them are being =
ignored.
>

May I ask you to be more precise on what you're expecting here?
Otherwise I fear my next revision will completely miss the mark.

Thanks,
Mathieu

> Ross

