Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DEEEC433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 18:57:42 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.11471.1644605860918187250
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 10:57:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8A42740C79;
	Fri, 11 Feb 2022 18:57:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2fyuvAHpSgfV; Fri, 11 Feb 2022 18:57:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 72F0D40C6C;
	Fri, 11 Feb 2022 18:57:38 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A57AE17474B; Fri, 11 Feb 2022 13:57:37 -0500 (EST)
Date: Fri, 11 Feb 2022 13:57:37 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 3/4] gem5/linux-yocto: use wildcards in the
 bbappend
Message-ID: <20220211185737.GF26229@denix.org>
References: <20220211114527.4157075-1-ross.burton@arm.com>
 <20220211114527.4157075-3-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211114527.4157075-3-ross.burton@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 18:57:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2996

Why not use --find-renames so the patch like this is more readable and 
reviewable?


On Fri, Feb 11, 2022 at 11:45:26AM +0000, Ross Burton wrote:
> Don't hard-code 5.4, use wildcards instead.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../recipes-kernel/linux/linux-yocto_%.bbappend      | 11 +++++++++++
>  .../recipes-kernel/linux/linux-yocto_5.4.bbappend    | 12 ------------
>  2 files changed, 11 insertions(+), 12 deletions(-)
>  create mode 100644 meta-gem5/recipes-kernel/linux/linux-yocto_%.bbappend
> 
> diff --git a/meta-gem5/recipes-kernel/linux/linux-yocto_%.bbappend b/meta-gem5/recipes-kernel/linux/linux-yocto_%.bbappend
> new file mode 100644
> index 00000000..b36ea064
> --- /dev/null
> +++ b/meta-gem5/recipes-kernel/linux/linux-yocto_%.bbappend
> @@ -0,0 +1,11 @@
> +FILESEXTRAPATHS:prepend:gem5-arm64 := "${THISDIR}:${THISDIR}/files:"
> +
> +COMPATIBLE_MACHINE:gem5-arm64 = "gem5-arm64"
> +KMACHINE:gem5-arm64 = "gem5-arm64"
> +SRC_URI:append:gem5-arm64 = " file://gem5-kmeta;type=kmeta;name=gem5-kmeta;destsuffix=gem5-kmeta \
> +                              file://dts/gem5-arm64;subdir=add-files"
> +
> +do_patch:append:gem5-arm64() {
> +    tar -C ${WORKDIR}/add-files/dts -cf - gem5-arm64 | \
> +        tar -C arch/arm64/boot/dts -xf -
> +}
> diff --git a/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend b/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend
> index 480c5e23..078b684f 100644
> --- a/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend
> +++ b/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend
> @@ -1,13 +1 @@
> -FILESEXTRAPATHS:prepend := "${THISDIR}:${THISDIR}/files:"
> -
>  require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'recipes-kernel/linux/linux-yocto_virtualization.inc', '', d)}
> -
> -COMPATIBLE_MACHINE:gem5-arm64 = "gem5-arm64"
> -KMACHINE:gem5-arm64 = "gem5-arm64"
> -SRC_URI:append:gem5-arm64 = " file://gem5-kmeta;type=kmeta;name=gem5-kmeta;destsuffix=gem5-kmeta \
> -                              file://dts/gem5-arm64;subdir=add-files"
> -
> -do_patch:append:gem5-arm64() {
> -    tar -C ${WORKDIR}/add-files/dts -cf - gem5-arm64 | \
> -        tar -C arch/arm64/boot/dts -xf -
> -}
> -- 
> 2.25.1
> 

