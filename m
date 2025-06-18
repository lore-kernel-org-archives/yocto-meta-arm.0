Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC88C7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 10:07:05 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.3756.1750241220446723456
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 03:07:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=CcHRNmxq;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SIE/NJiZfbk98xSlauXKFexwOLNOmZ8OXxS8EhWxFsM=; b=CcHRNmxqQ+hbcsH2vCx1R40Iov
	6fw6egUUGmgOKa4ZjaKq+FB6iDNJKirwwYoBcFaTehGhw9hJUvamjmtSbhY5tfe5yU8otq0p/pjmF
	r9N6lYIrywor2pk6QIW8nX5WfInNA4fOHIMhA0QG8Cy8kXC0ku37e/sJsKVoXfXgRYFLhsWcaClWo
	5Sfc7thqM8nwckAh+qBEsHWoPF1TVv0C4bMB+0lC2JS+OpzB4ggoQdkpDdRjL6dH/u/XF4F4fE8gR
	FQeA446iCSSE3R+0MnOlLCmZl0cvZaVbwSRUM0c6lzRv0SDy3S7Xy3HS5mZq39p2SRxERblNzj70D
	wCkrmOfQ==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:59466 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uRph0-00000003IfR-182b
	for meta-arm@lists.yoctoproject.org;
	Wed, 18 Jun 2025 06:06:58 -0400
Date: Wed, 18 Jun 2025 06:06:50 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: meta-arm@lists.yoctoproject.org
Subject: if this meta-arm .inc file missing a trailing colon?
Message-ID: <339cab03-66a4-2b93-2964-6eee4eb057bc@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Jun 2025 10:07:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6568


here:

https://git.yoctoproject.org/meta-arm/tree/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-base.inc#n7

should there not be a trailing ":" at the end of that prepend
operation?

rday

