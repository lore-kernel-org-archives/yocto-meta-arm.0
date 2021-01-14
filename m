Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web12.376.1610652118040905253
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 Jan 2021 11:21:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=hNKPp7gu;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id r9so4350170qtp.11
        for <meta-arm@lists.yoctoproject.org>; Thu, 14 Jan 2021 11:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LpZhu4aCUubY5RnXE8GLsZk1vNTBry2zgQ32bH7IAB0=;
        b=hNKPp7guIhaW7XL9bjsze/KdNGXqL/XpvKj9NtOv90xnY/BllMwA04kN24IV/KbbNK
         G4YBhC71itbl2EUN5uIunsPOIXFYxQ2tBKKIhaYMX8tuLmR87amjZ6Rwdz6icfvTmbiQ
         /Fo+dh7QvUnwOv7+vCPK/kmEAIEAz4UdBqHHGgMqRP7qynJ7PeGvewy6JQQw3/LYiZrG
         c5f0eHxghnm3ydft1LyJU+Ppa7dH7URIwiyzYRJAV1sT2u40XvcGqapmtSz8tiVgm6eu
         Gc42rYp6YGI8O0bXdZ/1DiUu1QvEEX6JBXyXvgCVPkaKY2vB4bbJoAbl+kSWZ9BmNiXq
         ZQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LpZhu4aCUubY5RnXE8GLsZk1vNTBry2zgQ32bH7IAB0=;
        b=agVnf+ISMaqfv+GmFjSHq4xMJ/lkCVdPhcWsS6qaDXwuq2jIJS+LEUCxdLrltBXAEP
         eByduo9DT43jcWfShjujp1GdypFB8doLS7B9QHGseXYnLYP5ZvX/4q9PZCwZltOztCBf
         WuPFg4Hp/yT8SiSvkp5uqrGPoTAmNps1L4tXZE3R92kJoY8qr8VD14c9+D6g2EbjaSlK
         lsbyzHqY5HwRtSIbLdZm8VKu6edG6ntO9ZfCFCe/+3CJ/Hl0kNP9L16gDYfv4B5RgAme
         zQrH6emG3HRpItvnkkRtKyG5qrzSjbWrrJbynMRYx1sarDQDdtSZAOjV2rzy056BrA3z
         12DA==
X-Gm-Message-State: AOAM531YWJlf29o0MQVaJRGCC6HcaxC6uccOygyikA9m7Jn5iFMNr1p2
	zNMfQPXryMyf44X/aiS6OEF4xUQK1cvJxw==
X-Google-Smtp-Source: ABdhPJzAKhbv67qIJnPWhvDW9vK8gPwOin4FUDW/9Epa2iVNxx3KyhEgoakL1ika7UnCWfU2U+bsNw==
X-Received: by 2002:ac8:66c7:: with SMTP id m7mr8656310qtp.69.1610652117232;
        Thu, 14 Jan 2021 11:21:57 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:1d40:95cb:6898:8d5])
        by smtp.gmail.com with ESMTPSA id x3sm3308095qtd.56.2021.01.14.11.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 11:21:57 -0800 (PST)
Date: Thu, 14 Jan 2021 14:21:55 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-autonomy/linux-arm-autonomy: apply runstate fix to kernels older than 5.10
Message-ID: <20210114192155.GB511@kudzu.us>
References: <774e38d247b9c20e78133a64e8216748596f44d0.1610377554.git.diego.sueiro@arm.com>
MIME-Version: 1.0
In-Reply-To: <774e38d247b9c20e78133a64e8216748596f44d0.1610377554.git.diego.sueiro@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 11, 2021 at 03:08:43PM +0000, Diego Sueiro wrote:
> The patch introduced in 82ffc86 is a backport from the 5.10 version. Hence,
> just apply it for kernels older than 5.10.
> 
> Change-Id: I6f442f540913b5e24bea533a436b4a3104d098e9
> Issue-Id: SCM-2033
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  .../features/arm-autonomy/xen-common.scc               |  2 --
>  ...-do-not-setup-the-runstate-info-page-if-kpti-.patch |  0
>  .../recipes-kernel/linux/linux-arm-autonomy.inc        | 10 ++++++++++
>  3 files changed, 10 insertions(+), 2 deletions(-)
>  rename meta-arm-autonomy/recipes-kernel/linux/{arm-autonomy-kmeta/features/arm-autonomy => files}/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch (100%)
> 
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-common.scc b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-common.scc
> index beee091..f359d8c 100644
> --- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-common.scc
> +++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-common.scc
> @@ -1,5 +1,3 @@
>  define KFEATURE_DESCRIPTION "Common XEN (Host and Guest) configs and patches on autonomy systems"
>  
>  kconf non-hardware xen-common.cfg
> -
> -patch 0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch b/meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch
> similarity index 100%
> rename from meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch
> rename to meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> index c5cb66d..89c9fce 100644
> --- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> +++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> @@ -33,3 +33,13 @@ KMACHINE_arm64-autonomy-guest = "arm64-autonomy-guest"
>  # Add Minimal Kernel Configs for Docker runtime
>  KERNEL_FEATURES += "${@bb.utils.contains('DISTRO_FEATURES', \
>          'docker', 'features/arm-autonomy/docker-minimal.scc', '', d)}"
> +
> +python() {
> +    from distutils.version import LooseVersion
> +
> +    kernelVersion = d.getVar('LINUX_VERSION')
> +
> +    if kernelVersion and LooseVersion(kernelVersion) < '5.10':
> +        if oe.utils.any_distro_features(d, "arm-autonomy-host arm-autonomy-guest"):
> +            d.appendVar('SRC_URI', ' file://files/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch' )
> +}
> -- 
> 2.17.1
> 

> 
> 
> 

