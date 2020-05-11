Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web10.249.1589214316657328874
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 May 2020 09:25:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=DUUKLFYr;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.68, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f68.google.com with SMTP id fb4so4680808qvb.7
        for <meta-arm@lists.yoctoproject.org>; Mon, 11 May 2020 09:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ersw4Kjr5gMA/YMWdY9Dsrw+QmYJirYdLkb6R05scjU=;
        b=DUUKLFYrUZ4l9EKD3U3BeeBdXiGFDcLsPgrw0Vaw9VUmBcvoqEQ5XxPYZn920YzXEG
         lxdX7BnVD8ZA8Dk6ajNeL5tBGirUTh7ItFQbMUPYAKBciXaZ9lz9tFEDpHnVEyM8c00s
         3wvn2h8ZUeK8b2NZqvyaBs9wA+0RnJnwkzBGYpwFqfDJM3R+r4aIedZLhL3bIgR/XI/a
         5vAXAG7+wwLqq5UGu9sGEL0vhjIGdCBBYV/xBw31PsPS9/ed4YbGUkEv9DFFaAfEw+y/
         BuNHdXMBUMbgqS6VAOgf7WVhNyZBmuKKAy2XgR/91yhGAorVX9anDBWtvS2KyCzOyLC0
         umBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ersw4Kjr5gMA/YMWdY9Dsrw+QmYJirYdLkb6R05scjU=;
        b=W3kX6XYuJSTkf+URxsE+i/9dmYu4+EBQ6C2t+4GrdtUaL/CJzgR0o9FgAnxmR9LpJu
         Z0Y6jFs1efo96pGVQ4KmJSHzixO3n6fYL31U28ka9TC4009gZMrXuUk9DvFKzVyZ6RpC
         zwY18u0bNXdqRSttCtVlOYUgoz+rOl89+V752Cvo5d8hHSbw/oRaHSIII97yqjJ3vwAO
         KPHpxVT6AkFfgizB5hJzGwZdxSsSTreSxEqIiQWQOaNt6H0fKVtDnX9Zhbeah/KWljIS
         k6FYtIFV8pO2qKKT4agRfDHCjZLbieb3qFP/WwB3OZipMoW77KeBYkOrj86ZB5XTPMff
         W5AQ==
X-Gm-Message-State: AGi0PuacWaUsgoWb48Sf/RxwkM2T7TwRlmJeJ4MKW7zp0tAa6Jt0nTo9
	BV2ot4XzunBitO/dbDqd6jRECw==
X-Google-Smtp-Source: APiQypJ2nltfo2LTpH+c46GhmlGKJJcJ5MbX2843Uu+gWcDpjJ2w0Yy9T198xfXVr1bekjitVhXhow==
X-Received: by 2002:a0c:cdc9:: with SMTP id a9mr16137613qvn.243.1589214315687;
        Mon, 11 May 2020 09:25:15 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:ca4:7a7a:2dac:2401])
        by smtp.gmail.com with ESMTPSA id c24sm6669789qtd.26.2020.05.11.09.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 09:25:15 -0700 (PDT)
Date: Mon, 11 May 2020 12:25:13 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 0/4] arm-bsp: Add Initial Support for N1SDP
Message-ID: <20200511162512.GA31988@kudzu.us>
References: <20200508163403.5987-1-bertrand.marquis@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200508163403.5987-1-bertrand.marquis@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 08, 2020 at 05:33:59PM +0100, Bertrand Marquis wrote:
> This serie is adding initial support for ARM N1SDP platform to
> meta-arm-bsp.
> The current support includes kernel 5.4 with PCI patches and DTB.
> Firmware support (TF-A, EDK2, grub) will be added in a future patch
> serie.
> To use this BSP, a firmware must first be compiled and installed
> following procedure describe here:
> https://community.arm.com/developer/tools-software/oss-platforms/w/docs/457/n1sdp-getting-started-guide
> 
> Diego Sueiro (2):
>   arm-bsp: linux-linaro-arm-5.4: Fix kernel menuconfig task
>   arm-bsp: n1sdp: Add Linux kernel device-tree support
> 
> Khasim Syed Mohammed (2):
>   arm-bsp: Add linaro-arm-linux 5.4 kernel support
>   arm-bsp: Introduce ARM N1SDP platform

Sorry, forgot to respond last week.  This has been pulled into the
master branch.

Thanks,
Jon

> 
>  meta-arm-bsp/conf/machine/n1sdp.conf          |  20 ++
>  ...arm-smmu-v3-Ignore-IOPF-capabilities.patch |  46 +++
>  ...irk-add-acs-override-for-PCI-devices.patch | 156 +++++++++
>  ...-for-the-Arm-Neoverse-N1SDP-platform.patch | 318 ++++++++++++++++++
>  ...e-n1sdp-pci-quirk-for-SR-IOV-support.patch |  51 +++
>  .../linux/linux-linaro-arm_5.4.bb             |  20 ++
>  .../linux/linux-linaro-arm_5.4.bbappend       |  27 ++
>  7 files changed, 638 insertions(+)
>  create mode 100644 meta-arm-bsp/conf/machine/n1sdp.conf
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0001-TMP-iommu-arm-smmu-v3-Ignore-IOPF-capabilities.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0002-pci_quirk-add-acs-override-for-PCI-devices.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0004-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
> 
> -- 
> 2.17.1
> 

> 

