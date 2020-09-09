Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web11.12964.1599656623422870568
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Sep 2020 06:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=176CFgVp;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.66, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f66.google.com with SMTP id cr8so1407012qvb.10
        for <meta-arm@lists.yoctoproject.org>; Wed, 09 Sep 2020 06:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1s4aWjpN2bA9wTAQkaZ3CnLr2bAOcSgkmSy1KkWvKJ8=;
        b=176CFgVpaN3qpeX/eHSTC9mN0iPOIKoV/GYTFy9OTnKIJnn752uPvpmX9ZkqnDkvRa
         FMfjKMgJMXutPeo3VWUlptVgmUhDew2J2qOOOcQUNZWATNCRTIi14LLvGuRVq5PqJi3z
         Srzb3LHDiZvjcAJBmF3DVCnE7GSx71D6E2X/eAxXsPIqoV2fDVyRpyD1UJDHWkbEd/bI
         MfXzMdj/R/2eefg6ijf7S53BXSXUglqLllnitY+FGYuKLA0XK6BfpAPPaPSCYgsOnUUw
         SP8+Vqul7CqpLsaW8QNBQ32pnzWNpxYmPmZ+m5+cqoxMrOv3CsU+4GbxCHfCiGmMT4JQ
         QZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1s4aWjpN2bA9wTAQkaZ3CnLr2bAOcSgkmSy1KkWvKJ8=;
        b=Wzxc9CNE8im+PAeRpIlF6DI72rPvZ9aeZ+miukrYWA0s9mwn8T5m6ziq2xdIe9/uVb
         xUUQD1OS8Wpno8aIyBz5ZUq6n89A5d5PrlkWHR1j3jlsj0BLKUnnKCeXW7E7opNCH/M+
         gy1COWI7NCEULpY+Fg6ArlnYm4a8gX4gowLJVBRSdHxAZGJ08NNNvjxOgSup+74p3jvI
         LwIpb3rniTDkByYtcPEpB/45xFv53WLK9Eua6FxHOvSh+msVfQ4vPfqk4MQuuize1cUW
         UYA8sr66LB3YSQH1h9+IDBibkkVCIA/9GpZthgimutpi4jlB7+D3C5r3oP/HEQP8l+l+
         o1XA==
X-Gm-Message-State: AOAM533biC3h1oc6WpQSL/K6BtgeCPMi3ObwGpIM9KEjX3jrKqE2teDg
	S31XOll9WTKugq27nqlgKom2kA==
X-Google-Smtp-Source: ABdhPJy0lsBxPJpLLvbbeq+dwEbfAHh0IYzkp+/dYpbZrRD+OblFUb0n3Zp9VSywLqcDb+ISR+nIhQ==
X-Received: by 2002:a0c:c492:: with SMTP id u18mr3766309qvi.18.1599656622425;
        Wed, 09 Sep 2020 06:03:42 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id d49sm3001603qtc.55.2020.09.09.06.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 06:03:42 -0700 (PDT)
Date: Wed, 9 Sep 2020 09:03:37 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH v2 1/3] arm-bsp/n1sdp: update SRC_REV to latest validated version
Message-ID: <20200909130336.GA7089@kudzu.us>
References: <20200908072726.18776-1-khasim.mohammed@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200908072726.18776-1-khasim.mohammed@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 08, 2020 at 12:57:24PM +0530, Khasim Mohammed wrote:
> This patch updates the SRC REV for SCP, TFA and edk2-platforms to point to
> latest versions.
> 
> Change-Id: Ib6825d51fac89a9514b936ce927e7f5f3e508e26
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>

Series pulled into master branch.

Thanks,
Jon

> ---
>  meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc  | 2 +-
>  .../trusted-firmware-a/trusted-firmware-a-n1sdp.inc           | 2 +-
>  meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc         | 2 +-
>  meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb     | 2 +-
>  .../recipes-kernel/linux/linux-linaro-arm_5.4.bbappend        | 4 ++--
>  5 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
> index ce7acff..818b416 100644
> --- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
> +++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
> @@ -1,6 +1,6 @@
>  # N1SDP specific SCP configurations and build instructions
>  
> -SRCREV        = "fd7c83561a7d76c7681d5d017fb23aa3664c028c"
> +SRCREV        = "350be71a2ecef588b8ff5a095a0840de23506e45"
>  SCP_PLATFORM  = "n1sdp"
>  SCP_LOG_LEVEL = "INFO"
>  
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
> index 84657ce..88967a7 100644
> --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
> +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
> @@ -12,6 +12,6 @@ SRC_URI_append = " \
>      file://0001-n1sdp-arm-tf-disable-workaround-for-N1-Erratum-13157.patch \
>      "
>  
> -SRCREV_tfa = "f0b1864f8e309a41d2eb1c9510f8cd3c7aacbb1d"
> +SRCREV_tfa = "50eee85e044a77ad59f4903a5dad91b266770a1d"
>  
>  PV = "2.3+git${SRCPV}"
> diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> index 832b226..63154e3 100644
> --- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> +++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> @@ -5,7 +5,7 @@ SRC_URI = "\
>  
>  # TAGS and commit ID as per N1SDP-2020.03.26 release
>  SRCREV_edk2           = "3ff8a6bffabad761279817252014d59b6069d68a"
> -SRCREV_edk2-platforms = "b6bfc4417ff13168d69c4cbf2338f62c89c82dfd"
> +SRCREV_edk2-platforms = "d9d32e6c8b7456d21ce365486ac563b6be36c20d"
>  
>  # N1SDP specific EDK2 configurations
>  EDK2_BUILD_RELEASE = "0"
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
> index feed922..577af5e 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
> @@ -1,4 +1,4 @@
> -SRCREV ?= "41e8d7be674f98a0f3bef67b16ea2162109fd522"
> +SRCREV ?= "84baaae9e751c058717d9702438429257f077f03"
>  SRCREV_meta ?= "e32057eca987b7abbe3eb47ba36f06af8711278a"
>  
>  # KBRANCH is set to n1sdp by default as there is no master or 5.4 branch on the repository
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
> index c83d258..84e75e0 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
> @@ -15,8 +15,8 @@ SRC_URI_append_n1sdp = " \
>      file://scripts-dtc-remove-redundant-YYLOC.patch \
>      "
>  
> -# Referring to commit TAG N1SDP-2020.03.26
> -SRCREV_n1sdp  = "41e8d7be674f98a0f3bef67b16ea2162109fd522"
> +# Referring to commit TAG N1SDP-2020.07.27
> +SRCREV_n1sdp  = "84baaae9e751c058717d9702438429257f077f03"
>  SRCREV_dts_n1sdp = "3209a868152f348194cc1f20fd87c759d3a97d45"
>  
>  # Use intree defconfig
> -- 
> 2.17.1
> 

> 

