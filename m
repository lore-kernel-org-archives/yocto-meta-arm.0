Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web09.588.1615926093992210466
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Mar 2021 13:21:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=KkkFl6pw;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id n79so36685105qke.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 16 Mar 2021 13:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hFjPykFtCQk/qOhSqIf5OdR3nEyNi1g2xOREifcHDQc=;
        b=KkkFl6pwWm2HPL+hLJ1RxPgbg+0ZIm2sz07TMDT6XG3iWWnapxtoH4c9WcMuwuHbX7
         v1IYmtaOXgcoelPlfyVeXsY3apXNgVarRSd1tMqXa959i+Tz8O4KbEMKy3SReQ2L10gK
         ylJwJUEwRPod1hoKX3ouVOPLyutB0kqyaCJEGTPuvaSl70l9tWgAkRxyzuJqo991TVXs
         La4RCXOoZAaCH26ABnomziysRaV3KnnSjc/19AIIqykfPIN0h004rNTsmzn5JwF10e+L
         FzyGfN1ifeu+fwfDu0RPfVtGwFwMucEcOWlPDRWHcF1YQ0DURt1gPVv4rJ8JnQcfdy/Z
         jQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hFjPykFtCQk/qOhSqIf5OdR3nEyNi1g2xOREifcHDQc=;
        b=NUhZDbiikA++VqgT+N/We53ZyuOcCaKT2m5PjlnD6F6bI2q+wgKTy4H2Jy5H0GjwfK
         IwGK3p3ajHb8XxRh0VvWsHJz570MPaMo8PggVbWGx6v3fPpPO9+gdv6Vd4fyOLxUq572
         jJkfvYOjwlIs9ii6t5nqcObVwm2+c6xLik9HHoCNAmVHFzNLwrQE9lFk6QgcVV/YilIu
         zLOe7wUC3260AVxgFfgMUNzEaG0UN/YYqiLBm+zyJt17Yf94i5BU689XsSoSiNvuzNDr
         1ERwoR0aWLWEPrHMQZJDEaEyJ/YENDGpnhRunKA+0W54nmvy/MXv3tMG7VOKvIg9IPXO
         2WWA==
X-Gm-Message-State: AOAM533COQk5dxo7Xj241xJ+awDDXBlTFzWJLRF3SGBRrIFYezsh9F93
	Y/33nfyNykAohKgbxBq4RKmfxw==
X-Google-Smtp-Source: ABdhPJxZguLZj3ID6nOvtJIbduzlPwnWdW7GGProUG21t6QN1WGrwZikjWoL5ghDPW4FL3+f3UyCBA==
X-Received: by 2002:a05:620a:c0e:: with SMTP id l14mr828259qki.91.1615926093048;
        Tue, 16 Mar 2021 13:21:33 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a601:f800:ec25:3ae9:5fa2:9872])
        by smtp.gmail.com with ESMTPSA id 85sm16785086qkf.58.2021.03.16.13.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 13:21:32 -0700 (PDT)
Date: Tue, 16 Mar 2021 16:21:31 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Richard Neill <richard.neill@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-autonomy/linux-arm-autonomy: Drop mainlined kernel patch for xenbus probe
Message-ID: <20210316202131.GC4912@kudzu.us>
References: <20210315091142.17512-1-richard.neill@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210315091142.17512-1-richard.neill@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 15, 2021 at 09:11:42AM +0000, Richard Neill wrote:
> The xenbus_probe patch to fix xen initialisation was mainlined in yocto-linux
> v5.10.17. As oe-core has upgraded past this version, the patch can now be
> dropped.
> 
> Issue-Id: SCM-2263
> Signed-off-by: Richard Neill <richard.neill@arm.com>
> Change-Id: I40e154cdc4dbabfa531a6886d724ecd400657dd9
> ---

Pulled into the master branch

Thanks,
Jon

>  ...obe-xenbus-as-part-of-an-early-initc.patch | 95 -------------------
>  .../linux/linux-arm-autonomy.inc              |  5 -
>  2 files changed, 100 deletions(-)
>  delete mode 100644 meta-arm-autonomy/recipes-kernel/linux/files/0001-arm-xen-Don-t-probe-xenbus-as-part-of-an-early-initc.patch
> 
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/files/0001-arm-xen-Don-t-probe-xenbus-as-part-of-an-early-initc.patch b/meta-arm-autonomy/recipes-kernel/linux/files/0001-arm-xen-Don-t-probe-xenbus-as-part-of-an-early-initc.patch
> deleted file mode 100644
> index 3ec7fa79..00000000
> --- a/meta-arm-autonomy/recipes-kernel/linux/files/0001-arm-xen-Don-t-probe-xenbus-as-part-of-an-early-initc.patch
> +++ /dev/null
> @@ -1,95 +0,0 @@
> -From 89b0c20d80a1ab8aa155af287ff4af378862964f Mon Sep 17 00:00:00 2001
> -Message-Id: <89b0c20d80a1ab8aa155af287ff4af378862964f.1613583742.git.diego.sueiro@arm.com>
> -From: Julien Grall <jgrall@amazon.com>
> -Date: Wed, 10 Feb 2021 17:06:54 +0000
> -Subject: [PATCH] arm/xen: Don't probe xenbus as part of an early initcall
> -
> -commit c4295ab0b485b8bc50d2264bcae2acd06f25caaf upstream.
> -
> -After Commit 3499ba8198cad ("xen: Fix event channel callback via
> -INTX/GSI"), xenbus_probe() will be called too early on Arm. This will
> -recent to a guest hang during boot.
> -
> -If the hang wasn't there, we would have ended up to call
> -xenbus_probe() twice (the second time is in xenbus_probe_initcall()).
> -
> -We don't need to initialize xenbus_probe() early for Arm guest.
> -Therefore, the call in xen_guest_init() is now removed.
> -
> -After this change, there is no more external caller for xenbus_probe().
> -So the function is turned to a static one. Interestingly there were two
> -prototypes for it.
> -
> -Cc: stable@vger.kernel.org
> -Fixes: 3499ba8198cad ("xen: Fix event channel callback via INTX/GSI")
> -Reported-by: Ian Jackson <iwj@xenproject.org>
> -Signed-off-by: Julien Grall <jgrall@amazon.com>
> -Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
> -Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> -Link: https://lore.kernel.org/r/20210210170654.5377-1-julien@xen.org
> -Signed-off-by: Juergen Gross <jgross@suse.com>
> -Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> -
> -Upstream-Status: Backport
> -Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ----
> - arch/arm/xen/enlighten.c          | 2 --
> - drivers/xen/xenbus/xenbus.h       | 1 -
> - drivers/xen/xenbus/xenbus_probe.c | 2 +-
> - include/xen/xenbus.h              | 2 --
> - 4 files changed, 1 insertion(+), 6 deletions(-)
> -
> -diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
> -index 5a957a9a0984..8ad576ecd0f1 100644
> ---- a/arch/arm/xen/enlighten.c
> -+++ b/arch/arm/xen/enlighten.c
> -@@ -370,8 +370,6 @@ static int __init xen_guest_init(void)
> - 		return -ENOMEM;
> - 	}
> - 	gnttab_init();
> --	if (!xen_initial_domain())
> --		xenbus_probe();
> - 
> - 	/*
> - 	 * Making sure board specific code will not set up ops for
> -diff --git a/drivers/xen/xenbus/xenbus.h b/drivers/xen/xenbus/xenbus.h
> -index dc1537335414..2a93b7c9c159 100644
> ---- a/drivers/xen/xenbus/xenbus.h
> -+++ b/drivers/xen/xenbus/xenbus.h
> -@@ -115,7 +115,6 @@ int xenbus_probe_node(struct xen_bus_type *bus,
> - 		      const char *type,
> - 		      const char *nodename);
> - int xenbus_probe_devices(struct xen_bus_type *bus);
> --void xenbus_probe(void);
> - 
> - void xenbus_dev_changed(const char *node, struct xen_bus_type *bus);
> - 
> -diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
> -index 18ffd0551b54..8a75092bb148 100644
> ---- a/drivers/xen/xenbus/xenbus_probe.c
> -+++ b/drivers/xen/xenbus/xenbus_probe.c
> -@@ -683,7 +683,7 @@ void unregister_xenstore_notifier(struct notifier_block *nb)
> - }
> - EXPORT_SYMBOL_GPL(unregister_xenstore_notifier);
> - 
> --void xenbus_probe(void)
> -+static void xenbus_probe(void)
> - {
> - 	xenstored_ready = 1;
> - 
> -diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
> -index 2c43b0ef1e4d..bf3cfc7c35d0 100644
> ---- a/include/xen/xenbus.h
> -+++ b/include/xen/xenbus.h
> -@@ -192,8 +192,6 @@ void xs_suspend_cancel(void);
> - 
> - struct work_struct;
> - 
> --void xenbus_probe(void);
> --
> - #define XENBUS_IS_ERR_READ(str) ({			\
> - 	if (!IS_ERR(str) && strlen(str) == 0) {		\
> - 		kfree(str);				\
> --- 
> -2.17.1
> -
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> index 57e44ceb..9750cb55 100644
> --- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> +++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> @@ -48,9 +48,4 @@ python() {
>      if kernelVersion and LooseVersion(kernelVersion) < '5.10':
>          if oe.utils.any_distro_features(d, "arm-autonomy-host arm-autonomy-guest"):
>              d.appendVar('SRC_URI', ' file://files/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch' )
> -
> -    if kernelVersion and LooseVersion(kernelVersion) < '5.10.17' \
> -       and pn != 'linux-libc-headers' \
> -       and oe.utils.any_distro_features(d, "arm-autonomy-guest"):
> -        d.appendVar('SRC_URI', ' file://files/0001-arm-xen-Don-t-probe-xenbus-as-part-of-an-early-initc.patch' )
>  }
> -- 
> 2.25.1
> 

> 
> 
> 

