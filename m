Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web12.1086.1591640130826318718
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Jun 2020 11:15:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=gKtusu+J;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.51, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f51.google.com with SMTP id p15so8796742qvr.9
        for <meta-arm@lists.yoctoproject.org>; Mon, 08 Jun 2020 11:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=LcYi2Yi1fC1kT4Cn2SVHxHfZ4xyeJPgomVs2xH7HnwY=;
        b=gKtusu+JOc/G6WjbcN0neYGN0XDjmGqW4DSSSakazRU9V2W+WKUR0L8HX4f/z5KGy7
         AjQFMLAUQQ83KQz2abgRwaeder+eWPcza+bifyRBQO1GU2V6qCofKNcxAmyaSF/iHbFy
         WGNSw6CE7abgLbXRt0CYPMHHOUZJKUtMsCxL2duqQNIRP94oyd9I5s19s9/BquerrrPi
         FxMI0mS5BSKlA1qFjNJlXrqTfir8NNmSzqorqbBjEgwN93Vd0tMIWRJLoH25EfY41OKj
         jjAv0xypLe1SGzczIv5rP9zpnvkJpM1/6LxOceLdJIuZxMkm8ZHrrR2nPn27DlUxNxF0
         /NOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=LcYi2Yi1fC1kT4Cn2SVHxHfZ4xyeJPgomVs2xH7HnwY=;
        b=kiw4Y13tCw2u66NwmVS8kCKdaNsFIItrAfMwz6Shldq22GW29i+aXhHJIXHg9Vs3sV
         b4X3cRBbtOLkHTfspTrmfK79kAPzPxCPSvQkjcBtuKEfSFI/oTM3c38o69Y3fb7zyefo
         qKxn0AEqYMikjS0PvLBWPzvzK5QTRNAXI+YJn9pKHo54bB/fyZjrWpAqqsUz2mI57fdr
         Waw0FuiDOtZvtZXr4YpJcjUrvUUEoQB16u/Ecxs/XE5v1yUn8v6rknlmSyZBJXWerIlo
         w2WqiwxzhG7bDnKgBfNuQANTJBLPy2QKVYSZjTIKAfI+s6nvLSP1kxe8BVGtz5/jc0JN
         kjxw==
X-Gm-Message-State: AOAM533Pb7Obf/TbIdjWDU1z6Emfn72JIPRatiiAVGSGZIFKwxMbWp79
	dJTUJMmADURwSVbT5b3eP5ZXcw==
X-Google-Smtp-Source: ABdhPJyAEtOaZWgvv/c+HcQT+OmBDjI4gvZbV+C4HrSHo3t7EKPYyI7/JafjRsTcRt1HlbMZ9+511w==
X-Received: by 2002:a0c:b892:: with SMTP id y18mr23351859qvf.109.1591640129825;
        Mon, 08 Jun 2020 11:15:29 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:b9b3:35e6:b1bd:2c87])
        by smtp.gmail.com with ESMTPSA id j22sm7834722qke.117.2020.06.08.11.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 11:15:29 -0700 (PDT)
Date: Mon, 8 Jun 2020 14:15:27 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: Jon Mason <jon.mason@arm.com>, meta-arm@lists.yoctoproject.org,
	nd@arm.com
Subject: Re: [meta-arm] Proposal for the branching policy of meta-arm
Message-ID: <20200608181526.GA31350@kudzu.us>
References: <e1b8af76-856d-0202-da80-5bf464f61fdb@arm.com>
 <2bfeafe9-ac99-07fa-65bd-b50432141bc2@gmail.com>
MIME-Version: 1.0
In-Reply-To: <2bfeafe9-ac99-07fa-65bd-b50432141bc2@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jun 08, 2020 at 11:24:22AM -0500, Joshua Watt wrote:
> Thanks for this! It all looks reasonable to me. I have a few comments below,
> but they are just clarifications and observations.
> 
> On 6/5/20 1:37 PM, Jon Mason wrote:
> > Problem
> > 
> > The Yocto Project releases twice a year (April and October): "stable"
> > releases are made every six months and have a lifetime of seven months
> > to allow for migration, while "long term support" (LTS) releases are
> > picked every two years starting from Dunfell in April 2020. The standard
> > practice for all Yocto Compatible layers is to create a "named" branch
> > consistent with the code name of that release.   For example, the
> > “dunfell” release of Yocto will have a branch named “dunfell” in the
> > official git repository, and layers compatible with dunfell will have a
> > branch named “dunfell”.  Thus, a customer can easily organise a
> > collection of appropriate layers to make a product.
> > 
> > In Yocto, these named branches are “stable”, and only take bug fixes or
> > security-critical upgrades.  Active development occurs on the master
> > branch.  However, this methodology can be problematic if mimicked with
> > the compatible layers.  Companies or open source projects may not wish
> > to release a snapshot of the relevant “master” branches under active
> > development, due to the amount of testing, fixing, and hardening
> > necessary to make a product from a non-stable release.  Also, changes to
> > keep the master branch of a layer working with the upstream master
> > branch of Yocto may result in that branch no longer being compatible
> > with named branches (e.g., it might not be possible to mix and match
> > master and dunfell).  So, a decision must be made on the branching
> > policy of meta-arm.
> > 
> > 
> > Proposal
> > 
> > There are many different ways to resolve this issue.  After some
> > discussion, the best solution for us is to allow new features and
> > hardware enablement to be included in named branches (not just bug
> > fixes).  This will allow for a more stable software platform for
> > software to be developed, tested, and released.  Also, the single branch
> > allows for focused testing (limiting the amount of resources needed for
> > CI/CD), lessens/eliminates code diverging on various branches, and
> > lessens confusion on which branch to use. The risk of making this choice
> > is a potentially non-stable branch which will require more frequent
> > testing to lessen the risk, and not following the “stable” methodology
> > of the core Yocto layers (though it is not uncommon for BSP layers to
> > behave as we are recommending).
> > 
> > 
> > Process
> > 
> > The process for patches intended on being integrated into only the
> > master branch is the normal process of pushing to meta-arm mailing list
> > for community review, approval and integration into upstream meta-arm
> > master branch.  For patches intended on being included in a named branch
> > are also the normal internal process of pushing to mailing list for
> > community review, approval and integration into meta-arm named branch. 
> > However, any patches intended on being included on a named branch must
> > also be sent for inclusion in the master branch in a timely fashion (no
> > more than 1 week after inclusion into the named branch).
> 
> Just as a note, this is opposite of most other layers where it's required to
> be in master (or shown to be inappropriate for some reason) before it's
> backported to the release branch

Yes, this was a request by our platforms team.  It is my EXTREME
preference that everything go into master first.  However, if there is
a deadline where it is only possible to do one, then it is acceptable
to do the named branch first.

If it becomes a problem of people not pushing into master in a timely
fashion, expect this to be revisited (and reversed to the master
first).

> > 
> > 
> > Branching strategy
> > 
> > Named branches for meta-arm will be released as close as possible to the
> > release of the YP LTS release.  Meta-arm named branches will be created
> > from the meta-arm master branch.
> > 
> > To minimize the additional work of maintaining multiple branches it is
> > assumed that there will only be two active branches at any given time:
> > master and the most recent Long Term Stable (LTS) as the named branch. 
> > All previous named will be EOLed when a new LTS has been released.   Any
> > branches that are EOLed will still exist in the meta-arm, but patches
> > will not be accepted.
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
> > T-4 weeks - Code freeze to meta-arm.  Only bug fixes are taken at this
> > point.
> > 
> > T-0 - All bugs are fixed and layer is stable, new named branch is
> > created based on master and no new patches accepted to any previous
> > named branches.  Master branch will start accepting patches again.
> 
> You might clarify the reference point here... is T - 0 the date the upstream
> release is approved for consumption?

Yes, this is my intention, but couldn't think of how best to word it.
T-0 is the upstream release (barring instablity in meta-arm).  I'll
reword this to make it more clear.


> Also, upstream OE-core makes a named release branch before the actual
> release so it can start accept patches to master before the actual release
> date (I think in particular because there is an amount of time were the
> release is undergoing QA and they don't want to block patches while
> waiting). I don't think you necessarily need to do this, but you might want
> to mention it because there will be an amount of time where "master" of
> meta-arm will actually pair with the release branch in OE-core (instead of
> master), which might be confusing. Finally, some might misconstrue T - 0
> with the creation of branch in OE-core (hence the first comment).

Thanks, I'll reword this in our internal documentation.

Thanks,
Jon


> 
> 
> > 
> > 
> > 

> 

