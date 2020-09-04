Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web12.37717.1599225120535799112
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Sep 2020 06:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=TGMpqKRE;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f196.google.com with SMTP id n18so4554038qtw.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 04 Sep 2020 06:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=szOjf0kOQTWYRG+4hSKjBmPLPheR0noEzLLgz9hPl/o=;
        b=TGMpqKREH6BvNyjnSEm5dcrMx9nqgghHPHzjI1aIKWxzJAKWLcv8amdu85JdFdlzHY
         TGdDZ19z/JQdCPe7BCNK927XAwXH807iUMzmpFWI1tp8wuW5BCzHNlPWay1V8pwG91Rw
         qKwohk9PZZRHRbYcm94xyjjFVpC0+HkutCAnC6pOol57o/is8j9rsObsoVL6dmvC4cH4
         6YlSjkKimwxjgspYotczq9T1H74xoAS01Tsyf/FNZGeiKdN6q9uzNcFnRoTSJv1wE4OR
         8vtZiyOtFXqnpWYOxc6YLtAMy846UF7fmhgmSi59n+ElI94qaRqtCnFDPFxTHHpza+C3
         IYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=szOjf0kOQTWYRG+4hSKjBmPLPheR0noEzLLgz9hPl/o=;
        b=GlbrzaWcwyXIoMG4KRDd4dkzyGKAruOpI3yYXjnvM4JZ/v7EJHubltuhS6lrV28kXu
         lZtAy6O+D5q6fCB6lEG5Rbc/Yleq+5iUQJzQ4zLdTH+fkRV8Y8i8cwINCA6osgly+AjX
         CDA5+JG9+xLh22frFRjKhHUp2UGXEbTqc1/xOHnXCgG9CIchth36IbeZiOWyMgAsNEtr
         buqZ2zZ7r2I9F2cISGoJLERrIIUd+wN9KUMHu+5nT2tqhGxqGL25iYAMFjYCrPBtOCE6
         vCPsCDleVPwald4f7qTReykhmbtA+gbZl7Fgm444S+MJH4thInvNr5sL2JzAP29D7NU5
         Ucnw==
X-Gm-Message-State: AOAM533vtSRSzhKsUptkPfiHg7CkCiV4Y4qtHynCW+7cEQj7t7jKh0ev
	nM/I2fLLqCLfCrqh7KST0/Ckfw==
X-Google-Smtp-Source: ABdhPJwwChWNSTXuLivv3qG8RjgqvdMMicqQJVJ64UvjvmAwL7MVtF6oDQbshUHQsF9GvFhnQNQ8pQ==
X-Received: by 2002:ac8:118d:: with SMTP id d13mr8370611qtj.87.1599225119720;
        Fri, 04 Sep 2020 06:11:59 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id g5sm720833qtx.43.2020.09.04.06.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 06:11:59 -0700 (PDT)
Date: Fri, 4 Sep 2020 09:11:54 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH v2 1/4] arm-bsp: add cortexa73-cortexa35 tune
Message-ID: <20200904131154.GB693@kudzu.us>
References: <20200903173618.2910-1-jon.mason@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200903173618.2910-1-jon.mason@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 03, 2020 at 01:36:15PM -0400, Jon Mason wrote:
> Add ARMv8-A big.LITTLE tuning for cortexa73-cortexa35.  It is supported
> in GCC, and is the only one missing from OE-Core.
> 
> Signed-off-by: Jon Mason <jon.mason@arm.com>

Series pulled into master.

Thanks,
Jon

> ---
>  .../include/tune-cortexa73-cortexa35.inc      | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc
> 
> diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc
> new file mode 100644
> index 0000000..9e0786c
> --- /dev/null
> +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc
> @@ -0,0 +1,20 @@
> +DEFAULTTUNE ?= "cortexa73-cortexa35"
> +
> +TUNEVALID[cortexa73-cortexa35] = "Enable big.LITTLE Cortex-A73.Cortex-A35 specific processor optimizations"
> +TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
> +MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35", "cortexa73-cortexa35:", "" ,d)}"
> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35", " -mcpu=cortex-a73.cortex-a35", "", d)}"
> +
> +require conf/machine/include/arm/arch-armv8a.inc
> +
> +# cortexa73.cortexa35 implies crc support
> +AVAILTUNES += "cortexa73-cortexa35 cortexa73-cortexa35-crypto"
> +ARMPKGARCH_tune-cortexa73-cortexa35                  = "cortexa73-cortexa35"
> +ARMPKGARCH_tune-cortexa73-cortexa35-crypto           = "cortexa73-cortexa35-crypto"
> +TUNE_FEATURES_tune-cortexa73-cortexa35               = "aarch64 crc cortexa73-cortexa35"
> +TUNE_FEATURES_tune-cortexa73-cortexa35-crypto        = "aarch64 crc crypto cortexa73-cortexa35"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa35         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa73-cortexa35"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa35-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73-cortexa35 cortexa73-cortexa35-crypto"
> +BASE_LIB_tune-cortexa73-cortexa35                    = "lib64"
> +BASE_LIB_tune-cortexa73-cortexa35-crypto             = "lib64"
> +
> -- 
> 2.17.1
> 

> 

