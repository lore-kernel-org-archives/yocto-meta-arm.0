Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80103FA3741
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 16:14:12 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.11170.1667232850929602375
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 31 Oct 2022 09:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F090140C88;
	Mon, 31 Oct 2022 16:14:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oJ8IPCnakVZA; Mon, 31 Oct 2022 16:14:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D7A2140C76;
	Mon, 31 Oct 2022 16:14:08 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 314241621FF; Mon, 31 Oct 2022 12:14:05 -0400 (EDT)
Date: Mon, 31 Oct 2022 12:14:05 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] CI: Add packages for opencsd and
 gator-daemon to base build
Message-ID: <20221031161405.GC22689@denix.org>
References: <20221028142330.23482-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028142330.23482-1-jon.mason@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 31 Oct 2022 16:14:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4065

On Fri, Oct 28, 2022 at 10:23:30AM -0400, Jon Mason wrote:
> opencsd and gator-daemon aren't currently being build.  Add them to the
> base build so that they can be verified to at least compile.
> 
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  ci/base.yml                | 5 +++--
>  ci/corstone1000-common.yml | 2 +-
>  ci/corstone500.yml         | 2 +-
>  3 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/ci/base.yml b/ci/base.yml
> index c4e68886..75a30925 100644
> --- a/ci/base.yml
> +++ b/ci/base.yml
> @@ -35,8 +35,9 @@ local_conf_header:
>      PACKAGECONFIG:append:pn-perf = " coresight"
>      INHERIT += "rm_work"
>      DISTRO_FEATURES:remove = "ptest"
> -  perf: |
> -    CORE_IMAGE_EXTRA_INSTALL += "perf"
> +  extrapackages: |
> +    CORE_IMAGE_EXTRA_INSTALL += "perf opencsd"
> +    CORE_IMAGE_EXTRA_INSTALL:aarch64 += "gator-daemon"

Should this be CORE_IMAGE_EXTRA_INSTALL:append:aarch64 = "gator-daemon" instead?


>  
>  machine: unset
>  
> diff --git a/ci/corstone1000-common.yml b/ci/corstone1000-common.yml
> index 970a87c9..65ff9d38 100644
> --- a/ci/corstone1000-common.yml
> +++ b/ci/corstone1000-common.yml
> @@ -5,7 +5,7 @@ header:
>      - ci/meta-openembedded.yml
>  
>  local_conf_header:
> -    perf: |
> +    extrapackages: |
>      # Intentionally blank to prevent perf from being added to the image in base.yml
>  
>  distro: poky-tiny
> diff --git a/ci/corstone500.yml b/ci/corstone500.yml
> index d51d45fb..54633e1c 100644
> --- a/ci/corstone500.yml
> +++ b/ci/corstone500.yml
> @@ -7,7 +7,7 @@ local_conf_header:
>    testimagefvp: |
>      INHERIT += "fvpboot"
>      IMAGE_FEATURES:remove = " ssh-server-dropbear"
> -  perf: |
> +  extrapackages: |
>      # Intentionally blank to prevent perf from being added to the image in base.yml
>  
>  machine: corstone500
> -- 
> 2.17.1
> 

