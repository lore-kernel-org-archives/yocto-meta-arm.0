Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
 by mx.groups.io with SMTP id smtpd.web12.17080.1602781063629981133
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Oct 2020 09:57:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=2CBPArrS;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.195, mailfrom: jdmason@kudzu.us)
Received: by mail-il1-f195.google.com with SMTP id t18so5007862ilo.12
        for <meta-arm@lists.yoctoproject.org>; Thu, 15 Oct 2020 09:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=F1WL5xAV5lobtkUJD2tmXy4aEDGH/HmJkbk2H67j+1M=;
        b=2CBPArrStkaxT/qCmYXCRQ+qi9ypQM2us5nbxbcsB95bjTJVb4UVatC4Q0ad23LSgb
         W5Gd6uYKW2zeMu7exMFo0aeo7+0r/WZzGXW+51gDdXH91LzAyzYW8/fjyBnyC8Jp0kJm
         XfRgznqnOrDnBHlP0dufNnCtBr2aYv1k7i7LiJQrbeY3QTwu7HaDZ/nuLm5fXXw7YknX
         ndnyCRqi4903+NSLgJ9wh5IiJ2YhC0d/lFa3Brj0z7t1sHjU8riLVbM0I/YSl9Ercvn6
         KrmGACY4u3xnssuvew9k0/E4EEUUGe+59Yyn25MyibsHH9XsqerT5jz++j2MvWnkwTbM
         4IgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=F1WL5xAV5lobtkUJD2tmXy4aEDGH/HmJkbk2H67j+1M=;
        b=jeR7vSJiAXTZHt9/RC4J+Iicw9GnHN1XxbjaFWvG5ZStZ2ipe5RVwa8bdn7iPNck0c
         gpISeSmq8+1S9g5PQhfxVBpUcqo0haRPMq86nEW1Y3qJhoma6V5Bi7j2DHT/IDepd3uM
         i5s2AcD0QmAGezBsD386jp0kxftJaAZ6/DKDHsdiHVNHhwngcOMC4r50NhZQp9ZzO7Jk
         i9W0MbAD/kvE+JaHu15B+Y/m6ULJSBA8wkbu5AoKI4bJk8WfuM+0EF0Dv7FwSoTBt8KK
         BNrn7//JSBRfD4oKHrjOb43kyTOG+9kwFyeBsEZ9V5XgIgovBzum6RBwQiMyD9Sc7aOi
         6lhw==
X-Gm-Message-State: AOAM5324SPKTg2pmKcGCe8yR3LoOrNqQaq+kcirTqjSvMPeiGCmdX7sn
	kDlcuhRTFZaSJxY8TwisGinSVg==
X-Google-Smtp-Source: ABdhPJzJ2ONx9VaHt5LLAodemKUvWn6C3DAexDtxbpxospKqlhpG1k7HN9uXQeJWSahJJAiTZZ+cKg==
X-Received: by 2002:a92:b6d8:: with SMTP id m85mr2273593ill.233.1602781062889;
        Thu, 15 Oct 2020 09:57:42 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id u8sm3503295ilc.59.2020.10.15.09.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 09:57:42 -0700 (PDT)
Date: Thu, 15 Oct 2020 12:57:37 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Usama Arif <usama.arif@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp/docmumentation: Add information about tc0
Message-ID: <20201015165737.GC9521@kudzu.us>
References: <20201014162658.33762-1-usama.arif@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201014162658.33762-1-usama.arif@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 14, 2020 at 05:26:58PM +0100, Usama Arif wrote:
> This includes an overview as well as build and run instructions
> for the tc0 software stack.
> 
> Change-Id: I9abfc7d6dffc68da2a2cd4ceda82bec6bc5fcb10
> Signed-off-by: Usama Arif <usama.arif@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  meta-arm-bsp/documentation/tc0.md | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 meta-arm-bsp/documentation/tc0.md
> 
> diff --git a/meta-arm-bsp/documentation/tc0.md b/meta-arm-bsp/documentation/tc0.md
> new file mode 100644
> index 0000000..694e067
> --- /dev/null
> +++ b/meta-arm-bsp/documentation/tc0.md
> @@ -0,0 +1,29 @@
> +# TC0 Platform Support in meta-arm-bsp
> +
> +## Overview
> +The Total Compute platform provides an envelope for all of Arm's latest IP and
> +software solutions, optimised to work together. Further information can be
> +found on the Total Compute community page:
> +https://community.arm.com/developer/tools-software/oss-platforms/w/docs/606/total-compute
> +
> +The user guide for TC0 platform with detailed instructions for
> +syncing and building the source code and running on TC0 Fixed Virtual Platform
> +for poky and android distributions is available at:
> +https://git.linaro.org/landing-teams/working/arm/arm-reference-platforms.git/tree/docs/tc0/user-guide.rst
> +
> +## Building
> +In the local.conf file, MACHINE should be set as follows:
> +MACHINE = "tc0"
> +
> +To build the required binaries for tc0, run the commmand for the required image,
> +for e.g for core-image-minimal:
> +```bash$ bitbake core-image-minimal```
> +
> +## Running
> +To run the produced binaries in a TC0 Fixed Virtual Platform please get
> +the run scripts at:
> +https://git.linaro.org/landing-teams/working/arm/model-scripts.git/
> +
> +and follow the instructions in the user-guide.rst available in:
> +https://git.linaro.org/landing-teams/working/arm/arm-reference-platforms.git/tree/docs/tc0/user-guide.rst
> +
> -- 
> 2.17.1
> 

> 
> 
> 

