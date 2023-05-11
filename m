Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D821C7EE22
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 14:20:16 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.60389.1683814813430429972
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 May 2023 07:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gu65GsMH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2A4221BF207;
	Thu, 11 May 2023 14:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683814811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=UDQ8IF8MJpvssEOKgFFGv+rqVUPOcRVtlZPDCFtL4Dw=;
	b=gu65GsMH1YdEVrIcGgBCuLXpbSvC7ahxWO3n5Z2oZhtmUiwckuXHs+JVku0yHdhZB0m6kp
	4Ks0EQOoAHwDsWXv6bj0B6GDMO+k3P5IvDhobdPJmPGngo+Yw86coR0XvJ76RcJR3JnAFP
	RBRhQI1o+HteMfe8P1AHs4GDv1Tu+/YWDzwp886FpMmyhlHmFp7ReLTpk+nDGcfhbHMoUJ
	jXPnHvaq8zhSxa4PIW8+bvvQGmZ3tw8bIpoSOGjKLawJ3Mp1r58oKOEB84k+VC79IXBUwc
	UKO82cbvhyCiVMGuW7rs/B9nORuFzFwVGD4IzDz6Ac1Nc86s7hvZ+N8d6HOtFg==
Date: Thu, 11 May 2023 16:20:10 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jon Mason <jon.mason@arm.com>, Ross Burton <ross.burton@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: meta-arm warnings
Message-ID: <202305111420108983fbcf@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 May 2023 14:20:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4640

Hello,

Since 57003af06d50 u-boot: Upgrade to 2023.04, we get those warnings on
the autobuilders:

stdio: WARNING: preferred version 2023.01 of u-boot not available (for item u-boot)
stdio: WARNING: versions of u-boot available: 1:2022.04 1:2022.10 1:2023.04

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

