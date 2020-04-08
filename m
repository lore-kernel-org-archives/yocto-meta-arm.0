Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.5281.1586316879597950079
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Apr 2020 20:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=iajjAZNx;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id y3so1799801qky.8
        for <meta-arm@lists.yoctoproject.org>; Tue, 07 Apr 2020 20:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Km8o1Y/XoVJrbPlDoN9Ipc5RYqIKnjegBlUl92nlaaI=;
        b=iajjAZNxouzftwfvafmv3UMl+fORpXC5xsQwl9fkpAbyewHWb6sA2Dxtcjmk13XUBR
         iZf0JjuSZ1juwGadBXGk+6M9DDtKHzRcH7RIbfs8+Ly8ccTEh0Je56RupdgNokPMBa1h
         W4Tq1yIbIN5us/ZvGSiLwIbAiOGYumhududz+4QB9g0GBJ6iD8aPDnE9GpinAa6dlYLy
         mnmBvSHDXytIs0g3iz4p95cGwvU2mE0X5NlOv2M3PEH6c1wN0gCsstff8rCKY4N0ZBo0
         JJooNMlrgQ9Un8Y5GQGetPrUSpT+qBjqH6ddWXZ0+tdpWRanqvDaS6UtR9uBFr8bGWEm
         hnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Km8o1Y/XoVJrbPlDoN9Ipc5RYqIKnjegBlUl92nlaaI=;
        b=P6Op2zE194OYUfadslaeviOwjFDPaeb9j5+qQUB04KEB2B32smK947TL4XZk+LRzhR
         SzEj843t9efQ/rN08u/BNDpqpMVfJW32Gf5/lJmBvpueRrKnzQkvOOirfCk8Xi/oYVSx
         eS6/CwbkJw9vxxwD4zkl5JlVnZHuZjZkW+MsVpcpP1adXPOEXNmxFERc97nDwJtXgeYH
         7o5rrVN4xZsNipOeUGIrGzS4tZgtub38d/BSdR0QoNOw2gxLZZPjDyw8Ssb2uFn5331a
         RxV/5pLpKt7wrOiyxfK8++jDmHl41K8npKYg4eLRMkD6bWKIgaVvytukX1HF+sz32PTN
         IupA==
X-Gm-Message-State: AGi0PuZp2jUvfrjni2qZvyQ7jRWZd/414tL+ZkpWL3cO4wOeWIGtFO8d
	ZYhT9iI4V1DuXPFCHhg/Z3px/EPI9WJ9uQ==
X-Google-Smtp-Source: APiQypL7Cl6cAG73dMSmTZAgtznVFZFjSvd2eU9iEvpUd7m76rzdF/rTERuKifT2/oXA5MXvi7zpDQ==
X-Received: by 2002:a05:620a:91d:: with SMTP id v29mr5433070qkv.424.1586316878367;
        Tue, 07 Apr 2020 20:34:38 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:e180:b789:7869:7b22])
        by smtp.gmail.com with ESMTPSA id h138sm18199215qke.86.2020.04.07.20.34.37
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 20:34:37 -0700 (PDT)
Date: Tue, 7 Apr 2020 23:34:36 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 0/7] Create meta-arm-autonomy Layer
Message-ID: <20200408033435.GA29748@kudzu.us>
References: <20200327105010.400-1-bertrand.marquis@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200327105010.400-1-bertrand.marquis@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 27, 2020 at 10:50:03AM +0000, Bertrand Marquis wrote:
> This patch serie is introducing meta-arm-autonomy layer.
> This layer can be used to create Xen based virtualized system suitable
> for embedded systems.
> It is providing a BSP arm64-autonomy-guest and 2 DISTRO_FEATURES
> "arm-autonomy-host" and "arm-autonomy-guest".

Pull in to the master branch

Thanks,
Jon

> 
> Bertrand Marquis (7):
>   arm-autonomy: Create meta-arm-autonomy layer
>   arm-autonomy: Create arm-autonomy-host feature
>   arm-autonomy: Create arm-autonomy-host image
>   arm-autonomy: Create arm-autonomy-guest feature
>   arm-autonomy: Create arm64-autonomy-guest machine
>   arm-autonomy: Create quick start documentation
>   arm-autonomy: Create xen-devicetree recipe
> 
>  README.md                                     |   3 +
>  meta-arm-autonomy/README.md                   |  79 ++++++++++++
>  .../classes/arm-autonomy-features.bbclass     |   5 +
>  .../distro/include/arm-autonomy-guest.inc     |   5 +
>  .../conf/distro/include/arm-autonomy-host.inc |   5 +
>  meta-arm-autonomy/conf/layer.conf             |  31 +++++
>  .../conf/machine/arm64-autonomy-guest.conf    |  17 +++
>  .../documentation/arm-autonomy-quickstart.md  | 116 ++++++++++++++++++
>  .../documentation/xen-devicetree.md           | 104 ++++++++++++++++
>  .../images/arm-autonomy-host-image-minimal.bb |  30 +++++
>  .../sysvinit/sysvinit-inittab_2.%.bbappend    |  16 +++
>  .../xen-devicetree/files/xen-juno.dtsi        |  11 ++
>  .../xen-devicetree/files/xen.dtsi.in          |  17 +++
>  .../xen-devicetree/xen-devicetree.bb          |  68 ++++++++++
>  .../xen-devicetree/xen-devicetree.bbappend    |  18 +++
>  .../arm64-autonomy-guest-standard.scc         |   5 +
>  .../bsp/arm-autonomy/arm64-autonomy-guest.cfg |   2 +
>  .../bsp/arm-autonomy/arm64-autonomy-guest.scc |   6 +
>  .../features/arm-autonomy/xen-guest.cfg       |  54 ++++++++
>  .../features/arm-autonomy/xen-guest.scc       |   4 +
>  .../features/arm-autonomy/xen-host.cfg        |  35 ++++++
>  .../features/arm-autonomy/xen-host.scc        |   4 +
>  .../recipes-kernel/linux/linux-%.bbappend     |   3 +
>  .../linux/linux-arm-autonomy.inc              |  21 ++++
>  24 files changed, 659 insertions(+)
>  create mode 100644 meta-arm-autonomy/README.md
>  create mode 100644 meta-arm-autonomy/classes/arm-autonomy-features.bbclass
>  create mode 100644 meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
>  create mode 100644 meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
>  create mode 100644 meta-arm-autonomy/conf/layer.conf
>  create mode 100644 meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf
>  create mode 100644 meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
>  create mode 100644 meta-arm-autonomy/documentation/xen-devicetree.md
>  create mode 100644 meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
>  create mode 100644 meta-arm-autonomy/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
>  create mode 100644 meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen-juno.dtsi
>  create mode 100644 meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen.dtsi.in
>  create mode 100644 meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
>  create mode 100644 meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bbappend
>  create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/bsp/arm-autonomy/arm64-autonomy-guest-standard.scc
>  create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/bsp/arm-autonomy/arm64-autonomy-guest.cfg
>  create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/bsp/arm-autonomy/arm64-autonomy-guest.scc
>  create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.cfg
>  create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.scc
>  create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg
>  create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.scc
>  create mode 100644 meta-arm-autonomy/recipes-kernel/linux/linux-%.bbappend
>  create mode 100644 meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> 
> -- 
> 2.17.1
> 

> 

