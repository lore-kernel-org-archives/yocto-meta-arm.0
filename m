Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.9827.1591102273630117680
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Jun 2020 05:51:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DZ4vsFIz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id f185so2998639wmf.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 02 Jun 2020 05:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=/RQmVHxzQy5yY7iu+SyqAXovROH8uE3or4WfIOBV2f4=;
        b=DZ4vsFIzpGlqh4CKJRNff+vp4X25rOSPzGFWH5udTY3Uk41+0OLzOIdkc8GXEOFyTi
         TktJWoXXvmaDGjNYO461OCnDkBnI0TCfGZwAAMM+8bhHT7SkO6xAZdGtojHqbvniujgI
         fhXDlpv9w+dDkJDUMPiVIB7dKAt7e1ZRu7REE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/RQmVHxzQy5yY7iu+SyqAXovROH8uE3or4WfIOBV2f4=;
        b=rc56dLk45vXCdhPGbRImCovcqsFYwbmZ9/pK3ElAvgr+GDVinT5dRKv5X2fCpHDS0R
         JnE5QyJqd3cgWJ3AuJshsJQ1yW2/KaBvumjlyuXrcs4xqSmNwj2eq1cQad/U2vHRVk3R
         7iRVa+oQtPkeA5sXd3E6MdK5MMnG3MKRqlQBI7YrrSn+sntQlPaMy0PQbii0BIr+XrLD
         AcqecaliJtZ/U+SGNE1484bUOm/SbJI+ijsE6+0KaZPmToHzYnYIi+BXt/d4RVitWhm7
         ciyQO0x6V+uIWU8H4t1ge7lfN5QQuZeJ21e/N54/SZ16yXVvU5lUqFouJS04I0DuB/FJ
         krow==
X-Gm-Message-State: AOAM532jGqqHTNeCqphZbDr0DOtg6dCwwY2Ym/JnXFPWfgDkIXmzH4sP
	AOmeKvEV/Prywu+bR7rT0evwhw==
X-Google-Smtp-Source: ABdhPJw+f8+N5Gx5l1ug1IbPmsssCP2MaVNVHPIqNNrHEA7fTbKapMleAcYoKeK8FODrfV/kPGi1ag==
X-Received: by 2002:a7b:c622:: with SMTP id p2mr4027395wmk.55.1591102272091;
        Tue, 02 Jun 2020 05:51:12 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id b8sm3872026wrs.36.2020.06.02.05.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 05:51:11 -0700 (PDT)
Message-ID: <3582e1997e9ee7fa19b4c5d331c7443a56af7cd2.camel@linuxfoundation.org>
Subject: Re: [meta-arm][PATCH] meta-arm: Remove meta-python dependency
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jon Mason <jdmason@kudzu.us>, Joshua Watt <jpewhacker@gmail.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	meta-arm@lists.yoctoproject.org
Date: Tue, 02 Jun 2020 13:51:10 +0100
In-Reply-To: <20200601225610.GD31505@kudzu.us>
References: <20200529151427.20272-1-JPEWhacker@gmail.com>
	 <90DD68A5-0834-4C82-8A06-BC3972756CA3@arm.com>
	 <6d6ccf5c-f134-1a15-e5eb-8f5e10d03832@gmail.com>
	 <09986319-6338-471F-A0C1-5096F5ED7AA3@arm.com>
	 <CAJdd5Gag=0HF8+5KiF0DoLG1WZs+0ngbnT7G8CS1dFa=ydqjoQ@mail.gmail.com>
	 <20200601213141.GA31505@kudzu.us>
	 <a6576f43-1722-3f32-dbd0-3d4ad0dd346f@gmail.com>
	 <20200601225610.GD31505@kudzu.us>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-06-01 at 18:56 -0400, Jon Mason wrote:
> I'm in no way saying that meta-arm master should not work with
> upstream master.  I'm saying that we want to keep compatability with
> the previous release so that we can cut stable releases for
> customers.
> 
> We have a requirement to release BSP SW based on YP.  Just like I
> would expect other vendors/people who want to use meta-arm.  So,
> there
> are a few ways we can approach this issue.
> 
> 1.  Merge patches onto dunfell branch
> 2.  A development branch based on dunfell
> 3.  Use master meta-arm-bsp and dunfell branches for meta-arm and
> meta-arm-toolchain
> 4.  Keep master compatible with dunfell
> 
> One is simple, we actually do our development on the dunfell branch.
> However, this breaks it from being a stable branch.  So, this is a
> non-starter
> 
> Two is still simple, we do all of our internal development on a
> second
> dunfell branch ("dunfell-dev") and make any releases we have off of
> that.  The problem with this is the integration and testing.  If
> there
> are multiple branches to test, can we expect developers to test every
> combination?  Also, there might be a need for different versions of
> the patches depending on how much master and dunfell-dev diverge.
> 
> Three is more complex.  Since only meta-arm-bsp needs releases, we
> can
> simply let that one float and fix the others on the stable branches.
> The problem with this is that we are currently needing to add recipes
> for things into meta-arm that others might need (like SCP, EDK2,
> etc).
> So, this will work once we have more stability in meta-arm, but right
> now we are adding too much stuff to make it viable for the next
> release.
> 
> Four is simple, we keep compatability with dunfell and make the
> releases off of that.  The potential hazard with this is if something
> in YP master requires that compatability to be broken.
> 
> I presonally would like #4, because it is simple.  However, if this
> will prevent others from using meta-arm, then let's have a discussion
> on it.  Perhaps I am not understanding something fundamental.

I can see why you want to do this but it isn't how people expect to 
work with layers so it may need some further thought...

Cheers,

Richard

