Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3830CC28B2B
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 15:50:59 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.17103.1660665055819534783
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Aug 2022 08:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=n4vanczw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 879051C000A;
	Tue, 16 Aug 2022 15:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1660665053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=DqaJ3BFpL+mPUAjwPXIVyATlVUlK7PX2vHRPHlMy5xE=;
	b=n4vanczwVZKRob1j/U2gFzfoS1XbLVflgqYcLvviV5aQUY4VYOmThXmC9mM/DMaY8FZRxe
	7NddPES7kqDeg4UBTrrZzdJ2dyIuc67j7Hf0jWYUg0iekWTwIcUkoDze/pM9zIBFQlgA5z
	q7RR3+XURT2rQoV24hQSjvgMuO9H/fWDxs2kKVbjWJFuz856wWmQXgiJTcgAIcr7MjBk1C
	PW5FAK4yPEDCpoWVeuBaqmlOXT8+oaehl6m1Px5xMIuXi4F/RNtOmcpSg+eOuYd0zZ0pRf
	3i2Oy0X0i+eY8jChNqh5AlKFCa9EkFMAP89Fle+R2d9+JsGkbkZCUfx9osKI2A==
Date: Tue, 16 Aug 2022 17:50:53 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <ross.burton@arm.com>, Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org, swat@lists.yoctoproject.org
Subject: bitbake master fails to parse meta-gem5
Message-ID: <Yvu83XlD7F4CkgDi@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Aug 2022 15:50:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3698

Hello,

Since the change in how bitbake handle classes, meta-gem5 fails to
parse:

Parsing recipes...ERROR: ParseError at /home/pokybuild/yocto-worker/check-layer-nightly/build/meta-arm/meta-gem5/recipes-devtools/gem5/gem5-m5ops_20.bb:2: Could not inherit file classes/package.bbclass
ERROR: Parsing halted due to errors, see error messages above

https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/854/steps/13/logs/stdio


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

