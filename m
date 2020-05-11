Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1843.1589218653195166816
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 May 2020 10:37:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 383CE40C0F;
	Mon, 11 May 2020 17:37:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TL5ldUC1E1Y7; Mon, 11 May 2020 17:37:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1D1E940A46;
	Mon, 11 May 2020 17:37:30 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AF254173134; Mon, 11 May 2020 13:37:30 -0400 (EDT)
Date: Mon, 11 May 2020 13:37:30 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] Sharing TF-A with multiple BSP
Message-ID: <20200511173730.GI11927@denix.org>
References: <2fb20adc-6d54-fefc-dfe7-007ee02fc01d@gmail.com>
MIME-Version: 1.0
In-Reply-To: <2fb20adc-6d54-fefc-dfe7-007ee02fc01d@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 11, 2020 at 09:47:49AM -0500, Joshua Watt wrote:
> Continuing the outcome from a discussion that was on the OE-core
> mailing list, I've started converting some of the BSP layers I work
> on to use the trusted-firmware-a recipe from meta-arm as the
> canonical source of ATF instead of each of the implementing their
> own recipe. So far this has gone well except for one annoyance I've
> found: meta-arm has a layer dependency on meta-python, specifically
> for the optee recipe. Normally, this wouldn't be such a big deal,
> but in a ideal world there will now be a lot of BSP layers that
> depend on meta-arm to provide ATF, and it seems annoying to have to
> make all of those layers (transitively) depend on meta-python.

Yeah, I raised this issue over a month ago - unfortunately, nobody replied 
or acknowledged...


> I can think of a few possible options:
> 
> 1) Do nothing because no one other than me thinks this is a problem :)

Don't flatter yourself... :) :D J/k


> 2) Use BBFILES_DYNAMIC to make optee optional based on the presence
> of meta-python
> 
> 3) Use PACKAGECONFIG to remove the python parts of optee (if that's
> even possible). They can be automatically added back if meta-python
> is present via BBFILES_DYNAMIC.

I don't think those are optional - they are used during the build to 
sign some parts. And also for ELF manipulations.


> 4) Remove the hard requirement of meta-python from meta-arm; it's
> only needed to build optee so the users can figure it out?
> 
> 
> Anyone else have any ideas or thoughts?

I can think of couple more options:

5) there are only 3 python modules needed - pycrypto, pycryptodomex (actually 
a replacement for pycrypto, so upstream can drop first one) and pyelftools. 
Could probably try to make a case of moving them to OE-Core?

6) Like optee was inside own sub-layer meta-optee within meta-linaro, can look 
into separating it into meta-optee within meta-arm.


> Thanks,
> Joshua Watt
> 

> 

