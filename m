Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web12.4393.1604369456538026634
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 18:10:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=AfUccEKS;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id p3so13459413qkk.7
        for <meta-arm@lists.yoctoproject.org>; Mon, 02 Nov 2020 18:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=X4o5IUu71kwzVIrHiCaasLXE9SiOWZh5+/ILRdyqjXE=;
        b=AfUccEKSpjnWtuEK0tc9QipycWbpdObQkMg7DZ59pdClbhs5ZYSyWRoVtE6qH+rs+b
         jkV5/sE+do9PCTRey1NnyG3OGrdSfuNxBbY/J74su8HBQBYItgzSLX9oFj1LXeMyw55D
         pP3QeZFFqQGVGvLrLfebW3NQ2eZQRvoIdN3BWy41lZRMZOOuiJ4SbnH5QAf9GVw0XcL4
         B9Dty0+FiWjpohlZ1t+AZuXE0s9bjMFIIbP5zQ8oRx+6DSc6L+1HTH9oqugHizTuVHgz
         AdDVYlLSXKjbiFeTeJqmxW5V+DR18XOzbCX3x6Lj7dvTQvd8GQKcrdVSOr48MOrEzexs
         KqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=X4o5IUu71kwzVIrHiCaasLXE9SiOWZh5+/ILRdyqjXE=;
        b=W0ZL53o7cOER3sGuX01q/TD7rr+6PuNDGhDFSOPyPXSYHnfcXzax+bOZotc5ofqjaN
         Fih6F10TCwCZAOERm9+Wj0fJQUShcAPcUMyjSnsUooMir/VpemQoyYLsMfYKOW0et1+9
         stbqNzoy8M1/hOzIJZdYOLEmiWqgzA1FOqpTHJGMyc5TKAqT58ZSs3Lj5a7SshDZxCq/
         AADEqFYmHi5GbwbfiYzWeNF5UyBImQ+tEPAOex3pdq14S8ktzECRy81u9BohLgLRnC35
         U6iD3zj2rJdSXm/e1ILOkYUS1Zv9JKcRuKXnWcf67QlNKnMSB6ohsaOOIcTQp+bDUgh8
         8LHA==
X-Gm-Message-State: AOAM5324nzSk0dm0c61AJOft9roio5BsRt9zCaovhOXEr17GoyM36Iti
	WJgNncRnIHg9ypQi9eQOwgo4qQ==
X-Google-Smtp-Source: ABdhPJxRK8EqFTVWYKGzVk/TCwz/72Q7Rv3SAAG6iPfdPsjUwNtWRoOMq3Iv4j79QVi+gfI+o+FI3A==
X-Received: by 2002:ae9:de45:: with SMTP id s66mr18265249qkf.281.1604369455706;
        Mon, 02 Nov 2020 18:10:55 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id x11sm9233301qtr.94.2020.11.02.18.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 18:10:55 -0800 (PST)
Date: Mon, 2 Nov 2020 21:10:50 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/7] arm/optee-os: improve sysroot lookup
Message-ID: <20201103021050.GB24538@kudzu.us>
References: <20201102153341.2844482-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201102153341.2844482-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 02, 2020 at 03:33:35PM +0000, Ross Burton wrote:
> optee-test uses the same functionality to find libstdc++ and libgcc_eh,
> so ensure that these libraries are found with the right sysroot too.
> 
> Change-Id: Ice0506a42655223045bcabec790eae3a3dbcf245
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Series applied to master.

Thanks,
Jon

> ---
>  ...ow-setting-sysroot-for-libgcc-lookup.patch | 26 ++++++++++++++-----
>  1 file changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch b/meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
> index 86e8428..1700539 100644
> --- a/meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
> +++ b/meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
> @@ -1,22 +1,34 @@
> -From 017994c477e2d082395460de83a7828d4e7d4b70 Mon Sep 17 00:00:00 2001
> -From: Joshua Watt <JPEWhacker@gmail.com>
> +From 0bab935695ebcf0c533b49896ab18ff33d4a47d1 Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@arm.com>
>  Date: Tue, 26 May 2020 14:38:02 -0500
>  Subject: [PATCH] allow setting sysroot for libgcc lookup
>  
> +Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS variable when searching
> +for the compiler libraries as there's no easy way to reliably pass --sysroot
> +otherwise.
> +
> +Upstream-Status: Pending [https://github.com/OP-TEE/optee_os/issues/4188]
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
>  ---
> - mk/gcc.mk | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> + mk/gcc.mk | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
>  
>  diff --git a/mk/gcc.mk b/mk/gcc.mk
> -index adc77a24..e238b9f3 100644
> +index adc77a24..81bfa78a 100644
>  --- a/mk/gcc.mk
>  +++ b/mk/gcc.mk
> -@@ -13,7 +13,7 @@ nostdinc$(sm)	:= -nostdinc -isystem $(shell $(CC$(sm)) \
> +@@ -13,11 +13,11 @@ nostdinc$(sm)	:= -nostdinc -isystem $(shell $(CC$(sm)) \
>   			-print-file-name=include 2> /dev/null)
>   
>   # Get location of libgcc from gcc
>  -libgcc$(sm)  	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
>  +libgcc$(sm)  	:= $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm))) \
>   			-print-libgcc-file-name 2> /dev/null)
> - libstdc++$(sm)	:= $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
> +-libstdc++$(sm)	:= $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
> ++libstdc++$(sm)	:= $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
>   			-print-file-name=libstdc++.a 2> /dev/null)
> +-libgcc_eh$(sm)	:= $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
> ++libgcc_eh$(sm)	:= $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
> + 			-print-file-name=libgcc_eh.a 2> /dev/null)
> + 
> + # Define these to something to discover accidental use
> -- 
> 2.25.1
> 

> 
> 
> 

