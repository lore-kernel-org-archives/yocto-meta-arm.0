Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.3568.1594753037907182710
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jul 2020 11:57:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=zmgSEBht;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id z63so16589878qkb.8
        for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2020 11:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Y4YKWBBubYABDKCfoKrkrefJy21pdVq2SVf9wh57rcU=;
        b=zmgSEBhtz2r8GD42/G+YD17pUJx7nYZcM7pQV1zuf3SzSRQKyC1djaMrT33kkRLmE0
         YlaTEZWVLUgW0eF+cDbktqrJvNWJXuPV8Npqab++H0JqdC75ajr8slFNVC90V37AhWN9
         9R1SAYtoD3aH6YIKDremHLDdG1Y7wo7fiCtW9NOEBezcUZD+KWCgeK17RCsgaFpzyuxB
         Md5d4kW1N5ET9qLArKBV7tXo0fDZb2q66amQ9NTsYZReibI87IHv92pgqUzxrRBgwl8g
         WJ38iQ2m4p5ynIL2lw7OLbBjJVxKhXD0KovIWYQ1CFEhyZOW0ujK67RXQE6YI6LqVr1B
         LEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Y4YKWBBubYABDKCfoKrkrefJy21pdVq2SVf9wh57rcU=;
        b=fH1IiIC8xOuBQoKQia/4b206da6hJB+GdIuFOINw+4oGz/C53tF2XHs7mqspVOQ4cL
         n1G2+BShkJRF7lEyzyS52HQa6IIQHSLtLwCycI32ZqR8SshBqztWr3r5MqpvNDp1LLI+
         qCMpORvTjCtCQyXs7X8sXbqgYuDyTh8gzm1mXOnUmMCjfci5pwMJbP6KGn2nrYRv+xNt
         oV009WYjGsrUEh31HzVx/o11PT8ZmXTn8qKkWhmS12Q99lmezgIVxFsaojarnBbOiNnB
         8jEx93Ifd1R2e1FiejWo6ChnnavZAZzVH81JOin9S1K66RSEkkRXy4WSqbrNVcdBT9Tj
         UniQ==
X-Gm-Message-State: AOAM533ZtYncZbGwn7jUQyYEfMfvZwCZzuTZC8cLsrA6alvWjsReN/Le
	wjXfRq9PPLiIXbzcjHxjQpHcO/8w2FDt1A==
X-Google-Smtp-Source: ABdhPJyMj/rgDblwd/bNcTYRk7+aQcl2jojB/O+1cfsMPiZLKepTe4ei/J3xFek5opmQzK6usNrT4g==
X-Received: by 2002:a37:c40a:: with SMTP id d10mr6192658qki.110.1594753037017;
        Tue, 14 Jul 2020 11:57:17 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:d523:4dcb:5d9f:3d2])
        by smtp.gmail.com with ESMTPSA id l67sm23618914qkd.7.2020.07.14.11.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 11:57:16 -0700 (PDT)
Date: Tue, 14 Jul 2020 14:57:15 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp/trusted-firmware-a: move machine customisations to the versioned appends
Message-ID: <20200714185714.GE17632@kudzu.us>
References: <20200714110345.570531-1-ross@burtonini.com>
MIME-Version: 1.0
In-Reply-To: <20200714110345.570531-1-ross@burtonini.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 14, 2020 at 12:03:45PM +0100, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> By having MACHINE_TFA_REQUIRE set and required in both the wildcard
> bbappend and the versioned append, the same file can get included twice
> which results in a warning from bitbake:
> 
> WARNING: trusted-firmware-a_2.3.bb: Duplicate inclusion for
> trusted-firmware-a-juno.inc in trusted-firmware-a_2.3.bbappend
> 
> Move the customisations from the wildcard bbappend to the specific
> version of trusted-firmware-a that is used for that platform to be clear
> about what platforms are supported and remove this warning.
> 
> Change-Id: Ib220aedbf94fa11d21ddc6c5f9ac2c5de5c66b7a
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  .../trusted-firmware-a/trusted-firmware-a_2.%.bbappend | 10 +---------
>  .../trusted-firmware-a/trusted-firmware-a_2.1.bbappend |  6 ++++++
>  .../trusted-firmware-a/trusted-firmware-a_2.3.bbappend |  2 ++
>  3 files changed, 9 insertions(+), 9 deletions(-)
>  create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bbappend
> 
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.bbappend
> index 2ce14b8..e5b10ff 100644
> --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.bbappend
> +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.bbappend
> @@ -1,11 +1,3 @@
>  FILESEXTRAPATHS_prepend := "${THISDIR}/files/:"
>  
> -# Machine specific TFAs
> -
> -MACHINE_TFA_REQUIRE ?= ""
> -
> -MACHINE_TFA_REQUIRE_foundation-armv8 = "trusted-firmware-a-fvp.inc"
> -MACHINE_TFA_REQUIRE_fvp-base = "trusted-firmware-a-fvp.inc"
> -MACHINE_TFA_REQUIRE_juno = "trusted-firmware-a-juno.inc"
> -
> -require ${MACHINE_TFA_REQUIRE}
> +# Don't put machine customisation in here, use a versioned append.
> \ No newline at end of file
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bbappend
> new file mode 100644
> index 0000000..f5f1632
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bbappend
> @@ -0,0 +1,6 @@
> +# Machine specific TFAs
> +
> +MACHINE_TFA_REQUIRE ?= ""
> +MACHINE_TFA_REQUIRE_juno = "trusted-firmware-a-juno.inc"
> +
> +require ${MACHINE_TFA_REQUIRE}
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
> index d8aa786..f37c589 100644
> --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
> +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
> @@ -3,5 +3,7 @@
>  MACHINE_TFA_REQUIRE ?= ""
>  MACHINE_TFA_REQUIRE_tc0 = "trusted-firmware-a-tc0.inc"
>  MACHINE_TFA_REQUIRE_a5ds = "trusted-firmware-a-a5ds.inc"
> +MACHINE_TFA_REQUIRE_foundation-armv8 = "trusted-firmware-a-fvp.inc"
> +MACHINE_TFA_REQUIRE_fvp-base = "trusted-firmware-a-fvp.inc"
>  
>  require ${MACHINE_TFA_REQUIRE}
> -- 
> 2.26.2
> 

> 

