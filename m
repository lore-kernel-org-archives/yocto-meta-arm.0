Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.10007.1588943170679536037
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 May 2020 06:06:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=XnDD3FY1;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id 4so1133907qtb.4
        for <meta-arm@lists.yoctoproject.org>; Fri, 08 May 2020 06:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0BYugyNN1z5nmbjI2xMpzA5I3TMMdtN1bohFWodRfAk=;
        b=XnDD3FY1JAJ4rK4K2OPRJkXaOL/xAcHVr98OVCWbJ6L/P9VusQfdwYDXj56gBZtGXM
         DS1ORYS3HnqsMvMBCm5uNIaPcz9JxvJz82NoVxDtq//ohWYymkO30uP2LxV5r35KzIKL
         9wNQqZt1SCpSXtepxHpI2S71eOkyC99xisdcgtXFsY7jm8OG/O79aanwSn3N5pg7dFzA
         67+bC3iqyLEay8jvOyJ1+A0MGm+hQXcZ9eDgsoeNwha7G28Ylt/Q5QcqtWptvLbKUVir
         x0gCb6rwLmdDVGU87dU88oZKZD1i6PZkfEv4vxc09zWW81RLkBqLktQ6bwRf8x9yF+y4
         8Asg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0BYugyNN1z5nmbjI2xMpzA5I3TMMdtN1bohFWodRfAk=;
        b=aTrQo+QzvCIXv+Cn+uzqaN3o+882OCenyKwLF7EWNBBPpe5mgwrDMQez5SnRWJ0FXv
         /kynZ7oNi4aN0aijvHbrzXYWWFk/lqpX91x0kPpNuFFRzTn86PkqQRefagyBsoo/TOSi
         59ck1gBTUJJYpwKgHR4AcGOisIE7N3iGqzKJm1F6nhfPGB9WLyiFlVIKd3jy3LC+aR+L
         n0OqBEfvX+1M4dh8vb7nlvY8lXI2USsCZ8l3dUn60so3yod1nwKOdRHcJNarvqi+n18f
         0G/2O7PrjEAPGq6ZUbXHFbkcWqYCrE5DbFauefEYpRihf9WaR39kPfDORZajNtEFTMa8
         z8yg==
X-Gm-Message-State: AGi0PuZrnoRagqPlfgahnvBYiZzKn89klMxiKZlAGuP9V/GAhC9+T/hW
	38VKx0eO+8fW6WKwSEk5wjt5s38IjWAFpQ==
X-Google-Smtp-Source: APiQypLdiEGCsX8IJYM2OKn6u21K8b2QGrbYhekftrKJ5AOQjU0DB3Hm/SFXwUTWElBh/G/MZ5QGbQ==
X-Received: by 2002:ac8:4a06:: with SMTP id x6mr2968167qtq.163.1588943169687;
        Fri, 08 May 2020 06:06:09 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:bc2d:d256:cb0b:903c])
        by smtp.gmail.com with ESMTPSA id e28sm126344qka.125.2020.05.08.06.06.09
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 06:06:09 -0700 (PDT)
Date: Fri, 8 May 2020 09:06:07 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] [arm-autonomy] arm-autonomy-host-image-minimal: Abort on copy fail
Message-ID: <20200508130607.GG32710@kudzu.us>
References: <20200507111722.38641-1-bertrand.marquis@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200507111722.38641-1-bertrand.marquis@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 07, 2020 at 12:17:22PM +0100, Bertrand Marquis wrote:
> From: Diego Sueiro <diego.sueiro@arm.com>
> 
> If the guest image copy fails we need to abort the do_image execution.
> 
> Change-Id: I3785a0828e271ed27eb7f9212804b5b9b39f79ac
> Issue-Id: SCM-990
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Pulled into the master branch.

Thanks,
Jon

> ---
>  .../recipes-core/images/arm-autonomy-host-image-minimal.bb     | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
> index 3859f52..5b20fa0 100644
> --- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
> +++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
> @@ -112,7 +112,8 @@ python add_extern_guests () {
>              # Add file extension if not there
>              if not dstname.endswith('.xenguest'):
>                  dstname += '.xenguest'
> -            bb.utils.copyfile(path, guestdir + '/' + dstname)
> +            if not bb.utils.copyfile(path, guestdir + '/' + dstname):
> +                bb.fatal("Fail to copy Guest file " + path)
>  }
>  
>  IMAGE_PREPROCESS_COMMAND += "add_extern_guests; "
> -- 
> 2.17.1
> 

> 

