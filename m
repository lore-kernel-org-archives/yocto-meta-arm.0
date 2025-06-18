Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A215C71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 14:06:57 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.8239.1750255613359122558
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 07:06:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=hh6HusIq;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wIiRlIhEl7nR6F0RdeAlVXPIIJ3IpiEG/N5co8pnyZU=; b=hh6HusIqngQN/XvuO1LvNFkkyF
	zTUerJeMqJgmSQdD+EjK3rkqLFm4yXt8tsun4HbGkq6pHQU6tvSgh5+2P2QoqVvEEl9OtmxlaST0J
	PdUpbn+AFdlaVkj7UP/in0af3dghtq62Xc0UUBUF3xvk1qOVK7X5iroPvGNYMO5zTtF0HRPrXmbD2
	k9OUu9qEZMaOtJUWRKa7UmtYmaYncenQLcrZ1zkJMCnn+lmC5m+YPJRbmAOWzMAwXIvyMcYKN1Kqz
	KwjJiNrktfwksBBvSPBTM0gu+gtwWb0lYyFXQ3NL8NHV72lSnqYs/EPOc+UULDySQImbWoGNIbqZj
	mUgcDTlQ==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:50006 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uRtRC-00000003rIY-3mup
	for meta-arm@lists.yoctoproject.org;
	Wed, 18 Jun 2025 10:06:51 -0400
Date: Wed, 18 Jun 2025 10:06:40 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: meta-arm@lists.yoctoproject.org
Subject: another meta-arm FILESEXTRAPATHS oddity
Message-ID: <25adc5c2-78ba-76e1-2cac-a77eba6b87e2@crashcourse.ca>
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
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Jun 2025 14:06:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6573


meta-arm-bsp/dynamic-layers/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-systemready-ir-acs-fvp-base.inc:
  FILESEXTRAPATHS:append := "${THISDIR}/files/${MACHINE}:"

"append"?

rday

