Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.19783.1595340770955577595
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Jul 2020 07:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Uv3Pjexm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id 184so3058146wmb.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 21 Jul 2020 07:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=G4b0zGmMGiXJwTABq16vaWQYMVX3M7j6LWvgf3FI/pw=;
        b=Uv3PjexmsM82VB+9Ahz9YJel4iqVuRGrcw0fSSqWoZdAnLuMhaSNEI8BLv7/9PkJQ1
         eL/F2Fz4khiz7I5UFISC0nn4ZQbieSPkPUaniHn0WgPRl+f+XN7qhSXthaAnnbx+t6ZL
         1S7wos/Bm8BWadUv1ZmZh3o4P6Lk+gaNl3nWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=G4b0zGmMGiXJwTABq16vaWQYMVX3M7j6LWvgf3FI/pw=;
        b=mvn+3e969eT9ME/xVF3uHyVRXKckilj4R60VCVd0yDBaHoXmVJwoxjYhD/sBvW1H4G
         H3wyW4TOz7nYOYyi2koIqRMCGwaSySaKobslCoDMMMzJi7A/oSDAaBVnkXKYLddQj3Co
         owolmhIQ4F6a6cfEzXyrudR6NcPT2rPHoDkVGITmBk982O0npvZFhY8Rr4qf67/FbLbD
         HnmNgOYFOAP3UnKhY+WuQst64gB8BTjCTLAlLhZ1H7OjMC/f4xAnBqRcxwk69HvI6l+p
         p2zOzUzm1HuQEzornF7DV+KEG1Cbw4ZxNL8Of66xjEYT4z+2E6jBDfVi7wrc7g4r8yKZ
         ixjQ==
X-Gm-Message-State: AOAM533fppsXyrfJQjMNSk6iqQ/+qWmHf0hhYZJuSgydlnVb+ldTjJJW
	dYcH5Bfq2fYvsQDbMoFClH2l4g==
X-Google-Smtp-Source: ABdhPJziT0NNd07eFE75s9YSsIIa/DpIYPiugWg/joA7Ne/ak5j/1XSjSz3EmAx43K2bhBpL4ODUmg==
X-Received: by 2002:a05:600c:2285:: with SMTP id 5mr4497949wmf.78.1595340769598;
        Tue, 21 Jul 2020 07:12:49 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 6.d.c.a.e.4.9.c.8.4.4.2.b.1.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (6.d.c.a.e.4.9.c.8.4.4.2.b.1.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:181b:2448:c94e:acd6])
        by smtp.gmail.com with ESMTPSA id v18sm498364wru.90.2020.07.21.07.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 07:12:48 -0700 (PDT)
Message-ID: <3c3634f24ee87b5ea036372e0cdec93fef26456a.camel@linuxfoundation.org>
Subject: Re: [meta-arm] [PATCH] arm-bsp: u-boot error fixing and file clean-up
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: Jon Mason <jon.mason@arm.com>, meta-arm@lists.yoctoproject.org,
 nd@arm.com,  Damodar Santhapuri <damodar.santhapuri@arm.com>
Date: Tue, 21 Jul 2020 15:12:47 +0100
In-Reply-To: <20200721134830.GA30432@kudzu.us>
References: <20200720181735.21132-1-jon.mason@arm.com>
	 <1233345f41b84cc472f7dc940bf74f5dd54b9eb7.camel@linuxfoundation.org>
	 <20200721134830.GA30432@kudzu.us>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-07-21 at 09:48 -0400, Jon Mason wrote:
> On Tue, Jul 21, 2020 at 09:55:47AM +0100, Richard Purdie wrote:
> > On Mon, 2020-07-20 at 14:17 -0400, Jon Mason wrote:
> > > This commit fixes the errors while rebasing u-boot src to
> > > v2020.07.
> > > Additional work necessary to preserve dunfell functionality.
> > > Consolidate all of the files into a single inc file and single
> > > bbappend
> > > file.
> > > 
> > > Change-Id: I442c843b1fafeb41ea283d2f11393522a48fc9d2
> > > Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
> > > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > 
> > Thanks, looking forward to green builds!
> 
> I'm not sure this gets us to green, but it gets us out of the red for
> sure ;-).
> 
> It's in master now.  Now Ross can start fixing all the warnings.

Ross' plan here seems to be to file them as bitbake bugs and force the
bitbake maintainer to write patches! ;-)

The last test build didn't throw any warnings so we may be looking ok
there too...

Cheers,

Richard

