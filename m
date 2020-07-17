Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.10857.1594991650990121904
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 17 Jul 2020 06:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=01botEQy;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f194.google.com with SMTP id k18so7505644qtm.10
        for <meta-arm@lists.yoctoproject.org>; Fri, 17 Jul 2020 06:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=O9NjsKETwUWIk66kFO9ksQ+TLp45SLVAr9Xbv5ve1RA=;
        b=01botEQyPiYc/W8jZ0O43+K+5/CmYla9pJCR53kEb/K564ky8yk81e6P44kWmYMQ8w
         0u8yKvWCsbTQOFBnOtsTGSXT8kXrOYl93EhaIUgEss2N2rEWBnVH1Baoy/jt+fXrU4PF
         U20VwcFSKhUDugkphWLEgnbkHFDE8OfrBtwPVJ8TySp7V2QV0vEINGrw3ZiVGYE3Dcuq
         IJsJfDdDiEzUPf3HL/ddzLLu0TK4bmdal8YHOgaAlf/jPvYuU1LM/JsrseIrC/5bVOuN
         3IyxokhP3gEMAdVveiVIkvxhTb0aVnRBWBSDMpuWbOZazqxubzKDmncmC5U4hOhOck4a
         90Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=O9NjsKETwUWIk66kFO9ksQ+TLp45SLVAr9Xbv5ve1RA=;
        b=kkkTg3Vs6nDrGis3SQ/VbF25m5qqKzu3Etpf5Vfm8aNZ0CgawF8ZkMilyhldD0gnFz
         weLnLED2Kf5E8J/WVIEuzXILV9ZazY/hB/LOBqnH2PpunAvg/hCV35MDtMK3IRPUauoG
         b/oTUutLUsUbn4B3SgtdBPfa740TeK3HqRdkiAXWf6n/CzJqjrGE54RvHUZrBa693rrV
         TI6nWnh3TFoqQpwkut5rGZgWBTWezCorY968nK2Q4z7LFazq1sP88O05bKY1rG0TJ07I
         nM0BRp0hn+gIVA+PFYOEuKhhBimEHU/YYuEiRhfQihjlQDflSyI0zDZFHJsU3OTgqljS
         qCLQ==
X-Gm-Message-State: AOAM533IaHZ526HNkxfCq81KwM0jd20gvg3/qGYimm0XTbggcexCAxgJ
	jv/DGWn5joMK6C0ynp3JcbC3DA==
X-Google-Smtp-Source: ABdhPJwPfWzh90Hc8PMlC/s2eSjllfzZjGpbXXKjk1tdsOMnzs+r7Gl5TQjU4/TjGN2X0xH+ykaKHQ==
X-Received: by 2002:ac8:444c:: with SMTP id m12mr10628625qtn.281.1594991650142;
        Fri, 17 Jul 2020 06:14:10 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:8034:b667:f1cd:123f])
        by smtp.gmail.com with ESMTPSA id d135sm9898528qkg.117.2020.07.17.06.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 06:14:09 -0700 (PDT)
Date: Fri, 17 Jul 2020 09:14:08 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Diego Sueiro <Diego.Sueiro@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-autonomy/qemu: Install qemu-system-i386 instead of qemu-xen
Message-ID: <20200717131407.GB26434@kudzu.us>
References: <1594906650-4962-1-git-send-email-diego.sueiro@arm.com>
 <9FF75369-59E1-4195-8E60-E64395175857@arm.com>
MIME-Version: 1.0
In-Reply-To: <9FF75369-59E1-4195-8E60-E64395175857@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 16, 2020 at 01:57:08PM +0000, Bertrand Marquis wrote:
> 
> 
> > On 16 Jul 2020, at 15:37, Diego Sueiro via lists.yoctoproject.org <diego.sueiro=arm.com@lists.yoctoproject.org> wrote:
> > 
> > This patch cleans the qemu_%.bbappend and uses the already provided
> > qemu-system-i386 package from meta-virtualization to include only the
> > /usr/bin/qemu-system-i386 binary.
> > 
> > Change-Id: I6f1fc4db458d0b09c54013c1512398521cb349e2
> > Issue-Id: SCM-889
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Applied to master.

Thanks,
Jon

> 
> > ---
> > .../recipes-core/images/arm-autonomy-host-image-minimal.bb   |  2 +-
> > meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend      | 12 +++---------
> > 2 files changed, 4 insertions(+), 10 deletions(-)
> > 
> > diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
> > index 5b20fa0..9731c7c 100644
> > --- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
> > +++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
> > @@ -39,7 +39,7 @@ ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS ??= ""
> > IMAGE_INSTALL += " \
> >     packagegroup-core-boot \
> >     packagegroup-core-ssh-openssh \
> > -    qemu-xen \
> > +    qemu-system-i386 \
> >     xenguest-manager \
> >     xenguest-network-bridge \
> >     "
> > diff --git a/meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend b/meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend
> > index ed63a4e..dbd89aa 100644
> > --- a/meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend
> > +++ b/meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend
> > @@ -6,13 +6,7 @@ OVERRIDES_append = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ':xen', '', d
> > QEMU_TARGETS_xen = "i386"
> > 
> > PACKAGECONFIG[noaudio] = "--audio-drv-list='',,"
> > -PACKAGECONFIG_append_xen = " virtfs noaudio"
> > -PACKAGECONFIG_remove_xen = "sdl"
> > +PACKAGECONFIG_append_xen = " noaudio"
> > +PACKAGECONFIG_remove_xen = "fdt sdl kvm"
> > 
> > -# Reduce the qemu package size by splitting it into
> > -# qemu and qemu-xen packages
> > -PACKAGES_prepend_xen := "${PN}-xen"
> > -RDEPENDS_${PN}_xen += "${PN}-xen"
> > -FILES_${PN}-xen_xen = "${bindir}/qemu-system-i386"
> > -RDEPENDS_${PN}-xen_xen += "xen-tools-libxenstore xen-tools-libxenctrl \
> > -    xen-tools-libxenguest"
> > +require ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'recipes-devtools/qemu/${BPN}-package-split.inc', '', d)}
> > -- 
> > 2.7.4
> > 
> > 
> 

> 

