Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CCDDC433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 13:29:34 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web08.11482.1638538172941945905
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 05:29:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vn+yrGOj;
 spf=pass (domain: linaro.org, ip: 209.85.208.182,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f182.google.com with SMTP id p8so6211708ljo.5
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 05:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CzR2XC1+Rf+DIowJBGnYSDqAoQSkhHQZVokk4ronc+Q=;
        b=vn+yrGOj13tX6lxDhLsDiuHv/d0pforhwN/9xf2ET3WcbBRnDXvMCTO3B/raZc05N6
         JgsmD2suCZ4upPPsKEVHPIgmYfxEQOM+xkDueizONYS5Y7WabWqaarvoVj6bhKSdrPAr
         qkQF9Av+0s/fXiuw9E3IJM0J+CAjJcxm/YdKjmQcA0ptpXVEoPTeLkpHlD6HXJAQlQnw
         MFiRqc2oL9jhN1xMWK8QdIDrK3dSTWTKqPe327ceYUAO2HpL5+T+SmZCInwpj+dT/w8d
         NyV62hdiwTrVOAOtfSpQavXGmRx3zavMJOQ1wwK6Ejv4XB0HU0HNz96Cnv5g80JapZrw
         Bjww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CzR2XC1+Rf+DIowJBGnYSDqAoQSkhHQZVokk4ronc+Q=;
        b=xWwqm4z6DOGWk6B3FAMGY9ItVQwn0ruL6OFAC8W4ZlOwUDerTQ+CoqXXz1/UIYjvri
         xM3fa1wqv8X9/ApXDndtAs3oZotPUTRawG2MVA76oXtq5SmmziZEEpYENC4Zt+9dWjFM
         cglnU32VyMBEnw/iet/5G8eytUtwoCyTmXJUWE18w4z5s4JxHmBP5ZBjzg8yuwx1JNsX
         +MNHyq/09I4SyuE2KDpAMsTbHJ35DRO5uPViQv2PbqkzzMqTjcsFSNlW8S5zAGe8w0xA
         RYq6kpUEVrtZ3yeaX1TcRnHNdWvnLmUKpJGatHzTcQt7ervnIXw2gFsbfzvgoz29/hXg
         VFwg==
X-Gm-Message-State: AOAM533T5REofODqB74KbxBQiPwM80ETn7T+K68A3n8locnoOYtE3La9
	HKmrkaT8QjatQdo9kxrJlpy/mt2NnaN7EmlqUMgxgA==
X-Google-Smtp-Source: 
 ABdhPJwFBK0dCakaXDeoJ2F7pP7qfJwZk0RxIv4bjIIX90QF4sFkiy6snVrKPTkQCRHka7BN4QIzRrb05ylnyIae770=
X-Received: by 2002:a2e:a591:: with SMTP id
 m17mr17866459ljp.511.1638538170772;
 Fri, 03 Dec 2021 05:29:30 -0800 (PST)
MIME-Version: 1.0
References: <20211125173400.1285847-1-ross.burton@arm.com>
 <20211125173400.1285847-2-ross.burton@arm.com>
In-Reply-To: <20211125173400.1285847-2-ross.burton@arm.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 3 Dec 2021 18:59:19 +0530
Message-ID: 
 <CAFA6WYNQbEPOTrE_8V+idztrh9ZJDr5wTANpxkg_GLbe4M-Dkw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 2/3] arm/optee-test: change DEPENDS to
 optee-os-tadevkit
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 03 Dec 2021 13:29:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2529

Hi Ross,

On Thu, 25 Nov 2021 at 23:04, Ross Burton <ross@burtonini.com> wrote:
>
> Now that the TA devkit has been split out of optee-os, the build
> dependencies of optee-test need to be updated too.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-arm/recipes-security/optee/optee-test.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/recipes-security/optee/optee-test.inc
> index b5dfff42..94cf46ff 100644
> --- a/meta-arm/recipes-security/optee/optee-test.inc
> +++ b/meta-arm/recipes-security/optee/optee-test.inc
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://${S}/LICENSE.md;md5=daa2bcccc666345ab8940aab1315a4fa"
>  inherit python3native ptest
>  require optee.inc
>
> -DEPENDS = "optee-client optee-os python3-pycryptodome-native"
> +DEPENDS = "optee-client optee-os-tadevkit python3-pycryptodome-native"
>

This change has been backported to honister without backporting the
actual dependency [2]. Can you backport dependency as well?

[1] https://git.yoctoproject.org/meta-arm/commit/?h=honister&id=26501daba08729dcf8124aadd31eeb24f193df8b
[2] https://git.yoctoproject.org/meta-arm/commit/?id=3210fe4e65d9dd990a0432e02c04c323106d60b7

-Sumit

>  SRC_URI = "git://github.com/OP-TEE/optee_test.git;branch=master;protocol=https \
>             file://run-ptest \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2457): https://lists.yoctoproject.org/g/meta-arm/message/2457
> Mute This Topic: https://lists.yoctoproject.org/mt/87306724/1777089
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.garg@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>

