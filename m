Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web10.13330.1607608949152890367
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Dec 2020 06:02:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=eNMcGxIn;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.68, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f68.google.com with SMTP id q7so2375786qvt.12
        for <meta-arm@lists.yoctoproject.org>; Thu, 10 Dec 2020 06:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DbXqccJFB3IiH/4l8T0rHmWLOyRfdoLqF3aS7tJMnc4=;
        b=eNMcGxInPMOdS+i5UOl4kttP+QDl1XLHNwb680jwZ30U4nwwgpVabvIwMmO5oHyKlB
         QyFRu/DanHAvO0MIn30kxShyj5Hue1eXaGNF1Sk9azDiNKDkxmBIHepP1T8BZynt5AGq
         GzmiRwMZ6nlNsxBTvs+PbQOgQ9MbHQEgR/k0brcxBx+7EXaBoR8DceAiB2nvmYJ51saS
         H0S1xswmJ6d2pNYYLYfGPc7Ps/j/4qPT3TW6cfUxpNo5bmswAlqwWAFx+MOtUerikkZe
         ZA3EQUsDe/9tWYS1d5C2UTwHhMPqzG4aacAQ2hogNhbcDFKsSxBqmvgPTrjdCHloHPk8
         MLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DbXqccJFB3IiH/4l8T0rHmWLOyRfdoLqF3aS7tJMnc4=;
        b=gog5iFTWCEbu5kIDvYJo+ma8QTjUHG1Ct04mXj7ABagq/S/mrIuNzpKFgK60X6xpBd
         M0VZYKp3T9huB6WgKMwVh1SeDaWOM8/LCHd1MqlB0sT6b0zUjxDElSzlxDp9G4T/0KyJ
         QieeFzKnCcTpQNg+Exo7EDrxXCo6dKHB4nH3ZJcMb2AY3I7ZsMDCNJ6BErZ8uxb/w4ro
         HaGPqfbYk3+VRMPb5RcyCAoFldJc4JTWVYpODpslRPnwkHnTHAxAIBlWNqXzpJNxAMHP
         iCQ2jMS/VKCx8Tw0yKIV7antNXUVaw1EXC4rQH4nkVhchr8FFbXRrwXleKplrH2qlGfl
         zQSQ==
X-Gm-Message-State: AOAM530l3wT0D3wcx9ODN9UQhhf+3PuFCCEEJFZSCiHZAMre26RKveCv
	uG5I/VyMbjc8ELMYwpkOEcGN1bHOLX/2ag==
X-Google-Smtp-Source: ABdhPJxy6A3lVrGga+4M2JhmPhDe0da/Qnmd9ER4Fu2dHDMeuqvhb5yMmrpsP8PsLpg9eGLRMvnWOQ==
X-Received: by 2002:ad4:4eef:: with SMTP id dv15mr9355558qvb.15.1607608948340;
        Thu, 10 Dec 2020 06:02:28 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:8083:6d46:abe1:7466])
        by smtp.gmail.com with ESMTPSA id p6sm1190502qtl.21.2020.12.10.06.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 06:02:28 -0800 (PST)
Date: Thu, 10 Dec 2020 09:02:26 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm/qemuarm64-secureboot: don't use -dev kernel
Message-ID: <20201210140226.GB27847@kudzu.us>
References: <20201209105714.4193993-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201209105714.4193993-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 09, 2020 at 10:57:14AM +0000, Ross Burton wrote:
> According to the comment linux-yocto-dev was being used to get a 5.5
> kernel as 5.4 was panicking on boot.  Now linux-yocto defaults to 5.8
> so just use the standard kernel instead.
> 
> Change-Id: Id382c69f16f2ff4b2cbc63be94a645e56616549d
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Pushed to master.

Thanks,
Jon

> ---
>  meta-arm/conf/machine/qemuarm64-secureboot.conf | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> index f2c15e6..fe19ed2 100644
> --- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
> +++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> @@ -6,10 +6,6 @@ KMACHINE = "qemuarm64"
>  
>  UBOOT_MACHINE = "qemu_arm64_defconfig"
>  
> -# The 5.4 kernel panics when booting, so use the development kernel until the
> -# default kernel is upgraded (5.5. supposedly works)
> -PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-dev"
> -
>  QB_MACHINE = "-machine virt,secure=on"
>  QB_OPT_APPEND += "-no-acpi"
>  QB_MEM = "-m 1024"
> @@ -23,4 +19,3 @@ IMAGE_FSTYPES += "wic wic.qcow2"
>  WKS_FILE ?= "qemuarm64.wks"
>  WKS_FILE_DEPENDS = "trusted-firmware-a"
>  IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
> -
> -- 
> 2.25.1
> 

> 
> 
> 

