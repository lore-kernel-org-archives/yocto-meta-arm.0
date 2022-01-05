Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C1FC433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 18:20:20 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web08.4473.1641406818572988918
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Jan 2022 10:20:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=G/hNJq/f;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.45,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f45.google.com with SMTP id r6so38297610qvr.13
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Jan 2022 10:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gMtZAsjeO9pZS/v3eUqUS4faMVDnnAasdJ5TQ3GcjLY=;
        b=G/hNJq/fxleGi5roi5UVlNtArktIR7JwGrPjQKQ52sVRIg8xo2NWI/jgoc7hmHKylh
         uBkBh1YBAtz5ndUJbOnuAShIhwH1pcXK5gcoEO3jtJndlM3cyU0qh9Gl3e1aWVF1KH0H
         IbOf7Jxv2LmFLgYInJ1WiLXyRX71LMos18v6yfrUKfMqRtvXZYUqBotI56oCn8flg+cH
         I1wJlJNOOJQRLYV7Moqj151yNrXuD8pz5egDnLzUOEEqJZ/JcwdHB4pIMhzFfs11rz1Q
         4E3n8PL6lRPbFhcGS9A/4Wr/CkbzVIe6QYEe4RPRgVimcSQtBecR7pA63QZN2lLCmsIE
         YPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gMtZAsjeO9pZS/v3eUqUS4faMVDnnAasdJ5TQ3GcjLY=;
        b=FviTMoWoYXs+T26zs5xd1bT4pHye2xortnwOjtyJahPmDeqfvvHOej7irLeoB0gU7G
         9aYLNpRQj9YaKqVjLSR7P0zOnWUIr7qLi0N9ozeYf4KyhStfQG0FuvSlmARzczH9RFSb
         GzgfLAHr1adC25v5tuwWoFFgCqUdCF4WICfMTAhzH0tMwNdzpC92vueqgAvVDwRr9pp/
         P/5fwW220rCl0clYvSzQ72daUcUmMxX78pymjSSY1XRcXNkSP/lxOcSnlKO9T7wT91bd
         HspgZN28DflnZYZ80uIg2WCqJI58EgRKKS/DGC6c/B9lnaQC5dIyuitpyLs6AJjdWKMC
         ISDQ==
X-Gm-Message-State: AOAM533Grpyl11iY6Vhm6i/yKG1WEU5RbDumAHGw7YMbKkMiRFCOMTe3
	7dWcGpLai1ExJ96sUJD0N26DfA==
X-Google-Smtp-Source: 
 ABdhPJy2IDg78XTNXNhkIalldydCh0uYQZyjGSDNwAXfUa3wmHnVwq2zOKfqgzF6HvRpLDIU/tiBZQ==
X-Received: by 2002:a05:6214:300a:: with SMTP id
 ke10mr51421250qvb.98.1641406817564;
        Wed, 05 Jan 2022 10:20:17 -0800 (PST)
Received: from kudzu.us ([2605:a601:a63c:b500:e36:844a:4b1c:4e72])
        by smtp.gmail.com with ESMTPSA id
 bq36sm35375158qkb.6.2022.01.05.10.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 10:20:17 -0800 (PST)
Date: Wed, 5 Jan 2022 13:20:15 -0500
From: Jon Mason <jdmason@kudzu.us>
To: "Jagade, Nachiket" <NachiketRahul.Jagade@honeywell.com>
Cc: Denys Dmytriyenko <denis@denix.org>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	"Sridhara Murthy, Vinay" <Vinay.SridharaMurthy@honeywell.com>,
	"Ankam, Ravindra" <Ravindra.Ankam@honeywell.com>
Subject: Re: Questions to create custom distro for TI am335x
Message-ID: <YdXhX4F9iK/yw2bo@kudzu.us>
References: 
 <BN7PR07MB4644CB07307C600A12570158854A9@BN7PR07MB4644.namprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <BN7PR07MB4644CB07307C600A12570158854A9@BN7PR07MB4644.namprd07.prod.outlook.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Jan 2022 18:20:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2798

On Tue, Jan 04, 2022 at 05:35:18AM +0000, Jagade, Nachiket wrote:
> Hello Denys,
> 
> Happy new year.
> We are working on TI am335x sitara based platform. You had replied to questions of my colleague long ago.
> We have created custom distro which is a mix of arago and poky. Reason is that when we last checked, arago distro did not had latest version of applications. And when I say application, I refer to open source packages such as python, apparmor etc.
> Also some layers were not available in arago and we had to resolve many dependencies while compiling.
> 
> Now we want to make a distro with latest versions of all required packages. So shall we go with 3.4 Honister or with latest dunfell release 3.1.13 ? Our main aim is to have latest versions of packages with less number of vulnerability count. What will you suggest to achieve this?

This is not a Arm specific question.  So, your questions are better
asked on openembedded-core@lists.openembedded.org or
yocto@lists.yoctoproject.org (or meta-arago@arago-project.org).

That being said, dunfell is the Yocto Project LTS and there is a
dunfell branch in meta-arago.  So, there should be less pain in using
that for your hybrid approach.

Thanks,
Jon


> 
> 
> Thanks and regards,
> Nachiket
> 
> 
> -----Original Message-----
> From: Denys Dmytriyenko <denis@denix.org>
> Sent: Wednesday, February 24, 2021 1:35 AM
> To: Ankam, Ravindra <Ravindra.Ankam@Honeywell.com>
> Cc: meta-arm@lists.yoctoproject.org
> Subject: [External] Re: [meta-arm] Error while building the custom image
> 
> Hi,
> 
> You seem to have a very strange combination of layers and mix of branches!
> 
> For example, is this a Poky distro or Arago? Why do you include meta-poky if DISTRO = "arago"?
> Why do you have some layers on "gatesgarth" and some on unstable "master"?
> And finally, Arago distro currently does not fully support master or gatesgarth with the external Arm toolchain, only dunfell.
> 
> --
> Denys
> 
> 
> On Tue, Feb 23, 2021 at 02:47:48PM +0000, Ankam, Ravindra via lists.yoctoproject.org wrote:
> > Hi,
> >                 Please attached the error logs.
> > Can you please help how to address this issue?
> > 
> > Thanks and regards,
> > Ravi
> 
> 
> > poky/build$ MACHINE=am335x-evm bitbake custom-base-image Loading
> > cache: 100%
> > |####################################################################################################################################| Time: 0:00:00 Loaded 4805 entries from dependency cache.
> > WARNING: No recipes in default available for:
> >   /home/airport/ravi/yocto_gatesgarth/poky/meta-arago/meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
> >   
> > /home/airport/ravi/yocto_gatesgarth/poky/meta-arago/meta-arago-distro/
> > recipes-graphics/wayland/weston_8.0.0.bbappend
> >   
> > /home/airport/ravi/yocto_gatesgarth/poky/meta-arago/meta-arago-distro/
> > recipes-support/opencv/opencv_3.1.bbappend
> > NOTE: Resolving any missing task queue dependencies
> > 
> > Build Configuration:
> > BB_VERSION           = "1.48.0"
> > BUILD_SYS            = "x86_64-linux"
> > NATIVELSBSTRING      = "ubuntu-16.04"
> > TARGET_SYS           = "arm-linux-gnueabi"
> > MACHINE              = "am335x-evm"
> > DISTRO               = "arago"
> > DISTRO_VERSION       = "2020.09"
> > TUNE_FEATURES        = "arm armv7a vfp thumb neon callconvention-hard"
> > TARGET_FPU           = "hard"
> > meta
> > meta-poky
> > meta-yocto-bsp
> > meta-custom          = "my-yocto-3.2.1:943ef2fad8428f002850e3655a3312e13d0dcb2c"
> > meta-arm
> > meta-arm-toolchain   = "gatesgarth:7185d29de9f54d2cb5b2da35b0c3f1e5f381db2c"
> > meta-clang           = "master:16f757de2d90594476d2c8feefd3a850c3c24931"
> > meta-ti              = "master:fb4726a88cbb5a6311bdb3095b81d314e344a322"
> > meta-arago-distro
> > meta-arago-extras    = "master:f90d1bed7e775ac59bf1fcd95e95e9109d0953db"
> > meta-qt5             = "master:23f7a1c8eabaf1beb80cc6214954c0e1751c4cbd"
> > meta-virtualization  = "master-next:3389eb0f128b1ef1d1aaf518afdf298a88f89619"
> > meta-networking
> > meta-python
> > meta-perl
> > meta-oe
> > meta-gnome
> > meta-multimedia
> > meta-filesystems     = "gatesgarth:cef93b7b00e620d90a610112ee574fa60b691cf8"
> > meta-tpm
> > meta-security
> > meta-security-compliance = "master:16ee7308c9fd48d69b02c5519d2e5edddc560658"
> > meta-selinux         = "gatesgarth:36db146d56535318d343dc9138358885356f2172"
> > meta-linaro
> > meta-optee           = "master:11091b487e1ad4c6a4adfac34d958a3d9d9ccd17"
> > 
> > Initialising tasks: 100%
> > |#####################################################################
> > ##########################################################| Time: 
> > 0:00:02 Sstate summary: Wanted 1003 Found 0 Missed 1003 Current 22 (0% 
> > match, 2% complete)
> > NOTE: Executing Tasks
> > ERROR: external-arm-toolchain-2019.12-r0 do_install: '_sre.SRE_Match' 
> > object is not subscriptable
> > ERROR: Logfile of failure stored in: 
> > /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/
> > work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/t
> > emp/log.do_install.22351
> > Log data follows:
> > | DEBUG: Executing python function extend_recipe_sysroot
> > | NOTE: Direct dependencies are
> > | ['virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/recip
> > | es-devtools/patch/patch_2.7.6.bb:do_populate_sysroot',
> > | 'virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/recipe
> > | s-devtools/rsync/rsync_3.2.3.bb:do_populate_sysroot',
> > | 'virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/recipe
> > | s-extended/xz/xz_5.2.5.bb:do_populate_sysroot',
> > | 'virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/recipe
> > | s-devtools/bison/bison_3.7.2.bb:do_populate_sysroot',
> > | 'virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/recipe
> > | s-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot',
> > | '/home/airport/ravi/yocto_gatesgarth/poky/meta/recipes-devtools/quil
> > | t/quilt-native_0.66.bb:do_populate_sysroot',
> > | 'virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/recipe
> > | s-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
> > | NOTE: Installed into sysroot: []
> > | NOTE: Skipping as already exists in sysroot: ['patch-native', 
> > | 'rsync-native', 'xz-native', 'bison-native', 'pkgconfig-native', 
> > | 'quilt-native', 'pseudo-native', 'texinfo-dummy-native', 
> > | 'libtool-native', 'gnu-config-native', 'gettext-minimal-native', 
> > | 'automake-native', 'flex-native', 'autoconf-native', 'attr-native', 
> > | 'acl-native', 'popt-native', 'm4-native']
> > | DEBUG: Python function extend_recipe_sysroot finished
> > | DEBUG: Executing shell function do_install 
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libanl.so.1 is a symlink of 
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libanl-2.30.so, keep it 
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libBrokenLocale.so.1 is a symlink of 
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libBrokenLocale-2.30.so, keep it 
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libc.so.6 is a symlink of 
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libc-2.30.so, keep it
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libcrypt.so.1 is a symlink of 
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libcrypt-2.30.so, keep it 
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libdl.so.2 is a symlink of 
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libdl-2.30.so, keep it
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libm.so.6 is a symlink of 
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libm-2.30.so, keep it
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libnsl.so.1 is a symlink of 
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libnsl-2.30.so, keep it 
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libnss_compat.so.2 is a symlink of 
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libnss_compat-2.30.so, keep it 
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libnss_db.so.2 is a symlink of 
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libnss_db-2.30.so, keep it 
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libnss_dns.so.2 is a symlink of 
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libnss_dns-2.30.so, keep it 
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libnss_files.so.2 is a symlink of 
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libnss_files-2.30.so, keep it 
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libnss_hesiod.so.2 is a symlink of 
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libnss_hesiod-2.30.so, keep it 
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libpthread.so.0 is a symlink of 
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libpthread-2.30.so, keep it 
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libresolv.so.2 is a symlink of 
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libresolv-2.30.so, keep it 
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/librt.so.1 is a symlink of 
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/librt-2.30.so, keep it
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libutil.so.1 is a symlink of 
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/image/lib/libutil-2.30.so, keep it
> > | rmdir: failed to remove
> > | '/home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gli
> > | bc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12
> > | -r0/image/usr/bin': Directory not empty
> > | rmdir: failed to remove
> > | '/home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gli
> > | bc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12
> > | -r0/image/usr/sbin': Directory not empty
> > | rmdir: failed to remove
> > | '/home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gli
> > | bc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12
> > | -r0/image/sbin': Directory not empty
> > | NOTE: make -j 3 HOSTCC=gcc  HOSTCPP=gcc  -E headers_install INSTALL_HDR_PATH=/home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/external-arm-toolchain-2019.12/usr
> > |   INSTALL
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/external-arm-toolchain-2019.12/usr/include
> > | mv: cannot stat
> > | '/home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gli
> > | bc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12
> > | -r0/image/usr/lib/gcc/arm-none-linux-gnueabihf': No such file or 
> > | directory
> > | WARNING: /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/temp/run.do_install.22351:415 exit 1 from 'mv /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/usr/lib/gcc/arm-none-linux-gnueabihf /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/usr/lib/gcc/arm-linux-gnueabi'
> > | WARNING: Backtrace (BB generated script):
> > |       #1: do_install, /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/temp/run.do_install.22351, line 415
> > |       #2: main,
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> > | r0/temp/run.do_install.22351, line 415
> > | ERROR: '_sre.SRE_Match' object is not subscriptable
> > ERROR: Task (/home/airport/ravi/yocto_gatesgarth/poky/meta-arm/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb:do_install) failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 242 tasks of which 239 didn't need to be rerun and 1 failed.
> > 
> > Summary: 1 task failed:
> >   
> > /home/airport/ravi/yocto_gatesgarth/poky/meta-arm/meta-arm-toolchain/r
> > ecipes-devtools/external-arm-toolchain/external-arm-toolchain.bb:do_in
> > stall
> > Summary: There was 1 WARNING message shown.
> > Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#1713): 
> > https://nam12.safelinks.protection.outlook.com/?url=https%3A%2F%2Flist
> > s.yoctoproject.org%2Fg%2Fmeta-arm%2Fmessage%2F1713&amp;data=04%7C01%7C
> > Vinay.SridharaMurthy%40Honeywell.com%7Cbb8e0988781b4c3e846408d9ce83da3
> > c%7C96ece5269c7d48b08daf8b93c90a5d18%7C0%7C0%7C637767887969200715%7CUn
> > known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW
> > wiLCJXVCI6Mn0%3D%7C3000&amp;sdata=HwaRFNz2%2Fo8OtD83YcwUngCFc17wzpX7Zk
> > P%2BFCkAgA4%3D&amp;reserved=0 Mute This Topic: 
> > https://nam12.safelinks.protection.outlook.com/?url=https%3A%2F%2Flist
> > s.yoctoproject.org%2Fmt%2F80852192%2F3617104&amp;data=04%7C01%7CVinay.
> > SridharaMurthy%40Honeywell.com%7Cbb8e0988781b4c3e846408d9ce83da3c%7C96
> > ece5269c7d48b08daf8b93c90a5d18%7C0%7C0%7C637767887969200715%7CUnknown%
> > 7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX
> > VCI6Mn0%3D%7C3000&amp;sdata=dITdALtS0RmCy4uvIPjZB6yGDMIC6NOtUq9wkrhjVH
> > E%3D&amp;reserved=0 Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: 
> > https://nam12.safelinks.protection.outlook.com/?url=https%3A%2F%2Flist
> > s.yoctoproject.org%2Fg%2Fmeta-arm%2Funsub&amp;data=04%7C01%7CVinay.Sri
> > dharaMurthy%40Honeywell.com%7Cbb8e0988781b4c3e846408d9ce83da3c%7C96ece
> > 5269c7d48b08daf8b93c90a5d18%7C0%7C0%7C637767887969200715%7CUnknown%7CT
> > WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI
> > 6Mn0%3D%7C3000&amp;sdata=oVafEDlK82x6PFJz3kukwvuXECl5JW%2BD0GMwAkKDIZs
> > %3D&amp;reserved=0 [denis@denix.org]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 
> 
> 
> --
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://nam12.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdenix.org%2F0x420902729A92C964&amp;data=04%7C01%7CNachiketRahul.Jagade%40Honeywell.com%7Ce49425450ea14bd225ea08d9ce889c5b%7C96ece5269c7d48b08daf8b93c90a5d18%7C0%7C0%7C637767908394296478%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=xDfgVNwA0j8WFflU4TNhfyV5UQ80zobXOQcsVeYjHTI%3D&amp;reserved=0
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
> 

