Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web08.649.1606946326788556043
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Dec 2020 13:58:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=fJRRQral;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.68, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f68.google.com with SMTP id ek7so1495542qvb.6
        for <meta-arm@lists.yoctoproject.org>; Wed, 02 Dec 2020 13:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=27BVGcNJbcR6bJ+5HONKmBm2IQGGDLgNH/ZFSHxM7jY=;
        b=fJRRQral+GT9SKMZFYw0nGH003vj+tMGWvYqkgNIZCQAE3PAoABHYncRM5aNacPdXJ
         qmifVLeK0T0SBQ2SZixzlCfJImo1XPIuXubnt2CZcl1sFPSlaUZyc+ERKUEeoReALscT
         MGDXdFZBv/6GRu6ZkPrfMO9SSqtrLoWoWZww/81zAmL6orAWXvNAyXgdtZjhtIPCVIdp
         acYmBWtY5HMA4PQRnPGMaj5rPFTYuuK3XkkGWGwL2poC0IkaLNIZwtaehq/j8pD4cflT
         JVDifCNTJWTlv+pRCUeQTT3aotBIJKUHHfWGLpoKBT/JDIdSRGAttyodOr+LFyFvLdB+
         wRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=27BVGcNJbcR6bJ+5HONKmBm2IQGGDLgNH/ZFSHxM7jY=;
        b=O1hz0TaQq94oTbPF1iCf+bF5U1ScKGH6FoZ+q+21DxnAsdrPNu+Ay+9yip68p1M0eV
         i4cxaNQAAklC77o9AxJDG+coEkbtZf6gaCu3nA3afweHOKgkhpN0H2AoafB+x4ITp8nu
         opUsbo9yJLnD4X/hFdlMNNAIPoIyJo6B8g7fGN/oELk+EKMSmW4Sk7rKwnNZZrBGdoh6
         CXJPj6SUqAdJHQR+v53M5h4wIRQ4WbiAKm+zF1E8Ocl9+B/eZ2HA+tDgh8935bPvkHUH
         UfltfyTzVW1fUpEy9PtYF2yy7YiQ3IDjTvo6ypfmrRmnyNSonx68y/6DQYwnVtinQjoy
         9O+g==
X-Gm-Message-State: AOAM531ZHLNmeVVy5e9TrN04AIcEhsxDD+RbjLgWVcNeTQtpAiChglB5
	WMZCTAfjpiAK1cmwBqbX+K9Fgw==
X-Google-Smtp-Source: ABdhPJzpFcjOTPZt+3R47FpArI2xZnW/5fEoZiKFkMa/DXOpEx1bdu6EfjRk108zAX4cV0oad3w9Rg==
X-Received: by 2002:a05:6214:2cf:: with SMTP id g15mr34678qvu.7.1606946324948;
        Wed, 02 Dec 2020 13:58:44 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:444f:a7dc:7480:61e])
        by smtp.gmail.com with ESMTPSA id a42sm204683qtk.64.2020.12.02.13.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 13:58:44 -0800 (PST)
Date: Wed, 2 Dec 2020 16:58:42 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm: update Android common kernel
Message-ID: <20201202215841.GA8922@kudzu.us>
References: <20201130162935.8869-1-jon.mason@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201130162935.8869-1-jon.mason@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 30, 2020 at 11:29:35AM -0500, Jon Mason wrote:
> Update ACK to ASB-2020-07-05_5.4-stable and remove the 4.19 recipe
> 
> Change-Id: Iecc56effff11ecd9619553381815445b64aa645e
> Signed-off-by: Jon Mason <jon.mason@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  .../recipes-kernel/linux/linux-arm64-ack_4.19.bb     | 12 ------------
>  meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb |  4 ++--
>  2 files changed, 2 insertions(+), 14 deletions(-)
>  delete mode 100644 meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb
> 
> diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb b/meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb
> deleted file mode 100644
> index 989b055..0000000
> --- a/meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -# SPDX-License-Identifier: Apache-2.0
> -#
> -# Copyright (c) 2020 Arm Limited
> -#
> -require linux-arm64-ack.inc
> -
> -SRC_URI = " \
> -    git://android.googlesource.com/kernel/common.git;protocol=https;branch=android-4.19-q-release \
> -    "
> -
> -# ASB-2020-06-05_4.19-q-release tag commit
> -SRCREV = "ebd43352dd92e56f14a4985a3c99de767fc8f9cf"
> diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb b/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb
> index 3221fd8..aab2fd1 100644
> --- a/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb
> +++ b/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb
> @@ -12,5 +12,5 @@ SRC_URI = " \
>      file://0004-libtraceevent-Fix-build-with-binutils-2.35.patch \
>      "
>  
> -# ASB-2020-06-05_5.4-stable tag commit
> -SRCREV = "2068976fd7b172b64020006efde1ee57af6bbf99"
> +# ASB-2020-07-05_5.4-stable tag commit
> +SRCREV = "056684c0d252f75c13be4abb7408f692eedab653"
> -- 
> 2.17.1
> 

> 
> 
> 

