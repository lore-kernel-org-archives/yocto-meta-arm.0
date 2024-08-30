Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BD3CA1003
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 15:24:39 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.19207.1725031478203792185
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Aug 2024 08:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=J2c8dnk4;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7a8049d4a40so122636585a.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 08:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1725031477; x=1725636277; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oi+rTNEXmYeDIDEPo4Tpma/Vo7YNnePXZQWmcSa2bIs=;
        b=J2c8dnk4XYvnMvulXXZFRCsf3hBUnld5DWIun+G1xPl5c2KpuWxQGhF5jW6HbMwwVh
         Aau3+dxPZnY3Gvmo2ZWQAFZoYruSn++HWZnBoxB7lPPDXx4ByID6mYXOf28QeC2T8C7r
         0eQyp5iKNRZYrpVEDSucy8Ashyu033tgK4IVTfTFd7E+/3TuQwTrFgt0EmC7GqLrNFWX
         pY2i1grr3wHZj5KBalZjTakqtYeCsKKUCXg8F9AGAMSbVNTD9joVwCqH3k9rR4TLdPTl
         8vM5VHC/pI1YrRedJeoQUhNNeOMDgT91ZpazGU/d7OzMngFgzLS3AV06c2CJARBgm/+c
         1sEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725031477; x=1725636277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oi+rTNEXmYeDIDEPo4Tpma/Vo7YNnePXZQWmcSa2bIs=;
        b=if3KOp56uCAm68GRqhpnuX0KzRCHr54mztLg1gNyTxYTgRCOJH3CvGc/CkcObE6oz+
         /hCvRPnrmhjMs014yzHjvW03KHnGvAdaGymE3piqYxzQ4VmJZNMv2Brb3c6D556uugKb
         Snoi1SfqqPXSQtIOlJfRWN0XL73Ks1JiWQ5rNHXHGhxoHOa4HCxiLH2Looa7G3GgE6nt
         FkxWsIWV4MoymwWpiT5xIVJ35eqrOjB9amWBb08TPhMZTteCagY1dO+5br35WaDvQHLv
         cUSN76+3UWMnYI88vIb/I2/hRg1R6W5gMFHfpJ6YXkOFbH867alqMMj06+Yx97J4diS7
         JGeQ==
X-Gm-Message-State: AOJu0YwFO1XKDnSK55kjXR7JJv0TvDURnpneoVSBUkcyZyYTp+9s2iLs
	vSS85gF2V7B1H7RnGjgRRQ2lcRiDFGq4dTRYuyi4NP6gk/AA30dO/BJerAWy4A==
X-Google-Smtp-Source: AGHT+IGebZ9mggfKYcP4OQOki5PRrivU1vC1WylcLGQw6nXOP9bNOEIINU6dnr9sUtVj3jkgfm+ZDw==
X-Received: by 2002:a05:620a:4409:b0:7a2:ea4:d592 with SMTP id af79cd13be357-7a8042631fdmr811982585a.45.1725031477185;
        Fri, 30 Aug 2024 08:24:37 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806d8e806sm150503385a.135.2024.08.30.08.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 08:24:36 -0700 (PDT)
Date: Fri, 30 Aug 2024 11:24:35 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Javier Tia <javier.tia@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>, Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v4 11/13] systemd: Add UEFI support
Message-ID: <ZtHkM_KRdW9Bv18u@kudzu.us>
References: <20240829163209.47945-1-javier.tia@linaro.org>
 <20240829163209.47945-12-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829163209.47945-12-javier.tia@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 15:24:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6037

On Thu, Aug 29, 2024 at 10:32:07AM -0600, Javier Tia wrote:
> Signed-off-by: Javier Tia <javier.tia@linaro.org>

I'm going to want a HUGE comment on why systemd is required here.  Are
there some unique things in systemd that aren't present for sysvinit?
Also, I think the systemd patches should be squashed together.

Thanks,
Jon

> ---
>  meta-arm/conf/machine/qemuarm64-secureboot.conf              | 5 +++++
>  .../images/core-image-minimal-uefi-secureboot.inc            | 2 ++
>  meta-arm/recipes-core/systemd/systemd-efi.inc                | 1 +
>  meta-arm/recipes-core/systemd/systemd_%.bbappend             | 1 +
>  4 files changed, 9 insertions(+)
>  create mode 100644 meta-arm/recipes-core/systemd/systemd-efi.inc
>  create mode 100644 meta-arm/recipes-core/systemd/systemd_%.bbappend
> 
> diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> index 2483c4ac..542d09a3 100644
> --- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
> +++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> @@ -22,4 +22,9 @@ WKS_FILE_DEPENDS = "trusted-firmware-a"
>  IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
>  
>  MACHINE_FEATURES += "optee-ftpm"
> +MACHINE_FEATURES += "efi"
>  MACHINE_FEATURES += "uefi-secureboot"
> +
> +INIT_MANAGER = "systemd"
> +DISTRO_FEATURES += "systemd"
> +DISTRO_FEATURES_NATIVE += "systemd"
> diff --git a/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc b/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
> index 06046f6e..07e315a3 100644
> --- a/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
> +++ b/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
> @@ -9,3 +9,5 @@ QB_KERNEL_ROOT = ""
>  QB_DEFAULT_KERNEL = "none"
>  
>  KERNEL_IMAGETYPE = "Image"
> +
> +IMAGE_INSTALL += "systemd"
> diff --git a/meta-arm/recipes-core/systemd/systemd-efi.inc b/meta-arm/recipes-core/systemd/systemd-efi.inc
> new file mode 100644
> index 00000000..5572e51a
> --- /dev/null
> +++ b/meta-arm/recipes-core/systemd/systemd-efi.inc
> @@ -0,0 +1 @@
> +PACKAGECONFIG:append = " efi"
> diff --git a/meta-arm/recipes-core/systemd/systemd_%.bbappend b/meta-arm/recipes-core/systemd/systemd_%.bbappend
> new file mode 100644
> index 00000000..660358c2
> --- /dev/null
> +++ b/meta-arm/recipes-core/systemd/systemd_%.bbappend
> @@ -0,0 +1 @@
> +require ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'systemd-efi.inc', '', d)}
> -- 
> 2.46.0
> 
> 

