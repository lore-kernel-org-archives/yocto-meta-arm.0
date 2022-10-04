Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6BFEC433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 13:16:17 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web12.10456.1664889371652199494
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 06:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=qDWgVDyW;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.181,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f181.google.com with SMTP id b23so8053947qtr.13
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 06:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=vLv/OvOsNvazWf1lPEYZOYtOnJZK0zZl/OXn3WBPrZ8=;
        b=qDWgVDyW4RXuq7NMtMi2eXuG8LWhbI4PLJJnJed0Aon1dzXN9kCSxwTmP2VKqpM2F+
         oCgVEAuyTC+Gi9tUW+z+1yTcA9Zn2JwJGry5xGVL/9t5bugm8mHjEfuyrYrtn4C0Jg/L
         iR6vt34jNKIHn8DJm1B2XK42lIqf1NOetPuyJbVecr2IygBS9Jz3O1yVEFKv8tssOzhk
         tI45npNWwbQF8Px7X7c+PZ3TVpAfX9w2gMAGIFYHj9QoYlQkI3NwMTwTC6HNl7ZdFKv+
         L5/I+SrasCkAQGC0iQyQeTVVFdKxhFVY+OMWhAoeys3I7n6X0ES+9UfvUO2aJ56tkwSr
         RmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=vLv/OvOsNvazWf1lPEYZOYtOnJZK0zZl/OXn3WBPrZ8=;
        b=N8q7PU/AcIwf9MPOeHFuqCtvKzYxyPKrsML1ICQrSkPUYsWNozJf7gVhr55UAd4WSv
         Z5aptHnrKGtoRqRgbqFKCAaGc8YxeO9Mp+xTVJDLm//4t1Ta6CzrRUMfrXI2HffiVZee
         WQppZ+Tp4NzeIJGIFfh/HhPbA6fNoHZR2/hUXIBzQRHJZo02wQE+uyelHGsS/wdMeSGO
         yQ2JV1nXL7wSUpBv5Tk9k3JE796tTidtuwKikCUT8NqjtDiBhFyBlPavAJeePrpuey2j
         b24jp+Dvc5zASZZGYALi4ILUrHTU81Waou8AaGHUWakpOxdsQbZrDAI+IyQuHIoXyJUE
         la0g==
X-Gm-Message-State: ACrzQf1ogMzXn2anccNS9dQGgO2e8eIt+FCme6TS69iuhwCZNih+xZu0
	Z3HZ/O2iikXS2q4a5Z9AfXXftQ==
X-Google-Smtp-Source: 
 AMsMyM5nkSE82YBeWJuGr34jNtWTCK+YSKqyA82E/bjM3gPSoR1a6Gh9Cj9UHMF3tUpbs+UMKGS1kA==
X-Received: by 2002:ac8:7c49:0:b0:35d:ac1:66ca with SMTP id
 o9-20020ac87c49000000b0035d0ac166camr19177393qtv.405.1664889370650;
        Tue, 04 Oct 2022 06:16:10 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 a1-20020ac844a1000000b00339163a06fcsm11771932qto.6.2022.10.04.06.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 06:16:10 -0700 (PDT)
Date: Tue, 4 Oct 2022 09:16:08 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH] CI: apply a patch so that meta-zephyr is compatible with
 langdale
Message-ID: <YzwyGH1UBiEohjPW@kudzu.us>
References: <20221003221848.26450-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221003221848.26450-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Oct 2022 13:16:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3917

Reverted, as the patch was applied upstream ~6hours after this was
applied in meta-arm.

On Mon, Oct 03, 2022 at 06:18:48PM -0400, Jon Mason wrote:
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  0001-layers-add-langdale-compatibility.patch | 42 ++++++++++++++++++++
>  ci/meta-zephyr.yml                           |  4 ++
>  2 files changed, 46 insertions(+)
>  create mode 100644 0001-layers-add-langdale-compatibility.patch
> 
> diff --git a/0001-layers-add-langdale-compatibility.patch b/0001-layers-add-langdale-compatibility.patch
> new file mode 100644
> index 00000000..034864e0
> --- /dev/null
> +++ b/0001-layers-add-langdale-compatibility.patch
> @@ -0,0 +1,42 @@
> +From 6eb21b8c40daa9049c68787b0e6ed841e8f2d07c Mon Sep 17 00:00:00 2001
> +From: Jon Mason <jon.mason@arm.com>
> +Date: Thu, 29 Sep 2022 18:09:02 -0400
> +Subject: [PATCH] layers: add langdale compatibility
> +
> +Signed-off-by: Jon Mason <jon.mason@arm.com>
> +---
> + meta-zephyr-bsp/conf/layer.conf  | 4 ++--
> + meta-zephyr-core/conf/layer.conf | 4 ++--
> + 2 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/meta-zephyr-bsp/conf/layer.conf b/meta-zephyr-bsp/conf/layer.conf
> +index 507374f206b0..cbbaafe2a8dc 100644
> +--- a/meta-zephyr-bsp/conf/layer.conf
> ++++ b/meta-zephyr-bsp/conf/layer.conf
> +@@ -15,6 +15,6 @@ LAYERVERSION_zephyrbsp = "1"
> + 
> + LAYERDEPENDS_zephyrbsp = "zephyrcore core meta-python"
> + 
> +-LAYERSERIES_COMPAT_zephyrbsp = "dunfell gatesgarth hardknott honister kirkstone"
> ++LAYERSERIES_COMPAT_zephyrbsp = "dunfell gatesgarth hardknott honister kirkstone langdale"
> + 
> +-X86_TUNE_DIR = "${@bb.utils.contains_any('LAYERSERIES_CORENAMES', 'honister kirkstone', 'include/x86', 'include', d)}"
> ++X86_TUNE_DIR = "${@bb.utils.contains_any('LAYERSERIES_CORENAMES', 'honister kirkstone langdale', 'include/x86', 'include', d)}"
> +diff --git a/meta-zephyr-core/conf/layer.conf b/meta-zephyr-core/conf/layer.conf
> +index 20c8fdf93a83..3d1e57b13897 100644
> +--- a/meta-zephyr-core/conf/layer.conf
> ++++ b/meta-zephyr-core/conf/layer.conf
> +@@ -15,8 +15,8 @@ LAYERVERSION_zephyrcore = "1"
> + 
> + LAYERDEPENDS_zephyrcore = "core meta-python"
> + 
> +-LAYERSERIES_COMPAT_zephyrcore = "dunfell gatesgarth hardknott honister kirkstone"
> ++LAYERSERIES_COMPAT_zephyrcore = "dunfell gatesgarth hardknott honister kirkstone langdale"
> + 
> +-X86_TUNE_DIR = "${@bb.utils.contains_any('LAYERSERIES_CORENAMES', 'honister kirkstone', 'include/x86', 'include', d)}"
> ++X86_TUNE_DIR = "${@bb.utils.contains_any('LAYERSERIES_CORENAMES', 'honister kirkstone langdale', 'include/x86', 'include', d)}"
> + 
> + PYTHON3_NATIVE_SITEPACKAGES_DIR = "${libdir_native}/${PYTHON3_DIR}/site-packages"
> +-- 
> +2.30.2
> +
> diff --git a/ci/meta-zephyr.yml b/ci/meta-zephyr.yml
> index bdd0e2bb..211f2e32 100644
> --- a/ci/meta-zephyr.yml
> +++ b/ci/meta-zephyr.yml
> @@ -8,6 +8,10 @@ repos:
>      url: https://git.yoctoproject.org/git/meta-zephyr
>      layers:
>        meta-zephyr-core:
> +    patches:
> +      langdale:
> +        repo: meta-arm
> +        path: 0001-layers-add-langdale-compatibility.patch
>  
>  target:
>    - zephyr-kernel-test-all
> -- 
> 2.17.1
> 
> 

