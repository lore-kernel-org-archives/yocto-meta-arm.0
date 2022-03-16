Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37EFDC433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 13:28:24 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.25069.1647437303551852057
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 16 Mar 2022 06:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=cqb5iw20;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.48,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f48.google.com with SMTP id kl20so1772665qvb.10
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 16 Mar 2022 06:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=F6I24RGgf5w4w/qpunWstth/0cPX8wFq62ZnaBvO1DA=;
        b=cqb5iw20Ds4tqnBqXTM0WnNE7kT81k6e6NR5IiTAU86+uycMTuU9yjrp6qcSB4Zjjj
         b448cl1Pcj0j/pPX/hhRm3DqoOO2yKw63YKPHVHHEI9LNFsa9KyCVlNgDZUs0U3ODI/d
         0Ai7WIygIKOLkMybxbEuS42hmL9vHa7gLXJbQ1tkjEgY7G9aNHW6C5Ez4wEM8gAMiUzs
         40Xvy2IGFXEYY6YP7dzZrx0dZnTRV5VaZ7y6sWX1Xt8fl6XjLZzu2lI4jWrc8HYbROC6
         V/QJZPu+OtXkFr7QMPh2WSqi8xcAvWdkGiOc1wV0boy23jGpfY5RnF5KzuCtH86aLWuP
         R3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F6I24RGgf5w4w/qpunWstth/0cPX8wFq62ZnaBvO1DA=;
        b=LvbMR+umYs9XPtU57qRdAghCYNy4KTNCdgGcLqNf/fbx7wTbk7BSZ5uvWYDOQ1ZaQG
         yAUvJQx4QNmCrLlDHxbZlonBkwqGYV7F3K3qj6Ic0xrGT2YY8wqFfAYurrt+PFd3HNx4
         B74D8JL6O3LTS5Qwio4YWRnxidCBR2TO7+6HNqo9AJ3AlymUw6zazt4XwLVAQRx+w4mZ
         KEgd0leaY3Hisb+5s/Dcuhm9GFPR8SyvZJHAwl9Y1pru7ziJFWZSSOiSQK93FJTxc+xA
         Lf7ArrZdxDTyT3Gijfd6sYeUDmW5losbtQmAH/yUOcGxg9Bxoyo3DT5dD+MvRQFCAQ61
         M8Wg==
X-Gm-Message-State: AOAM530D42K7dZREciDY5IRp3HFn6VpjunwO1Kab5lpBr6vnNgcD3bGi
	UfcNmioHlFllICAHUb5Md9n8cw==
X-Google-Smtp-Source: 
 ABdhPJxot8XOqsdTAVUw7RlPmsuPYLFxxonmdEwUVuzbptK5o9UmP/EbR1mDgasDXWJIR+PPuEzWoA==
X-Received: by 2002:a05:6214:21e7:b0:435:3078:3ce5 with SMTP id
 p7-20020a05621421e700b0043530783ce5mr24964085qvj.56.1647437302627;
        Wed, 16 Mar 2022 06:28:22 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a66c:b900:89ff:a949:e1d2:d4f8])
        by smtp.gmail.com with ESMTPSA id
 o4-20020a05620a22c400b0067e02a697e0sm920530qki.33.2022.03.16.06.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 06:28:22 -0700 (PDT)
Date: Wed, 16 Mar 2022 09:28:20 -0400
From: Jon Mason <jdmason@kudzu.us>
To: harry.moulton@arm.com
Cc: meta-arm@lists.yoctoproject.org, Ross.Burton@arm.com, nd@arm.com
Subject: Re: [PATCH honister 2/2] arm-bsp/corstone1000: Add RDEPENDS to
 remove unwanted images.
Message-ID: <YjHl9MVQMCW46PjQ@kudzu.us>
References: <20220314162502.25350-1-harry.moulton@arm.com>
 <20220314162502.25350-3-harry.moulton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220314162502.25350-3-harry.moulton@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 16 Mar 2022 13:28:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3175

On Mon, Mar 14, 2022 at 04:25:02PM +0000, harry.moulton@arm.com wrote:
> From: Harry Moulton <harry.moulton@arm.com>
> 
> Remove unwanted build images that push the binaries size over the size
> limit for corstone1000.

I don't see this in the master branch.  Is this not needed there (if
so, please add to the comment above as to why).  If so, please send
there first.

Thanks,
Jon

> 
> Signed-off-by: Harry Moulton <harry.moulton@arm.com>
> ---
>  meta-arm-bsp/conf/machine/include/corstone1000.inc | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
> index 6ec0982..200fad1 100644
> --- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
> +++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
> @@ -51,6 +51,8 @@ KERNEL_IMAGETYPE = "Image"
>  
>  INITRAMFS_IMAGE_BUNDLE ?= "1"
>  
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base ?= ""
> +
>  #telling the build system which image is responsible of the generation of the initramfs rootfs
>  INITRAMFS_IMAGE = "corstone1000-initramfs-image"
>  
> -- 
> 2.17.1
> 
> 

