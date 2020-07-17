Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web11.10866.1594991676573177492
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 17 Jul 2020 06:14:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=TPfAGJoe;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.68, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f68.google.com with SMTP id dm12so4195563qvb.9
        for <meta-arm@lists.yoctoproject.org>; Fri, 17 Jul 2020 06:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/4tpdpXXSHnVr74ZHoxKJpjWCqyTuXLa9MVtYGKb5fg=;
        b=TPfAGJoek0kT81mJYqQhg5oZDHAhSqSnHD1Bw/ORxdbqHxJlLfhh2IdCVbEU4vGQAB
         ItTiFtD2jvZvhK5iPxWqyNCxKiQzsxgo3b2/ttU2eLC8+8sp1O7mRDNbsv43rnsL71fq
         /A/ajwztAEu3vQwVEa2nSGkXBeStt7dpp7PKe7vPvJZUhAPoUXwprlwljmSt/hiPWttZ
         lPDh3nbThYU4uJHu6pSzmhE8RgYX+LaA124CRUdU86SuLuujF2zfJ91UlYlLuEFNyFw0
         UZLzqGS7GXDtV4SiduxRpniEZREu/YK8i8GwvA8mXcgRNNnpQ4GWkXBe7uTrOlvhFBeL
         fIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/4tpdpXXSHnVr74ZHoxKJpjWCqyTuXLa9MVtYGKb5fg=;
        b=WBizNHSi4ghe0XbpYNBJXeEQ8UFQMMzRBb6UzNf+lW+PL6VanZUI50sAjMBnV87upR
         u4Jmi0rwIPGa2JMLj/ZOSZP5bE7vKcfDBxha+3Nxo4ebgKgfDKgTgXWQG+RYsfOlbkzd
         ElOn/pJZXPHF/0ib630qyMKXe+dHAhJg7efsQszn1G7yKstyQrb77lb8dbjqaonBGMu9
         pmRTRHOyyo50qKrIRukAHCsDNweH6qU4Rx78gOumI+3h6+6vcPebUFLwl5N4Jw2latXP
         6Cyjo9y7RmhyoftozhSRrQpbVxTTyOGZ39+I4AUI7w3w7/rPsDI/zOcL5eZMVf2mw2Ca
         QW6Q==
X-Gm-Message-State: AOAM531nCyFnpuUn/eaZblefUS0uS6dIiJpomSGeJOGpQXtlbMER3ZFQ
	N2xTKtJZAauN0i/tK53fn+2+JpEyl+tGJA==
X-Google-Smtp-Source: ABdhPJyBR0Oc/kI8XzvQfldYYg1FOh6YyDsx9LllpOkIbjZQz8IhdrQanyAMR8FSzq5U/6SXI4nnMA==
X-Received: by 2002:a0c:f007:: with SMTP id z7mr8451733qvk.7.1594991675657;
        Fri, 17 Jul 2020 06:14:35 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:8034:b667:f1cd:123f])
        by smtp.gmail.com with ESMTPSA id f130sm1693827qke.99.2020.07.17.06.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 06:14:35 -0700 (PDT)
Date: Fri, 17 Jul 2020 09:14:33 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp/image_types_disk_img: do not force 'ext4' FS by default
Message-ID: <20200717131433.GC26434@kudzu.us>
References: <20200716115329.19153-1-kamil.dziezyk@arm.com>
 <5153.1594900926066387786@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <5153.1594900926066387786@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 16, 2020 at 05:02:06AM -0700, Diego Sueiro wrote:
> On Thu, Jul 16, 2020 at 12:53 PM, Kamil Dziezyk wrote:
> 
> >
> > In some cases user doesn't want to create any file system on a specific
> > partition.
> > 
> > Change-Id: I4596d97b95034952436cfd0a267a3f6ae4c0401d
> > Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
> 
> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

Applied to master.

Thanks,
Jon

> 
> > ---
> >  meta-arm-bsp/classes/image_types_disk_img.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta-arm-bsp/classes/image_types_disk_img.bbclass
> > b/meta-arm-bsp/classes/image_types_disk_img.bbclass
> > index ea7ba86..78cc0d8 100644
> > --- a/meta-arm-bsp/classes/image_types_disk_img.bbclass
> > +++ b/meta-arm-bsp/classes/image_types_disk_img.bbclass
> > @@ -51,7 +51,7 @@ disk_img_createpart() {
> >      local imagefile="$1"
> >      local start="$2"
> >      local size="$3"
> > -    local fstype="${4:-ext4}"
> > +    local fstype="${4:-}"
> >      local content="${5:-}"
> >      local formatargs=""
> >
> > -- 
> > 2.17.1
> > 
> >

> 

