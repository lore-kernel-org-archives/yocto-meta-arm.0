Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.13144.1591936207473606904
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 21:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D43B840C37;
	Fri, 12 Jun 2020 04:30:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v_BrwgYIA3wi; Fri, 12 Jun 2020 04:30:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BB4A240A46;
	Fri, 12 Jun 2020 04:30:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DD6E9173217; Fri, 12 Jun 2020 00:30:00 -0400 (EDT)
Date: Fri, 12 Jun 2020 00:30:00 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Paul Barker <pbarker@konsulko.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] External toolchain support
Message-ID: <20200612043000.GK17660@denix.org>
References: <CAM9ZRVsJ8msdRBYHPg9D2ZytQox5yNCqjqvjcb9W-9bE3yHSug@mail.gmail.com>
 <20200611020138.GZ17660@denix.org>
 <CAM9ZRVsT0nuMen2zC_L=+nadg5w0=xj2m8Tp7GR1xL-txzhbjQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVsT0nuMen2zC_L=+nadg5w0=xj2m8Tp7GR1xL-txzhbjQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2020 at 10:27:50AM +0100, Paul Barker wrote:
> On Thu, 11 Jun 2020 at 03:01, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > All,
> 
> Denys,
> 
> Thanks for the context here, it's really valuable to understand how
> things have developed. I'd prefer that things improve slowly than that
> we have a breaking fork.

Thank your for understanding!


> Can we identify which of the proposed changes can be made with low
> risk? I think fixing the readme and licensing at least should be
> straightforward.

I guess those can be considered low-impact.


> I'll look at the archiver support myself and see if I can find a
> solution for that.

That would be nice, thanks

-- 
Denys
