Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF60C77B7A
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 15:06:14 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.10349.1685113566854404844
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 May 2023 08:06:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=sGlm6H7F;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: peron.clem@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2af29e51722so8950811fa.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 26 May 2023 08:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685113565; x=1687705565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkozPCbEPiItraKkgFFcLllg4ClHS/Nay4pksGEbRgk=;
        b=sGlm6H7F6NoRmCDmFjb6xO/J7jrrXWzBVfPMbBIZnyQ/6PjN6wRHHmimMaw0F1id10
         TaREfAo9pGl/C1474XCmUsrNIAJARnb/mQkfJ16dVlQ0P8IfeOaVKHSg6z8cs3+hsvRo
         IjvX7uvgGI/AjqsbXNYxJsSX0PMU1CowupmXxGuq7iUpkCtz2PwnmN3RQAu3gK6h4yzc
         9AUr99/DmlXOpXw/APRoxrvMy9EESNLzvZeLo4d2M+cSWQop9MNQzLaNnq+Wcs1ydydh
         pmUQpc9cc0X06YEy0RXtUYfXo0KWbzqlCZOWMrD+bJ/wEp1ZA21gQInmAF5IgWwV0Z4P
         M2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685113565; x=1687705565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EkozPCbEPiItraKkgFFcLllg4ClHS/Nay4pksGEbRgk=;
        b=j+Y28/QWRl7JsKjwzgKxFmDWSpbU78GSqtV4x/w5eY0VdNDyFyHVRbC7qvRzhcbaZj
         famEky7ytHeaxbC6gmG1aDqg1D6sKHCA8m0KXgtEVNGqSMxMrzGFhN1GpHpXLmy82BrZ
         T1ft/Fkv+7h6MRIoM2j7BGau9ItzaOXa3UjrbEBO365pSbL9Lu69AHZxq4sYH9l6Sax3
         XXSPCh5FJxeK/s87iapxWd6aciNvOpZzU8P1Vt5ircoldNgCrd9p3FlOQi9cRdNKROKg
         yOTP1fBJzTG6v2DEgerO/3HkdVWS3USJ/1Fe/b4F/mtO4vgaMWxFo5UCiKbTFhLk8XPO
         wSkg==
X-Gm-Message-State: AC+VfDxFQro7sftChF6OuZqpaScrd1udqRBWt3wV6FK7oU9UYjOwFsop
	Cp3yEhC6O5YMvqFrxQ1sKmAb6Vrok2DD85Ds6YY=
X-Google-Smtp-Source: ACHHUZ43EPllauCD//Idf1u0k8BaYoNCbmOh68ept7KtZ7wQ1nARPyEVKXFvqKV68enklwawF8iuseghvtnIq8E8LQU=
X-Received: by 2002:a2e:8558:0:b0:2af:29d2:2ffe with SMTP id
 u24-20020a2e8558000000b002af29d22ffemr805414ljj.15.1685113564528; Fri, 26 May
 2023 08:06:04 -0700 (PDT)
MIME-Version: 1.0
References: <1759311E604776EF.7408@lists.yoctoproject.org> <175AFF2521F05CA2.26969@lists.yoctoproject.org>
In-Reply-To: <175AFF2521F05CA2.26969@lists.yoctoproject.org>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Fri, 26 May 2023 17:05:53 +0200
Message-ID: <CAJiuCcc7vEGLGrBLCh6vM3gMXaV9AMWLu0DC=G9u-UF0_W+QfQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v3 1/2] conf: layer: add dynamic-layers folder
 in meta-arm
To: peron.clem@gmail.com
Cc: Jon Mason <jdmason@kudzu.us>, meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 26 May 2023 15:06:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4711

Hi Jon,

On Mon, 1 May 2023 at 12:45, Cl=C3=A9ment P=C3=A9ron via lists.yoctoproject=
.org
<peron.clem=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> Hi Jon,
>
> On Tue, 25 Apr 2023 at 15:39, Cl=C3=A9ment P=C3=A9ron via lists.yoctoproj=
ect.org
> <peron.clem=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > Gator-daemon recipe will require libmxml which is present in meta-oe.
> >
> > Prepare for dynamic-folder support so only people that have meta-oe
> > present in their configuration will be able to compile this recipe.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  meta-arm/conf/layer.conf | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> > index 2b354375..fb121888 100644
> > --- a/meta-arm/conf/layer.conf
> > +++ b/meta-arm/conf/layer.conf
> > @@ -15,6 +15,12 @@ LAYERDEPENDS_meta-arm =3D " \
> >  "
> >  LAYERSERIES_COMPAT_meta-arm =3D "mickledore"
> >
> > +# Add layer-specific .bb/.bbappends
> > +BBFILES +=3D "${@' '.join('${LAYERDIR}/dynamic-layers/%s/recipes*/*/*.=
bbappend' % layer \
> > +               for layer in BBFILE_COLLECTIONS.split())}"
> > +BBFILES +=3D "${@' '.join('${LAYERDIR}/dynamic-layers/%s/recipes*/*/*.=
bb' % layer \
> > +               for layer in BBFILE_COLLECTIONS.split())}"
> > +
>
> Are you ok with this approach or is it too much "dynamic" ?
>

Gentle push on this patch, what do you think?

Thanks,
Clement

> Thanks,
> Clement
>
> >  # runfvp --console needs telnet, so pull this in for testimage.
> >  HOSTTOOLS_NONFATAL +=3D "telnet"
> >
> > --
> > 2.40.0
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4629): https://lists.yoctoproject.org/g/meta-arm/mess=
age/4629
> Mute This Topic: https://lists.yoctoproject.org/mt/98492823/4240582
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [peron.clem@=
gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

