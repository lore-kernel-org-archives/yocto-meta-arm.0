Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B6BC25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 21:47:46 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2744.1716500862031629143
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 May 2024 14:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C7FC640C1E;
	Thu, 23 May 2024 21:47:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w9wnMGJCYb4A; Thu, 23 May 2024 21:47:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AD43540A46;
	Thu, 23 May 2024 21:47:39 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9C894163F70; Thu, 23 May 2024 17:47:38 -0400 (EDT)
Date: Thu, 23 May 2024 17:47:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Parthiban <parthiban@linumiz.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] _TOOLCHAIN + systemd: Unable to compile
Message-ID: <20240523214738.GK21287@denix.org>
References: <ebb15d2e-db13-4f8f-a26f-b8c0477b394a@linumiz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebb15d2e-db13-4f8f-a26f-b8c0477b394a@linumiz.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 May 2024 21:47:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5764

On Thu, May 23, 2024 at 07:04:42PM +0530, Parthiban wrote:
> Dear All,
> 
> Am trying to use external=arm toolchain with scarthgap mainline together with systemd as INIT_MANAGER.
> With my current understanding, as systemd mandates "usrmerge" DISTRO_FEATURES, both the destination
> and source path changes to same and resulted in the below error.
> 
> | mv: 'build/tmp/work/cortexa53-poky-linux/external-arm-toolchain/12.2.Rel1/image/usr/lib/libasan.a' and 'build/tmp/work/cortexa53-poky-linux/external-arm-toolchain/12.2.Rel1/image/usr/lib/libasan.a' are the same file
> 
> From conf/local.conf:
> DISTRO_FEATURES:append = " systemd usrmerge "
> EXTERNAL_TOOLCHAIN = "/opt/tooling/aarch64"
> TCMODE = "external-arm"
> 
> External toolchain version: gcc version 12.2.1 20221205 (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24))
> 
> When I try to ignore this error "|| true" or skip it, packages compilation failed with libc linking.
> | /opt/tooling/arm-gnu-toolchain-12.2.rel1-x86_64-aarch64-none-linux-gnu/bin/../lib/gcc/aarch64-none-linux-gnu/12.2.1/../../../../aarch64-none-linux-gnu/bin/ld: cannot find ../../lib/libc.so.6: No such file or directory                                                                                                                                                                                                             
> | /opt/tooling/arm-gnu-toolchain-12.2.rel1-x86_64-aarch64-none-linux-gnu/bin/../lib/gcc/aarch64-none-linux-gnu/12.2.1/../../../../aarch64-none-linux-gnu/bin/ld: cannot find ../../lib/ld-linux-aarch64.so.1: No such file or directory               
> 
> Is it possible to use external-arm + systemd with scarthgap?

This is due to "usrmerge"
There were patches on the mailing list couple weeks ago trying to address 
this, but some minor comments haven't been addressed yet, hence not merged:

https://lists.yoctoproject.org/g/meta-arm/topic/105575080

The original submitter hasn't responded yet and I almost forgot about it - let 
me try to re-spin the patches...

-- 
Denys

