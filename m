Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.8036.1607526721479248133
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Dec 2020 07:12:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=QEm17PsK;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f195.google.com with SMTP id p12so1111649qtp.7
        for <meta-arm@lists.yoctoproject.org>; Wed, 09 Dec 2020 07:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rszKb8aa25wreKeC1x4TYtZQihguOhlX/3JBEnwMiDg=;
        b=QEm17PsKb5FxZWeaKEILpa5KU0skE6YUowt+OGT5jck/8Bo7hxypvzIxpypXWlAPsn
         SSTl/0tuFU7brDHRPpSlxQa6tM+OU0BbyAQNFzOUDWhBNM/pfpt0KZi3eBKTEpKym33D
         kDRXJcZDc2YwkwHr1zMSYn0qtNdeN1VAGFnNA0tVFqjxxqNausNVKTITHbmxrd/5ERwI
         0q9fAq/ljwRS5UNMhmmT0BeGTvw05rgLQOz1nT4mwpMHHqMXo5pKSJH18X9rKLSB9K5d
         KLKoZdbGd8jFlnGQx+I2seu7xyqRVWK3vmeWDyM+/u0l131XEckTq79AHCDEEtFU5e07
         Knqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rszKb8aa25wreKeC1x4TYtZQihguOhlX/3JBEnwMiDg=;
        b=rI66eQBOuEPkJtwUzRRDkNscsvmunFg4RXTYj2exaGY0JxLIfeqlFPuQQ9dsvHBi8A
         p9hmtwiFnmXGJbW8XKLsKL5WA2xi/mlLmI9N+lAvS7mvYPe6RovMDh1zdz9kI5pCtRwy
         8fSiAxFHQ6BIqAyP1bYR+oLps9OXRKlus8e5JQiczwvL6ZUQiNE7W3jP3ScZLW/w+Axc
         XTwff+2aOzZi/lVJJvULORH8g4xT3Y4QGf7pjRDBjAXZuYoTBKViBs5dEtp0U8pLD/Wt
         W3gMxjw5MJsiGlsvx49xGVMRzS6QB3Sii7wuokBv+8+vlmOuF+Ok4muCn3NhtWbV9dmT
         ewbg==
X-Gm-Message-State: AOAM532NEuIrSNvs6JIpIYM4wxVTw3eTDYXYX1+FDcylU/iOdhwuBezC
	J6nQ6vIsc8zRTnYn/t4ZGfJO7w==
X-Google-Smtp-Source: ABdhPJz00NLvZLwBjVnBLCMHpHuWkG8UyxE000Ly+bEW00thaQ1eNCU66xe6c08tNywpH/OhzxFjdg==
X-Received: by 2002:ac8:1112:: with SMTP id c18mr3526878qtj.72.1607526720595;
        Wed, 09 Dec 2020 07:12:00 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:a12d:9189:5829:3da3])
        by smtp.gmail.com with ESMTPSA id a11sm757180qtd.19.2020.12.09.07.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 07:11:59 -0800 (PST)
Date: Wed, 9 Dec 2020 10:11:58 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Kamil Dziezyk <kamil.dziezyk@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-autonomy/xen-tools: update vif hostname fix patch status
Message-ID: <20201209151157.GB12460@kudzu.us>
References: <20201208101713.24914-1-kamil.dziezyk@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201208101713.24914-1-kamil.dziezyk@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 08, 2020 at 11:17:13AM +0100, Kamil Dziezyk wrote:
> Fix for hostname setting in vif-nat script was merged in xen upstream repo,
> (sha: 5499e0fc8082024bf7e2d0facd5c976e82105070),
> hence correct patch status for 4.14 is 'Backport'.
> 
> Issue-Id: SCM-1523
> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
> Change-Id: I35f04bfa0f0fff81a1ef20d500b9323e5f13b9ed

Both patches applied to master.

Thanks,
Jon

> ---
>  .../xen-tools/0001-vif-nat-fix-hostname.patch | 32 ++++++++++++++-----
>  1 file changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-tools/0001-vif-nat-fix-hostname.patch b/meta-arm-autonomy/recipes-extended/xen/xen-tools/0001-vif-nat-fix-hostname.patch
> index 87f25e2..d2e52ce 100644
> --- a/meta-arm-autonomy/recipes-extended/xen/xen-tools/0001-vif-nat-fix-hostname.patch
> +++ b/meta-arm-autonomy/recipes-extended/xen/xen-tools/0001-vif-nat-fix-hostname.patch
> @@ -1,18 +1,34 @@
> -Upstream-Status: Pending
> +Upstream-Status: Backport
>  Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> +Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
> +
> +From 5499e0fc8082024bf7e2d0facd5c976e82105070 Mon Sep 17 00:00:00 2001
> +From: Diego Sueiro <diego.sueiro@arm.com>
> +Date: Thu, 20 Aug 2020 11:58:20 +0100
> +Subject: [PATCH] tools/hotplug: Fix hostname setting in vif-nat
>  
>  Setting the hostname is failing because the "$XENBUS_PATH/domain"
>  doesn't exist anymore. To fix this we set it to dom$domid
>  
> -Index: git/tools/hotplug/Linux/vif-nat
> -===================================================================
> ---- git.orig/tools/hotplug/Linux/vif-nat
> -+++ git/tools/hotplug/Linux/vif-nat
> -@@ -86,6 +86,7 @@ router_ip=$(routing_ip "$ip")
> +Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> +Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> +Acked-by: Wei Liu <wl@xen.org>
> +---
> + tools/hotplug/Linux/vif-nat | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tools/hotplug/Linux/vif-nat b/tools/hotplug/Linux/vif-nat
> +index a76d9c784b..26144350b3 100644
> +--- a/tools/hotplug/Linux/vif-nat
> ++++ b/tools/hotplug/Linux/vif-nat
> +@@ -85,7 +85,7 @@ router_ip=$(routing_ip "$ip")
> + # Split the given IP/bits pair.
>   vif_ip=`echo ${ip} | awk -F/ '{print $1}'`
>   
> - hostname=$(xenstore_read "$XENBUS_PATH/domain" | tr -- '_.:/+' '-----')
> -+[ -z "${hostname}" ] && hostname=dom$domid
> +-hostname=$(xenstore_read "$XENBUS_PATH/domain" | tr -- '_.:/+' '-----')
> ++hostname=dom$domid
>   if [ "$vifid" != "1" ]
>   then
>     hostname="$hostname-$vifid"
> +-- 
> +2.17.1
> -- 
> 2.17.1
> 

> 
> 
> 

