Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.3331.1596138897349886522
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 12:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=1rIFxysb;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f194.google.com with SMTP id g26so26828318qka.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 Jul 2020 12:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kxy8oNB3/OyQ1EYrY3Mn54jeJQOyBnKjyB27htNRgyw=;
        b=1rIFxysbIxqG+wux9BGlQvtr2kKFPqrssWVUN0OCkP3Sfhx/bAw58APsCoWtgTeMer
         VnaUWv1eWc6Wz8tR4BdtpUYbcEvrKyVNtqJw6gZ1uyvxHX1UenaStVnK1uKvDdijR+ei
         Lvh1aXcmcrXNIbDeNunovO/Nk96nPo25nYF40vtm2gZDJ0u1MX3J7Pi77WwsILHPU2aI
         P4jZUMVwoco6feySoLvKWE9JaWRCIQ7SnrISDZZpVz3zcnjWO266ht//8439sG8VR4sn
         7M8eitcGWMhFXa+jJE4bK7VCU7GbTVsE/Xghoi5sLbq/qD8neiubxq8h2ZmGWHLCJn/o
         yznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kxy8oNB3/OyQ1EYrY3Mn54jeJQOyBnKjyB27htNRgyw=;
        b=sO98A4HbHYvC77R4LVdyRYCfnzSDLOpFZzXtjoAutoC0O3KZER6P1GqxdNgAjCLJQ1
         hM/H/ILQNlip5MVK/6hiuZYTfbsJ7WAuzlaiNVkEf4LKeZ3rCEqjGZdfSc/JvUUNRnN/
         OaHIV/aKCO7RLikn7Wm5vysulowMvpODLbk9k713JD386SpEHYF1Y1HyEcZ5fJwydBJt
         zcdRk8tb8khxSAC1fxSfG0/kqk54FoutduVuPrxyBGDWtCzET5ooHXP1aNxn+sR7kzCP
         tSC6KODNyOdeKPCNe3rR4iacEv9wp30uAPmwfgQU1sWfGt7OWzxDF+HMVQ6CcPXNq9bB
         ESnw==
X-Gm-Message-State: AOAM5310mHsMk57XGe3ImWCpKD3qaE07ve8sCDqUERYaNJgpDNdTFCQ0
	h04an5dr/g6L0lZvgBxRuZaYxlQc+ejjyQ==
X-Google-Smtp-Source: ABdhPJyLJ8Efc3ZqyeFWJTGFelfLo/Mj0/1wqkJqg66Whw+c+O56MmM/cM3zMf1feMKReKQMQ60n4g==
X-Received: by 2002:a37:855:: with SMTP id 82mr903843qki.32.1596138896444;
        Thu, 30 Jul 2020 12:54:56 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:9dd:6e19:a3fe:5a3c])
        by smtp.gmail.com with ESMTPSA id z197sm5211412qkb.66.2020.07.30.12.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 12:54:55 -0700 (PDT)
Date: Thu, 30 Jul 2020 15:54:54 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 7/9] arm/scp-firmware: move to 2.6.0 release tag
Message-ID: <20200730195453.GA15405@kudzu.us>
References: <20200729101145.1794231-1-ross@burtonini.com>
 <20200729101145.1794231-7-ross@burtonini.com>
MIME-Version: 1.0
In-Reply-To: <20200729101145.1794231-7-ross@burtonini.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 29, 2020 at 11:11:43AM +0100, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> Instead of an arbitrary commit, set the base recipe to build the 2.6.0
> release.
> 
> Change-Id: Iec78c6ed903edfd020cca1222770d8ec018ae78a
> Signed-off-by: Ross Burton <ross.burton@arm.com>

For some reason, this patch did not apply cleanly via `git am`.  I
applied it by hand, as it was faily trivial.

Thanks,
Jon

> ---
>  .../scp-firmware/{scp-firmware_git.bb => scp-firmware_2.6.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-arm/recipes-bsp/scp-firmware/{scp-firmware_git.bb => scp-firmware_2.6.0.bb} (97%)
> 
> diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb
> similarity index 97%
> rename from meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> rename to meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb
> index a211621..ab7d9bd 100644
> --- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> +++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb
> @@ -6,7 +6,7 @@ LICENSE = "BSD-3-Clause & Apache-2.0"
>  LIC_FILES_CHKSUM = "file://license.md;beginline=5;md5=9db9e3d2fb8d9300a6c3d15101b19731"
>  
>  SRC_URI = "gitsm://github.com/ARM-software/SCP-firmware.git;protocol=https"
> -SRCREV  = "fd7c83561a7d76c7681d5d017fb23aa3664c028c"
> +SRCREV  = "db19910aca6d1032eb0329e5fbb70a92b997f6f2"
>  
>  PROVIDES += "virtual/control-processor-firmware"
>  
> -- 
> 2.26.2
> 

> 

