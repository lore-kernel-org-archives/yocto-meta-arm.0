Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.11569.1619897991927196268
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 01 May 2021 12:39:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EB77A40BEC;
	Sat,  1 May 2021 19:39:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uRRbbvCfQGYg; Sat,  1 May 2021 19:39:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CAB67400CF;
	Sat,  1 May 2021 19:39:49 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9F4BB1745D3; Sat,  1 May 2021 15:39:47 -0400 (EDT)
Date: Sat, 1 May 2021 15:39:47 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] meta-arm hardknott release
Message-ID: <20210501193947.GF15937@denix.org>
References: <20210501192641.GA20675@kudzu.us>
MIME-Version: 1.0
In-Reply-To: <20210501192641.GA20675@kudzu.us>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 01, 2021 at 03:26:41PM -0400, Jon Mason wrote:
> meta-arm has released the hardknott support branch.  The branch was
> forked on Friday, 32 April from the master branch and was tagged as

Friday, 32 April? :)


> "3.3" yesterday.  The tag is GPG signed and my public key can be
> provided if someone wants to use it to verify.  Per the previous public
> discussion on this list, hardknott will only be taking bug fixes and be
> passively maintained (with dunfell being the actively supported LTS).
> 
> Per an external request, we have duplicated all existing "numbers only"
> tags (i.e., 3.3) with a "yocto-x.y.z" tag (i.e., yocto-3.3).
> 
> Thanks,
> Jon

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
