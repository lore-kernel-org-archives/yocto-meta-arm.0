Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.1292.1594233119595973021
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Jul 2020 11:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZawcVJbO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id q15so4276561wmj.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 08 Jul 2020 11:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=RUenGuwzFS4syEfR/hbrZrtxDkMDUIciR8ppe2u70dM=;
        b=ZawcVJbOVjnLo8P6wKJ9Y9R9nV0NMSLYXfEk+zo8DccjrO2a21XxSV4HN6ZMOmQPfq
         VJigHrqntvD3UFyiQbFuHtTOV/6F3w6fiHIuWEAQfvXv4jbSE008ArlHntTDtd8dRTtv
         BDGbHwyQSj4IG6HUEY/SOofsSNK14MZjP9YDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=RUenGuwzFS4syEfR/hbrZrtxDkMDUIciR8ppe2u70dM=;
        b=kCBhFn5xyC0JbYFB9zjb6HV7rnxtSjNhJfjKy8jUBMcrwz8KbDSn9Jkld5/ViNvLBW
         nYsdaO1u+634+krTgDLJpZIXtsRH2xmVpW7/PIv3/hMJRoHJYAiFPNQozctqwy97M5uy
         Vl13ZGgRMQ1VblsqMaJW8W26wCZtws55430qg4jM6GqeNtNN+BtefY5AFVbM0dj1deR2
         I9KuzUOPn/B30IWr25FQzsZG8CF0H0g4Yil2j7O9tUe8jMBxivO4dBI/g7Ons7/R4JBF
         LhsauhENkZ7qWropE/nueEjss9jiIyVG+0uPK44rAisJB853OrQXCOWlT9KjQLWIYanD
         EAyw==
X-Gm-Message-State: AOAM5308EKxfXt3jCvhlOorcnit7sxT+owBXe/qi4YvQWmG3LDNkjugu
	DcZBwVeeO9r/2l5UJab7HyYXyw==
X-Google-Smtp-Source: ABdhPJxzkSJiGZDxVeNnXyVRQ/5/uOJpSPI744AoejZgOzuMdJ6PD6owgFKEgZVN8i0BVa/mtRttMQ==
X-Received: by 2002:a1c:2392:: with SMTP id j140mr10405580wmj.6.1594233118153;
        Wed, 08 Jul 2020 11:31:58 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id t141sm1038004wmt.26.2020.07.08.11.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 11:31:57 -0700 (PDT)
Message-ID: <77f3bc6017967f33f4c41ca6f2fcb34511f74dae.camel@linuxfoundation.org>
Subject: Re: [meta-arm] [PATCH] arm-bsp: yocto-check-layer fixes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>, Jon Mason
	 <jon.mason@arm.com>, meta-arm@lists.yoctoproject.org, nd <nd@arm.com>
Date: Wed, 08 Jul 2020 19:31:53 +0100
In-Reply-To: <CAAnfSTvp2LPDtZrtTvmeF0A8tWUQ1=4ueT0mn-MbDAm1R-Ockg@mail.gmail.com>
References: <20200704154301.15546-1-jon.mason@arm.com>
	 <CAP71Wjxp9P1T-gKehWz-eio7JD4H8_DhdvorEtiEf37L49cY2A@mail.gmail.com>
	 <7372fed9b3d2942e5b3b2a2e9cce9c3c55fea53e.camel@linuxfoundation.org>
	 <CAAnfSTvp2LPDtZrtTvmeF0A8tWUQ1=4ueT0mn-MbDAm1R-Ockg@mail.gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-08 at 19:16 +0100, Ross Burton wrote:
> On Wed, 8 Jul 2020 at 11:02, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > I have to admit I saw this patch and was wondering that too. Unless
> > the
> > recipe is already machine specific in core?
> 
> Good point.  Do we get points for finding bugs in the check layer
> tool?

Offset against the autobuilder failures/warnings ;-)

Cheers,

Richard

