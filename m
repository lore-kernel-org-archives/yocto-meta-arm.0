Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.5076.1592518381215754478
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jun 2020 15:13:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=RzOkptb9;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f196.google.com with SMTP id g18so5742149qtu.13
        for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jun 2020 15:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NSISeCJvAIaCip/WyT/i1NtIaIYvuEhxUjSAqILDOj4=;
        b=RzOkptb9fTIithr+fhyJgOZHJ+6C4F702e9UJIcMP9Y/jZDMb61uxBljSVef9eXRuy
         HL7IglmidjIL30DTNWFJMyeVN/Ydgn7k1sw74Daz0f02XE5T5xbLc+dsL6b68fkCHHAf
         //UDgyh6IzkYyPJ4kbZ9oAXk6wz5ZNGtADpGpAcUqiaqGJhrgQh65vWQiRRg0MIzF/OH
         6NcPIBAs18nOG4Ky7oX4+UHm54esCmkEYdtMwBc4XRj5agcG+W4Hjo9lcKu/ENm51nMp
         OnddARVJ2eDoOhu66UvY1oa3oCopopKdQ+ARP5NTjxmwfxPrwU5XSuyVmUj4po5ZMa/S
         4isg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NSISeCJvAIaCip/WyT/i1NtIaIYvuEhxUjSAqILDOj4=;
        b=AjlsVHzS2s7sQZJ4z8UxJwPThJGZARpiCjAqUmY9MInfXh3qOU86IrlB45VwzcdW03
         C6HQkQv7+wS4GS1lUwh3IxgGvOfvwXnb06TkBgG5MXQelNyWrksvLaIIC8qKyWozM6kS
         Cjy5WZnLmisydnwOBHE2B+obZY5BlZkyD59rvasa/ZEEzQllasswUxCPQzLRHERN+nkZ
         sWkdlmbI+YcT8ygyBQfNBRc8Xv8ydbNEHpU8GatKGstKOHPfOP6+CmD6G4K8hil4IdU0
         gEPD4HqGE7TO2uS5lj1J5f/aMzbJ5ecc8uA6JlHT4Ga75mKo68ZQlbW+jX3VfCqdqT96
         Pc7A==
X-Gm-Message-State: AOAM530DtHNSks2ymUAqnLPziaG2d2QQwLYvu6588cVs/jp9jT0E7T28
	gNoQNH8aKcJkvlf6xJjobex8ww==
X-Google-Smtp-Source: ABdhPJzXZQ+mAlOXDF1MvxMz4CwC11BYx2rd8L5eksw55cVPblwd6DfI2/n5ZRi6MKHtOnv2+Kxj9w==
X-Received: by 2002:ac8:c4:: with SMTP id d4mr399381qtg.45.1592518380379;
        Thu, 18 Jun 2020 15:13:00 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:f04f:fa6f:35e8:ae6f])
        by smtp.gmail.com with ESMTPSA id o66sm4197743qka.60.2020.06.18.15.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 15:13:00 -0700 (PDT)
Date: Thu, 18 Jun 2020 18:12:58 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: Re: [meta-arm] [PATCH] arm/edk2-firmware: fix passing of linker flags
Message-ID: <20200618221258.GB22389@kudzu.us>
References: <20200616165558.31239-1-khasim.mohammed@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200616165558.31239-1-khasim.mohammed@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 16, 2020 at 10:25:58PM +0530, Khasim Mohammed wrote:
> The build initially worked because host machine had
> util-linux-dev installed, the build failed otherwise.
> This patch will fix the passing of linker flags.
> 
> Change-Id: If2f31e8e31109b9c8fd62b32d2f80902a1dd3cfd
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  meta-arm/recipes-bsp/uefi/edk2-firmware.inc | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> index 7b9327c..6696768 100644
> --- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> @@ -48,6 +48,9 @@ python __anonymous() {
>  }
>  
>  do_compile() {
> +    sed -i -e 's:-I \.\.:-I \.\. ${BUILD_CFLAGS} :' ${EDK_TOOLS_PATH}/Source/C/Makefiles/header.makefile
> +    sed -i -e 's: -luuid: -luuid ${BUILD_LDFLAGS}:g' ${EDK_TOOLS_PATH}/Source/C/*/GNUmakefile
> +
>      # Copy the templates as we don't run envsetup
>      cp ${EDK_TOOLS_PATH}/Conf/build_rule.template ${WORKSPACE}/Conf/build_rule.txt
>      cp ${EDK_TOOLS_PATH}/Conf/tools_def.template ${WORKSPACE}/Conf/tools_def.txt
> -- 
> 2.17.1
> 

> 

