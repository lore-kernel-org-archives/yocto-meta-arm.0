Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C43F7C71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 12:57:56 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.6681.1750251473436942811
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 05:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=iE+r/2Rk;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HB7de7pBvTsmTwRJuMb36C2cWK5kRma28KHsJyqhkQA=; b=iE+r/2RkhXNHqKxK8lbqBSNPq2
	8zQGg0x+rdlVqRgKQ0mbmXfaNeP1QgwPmO4S33U2kDrbKvmJR/zp1ZLCkev1CKxSe2hffamYpt0bA
	vv0r9/aFrbgWPkhUAI+PYz5va45yJT/8DEtq/QBgrToh3Uckv+GaUP69V/tCWYscO+3S5eeai/gW/
	bevFq5Bx5N5JXIL8kWxYJHfs/QQYNjd97uiApRoHE6m3h+C67lwEPfmhbjtYVL7iNh9hwZStN85jV
	fzZMsawuiqxZ0NNe0Y3wWQzALhSt1tMQVC628Pn/93VOdh/DkxOFS3F8Wt+7y7E1+8so+wKlyyenb
	jv5SFQ3Q==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:40466 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uRsMQ-00000003gWh-24NN;
	Wed, 18 Jun 2025 08:57:51 -0400
Date: Wed, 18 Jun 2025 08:57:46 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Jon Mason <jdmason@kudzu.us>
cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] if this meta-arm .inc file missing a trailing
 colon?
In-Reply-To: <CAPoiz9y+DE7ij-tMH--9zRzz++JQR5xdLYQ8Xt77EEpN7C52YQ@mail.gmail.com>
Message-ID: <8bae4cdc-de5b-6da6-80fe-9b247428bdeb@crashcourse.ca>
References: <339cab03-66a4-2b93-2964-6eee4eb057bc@crashcourse.ca> <CAPoiz9xd+n0on5FfkquhMLvU+LfDEr3p+T2YVCKgrPFEp1_TSQ@mail.gmail.com> <0f756c1f-1277-ce79-310c-82f013718128@crashcourse.ca>
 <CAPoiz9y+DE7ij-tMH--9zRzz++JQR5xdLYQ8Xt77EEpN7C52YQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1552197400-1750251471=:1620200"
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
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Jun 2025 12:57:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6572

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1552197400-1750251471=:1620200
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 18 Jun 2025, Jon Mason wrote:

> On Wed, Jun 18, 2025 at 8:41 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> > On Wed, 18 Jun 2025, Jon Mason wrote:
> >
> > > On Wed, Jun 18, 2025 at 6:07 AM Robert P. J. Day via
> > > lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
> > > wrote:
> > > >
> > > >
> > > > here:
> > > >
> > > > https://git.yoctoproject.org/meta-arm/tree/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-base.inc#n7
> > > >
> > > > should there not be a trailing ":" at the end of that prepend
> > > > operation?
> > >
> > > I think you are correct, and a quick grep shows 10 other instances of
> > > this in meta-arm.  Thanks for the heads up.
> > >
> > > I wonder if there is a way to add a check for prepend and
> > > FILESEXTRAPATHS in the sanity checkers.
> >
> >   i'm not sure where you counted 10 other instances but i did notice
> > the following, which confused me briefly: this appears to be an
> > example that is missing the trailing colon:
> >
> >   meta-arm/recipes-kernel/linux/arm-ffa-transport.inc:
> >     FILESEXTRAPATHS:prepend := "${ARMFILESPATHS}"
> >
> > except that the variable ARMFILESPATHS is defined to (you guessed it)
> > have a trailing colon.
> >
> >   aaarrrggghhh.
> >
> > i hate that sort of thing.
>
> Yes, this is what bit me.  I need another cup of coffee.  Thanks.
> I'll credit you in the committ.

  if it were me, i would redefine ARMFILESPATHS to not have that
trailing colon, then fix everything else to be compatible with that,
just for consistency and readability. but that is your call.

rday
--8323329-1552197400-1750251471=:1620200--

