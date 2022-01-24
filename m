Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7069FC433EF
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 18:06:31 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.508.1643047590562516745
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Jan 2022 10:06:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 837CD40C93;
	Mon, 24 Jan 2022 18:06:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2auS61lB1MWr; Mon, 24 Jan 2022 18:06:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 655DA40C22;
	Mon, 24 Jan 2022 18:06:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 236B3174721; Mon, 24 Jan 2022 13:06:27 -0500 (EST)
Date: Mon, 24 Jan 2022 13:06:27 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [meta-arm] [PATCH 2/2] CI: fix check-layer indeterminism
Message-ID: <20220124180627.GU26229@denix.org>
References: <20220124174012.3916927-1-ross.burton@arm.com>
 <20220124174012.3916927-2-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124174012.3916927-2-ross.burton@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 18:06:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2904

On Mon, Jan 24, 2022 at 05:40:12PM +0000, Ross Burton wrote:
> yocto-check-layers is very greedy when searching for layers, and will
> find the test layers in Bitbake if given the chance, for example:
> 
> bitbake/lib/layerindexlib/tests/testdata/layer4
> 
> This layer has the collection name openembedded-layer and is only
> compatible with Sumo.  The selection of layer from collection name is
> not deterministic, so it's possible that this layer is selected which
> then fails the check as it isn't compatible.
> 
> Solve this by restricting the dependency layers in meta-arm to just
> meta-arm/meta-*, so it doesn't recurse into meta-arm/work/poky/bitbake.

FWIW, I've fallen into this trap before - should this Sumo remnant be removed 
from Bitbake then?


> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .gitlab-ci.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 9a60f672..4c5d74e9 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -79,7 +79,7 @@ check-layers:
>    extends: .setup
>    script:
>      - kas shell --update --force-checkout ci/base.yml:ci/meta-openembedded.yml --command \
> -      "yocto-check-layer-wrapper $CI_PROJECT_DIR/$LAYER --dependency $CI_PROJECT_DIR $KAS_WORK_DIR/meta-openembedded/meta-oe --no-auto-dependency"
> +      "yocto-check-layer-wrapper $CI_PROJECT_DIR/$LAYER --dependency $CI_PROJECT_DIR/meta-* $KAS_WORK_DIR/meta-openembedded/meta-oe --no-auto-dependency"
>    parallel:
>      matrix:
>        - LAYER: [meta-arm, meta-arm-bsp, meta-arm-toolchain, meta-gem5]
> -- 
> 2.25.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

