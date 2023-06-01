Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 596B7C77B7E
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 22:30:55 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.557.1685658647751955207
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 01 Jun 2023 15:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZCRRa/Wa;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685658645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=00U7AbH2hFJm2Jp16Gr67MohKT5nAo+nK+tccMYSznE=;
	b=ZCRRa/Wanyyd4Ug1bQ8gBHRB6BkrQPxIZOeFxwdaUakTGp3a9cl7m0vMfGr3dPhHLy3b19
	6chlersAbkt602uzVdGqLMhpGrngCALoG3HB4ImcY779AodGx88EQnM4M50Ilk6FsJtxTE
	if1dwWu1L3pEadUEXi/6G76zHHdWBIZlK8FpD1Rs5cT9DMYXzkxzrQicDUzanDD/1EHk8v
	iH4yn+WjYaSTaW3KemrIp+Uxt4p1qgjlWcz6lowkQZtRQvGMtvBVKhG4pVD2pCloIepTHW
	HT0C4Q5zggBSkQlMkpoTuq4cnl2Qf71VNh1xagN5vgpvAXp+DZ/nx2V7WorjVQ==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 83820FF803;
	Thu,  1 Jun 2023 22:30:45 +0000 (UTC)
Date: Fri, 2 Jun 2023 00:30:45 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jon Mason <jon.mason@arm.com>, Ross Burton <ross.burton@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: meta-arm AB failure
Message-ID: <2023060122304545937f85@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 01 Jun 2023 22:30:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4718

Hello,

Since the gcc-13 upgrade, meta-arm is failing on the autobuilders when
building gcc-plugins for the kernel:

https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/4067/steps/13/logs/stdio

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

