Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web11.3435.1598386342523828927
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 25 Aug 2020 13:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Lv49jF5H;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f196.google.com with SMTP id t23so10043048qto.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 25 Aug 2020 13:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2+qI9O7dxWfPt+zcQImmIXnW/P4iHgMiUFMSdXfid9A=;
        b=Lv49jF5H2j+BnR68uyQ9lQt/5/wBjBjtb9e5yvDIp57nhBoZsJzawg1Ip7pYfx0cXi
         r14dWTFJKnes+IGiRwjgGMPdWAeaUBEb/IHYsVDuuElP+Kd1W0/TYIAk22e2DaPx36t6
         Dvf3U3R+PfORAweUyZxBV67UvnTJJGNjulvRiGXlQe2Lbuk4w9SnElPmKZvJVBZxvF7O
         TFpfiSx1F7yV6R5sE3vLU+7mRe73LLO8b+uh/B+4gXFvnfWP6ya3Zqlx5PXTGcwBzBW7
         E2Z4jMsTVdig6XQeUGI39nwW7rxbsdwlU3YEcM/jHeE2z6UF6/OIv7KPkh7tMYLZvZzm
         jg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2+qI9O7dxWfPt+zcQImmIXnW/P4iHgMiUFMSdXfid9A=;
        b=l1fe8LqfocOmn46tUigKmtIFqrXVEZoynItHX6Co6caJgXsJM74Ybhh3WmKJWI7PHF
         Q652PiQ9w7zpI0jRE/EU5F1xpMHbqy52IFVFYqlq6DoiRoXbbRrh4bq9Y/ZhjFPP+VmO
         ykmMQjHDMnHKoIGKyrBqztgXCrCqBFgTVAazFB6h7h5zkRjWQuoh9TWXcgOT5UemNk0A
         tRC+1/JtUPheBQ2cTZOjeY9ja2HJF3ro8gQ+5V7+dk16lb+52eejNLUnhq5lTBQEqatM
         1HBlWBBGLeN+ZjsI+/Sazi9pxjn0INpL+ac2VByLwv2jFnFlLUbrP2Hi4XkQjakoCyxW
         wZ0Q==
X-Gm-Message-State: AOAM530zpq2OpHA1elvFEDgI4jCHggD0zPF3LrtDopm/haATAqUKgS9o
	lGV3VYPsqJL0YiC/GRa7R742EQ==
X-Google-Smtp-Source: ABdhPJy1ngQaIp65OfjEFs1w8BG2J2wP+E9BckAZ55VXWDExoTarz2mN/QkbLtYsifdYVYUocYcUeA==
X-Received: by 2002:ac8:774c:: with SMTP id g12mr10747282qtu.30.1598386341696;
        Tue, 25 Aug 2020 13:12:21 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id y194sm4637386qkb.116.2020.08.25.13.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 13:12:21 -0700 (PDT)
Date: Tue, 25 Aug 2020 16:12:16 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp: redundant entry in FVP TF-A
Message-ID: <20200825201216.GB24495@kudzu.us>
References: <20200825023220.27193-1-jon.mason@arm.com>
 <20200825023220.27193-2-jon.mason@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200825023220.27193-2-jon.mason@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 24, 2020 at 10:32:20PM -0400, Jon Mason wrote:
> bl1 is specified twice in the FVP Arm32 include file, which seems
> erroneous.
> 
> Change-Id: Ib2fc91b547151acfc28f57679e99f649bd0f49ab
> Signed-off-by: Jon Mason <jon.mason@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  .../trusted-firmware-a/trusted-firmware-a-fvp-arm32.inc         | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-arm32.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-arm32.inc
> index 5684802..117c25f 100644
> --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-arm32.inc
> +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-arm32.inc
> @@ -3,7 +3,7 @@
>  COMPATIBLE_MACHINE = "fvp-base-arm32"
>  TFA_PLATFORM = "fvp"
>  TFA_UBOOT = "1"
> -TFA_BUILD_TARGET = "dtbs bl1 bl1 bl32 fip"
> +TFA_BUILD_TARGET = "dtbs bl1 bl32 fip"
>  
>  EXTRA_OEMAKE_append = " \
>      ARCH=aarch32 \
> -- 
> 2.17.1
> 

> 

