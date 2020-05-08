Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.9827.1588942509452926514
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 May 2020 05:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=FWMTLBj1;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id q7so1370535qkf.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 08 May 2020 05:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KElIm5OSYiRuzktqC6mAvZT0yhlierC7f1XaDRYJvNI=;
        b=FWMTLBj1NJw6hWirYeNd7ATM6ay+0CEuISaPoRDj9vyKkCevtkb86PwN704xjb22g4
         rCJPcKzbEvYM5lDggaS3FJF3vAgrVM1L9OCaizkGumZMQ5v7zZFAxgtvpAuJE8T0OROl
         Evj2eM49jAssC+/QG3Q/UyBB4tVWP4bLbBoDIAGKeorqv25Hi45LVf9auZfTxJK8b+eo
         FOxgEryGSKyUyAq3OgCx6r7VM8gsJhqiPfo7s6vWUwNW6GAVnPFR5QrGB7S1xz/VJAGS
         8baVtn/keTi/CAv5Ki0yC3IwaUBw+eHtqx9DPq+KKO+YCdVLxV/x/l6DeAWbJGq5Gc0o
         QPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KElIm5OSYiRuzktqC6mAvZT0yhlierC7f1XaDRYJvNI=;
        b=PqkJGxzc6rHadmT0mFtqVXvTIY2BL54qCdyA46HwzRWd/9N8Ywl2Tv8/LmCDxe95Be
         pSq42X0FKbAnVs3c+87jh1W359OFHogz9a3zd6wdr5SCqR9KEqSgHzkBC0ybNHd/av+T
         bpfi9EfQKV8VKtaG4oNH+4Dfk8Kieh/mDeX6oYPm2DWj6QpxMoLeNMfqCftOOprOwlv0
         1ZIblDcy1uhrZoPYPzYEZVK/IkglUc+1DuFh5iQcGYK+jdcmHZGe0Lw8Xj1DRINqehjf
         EFINGJmcfP/lCLywVY0Y5Tvlei+wucXQMJ2lb4FgJpjSbPvgw7ABUktOkBox59Kam/vm
         Q7BA==
X-Gm-Message-State: AGi0PuYbK7FKAE5Gsz9fRdHFP8qsNTnBz5nmAVI+Yf0FWnx8BcDLHYOA
	deXQG34e2vgS7ezdPtnWnLFM+l2S3kcd4w==
X-Google-Smtp-Source: APiQypLFPigYNWDDJCLjCHcF+LQEdGcbY9j8vqoV4KnkLLG3SHHi/NZSqSIn5tKf34yfSY2uZSt4nw==
X-Received: by 2002:a37:bd81:: with SMTP id n123mr2516846qkf.57.1588942508337;
        Fri, 08 May 2020 05:55:08 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:bc2d:d256:cb0b:903c])
        by smtp.gmail.com with ESMTPSA id a62sm1087838qkg.5.2020.05.08.05.55.07
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 05:55:07 -0700 (PDT)
Date: Fri, 8 May 2020 08:55:06 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 0/2] Dunfell compatibility patches
Message-ID: <20200508125505.GA32710@kudzu.us>
References: <20200507100054.25199-1-vineeth.raveendran@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200507100054.25199-1-vineeth.raveendran@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 07, 2020 at 11:00:52AM +0100, Vineeth Raveendran wrote:
> The following two patches add dunfell compatibility to foundation-armv8,
> fvp-base, juno, and gem5 in meta-arm-bsp and meta-arm-autonomy.
> 
> Please note that though gem5 now builds with kernel 5.4 (Dunfell default),
> it's not compiling due to python2 dependency.
> 
> Vineeth Raveendran (2):
>   [arm-bsp] add dunfell support for fvps, juno and gem5
>   [arm-autonomy] Move to dunfell

Series pulled into the master branch.

NOTE: GEM5 does not compile against dunfell, due to a python2 issue.
I believe this is a known issue which can be addressed when gem5 is
released in the next couple of weeks.

Thanks,
Jon

> 
>  meta-arm-autonomy/conf/layer.conf             |  2 +-
>  .../conf/machine/arm64-autonomy-guest.conf    |  2 +-
>  .../images/arm-autonomy-host-image-minimal.bb |  4 +-
>  .../0001-trace-fix-build-with-gcc9.patch      | 56 -------------------
>  ...e-number-of-interrupt-lines-for-dom0.patch |  0
>  .../xen/{xen_4.%.bbappend => xen_%.bbappend}  |  4 ++
>  .../recipes-extended/xen/xen_4.12.0.bbappend  | 10 ----
>  .../xenguest/xenguest-manager.bb              |  2 +-
>  meta-arm-bsp/conf/machine/fvp-common/fvp.inc  |  4 +-
>  meta-arm-bsp/conf/machine/gem5-arm64.conf     |  2 +-
>  .../fvp-common/u-boot_vexpress_fvp.patch      | 13 +++++
>  .../recipes-bsp/u-boot/u-boot_2019.%.bbappend |  9 ---
>  .../recipes-bsp/u-boot/u-boot_2020.%.bbappend | 13 +++++
>  ...4.19.bbappend => linux-yocto_5.4.bbappend} |  0
>  14 files changed, 39 insertions(+), 82 deletions(-)
>  delete mode 100644 meta-arm-autonomy/recipes-extended/xen/files/4.12.0/0001-trace-fix-build-with-gcc9.patch
>  rename meta-arm-autonomy/recipes-extended/xen/files/{4.12.0 => 4.12}/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch (100%)
>  rename meta-arm-autonomy/recipes-extended/xen/{xen_4.%.bbappend => xen_%.bbappend} (83%)
>  delete mode 100644 meta-arm-autonomy/recipes-extended/xen/xen_4.12.0.bbappend
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/fvp-common/u-boot_vexpress_fvp.patch
>  delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2019.%.bbappend
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.%.bbappend
>  rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto_4.19.bbappend => linux-yocto_5.4.bbappend} (100%)
> 
> -- 
> 2.17.1
> 

> 

