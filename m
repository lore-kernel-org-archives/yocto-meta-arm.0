Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB48C4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 19:02:41 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31154.1784660557229532438
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 12:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2448140CB1;
	Tue, 21 Jul 2026 19:02:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3_3IrCn02Ucr; Tue, 21 Jul 2026 19:02:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E23E540BD6;
	Tue, 21 Jul 2026 19:02:33 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 863B91769F1; Tue, 21 Jul 2026 15:02:33 -0400 (EDT)
Date: Tue, 21 Jul 2026 15:02:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, Ross Burton <ross.burton@arm.com>
Subject: Re: [meta-arm] [PATCH] recipes: port LICENSE to SPDX
Message-ID: <20260721190233.GQ10186@denix.org>
References: <20260721130159.558910-1-ross.burton@arm.com>
 <178465938142.72400.7475289023349794901.b4-ty@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178465938142.72400.7475289023349794901.b4-ty@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 Jul 2026 19:02:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7121

On Tue, Jul 21, 2026 at 02:43:01PM -0400, Jon Mason wrote:
> 
> On Tue, 21 Jul 2026 14:01:59 +0100, Ross Burton wrote:
> > openembedded-core now parses the LICENSE field as a SPDX license
> > expression[1], so convert the license statements.
> > 
> > This is mostly replacing "&" with "AND", but we can also use "WITH" in
> > the GCC recipes.
> > 
> > [1] oe-core e9d424738d6 ("classes/conf/lib: Parse LICENSE as SPDX Expression")
> > 
> > [...]
> 
> Applied, thanks!

What happened to review process and giving people time for that? Shouldn't 
there be at least 24 hours given?

As a matter of fact, I'm trying to confirm with Ross and Joshua that some of 
the changes are correct (haven't heard from them for a few hours though)

-- 
Denys

