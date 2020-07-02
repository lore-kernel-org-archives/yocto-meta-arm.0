Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.9458.1593704392592525711
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Jul 2020 08:39:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=o+iEGap5;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id r22so25989399qke.13
        for <meta-arm@lists.yoctoproject.org>; Thu, 02 Jul 2020 08:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=t7ttNB6UXoTjZ0REr40qLBgXK4+0TyK3fW+6sYyZC34=;
        b=o+iEGap5AXLpX2awpgbTzmNqksyB4cCgEw7bVG0BFH24MGDiKztLoaECQz5VQv6K9H
         3aC76Y74FGIDJkYmqYOtIsmP3cG+JBPXSpk2oSSDAN6pbXj/jXT3mWxuRmirQVWudr1y
         TEjK2X+Ficv7v/UYoaS3RbzWdx4xPDRjiR6UF1JD+HcuvM9niauu13c6Xg5OeBOBqAIn
         D6cpBPPLao5PsZLxOgNzYzRzFfoEqnqrv7Vz9Y+xkQjIjr0W2msFPDbDq1PQq3Pgl3w+
         juT5vbOepopRKGjFmns2OkEUz6/2mEIWx10WXei2Nwvq4rvvxy1nmX6PTNojPGAnTmIX
         Ebwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=t7ttNB6UXoTjZ0REr40qLBgXK4+0TyK3fW+6sYyZC34=;
        b=oKW8sN/jTJXWR8XNfHBP/gzLJExH+U8QvKQkdrb9HUV/hJSknYX0pIfnJbzH6n3XJf
         4XFXbyO34wVcN8+iYBDUoTn7XUdH+JELPIky3fRZFuSTdATrr6ZQccYnV4SHlPwGmHGv
         p0WIXfeV78GWZo6Y3fLypXAmrMh6mbslrLNMb51klp9MuMGNVGGQHNUkUexm3+7ifQae
         srUwfapMthHMFn7l2vy3H4SK+VxakAcXsH0bc9/diRPt3gCVY9OYdEnXtpUNWrJxstLC
         m4V4dqO4/v5MkhGxue1EcsiN73Fu5jTwll9Bhvw8CypFA7gGkFXhql2++xIoWzrl9EnC
         R7YA==
X-Gm-Message-State: AOAM5339tOwxvBftL8fMC1ypb/fBY6Rso09ul4pBUPVQGGZES7/MBa3F
	55hspVRDioSAYVc3YGdEP4nZMQ==
X-Google-Smtp-Source: ABdhPJxonWV/PboccebcRHzi9mlfy9RhFScXjKXLY3n5A9kiBHa0pJFnKWS7K5C+hcGy+0Vw9tjEXA==
X-Received: by 2002:a37:a204:: with SMTP id l4mr29386614qke.200.1593704391482;
        Thu, 02 Jul 2020 08:39:51 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:704f:4a:7ea2:c1b0])
        by smtp.gmail.com with ESMTPSA id p63sm8738206qkc.80.2020.07.02.08.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 08:39:51 -0700 (PDT)
Date: Thu, 2 Jul 2020 11:39:49 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: Denys Dmytriyenko <denis@denix.org>,
	Gabor Abonyi <Gabor.Abonyi@arm.com>,
	"JPEWhacker@gmail.com" <JPEWhacker@gmail.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 4/6] arm: trusted-firmware-m: Add recipe
Message-ID: <20200702153948.GB21456@kudzu.us>
References: <20200622071401.2570-1-gabor.abonyi@arm.com>
 <20200622071401.2570-5-gabor.abonyi@arm.com>
 <20200622164936.GF17660@denix.org>
 <20200622172654.GC14044@kudzu.us>
 <20200622173611.GG17660@denix.org>
 <e4cd2080-3747-9ead-d307-6394caba82d1@gmail.com>
 <VI1PR0802MB2414E9F9AB2A65D5B27A7DE68E940@VI1PR0802MB2414.eurprd08.prod.outlook.com>
 <20200701180840.GT17660@denix.org>
 <CAAnfSTu3YvnOKHug6ifScDHSYQBPhVEkd7FAY4EN0xwot=6LsA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAnfSTu3YvnOKHug6ifScDHSYQBPhVEkd7FAY4EN0xwot=6LsA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 02, 2020 at 10:14:55AM +0100, Ross Burton wrote:
> On Wed, 1 Jul 2020 at 19:08, Denys Dmytriyenko <denis@denix.org> wrote:
> > meta-arm is meant to be a central place for shared components to be used by
> > other BSPs. Kind of a community layer, if you like. And arm-toolchain is kind
> > of a special layer and may not be desirable by all BSPs, so that would reduce
> > overall usefulness of meta-arm layer. Each individual BSP (and meta-arm-bsp is
> > one of those) is free to depend on arm-toolchain layer directly, if needed.
> 
> Arguably, tfm should be in meta-arm for the same reasons that tfa is:
> it's a shared component and not specific to a single BSP.
> 
> The need for a binary toolchain is not ideal but simply adding the
> layer doesn't cause it to be used by all recipes.  I propose that we
> add this series now and evaluate the use of multiconfig to build a
> second cross compiler in the future (sooner rather than later).

To be clear, this is not a perminent requirement.  I would LOVE for it
to be removed, and I am hoping it will be done within the next month
or so.  IMHO, having TF-M available with this detriment is superior to
not having it due to this issue.

If this is a dealbreaker, please let me know.

Thanks,
Jon

> 
> Ross
