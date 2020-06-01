Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.50234.1591052173541853421
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Jun 2020 15:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=USz9xRM3;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f193.google.com with SMTP id c12so10746295qkk.13
        for <meta-arm@lists.yoctoproject.org>; Mon, 01 Jun 2020 15:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ky7sesMdhuUhu3ibggJLHnsRkhY0BIw/ZyoTV3i8Q2M=;
        b=USz9xRM3dW3S+89S+pDEQH8UZdQ6iGqeCrxUTR9KGCpD1EHa2/JQvntpI5TbjLaFfv
         3DmA0WOqElE23Bt2rL65wbqkuTmyimkfluAgjAW6CJEsgonMdOIR3l7qeBbkEDFth8Il
         Yje0yXmWeZxiggH4bUzbUu7XyhLG+KVpW4lufnVW8sfUr4jaOMzZ5Ofx88iEqAMWl3Hw
         ufqqxtMY4wkySbpRVITHknMCl6upnxUmIjJXYZB1LFyl3FpCw6tu0HznUDnLHfja2Qh+
         APOHZATt+edE+fhUgBBMitQSFX8/mRzuFotIIO+ljr6B+AIzK8Wc7gnJekkFeUJ+PgF8
         N0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ky7sesMdhuUhu3ibggJLHnsRkhY0BIw/ZyoTV3i8Q2M=;
        b=Cm9mSPhWWJeMzQaUjwgMX/jx4k/tZ+JiIYJBz28iTBvjvYBZVFoQ5PqIpIjlhHv5U5
         4P3pzCtcp8tvS2OdeykZ6y60Xrvsn/VwXYl7A85qnRlNLVaJr6+ydNaqriqQ4wHnh7uj
         V2/nv/3J2O6LT9YzVS09DMWL6TIuXZsS8Gnjhv52f+CI1STUbZ8IO1S5NKSO8S0sZ4SX
         EMPRbG7q6tB2KbpVxT8+cMlEFnqiklyGWWo81v8jgpc/rVoueDNI7emsQ6aLxHQC0QWO
         m2XxoN29vp1foayu8owa89EqlJOKaBrqi1YEXIF9De2cuYGG+ygEHF/W2FjoITngjlWx
         C30w==
X-Gm-Message-State: AOAM533Ab1vXfFeA7n/E1SnhYk5NgwTwjlqB5Pv3xg41TY2zZQ4M/mnF
	ldJ/mgNwvMX06VKjZaefWbFsAQ==
X-Google-Smtp-Source: ABdhPJyjlutT+TrWmUbCu3FdvpDb7djitCAX2HdJdqNAj/0bFN6EyrtynxkqJ/Io1plYrq90T4RVbw==
X-Received: by 2002:a05:620a:534:: with SMTP id h20mr22536795qkh.293.1591052172532;
        Mon, 01 Jun 2020 15:56:12 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:40d9:962b:46e7:a335])
        by smtp.gmail.com with ESMTPSA id b185sm669854qkg.86.2020.06.01.15.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 15:56:12 -0700 (PDT)
Date: Mon, 1 Jun 2020 18:56:10 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm][PATCH] meta-arm: Remove meta-python dependency
Message-ID: <20200601225610.GD31505@kudzu.us>
References: <20200529151427.20272-1-JPEWhacker@gmail.com>
 <90DD68A5-0834-4C82-8A06-BC3972756CA3@arm.com>
 <6d6ccf5c-f134-1a15-e5eb-8f5e10d03832@gmail.com>
 <09986319-6338-471F-A0C1-5096F5ED7AA3@arm.com>
 <CAJdd5Gag=0HF8+5KiF0DoLG1WZs+0ngbnT7G8CS1dFa=ydqjoQ@mail.gmail.com>
 <20200601213141.GA31505@kudzu.us>
 <a6576f43-1722-3f32-dbd0-3d4ad0dd346f@gmail.com>
MIME-Version: 1.0
In-Reply-To: <a6576f43-1722-3f32-dbd0-3d4ad0dd346f@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 01, 2020 at 04:55:24PM -0500, Joshua Watt wrote:
> 
> On 6/1/20 4:31 PM, Jon Mason wrote:
> > On Sat, May 30, 2020 at 01:39:49PM -0500, Joshua Watt wrote:
> > > On Fri, May 29, 2020, 10:37 AM Bertrand Marquis <Bertrand.Marquis@arm.com>
> > > wrote:
> > > 
> > > > 
> > > > > On 29 May 2020, at 16:32, Joshua Watt <JPEWhacker@gmail.com> wrote:
> > > > > 
> > > > > 
> > > > > On 5/29/20 10:21 AM, Bertrand Marquis wrote:
> > > > > > > On 29 May 2020, at 16:14, Joshua Watt via lists.yoctoproject.org
> > > > <JPEWhacker=gmail.com@lists.yoctoproject.org> wrote:
> > > > > > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > > > > > ---
> > > > > > > meta-arm/conf/layer.conf | 3 +--
> > > > > > > 1 file changed, 1 insertion(+), 2 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> > > > > > > index d96e9f1..1c241d4 100644
> > > > > > > --- a/meta-arm/conf/layer.conf
> > > > > > > +++ b/meta-arm/conf/layer.conf
> > > > > > > @@ -11,6 +11,5 @@ BBFILE_PRIORITY_meta-arm = "6"
> > > > > > > 
> > > > > > > LAYERDEPENDS_meta-arm = " \
> > > > > > >      core \
> > > > > > > -    meta-python \
> > > > > > > "
> > > > > > > -LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
> > > > > > > +LAYERSERIES_COMPAT_meta-arm = "gatesgarth"
> > > > > > Could you explain why you want to remove dunfell compatibility ?
> > > > > dunfell doesn't have the required python recipes in oe-core, so it isn't
> > > > compatible with it anymore.
> > > > 
> > > > Nothing has been tested or is compatible with gatesgarth right now so this
> > > > change will really have a breaking impact.
> > > > 
> > > Right, you certainly wouldn't want to backport it to the dunfell branch;
> > > this is just for master where the next release would be gatesgarth anyway.
> > > 
> > > Also, with the qemu support I added, I think we have reasonable testing
> > > coverage on meta-arm, and in particular enough to have high confidence in
> > > this change.
> > > 
> > > Finally, FWIW, upstream oe-core and meta-python have already made these
> > > changes on their master branches, so it seems like we wouldn't want a
> > > useless dependency on meta-python in meta-arm, *especially* if the idea is
> > > to get other bsp layers to depend on meta-arm to consolidate things like
> > > TF-A and optee.
> > We currently have a requirement for dunfell compatability on the
> > meta-arm master branch for Arm's BSP software releases (which will
> > be YP based going forward).  To make a stable release for our
> > customers, we need to draw a line between stablity of our dependent
> > layers and the latest code in the meta-arm layer.  This especially
> > relates to the BSPs Arm will be adding to meta-arm-bsp in this
> > release.
> > 
> > We do not have to keep dunfell support in master after the release of
> > gatesgarth, but we will need it until then.  So, please stash this
> > patch until October (which will be here sooner than you think).
> 
> Hmm, that's really unfortunate. That makes me think this layer is not
> actually intended to be a centralized location for ARM related things, and
> I'm probably not going to try and consolidate things from other layers here
> anymore. Not having a master branch that can be used with the master branch
> of OE-core really eliminates the possibility for me to use a BSP layer like
> e.g. meta-rockchip for upstream development and testing if that BSP layer
> depends on meta-arm and meta-arm is perpetually stuck on the last release.

I'm in no way saying that meta-arm master should not work with
upstream master.  I'm saying that we want to keep compatability with
the previous release so that we can cut stable releases for customers.

We have a requirement to release BSP SW based on YP.  Just like I
would expect other vendors/people who want to use meta-arm.  So, there
are a few ways we can approach this issue.

1.  Merge patches onto dunfell branch
2.  A development branch based on dunfell
3.  Use master meta-arm-bsp and dunfell branches for meta-arm and
meta-arm-toolchain
4.  Keep master compatible with dunfell

One is simple, we actually do our development on the dunfell branch.
However, this breaks it from being a stable branch.  So, this is a
non-starter

Two is still simple, we do all of our internal development on a second
dunfell branch ("dunfell-dev") and make any releases we have off of
that.  The problem with this is the integration and testing.  If there
are multiple branches to test, can we expect developers to test every
combination?  Also, there might be a need for different versions of
the patches depending on how much master and dunfell-dev diverge.

Three is more complex.  Since only meta-arm-bsp needs releases, we can
simply let that one float and fix the others on the stable branches.
The problem with this is that we are currently needing to add recipes
for things into meta-arm that others might need (like SCP, EDK2, etc).
So, this will work once we have more stability in meta-arm, but right
now we are adding too much stuff to make it viable for the next
release.

Four is simple, we keep compatability with dunfell and make the
releases off of that.  The potential hazard with this is if something
in YP master requires that compatability to be broken.

I presonally would like #4, because it is simple.  However, if this
will prevent others from using meta-arm, then let's have a discussion
on it.  Perhaps I am not understanding something fundamental.

Thanks,
Jon

> 
> 
> > 
> > Thanks,
> > Jon
> > 
> > 
> > > 
> > > > Bertrand
> > > > 
> > > > > 
> > > > > > Bertrand
> > > > > > 
> > > > > > > --
> > > > > > > 2.17.1
> > > > > > > 
> > > > > > > 
> > > > 
> > > 
