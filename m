Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web11.3458.1588780827253319139
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 May 2020 09:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=RQrPYOcN;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f195.google.com with SMTP id s30so1913551qth.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 06 May 2020 09:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LXcNxszjbpbZNaVNSv8CQ32NjVI6YQXuGs+S9ybSvnE=;
        b=RQrPYOcNdosgAuuwyY3/7w99ws5MMP1dsUKzanh3a+AvEL0G8TN0aCJ8ACyw6goJex
         KNfB7G7VFN5DhnuUxph2mHNNqfxyL8CcN1+j8cZpML7BCDCfQzpPG6o/gCh8Mu8LJjUH
         E9yY3eeFaeLfchZ8tcDUb9EfOUht+2Z+HyuFoemc4WnFVFepWJAQi1CiFcSIQk3wK5lw
         OSgFiU15ad/zX5IHu/jjo8MMDe5Jo/NnEJlWKPHGKZSUcZaE7BBEjJeMCnAj4uF2XKvt
         ur9Ht3uZ4GqLsBdtj07HcTdWqK+vb2c00Kjou6SIdnNtcX+v+pGcAapsYJixmB7BEO9t
         Dxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LXcNxszjbpbZNaVNSv8CQ32NjVI6YQXuGs+S9ybSvnE=;
        b=rto6g03ErsIoNHXSRpz+K0DJA4C+QE8P2zpITmQj1Z1url9GndZTeKZF2qy5b4TxCE
         XPPW2yiBukFEteReMva9oUOjvncee3TeEv824XYVGb72sMJrzT9s9kpmEkhtQOTMi4TX
         XD4jIEMe9FDIYHjXHw7Ot2dBzaOt+AVf5NOORh0wp2W/JWuUT99haa2Rl/LugUFhBsA0
         pXuzL+cO6Nt0hW5zLKm4EwkB8elLKR7NgERqTxUuOIV9gaMDwsJ72bbdlkAfhCx7u94N
         iMf3AcK7LwkUtxYgH63U0tzndIxh15o6hcy+xjYS/Pz+ijYQVafkZ9l9Ux/LbBBdc9QE
         YeFw==
X-Gm-Message-State: AGi0PuY5gIbRPIMJTJZc59je0fTGKQnunnMlfRJfuP6/qTIvhdFXg7r0
	wI5ENKIfmmwa5lwiFnDUJTV37uY/X1JU1Q==
X-Google-Smtp-Source: APiQypJFPCj5LmaEZ3/e6xtMY3F7LNE19IppmxyICdwkPkg8LoL8ABsq69LGOIOKIcvsklopCVCf2A==
X-Received: by 2002:aed:3f1d:: with SMTP id p29mr9118789qtf.14.1588780825991;
        Wed, 06 May 2020 09:00:25 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:1068:4212:6fd:289b])
        by smtp.gmail.com with ESMTPSA id c33sm1902388qtb.76.2020.05.06.09.00.25
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 09:00:25 -0700 (PDT)
Date: Wed, 6 May 2020 12:00:24 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] [arm-autonomy] xenguest-manager: Wait longer for /dev/xvdaX creation
Message-ID: <20200506160023.GD22996@kudzu.us>
References: <1588253373-58920-1-git-send-email-diego.sueiro@arm.com>
 <D181AFAA-FF59-4CC9-935D-DDF6F8F2333C@arm.com>
MIME-Version: 1.0
In-Reply-To: <D181AFAA-FF59-4CC9-935D-DDF6F8F2333C@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 30, 2020 at 02:25:57PM +0000, Bertrand Marquis wrote:
> 
> 
> > On 30 Apr 2020, at 14:29, Diego Sueiro via lists.yoctoproject.org <diego.sueiro=arm.com@lists.yoctoproject.org> wrote:
> > 
> > Implement a wait block of 20s with exit condition for checking
> > /dev/xvdaX creation.
> > For example, in cases where the rootfs is mounted via NFS, a longer
> > time is needed until the xvda device appears in the system.
> > 
> > Change-Id: I44cbcf2a43aeb476eae92d5b6d2cfd683e4bdf21
> > Issue-Id: SCM-929
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Pulled into the master branch.

Thanks,
Jon

> 
> > ---
> > .../recipes-extended/xenguest/files/xenguest-manager      | 15 +++++++++++----
> > 1 file changed, 11 insertions(+), 4 deletions(-)
> > 
> > diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> > index b25eeb5..4777054 100755
> > --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> > +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> > @@ -234,10 +234,17 @@ function xenguest_disk_init()
> >                 exit 1
> >             fi
> > 
> > -            # Sometimes it takes time to see the device
> > -            if [ ! -b /dev/xvda${part} ]; then
> > -                sleep 1
> > -            fi
> > +
> > +            # Loop for 20s to wait until /dev/xvdaX appears
> > +            i=0
> > +            while [ ! -b /dev/xvda${part} ]; do
> > +                ((i++))
> > +                if [[ "$i" == '40' ]]; then
> > +                    break;
> > +                fi
> > +                sleep 0.5
> > +            done
> > +
> >             if [ ! -b /dev/xvda${part} ]; then
> >                 echo "${PREF} Partition ${part} creation error"
> >                 xenguest_detach_disk
> > -- 
> > 2.7.4
> > 
> > 
> 

> 

