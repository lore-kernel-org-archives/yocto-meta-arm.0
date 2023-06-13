Return-Path: <ricardo@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3996FEB64D7
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 17:46:06 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.12.1686678362708249019
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 10:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@foundries.io header.s=google header.b=A6ByCFJg;
 spf=pass (domain: foundries.io, ip: 209.85.208.170, mailfrom: ricardo@foundries.io)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2b203891b2cso73517341fa.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 13 Jun 2023 10:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1686678361; x=1689270361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MEHB0zYo0dC6FXs2TrELsFBC5EysctaSIDxtXQV41Sk=;
        b=A6ByCFJgqcC570PtCApN3JklwMbulUIv8StlPZxoTfHOIwOOnWMlSj1uRAtFe6JVrS
         lngxGVXONDDfy80nZ7o+hMNNF8ByrFPqOcVVtEB9WuUE4MjBzmWhgkmjC5YiyTuFxmFr
         yvts533aZWCd5MgBCQbcTi45Zyvy8kzxAxFR+NhidsjMJifhoUNO+BFyfmSwfWNL5dA5
         6ttumZXXyg0rGV6aJH7+2ZMIPTHwQ6Ndln2aYh9B1DKlqFZoYErkTIviZboftyQIWMu+
         Cd/zlvOuKGlAQ4dID1V7qhyCnTQgFqCX4julX6WBqmb5o+C71iv9VQrX5P//71ZuOAyG
         /NJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686678361; x=1689270361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MEHB0zYo0dC6FXs2TrELsFBC5EysctaSIDxtXQV41Sk=;
        b=TQnDEbozEWNTjr+OLeX7sIKy2fqq9rlIRDZbKU557KPUXXyHr364pSjN70R71RMAsh
         VOZ1scbCUlmDHUrJwM7128e2nxkfGg9vmEojRKZHd8HVZ5i4QFdw+kuZmFgpJ6xRqM3g
         eozSjw/AzYFo2mXgiLstiL/YCG9yT1TVqV3vgTWqvRuEJeJAvB1+Gph+uR7HSiXPC2jO
         2yKykorsFsM0adweDTT2TLuVcNKJFl2/wv/gD3cJLPi2h3D8v1YRPKm/r509Q3bdDGEs
         JnGRJXOoUxTxqyifbxdddYefPi5E1wuuODYAGh4ZH8HZ5/zBI6nT8STAGnSvsETOn6uT
         DcEA==
X-Gm-Message-State: AC+VfDx4cBBDk38TlmWeW748arjAD0JKbfdsfxqEi1MmktRYWuNlC879
	mHp+w413ExoHiywl1Licn7iHMQs4GuMJktoLApsm
X-Google-Smtp-Source: ACHHUZ6dme2FqtUuE8g61NcRvUQnFSRfMTLt04MPyOJ2YtJKdfoCwINfM2D+zlhahpQXgGC2t/7jBZ4Hr4LXfg0MpOA=
X-Received: by 2002:a2e:7a07:0:b0:2b1:c312:4faa with SMTP id
 v7-20020a2e7a07000000b002b1c3124faamr4906081ljc.53.1686678360580; Tue, 13 Jun
 2023 10:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <ZIBjbFIsz5x+721R@nuoska> <20230610002817.GK9226@denix.org>
In-Reply-To: <20230610002817.GK9226@denix.org>
From: Ricardo Salveti <ricardo@foundries.io>
Date: Tue, 13 Jun 2023 14:45:24 -0300
Message-ID: <CAAaKDhFa3T0KE1ZaEhqpuyxOroj0A3dmDobFL1UPReh6VHG+hg@mail.gmail.com>
Subject: Re: [meta-arm] optee: CFG_MAP_EXT_DT_SECURE=y and CFG_DT=y mandatory
 or machine specific?
To: Denys Dmytriyenko <denis@denix.org>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 13 Jun 2023 17:46:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4771

On Fri, Jun 9, 2023 at 9:29=E2=80=AFPM Denys Dmytriyenko <denis@denix.org> =
wrote:
>
> On Wed, Jun 07, 2023 at 02:01:00PM +0300, Mikko Rapeli wrote:
> > Hi,
> >
> > Change b81642c5f8566a947a13ccb3ef135157b1842449 says it's for qemu only
> > but in meta-arm/recipes-security/optee/optee-os_3.20.0.bb
> >
> > EXTRA_OEMAKE +=3D " CFG_MAP_EXT_DT_SECURE=3Dy"
> >
> > applies to all machines, and this in turn depends on CFG_DT=3Dy which
> > is also not ok for all machines.
> >
> > Should this actually be applied to only certain machines targets
> > provided by poky (qemuarm/qemuarm64) and/or meta-arm?
>
> I would also like an answer for this question! Should all platforms (incl=
uding
> those downstream to meta-arm) define CFG_DT=3Dy all the time? Or should m=
eta-arm
> optee default just drop CFG_MAP_EXT_DT_SECURE=3Dy and only set it selecti=
vely
> when needed? Seeing breakages now since this patchset got merged couple o=
f
> says ago:
> https://patchwork.yoctoproject.org/project/arm/list/?series=3D12920

Yeah, both CFG_DT and CFG_MAP_EXT_DT_SECURE should really be machine
specific instead (and here more about the qemu setup used).

OP-TEE itself is able to handle the defaults for most machine
configurations used.

Cheers,
--=20
Ricardo Salveti

