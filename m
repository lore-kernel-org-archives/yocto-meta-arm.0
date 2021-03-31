Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web12.6185.1617195391906105842
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 05:56:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=eex7OfpS;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f172.google.com with SMTP id c4so19170005qkg.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 31 Mar 2021 05:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tjvSC83bNUuvuVaYTDIjwSTEaVlpOTNoyzw8ZQw3tb0=;
        b=eex7OfpSjuPF7xUbE2b1wkFWBNc8Q9PIucG/E6KCBd1sVGyftk1Z4WIOmxBXZ712s3
         aJQNfYqx0hD1VzAVms5lr1JsYdWtNwcVYeL5Em88kjruGRJcsZGzokOSMuuLPTR+nqhh
         J8UjxoAMpM6bpXjxd8O6JfW5iJFk3rLC5i9B7xyzE2T0UOprJIM44v4vg7qPMMcy5Xgz
         +GospM9N7AH7xokC9o18POzmHRxerYwrWwCrvJv7kuwUc/8r4rxuacr6HyfLMc5a23bP
         seQUXbLQjVTYB+2LKGmb3WjLfW11GhZG7Gj0FGzsd+apZ2rgoduh4dtdZkrqQDV9WGgc
         q/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tjvSC83bNUuvuVaYTDIjwSTEaVlpOTNoyzw8ZQw3tb0=;
        b=Bc3wLlmh6vHLhfSZfdholZwXAl3j+xyUQ4CMPvge31+GZtNEjn+a0dYWOm6lvQIb8J
         RXlY7j8ghKhinEOSupiMaC+ZS5ESWhy/b/4AazBr49BsPbh8cmeAGBQKXl56o/NWIM+W
         8sPgALSMsg61+u2Y1ceGgZWodTFEvGacUUh4lMHWRjqKqIu2QfbZPROu/Edka2M17LGz
         v906/jDWPwFBlKlM6PltgzPoIhmcQd2f2bFdOiIaTGyUSO04moeWa5ThGyWmfE+p0NyM
         5N6VRm6F/JDMc1HmAbfRcxQaoAQRgzZMigcWTUnes9EmWXtD+lHXXzlZ9+6rYORpnIjQ
         lrTg==
X-Gm-Message-State: AOAM532qreCbvBgJowTJPsXaN4L/+ZGCgeIvHkrbzuWcyIz78ndKt5S+
	hNyvGP4js2KZiWJM1el6Ni68cGsHYonJjw==
X-Google-Smtp-Source: ABdhPJx5Mq36mvtU41/NEmWrUYu6oPyNGWajPuTxq0u4WfpFPsDIs3f/xgi1VIPcBghLijLyWPAKjQ==
X-Received: by 2002:a37:d17:: with SMTP id 23mr2842441qkn.191.1617195391095;
        Wed, 31 Mar 2021 05:56:31 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a601:f800:4ba:158e:74b5:f678])
        by smtp.gmail.com with ESMTPSA id 75sm1310044qkd.114.2021.03.31.05.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 05:56:31 -0700 (PDT)
Date: Wed, 31 Mar 2021 08:56:29 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Jack Davison <jack.davison@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm: Enable ptest for optee xtest
Message-ID: <20210331125629.GB8543@kudzu.us>
References: <20210330130215.40423-1-jack.davison@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210330130215.40423-1-jack.davison@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 30, 2021 at 02:02:15PM +0100, Jack Davison wrote:
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

