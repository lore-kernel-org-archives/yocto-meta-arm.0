Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web09.36922.1611584711273990885
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 25 Jan 2021 06:25:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=D/pvtk6r;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id q9so12232754qkn.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 25 Jan 2021 06:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wpplF5NHPmL8ccnSCzpQ9FaW4jgn2hf7k5Wfhukgg54=;
        b=D/pvtk6r9Prq6Bz0jLrPrNo0/xQIJ86Hgulv8XhNDmUdX7IG5BkDhxqrxHFegneNWI
         bIxH4skn/C5fA5MbFLNwQ9dphMSqwSYeM5iL0BBZPn36FBaTV3ImtV2+xtdvm6qyOdBG
         wDgSx/p+T8Jh9btPRbb58Ikie31R2hq+0HyzuJW7UEIQ0gY5aZRgR0nbKdxLZdOGAgFU
         reWf6F3C7r9Qp6wMWpBNjgn2VmGT1ADGi9kKlP8iuDeJak+T2q+6PpT2t24P1bXdOIqj
         Hbt+N8oSO+fukQUu85too1+0dEx/isrvSsMXiqDVXxAt5dv25A+LZMgpg0cXPhSNQ077
         fLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wpplF5NHPmL8ccnSCzpQ9FaW4jgn2hf7k5Wfhukgg54=;
        b=ZhZZDydazOMjBVdcTpeXXsXXgTTfZQ2NdzrBXTcklbPvRi46Kt9PIuwQhpYJGCwNa7
         zvXE7stZnjIsh58ygJDaaShqvP46P2wupx3ElPjpbCpPc1v0bJ88IzOpnAjnBvMep18l
         QMhintIq+FRg1378EEh2HMrfj3xR0YYfgKykw9ol1Yro5aOys5FIzjWXgfduW6+zMfc4
         XzjW5fWcKco2QgCtJBI0E1kWC63x59AVWskyObPwmEvXVR+CbkU5FgeQecFQldNehbfJ
         l3FNs8cH61jYW/heRsX/2KK+w9ALacnMjMEQdVg2PJ0ghvG2ma9T6pvhDMJNAJNF9ILp
         iqYA==
X-Gm-Message-State: AOAM531QfYqOVCDtwnBUsf8xdcC8KMEO/4t75Kq1JbCgxkDyD8uHn0BR
	aRqf9W7/YtWFu3G05mTvmgnv46SpUDjJSg==
X-Google-Smtp-Source: ABdhPJx5v6126XXPhGVfFunB3x6zoEO38ibs6S+lGBpdfoPCJdhKhHhY+i4UlUwDFr7ioX1czlEviw==
X-Received: by 2002:a37:49d6:: with SMTP id w205mr933759qka.322.1611584710495;
        Mon, 25 Jan 2021 06:25:10 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:3c22:b900:34fe:f580])
        by smtp.gmail.com with ESMTPSA id k67sm3559260qte.59.2021.01.25.06.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:25:09 -0800 (PST)
Date: Mon, 25 Jan 2021 09:25:08 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Peter Hoyes <peter.hoyes@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-autonomy/linux-arm-autonomy: Add explicit dependency on bridge.cfg
Message-ID: <20210125142507.GB21346@kudzu.us>
References: <20210120153938.2353135-1-peter.hoyes@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210120153938.2353135-1-peter.hoyes@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 20, 2021 at 03:39:38PM +0000, Peter Hoyes wrote:
> From: Peter Hoyes <Peter.Hoyes@arm.com>
> 
> xenguest-network depends on CONFIG_BRIDGE_NETFILTER, but the default
> value changed to 'n' in Linux 5.6
> (http://git.yoctoproject.org/cgit.cgi/linux-yocto/commit/?id=98bda63e20daab95bdc084ce00459a4f622a0505).
> Include bridge.cfg to define CONFIG_BRIDGE_NETFILTER manually for Xen
> host builds.
> 
> Issue-Id: SCM-2057
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> Change-Id: Id920d14f87a95214ee722007de923fd27b61afb3
> ---

Patch pushed into the master branch.

Thanks,
Jon

>  .../features/arm-autonomy/xen-host-iptables.scc                  | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host-iptables.scc b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host-iptables.scc
> index 8f8ba45..0820064 100644
> --- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host-iptables.scc
> +++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host-iptables.scc
> @@ -5,5 +5,6 @@
>  define KFEATURE_DESCRIPTION "Enable netfilter + conn tracking + extras"
>  define KFEATURE_COMPATIBILITY all
>  
> +include cfg/net/bridge.scc
>  include features/netfilter/netfilter.scc
>  kconf non-hardware netfilter-extra.cfg
> -- 
> 2.25.1
> 

> 
> 
> 

