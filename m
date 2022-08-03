Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05EB3C19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 20:21:01 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.373.1659558057316987529
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 03 Aug 2022 13:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=pNCSvnuy;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id d16so2111899qtw.8
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 03 Aug 2022 13:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=zOJkq+wEaOPnyiI2xm/kxxSLI/A7DerungtS3FOYJMk=;
        b=pNCSvnuyRlvmwKgh6zfVzVN/ai4BqYMLvAU5/cAVavrOuA55lKEywemc4eKoeaLcKG
         2dIm8fm9V7dWG2ptb0banzQfX7uWvARXeIKyeIhUISgmWIEDw7EsNJnc60r740UTMu5y
         BzhJ+7dkpToh/ZUYX4WPrtvwu1XlyfJVDlicU4VwUcb94QqijgVEr1PlvLBFNrN+nmPN
         AI675REEkA1IslW4NyuSvc4S2eFR6YybaaRg9W6DIOuBRpQAzW70tnG0vxq6YkMSHUxy
         miHY3ywY0cR5IUCAM9zIA8hNBtwTwtklmemIkfmK1U5KXwevwotc2qZAtaVdZugXQnkT
         0rLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=zOJkq+wEaOPnyiI2xm/kxxSLI/A7DerungtS3FOYJMk=;
        b=JYCAXof9p8liokJxJUuHhfuzxuRqXa359TFJT1m9zWt8q39AmNso3wbJK6yI4VHqf0
         QkQOCEeXXsHfRxkLoCaN9JwFWsXBZgckxSVyReNTfDFAZQ7U975Mo2+lFjeecIiZSCbc
         Z/LpiKmdnE+8CgUbSo1u8duEwdsL7MR+ikUDjv8NKRDXfXyENpVzxUn8FYLmjNDCX05O
         rGFhsLE8Bual6PQYaEM7H0/a0YOr2ufuiFvSgbHcbkhFikyq04/ukJ+EQ1G9Vbl1vD4E
         8W8kDKfUSoi5fOmFUav5qptkdJPVNG+nGBQ1iTZJ0XJPwc8Ve/wsXEs0qf6PUvpJ6QIT
         hu9g==
X-Gm-Message-State: AJIora+F/PucGZJ9ejhAvs/utkP0QMxL/yBImlpnNkWEck6/jhMSwBYP
	CDt9BTJ+/hbE+RRYTbxE5Ff2f9UhoSEveA==
X-Google-Smtp-Source: 
 AGRyM1v1sGM4mdMS7URhZN8QhKTApM7A0atjyc3rbVY+WbWw1SvEGp/xf+yM4sW3fSWGnTujqXXQnA==
X-Received: by 2002:ac8:5f0c:0:b0:31f:44f1:48cc with SMTP id
 x12-20020ac85f0c000000b0031f44f148ccmr23369859qta.640.1659558056302;
        Wed, 03 Aug 2022 13:20:56 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 u4-20020a05620a0c4400b006b5c5987ff2sm13230036qki.96.2022.08.03.13.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 13:20:55 -0700 (PDT)
Date: Wed, 3 Aug 2022 16:20:53 -0400
From: Jon Mason <jdmason@kudzu.us>
To: changqing.li@windriver.com
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [kirkstone][meta-arm][PATCH] optee.inc: update setting for
 OPTEE_ARCH
Message-ID: <YurYpbtFhSOH2/n7@kudzu.us>
References: <20220802062807.4039040-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220802062807.4039040-1-changqing.li@windriver.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 03 Aug 2022 20:21:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3639

Is this needed on the master branch as well?

Thanks,
Jon

On Tue, Aug 02, 2022 at 02:28:07PM +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> lib32-optee-os do_compile failed since OPTEE_ARCH is not set correctly.
> In file included from lib/libutee/include/link.h:9,
>                  from lib/libutee/arch/arm/tcb.c:37:
> lib/libutee/include/elf.h:67:2: error: #error Unknown architecture
>    67 | #error Unknown architecture
>       |  ^~~~~
> In file included from lib/libutee/arch/arm/tcb.c:37:
> lib/libutee/include/link.h:13:9: error: unknown type name 'Elf_Addr'
>    13 |         Elf_Addr dlpi_addr;                     /* module relocation base */
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-arm/recipes-security/optee/optee.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-security/optee/optee.inc
> index beae366..2ad7c95 100644
> --- a/meta-arm/recipes-security/optee/optee.inc
> +++ b/meta-arm/recipes-security/optee/optee.inc
> @@ -9,7 +9,7 @@ OPTEEMACHINE ?= "${MACHINE}"
>  OPTEEMACHINE:aarch64:qemuall ?= "vexpress-qemu_armv8a"
>  
>  OPTEE_ARCH = "null"
> -OPTEE_ARCH:armv7a = "arm32"
> +OPTEE_ARCH:arm = "arm32"
>  OPTEE_ARCH:aarch64 = "arm64"
>  OPTEE_CORE = "${@d.getVar('OPTEE_ARCH').upper()}"
>  
> -- 
> 2.25.1
> 
> 

