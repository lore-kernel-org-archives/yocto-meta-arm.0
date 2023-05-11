Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E9DC77B7C
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 18:07:57 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3716.1683828471025013936
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 May 2023 11:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9E37F40C98
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 May 2023 18:07:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VXMLeQaSDo7R for <meta-arm@lists.yoctoproject.org>;
	Thu, 11 May 2023 18:07:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 890BB40C93
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 May 2023 18:07:49 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id EB60D1638CA; Thu, 11 May 2023 14:07:05 -0400 (EDT)
Date: Thu, 11 May 2023 14:07:05 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Subject: trusted-services in meta-arm depend on meta-python from
 meta-openembedded
Message-ID: <20230511180705.GB9226@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 May 2023 18:07:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4643

Jon, Ross,

FYI, meta-arm layer doesn't (and shouldn't) have dependency on meta-python 
from meta-openembedded, yet:

ERROR: Nothing PROVIDES 'python3-protobuf-native' (but 
/OE/poky-ti-master/meta-arm/meta-arm/recipes-security/trusted-services/ts-uefi-test_git.bb, 
/OE/poky-ti-master/meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-se-proxy_git.bb, 
/OE/poky-ti-master/meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-crypto_git.bb, 
/OE/poky-ti-master/meta-arm/meta-arm/recipes-security/trusted-services/ts-service-test_git.bb 
DEPENDS on or otherwise requires it).

For OPTEE back in the day we worked on moving required python modules into 
OE-Core...

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

