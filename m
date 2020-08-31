Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web11.62577.1598905719344377847
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 31 Aug 2020 13:28:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=V6qTTgYQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f196.google.com with SMTP id z2so5731560qtv.12
        for <meta-arm@lists.yoctoproject.org>; Mon, 31 Aug 2020 13:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zm95smggOxjB13OZNdhUNmkK1uUNTaTNII+F0cIaKr0=;
        b=V6qTTgYQWJrtLnVs56IfCB2AOPKmNHDveWFeXfc05qqM3pjRLHRZASXXEdfIhITU3M
         O14RzxUojhf4nHT5pBCmAoChutdSCBD3QYvmp98O1XmeivN2Os6vLss5wk0NBOrMKHQg
         QvxSvBc5/odMaw2gO2jdoKw9y94kvZbjPKY8FWbzXoHXT7MARCa2A6lcg279dln/eBYI
         FdqYFlfV9XW2osQIcpTNMjQGqosQOQxLQfVnzi3ch8PMQlB/FroCFoLaASBLkn/epAmW
         hZlFAQ9L6C366aDg3pOUuksOA0r17wbyj4wYRkm4hfHypBX8/dGN3Mhk7FAcL56H36Sj
         TH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zm95smggOxjB13OZNdhUNmkK1uUNTaTNII+F0cIaKr0=;
        b=B+6Jbjq530O/fXdfvz2brVwy5lRyVGYsF6GbpIISbcIQsItIftpVCqsJMypaNq5wwl
         5T4iiL3yC8kVhFl0zLoKJJMdRYLamIFtecj/QBTMsqvY6yU8y8PgTK6gexxH/xpeZVPB
         wbduW+PrwoVfTCIKxsbEojDWnYQe2yeIEtLAke5n1DixCM+BLATfVeSQfBhaJqqIFDLl
         Oto3etbjXI1gw4ETSLrycwWk8KtO2zq0CPal6ccPaK2/V2KpIUUOjIg4mtIP05tv+Tcm
         jtwYaZM+VE4Zj8R6pbPdAhPWfMjIkgze1Y2yipF/+SkFtbQSIKfAgK7b0kVsjj0o4ea/
         8JuA==
X-Gm-Message-State: AOAM533DQggR+rmd0bUxT3sVECZdJGv0UX8bm4DAOIKxTdIhnA1+3qDv
	hN46QO+IoryA0jZW9lsCm8eqZQ==
X-Google-Smtp-Source: ABdhPJwRrN36fIf7pgvFquzxLF55LKHgmi7gVb2Mj7WYuVV39JmB1LzzTqFbmt5MlMZ78N9d8ktueQ==
X-Received: by 2002:ac8:3fee:: with SMTP id v43mr3119446qtk.192.1598905718515;
        Mon, 31 Aug 2020 13:28:38 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id g15sm11177485qtx.57.2020.08.31.13.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 13:28:38 -0700 (PDT)
Date: Mon, 31 Aug 2020 16:28:33 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Usama Arif <usama.arif@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 1/2] arm-bsp/machine: Fix ACK version for tc0 to 4.19
Message-ID: <20200831202832.GE17615@kudzu.us>
References: <20200828112157.33380-1-usama.arif@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200828112157.33380-1-usama.arif@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 28, 2020 at 12:21:56PM +0100, Usama Arif wrote:
> Change-Id: Ieca56d40c26367c158b9394d546323be4c1f81ce
> Signed-off-by: Usama Arif <usama.arif@arm.com>

Both patches pulled into master.

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/machine/tc0.conf | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arm-bsp/conf/machine/tc0.conf b/meta-arm-bsp/conf/machine/tc0.conf
> index 9b4f1ae..2de99cd 100644
> --- a/meta-arm-bsp/conf/machine/tc0.conf
> +++ b/meta-arm-bsp/conf/machine/tc0.conf
> @@ -14,6 +14,7 @@ UBOOT_MACHINE ?= "total_compute_defconfig"
>  # Trusted firmware A v2.3
>  PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
>  PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
> +PREFERRED_VERSION_linux-arm64-ack ?= "4.19"
>  
>  EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
>  
> -- 
> 2.17.1
> 

> 

