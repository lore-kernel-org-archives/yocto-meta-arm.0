Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.9068.1591099881859195625
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Jun 2020 05:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=f7KkPp4Q;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f195.google.com with SMTP id c12so10324099qtq.11
        for <meta-arm@lists.yoctoproject.org>; Tue, 02 Jun 2020 05:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QXpf0GKGuNyqICQiM6cxIRduu9MY4MEPiNfBgPVzOHc=;
        b=f7KkPp4QztEWZzOVIofMNLfLSywlBhJoVoVp26FXls9jrmNvkjX4gmW4sxaXtnHciM
         N2CaLxzw1HQyopGBw86p3/mccUuKLoAwFqfgp9fp8GOt3sDNJvRqGcWofssSYI4gqE5z
         XntH035OJgrq0vitf+pjIVtUR8QVoCom2FrSHuGvV+azm3cqPs7u6cDaCFIN1JWyicXi
         Jk7DyoB0dPNPrOKyQNa+CLUKp4NpbTspfsG6xXQFsvqX0OhO+AQ68HW6qIrK1e2wKS7h
         E7B0/OuXKvXytQE78cF5Ne/4XCJfSovlZmEy18OlqSnZi5j8o1O+ID08tATU0h9OT0Bx
         cNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QXpf0GKGuNyqICQiM6cxIRduu9MY4MEPiNfBgPVzOHc=;
        b=a33ShrnNkBKS7/MGsFeH6AsuZRjySG/iXl3DZ3qkFjJqayQrc/uW5NsnpcxgkTXWy9
         K6+I4wlZp3S8gc+PDL7z+kz5a9wvz/i4Y8ZU3vLe482yqvWAqnvptvUVlnHAAGNQRSzg
         yzwQiN9A5kXeAD1I7O4hdvxI0Ovt7KPCLclS/HFIdqjNTwS35r6I2TwtMdYvGHESj/yO
         vO0XuSPQIih/7zYpRfIb9LwSzd4qJmTAidLCVXn/9H+I+bmslOoTOXN7bVrQHfuoIvkM
         8OZU9X9RQVbNxt3vREn6FlPJMKCkodcQTLVF8zlWcgwphse7feDt5cnC+3vZAmar55ie
         wgNw==
X-Gm-Message-State: AOAM532LJTpneXx0Wu+8uQhTO//bPzm1/OE/yLSp/WLNyaAqxABaMgqj
	70DdO/EZsiovdBR03D6we+YeQi4SvLs=
X-Google-Smtp-Source: ABdhPJzmVNDQ5nRsD76Ha7YE26nPF5gQZXpMzcMp8gfKe7mzBmSwyPp0hrWtM0bgn+DAmPah8y0i+g==
X-Received: by 2002:ac8:7c8e:: with SMTP id y14mr27823394qtv.365.1591099880896;
        Tue, 02 Jun 2020 05:11:20 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:40d9:962b:46e7:a335])
        by smtp.gmail.com with ESMTPSA id c66sm2122406qkd.5.2020.06.02.05.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 05:11:20 -0700 (PDT)
Date: Tue, 2 Jun 2020 08:11:18 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH v2] arm-toolchain: merge binary toolchain recipes
Message-ID: <20200602121117.GA17992@kudzu.us>
References: <20200602000545.25028-1-jdmason@kudzu.us>
 <8876.1591081059371861619@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <8876.1591081059371861619@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 01, 2020 at 11:57:39PM -0700, Diego Sueiro wrote:
> 
> > diff --git
> > a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host.inc
> > b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host.inc
> > new file mode 100644
> > index 0000000..332ffab
> > --- /dev/null
> > +++
> > b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host.inc
> > @@ -0,0 +1,26 @@
> > +S = "${WORKDIR}/${BPN}-${PV}"
> 
> As @Ross mentioned, this is already the default value for the S variable.

I still saw it in the Poky tree.  So, I thought it okay to keep in.
See meta/recipes-extended/logrotate/logrotate_3.16.0.bb:S = "${WORKDIR}/${BPN}-${PV}"

I'll remove it and do a v3.

Thanks,
Jon

> 
> > +
> > +COMPATIBLE_HOST = "x86_64.*-linux"
> > +
> > +FILES_${PN} = "${datadir} ${bindir}"
> > +
> > +BINNAME = "${@d.getVar("BPN").strip("gcc-")}"
> > +
> > +do_install() {
> > +    install -d ${D}${datadir}/${BINNAME}/
> > +    cp -r ${S}/. ${D}${datadir}/
> > +
> > +    install -d ${D}${bindir}
> > +    # Symlink all executables into bindir
> > +    for f in ${D}${datadir}/${BINNAME}/bin/${BINNAME}-*; do
> > +        lnr $f ${D}${bindir}/$(basename $f)
> > +    done
> > +}
> > +
> > +INSANE_SKIP_${PN} = "already-stripped libdir staticdev file-rdeps"
> > +
> > +INHIBIT_SYSROOT_STRIP = "1"
> > +INHIBIT_PACKAGE_STRIP = "1"
> > +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> > -- 
> > 2.20.1
> > 
> >

> 

