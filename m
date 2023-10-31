Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F1CC4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 18:37:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3545.1698777416224617066
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 31 Oct 2023 11:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1623F40CBA;
	Tue, 31 Oct 2023 18:36:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hpi7IQEBQocq; Tue, 31 Oct 2023 18:36:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F0F7D40CB3;
	Tue, 31 Oct 2023 18:36:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 35EA2163D30; Tue, 31 Oct 2023 14:36:53 -0400 (EDT)
Date: Tue, 31 Oct 2023 14:36:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm/optee: update to 4.0.0
Message-ID: <20231031183653.GH2408@denix.org>
References: <20231030142053.3961926-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231030142053.3961926-1-jon.mason@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 31 Oct 2023 18:37:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5191

On Mon, Oct 30, 2023 at 09:20:53AM -0500, Jon Mason wrote:
> Update the recipes and patches for OP-TEE 4.0.0.  Migrate the 3.22.0
> recipe to meta-arm-bsp for corstone1000 and n1sdp.

This mostly looks good. I had couple minor comments/questions:

> +EXTRA_OEMAKE:append = " OPTEE_OPENSSL_EXPORT=${STAGING_INCDIR}"
> +DEPENDS:append = " openssl"
> +CFLAGS:append = " -Wno-error=deprecated-declarations"

1. The above section can probably now be moved to generic .inc files, instead 
of needing to be added to each versioned .bb recipe - this is now generically 
applicable to all supported versions.

2. Do we really need non-machine-specific :append there? Since it adjusts the 
values set right there in the .inc file, it can now be done directly to those 
variables in the first place. Or at least use += instead of :append - those 
are much easier to override downstram.

FWIW, meta-ti already updated OPTEE components to 4.0.0 a bit earlier through 
.bbappends and had to make the same patch changes and used the same SRCREVs, 
so that can be considered some testing on those platforms :)

https://git.yoctoproject.org/meta-ti/commit/?id=26729b38d3890e2cf850e30ef1171f2fc2534043


> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
[snip]
>  .../recipes-security/optee/optee-os_4.0.0.bb  |  13 +
>  ..._1000-remove-unneeded-stat.h-include.patch |  34 ---
>  .../optee/optee-test_3.22.0.bb                |  10 -
>  .../optee/optee-test_4.%.bbappend             |   0
>  ...test_3.2%.bbappend => optee-test_4.0.0.bb} |   8 +
>  24 files changed, 459 insertions(+), 53 deletions(-)
[snip]
>  create mode 100644 meta-arm/recipes-security/optee/optee-os_4.0.0.bb
>  delete mode 100644 meta-arm/recipes-security/optee/optee-test/0001-xtest-regression_1000-remove-unneeded-stat.h-include.patch
>  delete mode 100644 meta-arm/recipes-security/optee/optee-test_3.22.0.bb
>  create mode 100644 meta-arm/recipes-security/optee/optee-test_4.%.bbappend

This ^^^ creates an empty .bbappend file


>  rename meta-arm/recipes-security/optee/{optee-test_3.2%.bbappend => optee-test_4.0.0.bb} (63%)

-- 
Denys

