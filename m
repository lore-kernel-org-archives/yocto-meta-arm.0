Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web12.6171.1617195325401421545
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 05:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=JqeSI0Xr;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id o5so19185126qkb.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 31 Mar 2021 05:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yq9TgtEbAn6a8Y/T5j7Iy8XaXHMqTXVdCV1fffL+fI4=;
        b=JqeSI0XrDOo0w9kSVMTCgBSUtLDYguCOm4oiPWZG6QWQ7hl9eefAbLKELQ/XrpTn7F
         2dS3zjR0jjVJziVs448BuAEnFNPX20htBBFkWpmmp9E5+e0B1qt9+3Urvu9/1Ckf78nj
         sVtORSX4j5nk14Yoa4PITzqWtY3F7sY4di4PIHRGfrL+Oc+V0t2WYd/oRFTN3qLWNopk
         mvi35rplznhptmHR50P1Bzw8V+QS86e/eCHZDcUThjkrWtBHV19jlRi60t8Hk5i5E3bg
         /DfZGcCKnPI8PyAdxVLeGrO3NRjJPf8zatR0Mlwkm/8cd9Z1ZLwmdPkxLNLpJyYVuY2b
         tm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yq9TgtEbAn6a8Y/T5j7Iy8XaXHMqTXVdCV1fffL+fI4=;
        b=HANqGLEhNs8EMe81BDja1rPVlOgG3Q8ajIesZQMl8gspSqN7KUmaPyXx74ciOFwKLf
         L17hsk5lWVT35/mYA/1izK4AesIAeDRAPyNctFfmVTb73pzKn8qL4BIJClKE+Gw6cm+p
         0YCogIfPsLOe8L2smwk27dBbjVZLX/yZIm0xvUJ22Wscpr6rsevc7u6+f2WZ9M6KioWq
         0IMtU98oATP6amrUg7SF/0xnXkNWHsn95aSZTN4qMwT0nDJSMW2KedXtPELHYb+AQnev
         oH7IMWuky0Y8bV9fkQverLcodPPmOYzRiD8Y+9lxtjchGMrmC/+PH0Uteb35HwAr+7Os
         nH2A==
X-Gm-Message-State: AOAM531y6LdqQDGHOH4DrjNCGUcJT/FzSmroSWgR3xvRjud5+1kovbcJ
	puAkVMtObdSsgM/c+g0D5PCYUg==
X-Google-Smtp-Source: ABdhPJwc5s9ggIwoue1PSgLRMfynBSBn9euIy6K/4pOdo0e7Gh6bjtqfQa7YTWhr9xYNSSyTppDdIw==
X-Received: by 2002:a37:916:: with SMTP id 22mr2987182qkj.7.1617195324392;
        Wed, 31 Mar 2021 05:55:24 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a601:f800:4ba:158e:74b5:f678])
        by smtp.gmail.com with ESMTPSA id p5sm1372723qkj.35.2021.03.31.05.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 05:55:24 -0700 (PDT)
Date: Wed, 31 Mar 2021 08:55:22 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] CI: fix order
Message-ID: <20210331125522.GB9624@kudzu.us>
References: <20210329175652.22459-1-jon.mason@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210329175652.22459-1-jon.mason@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 29, 2021 at 01:56:52PM -0400, Jon Mason wrote:
> Machine order should be alphabetical
> 
> Change-Id: I83b1f1802d4db62cda7e49a591c7f26c4d22dd9a
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---

Patch included into the master branch.

Thanks,
Jon

>  .gitlab-ci.yml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 5dea6ac..4e247de 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -106,9 +106,6 @@ qemu-cortex-a53:
>  qemuarm:
>    extends: .build
>  
> -qemuarmv5:
> -  extends: .build
> -
>  qemuarm64-sbsa:
>    extends: .build
>  
> @@ -124,6 +121,9 @@ qemuarm64-secureboot/clang/musl:
>  qemuarm64-secureboot/musl:
>    extends: .build
>  
> +qemuarmv5:
> +  extends: .build
> +
>  sgi575:
>    extends: .build
>  
> -- 
> 2.17.1
> 

> 
> 
> 

