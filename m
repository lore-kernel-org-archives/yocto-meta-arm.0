Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.3489.1588780903255698092
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 May 2020 09:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=UQ8sTo0+;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f177.google.com with SMTP id z90so1773663qtd.10
        for <meta-arm@lists.yoctoproject.org>; Wed, 06 May 2020 09:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+lpZGwGB0l97mNzaLkPfx8GgOsYTiaUFE8QFHZlOLf4=;
        b=UQ8sTo0+awKIYn2sfzaUr9bdkjkplBvvCEkKLo8O0RR0ZVEkOTCfZoezs4qrhGC9ML
         AsGXWEZcg/fQkbJCHCq0+htRPn8Smaox6eo7k/Ss0Mjm4XuE9q+kfSYg32m1YIjaMGjq
         3z+aFpA0TzbZz426QLomiPXGfgqv3uavKZQ/0RKv7O0gN04/wg8licAec0kHXxWjyY8V
         et6MtfcCBxbWTu6WfiawSZU+bbgZ6jcLltgIJcqeksE0t2hn8xeQ80uwXb6+SsWctrp/
         4yaCjiPSFV209pJJ6osP+xJYuMHDFp/+7hmFSQRNPdVZVMTmv+MugwM5OKrXR8iogm8A
         l6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+lpZGwGB0l97mNzaLkPfx8GgOsYTiaUFE8QFHZlOLf4=;
        b=B3nMG9QuloniNG1dMZe7XZtGQaAk7tRpoHMZ7tyHZJIb9JhFd3NvxrHSi14Oi+ofOf
         xnRl6Spw9dg3kKEGz05Q4sHYpo52dzMJ2yjfQsZrcSevuCibI1ua9JOix+YKKidnu65l
         JxlhFl//JCDSUpAdBd11Rfawb7NEaCANSPFMzz27mO1jh+pYcHkjYfRVl/MCWp+LeqUE
         nKCpGeXbbUmji3vx9hitxtrypjtlkd4xHj20WaLbzQBbuNR5rkvp7qmDNY8MJuuY+a28
         imTVI65Ungom6Y6LPd3ubRf1qK0b2GrWMSgQ+/hhlnJDHiRgM4GO6s3kgqqsn204ggXr
         1zMg==
X-Gm-Message-State: AGi0PuahOxw+5TSoeIPoPtJlZu2vwbKaAfZ1J90qjMibdvbCk5y6oQ+w
	lkfA2AhpOYQ2aCZhDjhyGybHATv7pRjBPg==
X-Google-Smtp-Source: APiQypJwZ9I2rwt6sjCQ8BNa/WNhALGF4OsKXtppHXSQ1n8cIB5r4zOd83kihlimsKYRKZnWOmReyw==
X-Received: by 2002:ac8:2bfd:: with SMTP id n58mr9014189qtn.296.1588780899253;
        Wed, 06 May 2020 09:01:39 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:1068:4212:6fd:289b])
        by smtp.gmail.com with ESMTPSA id k43sm1951039qtk.67.2020.05.06.09.01.39
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 09:01:39 -0700 (PDT)
Date: Wed, 6 May 2020 12:01:37 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] [arm-bsp] firmware-image-juno: Fix dependency loop
Message-ID: <20200506160137.GG22996@kudzu.us>
References: <1588338922-58454-1-git-send-email-diego.sueiro@arm.com>
 <74EE0ABB-3B22-4930-8B71-BC9C746B1AAA@arm.com>
MIME-Version: 1.0
In-Reply-To: <74EE0ABB-3B22-4930-8B71-BC9C746B1AAA@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 01, 2020 at 02:02:49PM +0000, Bertrand Marquis wrote:
> 
> 
> > On 1 May 2020, at 14:15, Diego Sueiro via lists.yoctoproject.org <diego.sueiro=arm.com@lists.yoctoproject.org> wrote:
> > 
> > Kernel binaries copying have to be performed in the do_deploy task to
> > avoid dependency loop between firmware-image-juno do_install and
> > virtual/kernel do_deploy when INITRAMFS_IMAGE_BUNDLE is set.
> > 
> > Also, copy the kernel image bundled with initramfs to the firmware
> > image when INITRAMFS_IMAGE_BUNDLE is set.
> > 
> > Change-Id: I66083d294ab4eb77c643ec33cc1333000373125b
> > Issue-Id: SCM-987
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Pulled into the master branch.

Thanks,
Jon

> 
> > ---
> > .../recipes-bsp/images/firmware-image-juno.bb      | 27 +++++++++++++++-------
> > 1 file changed, 19 insertions(+), 8 deletions(-)
> > 
> > diff --git a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
> > index 9be4005..b0ad14f 100644
> > --- a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
> > +++ b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
> > @@ -29,6 +29,8 @@ inherit deploy nopackages
> > do_configure[noexec] = "1"
> > do_compile[noexec] = "1"
> > 
> > +# The ${D} is used as a temporary directory and we don't generate any
> > +# packages for this recipe.
> > do_install() {
> >     cp -a ${WORKDIR}/${UNPACK_DIR} ${D}
> >     cp -f ${RECIPE_SYSROOT}/firmware/bl1-juno.bin \
> > @@ -37,13 +39,6 @@ do_install() {
> >     cp -f ${RECIPE_SYSROOT}/firmware/fip-juno.bin \
> >         ${D}/${UNPACK_DIR}/SOFTWARE/fip.bin
> > 
> > -    for f in ${KERNEL_DEVICETREE}; do
> > -        install -m 755 -c ${DEPLOY_DIR_IMAGE}/$(basename $f) \
> > -            ${D}/${UNPACK_DIR}/SOFTWARE/.
> > -    done
> > -
> > -    cp -L -f ${DEPLOY_DIR_IMAGE}/Image ${D}/${UNPACK_DIR}/SOFTWARE/
> > -
> >     # u-boot environment file
> >     cp -f ${WORKDIR}/uEnv.txt ${D}/${UNPACK_DIR}/SOFTWARE/
> > 
> > @@ -52,13 +47,29 @@ do_install() {
> >     cp -f ${WORKDIR}/images-r1.txt ${D}/${UNPACK_DIR}/SITE1/HBI0262C/images.txt
> >     cp -f ${WORKDIR}/images-r2.txt ${D}/${UNPACK_DIR}/SITE1/HBI0262D/images.txt
> > }
> > -do_install[depends] += "virtual/kernel:do_deploy"
> > 
> > do_deploy() {
> > +    # To avoid dependency loop between firmware-image-juno:do_install
> > +    # and virtual/kernel:do_deploy when INITRAMFS_IMAGE_BUNDLE = "1",
> > +    # we need to handle the kernel binaries copying in the do_deploy
> > +    # task.
> > +    for f in ${KERNEL_DEVICETREE}; do
> > +        install -m 755 -c ${DEPLOY_DIR_IMAGE}/$(basename $f) \
> > +            ${D}/${UNPACK_DIR}/SOFTWARE/.
> > +    done
> > +
> > +    if [ "${INITRAMFS_IMAGE_BUNDLE}" -eq 1 ]; then
> > +        cp -L -f ${DEPLOY_DIR_IMAGE}/Image-initramfs-juno.bin \
> > +            ${D}/${UNPACK_DIR}/SOFTWARE/Image
> > +    else
> > +        cp -L -f ${DEPLOY_DIR_IMAGE}/Image ${D}/${UNPACK_DIR}/SOFTWARE/
> > +    fi
> > +
> >     # Compress the files
> >     tar -C ${D}/${UNPACK_DIR} -zcvf ${WORKDIR}/${PN}.tar.gz ./
> > 
> >     # Deploy the compressed archive to the deploy folder
> >     install -D -p -m0644 ${WORKDIR}/${PN}.tar.gz ${DEPLOYDIR}/${PN}.tar.gz
> > }
> > +do_deploy[depends] += "virtual/kernel:do_deploy"
> > addtask deploy after do_install
> > -- 
> > 2.7.4
> > 
> > 
> 

> 

