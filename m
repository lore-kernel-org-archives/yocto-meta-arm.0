Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web10.34755.1610375701361513577
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 Jan 2021 06:35:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=o7BMCvEt;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.174, mailfrom: jdmason@kudzu.us)
Received: by mail-il1-f174.google.com with SMTP id q1so18583521ilt.6
        for <meta-arm@lists.yoctoproject.org>; Mon, 11 Jan 2021 06:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Xm5Y1mLw5DYu9jzbPzshFjeleknHqYT4GkD119aGJGk=;
        b=o7BMCvEtVG1667/qiUr+A49LSCJgvmrS0+VwhPyfrrxTnGZc7L1Jdabx3ixGDlGS5l
         sW1GfP0lCEjz2C4AEEuE4pHqru1+Faq6NDwIBqYG75S77JUwfZY1hCUO4EpRbGn/GGKi
         sFmLEa71BXBfGj0L2ek60Euz2zvz8FtB9L+wuc1Ye2/389hH8hp+ONzkGR1evtQal07W
         j81GKxC+INlCJcRDaiKhS3TcyrmMI9T9BlZB4j3qfUbm+K6RX/Oj4ANJVG+Pv5/Zq6CO
         esOWEf361tciBA6HP8ceqsLgl1KrwVLJDQna0Ga4zM2ybh5kUpWnL0Xvm0CHUkwhO/a5
         0dWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Xm5Y1mLw5DYu9jzbPzshFjeleknHqYT4GkD119aGJGk=;
        b=gVxeBjP3rejQGt4YSuWrRH5/509hhkh/2bnMFLCiSgjj805oNFq3YfX3nQatUdv3ZO
         iC9fZqMKmZoOxuY3Z/9d108jRos67IlqGDIHQNMwBYrlPhXUDbigKZiqHAzNclYJB46L
         iX7fFNYqllosHt6iqNpfVzWil3EPqtSrvsLVeLhruG4z6GGOrEo9/HYy+HCkbjYtvg/C
         BNjZXsctWsLvW9Xo0lfTn33YXsDdVROjym3a+L7ADfrXPuS5eHVH3qGLRXS4hTRfbb38
         Hfohk3Ccw3Z7PJCR/7rakZY0kMRcH0UxSJv2rcok+JxNP032iZol9VPmutyTnV5aPSCL
         e6wQ==
X-Gm-Message-State: AOAM531wbvy49TSaL2WuSxXOCU98WUr/FEoApZlvDChg/pUh8CUoPjJI
	WhhuklT9aL3Xoc9HqGEQ3HhC8w==
X-Google-Smtp-Source: ABdhPJx1oB/YfkAwxKjayqInkaosAX2Z3OOWKMGiZn/P+VjiW6OIml+5bOJGSqdyouxM0bZV3gbGHA==
X-Received: by 2002:a05:6e02:118b:: with SMTP id y11mr15073986ili.45.1610375700733;
        Mon, 11 Jan 2021 06:35:00 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:e94c:b6f1:fb48:cecb])
        by smtp.gmail.com with ESMTPSA id w17sm10947321iom.7.2021.01.11.06.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 06:35:00 -0800 (PST)
Date: Mon, 11 Jan 2021 09:34:58 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 2/4] arm-autonomy/juno-image-customization: add host wks file
Message-ID: <20210111143458.GA792@kudzu.us>
References: <90485e9b687301d35fb7467668b1c429b98fb999.1606996678.git.diego.sueiro@arm.com>
 <24569.1610103498877014602@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <24569.1610103498877014602@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 08, 2021 at 02:58:18AM -0800, Diego Sueiro wrote:
> Hi Jon,
> 
> Can you please backport this patch to gatesgarth?

Done.  I had to include "arm-autonomy/arm-autonomy-host-image-minimal:
Added multiconfig support" for these to be applied cleanly.

Thanks,
Jon

> 
> Cheers,
> Diego Sueiro
> 
> On Thu, Dec  3, 2020 at 12:01 PM, Diego Sueiro wrote:
> 
> >
> > From: Kamil Dziezyk <kamil.dziezyk@arm.com>
> > 
> > This patch also appends 'wic wic.gz wic.bmap' images,
> > to IMAGE_FSTYPES.
> > 
> > WKS file contains two partition entries:
> >  * first is rootfs partition
> >  * second is empty partition (4 GiB by default)
> > 
> > Issue-Id: SCM-1520
> > Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
> > Change-Id: Ic0c79ee5eb4b08ad8f9c133b267feda1c85519a3
> > ---
> >  .../conf/machine/juno-extra-settings.inc      | 20 +++++++++++++++++++
> >  .../wic/arm-autonomy-juno-disk.wks.in         | 11 ++++++++++
> >  2 files changed, 31 insertions(+)
> >  create mode 100644
> > meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-juno-disk.wks.in
> > 
> > diff --git
> > b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-settings.inc
> > index 110865d..ec7ed35 100644
> > ---
> > a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-settings.inc
> > +++
> > b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-settings.inc
> > @@ -3,3 +3,23 @@
> >  # Juno board has 2 network interfaces, add both of them to the bridge
> >  XENGUEST_NETWORK_BRIDGE_MEMBERS ?= "eth0 eth1"
> >  XEN_DEVICETREE_DOM0_SIZE ?= "0x02400000"
> > +
> > +# We need to extend the wks search path to be able to find the wks file set
> > in
> > +# ARM_AUTONOMY_WKS_FILE.
> > +WKS_SEARCH_PATH_prepend := "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic:"
> > +
> > +ARM_AUTONOMY_WKS_FILE ?= "arm-autonomy-juno-disk.wks.in"
> > +# set wks file only if INITRAMFS_IMAGE_BUNDLE is not set
> > +WKS_FILE = "${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', '',\
> > +                                 '${ARM_AUTONOMY_WKS_FILE}', d)}"
> > +
> > +# Set the wks guest partition size and unit. It must be aligned with the sum
> > of
> > +# all XENGUEST_IMAGE_DISK_SIZE set for the guests. By default, LVM2 metadata
> > is
> > +# 1 MiB per physical volume, hence it needs to be taken into account when
> > +# setting GUEST_PART_SIZE. The XENGUEST_IMAGE_DISK_SIZE default value is
> > 4GiB.
> > +GUEST_PART_SIZE ?= "4097"
> > +GUEST_PART_SIZE_UNIT ?= "M"
> > +
> > +# set wic image type only if INITRAMFS_IMAGE_BUNDLE is not set
> > +IMAGE_FSTYPES += "${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', '',\
> > +                                       'wic wic.gz wic.bmap', d)}"
> > diff --git
> > b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-juno-disk.wks.in
> > new file mode 100644
> > index 0000000..5c5b24a
> > --- /dev/null
> > +++
> > b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-juno-disk.wks.in
> > @@ -0,0 +1,11 @@
> > +# short-description: Create a disk image
> > +# long-description: Creates a partitioned disk image that the user
> > +# can directly dd to boot media.
> > +
> > +# For Juno first partition is rootfs normally populated as /dev/sda1
> > +part / --source rootfs --ondisk sda --fstype=ext4 --label root --align 1024
> > +
> > +# Second partition to accomodate guests images normally populated as
> > /dev/sda2 (used by XENGUEST_MANAGER_VOLUME_DEVICE)
> > +part --label guests --source empty --ondisk sda
> > --size="${GUEST_PART_SIZE}${GUEST_PART_SIZE_UNIT}" --system-id 8e --align 1024
> > +
> > +bootloader --ptable msdos
> > -- 
> > 2.17.1
> > 
> >

> 
> 
> 

