Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1048.1617121640671993299
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Mar 2021 09:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D17A440C16;
	Tue, 30 Mar 2021 16:27:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ozpgGPmqKpOq; Tue, 30 Mar 2021 16:27:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AD0BA40BA9;
	Tue, 30 Mar 2021 16:27:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0BBFF174568; Tue, 30 Mar 2021 12:27:18 -0400 (EDT)
Date: Tue, 30 Mar 2021 12:27:18 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Jack Davison <jack.davison@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm: Enable ptest for optee xtest
Message-ID: <20210330162718.GA23013@denix.org>
References: <20210330130215.40423-1-jack.davison@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210330130215.40423-1-jack.davison@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 30, 2021 at 02:02:15PM +0100, Jack Davison wrote:
> Provides a run-ptest script for running xtest under ptest-runner. This
> script parses the output of xtest and converts it to Automake's test
> format.

I think I see this same patch for the third time on the list - is it v3 or a 
re-send?


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

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
