Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F2DCC77B61
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 10:45:48 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.90657.1682937945496648002
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 May 2023 03:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=sS9yTkbQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: peron.clem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-3ef302a642eso10577771cf.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 01 May 2023 03:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682937944; x=1685529944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+ngHMWdTLi9iK4pg2ZnpBLV7zCtRsnLtavPt7clvV4=;
        b=sS9yTkbQv3I4x+3hUTpbKuklng5yfjEA7O429Kwv7/8d0QC6w2w2mqgd+zf7yY9x9K
         vgU1qHu9Ygc0dwk8mlY5hmQJKoACN+XhZTV37N14fLZsOwcO1tNNcoXgmzrJx3dkFUf1
         ukJMLdhcSQSa7xAwtX8h0xOdoBd1Phz6DCCkFkUTRXQZiAqROLTtCVl/eFGzWIJ9rrYQ
         rczbT1i0WQY8S/QGghyrEMJpNMBHpLVEifyfxDbCBLnjTlxIln+vN+Bo8jDcVchdY2jI
         /vF1CBRkOFFqs0/ZBWgy2yHVb47wDBQ5fYls81MngntMt7Fw7fDZw8AoeHkI7ecwBwcq
         ecew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682937944; x=1685529944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+ngHMWdTLi9iK4pg2ZnpBLV7zCtRsnLtavPt7clvV4=;
        b=W9bpjy2fHj7jDENxY7qIm87yivm/N+xJEse5n0o5OBO696TWBbPahWrI5PtLViiHFC
         VBLn4nPdU0dT/ChmOHXW/iSFJQii/cAZ7iYuOBoDi9HOOSHhbwqZoCw9fjutuv6tDNFP
         hj6bD0qUFIDL5AO3KZczIWb2XIddkJ6EIW93sHhZISI25wAleUfQoIUszPZ/uStjgV97
         96dBBkszOGO8fTSReQnE5RceP5BtuLCqkG4jXQbBPFJtwBPhJC+ojlT6NljjtBzTyIhP
         39M/mkxNP9L0zRwyuc+sS+ahN8A4W+ovFIrhgTD42rZFZyt5hqtMXSdmNtkLwXIOI6i4
         RpbQ==
X-Gm-Message-State: AC+VfDzy7GMIX+w3X8E1044wvp5YuyausNEW25AQtPsM+TebubA8zNhJ
	C1oHSRYR89/pmytecX2yijS83Qy0a7NPu6jE77Q=
X-Google-Smtp-Source: ACHHUZ4P73GkEuKnF8x4pRA5BRWWFrbGI85sX0GyVTAPaalNVq5nQALhYFbYcZC+kzROEDFFtalM/QsR3ozfw69c5dM=
X-Received: by 2002:a05:622a:14cc:b0:3b9:b6e3:c78e with SMTP id
 u12-20020a05622a14cc00b003b9b6e3c78emr20915255qtx.8.1682937944352; Mon, 01
 May 2023 03:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <1759311E604776EF.7408@lists.yoctoproject.org>
In-Reply-To: <1759311E604776EF.7408@lists.yoctoproject.org>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 1 May 2023 12:45:33 +0200
Message-ID: <CAJiuCccTk6hoJ1+wkjS_T90dpPoFqk3aSmeYgoeKPLTLDuQ_1Q@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v3 1/2] conf: layer: add dynamic-layers folder
 in meta-arm
To: peron.clem@gmail.com, Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 01 May 2023 10:45:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4629

Hi Jon,

On Tue, 25 Apr 2023 at 15:39, Cl=C3=A9ment P=C3=A9ron via lists.yoctoprojec=
t.org
<peron.clem=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> Gator-daemon recipe will require libmxml which is present in meta-oe.
>
> Prepare for dynamic-folder support so only people that have meta-oe
> present in their configuration will be able to compile this recipe.
>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>  meta-arm/conf/layer.conf | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> index 2b354375..fb121888 100644
> --- a/meta-arm/conf/layer.conf
> +++ b/meta-arm/conf/layer.conf
> @@ -15,6 +15,12 @@ LAYERDEPENDS_meta-arm =3D " \
>  "
>  LAYERSERIES_COMPAT_meta-arm =3D "mickledore"
>
> +# Add layer-specific .bb/.bbappends
> +BBFILES +=3D "${@' '.join('${LAYERDIR}/dynamic-layers/%s/recipes*/*/*.bb=
append' % layer \
> +               for layer in BBFILE_COLLECTIONS.split())}"
> +BBFILES +=3D "${@' '.join('${LAYERDIR}/dynamic-layers/%s/recipes*/*/*.bb=
' % layer \
> +               for layer in BBFILE_COLLECTIONS.split())}"
> +

Are you ok with this approach or is it too much "dynamic" ?

Thanks,
Clement

>  # runfvp --console needs telnet, so pull this in for testimage.
>  HOSTTOOLS_NONFATAL +=3D "telnet"
>
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4616): https://lists.yoctoproject.org/g/meta-arm/mess=
age/4616
> Mute This Topic: https://lists.yoctoproject.org/mt/98492823/4240582
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [peron.clem@=
gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

