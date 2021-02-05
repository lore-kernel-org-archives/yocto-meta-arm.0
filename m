Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.8384.1612533808202216827
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Feb 2021 06:03:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Una3BLRz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f177.google.com with SMTP id z32so4968983qtd.8
        for <meta-arm@lists.yoctoproject.org>; Fri, 05 Feb 2021 06:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jE4M6rgeOziOO+IUpCy2gqrSeF3Ryn6joOydcFA/CKg=;
        b=Una3BLRzoBO0e4cP0qlFce5xSKtUBH5X4Im+w+oqlmgxiFWmvUDtDU3lADD36cfsWy
         NrDtFjg1Zlkn642gUFJdtf7Tch3JW6gzkxk6HUUNHPHR2CziqCjV4Tj5pZ6XV6SyxALJ
         h7cgGdUWkNr01SnemwocVMcetQmMkXqFkxWcNjrChmqJaXh7X3eU0+cC6UYFdFTwN5Cx
         y/Anw1jXXjyZb4j4HQZKQPGmjPruFyHlmYpSjgRmpDA+7h9ohMzrIpVrKjczWUT59gQW
         4PyUwrrApBeOwyZ8mJDSEASnYFh/AUyh/xEXOoK45rE6bKPcPLXgxIMQhumxfllq/jo+
         IFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jE4M6rgeOziOO+IUpCy2gqrSeF3Ryn6joOydcFA/CKg=;
        b=edBY1tPM7qdNmKJOxVxxmtn+iYwU8ymgdFwh6DcsSdA7TmNbCs4GZ7pwrpP8JmCTkL
         RzWU2A7f0P4layXaNEHp4o1HR8EQ8mXcYI1Nq65t5CENg5BIeK1tzIJrq9QWi+VlN2tX
         4NvhXGAHQPKvyGilNwuXLvhOu2UBn4T+95xZshneoJsGzyhJCGRXbMzjKSxY+Q6vZqs2
         XFqBfZBqh1Cl2apL3cKQ0btxA4ttDi1CAdSdrDr9xOD4T6myM73cPw/ZogJd6Z6owPNo
         7h6FFoz9ScL4I/zOrle0Vg9SVpp5lVuUfAqYVgovWGomMqHSeo2MEVo98q5ZlUXr864e
         SjRg==
X-Gm-Message-State: AOAM530v4Dc5BwnbiK/vQo8+wFWDEIZ33y5PPnjAk8qJ7GGmC74dsiHi
	z/IIzQfWf1F4P8MO3ZwUJ1CZjQ==
X-Google-Smtp-Source: ABdhPJy5S2XqcjAwKkrCAOIBswkHFh5Uc0C5CyystC6Iu91UtArdJ9dtMWOI8uAMFlK3nMvO+ekVqw==
X-Received: by 2002:a05:622a:81:: with SMTP id o1mr4234051qtw.63.1612533807336;
        Fri, 05 Feb 2021 06:03:27 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:8487:5dab:f549:74c7])
        by smtp.gmail.com with ESMTPSA id d14sm7613306qtc.25.2021.02.05.06.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 06:03:25 -0800 (PST)
Date: Fri, 5 Feb 2021 09:03:23 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/6] gem5/gem5-aarch64-native: don't build gem5 three times
Message-ID: <20210205140322.GA32584@kudzu.us>
References: <20210204181405.20275-1-jon.mason@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210204181405.20275-1-jon.mason@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 04, 2021 at 01:14:00PM -0500, Jon Mason wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> The recipe currently builds gem5 binaries in optimised, fast, and
> debug mode.  There is no need to build three at once (and triples the
> build time), so simply build the optimised variant by default (as recommended
> by upstream) whilst letting the variant be altered by setting
> GEM5_BUILD_VARIANT.
> 
> Change-Id: I23baeee438d1ff08d1e2a54282141b55500f2ac1
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---

Series appled to the master branch

Thanks,
Jon

>  meta-gem5/recipes-devtools/gem5/gem5-aarch64-native.inc | 5 ++---
>  meta-gem5/recipes-devtools/gem5/gem5-native.inc         | 5 ++++-
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native.inc b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native.inc
> index 898fa23..0a8e34c 100644
> --- a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native.inc
> +++ b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native.inc
> @@ -1,8 +1,7 @@
>  # gem5 aarch64 specific configuration
>  
>  # Build arm64 gem5
> -GEM5_BUILD_CONFIGS ?= "build/ARM/gem5.opt build/ARM/gem5.fast \
> -    build/ARM/gem5.debug"
> +GEM5_BUILD_CONFIGS ?= "build/ARM/gem5.${GEM5_BUILD_VARIANT}"
>  
>  SRC_URI += "file://start-gem5.sh"
>  
> @@ -10,7 +9,7 @@ inherit deploy
>  
>  # Parameters for the start script
>  
> -GEM5_RUN_CONFIG ?= "gem5.fast"
> +GEM5_RUN_CONFIG ?= "gem5.${GEM5_BUILD_VARIANT}"
>  
>  # Linux kernel file to boot
>  GEM5_RUN_KERNEL ?= "vmlinux"
> diff --git a/meta-gem5/recipes-devtools/gem5/gem5-native.inc b/meta-gem5/recipes-devtools/gem5/gem5-native.inc
> index 3cad1eb..06c03e4 100644
> --- a/meta-gem5/recipes-devtools/gem5/gem5-native.inc
> +++ b/meta-gem5/recipes-devtools/gem5/gem5-native.inc
> @@ -6,8 +6,11 @@ LICENSE = "BSD & MIT & LGPLv2.1"
>  
>  # Gem5 build and run parameter
>  
> +# See http://www.gem5.org/documentation/general_docs/building for the list of variants
> +GEM5_BUILD_VARIANT ?= "opt"
> +
>  # What gem5 binary are we building
> -GEM5_BUILD_CONFIGS ?= "build/X86/gem5.opt"
> +GEM5_BUILD_CONFIGS ?= "build/X86/gem5.{GEM5_BUILD_VARIANT}"
>  
>  # Scons build arguments
>  GEM5_SCONS_ARGS ?= "CC=${BUILD_CC} CXX=${BUILD_CXX} \
> -- 
> 2.17.1
> 

> 
> 
> 

