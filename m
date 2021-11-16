Return-Path: <maxim.uvarov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8179AC433EF
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 09:42:45 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web12.7765.1637055764512469503
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 01:42:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=NYMGo1yl;
 spf=pass (domain: linaro.org, ip: 209.85.210.170,
 mailfrom: maxim.uvarov@linaro.org)
Received: by mail-pf1-f170.google.com with SMTP id g18so17643029pfk.5
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 01:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uJ57swAzGHMYKcK2WQifSJF/zpaOx8pE21Yob7vs6Dc=;
        b=NYMGo1ylHatKKmzdzgxRnbUXCDcCN9PrIMIs506K08Wf1XDjqMvOBSDpkEtASSvs2X
         jpjTMOkkxKZVjkaVbPcR6GMbgAvo9F8cERtaSbeGdkSFVI/eDARRQvdQuO5mfsNw+wBU
         VmGg0RaS+stBRe/6VcV3y+vJP96gD5hQbHBQNHQHExivfx47mgfkhlVlLsn0UnSwAyYR
         DpVZiD9TPybGE/g2V46c8fOwnXchSeqpjEhVHA9zEthdpUo7Q/bgEWSpucRL68dRelin
         S3S45imEGHQVZUj91d0MxjTQoB7QAb9zVejlJ32rjOgsPXf3z35JYJMOd2QwmysCW04a
         F4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uJ57swAzGHMYKcK2WQifSJF/zpaOx8pE21Yob7vs6Dc=;
        b=SIJ/PS5jKFMJ5580JS0uXFov+Fyvp3OAPqPoeT14WrWPeEg9H+unmO/qE5Bm9pUdUp
         3Nt2gDyZq2ZEPyEnN0K0lK5acb0yBLKRX8/eiOrAN3oFnfcuDYNxaURNHbILTJyLYTcz
         wP/SLZ+OL/6Tcpzok7XBho1aOdg+0wX0e96EooNxHTVraiFWlAS0FhsolO9Kzskd9iNe
         PiZhlCRtrEt2NZIK/3lco7OmtAr1VXfJ4zzV9rX3QcVrLeio5/AxHLw9uOGMkjZ4N3h0
         rhUR/oxbpQjn42GhZXUX2XSkWNUynaRWimc8OuD4hpzazVzyjI6CDy+6NBaq6Ex6czV/
         O4Kw==
X-Gm-Message-State: AOAM530o/h91tjd9ZZEx87RG0INCANmqFWOnAP6qI81utJcJJgiHkFFy
	E8v6YLkgrdbf1ebSDE2IqgRS0wSSDneAEMI5KEQTeA==
X-Google-Smtp-Source: 
 ABdhPJwS51TRp9nTUDI0oMz4PXFEjMsv7YfPn1a/LswlB72yn/lyC414u56LJlHgayslQmPQJsu1oBeF9sZtweUBAIg=
X-Received: by 2002:a63:6702:: with SMTP id b2mr3946699pgc.185.1637055763905;
 Tue, 16 Nov 2021 01:42:43 -0800 (PST)
MIME-Version: 1.0
References: <20211115140100.24634-1-maxim.uvarov@linaro.org>
 <20211115140100.24634-4-maxim.uvarov@linaro.org>
 <20211115171931.GD31079@kudzu.us>
In-Reply-To: <20211115171931.GD31079@kudzu.us>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Tue, 16 Nov 2021 12:42:32 +0300
Message-ID: 
 <CAD8XO3bPChE+fBt1kfXSgaCtCcJKXKTYDSzDce-7wojJuygoQg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCHv3 4/5] machine/qemuarm64-secureboot.conf: add
 optee-ftpm
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, Jon.Mason@arm.com, Ross.Burton@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Nov 2021 09:42:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2404

On Mon, 15 Nov 2021 at 20:19, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Mon, Nov 15, 2021 at 05:00:59PM +0300, Maxim Uvarov wrote:
> > Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> > ---
> >  meta-arm/conf/machine/qemuarm64-secureboot.conf | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> > index c45924a..b664dac 100644
> > --- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
> > +++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> > @@ -20,4 +20,6 @@ WKS_FILE ?= "qemuarm64.wks"
> >  WKS_FILE_DEPENDS = "trusted-firmware-a"
> >  IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
> >
> > +MACHINE_FEATURES += "optee-ftpm"
>
> I'm wondering if this wouldn't be better described as simply tpm.
> Then do a check to see if one is described anywhere and if not, then
> do the software tpm.  Does this make sense?
>
> Thanks,
> Jon

Interesting question. Theoretically one machine can have several tpm
devices. If we just set tpm then how will we difference them in
future?
I would prefer to be more concrete here.

BR,
Maxim.
>
> > +
> >  PREFERRED_VERSION_linux-yocto ?= "5.10%"
> > --
> > 2.17.1
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#2388): https://lists.yoctoproject.org/g/meta-arm/message/2388
> > Mute This Topic: https://lists.yoctoproject.org/mt/87069392/3616920
> > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kudzu.us]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

