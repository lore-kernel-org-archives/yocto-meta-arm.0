Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.8085.1591884223287823220
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 07:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=chofngMz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f194.google.com with SMTP id w3so5631482qkb.6
        for <meta-arm@lists.yoctoproject.org>; Thu, 11 Jun 2020 07:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UljinH1TiLQyaiB0/4FlJOwrYSs54q5dZqA6k+KYFa4=;
        b=chofngMzq8EN0yfuSW+XgGmOFcGXJMEe6DYWwRKcisLRhCG6E15vPhCg7SGwYNfV2O
         bYp2o8BNtooPs0lJbYcS3l7/z12vnAp0MSlCds8ZV7Ed+M4f+gxMPhFcoktY7yagrfNh
         W/mHSLop+7Sh8cbRGrUqHRq6L50wEO1mv6U5UehziJKJj5h5CX+ssQYXPRx9aq7+25nV
         qJI6nglwGpt6n7I3ESgGhoVq4n/GH/5762V2jrlg1QwQRhUazD7BCMeQnIpJKgBDMaUp
         KTstjbMh3bqt92NgpYgIwe92lukH7v5K7PTHjqbT5FnQwW8BNruS6sIZ3rjTRA2fsHB1
         z5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UljinH1TiLQyaiB0/4FlJOwrYSs54q5dZqA6k+KYFa4=;
        b=K4RcNE4baM9qi70iyy6/W7QR4J0aPETC6jWBg6f4omhUJF5lT5IsOrX9k8X6nXjlZz
         nhyqM27+nUFDnYOCRe5fFt/6+Tqn95sWHdOkRSwd9kRfdOLqHnujeWBS4iGBmhRKIve+
         UJFZ1IN7PEbhZh2THRuUfVA+WcowLVxx/5PMwohEpvmOzCl9B9L8HF2RAqAPClQia8Mx
         E14chNS9QS2/bk+xyqkds0bDPXq43vL24W5TEG7MtHhw3JzOTnLnftA9x/b58C2Ajgth
         vdEmO4Ti4Vv6+KOiyJ++nqZ9AaEk3o8yctuwvkAyT9krcfvcnycFY1496RHUG34ibRCh
         e8JA==
X-Gm-Message-State: AOAM530rfW76hVYQ+Q/fpcoSwAzzg93GnNln6U5DP1DBp60fEc0WMTXF
	PcLQ6o5vkrYNpf6y13te3OyPOBErqvU=
X-Google-Smtp-Source: ABdhPJxuv9VRmAwS5MbgZ7E7leRhLAmY49/rChDt611tUcTKy35LabWXDkbjmZvzFgeh/COFG//pIA==
X-Received: by 2002:a05:620a:a4a:: with SMTP id j10mr8083607qka.272.1591884222375;
        Thu, 11 Jun 2020 07:03:42 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:e01b:52c7:6d78:8385])
        by smtp.gmail.com with ESMTPSA id 138sm2303554qkk.38.2020.06.11.07.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 07:03:41 -0700 (PDT)
Date: Thu, 11 Jun 2020 10:03:40 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] meta-arm: Add UEFI EDK2 support for Arm platforms
Message-ID: <20200611140339.GD17598@kudzu.us>
References: <20200610160758.9902-1-khasim.mohammed@arm.com>
 <3097.1591878054403513670@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <3097.1591878054403513670@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2020 at 05:20:54AM -0700, Diego Sueiro wrote:
> On Wed, Jun 10, 2020 at 05:08 PM, Khasim Mohammed wrote:
> 
> >
> > EDK2 Project is a modern, feature-rich, cross-platform
> > firmware development environment for the UEFI specifications
> > from www.uefi.org.
> > 
> > This patch adds a new recipe to fetch, configure and build
> > UEFI EDK2 firmware for Arm platforms.
> > 
> > Change-Id: Icfb157e5b68d87accfd4290f522fc529fe4e849e
> > Issue-Id: PLATFORMS-3134
> > Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> 
> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

Applied to the master branch.

Thanks,
Jon

> 
> > ---
> >  meta-arm/recipes-bsp/uefi/edk2-firmware.inc   | 81 +++++++++++++++++++
> >  .../recipes-bsp/uefi/edk2-firmware_git.bb     | 19 +++++
> >  2 files changed, 100 insertions(+)
> >  create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> >  create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
> > 
> > diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> > b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> > new file mode 100644
> > index 0000000..7b9327c
> > --- /dev/null
> > +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> > @@ -0,0 +1,81 @@
> > +SUMMARY = "UEFI EDK2 Firmware"
> > +
> > +PROVIDES += "virtual/uefi-firmware"
> > +
> > +EDK2_BUILD_RELEASE   ?= "0"
> > +EDK2_PLATFORM        ?= "invalid"
> > +EDK2_PLATFORM_DSC    ?= ""
> > +EDK2_BIN_NAME        ?= ""
> > +EDK2_ARCH            ?= ""
> > +
> > +EDK2_BUILD_MODE = "${@bb.utils.contains('EDK2_BUILD_RELEASE', '1', 'RELEASE',
> > 'DEBUG', d)}"
> > +
> > +DEPENDS += "util-linux-native iasl-native"
> > +
> > +inherit python3native
> > +inherit deploy
> > +
> > +B = "${WORKDIR}/build"
> > +S = "${WORKDIR}/git"
> > +
> > +COMPATIBLE_MACHINE ?= "invalid"
> > +
> > +LDFLAGS[unexport] = "1"
> > +
> > +# No configure
> > +do_configure[noexec] = "1"
> > +
> > +# Set variables as per envsetup
> > +export GCC5_AARCH64_PREFIX = "${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}"
> > +export PACKAGES_PATH       = "${S}/edk2:${S}/edk2/edk2-platforms"
> > +export WORKSPACE           = "${S}/edk2"
> > +export EDK_TOOLS_PATH      = "${WORKSPACE}/BaseTools"
> > +export PYTHON_COMMAND      = "${PYTHON}"
> > +export CONF_PATH           = "${WORKSPACE}/Conf"
> > +
> > +export BTOOLS_PATH = "${EDK_TOOLS_PATH}/BinWrappers/PosixLike"
> > +
> > +python __anonymous() {
> > +    # If GCC Version is greater than 4 then pass GCC5
> > +    # set GCC5 by default
> > +    d.setVar('GCC_VER', 'GCC5')
> > +
> > +    # Otherwise pass the corresponding version
> > +    G = d.getVar('GCCVERSION',True).split(".")
> > +    gcc_vlist = ['1', '2', '3', '4']
> > +    if G[0] in gcc_vlist:
> > +        d.setVar('GCC_VER', 'GCC'+G[0])
> > +}
> > +
> > +do_compile() {
> > +    # Copy the templates as we don't run envsetup
> > +    cp ${EDK_TOOLS_PATH}/Conf/build_rule.template
> > ${WORKSPACE}/Conf/build_rule.txt
> > +    cp ${EDK_TOOLS_PATH}/Conf/tools_def.template
> > ${WORKSPACE}/Conf/tools_def.txt
> > +    cp ${EDK_TOOLS_PATH}/Conf/target.template ${WORKSPACE}/Conf/target.txt
> > +
> > +    # Build basetools
> > +    oe_runmake -C ${S}/edk2/BaseTools
> > +
> > +    PATH="${WORKSPACE}:${BTOOLS_PATH}:$PATH" \
> > +    "${S}/edk2/BaseTools/BinWrappers/PosixLike/build" \
> > +       -a "${EDK2_ARCH}" \
> > +       -b ${EDK2_BUILD_MODE} \
> > +       -t ${GCC_VER} \
> > +       -p "${S}/edk2/edk2-platforms/Platform/ARM/${EDK2_PLATFORM_DSC}"
> > +}
> > +
> > +do_install() {
> > +    install -d ${D}/firmware
> > +    install
> > "${S}/edk2/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${GCC_VER}/FV/${EDK2_BIN_NAME}"
> > "${D}/firmware/uefi.bin"
> > +}
> > +
> > +FILES_${PN} = "/firmware"
> > +SYSROOT_DIRS += "/firmware"
> > +# Skip QA check for relocations in .text of elf binaries
> > +INSANE_SKIP_${PN} = "textrel"
> > +
> > +do_deploy() {
> > +    # Copy the images to deploy directory
> > +    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
> > +}
> > +addtask deploy after do_install
> > diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
> > b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
> > new file mode 100644
> > index 0000000..4aadc3c
> > --- /dev/null
> > +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
> > @@ -0,0 +1,19 @@
> > +DESCRIPTION = "UEFI EDK2 Firmware for Arm reference platforms"
> > +HOMEPAGE = "https://github.com/tianocore/edk2"
> > +
> > +LICENSE = "BSD-2-Clause-Patent"
> > +
> > +# EDK2
> > +LIC_FILES_CHKSUM =
> > "file://edk2/License.txt;md5=2b415520383f7964e96700ae12b4570a"
> > +# EDK2 Platforms
> > +LIC_FILES_CHKSUM +=
> > "file://edk2/edk2-platforms/License.txt;md5=2b415520383f7964e96700ae12b4570a"
> > +
> > +SRC_URI ?= "\
> > +   
> > git://github.com/tianocore/edk2.git;name=edk2;destsuffix=${S}/edk2;nobranch=1
> > \
> > +   
> > git://github.com/tianocore/edk2-platforms.git;name=edk2-platforms;destsuffix=${S}/edk2/edk2-platforms;nobranch=1
> > \
> > +"
> > +SRCREV_edk2           ?= "6ff7c838d09224dd4e4c9b5b93152d8db1b19740"
> > +SRCREV_edk2-platforms ?= "ed4cc8059ec551032f0d8b8c172e9ec19214a638"
> > +SRCREV_FORMAT         = "edk2_edk2-platforms"
> > +
> > +require edk2-firmware.inc
> > -- 
> > 2.17.1
> > 
> >

> 

