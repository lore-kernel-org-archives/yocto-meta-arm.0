Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web08.12787.1604934358487631997
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 07:05:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=u88YtSsV;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f196.google.com with SMTP id h12so6141980qtc.9
        for <meta-arm@lists.yoctoproject.org>; Mon, 09 Nov 2020 07:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pr0vlxbNouJQ6I3KT/WepLHgP7KMmLl4q7Btbm3/d8E=;
        b=u88YtSsVD0a0A8ixoc7AEQJnlx8/c+m9lBZZFP5bESSBp+PUrPnwu9SmUA+mFchbgV
         IaXv9MTODeJoEDPy9WOCo5ujO4kBzZs4wmmWmSLJRQ/Vdy02kx2ReAGUz6rTln3A/riY
         6K9368JZPDNu5B3WPz/b4tc+lKJHXWSzk3UdpGvBP/3GMRuHTAn80ElnFTIV0tokNXs7
         yUefGp5XZk299O764QptmN8VBtVvv0qvxj8kfs2Ei4J5LcU4Q4CKBqzD1dT+Bus0Jo/s
         3HO5KnEPwN0qZoQ1gYWENKqkegyXd+KnJ6cH/9kHiGQgmJsPFEkjqTO3S50nIlU995mW
         Rfgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pr0vlxbNouJQ6I3KT/WepLHgP7KMmLl4q7Btbm3/d8E=;
        b=o4WSEHMmCt+YIus//zV7hHlhwJeQsugRO4qPx5HOnsaQPG3rOHXyVuGTC6D4FwwkkY
         tZdJxDgsEB6f4vW232TQKwjumsQG4sN6wzWPNBrPmAgRguVJW7Os2Ojk2MjyjJEuEIGv
         Lfr3gVc0fgOJHqwjRcTUW8DQ9NH1wlGGMSI1b3MFFjpQfb4A8wvPon9ms0LPYIERnv8b
         tmwBshD58nx6pqYhL+s9HVD2W6dcKf7OttkJ8YosUoq4kLrdSBvUs28loLG7o/gf8RWO
         gn1oNjDTyaOExVEKYLQKKYEtGxc6Wdtk7T01CBstP6KhbG3X3JoXer6pOUwU5SzBPvgy
         h6EA==
X-Gm-Message-State: AOAM5334bvitJdjdkkuTMYtr8t4DxwzrPxSitEfJJtg1TRKCyvds4/x4
	P5BJ+omQd7vyfZpxsSYBcZGTaw==
X-Google-Smtp-Source: ABdhPJzDJG3FqSyhq6POtLU5RV+7x0q7xGu5pufH6JYIdREykoLmEwIbWf4MN/bMASPcg8sIhcBU5A==
X-Received: by 2002:ac8:5ac1:: with SMTP id d1mr13508240qtd.82.1604934356783;
        Mon, 09 Nov 2020 07:05:56 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:cd72:d1f:1e1:ac3e])
        by smtp.gmail.com with ESMTPSA id z1sm5778065qtz.46.2020.11.09.07.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 07:05:56 -0800 (PST)
Date: Mon, 9 Nov 2020 10:05:54 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Jon Mason <jon.mason@arm.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp: convert general u-boot bbappend to version specific
Message-ID: <20201109150553.GA17359@kudzu.us>
References: <20201103172047.18147-1-jon.mason@arm.com>
 <20201103172047.18147-2-jon.mason@arm.com>
 <e3b77a6c6d7459af70d526f8fab5e6a5a82119eb.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <e3b77a6c6d7459af70d526f8fab5e6a5a82119eb.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 07, 2020 at 09:47:28AM +0000, Richard Purdie wrote:
> On Tue, 2020-11-03 at 12:20 -0500, Jon Mason wrote:
> > The generic u-boot bbappend is causing issues upstream when trying to
> > use new or older versions of u-boot, by trying to apply patches from
> > folders that do not exist.
> > 
> > Change-Id: I399e3234fba852382fc73ab68f14a7e826bb5a42
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > ---
> >  .../0001-arm-Add-corstone700-platform.patch            |  0
> >  ...02-boot-add-bootx-command-to-start-XiP-images.patch |  0
> >  ...t-starting-the-XIP-kernel-using-bootx-command.patch |  0
> >  .../0004-arm-enabling-the-arch_timer-driver.patch      |  0
> >  .../recipes-bsp/u-boot/u-boot_2020.04.bbappend         |  8 ++++++++
> 
> Thanks for this, it did resolve an error we were seeing on the
> autobuilder. Unfortunately it is still generating a warning:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/427

I've traded one u-boot problem for another.  I think the best way to
handle this is to create a recipe in master for 2020.07.  This will
fix master, but have redundant recipes on gatesgarth.  So, I'll wait to
push this until after we fork the gatesgarth branch, which I am
hopeful will be this week (as we are waiting on patches that were
promised last week to fix a bug).  This would be a temporary solution,
as I want meta-arm-bsp off of that 2020.07 u-boot ASAP.  Also, I'll do
the patch now so that it can be staged to go in as soon as the branch
is forked.

Thanks,
Jon

> 
> Cheers,
> 
> Richard
> 
> 

> 
> 
> 

