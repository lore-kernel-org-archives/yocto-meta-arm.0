Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95CFC001DF
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 08:00:55 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.2788.1690790450464966829
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 31 Jul 2023 01:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FG/0CZU+;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4fb7589b187so6882924e87.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 31 Jul 2023 01:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690790448; x=1691395248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ctM88gNG7wE9M+1i6wyDs1CY1R1gNI3jCdJvlupg3tg=;
        b=FG/0CZU+9E9WO7jX9cKJ9zsDUJl0kEXCMPTVCyLceEJg+0aM7vCW1QMhKviX3bB3D6
         lw70xcPZPt6b6zSB3LXEtrrIxFWheqbrpFLo0hA0gvQNLp+zZ9txnYj8DtIgTH+WtgAt
         xTGkKanBT5oGTS7Tzj7OMCyYphre8qx2MTDpE2ZEKCp12utQPuBTu8YTWc2zHcwyPUwR
         6wmy1yK84WgiU3K+6fh64ghsRToz80RN/8PSg8pXRtaCj5Eko77V3MKrO6AmvnAG8AMb
         Xxh+UVUhHIZ0rLhnkIqLcbhqsK6oqIFzwmzhCnu1BhJtvlct5sKQRWN1I8euqThgUXPN
         POCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690790448; x=1691395248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctM88gNG7wE9M+1i6wyDs1CY1R1gNI3jCdJvlupg3tg=;
        b=S7zUNBZtW/T4XHZO9Rn/NCpWShIBbdhT/+Wi76nCtrp9WCRGH7SY7SFF/FashSe12O
         uxcfaY+blb1C19yVvwnx9FS9uUAgYmVWj2vcgmsQHV5b801IXRczWQ/0SwWBp+UkG75O
         Jh9P7zxb9XcpcB+vTUghHCSA9X1v+Gy3uHjaiYdB48FofPg2P/XX1/42JbBIfiisrDDQ
         Xsd1E33HloLcw1nWv06YTaBGcSsefvuIS7LDeRsd7ptS6Pu2KjKNsp0+qqrZsXBcpTMZ
         W6qbs7Kb8SaQSdpeMS+QY4pfbhnrM0M4s/Box+fniF1zWyWwnVBlgrscOT8a5IUcJgjd
         zIkw==
X-Gm-Message-State: ABy/qLbrs+UmEGpYMkh8R48otrADYbgjWQy0D+f+HdDB54xJXjPWnK9V
	SkkN00yDj5CEf03SwUobkdwoQw==
X-Google-Smtp-Source: APBJJlFgaISrYQkSjADZkrie91QF4bBUTM1km1H02Sx2dBnR4Z4rAU9wvtu1/6yFi12bCL5/eip54w==
X-Received: by 2002:a05:6512:1591:b0:4fe:8c4:44f4 with SMTP id bp17-20020a056512159100b004fe08c444f4mr6778205lfb.62.1690790448461;
        Mon, 31 Jul 2023 01:00:48 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id f11-20020ac251ab000000b004fe1e0ded25sm1617838lfk.184.2023.07.31.01.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 01:00:47 -0700 (PDT)
Date: Mon, 31 Jul 2023 11:00:46 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Ross Burton <ross.burton@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 5/5] arm/scp-firmware: fix intermittent
 compile failures
Message-ID: <ZMdqLuZASkp4MRf8@nuoska>
References: <20230710130916.3414041-1-ross.burton@arm.com>
 <20230710130916.3414041-5-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710130916.3414041-5-ross.burton@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 31 Jul 2023 08:00:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4928

Hi,

On Mon, Jul 10, 2023 at 02:09:16PM +0100, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> scp-firmware passes -I/core/include to the compiler which doesn't exist,
> and sometimes gcc emits a fatal error.  It's unclear why this doesn't
> happen for everyone, but this workaround appears to be the correct
> solution.

Thanks, I was also struggling with this when SCP_OPTEE_DIR wasn't set on all
configurations.

Cheers,

-Mikko

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../files/optee-private-includes.patch        | 34 +++++++++++++++++++
>  .../scp-firmware/scp-firmware_2.12.0.bb       |  5 +--
>  2 files changed, 37 insertions(+), 2 deletions(-)
>  create mode 100644 meta-arm/recipes-bsp/scp-firmware/files/optee-private-includes.patch
> 
> diff --git a/meta-arm/recipes-bsp/scp-firmware/files/optee-private-includes.patch b/meta-arm/recipes-bsp/scp-firmware/files/optee-private-includes.patch
> new file mode 100644
> index 00000000..c2d86022
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/scp-firmware/files/optee-private-includes.patch
> @@ -0,0 +1,34 @@
> +Change the optee module includes to be private instead of public, so they don't get used
> +in every build, which can result in compile failures as /core/include/ doesn't exit.
> +
> +For some reason this behaviour isn't deterministic, a ticket has been filed with upstream.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +diff --git a/module/optee/console/CMakeLists.txt b/module/optee/console/CMakeLists.txt
> +index aebb7cc79..942aa98c8 100644
> +--- a/module/optee/console/CMakeLists.txt
> ++++ b/module/optee/console/CMakeLists.txt
> +@@ -14,7 +14,7 @@ target_include_directories(${SCP_MODULE_TARGET}
> + # Those includes are needed for mutex definitnion that is used in optee_smt
> + # notification
> + target_include_directories(${SCP_MODULE_TARGET}
> +-                           PUBLIC "${SCP_OPTEE_DIR}/core/arch/arm/include/"
> ++                           PRIVATE "${SCP_OPTEE_DIR}/core/arch/arm/include/"
> +                                   "${SCP_OPTEE_DIR}/core/include/"
> +                                   "${SCP_OPTEE_DIR}/lib/libutils/ext/include/"
> +                                   "${SCP_OPTEE_DIR}/lib/libutee/include/")
> +diff --git a/module/optee/mbx/CMakeLists.txt b/module/optee/mbx/CMakeLists.txt
> +index 305fa42b7..783a7970c 100644
> +--- a/module/optee/mbx/CMakeLists.txt
> ++++ b/module/optee/mbx/CMakeLists.txt
> +@@ -15,7 +15,7 @@ target_include_directories(${SCP_MODULE_TARGET}
> + # Those includes are needed for mutex defifitnion that is used in optee_smt
> + # notification
> + target_include_directories(${SCP_MODULE_TARGET}
> +-                           PUBLIC "${SCP_OPTEE_DIR}/core/include/"
> ++                           PRIVATE "${SCP_OPTEE_DIR}/core/include/"
> +                                   "${SCP_OPTEE_DIR}/lib/libutils/ext/include/"
> +                                   "${SCP_OPTEE_DIR}/lib/libutee/include/")
> + 
> diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb
> index 25cd1dcd..58482cd3 100644
> --- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb
> +++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb
> @@ -7,9 +7,10 @@ LIC_FILES_CHKSUM = "file://license.md;beginline=5;md5=9db9e3d2fb8d9300a6c3d15101
>                      file://contrib/cmsis/git/LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
>  
>  SRC_URI_SCP_FIRMWARE ?= "gitsm://github.com/ARM-software/SCP-firmware.git;protocol=https"
> -SRC_URI = "${SRC_URI_SCP_FIRMWARE};branch=${SRCBRANCH}"
> -SRCBRANCH = "master"
> +SRC_URI = "${SRC_URI_SCP_FIRMWARE};branch=${SRCBRANCH} \
> +           file://optee-private-includes.patch"
>  
> +SRCBRANCH = "master"
>  SRCREV  = "0c7236b1851d90124210a0414fd982dc55322c7c"
>  
>  PROVIDES += "virtual/control-processor-firmware"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4875): https://lists.yoctoproject.org/g/meta-arm/message/4875
> Mute This Topic: https://lists.yoctoproject.org/mt/100057036/7159507
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


