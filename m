Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web08.13542.1607608834883863970
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Dec 2020 06:00:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=t/Jb/k3r;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.50, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f50.google.com with SMTP id s6so2383582qvn.6
        for <meta-arm@lists.yoctoproject.org>; Thu, 10 Dec 2020 06:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QmlIUP/FJotMMfTQlLasOh4gWLkflencVXTRdt/SbwY=;
        b=t/Jb/k3rZoLJDje/XBgM+YKo43XylOpTaZr/sVFxF14CCSBxArSxwzU0jhheFpdBPz
         +Tf9bfxjwuPQVMLzTMQB8a5aCSFtYbRBEUbF4JxhyufrP5ADq9DnwcHnTJjMyYkgTkdL
         KO3zk7xjJjypgsmmCMs6er5ZbWks00UvAninh1AFj292vOU1u+PhOqC+PSv47RMQz2vK
         golmM5LH8g20vZsE9hoAc0f9XLaKmukfIvxJ9x+FxNwYeIFdWIDazMKQ+uoZ45TzWoLr
         FMOzjkh5v1/vaeyT7sl+l2IWh9Q/QMpTYDFz7M2OGcxqU5QMW5LXNNsBkhy08P3+fpgt
         itjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QmlIUP/FJotMMfTQlLasOh4gWLkflencVXTRdt/SbwY=;
        b=FfdtySttqluLb9feia8yeeM4WWIvimopvmwc/PHxzC6BYvvNTyHMWhgCC7AEebiFKg
         4Hs6CBnBEHqdC0mGxfS6q1ATiLlnFqYdjKOal+7N73AzbKbo1e4/I3COkFr0kVRSXnS2
         uNN5PXn1PZbIynXbBFlEYBsYzr977XN3uVzySheIJQevfpdxhxOwpfnO3vrYfEiCVZwb
         Lw1Akmahmh+jU/xwOdpGNVOQr5gvP8XLQkjgytJ668vKYeaBbx+/MAby8Kqo8oMqc3R4
         RCKD6hcOP+9eqlyHX0kDjg6VIu5FAZGr3t+JHxuYCS/uIZeS7LYEK3uwmCet+CDj9bXd
         NAWQ==
X-Gm-Message-State: AOAM532549c0xHoQo6Mt4ddOegK3p3Nra1UMWKsv9eDU+amgP1fTdB2c
	AvhjKEPCvzPk4ZdtT3aRq7Mz/Q==
X-Google-Smtp-Source: ABdhPJxKM1ctErmb5VtBGsWjs+yHi4AJB1O6QhgkH8wmrLA3vbW4rm5xpUXDAPbXKFWKkcmo7/p3oA==
X-Received: by 2002:a05:6214:7a9:: with SMTP id v9mr8940068qvz.38.1607608832505;
        Thu, 10 Dec 2020 06:00:32 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:8083:6d46:abe1:7466])
        by smtp.gmail.com with ESMTPSA id v128sm3481619qkc.126.2020.12.10.06.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 06:00:32 -0800 (PST)
Date: Thu, 10 Dec 2020 09:00:30 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Kamil Dziezyk <kamil.dziezyk@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-autonomy/xen-tools: update vif hostname fix patch status
Message-ID: <20201210140029.GA27847@kudzu.us>
References: <20201209151157.GB12460@kudzu.us>
 <29675.1607529060313214647@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <29675.1607529060313214647@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 09, 2020 at 07:51:00AM -0800, Kamil Dziezyk wrote:
> Please backport this patch to gatesgarth.

Done

> 
> 
> 

