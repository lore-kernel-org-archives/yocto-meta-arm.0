Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.62565.1598905666347425820
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 31 Aug 2020 13:27:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=idvgAYuk;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f196.google.com with SMTP id p185so7406284qkb.11
        for <meta-arm@lists.yoctoproject.org>; Mon, 31 Aug 2020 13:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4qEB6VJtg3qK1xZ/j0CpDjiF02jX1xTsUoCp4qPP7W0=;
        b=idvgAYukV21WmsK0b5Uds+RCEsDyfFwADnV6E0Ve1T5S9tjf3OveaSQaHkZN4EbpYc
         o4HnjQBl9R4/aKUOh0T57JKXQbXK1go8/5KHOPdwyFf5pAAs+lc9PvkXIIofLRsIiUty
         yiH1QySr0YG+Nol5NlitDIFTjcYZU8k/KYxy/OaQcSu9SrC7cP+OTi8EP1P/GyWB2qPJ
         vgLw2gS22O9jFLXb9t+OgKxhbzJ6KtcGRMiK6zVotZ8PZt94MabwaFit5H/AjZRstYkp
         e2JMorjO4N12DQEI9RryNq+yZkUDLVfoPRrLG5ljQhN/Hgx4pcJU41CWlLDzrtuqyZWI
         3NEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4qEB6VJtg3qK1xZ/j0CpDjiF02jX1xTsUoCp4qPP7W0=;
        b=TPdNzCoKGZoFpGUiV0/XdfxaUoig9xbGU+mUWHN3zP1oS7CN0ikHJbQ+DXyhSnKXfW
         11iOQfWRyZ4PqZIwwChj0w90uZ/DJddgz2Qdr2WX8qd7GVZ0ZgcfN/zoyCgAzhPfKZLq
         p0QcFEHmToaZq73AZBtPqTBjF9/41WEOJKuBkpYy01XvYOqn5SreRJ49Koksfo0pA9rS
         B3ak2z4hI4Y7JVQ8tpBn13RJFQjH8Aq688x+BTul+sJtRurmUH5Mta+C1e060z0Jm3o5
         ho19sue///3WYNwqLx6RiFYE0NZIQLcaXAuwVMzEJTCpWJOspC0wyAgg0LLEmHef/q6W
         sKlw==
X-Gm-Message-State: AOAM531DRqpQQKEwJq+d6YXaK9HbK+GAf/cvRHPsQU+o5lHM6CFXysfZ
	bsKuoVD03n9THcsQlBBZkdJKww==
X-Google-Smtp-Source: ABdhPJwKHxjwfbI8BcS4IRHKNwed9m9ykz93GcAuYcKG4V0Dq9NNbpWKmSMKfLBAHPBdIX8giTTZcg==
X-Received: by 2002:a37:8ec2:: with SMTP id q185mr3066459qkd.295.1598905665523;
        Mon, 31 Aug 2020 13:27:45 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id o16sm6272318qkk.114.2020.08.31.13.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 13:27:45 -0700 (PDT)
Date: Mon, 31 Aug 2020 16:27:40 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/4] arm/trusted-firmware-a: actually add mbedtls to SRC_URI
Message-ID: <20200831202739.GC17615@kudzu.us>
References: <20200828101545.1291491-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200828101545.1291491-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 28, 2020 at 11:15:42AM +0100, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> trusted-firmware-a.inc was conditionally adding the Mbed TLS tarball to
> SRC_URI, but all of the versioned recipes subsequently assigned over the
> top of it so the Mbed TLS tarball was never actually in SRC_URI.  This
> resulted in machine overrides needing to add the tarball themselves.
> 
> Solve by using _append so that the SRC_URI is actually changed.
> 
> Change-Id: I05cf1dec2c6422a40a42c615fb2b9b6e8d6f1cb0
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Series pulled into master.

Thanks,
Jon

> ---
>  meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index e1cffdf..7845dac 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -38,7 +38,7 @@ SRC_URI_MBEDTLS ??= ""
>  # This should be set to MBEDTLS LIC FILES checksum
>  LIC_FILES_CHKSUM_MBEDTLS ??= ""
>  # add MBEDTLS to our sources if activated
> -SRC_URI += "${@bb.utils.contains('TFA_MBEDTLS', '1', '${SRC_URI_MBEDTLS}', '', d)}"
> +SRC_URI_append = " ${@bb.utils.contains('TFA_MBEDTLS', '1', '${SRC_URI_MBEDTLS}', '', d)}"
>  # add mbed TLS chksum
>  LIC_FILES_CHKSUM += "${@bb.utils.contains('TFA_MBEDTLS', '1', '${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
>  # add mbed TLS to version
> -- 
> 2.28.0
> 

> 

