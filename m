Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web12.383.1610652151076362789
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 Jan 2021 11:22:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=gjf5G4+M;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id n142so9424988qkn.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 14 Jan 2021 11:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4o/7OxgljfmhJbuTGyLuByHH4cpugV3oLDwFk+8IAVc=;
        b=gjf5G4+MWKUf4WPWxxK+LGeOutgf2dz/PLt1g/jK40UHVEWWDSMNnLznnz+6uYkVYC
         WJR/m5dbmxpjAAoSad1qr/hH3JamlOOwCzs6H12rZFNiJh/o8j0OSFX32PmnKVxMGX8D
         Avhbe92xjG8yujvq44GvjboVZbVEMRB2VuzZUed+vCsBWKGZyFD6E7CXWbROOsvCMrqn
         RjranDz8lUlDZi2ACaLVc8IHNnuiH39vgefB4Wla5ztPwPrgVTPIzGjSCKCA4pB+S5sw
         BH91gfMetSNBnEDWqBkC3/fJfzV0hW5N08wQ1sPW0vKXUgypdAfWkRYjixTI+nkBN+PL
         6sNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4o/7OxgljfmhJbuTGyLuByHH4cpugV3oLDwFk+8IAVc=;
        b=QMxRhn8HBcLbyFtCLyCPpygGOPhnhNBuCrzgDN50IQ1dx5Fbncy6wUVgjT3k0w8tUu
         BawYjIqh2bNtukMCM7NmXxX1ttqWCw3dDaBttcQ7/fWygFVYeljZ35UEfENtOujbhBDR
         9r6tOsTz7KZ6a69gF8t6978MJi5HrXEmV9X7CTBPnqbcCDrQHzgxBRJwPku7WBQixsfT
         G/ks/Ttg5ksRojDrTmX3BDWiPr7Wg0qaRBl48/1plzIvGRH+CrvIBbs1anZb340PvQaK
         L7PYGn7sZz5Z3gyNKLRNDF//JFOxSI8GT9syL4unUR5x1Jn0/AQnojTd2qWjG5XQ4RP2
         fkjw==
X-Gm-Message-State: AOAM531MzQ9SRbyYYohUUj4V0bR81tKh3Am1H/VEEBAd0VRX/SY2Dfyd
	nnjeeVPMfkDmMWTKw1SExYbIww==
X-Google-Smtp-Source: ABdhPJyBflbFlz3NmMqD52lUuTpCG1X5X1B4t3eNKvRkeCrOIXihDSuX6BpPZbRhtOOLHQS9KY/P+Q==
X-Received: by 2002:a05:620a:125c:: with SMTP id a28mr8831230qkl.112.1610652150263;
        Thu, 14 Jan 2021 11:22:30 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:1d40:95cb:6898:8d5])
        by smtp.gmail.com with ESMTPSA id r190sm3687962qka.54.2021.01.14.11.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 11:22:30 -0800 (PST)
Date: Thu, 14 Jan 2021 14:22:28 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Usama Arif <usama.arif@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp/images: artifacts image for tc0
Message-ID: <20210114192228.GC511@kudzu.us>
References: <20210111171127.23510-1-usama.arif@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210111171127.23510-1-usama.arif@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 11, 2021 at 05:11:27PM +0000, Usama Arif wrote:
> Trusted-firmware-a is the final component to be built with the rest of the
> components dependent of it, therefore building tc0-artifacts-image
> which depends on trusted-firmware-a will build all the required binaries.
> 
> Signed-off-by: Usama Arif <usama.arif@arm.com>
> Change-Id: I57760a339da1601bd66e3dd752a7b2814e84bbb8

Pulled into master.

Thanks,
Jon

> ---
>  meta-arm-bsp/documentation/tc0.md                    |  6 +++---
>  .../recipes-bsp/images/tc0-artifacts-image.bb        | 12 ++++++++++++
>  2 files changed, 15 insertions(+), 3 deletions(-)
>  create mode 100644 meta-arm-bsp/recipes-bsp/images/tc0-artifacts-image.bb
> 
> diff --git a/meta-arm-bsp/documentation/tc0.md b/meta-arm-bsp/documentation/tc0.md
> index f11b781..9ea4f7c 100644
> --- a/meta-arm-bsp/documentation/tc0.md
> +++ b/meta-arm-bsp/documentation/tc0.md
> @@ -16,11 +16,11 @@ In the local.conf file, MACHINE should be set as follows:
>  MACHINE = "tc0"
>  
>  To build the required binaries for tc0, run the commmand:
> -```bash$ bitbake trusted-firmware-a```
> +```bash$ bitbake tc0-artifacts-image```
>  
>  Trusted-firmware-a is the final component to be built with the rest of the
> -components dependent of it, therefore building trusted-firmware-a will
> -build all the required binaries.
> +components dependent of it, therefore building tc0-artifacts-image which depends
> +on trusted-firmware-a will build all the required binaries.
>  
>  ## Running
>  To run the produced binaries in a TC0 Fixed Virtual Platform please get
> diff --git a/meta-arm-bsp/recipes-bsp/images/tc0-artifacts-image.bb b/meta-arm-bsp/recipes-bsp/images/tc0-artifacts-image.bb
> new file mode 100644
> index 0000000..43c1eda
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/images/tc0-artifacts-image.bb
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: Apache-2.0
> +#
> +# Copyright (c) 2020 Arm Limited
> +#
> +SUMMARY = "Total Compute Images"
> +DESCRIPTION = "Build all the images required for Total Compute platform"
> +LICENSE = "Apache-2.0"
> +
> +inherit nopackages
> +
> +# The last image to be built is trusted-firmware-a
> +DEPENDS += " trusted-firmware-a"
> -- 
> 2.17.1
> 

> 
> 
> 

