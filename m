Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.10058.1588339722524751537
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 May 2020 06:28:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=DGqhGqeK;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f172.google.com with SMTP id z90so7828998qtd.10
        for <meta-arm@lists.yoctoproject.org>; Fri, 01 May 2020 06:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EFjQ2uA42HnWv6CKu3Lm7ALKVQ53mX03QeOT0suGad8=;
        b=DGqhGqeKTa4zQIes5V5guImA8euE8lEP4/aHTcIwqR+4qjlTqTY5Lbzs/z+39DrhJb
         AqKyKOOTY61juoVvqpJPMCZzjnkEIqyD84IahKxyEAGhKvDQB8VErWNTM0U1LuQmg/fl
         8iphoBKBZE+pWfsZ6jwW1k2eElwKovNO5c41Z0njL3AE6QEVvuV1yUMld0HSBKTjRMq4
         BF4ip3RyS82zAIyPbjjB+9rcESMZ9jvYLNYUJsXsAucbPGC8m2eWeZfd1CCru+qwmxCz
         pMyFNicVTsNIqCHymI/S+gCwUiWMjsPfMyzBvhs4arHREPyw0tGpykc2HRVPIcpXxmWe
         BJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EFjQ2uA42HnWv6CKu3Lm7ALKVQ53mX03QeOT0suGad8=;
        b=EMyfodyix8+UJgUuJ5zb627MjuDc+hwRXV3kF9s4Sfckh8+rQhDeJC52qZ5X5DgoMZ
         Kco39+5SAY4zcuEIcHwd2PSe+RgYv8IF054ZPB1Lta5llTyagw0A7JorgYZ0xe7Je8TG
         SzKxliYzpsPY8EnxlN9lh469zoRscRJeIvf0zqXYosKyvfH5x9S3z9VJ/EgaGT+E+ghf
         WuTnz2EuzWlLQoqnMB2IkWH0QY0Cv2luEDY3VsBTDvAMMWDaO9JgAOK+Cq/rHiMs5T0l
         WUYiqijzERH5nJt5ZWQkp3qWkI6Z6J0pnSUbuGqUN6WJ4mu6AeETD3Hh5Nti3/7fG63T
         zZ0w==
X-Gm-Message-State: AGi0PubNd5MNVm/52W8ddk9KDAe6cY7FeyeC4KJS5Q3EOIC2k3MsDM2i
	1+IXKkrFoshpEKdR6fs2hWgIAd23CSPbzw==
X-Google-Smtp-Source: APiQypKSGrZ51SFQq2jvxPZ5CrYsEl15QG5ybrlmbeBqhorwE5/LYhnATjZw9dgm3yLYST+cXuDkjw==
X-Received: by 2002:ac8:358c:: with SMTP id k12mr3833422qtb.38.1588339721310;
        Fri, 01 May 2020 06:28:41 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:bca5:cc07:46bf:ecff])
        by smtp.gmail.com with ESMTPSA id o6sm2568814qkj.126.2020.05.01.06.28.41
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 06:28:41 -0700 (PDT)
Date: Fri, 1 May 2020 09:28:39 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] Couple questions about Dunfell
Message-ID: <20200501132838.GA13726@kudzu.us>
References: <20200425225727.GL11927@denix.org>
 <CAP71Wjy84MgZdC+j4WxysbH2wJuLrkBe1DNUFRxDAMwhknNtCQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71Wjy84MgZdC+j4WxysbH2wJuLrkBe1DNUFRxDAMwhknNtCQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 29, 2020 at 11:31:57AM +0200, Nicolas Dechesne wrote:
> hi,
> 
> On Sun, Apr 26, 2020 at 12:57 AM Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > Hi, Jon,
> >
> > I had couple questions:
> >
> > 1. What is the time frame for branching off Dunfell?

TL;DR:  Mid-May

We have a chicken-egg problem with the Gem5 support and Python2.
We've been doing all of our testing (until recently) on zeus.  This is
because we wanted to make sure any issues we encountered were ours and
not an upstream issue.  For dunfell, the current Gem5 support has a
requirement for meta-python2.  To add this to our internal git repos
and test infrastructure would be painful.  However, the upcoming
release for Gem5 removes such a dependency.  This release is scheduled
for May 15th.  So, we can either go through a bunch of work that will
be thrown away or wait a couple extra weeks.  We chose the latter.

As a stop gap, we are using the beta version of the new Gem5 release
to make sure everything is in working order and we should be able to
cut a release very quickly once it is out.

> >
> > 2. What is the policy for backporting to Dunfell?
> >
> 
> I am definitely interested in these questions, or rather in the answers to
> these questions! Since dunfell is LTS, I would expect a dunfell branch to
> be maintained in meta-arm.

The dunfell branch is planned to be a stable branch.   Only bug fixes,
no features.  If an exception is to be made (which I really, really
don't want to do), then it would be predicated on getting the relevant
parts into the master branch of meta-arm.


> 
> 
> >
> > I've got several patches in the pipeline that I'm testing and wanted to
> > know
> > my options.

More than what you've already pushed?

Thanks,
Jon

> >
> > Thanks.
> >
> > --
> > Denys
> > 
> >

> 

