Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.3615.1580246413142408681
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 28 Jan 2020 13:20:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 70CBD40BCC;
	Tue, 28 Jan 2020 21:20:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c0DnY4kQuHzo; Tue, 28 Jan 2020 21:20:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AA738409E7;
	Tue, 28 Jan 2020 21:20:07 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CDFB81743C2; Tue, 28 Jan 2020 16:20:06 -0500 (EST)
Date: Tue, 28 Jan 2020 16:20:06 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Sumit Garg <sumit.garg@linaro.org>, jon.mason@arm.com,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: Re: [meta-arm] [PATCH] Import ARM GNU-A toolset recipes from meta-linaro
Message-ID: <20200128212006.GM4735@denix.org>
References: <1580124007-23324-1-git-send-email-sumit.garg@linaro.org>
 <20200128045355.GK4735@denix.org>
 <CAPoiz9zvPps4ZfkgOwFKEKcKUCdbAov5x9F4+GNfgQ1v5r5YhA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPoiz9zvPps4ZfkgOwFKEKcKUCdbAov5x9F4+GNfgQ1v5r5YhA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 28, 2020 at 04:06:17PM -0500, Jon Mason wrote:
> On Mon, Jan 27, 2020 at 11:54 PM Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > On Mon, Jan 27, 2020 at 04:50:07PM +0530, Sumit Garg wrote:
> > > Add a new meta-arm-toolchain layer to hold ARM GNU-A toolset recipes
> > > imported from meta-linaro tree, branch: master and commit ID:
> > > 504ca3b217c9602b10eda0ec8a9f1055b59e482f.
> > >
> > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> >
> > It's an exact copy of what's currently in meta-linaro-toolchain, but I still
> > decided to test it - I applied this patch to meta-arm and reconfigured my
> > setup by replacing meta-linaro-toolchain with the new meta-arm-toolchain and
> > ran few builds that use external-arm-toolchain and gcc-arm recipes:
> >
> > Tested-by: Denys Dmytriyenko <denys@ti.com>
> 
> Thank you for the patch, Sumit, and for testing, Denys.  It is now
> included in meta-arm, see
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/?id=c0a59f3d94c633d6c902e7bd436690bc890bbc40

Thank you, Jon!

Now I only need OP-TEE recipes migrated (Nico?) - I wonder if meta-optee 
sublayer is required like it's in meta-linaro/meta-optee[1], or just adding 
them into main meta-arm sublayer would be fine?

[1] https://git.linaro.org/openembedded/meta-linaro.git/tree/

-- 
Denys
