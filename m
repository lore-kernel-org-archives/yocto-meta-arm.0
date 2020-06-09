Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.6876.1591708538862577805
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Jun 2020 06:15:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Hy9wbUVw;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f193.google.com with SMTP id w90so17466952qtd.8
        for <meta-arm@lists.yoctoproject.org>; Tue, 09 Jun 2020 06:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=dUu9S8X+g+GD8m9v/3KSUu8MA5I6aLvGqQ+UeQpdJus=;
        b=Hy9wbUVwoAcY7AmyAOG8RXtWQtbit7eVKol94Dmn2sSssfPWy3pHWmCjNmPc/nQgKU
         shdVa/uFAyD1eDk98MVN3Qtui8HM5FYO7aUyi7iCd+eg66O1z9NLOV78rajU9mxAFh1L
         G9MMLbbP3pmsfCNCX9vxyxfd/a94DLDbRK+tZxQw5NlONp/YoIs3pkwL/6P2VMDiv0Fa
         I5IwDecS7q/Y97RlfzTeqK5nBGPk83Ztq4kZaq56kg24SYHB2AEFG4lexx2yLg+5QPIg
         nJpr/QhQEp9Vk7Ja58VNvHFwjIkj5qFELKJRyGZ+sy0ZnEK6REY6dmTbUZpGyR8JSbXO
         ZCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=dUu9S8X+g+GD8m9v/3KSUu8MA5I6aLvGqQ+UeQpdJus=;
        b=QdQoBMPSQ08Mfvp8WQZLbzKmmU/t7jjiqsx0ZWv/EI4L0MxSgR1ITFsXsG3wV2JPTe
         8hxUCtRMD/6kYiMxeGBoo1pSzjN/LM2cucDpRByY2dvqxYd42eJeTq+hDA8ymSm+kTJD
         MUFoAYXv6r8q9RMNSU3FsXF/eHMtoPSis1W77KUUbl0/uf8qHv/aVkdkw39pAwz54kOZ
         p4o5Hoi+65L8sun7cC5xu9UZVxI2Wi/lbj085cSI29WHeGsBK0FltfT2a9P/u1VQ++g7
         IqUY3VMXmFOUNE8YHXoXnPbUlW8JjQic1+jKG/sdzLgW539bQxGFBI06nb/RKdGtwpTC
         Fqvg==
X-Gm-Message-State: AOAM531cjLgwypL3zgLhhySKJsP0v5ivqrRfGm9vyeNGLWw6zFNInAWW
	9zBAzZxXGPOAdwnAVhLz9OdKLg==
X-Google-Smtp-Source: ABdhPJyFutmOvxyAg0evaSl9NXva3zYlBsEdBOHiNiZ9/P2FnKQy0i7KD9wy0EuZWsmOOf3PpzSeEA==
X-Received: by 2002:ac8:4790:: with SMTP id k16mr6730993qtq.362.1591708537849;
        Tue, 09 Jun 2020 06:15:37 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:b1ac:3163:6706:8297])
        by smtp.gmail.com with ESMTPSA id f43sm11399067qte.58.2020.06.09.06.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 06:15:37 -0700 (PDT)
Date: Tue, 9 Jun 2020 09:15:35 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Jon Mason <jon.mason@arm.com>, meta-arm@lists.yoctoproject.org,
	nd <nd@arm.com>
Subject: Re: [meta-arm] Proposal for the branching policy of meta-arm
Message-ID: <20200609131535.GA28661@kudzu.us>
References: <e1b8af76-856d-0202-da80-5bf464f61fdb@arm.com>
 <CAP71WjxcnNdvXx1BCDLC5nT2zFVrrXYB_9vBKpmWkQ9L0eGPmg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjxcnNdvXx1BCDLC5nT2zFVrrXYB_9vBKpmWkQ9L0eGPmg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jun 09, 2020 at 10:52:02AM +0200, Nicolas Dechesne wrote:
> On Fri, Jun 5, 2020 at 8:38 PM Jon Mason <jon.mason@arm.com> wrote:
> 
> > Problem
> >
> > The Yocto Project releases twice a year (April and October): "stable"
> > releases are made every six months and have a lifetime of seven months
> > to allow for migration, while "long term support" (LTS) releases are
> > picked every two years starting from Dunfell in April 2020. The standard
> > practice for all Yocto Compatible layers is to create a "named" branch
> > consistent with the code name of that release.   For example, the
> > “dunfell” release of Yocto will have a branch named “dunfell” in the
> > official git repository, and layers compatible with dunfell will have a
> > branch named “dunfell”.  Thus, a customer can easily organise a
> > collection of appropriate layers to make a product.
> >
> > In Yocto, these named branches are “stable”, and only take bug fixes or
> > security-critical upgrades.  Active development occurs on the master
> > branch.  However, this methodology can be problematic if mimicked with
> > the compatible layers.  Companies or open source projects may not wish
> > to release a snapshot of the relevant “master” branches under active
> > development, due to the amount of testing, fixing, and hardening
> > necessary to make a product from a non-stable release.  Also, changes to
> > keep the master branch of a layer working with the upstream master
> > branch of Yocto may result in that branch no longer being compatible
> > with named branches (e.g., it might not be possible to mix and match
> > master and dunfell).  So, a decision must be made on the branching
> > policy of meta-arm.
> >
> >
> > Proposal
> >
> > There are many different ways to resolve this issue.  After some
> > discussion, the best solution for us is to allow new features and
> > hardware enablement to be included in named branches (not just bug
> > fixes).  This will allow for a more stable software platform for
> > software to be developed, tested, and released.  Also, the single branch
> > allows for focused testing (limiting the amount of resources needed for
> > CI/CD), lessens/eliminates code diverging on various branches, and
> > lessens confusion on which branch to use. The risk of making this choice
> > is a potentially non-stable branch which will require more frequent
> > testing to lessen the risk, and not following the “stable” methodology
> > of the core Yocto layers (though it is not uncommon for BSP layers to
> > behave as we are recommending).
> >
> 
> thanks for the clarifications. I believe it makes sense, and I agree that
> BSP layers tend to follow a similar process (even though it's not always
> documented).
> 
> 
> >
> > Process
> >
> > The process for patches intended on being integrated into only the
> > master branch is the normal process of pushing to meta-arm mailing list
> > for community review, approval and integration into upstream meta-arm
> > master branch.  For patches intended on being included in a named branch
> > are also the normal internal process of pushing to mailing list for
> > community review, approval and integration into meta-arm named branch.
> > However, any patches intended on being included on a named branch must
> > also be sent for inclusion in the master branch in a timely fashion (no
> > more than 1 week after inclusion into the named branch).
> >
> >
> > Branching strategy
> >
> > Named branches for meta-arm will be released as close as possible to the
> > release of the YP LTS release.  Meta-arm named branches will be created
> > from the meta-arm master branch.
> >
> 
> Why only LTS releases? Are you not planning to have named branches for
> stable (e.g. non LTS) releases as well?
> 
> 
> >
> > To minimize the additional work of maintaining multiple branches it is
> > assumed that there will only be two active branches at any given time:
> > master and the most recent Long Term Stable (LTS) as the named branch.
> > All previous named will be EOLed when a new LTS has been released.   Any
> > branches that are EOLed will still exist in the meta-arm, but patches
> > will not be accepted.
> >
> 
> I believe users will need a branch for non LTS stable releases as well. It
> might not be an 'active' product/development branch for you of course, but
> it should exist and be opened to accept community patches at least. With
> the new LTS process we now expect 3 types of OE/YP users:
> 1. active developers on master
> 2. stable users on current stable, who can switch every 6 month
> 3. LTS users


This is more of setting internal expectations on what they can submit
things to.  My major concern is the overhead of maintaining multiple
branches, specifically testing.  I would be happy to cut a release every
cycle, and, based on master CI, it should be stable.  Then just take
bug fixes for these branches.  Would this be sufficient?

Thanks,
Jon


> 
> 
> >
> >
> > Branch transitions
> >
> > When an upcoming YP LTS is approaching release, meta-arm will attempt to
> > stabilize master so that the releases can coincide.
> >
> > T-6 weeks - Email is sent to meta-arm mailing list notifying of upcoming
> > code freeze of features to meta-arm
> >
> > T-4 weeks - Code freeze to meta-arm.  Only bug fixes are taken at this
> > point.
> >
> > T-0 - All bugs are fixed and layer is stable, new named branch is
> > created based on master and no new patches accepted to any previous
> > named branches.  Master branch will start accepting patches again.
> >
> > 
> >

> 

