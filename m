Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294A2C19F2A
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 13:06:05 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web12.4507.1659618361121947590
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Aug 2022 06:06:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=Vx+/cSub;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id z3so3662574qtv.5
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Aug 2022 06:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=EJHAZ9hOlUmlFKzIWsWz6/AYnhhCeuVByq+15jcZ7j4=;
        b=Vx+/cSubR9MY9mRzfA1ZNfx+TBSj+biYGVZ9jd3jSQKmqlcN5FOVDAFk1PovRpejJU
         sLX0LohDcyy0HqdPpsIXfx/0+/6H7hrS2zwK7VX/Sd1qnfQ/nOYbfnAgTqSfjx0UjqMm
         RYVmDXC4FcSvrjWXgPp035iYu63/kjNGYZQl13WKSRCIB/q8b/XcVdHoelXcxOMiDCKq
         JKKJ/AlA1ra80LcCvVxGNLb4UzFETkmKg29L3mNMlm6QKMmJs5TBDMqJkxTjZ0IWHKMW
         caLyYzV89mvycJqC7FJMJyCCeqzP9tZJ0wjwq4/nhg00mZ3ivGsc8oUMi35zvxP73+5e
         +fCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=EJHAZ9hOlUmlFKzIWsWz6/AYnhhCeuVByq+15jcZ7j4=;
        b=cDA8oN4Rm2O3zYjr4GaNaIokhlj/Jbb6AyYweSuhyLiaCNnI3bGJAEI78Q5Hl5TiNW
         QPlkdTPTJfPUpBp00aE+vBEMu6YNiX1+RTg+TLWWsbC/6ZXJ5lnJeydZyAaokZgnNl8r
         7ChoXTpGDV3VBv2FP8LYPzIxnFVifH7zx0wyjElCUhYqz6WkagWz1z7xTamjAmRqDVoS
         DRccAMPpipDC6cyAQU11EAqV1WlmE1JFfipu1WiFeiJCkdKAPElptIbl9H1k/EVUECS4
         mdNTnuFi17r6fyzUMmcRTG9QLLmJEXhxTY9LCaXKWOK68JLNTVR0GL9fNkqmhIPWlsd6
         nOvQ==
X-Gm-Message-State: ACgBeo1hd0SyB/s7G9vsy2Olin0tzeqG2v+9elkNx9UoaUg/QpBo61lX
	OAWV30HGDnzOWZZkj3eHbtUlEg==
X-Google-Smtp-Source: 
 AA6agR7kVbIOwatkMr2DHk5rr8OZx9PsaZ065/dL9GZY0tGIurBaCrWw8Kl0YgdhtqbCR29cL82Igg==
X-Received: by 2002:a05:622a:1041:b0:33f:3449:593a with SMTP id
 f1-20020a05622a104100b0033f3449593amr1350857qte.257.1659618360136;
        Thu, 04 Aug 2022 06:06:00 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 f6-20020a05620a280600b006b61b2cb1d2sm613465qkp.46.2022.08.04.06.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 06:05:59 -0700 (PDT)
Date: Thu, 4 Aug 2022 09:05:57 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-arm@lists.yoctoproject.org, Ross Burton <ross.burton@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH][kirkstone] arm-toolchain/layer.conf: remove
 BB_DANGLINGAPPENDS_WARNONLY
Message-ID: <YuvENV7uaKfqmOat@kudzu.us>
References: <20220804094231.748681-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220804094231.748681-1-Martin.Jansa@gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 Aug 2022 13:06:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3642

Odd email format.  I beleive you are asking me to apply this patch to
kirkstone.  If not, please let me know.

Sumit/Denys, should I apply this all the way back to dunfell (as the
grub entry is there in this oldest branch)?

Thanks,
Jon

On Thu, Aug 04, 2022 at 11:42:31AM +0200, Martin Jansa wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> This appears to be historical from when the toolchain was in meta-linaro.
> 
> It isn't needed anymore, there's one bbappend in meta-arm-toolchain for
> grub which is part of oe-core, so will never be dangling.
> 
> This variable has a global effect, so leaving it in here has a negative
> impact on users.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  meta-arm-toolchain/conf/layer.conf | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
> index 3512c34..dd54db8 100644
> --- a/meta-arm-toolchain/conf/layer.conf
> +++ b/meta-arm-toolchain/conf/layer.conf
> @@ -11,8 +11,5 @@ BBFILE_PRIORITY_arm-toolchain = "5"
>  LAYERDEPENDS_arm-toolchain = "core"
>  LAYERSERIES_COMPAT_arm-toolchain = "kirkstone"
>  
> -# do not error out on bbappends for missing recipes
> -BB_DANGLINGAPPENDS_WARNONLY = "true"
> -
>  # These variables are used for armcompiler license
>  BB_BASEHASH_IGNORE_VARS:append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE LM_LICENSE_FILE"
> -- 
> 2.35.1
> 
> 

