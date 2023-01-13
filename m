Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49997C54EBE
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 15:03:56 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.89034.1673622229508515211
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Jan 2023 07:03:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=AOoeVe21;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.47, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1442977d77dso22540106fac.6
        for <meta-arm@lists.yoctoproject.org>; Fri, 13 Jan 2023 07:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fF8QroKFaQOJ4X5fgYh1BjqPbXxLEaXllq9ugDoY7n4=;
        b=AOoeVe21UX3g0pyrmhpZD7uXZhb75HeUoplf7iLiFJRcoeup1cM7fjkzoxL7R4EOhA
         KuEB3oGkF55oLG+vRwhiOSnSuPq6LS8ni6CpEP6tvkfM6OakO1prn8TGYsegRATj9KM7
         iDjczpuMy9oeFCeoaOefPp6WA/zHpv7KdzHVYQN4tyFz9wq3x/GQgs0CvovOyNVyp3+Y
         PqT8lJUXKDt1bD0n+wj1+3K1mYYIAZYBuU4f9Ykfym5mq0+gbDiHRze1cuSaQxdTlKBx
         8fQ7t9xeTaW569u67Bhr5tYU2gSgKKQkXyttJD5WIVGH7IThP0X2ivh9ZN0z13+svtTa
         4KGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fF8QroKFaQOJ4X5fgYh1BjqPbXxLEaXllq9ugDoY7n4=;
        b=Ex70s3DIFLOGouenyCwMp4/IFGRPV0X9lfPpHkfke9nhWmd5/ymwWjDffT1L75KmXA
         UlvP0ESvlbZCsiguJz4uZk+iW8VGejmzL71ZdpELeUJyjvzfSn5BEJbiDhZ3YVsfsUfI
         zrM8BwgQvSA0kDV57ekzluYg2pNNlUp2Pu/PuVyvMdIHhXwRbo4KHuRU5JKRlzYYOslQ
         W7WfVAwQ9ea1TuhxK5v34gmQi7bRa+0CXMS4NR63+4GDoiXlYMbmIpM49KfqOuB9OaJb
         tO1a1R+pFl3AixaZccVtujJCoxAwiQUTu2PZPQpXvw/qt6mt/Ik2madkqL1YxZQz1lJX
         fk/A==
X-Gm-Message-State: AFqh2kpnYJ6sWti4+OWGk4M/MuqG9VplxFVB8/R9yj/n916rgRrsgRaA
	J56aliCB8jvGCf2Dwy1KV/t4bQ==
X-Google-Smtp-Source: AMrXdXt5JvbC2VAhMYSM98o2rwjIeHcfMHcYE0vQi0g47KnOQZqFG5RuLDGE+Vdv2l99NSsYC1YIJw==
X-Received: by 2002:a05:6870:c8a9:b0:15e:aba8:2668 with SMTP id er41-20020a056870c8a900b0015eaba82668mr5135118oab.7.1673622228637;
        Fri, 13 Jan 2023 07:03:48 -0800 (PST)
Received: from kudzu.us ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id bj3-20020a05620a190300b00705975d0054sm12872954qkb.19.2023.01.13.07.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 07:03:47 -0800 (PST)
Date: Fri, 13 Jan 2023 10:03:46 -0500
From: Jon Mason <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Ross Burton <ross.burton@arm.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 01/10] meta-*: mark layers as compatible with
 mickledore only
Message-ID: <Y8Fy0k0wQQ87UDH/@kudzu.us>
References: <20230112110257.2070363-1-ross.burton@arm.com>
 <20230112133134.GW22689@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112133134.GW22689@denix.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Jan 2023 15:03:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4279

On Thu, Jan 12, 2023 at 08:31:34AM -0500, Denys Dmytriyenko wrote:
> On Thu, Jan 12, 2023 at 11:02:48AM +0000, Ross Burton wrote:
> > oe-core's master branch is diverging fron landgale and meta-arm will be
> 
> typo - landgale?

A couple others in there too.  I'll fix them before merging

Thanks,
Jon

> 
> 
> > following this, so drop compatibity with langdale in master so we're
> > free to diverge too.
> > 
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta-arm-bsp/conf/layer.conf       | 2 +-
> >  meta-arm-toolchain/conf/layer.conf | 2 +-
> >  meta-arm/conf/layer.conf           | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
> > index 75efe546..e192a83d 100644
> > --- a/meta-arm-bsp/conf/layer.conf
> > +++ b/meta-arm-bsp/conf/layer.conf
> > @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-arm-bsp"
> >  BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
> >  BBFILE_PRIORITY_meta-arm-bsp = "5"
> >  
> > -LAYERSERIES_COMPAT_meta-arm-bsp = "langdale mickledore"
> > +LAYERSERIES_COMPAT_meta-arm-bsp = "mickledore"
> >  
> >  LAYERDEPENDS_meta-arm-bsp = "core meta-arm"
> >  # This won't be used by layerindex-fetch, but works everywhere else
> > diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
> > index bb37cd06..a6f403ec 100644
> > --- a/meta-arm-toolchain/conf/layer.conf
> > +++ b/meta-arm-toolchain/conf/layer.conf
> > @@ -9,4 +9,4 @@ BBFILE_PATTERN_arm-toolchain := "^${LAYERDIR}/"
> >  BBFILE_PRIORITY_arm-toolchain = "5"
> >  
> >  LAYERDEPENDS_arm-toolchain = "core"
> > -LAYERSERIES_COMPAT_arm-toolchain = "langdale mickledore"
> > +LAYERSERIES_COMPAT_arm-toolchain = "mickledore"
> > diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> > index 68d8c562..be8201c7 100644
> > --- a/meta-arm/conf/layer.conf
> > +++ b/meta-arm/conf/layer.conf
> > @@ -13,7 +13,7 @@ LAYERDEPENDS_meta-arm = " \
> >      core \
> >      arm-toolchain \
> >  "
> > -LAYERSERIES_COMPAT_meta-arm = "langdale mickledore"
> > +LAYERSERIES_COMPAT_meta-arm = "mickledore"
> >  
> >  # runfvp --console needs telnet, so pull this in for testimage.
> >  HOSTTOOLS_NONFATAL += "telnet"
> > -- 
> > 2.34.1
> 

