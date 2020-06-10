Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web11.3892.1591821646536183969
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Jun 2020 13:40:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=pvmuFMHv;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f195.google.com with SMTP id w9so2933810qtv.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 10 Jun 2020 13:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DDN+q4uTJthHlQwVEJ7s1Z++RGQbZWIhLvI5cd9dYfs=;
        b=pvmuFMHveYLKL1yJUMCF0Ne05QgW8AU8jVdTGzRsqTSpQ3ILgYZZJUFBCaO6HMBwPP
         qDB5is9RhM9TK1yAdt2hTBAa/szHAMgOQxQPnbwYsH+8AmYRnDiJSvRYuHFfSAycoAVq
         cndUSq0Oh5PAF1l3JW/jgCnejdg65kHt3iFRewkPuLLum4NJC3Uq14/EUtoQFT7YsmnR
         0PNY0etZg930pyniZzDyqR9OQTZC1ec+EMCK42/Q7gPGDEpVHJLB4C2fyonHFT7l4E0H
         ikjUTSeeJRw8HZeXUmg9PG6brXjJeGFhfrmPucZF/sZ+Czdx3X8PnGxDntTxvi0lwJSP
         sHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DDN+q4uTJthHlQwVEJ7s1Z++RGQbZWIhLvI5cd9dYfs=;
        b=JpQ/l6+6x7fwHIJtnYBPlC3jav3blDFHsAMWlkftNJ2oA94Ggwn+QlH+hYEUG1exoy
         o44hKFd1X0i4j6YY1vob97VtaGAK8FpChtmUs8AD4e94ereI0gg0SRqE4Q0JizUWXmFb
         gY1uE+hG7R5rHKIzsnZE3SmUyUbQTv6wRxcWgqeKy4JuklUqOlrlkecPM3CaGa1aVv4x
         8kVcAb8I1XqZ3Y38MvibquFQ48ZKhvalUd5ZFd/K2OkWfG7hken94qXVY5V/TxxKdNHU
         8VQbviWkxyAz6YhUr1Gdal7L1g+Ytz/udzZrMEAr10xystz63x/QrwG8CT2AcAmpLsbv
         SzPw==
X-Gm-Message-State: AOAM53140f2e2AaEfKs6OL7S/6iLcaeTu8GhhOdghsxYfL53AqjGP2oe
	y7tm+4j9QF1/XaUcRLrRquxHMxAbabk=
X-Google-Smtp-Source: ABdhPJwCdaHegF0/2drtb36WrXSqOsTQ1q34XjJ8oqfX7cFPTwiz+acuQ3L/I22o6cnfpOooLA9VwA==
X-Received: by 2002:ac8:1ab9:: with SMTP id x54mr5041380qtj.371.1591821645563;
        Wed, 10 Jun 2020 13:40:45 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:403d:d74f:c1dd:a98f])
        by smtp.gmail.com with ESMTPSA id v69sm592987qkb.96.2020.06.10.13.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 13:40:45 -0700 (PDT)
Date: Wed, 10 Jun 2020 16:40:43 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com,
	Patrik Berglund <patrik.berglund@arm.com>
Subject: Re: [meta-arm] [PATCH] meta-arm: Add SCP MCP build support
Message-ID: <20200610204043.GB25448@kudzu.us>
References: <20200602165244.27561-1-khasim.mohammed@arm.com>
 <20200608155014.GE15959@kudzu.us>
 <0ede12def629fe952cddcb122f879992ea0793f1.camel@arm.com>
MIME-Version: 1.0
In-Reply-To: <0ede12def629fe952cddcb122f879992ea0793f1.camel@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 08, 2020 at 09:59:50PM +0530, Khasim Mohammed wrote:
> Hi Jon,
> 
> On Mon, 2020-06-08 at 11:50 -0400, Jon Mason wrote:
> > On Tue, Jun 02, 2020 at 05:52:44PM +0100, Khasim Mohammed wrote:
> > > SCP-firmware provides a software reference implementation for
> > > the System Control Processor (SCP) and Manageability Control
> > > Processor (MCP) components found in several Arm Compute
> > > Sub-Systems.
> > > 
> > > This patch set adds support to fetch and build SCP and MCP
> > > firmware binaries
> > > 
> > > Issue-Id: PLATFORMS-3134
> > > 
> > > Change-Id: Ic7259bb430c9e7e9711c9c8bc3283aafaacdf707
> > > Signed-off-by: Patrik Berglund <patrik.berglund@arm.com>
> > > Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> > 
> > Pulled into master branch
> > 
> 
> Can you please pull this on Dunfell branch as well ?

done.

Thanks,
Jon

> 
> Thanks,
> 
> Khasim
> 
> > Thanks,
> > Jon
> > 
> > > ---
> > >  .../recipes-bsp/scp-firmware/scp-firmware.inc | 71
> > > +++++++++++++++++++
> > >  .../scp-firmware/scp-firmware_git.bb          | 20 ++++++
> > >  2 files changed, 91 insertions(+)
> > >  create mode 100644 meta-arm/recipes-bsp/scp-firmware/scp-
> > > firmware.inc
> > >  create mode 100644 meta-arm/recipes-bsp/scp-firmware/scp-
> > > firmware_git.bb
> > > 
> > > diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > > b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > > new file mode 100644
> > > index 0000000..1873848
> > > --- /dev/null
> > > +++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > > @@ -0,0 +1,71 @@
> > > +SUMMARY = "SCP and MCP Firmware"
> > > +
> > > +PROVIDES += "virtual/control-processor-firmware"
> > > +
> > > +SCP_BUILD_RELEASE   ?= "1"
> > > +SCP_COMPILE_VERBOSE ?= "0"
> > > +SCP_PLATFORM        ?= "invalid"
> > > +SCP_COMPILER        ?= "arm-none-eabi"
> > > +
> > > +DEPENDS += "virtual/arm-none-eabi-gcc-native"
> > > +
> > > +SCP_BUILD_STR = "${@bb.utils.contains('SCP_BUILD_RELEASE', '1',
> > > 'release', 'debug', d)}"
> > > +SCP_COMP_STR  = "${@bb.utils.contains('SCP_COMPILE_VERBOSE', '0',
> > > '', 'V=1', d)}"
> > > +
> > > +inherit python3native
> > > +inherit deploy
> > > +
> > > +B = "${WORKDIR}/build"
> > > +S = "${WORKDIR}/src"
> > > +
> > > +# Allow platform specific copying of only scp or both scp & mcp,
> > > default to both
> > > +FW_TARGETS ?= "scp mcp"
> > > +
> > > +COMPATIBLE_MACHINE ?= "invalid"
> > > +
> > > +LDFLAGS[unexport] = "1"
> > > +
> > > +# The gcc-arm-none-eabi version does not support -fmacro-prefix-
> > > max
> > > +DEBUG_PREFIX_MAP_pn-scp = "\
> > > +    -fdebug-prefix-
> > > map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
> > > +    -fdebug-prefix-map=${STAGING_DIR_HOST}= \
> > > +    -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
> > > +"
> > > +
> > > +# No configure
> > > +do_configure[noexec] = "1"
> > > +
> > > +EXTRA_OEMAKE = "${SCP_COMP_STR} \
> > > +                BUILD_PATH='${B}' \
> > > +                PRODUCT='${SCP_PLATFORM}' \
> > > +                MODE='${SCP_BUILD_STR}' \
> > > +                CC='${SCP_COMPILER}-gcc' \
> > > +                AR='${SCP_COMPILER}-ar' \
> > > +                SIZE='${SCP_COMPILER}-size' \
> > > +                OBJCOPY='${SCP_COMPILER}-objcopy' \
> > > +                "
> > > +
> > > +do_compile() {
> > > +    oe_runmake -C "${S}" ${EXTRA_OEMAKE}
> > > +}
> > > +do_compile[cleandirs] += "${B}"
> > > +
> > > +do_install() {
> > > +     install -d ${D}/firmware
> > > +     for FW in ${FW_TARGETS}; do
> > > +        for TYPE in ramfw romfw; do
> > > +           install -D
> > > "${B}/product/${SCP_PLATFORM}/${FW}_${TYPE}/release/bin/${FW}_${TYP
> > > E}.bin" "${D}/firmware/"
> > > +        done
> > > +     done
> > > +}
> > > +
> > > +FILES_${PN} = "/firmware"
> > > +SYSROOT_DIRS += "/firmware"
> > > +# Skip QA check for relocations in .text of elf binaries
> > > +INSANE_SKIP_${PN} = "textrel"
> > > +
> > > +do_deploy() {
> > > +    # Copy the images to deploy directory
> > > +    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
> > > +}
> > > +addtask deploy after do_install
> > > diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > > b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > > new file mode 100644
> > > index 0000000..5ff5859
> > > --- /dev/null
> > > +++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > > @@ -0,0 +1,20 @@
> > > +DESCRIPTION = "Firmware for SCP and MCP software reference
> > > implementation"
> > > +HOMEPAGE = "https://github.com/ARM-software/SCP-firmware"
> > > +
> > > +LICENSE = "BSD-3-Clause & Apache-2.0"
> > > +
> > > +# SCP
> > > +LIC_FILES_CHKSUM =
> > > "file://license.md;beginline=5;md5=9db9e3d2fb8d9300a6c3d15101b19731
> > > "
> > > +# CMSIS
> > > +LIC_FILES_CHKSUM +=
> > > "file://cmsis/LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
> > > +
> > > +SRC_URI = "\
> > > +    git://github.com/ARM-software/SCP-
> > > firmware.git;protocol=https;name=scp;destsuffix=src;nobranch=1 \
> > > +    git://github.com/ARM-
> > > software/CMSIS_5.git;protocol=https;name=cmsis;destsuffix=src/cmsis
> > > ;lfs=0;nobranch=1 \
> > > +"
> > > +
> > > +SRCREV_scp    = "db19910aca6d1032eb0329e5fbb70a92b997f6f2"
> > > +SRCREV_cmsis  = "refs/tags/5.2.0"
> > > +SRCREV_FORMAT = "scp_cmsis"
> > > +
> > > +require scp-firmware.inc
> > > -- 
> > > 2.17.1
> > > 
> > > 
> > 
> > 
> 
