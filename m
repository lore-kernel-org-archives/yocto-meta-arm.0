Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.24100.1617033816397749604
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Mar 2021 09:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Qs6GJYzu;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id g24so9659750qts.6
        for <meta-arm@lists.yoctoproject.org>; Mon, 29 Mar 2021 09:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3Jsqhq3AQMlavgKdcMqiEbmkK+tDoZpPhhqnVerzXeQ=;
        b=Qs6GJYzufDwrKAvGoSuEXcSTW0W60iz8vl+rEy27h4Bugql/w+Jmv3XviWbAHtI2tc
         ADE6JPhJmNCcxPn1ItBPClCoPsnzdQaidOWiBuPoyKZbfbGUOx2Jhp9dM7fzSwhiJMX+
         SvuyiasWAa2rxORH9LRhfkH810fQIYb5hcLOXrKNtAkDv2oqZrgO9oM090hucN7BbW3R
         NQ5aIUbHa/g1QDdfDPYb+OJ08FeOXRg35hUNv7Fu8Gu+TOM+61xVdQ5scMQ4diGL6Mho
         CPltPbuKnx7SzH6DVfuAx+YaDQy3NMGspITClYjQLZjNG9SBw+tqa5oh6LRAgXIFHpTl
         4CqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3Jsqhq3AQMlavgKdcMqiEbmkK+tDoZpPhhqnVerzXeQ=;
        b=D3ecAagfD9zTzbK883XRbItd7E+GloGDhFIMa7h9ixWLuzsTXocbv2BySPtOds+qR7
         cB/+xSsSYRx4wqwC71wADDy4SCncecyoyoc7ofMlKPLLhrLvJdE8OWHYhScsIlVndUsG
         TMjHKFt6k5iMvdm5LJSSlH2MeFqsVPD/Wd5YsyK2rP75lHQ0I+VzPAptz6SST4rJjhaT
         TTH1oLV/XsCws2mw80V9aXbK6jVmOcoHCRlU4JP5OOn7o33kr8PFQyU6apt4w8AiJdNy
         /JOKllk3+aWyRY796+ZUS8RiYfZiKecLn0jzA42PPjiU9zl4MXnyznygRPHgFPRP5iu5
         rvYA==
X-Gm-Message-State: AOAM532mglFTB5IN4ZUnnfo/s8pNOwGVZtQ0oo/biWZMVtEagER4Ri6b
	9N5toQ9XWB/YB6KexALiBqEWOw==
X-Google-Smtp-Source: ABdhPJxIkA77wG8xSqM4ZYEjnYvlqBxGzVmOLiwAyZO198X6OP2YcOgF/JHfEs4lQlc+/VlXIh7MKQ==
X-Received: by 2002:ac8:d83:: with SMTP id s3mr23056209qti.333.1617033815586;
        Mon, 29 Mar 2021 09:03:35 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a601:f800:f5a9:734d:58ab:be1e])
        by smtp.gmail.com with ESMTPSA id c26sm6359606qtj.92.2021.03.29.09.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 09:03:35 -0700 (PDT)
Date: Mon, 29 Mar 2021 12:03:33 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Jack Davison <jack.davison@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] Fw: [PATCH] arm: Enable ptest for optee xtest
Message-ID: <20210329160333.GD32356@kudzu.us>
References: <AM6PR08MB49679C64E58B7ADC3664EF5A8E619@AM6PR08MB4967.eurprd08.prod.outlook.com>
 <AM6PR08MB496743D3739473CF74FBBF098E619@AM6PR08MB4967.eurprd08.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <AM6PR08MB496743D3739473CF74FBBF098E619@AM6PR08MB4967.eurprd08.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Patch does not apply cleanly to my tree.  Please rebase and resend.

Thanks,
Jon

On Fri, Mar 26, 2021 at 05:14:09PM +0000, Jack Davison wrote:
> Provides a run-ptest script for running xtest under ptest-runner. This
> script parses the output of xtest and converts it to Automake's test
> format.
> 
> Change-Id: I7c981422034b39701ddd74e176f2f5134ae607e6
> Signed-off-by: Jack Davison <jack.davison@arm.com>
> ---
>  .../recipes-security/optee/optee-test.inc     |  3 +-
>  .../optee/optee-test/run-ptest                | 52 +++++++++++++++++++
>  2 files changed, 54 insertions(+), 1 deletion(-)
>  create mode 100755 meta-arm/recipes-security/optee/optee-test/run-ptest
> 
> diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/recipes-security/optee/optee-test.inc
> index 969d5e2..877bdeb 100644
> --- a/meta-arm/recipes-security/optee/optee-test.inc
> +++ b/meta-arm/recipes-security/optee/optee-test.inc
> @@ -5,7 +5,7 @@ HOMEPAGE = "https://www.op-tee.org/"
>  LICENSE = "BSD & GPLv2"
>  LIC_FILES_CHKSUM = "file://${S}/LICENSE.md;md5=daa2bcccc666345ab8940aab1315a4fa"
> 
> -inherit python3native
> +inherit python3native ptest
>  require optee.inc
> 
>  # Linking fails on musl due to C++/threads
> @@ -19,6 +19,7 @@ SRC_URI = "git://github.com/OP-TEE/optee_test.git \
>             file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
>             file://0002-make-remove-Wno-unsafe-loop-for-clang.patch \
>             file://0003-make-remove-Wmissing-noreturn-for-clang.patch \
> +           file://run-ptest \
>            "
> 
>  S = "${WORKDIR}/git"
> diff --git a/meta-arm/recipes-security/optee/optee-test/run-ptest b/meta-arm/recipes-security/optee/optee-test/run-ptest
> new file mode 100755
> index 0000000..ba88c14
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee/optee-test/run-ptest
> @@ -0,0 +1,52 @@
> +#!/bin/sh
> +xtest | awk '
> +
> +    # Escapes the special characters in a string so that, when
> +    # included in a regex, it represents a literal match
> +    function regx_escape_literal(str,    ret) {
> +        ret = str
> +        gsub(/[\[\]\^\$\.\*\?\+\{\}\\\(\)\|]/ , "\\\\&", str)
> +        return str
> +    }
> +
> +    # Returns the simple test formatted name
> +    function name(n,    ret) {
> +        ret = n
> +        gsub(/\./, " ", ret)
> +        return ret
> +    }
> +
> +    # Returns the simple test formatted result
> +    function result(res) {
> +        if(res ~ /OK/) {
> +            return "PASS"
> +        } else if(res ~ /FAILED/) {
> +            return "FAIL"
> +        }
> +    }
> +
> +    function parse(name, description,     has_subtests, result_line) {
> +        has_subtests = 0
> +
> +        # Consume every line up to the result line
> +        result_line = "  " regx_escape_literal(name) " (OK|FAILED)"
> +        do {
> +            getline
> +
> +            # If this is a subtest (denoted by an "o" bullet) then subparse
> +            if($0 ~ /^o /) {
> +                parse($2, description " : " substr($0, index($0, $3)))
> +                has_subtests = 1
> +            }
> +        } while ($0 !~ result_line)
> +
> +        # Only print the results for the deepest nested subtests
> +        if(!has_subtests) {
> +            print result($2) ": " name(name) " - " description
> +        }
> +    }
> +
> +    # Start parsing at the beginning of every test (denoted by a "*" bullet)
> +    /^\* / { parse($2, substr($0, index($0, $3))) }
> +
> +'
> --
> 2.17.1
> 

> 
> 
> 

