Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE036C71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 12:41:06 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.6194.1750250462605725532
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 05:41:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=0hIrn5C0;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UcrxSdb/6Sj6WXZjaERnyPNCzGy2o8jDhH4xg5JSjbM=; b=0hIrn5C0NTyCtR/KA5K52cYdzV
	ZdSR6tThwVeY91isHp2yPtN7CcdwOVu1pbYoviVfxLHTEa9RH0Pn0cfsnnGURKMkH5sGLIvqvhn0G
	xcxrDKbrTzmXUem/9JOKa+rhLi5EEgbWnsGvNbesGUdQKg/lk+ILzLHGL/Zx/wtwZByUUJnitjoLG
	NxDflCzeDtjKacR2QTvE2NiD7o8T1pHLo3M2c1BLxoEAc00W8sX5NSN5JQ9bhujN4Sn1Sr7FOBnOj
	TmulR0mmjfGDEUT3OG1kiGAHNNRbP792WwYIJY2r4z+tgEYXVBEbHrGrDTqR9ov3IARV9CkG9kJJH
	zfC/Db5A==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:43738 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uRs67-00000003dv9-3p5D;
	Wed, 18 Jun 2025 08:41:01 -0400
Date: Wed, 18 Jun 2025 08:40:55 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Jon Mason <jdmason@kudzu.us>
cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] if this meta-arm .inc file missing a trailing
 colon?
In-Reply-To: <CAPoiz9xd+n0on5FfkquhMLvU+LfDEr3p+T2YVCKgrPFEp1_TSQ@mail.gmail.com>
Message-ID: <0f756c1f-1277-ce79-310c-82f013718128@crashcourse.ca>
References: <339cab03-66a4-2b93-2964-6eee4eb057bc@crashcourse.ca> <CAPoiz9xd+n0on5FfkquhMLvU+LfDEr3p+T2YVCKgrPFEp1_TSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-23116163-1750250460=:1616511"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Jun 2025 12:41:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6570

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-23116163-1750250460=:1616511
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 18 Jun 2025, Jon Mason wrote:

> On Wed, Jun 18, 2025 at 6:07 AM Robert P. J. Day via
> lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
> wrote:
> >
> >
> > here:
> >
> > https://git.yoctoproject.org/meta-arm/tree/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-base.inc#n7
> >
> > should there not be a trailing ":" at the end of that prepend
> > operation?
>
> I think you are correct, and a quick grep shows 10 other instances of
> this in meta-arm.  Thanks for the heads up.
>
> I wonder if there is a way to add a check for prepend and
> FILESEXTRAPATHS in the sanity checkers.

  i'm not sure where you counted 10 other instances but i did notice
the following, which confused me briefly: this appears to be an
example that is missing the trailing colon:

  meta-arm/recipes-kernel/linux/arm-ffa-transport.inc:
    FILESEXTRAPATHS:prepend := "${ARMFILESPATHS}"

except that the variable ARMFILESPATHS is defined to (you guessed it)
have a trailing colon.

  aaarrrggghhh.

i hate that sort of thing.

rday
--8323329-23116163-1750250460=:1616511--

