Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web10.637.1610117345177403106
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 Jan 2021 06:49:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=KeZ1IvhT;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.42, mailfrom: jdmason@kudzu.us)
Received: by mail-io1-f42.google.com with SMTP id r9so9989619ioo.7
        for <meta-arm@lists.yoctoproject.org>; Fri, 08 Jan 2021 06:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0lF3WqwGn+6+GNhOQQm13RMaoROh2/WK1f0LqwDq2p4=;
        b=KeZ1IvhTk15zpCyt0SjhV/haXQXIKmPK8R4LugSsCm6BA+4NcvYfCTmYRu6+7+0uao
         CPBAgcaaHmRT9I/ONAVR2Zc36PMW5yyFFO1Wd2iJ++OZNRF/BtSNGQDAhUAJVi2U4VW0
         d+qHc7o4mmqt3eSLVBLNwrBP0W5rT1ncgXHyWF8nWjt+T/jA1THfPN9c8Y3tOZMNpzDO
         yJfz+WIwNntO62/k6R3m+RWHiG6Ruif8NyB4kQkodWV4XwZmVGoZ9+l+RhC/i+q0EGC2
         wy3rQvcIyG/0FgDKY7fFawJYRGzgIRUmnbmUs1GJ+etajLsADTZ8ROG72vFuiwcb7VAH
         TIGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0lF3WqwGn+6+GNhOQQm13RMaoROh2/WK1f0LqwDq2p4=;
        b=Cz6CmTd1VdAcHw7w9Yo5vKCik31XzsbF1U4R4nczj+AGbKRehr+T3WHdJkKHQgp4mB
         6U6KmaKgbRFKHJKLW20xA0bQoiG63zfr5YLLERYLh6z9wMtCptFI7iwz6vF61Gpd7SZX
         MMkhGjl2j/zcJ4PLKTRAnHlsfO1TZhQq3xfjRpGVeIFaMpbPxG3P4fVFYmT406fX5P0J
         sx3yF2nyMDrQhKXDmGugpK5fN5nFNvoOwnZPb1TT+kS3lmkKDxgoECr+cEaPhja2bkNG
         kENjrx/2RV99wOvtf5fWesvM/0rzRGZwRJ0FJoWk69F5EJCwsU/5f1su5azvZhwDjA94
         WMPA==
X-Gm-Message-State: AOAM530OcVhnWw3YSoS4/pDpCqep1nU18cQaSoS2StgZQP1Z2/887lRj
	Cp4vATaEPH84XcgjOuATcC/g7QZqQT5kwg==
X-Google-Smtp-Source: ABdhPJxKOTIq368rvhVSf7SgsWVnnBjTEgVwSp8kB7i1BivwYG2uXnYZ92SOgRZ+5ZLMPF9HLCm4zg==
X-Received: by 2002:a02:a498:: with SMTP id d24mr3730928jam.4.1610117344633;
        Fri, 08 Jan 2021 06:49:04 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:10b9:360:420b:282e])
        by smtp.gmail.com with ESMTPSA id y3sm7394531ilq.9.2021.01.08.06.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 06:49:04 -0800 (PST)
Date: Fri, 8 Jan 2021 09:49:02 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] kas: add testing of gcc-arm
Message-ID: <20210108144902.GE29567@kudzu.us>
References: <20210107142537.3870474-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210107142537.3870474-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 07, 2021 at 02:25:37PM +0000, Ross Burton wrote:
> Add a build to verify that setting GCCVERSION to arm-10.2 works.
> 
> Change-Id: I086fa786b11560a8e94ee646859c59288bacba5d
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Pulled into master.

Thanks,
Jon

>  .gitlab-ci.yml | 3 +++
>  kas/armgcc.yml | 6 ++++++
>  2 files changed, 9 insertions(+)
>  create mode 100644 kas/armgcc.yml
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 9e14e2d..3ae0aa3 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -87,6 +87,9 @@ musca-s1:
>  n1sdp:
>    extends: .build
>  
> +n1sdp/armgcc:
> +  extends: .build
> +
>  qemuarm64-secureboot:
>    extends: .build
>  
> diff --git a/kas/armgcc.yml b/kas/armgcc.yml
> new file mode 100644
> index 0000000..52b09b0
> --- /dev/null
> +++ b/kas/armgcc.yml
> @@ -0,0 +1,6 @@
> +header:
> +  version: 9
> +
> +local_conf_header:
> +  libc: |
> +    GCCVERSION = "arm-10.2"
> -- 
> 2.25.1
> 

> 
> 
> 

