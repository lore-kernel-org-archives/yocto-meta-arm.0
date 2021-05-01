Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web12.11503.1619898245245223438
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 01 May 2021 12:44:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=tFDhQRjZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id o5so1581689qkb.0
        for <meta-arm@lists.yoctoproject.org>; Sat, 01 May 2021 12:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=R81g4g3ASPwOcL8+i/uxsWKOfEpMHIIoMaeeGzAkGh0=;
        b=tFDhQRjZ+nmTYpJLeJ3bYkcBiZF0mONt4GTom1dOecgnBdgNJh3clx5djuyz7dSOFx
         QsbKi5v51eN0Us6EMLxqRXuz5Uv3fha5POl3Hc1HeOa75leOBgDpjMqBphb0ydspZyFq
         gjnSXZ308mKJdM9w+y0ITr1Hu2SuC9ZT+hA80Lgi89kDqXeMf90W0fs2DmhJBCKKnwN0
         27qSRg5mvepo4wGdbDJWHQD+kTvrFLe8TYP9ZLU+N3mceySXNUva3iRfI8oeyF/aF3GS
         +PH3U/rb2PRx0kRegLn/L0fsCyGfnThhP53hGoj5NdS9HG1eG5FJ/R4uV7usqzkQCAo2
         RpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=R81g4g3ASPwOcL8+i/uxsWKOfEpMHIIoMaeeGzAkGh0=;
        b=P46wGmqZnAQ0zTVVCWxIfL/t/sWLrexwgGojWVarMRdvUw8zyV/7xGjM8+OyMGx2pd
         UrtfKHr53mDQcG5H+RIcFMOHmJlX5dXqeSolCzGnBJRoHFBWpwX03Jn54T3kOd00miav
         2ktvm8o1od+XIP6tGisQYNrbNJBByxIaD27S9QKbNfFVSUvbKVjklWw8YLCXJtf6RJAg
         kZpl3JUMRTCbJE2ygL4rrDqZrBbpcvA2S0NomFx1C3SAzoxQ2gSvMUedW48IT9YRoRsp
         XAL1sqUm0FQzoajTwrB91KJGhs/89vcaRlUR2fqGHDzAcnCPJI5BnDHmWUnCQL00r8gu
         QVxA==
X-Gm-Message-State: AOAM530lzGVHweJMe66KhRvfAkb+XYCczfTwK4e0sBJdbdfXI69hTm+h
	Y4Q72oLxkQyPzaR+4yDq4WGJsGcDW5LR/g==
X-Google-Smtp-Source: ABdhPJzFnj3L+Zeergy6PiSgsRI4xS84JKFfdiJir8rg5QWmiXcHIAzg1mnTNuxRud/bHrEOWrjwvg==
X-Received: by 2002:a37:9343:: with SMTP id v64mr11587768qkd.346.1619898244375;
        Sat, 01 May 2021 12:44:04 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a601:f800:1c11:4abb:70dd:58e6])
        by smtp.gmail.com with ESMTPSA id h8sm4788085qkj.4.2021.05.01.12.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 12:44:04 -0700 (PDT)
Date: Sat, 1 May 2021 15:44:02 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] meta-arm hardknott release
Message-ID: <20210501194402.GD20675@kudzu.us>
References: <20210501192641.GA20675@kudzu.us>
 <20210501193947.GF15937@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210501193947.GF15937@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 01, 2021 at 03:39:47PM -0400, Denys Dmytriyenko wrote:
> On Sat, May 01, 2021 at 03:26:41PM -0400, Jon Mason wrote:
> > meta-arm has released the hardknott support branch.  The branch was
> > forked on Friday, 32 April from the master branch and was tagged as
> 
> Friday, 32 April? :)

Should be 23rd.

> > "3.3" yesterday.  The tag is GPG signed and my public key can be
> > provided if someone wants to use it to verify.  Per the previous public
> > discussion on this list, hardknott will only be taking bug fixes and be
> > passively maintained (with dunfell being the actively supported LTS).
> > 
> > Per an external request, we have duplicated all existing "numbers only"
> > tags (i.e., 3.3) with a "yocto-x.y.z" tag (i.e., yocto-3.3).
> > 
> > Thanks,
> > Jon
> 
> -- 
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
