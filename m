Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.743.1591400704297796866
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Jun 2020 16:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 878F140BCC;
	Fri,  5 Jun 2020 23:45:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mL8qxyMA0PJd; Fri,  5 Jun 2020 23:45:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 58C7640AD5;
	Fri,  5 Jun 2020 23:44:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B6698173217; Fri,  5 Jun 2020 19:44:54 -0400 (EDT)
Date: Fri, 5 Jun 2020 19:44:54 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Jon Mason <jdmason@kudzu.us>, Joshua Watt <jpewhacker@gmail.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm][PATCH] meta-arm: Remove meta-python dependency
Message-ID: <20200605234454.GQ17660@denix.org>
References: <20200529151427.20272-1-JPEWhacker@gmail.com>
 <90DD68A5-0834-4C82-8A06-BC3972756CA3@arm.com>
 <6d6ccf5c-f134-1a15-e5eb-8f5e10d03832@gmail.com>
 <09986319-6338-471F-A0C1-5096F5ED7AA3@arm.com>
 <CAJdd5Gag=0HF8+5KiF0DoLG1WZs+0ngbnT7G8CS1dFa=ydqjoQ@mail.gmail.com>
 <20200601213141.GA31505@kudzu.us>
 <a6576f43-1722-3f32-dbd0-3d4ad0dd346f@gmail.com>
 <20200601225610.GD31505@kudzu.us>
 <CAP71WjxbYKYduu1hsTrFdwKRVKeEmfAK5_6aGjc-k44fhi540w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjxbYKYduu1hsTrFdwKRVKeEmfAK5_6aGjc-k44fhi540w@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2020 at 08:10:04AM +0200, Nicolas Dechesne wrote:
> hey Jon,
> 
> > > Hmm, that's really unfortunate. That makes me think this layer is not
> > > actually intended to be a centralized location for ARM related things,
> > and
> > > I'm probably not going to try and consolidate things from other layers
> > here
> > > anymore. Not having a master branch that can be used with the master
> > branch
> > > of OE-core really eliminates the possibility for me to use a BSP layer
> > like
> > > e.g. meta-rockchip for upstream development and testing if that BSP layer
> > > depends on meta-arm and meta-arm is perpetually stuck on the last
> > release.
> >
> > I'm in no way saying that meta-arm master should not work with
> > upstream master.  I'm saying that we want to keep compatability with
> > the previous release so that we can cut stable releases for customers.
> >
> 
> I have been very supportive about meta-arm as the central location for ARM
> pieces, and still believe it's the right thing to do. But like Joshua, I
> find this discussion a bit disappointing. A layer is a "social contract"
> between the community behind this layer, and the rest of the OE/YP
> community. Refusing proper and meaningful community patches in master
> because it doesn't some 'internal' needs doesn't feel right.
> 
> 
> > We have a requirement to release BSP SW based on YP.  Just like I
> > would expect other vendors/people who want to use meta-arm.  So, there
> > are a few ways we can approach this issue.
> >
> > 1.  Merge patches onto dunfell branch
> > 2.  A development branch based on dunfell
> > 3.  Use master meta-arm-bsp and dunfell branches for meta-arm and
> > meta-arm-toolchain
> > 4.  Keep master compatible with dunfell
> >
> 
> I think the mistake we made (I am saying we, since I was involved in that
> discussion) is to have a single tree that includes both the 'community'
> content that the ARM ecosystem wants to depend on and the specific ARM
> "products" that are needed by very few specific people (e.g. your BSP
> product).
> 
> I think #3 is the most sensible choice, e.g. you need to split meta-arm
> into 'community' pieces (I think that would correspond to meta-arm and
> meta-arm-toolchain layers) and your product pieces. When we build your
> product with OE, you would reply on the 'community' meta-arm, and if any
> hack or custom integration is needed, then you can do that in your product
> tree. You might even overlay things for some time there, it's fine for a
> product layer. Of course you will need to worry about doing the 'proper'
> fix into the community meta-arm at some point. But if you don't commit to
> maintaining a layer for the ARM community, the risk is that everyone will
> start forking meta-arm recipes, which is not what we want.

After giving it some thought for couple days, I tend to agree with Nico that 
it may be better off to split out meta-arm-bsp away from the rest of meta-arm 
repository to allow it to make releases against any YP versions and branches.


> > One is simple, we actually do our development on the dunfell branch.
> > However, this breaks it from being a stable branch.  So, this is a
> > non-starter
> 
> 
> > Two is still simple, we do all of our internal development on a second
> > dunfell branch ("dunfell-dev") and make any releases we have off of
> > that.  The problem with this is the integration and testing.  If there
> > are multiple branches to test, can we expect developers to test every
> > combination?  Also, there might be a need for different versions of
> > the patches depending on how much master and dunfell-dev diverge.
> >
> 
> That is an alternate variant of splitting the trees.. doing your 'product'
> in a product branch, and keep the expected branches (dunfell, master, ...)
> as community branches. It really depends if meta-arm-bsp is really expected
> to be a community thing ever, or if it's your product only. In which case
> it might be more appropriate to split it apart.
> 
> 
> >
> > Three is more complex.  Since only meta-arm-bsp needs releases, we can
> > simply let that one float and fix the others on the stable branches.
> > The problem with this is that we are currently needing to add recipes
> > for things into meta-arm that others might need (like SCP, EDK2, etc).
> > So, this will work once we have more stability in meta-arm, but right
> > now we are adding too much stuff to make it viable for the next
> > release.
> >
> > Four is simple, we keep compatability with dunfell and make the
> > releases off of that.  The potential hazard with this is if something
> > in YP master requires that compatability to be broken.
> 
> 
> > I presonally would like #4, because it is simple.  However, if this
> > will prevent others from using meta-arm, then let's have a discussion
> > on it.  Perhaps I am not understanding something fundamental.
> >
> 
> But the whole discussion started because you said you needed to keep master
> compatible with dunfell. Even though as you said, it might fail eventually.
