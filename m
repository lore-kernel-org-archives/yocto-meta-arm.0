Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355C7C021B5
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 15:06:45 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.24996.1740150402212037119
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Feb 2025 07:06:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=xUDoac36;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.176, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3f408052bdcso769349b6e.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 21 Feb 2025 07:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1740150401; x=1740755201; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNSsjCtTDsOsh7VRvYVtgjhrR78vDiIPnuAknj8JaiI=;
        b=xUDoac36yRxPizJRke3xY69QEk7xevP58/aljuXwvHb9y7irUenO/RUnFDO438vTsJ
         1ZCezudKm+l1K8Ly8e4VCZ0+83vUFrb3UK7HobQ/idS0ERmh0qICx3wwAQ0+N5LyHDcM
         zhTrH2ui1Voyztj6PyN0pozci1C6WtjDCbxA+z4AXvM8zlLyWNuTmypviQbTCJ+ep5rs
         tbiNfeGmz1/WRY9/9qHCj+/wyefyf4L1hmIPs/o5zY25hgdKR3HyDIZElrmkKlA2l0pe
         RsMLrEz9GFHxdGcidYO4FSQ2VGLGvg/nLUz/uINWV+4H2Su09jpa5Whz0uz4zGag/Rox
         99Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740150401; x=1740755201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNSsjCtTDsOsh7VRvYVtgjhrR78vDiIPnuAknj8JaiI=;
        b=P9C3ccEjeN1mqLQjZ+VVgoM8qBxqscpVRPR/6utZr21+S4apEEM0rMCdBi/69aKEV6
         ZCVKH0CGKGqDtTJbs2ankLUJhCB4KGcGwpp1bVJXOZ4gGxdm8pavCNlwmnTw6Q9M6R8x
         Xk7egofYBEJg90zoHC784kS7GgOpZ3q2sHK2aPdWLd613DlJbb51Q2hID6wuzg6dzRJ6
         kIWemayRi4wDhNss5BwUmXPyMdYI2MgDT5dCEtygt6VI2/MwpX2Ngpo9uokpLj895Hrc
         PwVZ4uB7XOC/mOZ7N29okbAWFUtECk7IsF7y6PU05FpS4i1ZSbcoiRGvD/UINYFZ4Lj9
         Y0uQ==
X-Gm-Message-State: AOJu0YxY6shV3eymzEUL+g5igGPg0+CjMK2zNa9Z2WYazC94fdDKDACA
	UHwP2QT01jjFrKcBNVdy5JGOBHS1AV5sMgCP/rjzAsuZYoibPCyK233w2mYP6fXxXWYAaVKqEBa
	2gGsVFgIXEb/bVHEoYRZAuLV2ng7ZGz/IQols
X-Gm-Gg: ASbGncucMb4ZPsdRAkjrnqxz4jLlpfPH+MzS5Y0Mq+rFtcFkvUtBZufZxp9NS18vkCF
	VffPDfLE7OWIYVhMkM23dDLxC1knW6xYVMcmuc2kAsk8lP+M26lA+Mjg/bomMyxUW40FPLXlcD6
	V660TeMEQ=
X-Google-Smtp-Source: AGHT+IHJ6cBcPOSHWGsAgFRa8RssSV/JYjolyFRuhcJhNseELMkaqRfEJYy0pP0TTXaiU/rMutLaReyC4ukfvzjs2uY=
X-Received: by 2002:a05:6808:15a8:b0:3f4:ed9:d4c1 with SMTP id
 5614622812f47-3f4246e1bfbmr3045084b6e.22.1740150401308; Fri, 21 Feb 2025
 07:06:41 -0800 (PST)
MIME-Version: 1.0
References: <20250221013348.2622293-1-haixiao.yan.cn@eng.windriver.com>
In-Reply-To: <20250221013348.2622293-1-haixiao.yan.cn@eng.windriver.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Fri, 21 Feb 2025 10:06:30 -0500
X-Gm-Features: AWEUYZkwqnSooik80QOOix1Q0Lw5slDSz3uArSzRqYonRToDF1Azb8NH1zLlF4w
Message-ID: <CAPoiz9xmFk9zq_aCYBfRD7UfWLDXrUbZe4jJK2TGqGGwevqR1w@mail.gmail.com>
Subject: Re: [meta-arm][PATCH 1/1] optee-client: disable build on qemux86-64
To: Haixiao.Yan.CN@windriver.com
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Feb 2025 15:06:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6378

On Thu, Feb 20, 2025 at 8:34=E2=80=AFPM Yan, Haixiao (CN) via
lists.yoctoproject.org
<Haixiao.Yan.CN=3Dwindriver.com@lists.yoctoproject.org> wrote:
>
> From: Haixiao Yan <haixiao.yan.cn@windriver.com>
>
> optee-client will be built on qemux86-64, there is no OP-TEE supplicant
> device on this platform.

I don't think I understand what you mean.  More verbosity in the
commit message might help in the future.
I was able to add optee-client to qemux86-64 and it compiled without issue.

Either way, this patch breaks corstone1000 and fvp-base (with
fvp-base-ts).  You can see it in
https://gitlab.com/jonmason00/meta-arm/-/jobs/9203534679
https://gitlab.com/jonmason00/meta-arm/-/jobs/9203534694

Thanks,
Jon

> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> ---
>  meta-arm/recipes-security/optee/optee-client.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/=
recipes-security/optee/optee-client.inc
> index f387c80574b0..aafb1efcf726 100644
> --- a/meta-arm/recipes-security/optee/optee-client.inc
> +++ b/meta-arm/recipes-security/optee/optee-client.inc
> @@ -6,6 +6,7 @@ LICENSE =3D "BSD-2-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D69663ab153298557a59c67a60a743=
e5b"
>
>  inherit systemd update-rc.d cmake useradd
> +require optee.inc
>
>  SRC_URI =3D " \
>      git://github.com/OP-TEE/optee_client.git;branch=3Dmaster;protocol=3D=
https \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6376): https://lists.yoctoproject.org/g/meta-arm/mess=
age/6376
> Mute This Topic: https://lists.yoctoproject.org/mt/111301214/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kud=
zu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

