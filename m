Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web11.9701.1588942990356989389
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 May 2020 06:03:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=xYPuptpL;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.67, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f67.google.com with SMTP id ck5so648191qvb.11
        for <meta-arm@lists.yoctoproject.org>; Fri, 08 May 2020 06:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uX8ArLvGY0IQicc/nu0rA40WkBL1UZyKiEcfZ90OzyE=;
        b=xYPuptpLJ+U7/Ok4mSPy9wh+7S42FboMwDt1cUfpAUaPraGprATLFtLIfCFC8Fd5Ec
         r6BhYJ9S2ugmMKZQ4x2rzCQsmrtfhcJgrG9PHiS27Tp1QqOFHYYotXxkJu1Rxh3uBQcl
         4eLIscqeNfywxaesT5/Z0CvCkM3lbaehJ/FPE/ltKaWrGX0dlB3YL75Lu3I8u7+oUWd9
         ckYt3PpimTBs0Yflc7hVD/EpnsusF/ySG69H4Vch/DP5x/EZRz/3/OyTd8iGpcqcX0mp
         +m89G9iGs8vVsSBastkbNKXCYXpfr9bOVzi/XYfwRk3b7CYys0pakbvEa6C0Ul4AcOVv
         0hiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uX8ArLvGY0IQicc/nu0rA40WkBL1UZyKiEcfZ90OzyE=;
        b=k1SIgmG7IgtJCdteFXtNoyJThcx3qMZn6qjxp5aCU9NoUBLuh4aADwQ5FTGp36yVYM
         9uycRbI4ihm6QZtwzjdUk2kbq7AJdfcxH8G7HwWK813vKytw5fzvVNIUjo8KCPIZCnfs
         g57bDy3mL9vDPYnu5ageLOFyVqfRhsTfeXLBXFLo5A1kmMdpx7Su31lSWM+kUHpj2R6z
         D08SImOOfv7NVi4UzgPOHItRojpgsZDTY3Zi0dzaNntbnwddRPI/VIKvIL9g+C+tOMfh
         o2tGIFtjjIEEvHxIdu7dAoCM7ZVjlH/ffHLogcK932ULmFToAnYkRIOr34tFhAFrp2A1
         8mmQ==
X-Gm-Message-State: AGi0PubVuu/y6Yc1fyVmevH3jlHD4GnbHbDFwIM8PXaFGlyRu3l1rx1T
	UgTbK6aW+QjomLJQcrJ+ttYT2U9K9qs71w==
X-Google-Smtp-Source: APiQypKr1ZpEHRenME40nZx+uC9agOYmMvLX3ctZtZWOcPcKpxKA4o9BekLHASsFp3gI1RvBjZPjNg==
X-Received: by 2002:a0c:f889:: with SMTP id u9mr2558601qvn.60.1588942989153;
        Fri, 08 May 2020 06:03:09 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:bc2d:d256:cb0b:903c])
        by smtp.gmail.com with ESMTPSA id g12sm1341869qtu.69.2020.05.08.06.03.08
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 06:03:08 -0700 (PDT)
Date: Fri, 8 May 2020 09:03:07 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 0/4] Reduce autonomy-host image size
Message-ID: <20200508130306.GB32710@kudzu.us>
References: <20200507110825.38541-1-bertrand.marquis@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200507110825.38541-1-bertrand.marquis@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 07, 2020 at 12:08:21PM +0100, Bertrand Marquis wrote:
> This patch serie is doing several changes to reduce the image size
> produced when autonomy-host-image-minimal is generated:
> - only include qemu parts required for xen
> - remove kernel binary and modules from generated image
> - optimize qemu compilation to reduce the binary size
> 
> This is generating an image of around 120MB instead of 700MB.
> 
> Diego Sueiro (4):
>   [arm-autonomy] qemu: Split qemu into qemu and qemu-xen packages
>   [arm-autonomy] Don't include kernels in arm-autonomy-host images
>   [arm-autonomy] qemu: Don't build with audio support when Xen is
>     present
>   [arm-autonomy] arm-autonomy-host-image-minimal: Remove kernel-modules

Series pulled into the master branch.

Thanks,
Jon

> 
>  meta-arm-autonomy/README.md                    |  1 +
>  .../conf/distro/include/arm-autonomy-host.inc  |  4 ++++
>  .../images/arm-autonomy-host-image-minimal.bb  |  8 ++++----
>  .../recipes-devtools/qemu/qemu_%.bbappend      | 18 ++++++++++++++++++
>  4 files changed, 27 insertions(+), 4 deletions(-)
>  create mode 100644 meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend
> 
> -- 
> 2.17.1
> 

> 

