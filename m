Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web09.1694.1614802276809966912
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 03 Mar 2021 12:11:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=CiojZQvg;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.54, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f54.google.com with SMTP id r5so12336500qvv.9
        for <meta-arm@lists.yoctoproject.org>; Wed, 03 Mar 2021 12:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hLpuSm6xJ8u/nnEzJ5eZZ7+swkv28qubDcJbNZOdZ4Y=;
        b=CiojZQvgFizGpARV54HgPMlUo7VqiCX65T1NgsR0auJAjTzvjo/P9oDmHS849TjrYD
         guj3Hi4o5TUidUWOb8nRWM846oac9ZAOYKt7/Xfk90c/uS4Z5DqyZji5f+SUGTjLdlTp
         Dssy15Ck4EpHxLlzCJbe4bLTk0ROxFlyalO2Ag1aoBf/zSXfzuyURfCGbkhdfU8gr4f4
         AKNI0i4fzdaoDyZ66IhKCLMzeb3E2tmfGHIVR11feA8OD77HRtWw0cXIm5VLfvRMfcbn
         wEbsA51fgwdWrZEE40i/K+j3ceAG2byLAM4BFns0Ew9CvlQPDHOM+WRWDL0iRaqz4Fqz
         NVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hLpuSm6xJ8u/nnEzJ5eZZ7+swkv28qubDcJbNZOdZ4Y=;
        b=gQxiu9VSKRjpoDvJch9Mhtm+bZHrZj7YYMNpS9izBexL52Cp9rv+Jq+SDd06A6tECk
         7wcLBP/5iXC7/ph30J9e8qfD4M2DLUBtFCqwK64+VqKb7zimZOHE1v/a7iW6R3djQZMk
         6TyICOdHO4qdjHY2yvrFdD0/fuxGN0K8MfeyeL+HMkbVA5l+OGwqj/r2Kv/62gXk8PXM
         sQZrgfvRzcyyxLFS639tmuMEqKuUGznbqpljro31xKfOXUu50oBIoyQ1nqtFwDBEH8Xm
         qizn5Tl0nZZBWqUwG4v+mQfqficCrJ4Zc0J/oIPK+RtXmXFLjpZIYr2okG+1kCKvSfbS
         W3wA==
X-Gm-Message-State: AOAM531cOvl2w3rPZwQ6hsc42vamOmUFeTILToHmMooblqTcf+nfrPXA
	c4YgjnBUGwpUsoOCsTN6hcZhzw==
X-Google-Smtp-Source: ABdhPJxyA9ywrlZXVVzZkehXzsFEuz7/15PJ6DqBnU8/kPMZO9tz1d2iF6UPE0up0EQY7eypVDcoFg==
X-Received: by 2002:a0c:8623:: with SMTP id p32mr578862qva.23.1614802275740;
        Wed, 03 Mar 2021 12:11:15 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:74b0:bf66:d1c4:6ecb])
        by smtp.gmail.com with ESMTPSA id k126sm5552897qkb.4.2021.03.03.12.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 12:11:15 -0800 (PST)
Date: Wed, 3 Mar 2021 15:11:13 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Richard Neill <richard.neill@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-autonomy/linux-arm-autonomy: Drop XenStore initialisation patch
Message-ID: <20210303201113.GA15294@kudzu.us>
References: <20210302095544.11796-1-richard.neill@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210302095544.11796-1-richard.neill@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 02, 2021 at 09:55:44AM +0000, Richard Neill wrote:
> With the linux-yocto version upgrade, the xenstore initialisation patch is no
> longer necessary.
> 
> Signed-off-by: Richard Neill <richard.neill@arm.com>
> Change-Id: I38d81172d5da97a87d41a76f26fe81d5c3b3f83e
> ---

Included in the master branch

Thanks,
Jon

>  ...XenStore-initialisation-for-XS_LOCAL.patch | 98 -------------------
>  .../linux/linux-arm-autonomy.inc              |  6 --
>  2 files changed, 104 deletions(-)
>  delete mode 100644 meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-Fix-XenStore-initialisation-for-XS_LOCAL.patch
> 
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-Fix-XenStore-initialisation-for-XS_LOCAL.patch b/meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-Fix-XenStore-initialisation-for-XS_LOCAL.patch
> deleted file mode 100644
> index 5bf9b745..00000000
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
> index 644f5639..978daf3b 100644
> --- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> +++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> @@ -44,12 +44,6 @@ python() {
>          if oe.utils.any_distro_features(d, "arm-autonomy-host arm-autonomy-guest"):
>              d.appendVar('SRC_URI', ' file://files/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch' )
>  
> -    if kernelVersion and LooseVersion(kernelVersion) < '5.10.13' \
> -       and pn != 'linux-libc-headers' \
> -       and not pn.startswith('linux-linaro-arm') \
> -       and oe.utils.any_distro_features(d, "arm-autonomy-host"):
> -        d.appendVar('SRC_URI', ' file://files/0001-xen-Fix-XenStore-initialisation-for-XS_LOCAL.patch' )
> -
>      if kernelVersion and LooseVersion(kernelVersion) < '5.10.17' \
>         and pn != 'linux-libc-headers' \
>         and oe.utils.any_distro_features(d, "arm-autonomy-guest"):
> -- 
> 2.25.1
> 

> 
> 
> 

