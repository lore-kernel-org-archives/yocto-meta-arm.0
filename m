Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web12.11913.1586354327600017800
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Apr 2020 06:58:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=iVv1W/YV;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.67, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f67.google.com with SMTP id p19so3676814qve.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 08 Apr 2020 06:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=usQGOxcolmIDdVSdEzTJrtKBpN5oUy4H8911wJ3azjM=;
        b=iVv1W/YV+n+U/UOLJb9gPFfdboi4IidpX8mceqAPetTm+73/MOZmPacX2yB49IRqT5
         gqrdBhv8jzPW2On4a3T/dz81MQRIGU2ucBiKDqqMX1H3zYT8RWb0JMUZKjP50jxnJhWw
         N3rsRQ0nReQSr9f9x5K8Ywr0vzcUSNafr0g3xiP8Y0khaA4QUf77DQ5Y/rwXlqlRgHc8
         E8Me3FZVqZDqx5cLxu9ztpyzyFeD+I5F1+PfwylQFgt1rAtLUkq66ptzgH1l9s+FBMX0
         Y/mQxChJ6+xs4L17+WxRcXnLUFO9J681FoTbHhzu53mv5umGvc1JD1zuv4ipXrZrP15Z
         evEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=usQGOxcolmIDdVSdEzTJrtKBpN5oUy4H8911wJ3azjM=;
        b=N5k/yGFgy9jzvGE/zEj4qXW53p31w8+YlgXuKyNzS8n5EvKSOvXBZT8CRxsKgeoj4F
         ohmcztLL9rbAdMiQbOFEp/6ejoqf698hvI35fcSeTtsC4eP0vtHQjNC/3xg5WFtnp7gG
         2HcFn4DZGu9gedBP9gBQb+znBUS09yPrJWHNA70MEApVQDIMqXZMgOpHYUcnZwOLHrU8
         4XpLGw+eY+F8Y+tni3nDe+5P8hUTpsXXWL58oi6gHzl5X2bXzaA+Ls7JndfihOl72r7m
         FEw4GSliql+X2JBptSzSjq+tOLJxGUub7lHUIRb9DBmFO9t8ESjmtcIwyVMS1v/s06Tb
         jEVw==
X-Gm-Message-State: AGi0PuY1tPPalgGrbqCLZm2jRNGAcgd7gEJc99Pu38ef4/z3mI5ug53k
	eGuNUjibd92mhrrUp4/xre3zgcgF8/2THg==
X-Google-Smtp-Source: APiQypK5rKCUcf22NrAFA0TgW6I2w0o8SfSJYLqeAt/ir9LjpP5vXkzBrg9im4D2QOgTaQwHrvsB2w==
X-Received: by 2002:ad4:41c2:: with SMTP id a2mr7346837qvq.112.1586354326541;
        Wed, 08 Apr 2020 06:58:46 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:e180:b789:7869:7b22])
        by smtp.gmail.com with ESMTPSA id c22sm8539797qtw.61.2020.04.08.06.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 06:58:46 -0700 (PDT)
Date: Wed, 8 Apr 2020 09:58:44 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Cc: Diego Sueiro <diego.sueiro@arm.com>
Subject: Re: [meta-arm] [PATCH 0/2] Move Xen specifics from meta-arm-bsp to meta-arm-autonomy
Message-ID: <20200408135843.GC1355@kudzu.us>
References: <1586338573-27238-1-git-send-email-diego.sueiro@arm.com>
MIME-Version: 1.0
In-Reply-To: <1586338573-27238-1-git-send-email-diego.sueiro@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 08, 2020 at 10:36:11AM +0100, Diego Sueiro wrote:
> This patch series is to remove Xen specifics from meta-arm-bsp and add to
> meta-arm-autonomy.

Applied to the master branch.  I had to do some minor rebasing to get
it on top of Denys' changes.  So, please sanity check what's upstream
:)

Thanks,
Jon

> 
> Diego Sueiro (2):
>   meta-arm-bsp: Remove Xen specifics
>   arm-autonomy: Add Xen specifics from meta-arm-bsp
> 
>  .../boot-wrapper-aarch64_%.bbappend                | 32 ++++++++++++++++++++++
>  .../trusted-firmware-a/files/juno}/images-r0.txt   |  0
>  .../trusted-firmware-a/files/juno}/images-r1.txt   |  0
>  .../trusted-firmware-a/files/juno}/images-r2.txt   |  0
>  .../trusted-firmware-a/files/juno}/uEnv.txt        |  0
>  .../trusted-firmware-a_2.%.bbappend                | 13 +++++++++
>  .../4.12.0/0001-trace-fix-build-with-gcc9.patch    |  0
>  ...ap-the-number-of-interrupt-lines-for-dom0.patch |  0
>  .../recipes-extended/xen/files/fvp}/defconfig      |  0
>  .../recipes-extended/xen/files/juno}/defconfig     |  0
>  .../recipes-extended/xen/xen_4.%.bbappend          |  7 ++++-
>  .../recipes-extended/xen/xen_4.12.0.bbappend       |  0
>  .../features/arm-autonomy/disable-arm64-sve.cfg    |  4 +++
>  .../features/arm-autonomy/disable-arm64-sve.scc    |  3 ++
>  .../recipes-kernel/linux/linux-arm-autonomy.inc    | 14 +++++++++-
>  meta-arm-bsp/conf/layer.conf                       |  5 ----
>  meta-arm-bsp/conf/machine/fvp-common/fvp.inc       |  3 --
>  meta-arm-bsp/conf/machine/gem5-arm64.conf          | 15 ++--------
>  meta-arm-bsp/conf/machine/juno.conf                |  3 --
>  .../boot-wrapper-aaarch64/boot-wrapper-aarch64.inc | 21 +-------------
>  .../trusted-firmware-a/trusted-firmware-a-juno.inc |  9 +-----
>  .../bsp/arm-platforms/fvp/fvp-board.cfg            |  5 ----
>  .../arm-platforms/gem5-arm64/gem5-arm64-board.cfg  |  5 ----
>  23 files changed, 76 insertions(+), 63 deletions(-)
>  create mode 100644 meta-arm-autonomy/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend
>  rename {meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-xen => meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno}/images-r0.txt (100%)
>  rename {meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-xen => meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno}/images-r1.txt (100%)
>  rename {meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-xen => meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno}/images-r2.txt (100%)
>  rename {meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-xen => meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno}/uEnv.txt (100%)
>  create mode 100644 meta-arm-autonomy/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.bbappend
>  rename {meta-arm-bsp => meta-arm-autonomy}/recipes-extended/xen/files/4.12.0/0001-trace-fix-build-with-gcc9.patch (100%)
>  rename {meta-arm-bsp => meta-arm-autonomy}/recipes-extended/xen/files/4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch (100%)
>  rename {meta-arm-bsp/recipes-extended/xen/files/juno => meta-arm-autonomy/recipes-extended/xen/files/fvp}/defconfig (100%)
>  rename {meta-arm-bsp/recipes-extended/xen/files/fvp => meta-arm-autonomy/recipes-extended/xen/files/juno}/defconfig (100%)
>  rename {meta-arm-bsp => meta-arm-autonomy}/recipes-extended/xen/xen_4.%.bbappend (75%)
>  rename {meta-arm-bsp => meta-arm-autonomy}/recipes-extended/xen/xen_4.12.0.bbappend (100%)
>  create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/disable-arm64-sve.cfg
>  create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/disable-arm64-sve.scc
> 
> -- 
> 2.7.4
> 

> 

