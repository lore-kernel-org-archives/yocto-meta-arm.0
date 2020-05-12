Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web11.463.1589315291097559535
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 May 2020 13:28:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=p2H03jph;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.65, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f65.google.com with SMTP id 59so7130015qva.13
        for <meta-arm@lists.yoctoproject.org>; Tue, 12 May 2020 13:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=67GgV/dpt1QX+THba2Fs2sc/C9qrMqNqkjV/6RZQvHE=;
        b=p2H03jphWgUziHRlQ+iVK3JIzdoPpe99OAI1kJ/xonz2bUG5jc1gS3zJGOly2OLwD/
         uqnkylA2Ww6tH2eiJzM3DWKHFk3pPHR8CPAyloEqtPSqVMTTTBFuXpnbV3wAin/BdnlA
         j7rHXfVQKbFv6vaeSr5BVNL5W0/ztBmu33Ja7YMBGAnT6nsDcTCVgrVf9uJ3iCZsKSPZ
         rJojjJpC18uAyVApbliIeLxnAmyjU3qvd2chMOuU/IPsAcFYjY2emR3jTlmjcxqVcQF8
         SuDR4URUF8bmgr/2TUBjM3wfKBRPqN88S91hRUX04M0ViYrsvUUZb4h9hCjbq9gXm0aC
         NvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=67GgV/dpt1QX+THba2Fs2sc/C9qrMqNqkjV/6RZQvHE=;
        b=X/N3BYbV5xlyuEgrbXzdq3QoCeSw2I68+aY1TFz0zpZI0FYKlDCX2erivKgR4USssM
         znrjMqdPxIsJuMC8uRCtqaRxziDzFLtWOFoLwv/L6+95AaEfpTQp/PMeE/sAFXqfjDuh
         VhSOi/bDoV5/YvbfKH9BaUOz0v+wtY3bwHlp/44eNsXzF7Gq9qPRh+85WkFHqNqCDiA3
         MR+zNn77ds+wHNyUTHZWxq9nxPY66ZAtYanmKXYd8kCTuYbw1GsHL/9t22QF4REznq+u
         SmtbcgtMdh0c6MP4u9+yjQ04+eaepWyh76nceg7BVvHaD56CQ2hP2tTRkfbeatwIukVc
         S++Q==
X-Gm-Message-State: AGi0PuZFga7LYSkjQWtLPf+oHOmeRQuA0gcq5fqoOSF9Xw8kOE9FGhF3
	vmnVPjeOFQX3vRDp3ie+jER+SA==
X-Google-Smtp-Source: APiQypIjogKjM2fINDhkfsFQwywwD8grrR8A3DChV/N9AOI5Ybuo0F3NcYhxWTU9mSchqg6q3JeZBA==
X-Received: by 2002:a05:6214:1334:: with SMTP id c20mr14325740qvv.183.1589315290178;
        Tue, 12 May 2020 13:28:10 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:adef:f2fb:7e3e:86da])
        by smtp.gmail.com with ESMTPSA id h185sm11891750qkc.19.2020.05.12.13.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 13:28:09 -0700 (PDT)
Date: Tue, 12 May 2020 16:28:08 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp: linux-linaro-arm: Set COMPATIBLE_MACHINE to "invalid"
Message-ID: <20200512202807.GB27993@kudzu.us>
References: <1589298895-66051-1-git-send-email-diego.sueiro@arm.com>
 <92099448-B0DB-4C92-9E25-7592D09B716A@arm.com>
MIME-Version: 1.0
In-Reply-To: <92099448-B0DB-4C92-9E25-7592D09B716A@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 12, 2020 at 04:36:55PM +0000, Bertrand Marquis wrote:
> 
> 
> > On 12 May 2020, at 16:54, Diego Sueiro via lists.yoctoproject.org <diego.sueiro=arm.com@lists.yoctoproject.org> wrote:
> > 
> > To keep consistency with trusted-firmware-a and optee recipes we should
> > use softer assignment to "invalid" for COMPATIBLE_MACHINE.
> > 
> > Change-Id: I57d0b220d92c4546e0539f95a54d391935f995fc
> > Issue-Id: SCM-954
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Pulled in to the master branch.

Thanks,
Jon

> 
> > ---
> > meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
> > index cc68ed3..fcc07a6 100644
> > --- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
> > +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
> > @@ -6,7 +6,7 @@ SECTION = "kernel"
> > 
> > require recipes-kernel/linux/linux-yocto.inc
> > 
> > -COMPATIBLE_MACHINE ?= ""
> > +COMPATIBLE_MACHINE ?= "invalid"
> > 
> > # KBRANCH is set to n1sdp by default as there is no master branch on the repository
> > KBRANCH = "n1sdp"
> > -- 
> > 2.7.4
> > 
> > 
> 

> 

