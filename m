Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F067C7EE25
	for <webhook@archiver.kernel.org>; Sat, 10 Jun 2023 00:29:16 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.9336.1686356947507083805
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 09 Jun 2023 17:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5F34240CA2;
	Sat, 10 Jun 2023 00:29:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xgQQ3nuOFj6L; Sat, 10 Jun 2023 00:29:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4091E40C30;
	Sat, 10 Jun 2023 00:29:05 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5217E163A06; Fri,  9 Jun 2023 20:28:17 -0400 (EDT)
Date: Fri, 9 Jun 2023 20:28:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] optee: CFG_MAP_EXT_DT_SECURE=y and CFG_DT=y
 mandatory or machine specific?
Message-ID: <20230610002817.GK9226@denix.org>
References: <ZIBjbFIsz5x+721R@nuoska>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZIBjbFIsz5x+721R@nuoska>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 10 Jun 2023 00:29:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4754

On Wed, Jun 07, 2023 at 02:01:00PM +0300, Mikko Rapeli wrote:
> Hi,
> 
> Change b81642c5f8566a947a13ccb3ef135157b1842449 says it's for qemu only
> but in meta-arm/recipes-security/optee/optee-os_3.20.0.bb
> 
> EXTRA_OEMAKE += " CFG_MAP_EXT_DT_SECURE=y"
> 
> applies to all machines, and this in turn depends on CFG_DT=y which
> is also not ok for all machines.
> 
> Should this actually be applied to only certain machines targets
> provided by poky (qemuarm/qemuarm64) and/or meta-arm?

I would also like an answer for this question! Should all platforms (including 
those downstream to meta-arm) define CFG_DT=y all the time? Or should meta-arm 
optee default just drop CFG_MAP_EXT_DT_SECURE=y and only set it selectively 
when needed? Seeing breakages now since this patchset got merged couple of 
says ago:
https://patchwork.yoctoproject.org/project/arm/list/?series=12920

-- 
Denys

