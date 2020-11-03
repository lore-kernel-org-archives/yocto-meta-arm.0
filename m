Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web12.4403.1604369493094675905
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 18:11:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=EU4NGULw;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.65, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f65.google.com with SMTP id dj6so3145198qvb.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 02 Nov 2020 18:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=a2IabwH/ge1KwBIUYFhv4Qw2gNV/bxXDG7E7kNhJsjU=;
        b=EU4NGULwl2RPB8yHl3cHEDFbT1TTnFgOEIvUg+vjQ5fPTHYQAyBF4vDEHBwWRups3F
         UeEgBmWSZkaIaZhNXZTcG4HOg823vKMZns6d7foFuuQfTQ4NAbDxK4lqMV77Oq7lwIZD
         s6ohhcTqiTb21rRtIjMbJF8AERm/BecxzsWfJF9E/W/eTJ3iIzo8tqGkeQkIsN8PrGEU
         6QTXtht6MoVTbd/Zrq4IHfB0rAjFuomjLq+3zuQvYXmnvHs45dmJ1Xzd5YhpwQIvW7P4
         +yBBy93VsXX8LbLLYYIgXqdUxJrGhtY9KVT/UDRzQSyEljcIuvTT1PCf4zihUXlSI98t
         2KZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=a2IabwH/ge1KwBIUYFhv4Qw2gNV/bxXDG7E7kNhJsjU=;
        b=kNVrySGRXrpdQSjBZkilZNHD7pB0QK6Vtd+zPbfnp4IAZPDbPY6fiBZSNEgM8XqebU
         n59u39GKVMhZxdYOat+QUy+GuRO78ATUzy+MmvEk0Ve0Onu7nx9PrtRpqsUUuGJLPOB3
         2+oUtdxcGt+6AAl9DEma+PZJKcA42oAOvep1xNE+x/8Q7u/5nUEojMGMr/muUZ3oiySB
         Zzm6FCFBPc2BBCOlJUwJyTSp6suO2etch56v5uBi57vEJ7EgZPPcnDTlwPTO5UdeDVL8
         6LKnt3k6+mVHdI0jMuTup8f6+y7OdsH1XPNz6gDSnpjWSH3xzkrmYL1d4wf0LCxGUJMA
         yx2g==
X-Gm-Message-State: AOAM530eOe/vu6PaSLVqb52CY2DYsX5vGmSCheZnfAlb11YWzux192ME
	oIRnrK/Is/lOdliCpn8d8LevrZvRyjjxIHPP
X-Google-Smtp-Source: ABdhPJx8SmVs03lqhQQjy3eJab93hHUQ8cue8p/NHsgBeVZ4stooPMSCG0onkZWl2bWFJ1BFEvNM0Q==
X-Received: by 2002:a0c:e387:: with SMTP id a7mr25121521qvl.21.1604369491652;
        Mon, 02 Nov 2020 18:11:31 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id i18sm9285725qtv.38.2020.11.02.18.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 18:11:31 -0800 (PST)
Date: Mon, 2 Nov 2020 21:11:26 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp/documentation: add corstone700 documentation
Message-ID: <20201103021125.GC24538@kudzu.us>
References: <20201102153502.2844733-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201102153502.2844733-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 02, 2020 at 03:35:02PM +0000, Ross Burton wrote:
> Add brief documentation for the corstone700 BSPs.
> 
> Change-Id: I774e06aecca05ac13eaf2916623c6ec097c1c047
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  meta-arm-bsp/documentation/corstone700.md | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta-arm-bsp/documentation/corstone700.md
> 
> diff --git a/meta-arm-bsp/documentation/corstone700.md b/meta-arm-bsp/documentation/corstone700.md
> new file mode 100644
> index 0000000..6a5fe0f
> --- /dev/null
> +++ b/meta-arm-bsp/documentation/corstone700.md
> @@ -0,0 +1,21 @@
> +# Corstone-700
> +
> +## Overview
> +
> +Corstone-700 is a flexible compute architecture combining Cortex-A and Cortex-M
> +processors and a secure enclave, aimed at building secure IoT SoCs.  There are
> +machines for both Corstone-700 for Fixed Virtual Platform (`corstone700-fvp`)
> +and Corstone-700 for MPS3 FPGA (`corstone700-mps3`).
> +
> +Further details are available in the [User Guide].
> +
> +## Building
> +
> +Corstone-700 is tested in 'tiny' configurations, such as `DISTRO="poky-tiny"`.
> +
> +## Running
> +
> +For detailed instructions as to how to run the image in a FVP model, or on the
> +MPS3 board, see the [User Guide].
> +
> +[User Guide]: https://git.linaro.org/landing-teams/working/arm/arm-reference-platforms.git/about/docs/corstone-700/user-guide.rst
> -- 
> 2.25.1
> 

> 
> 
> 

