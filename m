Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.2449.1587855448941332510
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 25 Apr 2020 15:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F1CC340BF3
	for <meta-arm@lists.yoctoproject.org>; Sat, 25 Apr 2020 22:57:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ttR9GPCJa6gU for <meta-arm@lists.yoctoproject.org>;
	Sat, 25 Apr 2020 22:57:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DEEB140AD5
	for <meta-arm@lists.yoctoproject.org>; Sat, 25 Apr 2020 22:57:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 485E5172A05; Sat, 25 Apr 2020 18:57:27 -0400 (EDT)
Date: Sat, 25 Apr 2020 18:57:27 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Subject: Couple questions about Dunfell
Message-ID: <20200425225727.GL11927@denix.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi, Jon,

I had couple questions:

1. What is the time frame for branching off Dunfell?

2. What is the policy for backporting to Dunfell?

I've got several patches in the pipeline that I'm testing and wanted to know 
my options.

Thanks.

-- 
Denys
