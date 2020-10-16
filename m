Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web11.14758.1602852999588169247
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 16 Oct 2020 05:56:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=KwQnJUkB;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.68, mailfrom: jdmason@kudzu.us)
Received: by mail-io1-f68.google.com with SMTP id u19so3663973ion.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 16 Oct 2020 05:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cULrociPM2QMVY7l12wgskXbbxlOfXFWEiBQGPR5BO4=;
        b=KwQnJUkBcsmDBPrBVQuhWUVuujP6rI9ZsO0ENQjNvnJ4WhaL7hgwDhAyl/p7nMsvHP
         Y2iSlyC7pm6gNwmU+c7YOh165tZ6/oVcBSHwVbuYWeWMHa9G0iQMQM3LozzV4LNzNG99
         ftmV/haLYiIKiNIqlj2l/GltTYfWLN3wxiAbabF1Vo+v3J8hVzf+Icz4uHVTmKgZ5KbI
         aRrv4g6GUq7iVo5MUpRpVfYbVMIFJl4cLcLqENE98mgpB5gHGNz/LKMnDqKib3i6o4ti
         D7caxbJZBgXvOnPEn0pEGkfBEz0hrgu2mgDGTRxgzJDNB94zYEdCiImU3c1FckjS2Mu6
         XUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cULrociPM2QMVY7l12wgskXbbxlOfXFWEiBQGPR5BO4=;
        b=kDGGvbt0yvkda+/jH1GrTKR512Fqs87VjAmwkF5HABOdlo95E0ab1L6i1Ks5AvKJzO
         Xl7tFg2uAK6LjCFFdRa0P/FLwmYePNrBV4NhLEnETeFl5gsdgfQ0zKO7ovGTMZNikvLH
         u+oL3KcnrPU7+Rfc+5R1LtyXGGiwp7VGqfo9OakkweHEsMg9SGQWntyEKFTch4HO5cFw
         T9q/kdhLm9rUi3A9APTEpQCv62XDSBtgOhGTFEmw3fiHU4BMLbnJIxS8mxqGkFuxtcPB
         Jg6TmJTiosGcOJNB8EKtAyGzIsr+4PeJr5vbjYsOnR3jwaqBy8Pm9qEtieCVH4m5tyqh
         N6kg==
X-Gm-Message-State: AOAM530mJ7o6kbcI3+EJpEpSxbZmYzs0mXa8EaZBYvFeuicIRteZ6gFk
	Hd/WktByMAxUMOPWU8lpHMSk4g==
X-Google-Smtp-Source: ABdhPJz/xoOeU7o7mkOKeA4Vz21mmir7e+otTFm3+RtLWj4c0oAOY0vnMMGdv7Fc0c/CwBeFSI2Y7A==
X-Received: by 2002:a6b:1546:: with SMTP id 67mr2238502iov.182.1602852999034;
        Fri, 16 Oct 2020 05:56:39 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id 18sm1969832ilg.3.2020.10.16.05.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 05:56:38 -0700 (PDT)
Date: Fri, 16 Oct 2020 08:56:18 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ricardo Salveti <ricardo@foundries.io>
Cc: Brett Warren <brett.warren@arm.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 2/6] optee: upgraded recipes to 3.10
Message-ID: <20201016125618.GB25594@kudzu.us>
References: <8kyH.1602675228543077329.RykC@lists.yoctoproject.org>
 <CAAaKDhHbidD1RNKXPruxDF+DJT=eHjPQGXFRaHGLqJCXZ6_+3g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAaKDhHbidD1RNKXPruxDF+DJT=eHjPQGXFRaHGLqJCXZ6_+3g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 14, 2020 at 12:31:09PM -0300, Ricardo Salveti wrote:
> On Wed, Oct 14, 2020 at 8:33 AM Brett Warren <brett.warren@arm.com> wrote:
> >
> > The optee recipes were upgraded due to issues booting with 3.8
> > on qemuarm64-secureboot, which were resolved by the upgrade.
> > The 3.8 recipes are retained for backwards compatibility.
> >
> > optee-test and optee-examples were modified to pass a sysroot
> > to the LIBGCC_LOCATE_CFLAGS parameter, to ensure proper location
> > of the libgcc library.
> >
> > Recipes have been renamed to reflect their current version.
> > As this makes the PV variables redundent, these have been removed.
> 
> OP-TEE 3.11.0 should be released in a few days (if not tomorrow), so
> wonder if it would be just better to move to that revision instead?
> 
> https://github.com/OP-TEE/optee_os/pull/4101
> 
> Then we won't have to keep 3.10.0 around, as done with 3.8.0.

We can do a new patch for 3.11 when it is released, and the drop 3.8
and 3.10 after making the gatesgarth release.  Best of both worlds.
:)

Thanks,
Jon

> 
> Cheers,
> -- 
> Ricardo Salveti

> 
> 
> 

