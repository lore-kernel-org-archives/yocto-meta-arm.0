Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE646C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 20:04:53 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.14636.1647633892405202044
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 13:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=UGgmE0vE;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id y15so7664377qta.13
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 13:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lo042QTx++pA4Ih82ZaJXSleOA/c/cTW6XE8xVNx/qQ=;
        b=UGgmE0vEY/kU+FMvKZYcMH1ydQTNopvWsgXl7Owd5bKO2eh/BAJdkyG1t5HUR3mPmJ
         IQ27LXeU0RccKZLVdbV7eQ6VVDieyPHSgciRvJmwIZGkibWx5sfLLhi0HvJKD1Dezlkh
         GkLvY9jxytdwB035rp8mKK1/u839UFYECUpNcIWWwl9sn4+mTZOtPeew4v2bT6iU5TEi
         lE/IRAILwcU2boNWgF9U1Ty6G/ZJJArjgboJyZJqSoPJWwXMxE30374q5iy8tA3ChOuC
         Ns4346Z4FWdLpbt+BjBtAgDjN/07Mdk7qkznGA7pAYPzv5K69uxDmVFWw/kfnooAzmeQ
         WvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lo042QTx++pA4Ih82ZaJXSleOA/c/cTW6XE8xVNx/qQ=;
        b=NA7gW4V5Bb5ytgRo7RLflmWuaM+QUQyWjeJ5iXYBCPylDM+lpudozpCw12fkZtPi6O
         c3WPsC+okDmL0czk7XKfRnYeeA2UKs+slUpocNRld3N/MGtcSqm3hWluaiUrtf1ZX0Yd
         sXxVEPEEWhPAFB7w0roBGpn8w2VI94NHnLpShtuBwk/LCjCX/iOfDWFCYTRk8joMGT6t
         NXWwQ7opSsF/nl9QXpExbD2snRh2yVI6C7AbHqF+MJoOKlx3UjDuLDhRSa6ChU4fD4zj
         rf+87zYv9X95ShBov/o4cce7apR1vUh1fnY3rErK0OFhEA09fPEA+zJhM4K33RKpw18B
         QNVQ==
X-Gm-Message-State: AOAM531L6fFELhKDfoATNBB09OHoHb5TgrB8qanfHa6Yo7eIdnyIuuAn
	kn+ajFdgjeLbT+wsmqEMeOuQTA==
X-Google-Smtp-Source: 
 ABdhPJyUgn23/Yug2+dQFFmxqMvYioBx6kQ00PVbtrZWvhx0OIct/Z7H5nssnwgXgMEdpwfTFUS6Fw==
X-Received: by 2002:a05:622a:1749:b0:2e1:b971:f404 with SMTP id
 l9-20020a05622a174900b002e1b971f404mr8771436qtk.662.1647633891484;
        Fri, 18 Mar 2022 13:04:51 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 b26-20020a05620a119a00b0067e5a092d45sm1127556qkk.11.2022.03.18.13.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 13:04:51 -0700 (PDT)
Date: Fri, 18 Mar 2022 16:04:49 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, jon.mason@arm.com, ross.burton@arm.com,
	denis@denix.org, daniel.thompson@linaro.org,
	ralph.siemsen@linaro.org
Subject: Re: [meta-arm] [PATCH 2/2] ci: update Arm source and binary gcc
 version to 10.3
Message-ID: <YjTl4dX1KuuPcMze@kudzu.us>
References: <20220317111232.488767-1-sumit.garg@linaro.org>
 <20220317111232.488767-2-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317111232.488767-2-sumit.garg@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 18 Mar 2022 20:04:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3189

On Thu, Mar 17, 2022 at 04:42:32PM +0530, Sumit Garg wrote:
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>

The subject should be 11.2, not 10.3

Also, this should really be part of the previous patch, as the
previous one won't pass CI without this one (and thus isn't atomic for
bisecting).

Thanks,
Jon

> ---
>  ci/armgcc.yml            |  2 +-
>  ci/get-binary-toolchains | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/ci/armgcc.yml b/ci/armgcc.yml
> index d63ae24..d46f0b3 100644
> --- a/ci/armgcc.yml
> +++ b/ci/armgcc.yml
> @@ -3,4 +3,4 @@ header:
>  
>  local_conf_header:
>    cc: |
> -    GCCVERSION = "arm-10.3"
> +    GCCVERSION = "arm-11.2"
> diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
> index 838342a..bfdd8c5 100755
> --- a/ci/get-binary-toolchains
> +++ b/ci/get-binary-toolchains
> @@ -2,7 +2,7 @@
>  set -u
>  
>  HOST_ARCH=$(uname -m)
> -VER="10.3-2021.07"
> +VER="11.2-2022.02"
>  
>  DOWNLOAD_DIR=$1
>  TOOLCHAIN_DIR=$2
> @@ -15,18 +15,18 @@ if [ $HOST_ARCH = "aarch64" ]; then
>  	#AArch64 Linux hosted cross compilers
>  
>  	#AArch32 target with hard float (arm-none-linux-gnueabihf)
> -	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
> +	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
>  elif [ $HOST_ARCH = "x86_64" ]; then
>  	#x86_64 Linux hosted cross compilers
>  
>  	#AArch32 target with hard float (arm-linux-none-gnueabihf)
> -	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
> +	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
>  
>  	#AArch64 GNU/Linux target (aarch64-none-linux-gnu)
> -	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
> +	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
>  
>  	#AArch64 GNU/Linux target (aarch64_be-none-linux-gnu)
> -	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64_be-none-linux-gnu.tar.xz
> +	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64_be-none-linux-gnu.tar.xz
>  else
>  	echo "ERROR - Unknown build arch of $HOST_ARCH"
>  	exit 1
> -- 
> 2.17.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3179): https://lists.yoctoproject.org/g/meta-arm/message/3179
> Mute This Topic: https://lists.yoctoproject.org/mt/89842776/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kudzu.us]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


