Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web12.14069.1589901617344987820
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 May 2020 08:20:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Rwg697oT;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f196.google.com with SMTP id i68so11447172qtb.5
        for <meta-arm@lists.yoctoproject.org>; Tue, 19 May 2020 08:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=L539MgRv3Va6zaeH3+aV27pb2/L6lQkS181L/GjQ4Lc=;
        b=Rwg697oTwVeXaTIZpyNXeYBe6PUrvFfZgpvb+dET8giqG7VBOGFV8/Gn4FuGa4MhlE
         A1sH0Cse9BxHE2jmYtqXImGXDaNO2Tf/+nI64d4kRj/NHhvkHPMk0ApaYpJSUbQVqjd1
         6/3B9nnc4uHKG1MH8N3Jvfz1yySn1uatLCxNF0uKBjQbxusw4C5h9BLPEJ9RVkjf9PGB
         y1gP2HdpJAULj3N0AUqfyFpqpHw3341Pk2GQNVik/RI/ttna6n1qF8tUhZ7F95Zo3a3c
         yICS8hLAVSdieUjzr+/wd8JnEMNxGOQrcMAkDLFh+P38obI0gV9vAfnquBkdqoNgDiJs
         PrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=L539MgRv3Va6zaeH3+aV27pb2/L6lQkS181L/GjQ4Lc=;
        b=hmG/B8z4ytXKtvmWiFovSf2hiNI/1+hlv0NToD+VW7uJvqUq1M/3mpOnFJpBWrWaSn
         0Sy61VRLo2fz3sqg+F4G7exPGaJtI/ZWK1dlhEZnzlUh0jJWDdbpaflQ8REgpeQkvZFK
         MuP0BllysnvzG0qNNkp9rhyJEYhXn6prJiJfnf6G8LUSHcyyYZNgdDizdo7kvjHtDaYJ
         3ZSL4xCI4qrQlZ+K0W71KvoQIeUqDjsEWFdL5toypqGXPIR3TOOgD/YA2h/KRDzvsrR5
         SG/wzUZDviUSbyWq7U8cgzKijCV37LGWJ+yCf+X7Zl0sovW5NhWFuAXDqxpWb1S3RIpx
         6mvQ==
X-Gm-Message-State: AOAM533YilF7OD78eXXncyVtttlK679r3T4N2GxCsU3dRJeOW97whSEQ
	PWFLssYsmbxirjgZWV6wF+lRx5Y/T7b89w==
X-Google-Smtp-Source: ABdhPJx1n7aOo4F/saBiBauxOSceLbKw3xVwjnDZ5GI1I8mT7DsEcb/2klbDKPHDyDAhhKO+ebxTZw==
X-Received: by 2002:ac8:6b19:: with SMTP id w25mr186762qts.147.1589901616494;
        Tue, 19 May 2020 08:20:16 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:1ca0:41e:d9bc:f60c])
        by smtp.gmail.com with ESMTPSA id 17sm10479193qkn.44.2020.05.19.08.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 08:20:15 -0700 (PDT)
Date: Tue, 19 May 2020 11:20:14 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] optee-os: replace old pycrypto with pycryptodome - a drop-in replacement
Message-ID: <20200519152013.GD22197@kudzu.us>
References: <1589502694-24528-1-git-send-email-denis@denix.org>
 <6362.1589528670740992908@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <6362.1589528670740992908@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 15, 2020 at 12:44:30AM -0700, Diego Sueiro wrote:
> On Fri, May 15, 2020 at 01:31 AM, Denys Dmytriyenko wrote:
> 
> >
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > While pycryptodome is a drop-in replacement for the old pycrypto module,
> > pycryptodomex uses a separate namespace to not confict with pycrypto.
> > Unfortunately, optee-os uses both namespaces, hence both variants of
> > pycryptodome and pycryptodomex are needed.
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> 
> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

Pulled in to the master branch.

Thanks,
Jon

> 
> > ---
> >  meta-arm/recipes-security/optee/optee-os_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb
> > b/meta-arm/recipes-security/optee/optee-os_git.bb
> > index dfff6d1..c9847b5 100644
> > --- a/meta-arm/recipes-security/optee/optee-os_git.bb
> > +++ b/meta-arm/recipes-security/optee/optee-os_git.bb
> > @@ -10,7 +10,7 @@ PV = "3.8.0+git${SRCPV}"
> >  inherit deploy python3native
> >  require optee.inc
> >
> > -DEPENDS = "python3-pycrypto-native python3-pyelftools-native
> > python3-pycryptodomex-native"
> > +DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native
> > python3-pyelftools-native"
> >
> >  SRCREV = "023e33656e2c9557ce50ad63a98b2e2c9b51c118"
> >  SRC_URI = " \
> > -- 
> > 2.7.4
> > 
> >

> 

