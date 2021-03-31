Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web09.6213.1617195340017848842
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 05:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=MqgLvhOJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id 30so9808343qva.9
        for <meta-arm@lists.yoctoproject.org>; Wed, 31 Mar 2021 05:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=FfiO3qcgiyeqkp25peBeeQ6SRsBU9v6NovrXdntriH4=;
        b=MqgLvhOJjavC6+Cg9btUqcy+qDn8ZSnQpmGZdUa4/HwbnUwz8sAozYCkxLt7Sr1b/x
         8Wv24dbz/s6ak0/46AckeqFtEaWF7G++d+q2yqLNA1M+UOiBYNAHxmF8iOhBrhBTHCvX
         BUmIyELOY4nn8RUCkqvJG5L01mgguPy8JEfWyEngh437XXn7kKbGIiFBvwfAybNtRHQy
         e9CfRaH7d14KBex9ptOF36OURcvZZW34qJ7fkqINzhuExTvxGnIGPJ1XQF7motal7tmt
         Gapx4b+dTvLsnbuLToCTxB71Y4MHyr4J5RkVVzqgoDfksP72a9EE4Rchmq1viGPeb+h1
         HjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=FfiO3qcgiyeqkp25peBeeQ6SRsBU9v6NovrXdntriH4=;
        b=g+GMxJF8JiPzRc0G7qN4E/xTk9H94UsPTCotaKfnDLQ0uFRPgS+V58zn2GZnBN1SvW
         vE4yQVlOiFMRFCtZjqu2GFtuSaAXFvQfvKTBb+QIhmjvAKKz3DZz4oBEEwpNZq5cmkc7
         uCMKdDAIlk9WheOej1vkNSicP0lysFdNV9y9AjTi106nN9ZT/vdUOiRVbjRgC1q7NPlC
         1eghvUuNMj2bzeJI+J0f2nl9Q0GLWyXFhgtHq4ROZx1Zw8aCK5Gyo5+hbzloLUCUjq1o
         27i3foeyBWzDQ8GxXIvDUZIpPrt883iAPXBoCQjj9gH6goxR5J3kFMsV2C3mPlOJuc/p
         tC5g==
X-Gm-Message-State: AOAM533HTw69ZYVaRxiL25TrVIFZ9IdvPppDbw62/cdeGCdCVziAQQTS
	8Tnhq+VWUev4z7vDdqLBhFNuBg==
X-Google-Smtp-Source: ABdhPJyhXEG40NakCH2YXNwasiTu9ABCMd0olW+huF9Lz2ewy4zj68A6cx8B8+fNjveVpyM1sZqoOg==
X-Received: by 2002:a05:6214:326:: with SMTP id j6mr2836749qvu.13.1617195339183;
        Wed, 31 Mar 2021 05:55:39 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a601:f800:4ba:158e:74b5:f678])
        by smtp.gmail.com with ESMTPSA id c26sm1237898qtj.92.2021.03.31.05.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 05:55:39 -0700 (PDT)
Date: Wed, 31 Mar 2021 08:55:37 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Jack Davison <jack.davison@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] arm: Enable ptest for optee xtest
Message-ID: <20210331125537.GC9624@kudzu.us>
References: <AM0PR08MB496369DE1256F32E238B3C068E7E9@AM0PR08MB4963.eurprd08.prod.outlook.com>
 <AM0PR08MB49633C9F6E7CE8C6447540648E7E9@AM0PR08MB4963.eurprd08.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <AM0PR08MB49633C9F6E7CE8C6447540648E7E9@AM0PR08MB4963.eurprd08.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Mar 29, 2021 at 05:56:59PM +0000, Jack Davison wrote:
> Provides a run-ptest script for running xtest under ptest-runner. This
> script parses the output of xtest and converts it to Automake's test
> format.
> 
> Change-Id: I7c981422034b39701ddd74e176f2f5134ae607e6
> Signed-off-by: Jack Davison <jack.davison@arm.com>
> ---

Patch included into the master branch.

Thanks,
Jon

>  .../recipes-security/optee/optee-test.inc     |  3 +-
>  .../optee/optee-test/run-ptest                | 52 +++++++++++++++++++
>  2 files changed, 54 insertions(+), 1 deletion(-)
>  create mode 100755 meta-arm/recipes-security/optee/optee-test/run-ptest
> 
> diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/recipes-security/optee/optee-test.inc
> index 969d5e2..877bdeb 100644
> --- a/meta-arm/recipes-security/optee/optee-test.inc
> +++ b/meta-arm/recipes-security/optee/optee-test.inc
> @@ -5,7 +5,7 @@ HOMEPAGE = "https://www.op-tee.org/"
>  LICENSE = "BSD & GPLv2"
>  LIC_FILES_CHKSUM = "file://${S}/LICENSE.md;md5=daa2bcccc666345ab8940aab1315a4fa"
>  
> -inherit python3native
> +inherit python3native ptest
>  require optee.inc
>  
>  # Linking fails on musl due to C++/threads
> @@ -19,6 +19,7 @@ SRC_URI = "git://github.com/OP-TEE/optee_test.git \
>             file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
>             file://0002-make-remove-Wno-unsafe-loop-for-clang.patch \ 
>             file://0003-make-remove-Wmissing-noreturn-for-clang.patch \
> +           file://run-ptest \
>            "
>  
>  S = "${WORKDIR}/git"
> diff --git a/meta-arm/recipes-security/optee/optee-test/run-ptest b/meta-arm/recipes-security/optee/optee-test/run-ptest
> new file mode 100755
> index 0000000..ba88c14
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee/optee-test/run-ptest
> @@ -0,0 +1,52 @@
> +#!/bin/sh
> +xtest | awk '
> +
> +    # Escapes the special characters in a string so that, when
> +    # included in a regex, it represents a literal match
> +    function regx_escape_literal(str,    ret) {
> +        ret = str
> +        gsub(/[\[\]\^\$\.\*\?\+\{\}\\\(\)\|]/ , "\\\\&", str)
> +        return str
> +    }
> +
> +    # Returns the simple test formatted name
> +    function name(n,    ret) {
> +        ret = n
> +        gsub(/\./, " ", ret)
> +        return ret
> +    }
> +
> +    # Returns the simple test formatted result
> +    function result(res) {
> +        if(res ~ /OK/) {
> +            return "PASS"
> +        } else if(res ~ /FAILED/) {
> +            return "FAIL"
> +        }
> +    }
> +
> +    function parse(name, description,     has_subtests, result_line) {
> +        has_subtests = 0
> +
> +        # Consume every line up to the result line
> +        result_line = "  " regx_escape_literal(name) " (OK|FAILED)"
> +        do {
> +            getline
> +
> +            # If this is a subtest (denoted by an "o" bullet) then subparse
> +            if($0 ~ /^o /) {
> +                parse($2, description " : " substr($0, index($0, $3)))
> +                has_subtests = 1
> +            }
> +        } while ($0 !~ result_line)
> +
> +        # Only print the results for the deepest nested subtests
> +        if(!has_subtests) {
> +            print result($2) ": " name(name) " - " description
> +        }
> +    }
> +
> +    # Start parsing at the beginning of every test (denoted by a "*" bullet)
> +    /^\* / { parse($2, substr($0, index($0, $3))) }
> +
> +'
> -- 
> 2.17.1

> 
> 
> 

