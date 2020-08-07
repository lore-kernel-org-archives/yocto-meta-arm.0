Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.5552.1596833862122184554
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 13:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=RF5fca4e;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.67, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f67.google.com with SMTP id s15so1391945qvv.7
        for <meta-arm@lists.yoctoproject.org>; Fri, 07 Aug 2020 13:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kHS/qj2EY8algMY22nzeUYxO4RsUL2nZXJHhX+Va0FU=;
        b=RF5fca4eS0aJBRZmQygeTCYwpDyS2z+DRBG0+qGZF/XNTIk5CD4VBEnqdtnCQwMbGF
         m2NIZSUw8YkOr/t2zlGrUKiMoxxZXyLQM0fzGram90z8a9CDu9D+dmUW04J0O4zpoamo
         kMpIqiH2UXW2C2cjehg2yfP90Wx+mE7+Ha/hZ7K99Wt6ZsK+RraDdqzukG/dYdfli5b1
         NvgG5Lbp5yOZLzkQ+5ZO3YQkjTLwfMdVwlvcyV8G9HgqcH62wFh2t+Gwdwf+7/CKHaVU
         2fOv1Iy453t+7GCedVhuZYqI+z+c0Xe8lPnMSisEOpJ+fkFkPPoq+L5gbQZPZxz5BC4J
         OckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kHS/qj2EY8algMY22nzeUYxO4RsUL2nZXJHhX+Va0FU=;
        b=dtY9ONoQ0twnkmyJXCDUXGlUEBN55izkVuWIQb+qgt4lxf4XvqQP/U2d72smOWxR3f
         9I/6jO42JMbExQNgeJHcAsocIBUBm1Kz262EqZg1PMVrFDhCx6D8InI5aST2p5lvf833
         QM0/B48Pv5UozEaerXqNsIIbg/Z3cduEoOhgZsmYL10ZCrEfA3JqbfmQVheH6vvlowMP
         eyYt7aHg6OfUgwC7G2O98S8kj0cTtCqJLhEkZ9oCMrd1Fsp3Cf+0qAIld2H4v0SZ463G
         AnruqA5DssOsfgWqPjmsN2Nvkp8vS9n6YOte0qHwSZKBwXPcF5RkbIjN+d5VspxEXlzG
         il3w==
X-Gm-Message-State: AOAM533yMSY8t8lAo36oO0nSIpApGJvn2yO7pyOY1SDqq/bbaN/SdGOi
	302D5XWTQvMX40pGlipDdY9spw==
X-Google-Smtp-Source: ABdhPJyqdwez7YRZWTWudkM3N/E0sr+HxtcKkVXlvhl96nxSW4YHU3lRWQXkluyKZ9zRsdesFAYESg==
X-Received: by 2002:a05:6214:d46:: with SMTP id 6mr16791477qvr.240.1596833861240;
        Fri, 07 Aug 2020 13:57:41 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:e80f:35b:ebd6:4d35])
        by smtp.gmail.com with ESMTPSA id f31sm8972709qte.35.2020.08.07.13.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 13:57:40 -0700 (PDT)
Date: Fri, 7 Aug 2020 16:57:39 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Usama Arif <usama.arif@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com,
	Prabin CA <prabin.ca@rm.com>
Subject: Re: [meta-arm] [PATCH 1/2] meta-arm: trusted-firmware-a: add branch name for mbedtls
Message-ID: <20200807205738.GA440@kudzu.us>
References: <20200805101629.27959-1-usama.arif@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200805101629.27959-1-usama.arif@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

It appears that these do not apply cleanly to the master branch.  I'm
not sure if it is the SMTP issue or something else.  Can you please
rebase and resend?

Thanks,
Jon


On Wed, Aug 05, 2020 at 11:16:28AM +0100, Usama Arif wrote:
> It appears that the mbedtls team have moved the SHA which
> meta-arm was using from master branch. It is still present
> in mbedtls-2.18 branch so this is now used.
> 
> Change-Id: Ie932f446067767e85a25583b1bdc02b4739e323f
> Signed-off-by: Usama Arif <usama.arif@arm.com>
> Signed-off-by: Prabin CA <prabin.ca@rm.com>
> ---
>  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
> index 8286b64..7279173 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
> @@ -21,7 +21,7 @@ LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89
>  # Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
>  #
>  
> -SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls"
> +SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls;branch=mbedtls-2.18"
>  
>  # mbed TLS v2.18.1
>  SRCREV_mbedtls = "ca933c7e0c9e84738b168b6b0feb89af4183a60a"
> -- 
> 2.17.1
> 

> 

