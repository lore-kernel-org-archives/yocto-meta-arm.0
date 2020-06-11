Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.378.1591892935778823700
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 09:28:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=ZekUKmj1;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id c185so6146142qke.7
        for <meta-arm@lists.yoctoproject.org>; Thu, 11 Jun 2020 09:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Vhv65AsMizU4KqbydHNkSTLALUaRDnNp7sbJiGkVhNM=;
        b=ZekUKmj1IGPyk3ZKYsBUjv0dX8bQBMKdZxm9CQ7OpLxXHSCShvWQ1armN5UeFhM/bk
         I3dauFneXcrBnnlhogHfksGbT3/XXA+VpImwyy8LVW8hUfz7yd65WjV8sLlO/EyWUQa5
         BNgPJHN25v7de71/eMyJ4tSwnlX5riWhWW+9TSvIQnhFtevHOQj1P8E7wwpApEwd+8A2
         L+/nHE83bTUeukbCLh6MtFJpBnK/st96wSvCKfTwV6ULqN+AX4Qqq2raaGTYh8MMbfxv
         6IRYACi01EHp+qFm7vOXBdKpPk2X+M4FuUxO//rRleJp+krolu8j8OgnNuXJH7j1wpWE
         AoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Vhv65AsMizU4KqbydHNkSTLALUaRDnNp7sbJiGkVhNM=;
        b=nMxfgyIFMENBj4xLOYvYH55Wdc5pbhdvJHCRwXRekNCtj18I4mLzTrq5M6zShU9iK/
         OLKn7syG/H+0hyT7n2NH2Y0ZnjCT14bhILHwwuandd22dWHQKk0cexvJhuB4PtDpLTFW
         /2d+1GIp7tLpk+PfKNGGkNFSK0CpPeF5vgJa89n4M8+tGz3OtLcjutFcFBiRSjMbNe/h
         5DqgxBwK0kzAY+FagPIkYk1wWPLkFsOF+GbNRy7jDLTV+vivc9r2k9M7gI46O62NYqPI
         CeBoxPn2z/jHMyjEM8dtQGb1cev1oBFo7MfEm1Do7gt7Nli6GK35EPnofoJTJG/hOj6P
         icZQ==
X-Gm-Message-State: AOAM5329ncBi/KuUd/ontFJx9fnY68ydnEXF3GeQQ1NSpzJSO5XmJc5+
	eskXSATXFYPsX2YluvHGZIwrOQ==
X-Google-Smtp-Source: ABdhPJx+Dkuw2bEkiWdAndCEXBdqY6xvOaDn5PRNMKRnKQwQpLEA3I+lMz0BGs29VJK78yzZkansQA==
X-Received: by 2002:ae9:eb47:: with SMTP id b68mr8946224qkg.479.1591892934949;
        Thu, 11 Jun 2020 09:28:54 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:e01b:52c7:6d78:8385])
        by smtp.gmail.com with ESMTPSA id h5sm2582988qkk.108.2020.06.11.09.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 09:28:54 -0700 (PDT)
Date: Thu, 11 Jun 2020 12:28:53 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-autonomy, xenguest-network-bridge: Set bridge members per machine
Message-ID: <20200611162852.GC20403@kudzu.us>
References: <20200611140247.GB17598@kudzu.us>
 <3832.1591885197681301037@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <3832.1591885197681301037@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2020 at 07:19:57AM -0700, Diego Sueiro wrote:
> On Thu, Jun 11, 2020 at 03:02 PM, Jon Mason wrote:
> 
> >
> > On Thu, Jun 11, 2020 at 07:55:05AM +0000, Bertrand Marquis wrote:
> > > 
> > > 
> > > > On 11 Jun 2020, at 08:47, Diego Sueiro via lists.yoctoproject.org
> > <diego.sueiro=arm.com@lists.yoctoproject.org> wrote:
> > > > 
> > > > By default, XENGUEST_NETWORK_BRIDGE_MEMBERS should be empty and only be
> > > > set per machine.
> > > > 
> > > > Change-Id: I67c56847eb785279c28757a6052f092c838babe0
> > > > Issue-Id: SCM-995
> > > > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > > Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > 
> > Applied to the master branch.
> 
> Can you please apply to dunfell as well?

Done

> 

