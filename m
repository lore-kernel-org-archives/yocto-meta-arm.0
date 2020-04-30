Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.2713.1588277436525581707
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Apr 2020 13:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HzESVlVR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id 188so3449270wmc.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 Apr 2020 13:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=WcyTpHFzMNmqh6z7XuEt/L1FywPBIs5I5q+gClkfcQg=;
        b=HzESVlVRDNpdpASVJzvVsTOfur2UJyOUo/sKMvRwvt8dgNTEfKPxt+icK3CbU+dhjX
         QsFpH4DzpYxRgPjaldtv+a/QG/jSoUPYYgRAM0bV3IIOX6E1XUEtA9rHEJEd0zowPT47
         Ml8b+AZdVh6SN8vSYt+q6oL1ACYpu7gnrw7WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=WcyTpHFzMNmqh6z7XuEt/L1FywPBIs5I5q+gClkfcQg=;
        b=bPQt0jGVJFumXtzD6mP/m/acIg2r5exnRFXckWUNfh3kkcJ/NbpHx903FpGJSzG37s
         FhdKkBxIfmcR/mrUSLnejBfno6qn9a0thGScPaVBR5QcJ1fFlcbT1oQtiRz2FCcga81p
         WRLpnKr6brXIY/+XCtzCviUb00v5wbQFolURbJpqJGKRXC5/mzWzuJ655exRbu2nsmj5
         wHzoHuowjQ24+DZXy1QScisb9BLsbjXY5uIfP2YNl9tv+4O9FoZVBK9YU3nsAh1mrQ8F
         T0aVGPbBWISmiqoNaMQtzwW5v3qQtP2Jn8f0fTMUF0CB1dKy9ibnPk7mpX/ojOdV3/PH
         HZQw==
X-Gm-Message-State: AGi0PuYsc15aG73B5PTIiRkgb2ZKPPQRWK/ZA2+v8MnyUU0FQd2me5gv
	vGP+h9cNWJKhiZoUD5FJLJxxh3wkotE=
X-Google-Smtp-Source: APiQypK3Kz7VtWx8GSEQo/EOc3jHPXglT6MUpMzjhhBr4Z5kkDj7/gh5MRATElnML7dOksDDRdYSXQ==
X-Received: by 2002:a1c:bc08:: with SMTP id m8mr273357wmf.119.1588277434547;
        Thu, 30 Apr 2020 13:10:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id g15sm1091053wrp.96.2020.04.30.13.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 13:10:33 -0700 (PDT)
Message-ID: <8de32e0cb92a562b63e909843483a4f240fff47c.camel@linuxfoundation.org>
Subject: Re: [meta-arm] [PATCH] meta-arm-bsp: add dunfell compatibility to fvps and juno
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: meta-arm@lists.yoctoproject.org
Cc: nd <nd@arm.com>
Date: Thu, 30 Apr 2020 21:10:32 +0100
In-Reply-To: <DE5203D4-E002-4858-9FE4-C28BFAF1DFEE@arm.com>
References: <20200430081700.548-1-vineeth.raveendran@arm.com>
	 <866cdd55986bc7fb389efe17d872889df325372b.camel@linuxfoundation.org>
	 <DE5203D4-E002-4858-9FE4-C28BFAF1DFEE@arm.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2020-04-30 at 14:22 +0000, Bertrand Marquis wrote:
> On 30 Apr 2020, at 10:06, Richard Purdie via lists.yoctoproject.org
> > <richard.purdie=linuxfoundation.org@lists.yoctoproject.org> wrote:
> > 
> > On Thu, 2020-04-30 at 09:17 +0100, Vineeth Raveendran wrote:
> > > LAYERDEPENDS_meta-arm-bsp = "core openembedded-layer meta-arm"
> > > LAYERSERIES_COMPAT_meta-arm-bsp = "warrior zeus dunfell"
> > > +
> > > +# Place holder for yocto version compatibility
> > > +OVERRIDES_append = ":${LAYERSERIES_CORENAMES}"
> > 
> > Generally we've advised different branches to make it clear to
> > people
> > which layers are compatible with which releases. I appreciate its
> > "easier" to have one layer fits all to maintain, I'm less sure its
> > clear for users.
> 
> We have internal needs to keep zeus compatibility and as the amount
> of conflict is reduced we decided to keep dunfell branch compatible
> with Zeus.
> From the external user point of view this will still be in dunfell
> branch and officially to be used with dunfell, we don’t plan to make
> any “publicity” of it.
> 
> Zeus compatibility will be remove from master once we will create the
> Dunfell branch (Jon Mason should give more info on this shortly).
> 
> > Whilst I can see why you want to do add to overrides like this, I'm
> > not
> > sure its a great idea. This will affect every layer in the combined
> > stack, not just yours. OVERRIDES are fairly dangerous things and
> > need
> > careful namespacing. Our release names are designed to be
> > distinctive
> > but after bad experiences we generally recommend additional
> > overrides
> > be carefully namespaced, e.g. "class-XXXX", "pn-XXXX" since we know
> > what weird issues these can cause.
> 
> I agree with that and we will modify the patch to get rid of the
> override and use something like:
> RDEPENDS_${PN} += "${@bb.utils.contains('LAYERSERIES_CORENAMES',
> 'zeus', ‘zeus-solution', ‘dunfell-solution', d)}"

This looks better, I'd probably pick something specific to your layer
like "meta-arm-zeus" but the general idea and filtering is much better.

> > Anyhow, there is a bug here since LAYERSERIES_CORENAMES can have
> > multiple values, the clue being the plural name, e.g. it did here
> > for a
> > while:
> > 
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/conf/layer.conf?id=8702b79a3b90a06524098e8b2a10b6e6d287166a
> 
> Thanks for the pointer :-)
> The bb.utils.contains solution should also solve this case that we
> did not see before.

Yes, looks much better!

Cheers,

Richard

