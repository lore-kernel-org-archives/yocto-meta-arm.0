Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.1034.1587667161799721804
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Apr 2020 11:39:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=OQj+p/M8;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f194.google.com with SMTP id i68so5740533qtb.5
        for <meta-arm@lists.yoctoproject.org>; Thu, 23 Apr 2020 11:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HhDFtK6GJWpahgbxh8RQ7GMi4JRMJ+eRWenC9zM+VcI=;
        b=OQj+p/M8MWaS0TLfYfktobekXdemzDcWWl5fed/3wLE8VJgc3wD5Wx/UvwZxExHxva
         /pW39Au5HTlWaTF9V6Jto1suNyF4bySEmR9mCVldPImoLDIXpHBOnFcazI4L3m/wsBHr
         l6PgebyOCwBHVeULIr91ZgjmitcxWZYTXqpvVp2Gnr6rgmwERaRcQFD4I0dY6m5kq5AO
         eH/hRxDR1PJ0nxeX1cT6chOq93PVToNOEJ2BKjzMFDQb+fq5+CqnJVPWuqk2LvsaFQWe
         1M2eKPQXOkGOUYzLKm/UzyqgUJCddYpWrext2m7Y+q3A+uee4dB+GxEnnba0RIaAUxnt
         lRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HhDFtK6GJWpahgbxh8RQ7GMi4JRMJ+eRWenC9zM+VcI=;
        b=ki9giXE2UNP351ERAE4zKryTB641m71xnpRc4Zgz+8BG6fc7OQTNCfB4zg8dr+eFKC
         UBgTyp8jr5z7SboMu0M6d80pA5E8Qbx7y3QVLxz1fh/VVlyz0EyxruL8PwUSE1qv7/+A
         UbIVKqpqLHYceFi32PWfHv83xn14bC2FA0QaaBBGdm7XZtyXYOBFIRXw9xlvAVmgj3Vs
         wU71t61PnAfoaFOlLclyvcro5bcS5RnPQiK0S7uRqwmm58XrLyVmX5qOZdNXm1/C0Gb/
         Zjm+VBqB9fAL0dzchglIv00bye/LEI4f6ngA7qqFHnsJR/fDpfOWi6eGrTWxuUtjWSUN
         x+Dg==
X-Gm-Message-State: AGi0PuaqvBj5AunSnuOK3KnFb0iyyhOT8XZENjMXO5m9n071XSc1g4Hx
	Fi1Ik0lNo7ek2/zKKreaTIOLCdQOdzJD0Q==
X-Google-Smtp-Source: APiQypI3dO4l5XSJc94frwcGHJY5ScHie2igCjUuGV1Wrxn+sf6zWX/IWebNgb5yR9QYlxqSxfgfDg==
X-Received: by 2002:ac8:46d1:: with SMTP id h17mr5548878qto.72.1587667160710;
        Thu, 23 Apr 2020 11:39:20 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:edac:c155:63cc:6f2d])
        by smtp.gmail.com with ESMTPSA id t14sm2239242qtj.71.2020.04.23.11.39.19
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 11:39:20 -0700 (PDT)
Date: Thu, 23 Apr 2020 14:39:18 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] arm-autonomy: Fix circle dependency in xen-dtb
Message-ID: <20200423183917.GB19884@kudzu.us>
References: <20200421104856.4389-1-bertrand.marquis@arm.com>
 <AM0PR08MB3987291AE40A77D06E8C4D2C92D50@AM0PR08MB3987.eurprd08.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <AM0PR08MB3987291AE40A77D06E8C4D2C92D50@AM0PR08MB3987.eurprd08.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 21, 2020 at 10:52:28AM +0000, Diego Sueiro wrote:
> > -----Original Message-----
> > From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> > On Behalf Of Bertrand Marquis via lists.yoctoproject.org
> > Sent: 21 April 2020 11:49
> > To: meta-arm@lists.yoctoproject.org
> > Cc: nd <nd@arm.com>
> > Subject: [meta-arm] [PATCH 1/2] arm-autonomy: Fix circle dependency in
> > xen-dtb
> > 
> > Solve circle dependency in xen-devicetree when initramfs is activated as
> > compile depends on kernel:do_deploy and xen-devicetree is needed to
> > create the arm-autonomy-host-image-minimal.
> > Move all actions in do_deploy so that only do_deploy depends on the kernel
> > do_deploy.
> > 
> > Change-Id: I011df8f225550afa71b18a88e0ebe01debca0bed
> > Issue-Id: SCM-949
> > Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

Series pulled into the master branch.

Thanks,
Jon

> 
> > ---
> >  .../xen-devicetree/xen-devicetree.bb          | 24 +++++++++++--------
> >  1 file changed, 14 insertions(+), 10 deletions(-)
> > 
> > diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-
> > devicetree.bb b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-
> > devicetree.bb
> > index 0bb9def..cef5f79 100644
> > --- a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-
> > devicetree.bb
> > +++ b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-
> > devicetree.b
> > +++ b
> > @@ -29,7 +29,14 @@ inherit nopackages deploy
> > 
> >  DEPENDS += "dtc-native"
> > 
> > -do_compile() {
> > +do_configure[noexec] = "1"
> > +do_compile[noexec] = "1"
> > +do_install[noexec] = "1"
> > +
> > +do_deploy() {
> > +    if [ ! -f ${WORKDIR}/xen.dtsi.in ]; then
> > +        die "xen.dtsi.in does not exist"
> > +    fi
> >      cat ${WORKDIR}/xen.dtsi.in \
> >          | sed -e
> > "s,###XEN_DOM0_BOOTARGS###,${XEN_DEVICETREE_DOM0_BOOTARGS},"
> > \
> >          | sed -e
> > "s,###XEN_XEN_BOOTARGS###,${XEN_DEVICETREE_XEN_BOOTARGS}," \
> > @@ -47,22 +54,19 @@ do_compile() {
> > 
> >          # Add external includes
> >          for inc in ${XEN_DEVICETREE_DTSI_MERGE}; do
> > +            if [ ! -f ${WORKDIR}/${inc} ]; then
> > +                die "Wrong file in XEN_DEVICETREE_DTSI_MERGE:
> > ${WORKDIR}/${inc} does not exist"
> > +            fi
> >              echo "/include/ \"$inc\"" >> ${WORKDIR}/dom0-linux.dts
> >          done
> > 
> >          rdtbnoextn=`basename $dtbf ".dtb"`
> >          dtc -I dts -O dtb \
> >              -o ${WORKDIR}/${rdtbnoextn}-xen.dtb ${WORKDIR}/dom0-linux.dts
> > -    done
> > -}
> > -do_compile[depends] += "${XEN_DEVICETREE_DEPEND}"
> > -
> > -do_deploy() {
> > -    # install generated dtbs
> > -    for dtbf in ${XEN_DEVICETREE_DTBS}; do
> > -        rdtbnoextn=`basename $dtbf ".dtb"`
> >          install -m 644 ${rdtbnoextn}-xen.dtb ${DEPLOYDIR}/.
> >      done
> >  }
> > +do_deploy[depends] += "${XEN_DEVICETREE_DEPEND}"
> > +
> > +addtask deploy after do_install
> > 
> > -addtask deploy before do_build after do_compile
> > --
> > 2.17.1
> 

> 

