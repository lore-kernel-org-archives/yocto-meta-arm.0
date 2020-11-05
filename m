Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web11.8465.1604587853053351267
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 05 Nov 2020 06:50:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=m8SSHO7+;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f196.google.com with SMTP id i12so1240337qtj.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 05 Nov 2020 06:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=S4lA/O6NJeatClpIjqiipfjg6/cTo7rlcMCI0W575n0=;
        b=m8SSHO7+30HojYSmUNl+kSh7AtbuUqlgkGheKMXSZxrqiti1QKbJhY2BQfZJxxklJR
         wepw/apIdW3+AVlgkDexYArPN8Ja0PoOgPsXYlQlKAfs74tokS57mbql6EjvOr4QbxOI
         8PAzzpBtY/bWC7+mM5F768JN5LFVsNX4S6CjGqr74lCcQ9KdiFDKeCAJYx0tAguBF710
         3fTbm7VI+4CVSSYw6NwLg6fOFaigY3ZJzhhw8/abELOZpp9uMQhcDKThZeL/Ke8darU6
         wDtYCL+OIi6KAFUpw5X+mRCTM5XOqNIFwd6QvLSEUoTTqGIdD1OERip/egCx6Lvm6zXi
         pBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=S4lA/O6NJeatClpIjqiipfjg6/cTo7rlcMCI0W575n0=;
        b=mbawx9faFGJ+RdmHsgxnNP+LqsNSJa0eCKzQzXKehmwsZcaD8OmxpaZe9fx9Ghjs3V
         Q3t29D3o6/bSh0JiQhoNbTPhOSd63CcoywuhSgtV74xlwo9Fz1Cc40iUeSMuq31Wg8vU
         9mebcl5g5R99h2x/XdxjgkJqrxzBPMuWnbB8+WK4jy8gKuuNE6Xdg3y9zRokUKOc2OVY
         NsHN/n/PUZZi0OgFtnANJuCKkEJFOUxkkD9QQED+uK3VaQJyS1X6K5M80mMYxZ8vGFf1
         9vemPIQQ2lN6/IHR2oNT7CN+qnsrqqNPm4P7kO+4T5DAXHNrTn7Gf+ZqMalofCQshiBA
         kVsA==
X-Gm-Message-State: AOAM5332CzTKYE7+5LtV6aAhg6eUNtVPCpYXH92pe6GjNImVm7vKdqjK
	QlulujBOBCHyEbr+jtuhwAxnNQt5+7lZ1Kfo
X-Google-Smtp-Source: ABdhPJw+lXnW85EOPrq8yHxXF10ebsMzAzY3Fc6End8L33t4HLSHWUDWc7zfrCPOVSIYArePI9QdLw==
X-Received: by 2002:ac8:75cf:: with SMTP id z15mr2338965qtq.120.1604587852121;
        Thu, 05 Nov 2020 06:50:52 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id a3sm998440qtp.63.2020.11.05.06.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 06:50:51 -0800 (PST)
Date: Thu, 5 Nov 2020 09:50:46 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] arm/trusted-firmware-a: clean up license assignments
Message-ID: <20201105145045.GB26392@kudzu.us>
References: <20201104134006.1121416-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201104134006.1121416-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 04, 2020 at 01:40:05PM +0000, Ross Burton wrote:
> trusted-firmware-a.inc can set LIC_FILES_CHKSUM so do += in the .bb files.
> 
> trusted-firmware-a.inc expects recipes to set LIC_FILES_CHKSUM_MBEDTLS,
> so just use = in the .bb files.
> 
> Change-Id: I673aec6f2ae59c58cd11517e1f2aecc538427796
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_1.5.bb  | 4 ++--
>  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb  | 4 ++--
>  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb  | 4 ++--
>  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb  | 4 ++--
>  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb  | 4 ++--
>  5 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_1.5.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_1.5.bb
> index 744ba8c..2e41e90 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_1.5.bb
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_1.5.bb
> @@ -14,7 +14,7 @@ SRCREV_tfa = "ed8112606c54d85781fc8429160883d6310ece32"
>  
>  S = "${WORKDIR}/git"
>  
> -LIC_FILES_CHKSUM = "file://license.rst;md5=e927e02bca647e14efd87e9e914b2443"
> +LIC_FILES_CHKSUM += "file://license.rst;md5=e927e02bca647e14efd87e9e914b2443"
>  
>  #
>  # mbed TLS source
> @@ -26,7 +26,7 @@ SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=ht
>  # mbed TLS v2.16.2
>  SRCREV_mbedtls = "d81c11b8ab61fd5b2da8133aa73c5fe33a0633eb"
>  
> -LIC_FILES_CHKSUM_MBEDTLS += " \
> +LIC_FILES_CHKSUM_MBEDTLS = " \
>      file://mbedtls/apache-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
>      file://mbedtls/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
>      "
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb
> index 1f36dbc..96df5c6 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb
> @@ -14,7 +14,7 @@ SRCREV_tfa = "e1286bdb968ee74fc52f96cf303a4218e1ae2950"
>  
>  S = "${WORKDIR}/git"
>  
> -LIC_FILES_CHKSUM = "file://license.rst;md5=c709b197e22b81ede21109dbffd5f363"
> +LIC_FILES_CHKSUM += "file://license.rst;md5=c709b197e22b81ede21109dbffd5f363"
>  
>  #
>  # mbed TLS source
> @@ -26,7 +26,7 @@ SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=ht
>  # mbed TLS v2.16.2
>  SRCREV_mbedtls = "d81c11b8ab61fd5b2da8133aa73c5fe33a0633eb"
>  
> -LIC_FILES_CHKSUM_MBEDTLS += " \
> +LIC_FILES_CHKSUM_MBEDTLS = " \
>      file://mbedtls/apache-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
>      file://mbedtls/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
>      "
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
> index cd57539..58e6c8e 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
> @@ -14,7 +14,7 @@ SRCREV_tfa = "7192b956bde11652a835eee0724dca0e403fee90"
>  
>  S = "${WORKDIR}/git"
>  
> -LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
> +LIC_FILES_CHKSUM += "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
>  
>  #
>  # mbed TLS source
> @@ -26,7 +26,7 @@ SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=ht
>  # mbed TLS v2.16.2
>  SRCREV_mbedtls = "d81c11b8ab61fd5b2da8133aa73c5fe33a0633eb"
>  
> -LIC_FILES_CHKSUM_MBEDTLS += " \
> +LIC_FILES_CHKSUM_MBEDTLS = " \
>      file://mbedtls/apache-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
>      file://mbedtls/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
>      "
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
> index 7279173..d333854 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
> @@ -14,7 +14,7 @@ SRCREV_tfa = "ecd27ad85f1eba29f6bf92c39dc002c85b07dad5"
>  
>  S = "${WORKDIR}/git"
>  
> -LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
> +LIC_FILES_CHKSUM += "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
>  
>  #
>  # mbed TLS source
> @@ -26,7 +26,7 @@ SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=ht
>  # mbed TLS v2.18.1
>  SRCREV_mbedtls = "ca933c7e0c9e84738b168b6b0feb89af4183a60a"
>  
> -LIC_FILES_CHKSUM_MBEDTLS += " \
> +LIC_FILES_CHKSUM_MBEDTLS = " \
>      file://mbedtls/apache-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
>      file://mbedtls/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
>      "
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
> index c443ecd..6adc00b 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
> @@ -15,7 +15,7 @@ SRCREV_FORMAT = "tfa"
>  
>  S = "${WORKDIR}/git"
>  
> -LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
> +LIC_FILES_CHKSUM += "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
>  
>  #
>  # mbed TLS source
> @@ -24,7 +24,7 @@ LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89
>  
>  SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls"
>  
> -LIC_FILES_CHKSUM_MBEDTLS += " \
> +LIC_FILES_CHKSUM_MBEDTLS = " \
>      file://mbedtls/apache-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
>      file://mbedtls/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
>      "
> -- 
> 2.25.1
> 

> 
> 
> 

