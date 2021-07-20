Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.8805.1626792073479417665
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Jul 2021 07:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=SJ5NLois;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id v14so15484442qtc.8
        for <meta-arm@lists.yoctoproject.org>; Tue, 20 Jul 2021 07:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7t4mh3zFSLsMSuMTBxIcynoOZ7cTnmnObzcqw7uzZXU=;
        b=SJ5NLois5RQtjQ+orpx7pkPPuhVfi3tJ8fbkTRWCiyrFkrM+sbfxPEhg8jHeAaZ6zL
         avlL7IPch35RxP5Xe2eaB2+N6hVo3zOAuh97z/a4OHTZB1o1CNlJm+tr7KxLvTHx+0+Q
         YAatBuqmXXzX+M3UqCO56oXKoFjMeIE3q7LNTUFrvM5HghuFCzA2h0wojtNTTtU6QhHj
         wa5pYgT1ogm/W3HVAjlArp03SNSQcD4lYHVxogWoS1MPLFvZ1Db8wB/aOZiQSEeZK4On
         78lUwJ1VuIgdPhfEhKc21L2zoTicxuN0s33WlCIoJyUZAycBIvaDyIk/G3DN3Izpz/+r
         F2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7t4mh3zFSLsMSuMTBxIcynoOZ7cTnmnObzcqw7uzZXU=;
        b=qej4jx56+vTc+5ljGc/TZ4j8ci7mMege7WP+q0G+KMCmdpQ1VZ0xb0a6OzVzv/cwda
         8L9s77W6ibgzISMqSzrfglz6HiI3JzIUJ0jQ/2WHtSgBsChLJyEcRkNlKm5puXiY4U5u
         Y8S3F/b9kGvg5zYrgrzlFlUQXOZTlsZTM4o6YpYe20wUBsYkUDLwx+amHYJ6TTj4NOVm
         9mJcqsBIGCM/BqQGuoyKVxfk88ZaJtul66pdZhEclXVQX82qwXU16yGSes2oR0IkAkZk
         /RSJORbA/2wZkudp373IlQDDIDU5L0pkwY7H4+6pasGrPshdyUz3pr1QRgOMkeKmt+md
         /V0A==
X-Gm-Message-State: AOAM5303lxgRhnYS1eAfo/UF3X651I+Y1U5s/I6kGZMJP4XBK0EZM7uz
	X6kyc+oezoLnIdxzg5RnhI7kWA==
X-Google-Smtp-Source: ABdhPJxeWFafKh5baxpaD7kmf8MIJA8qMYAMt5pdv3lugJUU3NX82fnNFg04eNJ4BIjBvMR5C43Nwg==
X-Received: by 2002:ac8:548a:: with SMTP id h10mr19017787qtq.89.1626792072655;
        Tue, 20 Jul 2021 07:41:12 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a632:4e00:4501:8ba5:56cb:d402])
        by smtp.gmail.com with ESMTPSA id n124sm2097624qkf.119.2021.07.20.07.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 07:41:12 -0700 (PDT)
Date: Tue, 20 Jul 2021 10:41:10 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Patch Tracking <patches@linaro.org>
Subject: Re: [meta-arm] [PATCH] arm/qemuarm64-secureboot: Enable kernel TEE drivers
Message-ID: <20210720144110.GA16077@kudzu.us>
References: <20210519074044.3376104-1-sumit.garg@linaro.org>
 <20210520152511.GA12500@kudzu.us>
 <CAFA6WYNYxagBS15HKGPnJSz=ZOubp7XrM6_g659cYCSmViBWYw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFA6WYNYxagBS15HKGPnJSz=ZOubp7XrM6_g659cYCSmViBWYw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 20, 2021 at 11:24:21AM +0530, Sumit Garg wrote:
> On Thu, 20 May 2021 at 20:55, Jon Mason <jdmason@kudzu.us> wrote:
> >
> > On Wed, May 19, 2021 at 01:10:44PM +0530, Sumit Garg wrote:
> > > Add a config fragment to enable kernel TEE drivers.
> > >
> > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> >
> > Added to master branch
> >
> 
> Thanks Jon, can you apply this to the hardknott branch as well?

I had to rework it a little, due to the zone dma hacks ever changing.
It's in hardknott-next branch and I'll push after it passes CI.

Thanks,
Jon

> 
> -Sumit
> 
> > Thanks,
> > Jon
> >
> > > ---
> > >  meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg      | 10 ++++++++++
> > >  .../recipes-kernel/linux/linux-yocto_5.10.bbappend     |  5 ++++-
> > >  2 files changed, 14 insertions(+), 1 deletion(-)
> > >  create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg
> > >
> > > diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg b/meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg
> > > new file mode 100644
> > > index 0000000..3de03bf
> > > --- /dev/null
> > > +++ b/meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg
> > > @@ -0,0 +1,10 @@
> > > +CONFIG_HW_RANDOM_OPTEE=y
> > > +CONFIG_TEE=y
> > > +
> > > +#
> > > +# TEE drivers
> > > +#
> > > +CONFIG_OPTEE=y
> > > +CONFIG_OPTEE_SHM_NUM_PRIV_PAGES=1
> > > +# end of TEE drivers
> > > +
> > > diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
> > > index b9995e0..3c3d36a 100644
> > > --- a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
> > > +++ b/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
> > > @@ -14,4 +14,7 @@ SRC_URI_append_qemuarm64-sbsa = " \
> > >      "
> > >
> > >  FILESEXTRAPATHS_prepend_qemuarm64-secureboot = "${ARMFILESPATHS}"
> > > -SRC_URI_append_qemuarm64-secureboot = " file://zone_dma_revert.patch"
> > > +SRC_URI_append_qemuarm64-secureboot = " \
> > > +    file://zone_dma_revert.patch \
> > > +    file://tee.cfg \
> > > +    "
> > > --
> > > 2.25.1
> > >
> >
> > >
> > > 
> > >
> >
