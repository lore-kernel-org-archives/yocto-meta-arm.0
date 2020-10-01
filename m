Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.393.1601573879446817073
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 01 Oct 2020 10:37:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=0Y7PRhfR;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f194.google.com with SMTP id g72so6286797qke.8
        for <meta-arm@lists.yoctoproject.org>; Thu, 01 Oct 2020 10:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hZamtqnh4OEQjV27fAudalsRgprZUg7lEkX1xlPXflw=;
        b=0Y7PRhfR7mgMaRBNUDkn78X+h/OZHpYR0dyuAFttdI5Vne/a187PLLtmJQ6AXHRG9I
         jLg2oLO+Giaa56FNRBL/inqO9yOaH6BZx5IJwY7AZqPpm8UxXX0MSNWT7dXDy7P++cIG
         lTNP/MIHTT6FLmUyIs9lm0xIpDiY5aoOdYsAnvoxI0T/oj7qgARthpuhyLxXYVqM9UzU
         FfN4UJ4IInh8/p9NbGVbcFoy58p7H6iDwxsOoDWKvnUw3zj8fgEMkJ0alIbmJAsIZgL4
         NhOeJOi0eNSWyumoG1oZEBc/DVKk3xYsGxlvfgZiLE15vr53k389tRM0rNJURIMd+KTD
         vK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hZamtqnh4OEQjV27fAudalsRgprZUg7lEkX1xlPXflw=;
        b=FM7xCvn++61cWdfwWq8QczJLM/OXv+DJMcWGhrjBZ65qRR+9GujwFhKz6C9gO4Tpof
         SuV7HUAB4SLU6sipBCzQx4onmKoHgSUJfMkYh5wsafyE95MAXvd85O/988dkapfmv4th
         Jjo+qmn13n+0ZiFpXI0uy626tqzZqO07FosW+xOODrJ/lQXU1/s8qIEVjNubv2m8Dj0P
         cbt3RmDrNozsQ4F0APir0eGzpnt2UmLSUMwSQv4vtSp/g3SDIp/ToTdSr+GERaLy9OAK
         sWR/sohiVsyxr+B2HpC7OLvYlU2m1zzyl10V29xa41ASulg3OP+TTa29zgMdSowSovxv
         9epQ==
X-Gm-Message-State: AOAM531ZAewBp9PDsLfSIvzZXf5n6pOHxc+YY4iC/EVPk8WGOhZkxDue
	EGL2zMnLYURxIhMBtrpvGQXcKQ==
X-Google-Smtp-Source: ABdhPJxHKQtVk8Rl68ke+a9ExVNIwrwYqHOSYeF2URkAQGfBi3RRdvuyuJa3YzaLC5hxvjjoIhqnlw==
X-Received: by 2002:a37:af02:: with SMTP id y2mr8976001qke.346.1601573878638;
        Thu, 01 Oct 2020 10:37:58 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id a24sm6634122qko.82.2020.10.01.10.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 10:37:58 -0700 (PDT)
Date: Thu, 1 Oct 2020 13:37:53 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp/documentation: add BSP documentation template
Message-ID: <20201001173752.GB24357@kudzu.us>
References: <20200930150514.634610-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200930150514.634610-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 30, 2020 at 04:05:14PM +0100, Ross Burton wrote:
> Add a template for future BSP documentation.
> 
> Change-Id: I614d43f477f1a5dfb898b808d4c5b78a5bb163b8
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  meta-arm-bsp/documentation/template.md | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-arm-bsp/documentation/template.md
> 
> diff --git a/meta-arm-bsp/documentation/template.md b/meta-arm-bsp/documentation/template.md
> new file mode 100644
> index 0000000..7beeb59
> --- /dev/null
> +++ b/meta-arm-bsp/documentation/template.md
> @@ -0,0 +1,19 @@
> +# *Hardware Name*
> +
> +## Overview
> +
> +*Brief summary of the hardware*
> +
> +*Link to reference documentation*
> +
> +## Building
> +
> +*Any special steps required to build successfully beyond setting MACHINE*
> +
> +*For example: corstone700 needs DISTRO=poky-tiny, musca only supports TF-M*
> +
> +## Running
> +
> +*A summary of how to deploy or execute the image*
> +
> +*For example, an overview of the N1SDP SD structure, or FVP arguments*
> -- 
> 2.28.0
> 

> 
> 
> 

