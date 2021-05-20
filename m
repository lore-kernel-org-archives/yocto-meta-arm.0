Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.9958.1621524344463538227
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 May 2021 08:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Mus4fGPN;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id k127so16530822qkc.6
        for <meta-arm@lists.yoctoproject.org>; Thu, 20 May 2021 08:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=p7AcOntvvK91svR6aIjAvZMtITx0jWWSG9YWClH0+58=;
        b=Mus4fGPNzFMYBTdJDQ36pzn4GHEvA3Dgi7yZN0M9pnkKv6Ez5roo7khyQ6k8wodEar
         9ZqTU7xAQD1sOF3IVWCB/JHJqjWqzps5lI1/PKfGGfmvgiQ0Lh6uGPVqMewFKzOiBYIU
         JH+8zrScXrUxV+JA51BgNELoo6nykFr8ZN4oxi+oHwGr7rYi9lnFpx74+y7yR7AIt1Mf
         tuYa81pW9jQqPwyRCH5WgcC1OYd85EJcfUOTDB0pyr1cqc9ESYO2CwQ73QwS+/7ndPYM
         nUBUy/fJM4DgMkKSvremG1AG4Gx4mMyJwHEMFdkP8qf5tBB2ghRcKBPS2REjezzaU5TS
         1ZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=p7AcOntvvK91svR6aIjAvZMtITx0jWWSG9YWClH0+58=;
        b=fPK7ISppUNwHxlcz412++5IGFlI5uDgermeiLlPjJAxvZwHZQF+opVMZR1B6R1GPbG
         1iN6g3d8wEMChxo5Bn2aYHQhkUVIrR+BVxN+r6kJ06MvLr4sy1sy8l0APUKxIXexRcX+
         0Jc0V3yi+neUwJBro986HMOFLiVZmZn7wk7H+kB5U/xXqP+kY59euWylG8dy2hFOyUe9
         up2loSHOrECEy0Zwz2/gHX7XQ16K0py/qmZEUrOA6nDItljTaYBnkZqToAOdFVx94ytu
         WapKfz7A1ShzCTJr1AaLk302C7DTWTIDj/P0DE3aExaRI5BxNmQLZME3MhrRMne/f/Fs
         PbCg==
X-Gm-Message-State: AOAM5330gm9YPJQEFFxt3LG8tDMtNv3CxAiwK/6MEN4VR34Ti2Q/Uud3
	cU8uYhzzxFjgkj4X+xMlBVefqw==
X-Google-Smtp-Source: ABdhPJyyWHrtB07XIvPUQ3EEy1LRJmaYXrOr+NlKPjMoKj6gGbg+sYX3DXtdr0oXUtaqYh9sYV8xCQ==
X-Received: by 2002:a05:620a:22f2:: with SMTP id p18mr5820051qki.410.1621524343653;
        Thu, 20 May 2021 08:25:43 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id h16sm1648952qke.43.2021.05.20.08.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 08:25:43 -0700 (PDT)
Date: Thu, 20 May 2021 11:25:11 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, patches@linaro.org
Subject: Re: [meta-arm] [PATCH] arm/qemuarm64-secureboot: Enable kernel TEE drivers
Message-ID: <20210520152511.GA12500@kudzu.us>
References: <20210519074044.3376104-1-sumit.garg@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210519074044.3376104-1-sumit.garg@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 19, 2021 at 01:10:44PM +0530, Sumit Garg wrote:
> Add a config fragment to enable kernel TEE drivers.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>

Added to master branch

Thanks,
Jon

> ---
>  meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg      | 10 ++++++++++
>  .../recipes-kernel/linux/linux-yocto_5.10.bbappend     |  5 ++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg
> 
> diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg b/meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg
> new file mode 100644
> index 0000000..3de03bf
> --- /dev/null
> +++ b/meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg
> @@ -0,0 +1,10 @@
> +CONFIG_HW_RANDOM_OPTEE=y
> +CONFIG_TEE=y
> +
> +#
> +# TEE drivers
> +#
> +CONFIG_OPTEE=y
> +CONFIG_OPTEE_SHM_NUM_PRIV_PAGES=1
> +# end of TEE drivers
> +
> diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
> index b9995e0..3c3d36a 100644
> --- a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
> +++ b/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
> @@ -14,4 +14,7 @@ SRC_URI_append_qemuarm64-sbsa = " \
>      "
>  
>  FILESEXTRAPATHS_prepend_qemuarm64-secureboot = "${ARMFILESPATHS}"
> -SRC_URI_append_qemuarm64-secureboot = " file://zone_dma_revert.patch"
> +SRC_URI_append_qemuarm64-secureboot = " \
> +    file://zone_dma_revert.patch \
> +    file://tee.cfg \
> +    "
> -- 
> 2.25.1
> 

> 
> 
> 

