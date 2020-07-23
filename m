Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.4264.1595527654454343938
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Jul 2020 11:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=TCov+T8a;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f194.google.com with SMTP id b79so6226564qkg.9
        for <meta-arm@lists.yoctoproject.org>; Thu, 23 Jul 2020 11:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XFkxgPwwE0jYb5IfTts1ruQANl+mha7PqN3eIY0EOZI=;
        b=TCov+T8aGJuQpHVKtPp9MWBgNl3rkaB4eESDgy8C2jOfjLBWwcRu4YJFQqn+lmhIIs
         6YDGNdI9wbOrYD5NvSv7TWVCBfzfDQV3y0CfwF0jzJ/1MfsW7a6YtSAmVG/TYTuPRDsV
         Kz8q1OohS3/m2jo+FWiKSbGHj2GgW+r25Wu/hh0ktp/X1bM+fqRZtEGA89v1BWUmVt6h
         nM7ADSrXaWUOQwGGEsE0DeN9EDB+lBBTtDSJuA3ibj3Y5b+P7KTLiEmRnyCRQc25qqqg
         nzI25k2wDU0I2OC+aQYFpI5CaboM6MZq9dTh5UC6BPK6AgpZ4EYMH12iFhj9pw26Wo4y
         C2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XFkxgPwwE0jYb5IfTts1ruQANl+mha7PqN3eIY0EOZI=;
        b=K5hit8g8RMfiHjfknVrlmG2LT2dK0Nj6b9rpqeskmdty3xOoafIZTPXIqEUf2KwDoq
         wnEDpEPHlJ+witOBeGXK11j79mGLE4guNyw6HMUn3k06VL0ByZDem7iEEN+t062ZQ6aR
         gYmuu7W55In3Z1Fjmpdqgd8Cc3HmIztCq5MMjt+41cyAYWUZM6/76FpwHAKLfkT9iXX3
         GAMUuvkqm6EjrbXMf+xT5GvT3piZgi6hQNobbYWxLbx5G0wtyMp1ejVVHq0MDY05vd9c
         /Q2tU6Lte8cr1Mue1hA+i1QbnbkGV020+A1tfMOj42S34GDIXAnlSAC73ZlHCX95LNlA
         u9Bg==
X-Gm-Message-State: AOAM531g1/YyVJnQymb7BR/gy2AFCRvP7H2I5WkoS2Ori9l85PIkJYWN
	Gl5fnrd5fSDIm47Wxy4iEXhS91YBGZNBXA==
X-Google-Smtp-Source: ABdhPJwsllv8Ik3ZxqK25aQK4eXTTMvSR09SKRSzmoyubw76F3gftdRC/PjrP3zgegfs0UTAYf6hRw==
X-Received: by 2002:a37:47c9:: with SMTP id u192mr6566516qka.350.1595527653462;
        Thu, 23 Jul 2020 11:07:33 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:d1cc:f3f9:a2c1:7b9c])
        by smtp.gmail.com with ESMTPSA id h55sm520576qte.16.2020.07.23.11.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 11:07:32 -0700 (PDT)
Date: Thu, 23 Jul 2020 14:07:31 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] layer.conf: remove dependency on meta-python
Message-ID: <20200723180730.GA19291@kudzu.us>
References: <1591228165-20078-1-git-send-email-denis@denix.org>
 <20200608155142.GF15959@kudzu.us>
 <16238755CA6601E8.5706@lists.yoctoproject.org>
 <20200722160740.GP17660@denix.org>
MIME-Version: 1.0
In-Reply-To: <20200722160740.GP17660@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 22, 2020 at 12:07:40PM -0400, Denys Dmytriyenko wrote:
> On Mon, Jul 20, 2020 at 01:51:32PM -0400, Denys Dmytriyenko wrote:
> > On Mon, Jun 08, 2020 at 11:51:43AM -0400, Jon Mason wrote:
> > > On Wed, Jun 03, 2020 at 07:49:25PM -0400, Denys Dmytriyenko wrote:
> > > > From: Denys Dmytriyenko <denys@ti.com>
> > > > 
> > > > Corresponding Python modules pycryptodome(x) and pyelftools, needed by optee,
> > > > were moved from meta-python to oe-core.
> > > > 
> > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > 
> > > Pulled into master
> > 
> > Can this be backported to dunfell as well, since the required Python module 
> > move has been finished in oe-core and meta-openembedded few weeks ago and 
> > there's been plenty of time for everyone to catch up with the change?
> 
> Are there any objections to this change? Please let me know. Thanks.

No internal objections, and it builds meta-arm-bsp without any
problems (though not tested).  So, I'm pulling in a modified version
(as the current one doesn't cleanly apply) into the dunfell branch.

Thanks,
Jon

> 
> 
> > -- 
> > Denys
> > 
> > 
> > > Thanks,
> > > Jon
> > > 
> > > > ---
> > > >  meta-arm/conf/layer.conf | 1 -
> > > >  1 file changed, 1 deletion(-)
> > > > 
> > > > diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> > > > index d96e9f1..3341972 100644
> > > > --- a/meta-arm/conf/layer.conf
> > > > +++ b/meta-arm/conf/layer.conf
> > > > @@ -11,6 +11,5 @@ BBFILE_PRIORITY_meta-arm = "6"
> > > >  
> > > >  LAYERDEPENDS_meta-arm = " \
> > > >      core \
> > > > -    meta-python \
> > > >  "
> > > >  LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
> > > > -- 
> > > > 2.7.4
> > > > 
> > > 
> > > > 
> > > 
> 
> > 
> 

> 

