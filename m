Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.3496.1596139696435816195
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 13:08:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=ljMWsbfH;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f193.google.com with SMTP id l6so26812540qkc.6
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 Jul 2020 13:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jv2gP4gUTgDMwS1HhdMyuoD4E0NTp4x9CcVkEVZ1CAg=;
        b=ljMWsbfHY2nQtygWAuOw3C0/yDF26DaSiVQ15IJs9WbfKnBFSkEgUf4K+fzWjquvmz
         3jMVoCLdP5L+sHNechOeThbI6DbOiSAhiVQ0kUKcTmpS+DDK7WkAAhqb1evMS6353ED3
         Y48oQhsHFV3lvpPohQvVEHETCtOSgptZmrOBnEU4ErijvxE0WOOj8A1KLw9sYQi1QqSM
         CSd5JkukvC1dcNuHGbf8JJStzxyhh9a5PDLH+OoECLl6fLhTcenfetDYFkZj1ecINZAZ
         CjteO4dNKRSaM5BGSZi4FB778XHNNAhuk3MDyicxFX4WEmb32TMNmUTCBL0e/NmC9rVs
         FTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jv2gP4gUTgDMwS1HhdMyuoD4E0NTp4x9CcVkEVZ1CAg=;
        b=Eas8e5Pv/KYZsR6ErhOPy8FgCVn8p2FdJlMwtgbhTUO3uNR5JzHv7MrMdhqMNgXSd8
         BW/SMbNbpMPEShBqp66r0byZg6LDnmD/7cu588Rs01hbUy2Iub06DHUqRIB1yPHNDLDY
         Uy3LylgU03is25tb4JhAOCTIU4eEBRVj3bcO0ttAbKs4ZJQi7h5aQMG9m7rvM1Z/5PPy
         OcSesnrL0Z0Wgj7ntXcfRa3XxdD8pj0B+hwI3r8S570d9w3VSZABpUCEICu0EpOmNhFE
         orhir8ygHM5/Yg9FpINzLnzCNNV748ZlVSocDJhskpJDDbvAhpCNbZ/so3iM4Vtjnqv6
         /2rw==
X-Gm-Message-State: AOAM533Lpn2AIqLRH82n1eCKv3Og2fK5w8qQjfe/Tk+41Y+oF8tCGif4
	2AZo83Ld0gEM92jl6CNK5lO50Q==
X-Google-Smtp-Source: ABdhPJxM6Q6zCRMekWnH8guK/NVpu6mk+eZ9flt4nvSkjl1iQEaRhEa2h3Ob8mGZvmNbluOsVbMMKQ==
X-Received: by 2002:a37:9287:: with SMTP id u129mr891399qkd.238.1596139695541;
        Thu, 30 Jul 2020 13:08:15 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:9dd:6e19:a3fe:5a3c])
        by smtp.gmail.com with ESMTPSA id 8sm5363749qkh.77.2020.07.30.13.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 13:08:15 -0700 (PDT)
Date: Thu, 30 Jul 2020 16:08:13 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp/linux-linaro-arm: remove disable of CONFIG_EXTRA_FIRMWARE for N1SDP
Message-ID: <20200730200812.GC15405@kudzu.us>
References: <20200730150426.27645-1-khasim.mohammed@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200730150426.27645-1-khasim.mohammed@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 30, 2020 at 08:34:26PM +0530, Khasim Mohammed wrote:
> The kernel defconfig has removed enabling of CONFIG_EXTRA_FIRMWARE,
> disabling the CONFIG_EXTRA_FIRMWARE isn't required.
> 
> Change-Id: I032b1aa7dd84c63f6aece5f24dbab43d14da278c
> Issue-Id: PLATFORMS-3134
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>

Both patches pulled into master.

Thanks,
Jon

> ---
>  .../linux/linux-linaro-arm-5.4/n1sdp/disable-extra-fw.cfg       | 2 --
>  meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend | 1 -
>  2 files changed, 3 deletions(-)
>  delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/disable-extra-fw.cfg
> 
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/disable-extra-fw.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/disable-extra-fw.cfg
> deleted file mode 100644
> index 35afddd..0000000
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/disable-extra-fw.cfg
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# We don't want to build firmware blobs into the kernel binary
> -CONFIG_EXTRA_FIRMWARE=""
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
> index dcc6e47..029dbbb 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
> @@ -11,7 +11,6 @@ SRC_URI_append_n1sdp = " \
>      file://0002-pci_quirk-add-acs-override-for-PCI-devices.patch \
>      file://0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch \
>      file://0004-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch \
> -    file://disable-extra-fw.cfg \
>      "
>  
>  # Referring to commit TAG N1SDP-2020.03.26
> -- 
> 2.17.1
> 

> 

