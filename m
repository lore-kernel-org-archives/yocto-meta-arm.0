Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web12.6278.1584683190627316199
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Mar 2020 22:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=J3vNuZkl;
 spf=pass (domain: linaro.org, ip: 209.85.210.194, mailfrom: leo.yan@linaro.org)
Received: by mail-pf1-f194.google.com with SMTP id f206so2658792pfa.10
        for <meta-arm@lists.yoctoproject.org>; Thu, 19 Mar 2020 22:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VeiCGrI/w7ZrJjTsvVlXpBuEO6vORz/Hk5xjUTRzO9s=;
        b=J3vNuZklZjmfY8HhdhMAnMKSI/hb0Z9Z889jm7urUdviizYVeggEUClfIz+DPPVeEt
         a7Uy8skD7lRqSNz1uLB0xtq/k7Z4diE11fcJzGWisTMBBMrftYGptnKfM5ZH7hsBBVxh
         KbTACf2e446E+9PA7ZDrQTfsLvpDC5OzuE3dVDR9Rh7po0YW9D/iiLFQLjiI14zdsBRC
         uyVyOg+EpwRpeYb61zfLWwFGwTdycBi5ZqZ2Bu3GznuOnPvdubI+/XkJNcMmLbpwJGKo
         3wzzK2hhTvQ/CZn6Ummj9hGLNYniXHVMYyKSzmiW64dVnENE270ly9hNJQnk2anmyaAR
         /yVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VeiCGrI/w7ZrJjTsvVlXpBuEO6vORz/Hk5xjUTRzO9s=;
        b=CiXjKHTLfhcetURf7lGnDbk69QiAbEFYsfCtLGC348cdnq264EywTax2udOMQ1bjIC
         qkmwosjIuiCHcizrVlv9Ig06QS3mUV7MJPFlGx5Jl1ImTuvDMjXHEaa3JCDcLMgn2dsu
         UYI+NNc0m+eooC3SaIxVxa/iddyrJ28Jk8MXSqSs01/KOYreGwwj9qcyU6m16NByR7+H
         xtll0YftKdH2Nd/dfQk2ehohwTrvdLOAhxKp83SkvXf8OsRu/4R7rmARgncQMI8U1idE
         rNbl5yvuJ0vA3AsozpeMGmxK8KG3zq8Il2gQVfUutKJS22WENWtz7+C7nJV/vhoI5eGf
         KkZQ==
X-Gm-Message-State: ANhLgQ27MXWjZyqNc/YrNYXn93k5WzC7DbsbmcT5gwXpH4nHTvQv7zp8
	q7VTWT6W1pVslENAJkkJSxx+Fw==
X-Google-Smtp-Source: ADFU+vtuYcJYsvzG95LIEV93OT9zc5OhB0cbrFO1BH16bZp9XdcQNKOq8P12IldPV4ZXdM6RWiaXpg==
X-Received: by 2002:a62:8247:: with SMTP id w68mr8127424pfd.146.1584683189896;
        Thu, 19 Mar 2020 22:46:29 -0700 (PDT)
Return-Path: <leo.yan@linaro.org>
Received: from leoy-ThinkPad-X240s ([2400:8902::f03c:91ff:fe3f:32da])
        by smtp.gmail.com with ESMTPSA id q43sm3591431pjc.40.2020.03.19.22.46.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Mar 2020 22:46:29 -0700 (PDT)
Date: Fri, 20 Mar 2020 13:46:21 +0800
From: "Leo Yan" <leo.yan@linaro.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH v3] OpenCSD: Support for Arm CoreSight decode lib
Message-ID: <20200320054621.GA3644@leoy-ThinkPad-X240s>
References: <20200318071901.28503-1-leo.yan@linaro.org>
 <87CFF39E-1E6B-49FB-8897-2F452CC78904@arm.com>
 <20200319210424.GA4731@kudzu.us>
MIME-Version: 1.0
In-Reply-To: <20200319210424.GA4731@kudzu.us>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2020 at 05:04:24PM -0400, Jon Mason wrote:
> On Thu, Mar 19, 2020 at 08:01:49AM +0000, Bertrand Marquis wrote:
> > 
> > 
> > On 18 Mar 2020, at 07:19, Leo Yan <leo.yan@linaro.org<mailto:leo.yan@linaro.org>> wrote:
> > 
> > This patch is to add recipe for OpenCSD, which is an open source
> > CoreSight trace decode library and utility.
> > 
> > Also create a new folder recipes-devtools under meta-arm to place
> > this recipe.
> > 
> > v3: Added support native building (Bertrand Marquis).
> > 
> > v2: Refined recipe to use '-C' make option so can catch make error
> >    (Bertrand Marquis).
> 
> Applied to the master branch of meta-arm.  Nit, in thw future, if you
> can add comments like v2 and v3 under a '---', it would save me from
> having to edit the commit message to remove them.  Git will
> automatically remove everything between the first --- and the start of
> the patch (and this is how the do comments like this in emails on
> LKML).

Thank you, Jon.  I am aware this with your reminding and read a good
practice [1] and later will follow.

Thanks,
Leo

[1] https://lkml.org/lkml/2020/3/10/1403
