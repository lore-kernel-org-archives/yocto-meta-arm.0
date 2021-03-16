Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web09.578.1615926072793848002
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Mar 2021 13:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=MH/9LWpV;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.50, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f50.google.com with SMTP id by2so286628qvb.11
        for <meta-arm@lists.yoctoproject.org>; Tue, 16 Mar 2021 13:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=R4X3Q+mZ/zPBFhSjcAphjYWNYYwIQagSaZ8a+ez+Dww=;
        b=MH/9LWpVV91HbdMM/jWYaUmi77O+CbDBtrJWO4iw7varqlGRgG+lvZuHHSbyLLFiX3
         W11zNYGNP6d5xa4XdiM4PEoX4ZKeglUsUtU1kVvne/07TUKunsxi3JMtk7feAlpsle6u
         5Z99ok7mN6rYQMKEiA3KsW4RUmoHGtzuoH27ngaoAW8D5XwYWQIEWLZRSMPFTJMGSr8K
         09DOhsYzTbrjPBMz8Cn/Zy4fk6G6toHq6VIp6LZQKOCAa+074j9FMyW/c/2ecGGSlYF4
         iStU++ebZGpFcoxf8xvGiZV3havsdL1OErCom9xQm+BfcoM3Sgyc0hlaAS4qiFXB60jf
         vDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=R4X3Q+mZ/zPBFhSjcAphjYWNYYwIQagSaZ8a+ez+Dww=;
        b=JyM7d4ZP10MO71ST7ZF6y87PnEMPrjXh6LE0iwfkE4/V77KMmpAeRA0wlJdDsGaqi0
         nhEeFiKSRxaZqUNq7HMp6jf9AoS796FwwMJ+gG9FRJbv0MY+X9DCIGJdutUCJK9L/479
         bAKMBFZ9dbP7UeTAcbszRPzoLk7pBUTcpvN7NMPmwYn7TGR8e/LzZPRy0q4AcEOeFWi+
         LAQUsZfQEDUFRWlWwIDUK1LAKWRpQIpaqWu1ydJTncrkT/0J9iiZ9kOaZAsU0eTDaQ+C
         ubzs/TjjT3zcaKWKcJTtr82y+LQg0jzbc+oZbbbmCMPW8l8YpUhK5C3LiH3G88HAGjeD
         f8tQ==
X-Gm-Message-State: AOAM533sUnF8OQRBPW+PtuVaB+ncgmdy4OtwzRkDWn7EwF7Bb7RdpvPp
	rhElCwS5eaGv6D0qhnSPoyaWUw==
X-Google-Smtp-Source: ABdhPJwGaoTQgYvV5HQ25I0hbkKZ0SEfSAA6qrdQxK9R2Ij1ktrzdRrHqc1hgFxOHJEHz/llhCf8oA==
X-Received: by 2002:a05:6214:2464:: with SMTP id im4mr1609169qvb.61.1615926071883;
        Tue, 16 Mar 2021 13:21:11 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a601:f800:ec25:3ae9:5fa2:9872])
        by smtp.gmail.com with ESMTPSA id c5sm15911332qkl.21.2021.03.16.13.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 13:21:11 -0700 (PDT)
Date: Tue, 16 Mar 2021 16:21:10 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Richard Neill <richard.neill@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH gatesgarth] arm-autonomy/linux-arm-autonomy: Drop XenStore initialisation patch
Message-ID: <20210316202109.GB4912@kudzu.us>
References: <20210315091315.17800-1-richard.neill@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210315091315.17800-1-richard.neill@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 15, 2021 at 09:13:15AM +0000, Richard Neill wrote:
> With the linux-yocto version upgrade, the xenstore initialisation patch is no
> longer necessary.
> 
> Issue-Id: SCM-2263
> Signed-off-by: Richard Neill <richard.neill@arm.com>
> Change-Id: I293a5f81b48c57f3af1c99606af776537f35f0bb
> ---

Pulled into the gatesgarth branch

Thanks,
Jon

>  ...XenStore-initialisation-for-XS_LOCAL.patch | 98 -------------------
>  .../linux/linux-arm-autonomy.inc              |  6 --
>  2 files changed, 104 deletions(-)
>  delete mode 100644 meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-Fix-XenStore-initialisation-for-XS_LOCAL.patch
> 
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-Fix-XenStore-initialisation-for-XS_LOCAL.patch b/meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-Fix-XenStore-initialisation-for-XS_LOCAL.patch
> deleted file mode 100644
> index 5bf9b74..0000000
> --- a/meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-Fix-XenStore-initialisation-for-XS_LOCAL.patch
> +++ /dev/null
> @@ -1,98 +0,0 @@
> -From 5f3d54c00f1f2682cee9c590c22655b0330ffd18 Mon Sep 17 00:00:00 2001
> -Message-Id: <5f3d54c00f1f2682cee9c590c22655b0330ffd18.1612780458.git.diego.sueiro@arm.com>
> -From: David Woodhouse <dwmw@amazon.co.uk>
> -Date: Tue, 26 Jan 2021 17:01:49 +0000
> -Subject: [PATCH] xen: Fix XenStore initialisation for XS_LOCAL
> -
> -commit 5f46400f7a6a4fad635d5a79e2aa5a04a30ffea1 upstream.
> -
> -In commit 3499ba8198ca ("xen: Fix event channel callback via INTX/GSI")
> -I reworked the triggering of xenbus_probe().
> -
> -I tried to simplify things by taking out the workqueue based startup
> -triggered from wake_waiting(); the somewhat poorly named xenbus IRQ
> -handler.
> -
> -I missed the fact that in the XS_LOCAL case (Dom0 starting its own
> -xenstored or xenstore-stubdom, which happens after the kernel is booted
> -completely), that IRQ-based trigger is still actually needed.
> -
> -So... put it back, except more cleanly. By just spawning a xenbus_probe
> -thread which waits on xb_waitq and runs the probe the first time it
> -gets woken, just as the workqueue-based hack did.
> -
> -This is actually a nicer approach for *all* the back ends with different
> -interrupt methods, and we can switch them all over to that without the
> -complex conditions for when to trigger it. But not in -rc6. This is
> -the minimal fix for the regression, although it's a step in the right
> -direction instead of doing a partial revert and actually putting the
> -workqueue back. It's also simpler than the workqueue.
> -
> -Fixes: 3499ba8198ca ("xen: Fix event channel callback via INTX/GSI")
> -Reported-by: Juergen Gross <jgross@suse.com>
> -Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> -Reviewed-by: Juergen Gross <jgross@suse.com>
> -Link: https://lore.kernel.org/r/4c9af052a6e0f6485d1de43f2c38b1461996db99.camel@infradead.org
> -Signed-off-by: Juergen Gross <jgross@suse.com>
> -Cc: Salvatore Bonaccorso <carnil@debian.org>
> -Cc: Jason Andryuk <jandryuk@gmail.com>
> -Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> -
> -Upstream-Status: Backport
> -Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ----
> - drivers/xen/xenbus/xenbus_probe.c | 31 +++++++++++++++++++++++++++++++
> - 1 file changed, 31 insertions(+)
> -
> -diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
> -index c8f0282bb649..18ffd0551b54 100644
> ---- a/drivers/xen/xenbus/xenbus_probe.c
> -+++ b/drivers/xen/xenbus/xenbus_probe.c
> -@@ -714,6 +714,23 @@ static bool xs_hvm_defer_init_for_callback(void)
> - #endif
> - }
> - 
> -+static int xenbus_probe_thread(void *unused)
> -+{
> -+	DEFINE_WAIT(w);
> -+
> -+	/*
> -+	 * We actually just want to wait for *any* trigger of xb_waitq,
> -+	 * and run xenbus_probe() the moment it occurs.
> -+	 */
> -+	prepare_to_wait(&xb_waitq, &w, TASK_INTERRUPTIBLE);
> -+	schedule();
> -+	finish_wait(&xb_waitq, &w);
> -+
> -+	DPRINTK("probing");
> -+	xenbus_probe();
> -+	return 0;
> -+}
> -+
> - static int __init xenbus_probe_initcall(void)
> - {
> - 	/*
> -@@ -725,6 +742,20 @@ static int __init xenbus_probe_initcall(void)
> - 	     !xs_hvm_defer_init_for_callback()))
> - 		xenbus_probe();
> - 
> -+	/*
> -+	 * For XS_LOCAL, spawn a thread which will wait for xenstored
> -+	 * or a xenstore-stubdom to be started, then probe. It will be
> -+	 * triggered when communication starts happening, by waiting
> -+	 * on xb_waitq.
> -+	 */
> -+	if (xen_store_domain_type == XS_LOCAL) {
> -+		struct task_struct *probe_task;
> -+
> -+		probe_task = kthread_run(xenbus_probe_thread, NULL,
> -+					 "xenbus_probe");
> -+		if (IS_ERR(probe_task))
> -+			return PTR_ERR(probe_task);
> -+	}
> - 	return 0;
> - }
> - device_initcall(xenbus_probe_initcall);
> --- 
> -2.17.1
> -
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> index f365341..bc283f0 100644
> --- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> +++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> @@ -40,12 +40,6 @@ python() {
>      kernelVersion = d.getVar('LINUX_VERSION')
>      pn = d.getVar('PN')
>  
> -    if kernelVersion and LooseVersion(kernelVersion) < '5.4.95' \
> -       and pn != 'linux-libc-headers' \
> -       and not pn.startswith('linux-linaro-arm') \
> -       and oe.utils.any_distro_features(d, "arm-autonomy-host"):
> -        d.appendVar('SRC_URI', ' file://files/0001-xen-Fix-XenStore-initialisation-for-XS_LOCAL.patch' )
> -
>      if kernelVersion and LooseVersion(kernelVersion) < '5.4.99' \
>         and pn != 'linux-libc-headers' \
>         and oe.utils.any_distro_features(d, "arm-autonomy-guest"):
> -- 
> 2.25.1
> 

> 
> 
> 

