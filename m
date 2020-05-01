Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.10412.1588340772712175753
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 May 2020 06:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=JJ0UBGWE;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.44, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f44.google.com with SMTP id ep1so4748319qvb.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 01 May 2020 06:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=RpCD9deP/RrC+E04Rn41b6PQMeCx58VByTbb9UvVwD8=;
        b=JJ0UBGWESXLBKxEdJxRIA3dle9QbIu3CKkV/56Sl7IP3lvEuKDZLe3R8wZJCVd9gpr
         CXtBp+582pv8IaZZamEeHhzAAfmtl5VYNnn8ePT83qaXKkh6QNfMsQ6jOHC/940SNtzX
         8hEZ1PKGGdUvnRwxynjN9i8zC92No0W0QHAhpnocuAVslzBvY7gtrbsDHEaxL12RSa2w
         Lp9VShgYXnPxTew3gWNY2zl+6sC/W5Bl3Y6Gcy73TEn4QcTZCt/h/zKNzf1M1sFzGcWX
         TC8n0o/1wApsLnxgNbUcBOzIM2yl74dfdFIO9mFwuHf3SRvOFcoSKQWhox89/p+A0h1/
         4g5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=RpCD9deP/RrC+E04Rn41b6PQMeCx58VByTbb9UvVwD8=;
        b=iNixcoTiVkzXNo7xtU4mfjo77SovN7NuEXNwz13esLvpodfq/s75pRzwW3AbJIwtaI
         ysZnIuUtzIY3y5GmEoksMwPsPGKgUUiwqrwn/C0yTG+rc5tlE0/8l8jkn+1FEXzeiO4a
         aWNSfbWkeETLfLUXP1nxRRnxBRi0gfMUv0nj5SBw+gfuSKbgbdfmiMkA1N4thXZ1ic75
         FNVv5VxKxA2lNV9AQehYjTTGs7+Tnc2IQ0HBrXikR6BlK33Zh4vpAeysKJ0aBou329fP
         6zQ0EG+Aqzb7j2IrEY8tiodTCGvWsMn5WeWP/7APhBl5OdJMh7qpuExvN9EOTD5kyVr+
         8rpw==
X-Gm-Message-State: AGi0Pub0pXRkUgjJB0UTKgP+k4UisRtCZfmPDmG3cgJ5Y3Sty3yN2fdL
	mcNsXuFosgwhO0OamXLfxIVJWk1IfUBXtQ==
X-Google-Smtp-Source: APiQypIAL03OqN/dqsjA4q1Y9hw73Gm7gasttmupPP0Hk+pI6gChmYYuKkapqS3+9H8F7bOeFhP6QA==
X-Received: by 2002:a05:6214:1812:: with SMTP id o18mr4185492qvw.64.1588340771372;
        Fri, 01 May 2020 06:46:11 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:bca5:cc07:46bf:ecff])
        by smtp.gmail.com with ESMTPSA id y6sm2618411qky.133.2020.05.01.06.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 06:46:10 -0700 (PDT)
Date: Fri, 1 May 2020 09:46:09 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Cc: nd <nd@arm.com>, Diego Sueiro <Diego.Sueiro@arm.com>
Subject: Re: [meta-arm] [PATCH] meta-arm-bsp: Remove fvp-base and foundation-armv8 simulation tools
Message-ID: <20200501134608.GB13726@kudzu.us>
References: <1587626802-59812-1-git-send-email-diego.sueiro@arm.com>
 <5E03FAF8-FA2D-4786-89F2-4D12AF9F45B5@arm.com>
MIME-Version: 1.0
In-Reply-To: <5E03FAF8-FA2D-4786-89F2-4D12AF9F45B5@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Apr 30, 2020 at 07:57:57AM +0000, Bertrand Marquis wrote:
> 
> 
> > On 23 Apr 2020, at 08:26, Diego Sueiro via lists.yoctoproject.org <diego.sueiro=arm.com@lists.yoctoproject.org> wrote:
> > 
> > Since the Fixed Virtual Platforms simulation tools are not publicly
> > available, remove them from meta-arm-bsp layer.
> > 
> > Change-Id: Ifece50bfd494241499540030b6ac5968abd8ad1f
> > Issue-Id: SCM-951
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Pulled in to the master branch.

Thanks,
Jon

> 
> > ---
> > meta-arm-bsp/conf/machine/foundation-armv8.conf    |   1 -
> > meta-arm-bsp/conf/machine/fvp-base.conf            |   1 -
> > meta-arm-bsp/documentation/foundation-armv8.md     |  26 ++-
> > meta-arm-bsp/documentation/fvp-base.md             |  29 ++-
> > .../fvp-common/files/start-foundation-armv8.sh     | 244 ---------------------
> > .../fvp-common/files/start-fvp-base.sh             | 233 --------------------
> > .../foundation-armv8-native_r11p8-61rel0.bb        |  45 ----
> > .../fvp-common/fvp-base-native_r11p7-30rel0.bb     |  45 ----
> > .../recipes-devtools/fvp-common/fvp-native.inc     |  34 ---
> > 9 files changed, 43 insertions(+), 615 deletions(-)
> > delete mode 100755 meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh
> > delete mode 100755 meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
> > delete mode 100644 meta-arm-bsp/recipes-devtools/fvp-common/foundation-armv8-native_r11p8-61rel0.bb
> > delete mode 100644 meta-arm-bsp/recipes-devtools/fvp-common/fvp-base-native_r11p7-30rel0.bb
> > delete mode 100644 meta-arm-bsp/recipes-devtools/fvp-common/fvp-native.inc
> > 
> > diff --git a/meta-arm-bsp/conf/machine/foundation-armv8.conf b/meta-arm-bsp/conf/machine/foundation-armv8.conf
> > index 10d3eea..73d2798 100644
> > --- a/meta-arm-bsp/conf/machine/foundation-armv8.conf
> > +++ b/meta-arm-bsp/conf/machine/foundation-armv8.conf
> > @@ -7,7 +7,6 @@
> > require conf/machine/fvp-common/fvp.inc
> > 
> > KERNEL_DEVICETREE = "arm/foundation-v8-gicv3-psci.dtb"
> > -EXTRA_IMAGEDEPENDS += "foundation-armv8-native"
> > 
> > # Use haveged as a source of entropy instead of rng-tools (Needed for ssh).
> > # rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow boot time.
> > diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/machine/fvp-base.conf
> > index 4c79250..3039644 100644
> > --- a/meta-arm-bsp/conf/machine/fvp-base.conf
> > +++ b/meta-arm-bsp/conf/machine/fvp-base.conf
> > @@ -7,7 +7,6 @@
> > require conf/machine/fvp-common/fvp.inc
> > 
> > KERNEL_DEVICETREE = "arm/fvp-base-gicv3-psci-custom.dtb"
> > -EXTRA_IMAGEDEPENDS += "fvp-base-native"
> > 
> > # Use haveged as a source of entropy instead of rng-tools (Needed for ssh).
> > # rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow boot time.
> > diff --git a/meta-arm-bsp/documentation/foundation-armv8.md b/meta-arm-bsp/documentation/foundation-armv8.md
> > index ea4ec6c..1097550 100644
> > --- a/meta-arm-bsp/documentation/foundation-armv8.md
> > +++ b/meta-arm-bsp/documentation/foundation-armv8.md
> > @@ -10,16 +10,30 @@ MACHINE ?= "foundation-v8"
> > ```bash$ bitbake core-image-minimal```
> > 
> > ### Run:
> > -The layer provides a recipe to install the Armv8-A Foundation Platform in your
> > -environment. You must download Armv8-A Foundation Platform from Arm developer
> > -(This might require the user to register) from this address:
> > +To Run the Fixed Virtual Platform simulation tool you must download "Armv8-A
> > +Foundation Platform" from Arm developer (This might require the user to
> > +register) from this address:
> > https://developer.arm.com/tools-and-software/simulation-models/fixed-virtual-platforms
> > -and put the downloaded tar file in 'downloads/licensed/silver.arm.com/'
> > -directory of your project (or of your Pre-Mirror if you have one).
> > +and install it on your host PC.
> > +
> > +Fast Models Fixed Virtual Platforms (FVP) Reference Guide:
> > +https://developer.arm.com/docs/100966/latest
> > +
> > +Armv8‑A Foundation Platform User Guide:
> > +https://developer.arm.com/docs/100961/latest/
> > +
> > 
> > Once done, do the following to build and run an image:
> > ```bash$ bitbake core-image-minimal```
> > -```bash$ ./tmp/deploy/tools/start-foundation-armv8.sh```
> > +```bash$ export YOCTO_DEPLOY_IMGS_DIR="<yocto-build-dir/tmp/deploy/images/foundation-v8>"```
> > +```bash$ cd <path-to-Foundation_Platformpkg-dir/models/Linux64_GCC-X.X/>```
> > +```
> > +bash$ ./Foundation_Platform --cores=4 --no-sve --gicv3 \
> > +         --data=${YOCTO_DEPLOY_IMGS_DIR}/bl1-fvp.bin@0x0 \
> > +         --data=${YOCTO_DEPLOY_IMGS_DIR}/Image@0x80080000 \
> > +         --data=${YOCTO_DEPLOY_IMGS_DIR}/foundation-v8-gicv3-psci.dtb@0x83000000 \
> > +         --block-device=${YOCTO_DEPLOY_IMGS_DIR}/core-image-minimal-foundation-armv8.disk.img \
> > +```
> > 
> > If you have built a configuration without a ramdisk, you can use the following
> > command in U-boot to start Linux:
> > diff --git a/meta-arm-bsp/documentation/fvp-base.md b/meta-arm-bsp/documentation/fvp-base.md
> > index ad2ac97..0936c19 100644
> > --- a/meta-arm-bsp/documentation/fvp-base.md
> > +++ b/meta-arm-bsp/documentation/fvp-base.md
> > @@ -10,16 +10,33 @@ MACHINE ?= "fvp-base"
> > ```bash$ bitbake core-image-minimal```
> > 
> > ### Run:
> > -The layer provides a recipe to install the Fixed Virtual Platform in your
> > -environment. You must download Armv8-A Base Platform FVP from Arm developer
> > -(This might require the user to register) from this address:
> > +To Run the Fixed Virtual Platform simulation tool you must download "Armv8-A
> > +Base Platform FVP" from Arm developer (This might require the user to
> > +register) from this address:
> > https://developer.arm.com/tools-and-software/simulation-models/fixed-virtual-platforms
> > -and put the downloaded tar file in 'downloads/licensed/silver.arm.com/'
> > -directory of your project (or of your Pre-Mirror if you have one).
> > +and install it on your host PC.
> > +
> > +Fast Models Fixed Virtual Platforms (FVP) Reference Guide:
> > +https://developer.arm.com/docs/100966/latest
> > +
> > +Armv8‑A Foundation Platform User Guide:
> > +https://developer.arm.com/docs/100961/latest/
> > +
> > 
> > Once done, do the following to build and run an image:
> > ```bash$ bitbake core-image-minimal```
> > -```bash$ ./tmp/deploy/tools/start-fvp-base.sh```
> > +```bash$ export YOCTO_DEPLOY_IMGS_DIR="<yocto-build-dir/tmp/deploy/images/fvp-base>"```
> > +```bash$ cd <path-to-Base_RevC_AEMv8A_pkg-dir/models/Linux64_GCC-X.X/>```
> > +```
> > +bash$ ./FVP_Base_RevC-2xAEMv8A -C bp.virtio_net.enabled=1 \
> > +         -C cache_state_modelled=0 \
> > +         -C bp.secureflashloader.fname=${YOCTO_DEPLOY_IMGS_DIR}/bl1-fvp.bin \
> > +         -C bp.flashloader0.fname=${YOCTO_DEPLOY_IMGS_DIR}/fip-fvp.bin \
> > +         --data cluster0.cpu0=${YOCTO_DEPLOY_IMGS_DIR}/Image@0x80080000 \
> > +         --data cluster0.cpu0=${YOCTO_DEPLOY_IMGS_DIR}/fvp-base-gicv3-psci-custom.dtb@0x83000000 \
> > +         -C bp.virtioblockdevice.image_path=${YOCTO_DEPLOY_IMGS_DIR}/core-image-minimal-foundation-armv8.disk.img \
> > +```
> > +
> > 
> > If you have built a configuration without a ramdisk, you can use the following
> > command in U-boot to start Linux:
> > diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh
> > deleted file mode 100755
> > index 2b7643c..0000000
> > --- a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh
> > +++ /dev/null
> > @@ -1,244 +0,0 @@
> > -#!/bin/bash
> > -# Script to start a build image using FVP Foundation Platform
> > -#
> > -set -u
> > -set -e
> > -
> > -# Get parameters from bitbake configuration
> > -source <(MACHINE=foundation-armv8 bitbake -e foundation-armv8-native | grep \
> > -    -e "^STAGING_.*_NATIVE=" \
> > -    -e "^DEPLOY_DIR.*=")
> > -
> > -
> > -# Bitbake image to run
> > -IMAGE_NAME="$(cd $DEPLOY_DIR_IMAGE; ls *-foundation-armv8.manifest | \
> > -    sed -e "s/-foundation-armv8\.manifest//" | head -1)"
> > -
> > -# BL1 and FIP files
> > -BL1_FILE="bl1-fvp.bin"
> > -BL1_ADDR="0x0"
> > -FIP_FILE="fip-fvp.bin"
> > -FIP_ADDR="0x8000000"
> > -
> > -# Linux kernel file in deploy_dir and load address
> > -KERNEL_FILE="Image"
> > -KERNEL_ADDR="0x80080000"
> > -
> > -# DTB file in deploy_dir and load address
> > -DTB_FILE="foundation-v8-gicv3-psci.dtb"
> > -DTB_ADDR="0x83000000"
> > -
> > -# Xen file in deploy_dir and load address
> > -XEN_FILE="xen-foundation-armv8"
> > -XEN_ADDR="0x84000000"
> > -
> > -# Disk file in deploy_dir
> > -DISK_FILE=""
> > -
> > -# Foundation Platform Executable (Extracted from
> > -# FM000-KT-00035-r11p8-61rel0.tgz from silver.arm.com)
> > -FOUNDATION_PLAT_EXE="Foundation_Platform"
> > -
> > -# Foundation Platform arguments
> > -# 4 cores
> > -# Disable Scalable Vector Extension (SVE)
> > -# gicv3 emulation (required for hardware virtualisation)
> > -FOUNDATION_PLAT_ARGS=" \
> > -    --cores=4 \
> > -    --no-sve \
> > -    --gicv3"
> > -
> > -# Foundation Platform user arguments
> > -EXTRA_ARGS=""
> > -
> > -# Help function
> > -usage() {
> > -    cat <<EOF
> > -Usage $0 [OPTION] [IMAGE_NAME] [FOUNDATION_PLATFORM_ARGS]
> > -Start a generated Yocto Image using Armv8-A Foundation Platform.
> > -This script will execute Foundation_Platform from the PATH.
> > -
> > -IMAGE_NAME should be the name of the image to start, this is what you did
> > -build with bitbake, default is 'core-image-minimal' if none is auto-detected.
> > -All extra arguments are passed to Foundation Platform after the IMAGE_NAME.
> > -
> > -OPTIONs:
> > -  -h, --help                  displays this help message
> > -  --deploy=[DIR]              use DIR as deploy directory, default is:
> > -                              $DEPLOY_DIR_IMAGE
> > -  --no-bl1                    Don't load a BL1
> > -  --bl1=[NAME]                File name in DEPLOY_DIR_IMAGE to be used for BL1,
> > -                              default is $BL1_FILE.
> > -                              This adds the following argument to the
> > -                              Foundation Platform:
> > -                              --data=$DEPLOY_DIR_IMAGE/NAME@$BL1_ADDR
> > -  --no-fip                    Don't load a FIP
> > -  --fip=[NAME]                File name in DEPLOY_DIR_IMAGE to be used for FIP,
> > -                              default is $FIP_FILE.
> > -                              This adds the following argument to the
> > -                              Foundation Platform:
> > -                              --data=$DEPLOY_DIR_IMAGE/NAME@$FIP_ADDR
> > -  --linux=[NAME]              File name in DEPLOY_DIR_IMAGE to be used
> > -                              as Linux kernel
> > -                              default is $KERNEL_FILE
> > -  --linux-addr=[ADDR]         Address at which Linux kernel should be loaded
> > -                              default is $KERNEL_ADDR
> > -  --dtb=[NAME]                File name in DEPLOY_DIR_IMAGE to be used as DTB
> > -                              default is $DTB_FILE
> > -  --dtb-addr=[ADDR]           Address at which DTB should be loaded
> > -                              default is $DTB_ADDR
> > -  --xen=[NAME]                File name in DEPLOY_DIR_IMAGE to be used as Xen
> > -                              It is only loaded if the file actually exists.
> > -                              default is $XEN_FILE
> > -  --xen-addr=[ADDR]           Address at which Xen should be loaded
> > -                              default is $XEN_ADDR
> > -  --disk=[NAME]               File name in DEPLOY_DIR_IMAGE to be used as disk.
> > -                              It is only loaded if the file actually exists.
> > -                              default is IMAGE_NAME-foundation-armv8.disk.img
> > -EOF
> > -}
> > -
> > -# Process command line arguments
> > -for arg in "$@"; do
> > -    case $arg in
> > -        --*=*)
> > -            optarg=$(echo $arg | sed -e "s/.*=//")
> > -            ;;
> > -        *)
> > -            optarg=""
> > -            ;;
> > -    esac
> > -
> > -    case $arg in
> > -        -h|-?|--help)
> > -            usage
> > -            exit 0
> > -            ;;
> > -        --deploy=*)
> > -            if [ ! -f $optarg/Image ]
> > -            then
> > -                echo "Invalid argument" >&2
> > -                echo "$optarg is not a valid deploy directory" >&2
> > -                exit 1
> > -            fi
> > -            DEPLOY_DIR_IMAGE=$optarg
> > -            ;;
> > -        --no-bl1)
> > -            BL1_FILE=""
> > -            ;;
> > -        --bl1=*)
> > -            BL1_FILE="$optarg"
> > -            ;;
> > -        --no-fip)
> > -            FIP_FILE=""
> > -            ;;
> > -        --fip=*)
> > -            FIP_FILE="$optarg"
> > -            ;;
> > -        --linux=*)
> > -            LINUX_FILE="$optarg"
> > -            ;;
> > -        --linux-addr=*)
> > -            LINUX_ADDR="$optarg"
> > -            ;;
> > -        --dtb=*)
> > -            DTB_FILE="$optarg"
> > -            ;;
> > -        --dtb-addr=*)
> > -            DTB_ADDR="$optarg"
> > -            ;;
> > -        --xen=*)
> > -            XEN_FILE="$optarg"
> > -            ;;
> > -        --xen-addr=*)
> > -            XEN_ADDR="$optarg"
> > -            ;;
> > -        --disk=*)
> > -            DISK_FILE="$optarg"
> > -            ;;
> > -        *)
> > -            if [ -z "$IMAGE_NAME" ]
> > -            then
> > -                IMAGE_NAME="$arg"
> > -            else
> > -                EXTRA_ARGS="$EXTRA_ARGS $arg"
> > -            fi
> > -            ;;
> > -    esac
> > -done
> > -
> > -if [ -z "${BUILDDIR:-}" ]; then
> > -    echo "We are not in a Yocto build project." >&2
> > -    echo "Please source oe-init-build-env first." >&2
> > -    exit 1
> > -fi
> > -
> > -if [ -z "${IMAGE_NAME:-}" ]; then
> > -    IMAGE_NAME="core-image-minimal"
> > -fi
> > -
> > -if [ -z "${DISK_FILE:-}" ]; then
> > -    DISK_FILE="${IMAGE_NAME}-foundation-armv8.disk.img"
> > -fi
> > -
> > -# Add bl1 arg
> > -if [ -n "$BL1_FILE" ]; then
> > -    if [ ! -f $DEPLOY_DIR_IMAGE/$BL1_FILE ]; then
> > -        echo "Could not find bl1 ($BL1_FILE) in $DEPLOY_DIR_IMAGE" >&2
> > -        exit 1
> > -    fi
> > -    FOUNDATION_PLAT_ARGS="$FOUNDATION_PLAT_ARGS \
> > -        --data=$DEPLOY_DIR_IMAGE/$BL1_FILE@$BL1_ADDR"
> > -fi
> > -
> > -# Add fip arg
> > -if [ -n "$FIP_FILE" ]; then
> > -    if [ ! -f $DEPLOY_DIR_IMAGE/$FIP_FILE ]; then
> > -        echo "Could not find fip ($FIP_FILE) in $DEPLOY_DIR_IMAGE" >&2
> > -        exit 1
> > -    fi
> > -    FOUNDATION_PLAT_ARGS="$FOUNDATION_PLAT_ARGS \
> > -        --data=$DEPLOY_DIR_IMAGE/$FIP_FILE@$FIP_ADDR"
> > -fi
> > -
> > -# Add Linux kernel
> > -if [ -n "$KERNEL_FILE" ]; then
> > -    if [ ! -f $DEPLOY_DIR_IMAGE/$KERNEL_FILE ]; then
> > -        echo "Could not find Linux kernel ($KERNEL_FILE) in \
> > -            $DEPLOY_DIR_IMAGE" >&2
> > -        exit 1
> > -    fi
> > -    FOUNDATION_PLAT_ARGS="$FOUNDATION_PLAT_ARGS \
> > -        --data=$DEPLOY_DIR_IMAGE/$KERNEL_FILE@$KERNEL_ADDR"
> > -fi
> > -
> > -# Add xen if present
> > -if [ -n "$XEN_FILE" -a -f $DEPLOY_DIR_IMAGE/$XEN_FILE ]; then
> > -   FOUNDATION_PLAT_ARGS="$FOUNDATION_PLAT_ARGS \
> > -       --data=$DEPLOY_DIR_IMAGE/$XEN_FILE@$XEN_ADDR"
> > -   #switch dtb if there
> > -   if [ -f $DEPLOY_DIR_IMAGE/$(basename ${DTB_FILE} .dtb)-xen.dtb ]; then
> > -      DTB_FILE=$(basename ${DTB_FILE} .dtb)-xen.dtb
> > -   fi
> > -fi
> > -
> > -# Add DTB
> > -if [ -n "$DTB_FILE" ]; then
> > -    if [ ! -f $DEPLOY_DIR_IMAGE/$DTB_FILE ]; then
> > -        echo "Could not find the DTB ($DTB_FILE) in $DEPLOY_DIR_IMAGE" >&2
> > -        exit 1
> > -    fi
> > -    FOUNDATION_PLAT_ARGS="$FOUNDATION_PLAT_ARGS \
> > -        --data=$DEPLOY_DIR_IMAGE/$DTB_FILE@$DTB_ADDR"
> > -fi
> > -
> > -# Add disk if present
> > -if [ -n "$DISK_FILE" -a -f $DEPLOY_DIR_IMAGE/$DISK_FILE ]; then
> > -    FOUNDATION_PLAT_ARGS="$FOUNDATION_PLAT_ARGS \
> > -        --block-device=$DEPLOY_DIR_IMAGE/$DISK_FILE"
> > -fi
> > -
> > -FOUNDATION_PLAT_EXE="${STAGING_BINDIR_NATIVE}/${FOUNDATION_PLAT_EXE}"
> > -
> > -echo "$FOUNDATION_PLAT_EXE $FOUNDATION_PLAT_ARGS $EXTRA_ARGS"
> > -$FOUNDATION_PLAT_EXE $FOUNDATION_PLAT_ARGS $EXTRA_ARGS
> > diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
> > deleted file mode 100755
> > index f391c23..0000000
> > --- a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
> > +++ /dev/null
> > @@ -1,233 +0,0 @@
> > -#!/bin/bash
> > -# Script to start a build image using FVP Base Platform
> > -#
> > -set -u
> > -set -e
> > -
> > -# Get parameters from bitbake configuration
> > -source <(MACHINE=fvp-base bitbake -e fvp-base-native | grep \
> > -    -e "^STAGING_.*_NATIVE=" \
> > -    -e "^DEPLOY_DIR.*=")
> > -
> > -
> > -# Bitbake image to run
> > -IMAGE_NAME="$(cd $DEPLOY_DIR_IMAGE; ls *-fvp-base.manifest | \
> > -    sed -e "s/-fvp-base\.manifest//" | head -1)"
> > -
> > -# BL1 and FIP files
> > -BL1_FILE="bl1-fvp.bin"
> > -FIP_FILE="fip-fvp.bin"
> > -
> > -# Linux kernel file in deploy_dir and load address
> > -KERNEL_FILE="Image"
> > -KERNEL_ADDR="0x80080000"
> > -
> > -# DTB file in deploy_dir and load address
> > -DTB_FILE="fvp-base-gicv3-psci-custom.dtb"
> > -DTB_ADDR="0x83000000"
> > -
> > -# Xen file in deploy_dir and load address
> > -XEN_FILE="xen-fvp-base"
> > -XEN_ADDR="0x84000000"
> > -
> > -# Disk file in deploy_dir
> > -DISK_FILE=""
> > -
> > -# Armv8-A Base Platform FVP Executable (Extracted from
> > -# FM000-KT-00173-r11p7-30rel0.tgz from silver.arm.com)
> > -FVPEXEC="FVP_Base_RevC-2xAEMv8A"
> > -
> > -# FVP arguments
> > -# enable virtio network
> > -# disable cache modelling to improve performances
> > -FVPARGS=" \
> > -    -C bp.virtio_net.enabled=1 \
> > -    -C cache_state_modelled=0"
> > -
> > -# FVP user arguments
> > -EXTRA_ARGS=""
> > -
> > -# Help function
> > -usage() {
> > -    cat <<EOF
> > -Usage $0 [OPTION] [IMAGE_NAME] [FVP_ARGS]
> > -Start a generated Yocto Image using Arm Fixed Virtual Platform.
> > -This script will execute FVP_Base_RevC-2xAEMv8A from the PATH.
> > -
> > -IMAGE_NAME should be the name of the image to start, this is what you did
> > -build with bitbake, default is 'core-image-minimal' if none is auto-detected.
> > -All extra arguments are passed to FVP after the IMAGE_NAME.
> > -
> > -OPTIONs:
> > -  -h, --help                 displays this help message
> > -  --deploy=[DIR]             use DIR as deploy directory, default is:
> > -                             $DEPLOY_DIR_IMAGE
> > -  --no-bl1                   Don't load a BL1
> > -  --bl1=[NAME]               File name in DEPLOY_DIR_IMAGE to be used for BL1,
> > -                             default is $BL1_FILE.
> > -                             This adds the following argument to FVP:
> > -                             -C bp.secureflashloader.fname=DEPLOY_DIR_IMAGE/NAME
> > -  --no-fip                   Don't load a FIP
> > -  --fip=[NAME]               File name in DEPLOY_DIR_IMAGE to be used for FIP,
> > -                             default is $FIP_FILE.
> > -                             This adds the following argument to FVP:
> > -                             -C bp.flashloader0.fname=DEPLOY_DIR_IMAGE/NAME
> > -  --linux=[NAME]             File name in DEPLOY_DIR_IMAGE to be used as Linux kernel
> > -                             default is $KERNEL_FILE
> > -  --linux-addr=[ADDR]        Address at which Linux kernel should be loaded
> > -                             default is $KERNEL_ADDR
> > -  --dtb=[NAME]               File name in DEPLOY_DIR_IMAGE to be used as DTB
> > -                             default is $DTB_FILE
> > -  --dtb-addr=[ADDR]          Address at which DTB should be loaded
> > -                             default is $DTB_ADDR
> > -  --xen=[NAME]               File name in DEPLOY_DIR_IMAGE to be used as Xen
> > -                             It is only loaded if the file actually exists.
> > -                             default is $XEN_FILE
> > -  --xen-addr=[ADDR]          Address at which Xen should be loaded
> > -                             default is $XEN_ADDR
> > -  --disk=[NAME]              File name in DEPLOY_DIR_IMAGE to be used as disk.
> > -                             It is only loaded if the file actually exists.
> > -                             default is IMAGE_NAME-fvp.disk.img
> > -EOF
> > -}
> > -
> > -# Process command line arguments
> > -for arg in "$@"; do
> > -    case $arg in
> > -        --*=*)
> > -            optarg=$(echo $arg | sed -e "s/.*=//")
> > -            ;;
> > -        *)
> > -            optarg=""
> > -            ;;
> > -    esac
> > -
> > -    case $arg in
> > -        -h|-?|--help)
> > -            usage
> > -            exit 0
> > -            ;;
> > -        --deploy=*)
> > -            if [ ! -f $optarg/Image ]
> > -            then
> > -                echo "Invalid argument" >&2
> > -                echo "$optarg is not a valid deploy directory" >&2
> > -                exit 1
> > -            fi
> > -            DEPLOY_DIR_IMAGE=$optarg
> > -            ;;
> > -        --no-bl1)
> > -            BL1_FILE=""
> > -            ;;
> > -        --bl1=*)
> > -            BL1_FILE="$optarg"
> > -            ;;
> > -        --no-fip)
> > -            FIP_FILE=""
> > -            ;;
> > -        --fip=*)
> > -            FIP_FILE="$optarg"
> > -            ;;
> > -        --linux=*)
> > -            LINUX_FILE="$optarg"
> > -            ;;
> > -        --linux-addr=*)
> > -            LINUX_ADDR="$optarg"
> > -            ;;
> > -        --dtb=*)
> > -            DTB_FILE="$optarg"
> > -            ;;
> > -        --dtb-addr=*)
> > -            DTB_ADDR="$optarg"
> > -            ;;
> > -        --xen=*)
> > -            XEN_FILE="$optarg"
> > -            ;;
> > -        --xen-addr=*)
> > -            XEN_ADDR="$optarg"
> > -            ;;
> > -        --disk=*)
> > -            DISK_FILE="$optarg"
> > -            ;;
> > -        *)
> > -            if [ -z "$IMAGE_NAME" ]
> > -            then
> > -                IMAGE_NAME="$arg"
> > -            else
> > -                EXTRA_ARGS="$EXTRA_ARGS $arg"
> > -            fi
> > -            ;;
> > -    esac
> > -done
> > -
> > -if [ -z "${BUILDDIR:-}" ]; then
> > -    echo "We are not in a Yocto build project." >&2
> > -    echo "Please source oe-init-build-env first." >&2
> > -    exit 1
> > -fi
> > -
> > -if [ -z "${IMAGE_NAME:-}" ]; then
> > -    IMAGE_NAME="core-image-minimal"
> > -fi
> > -
> > -if [ -z "${DISK_FILE:-}" ]; then
> > -    DISK_FILE="${IMAGE_NAME}-fvp-base.disk.img"
> > -fi
> > -
> > -# Add bl1 arg
> > -if [ -n "$BL1_FILE" ]; then
> > -    if [ ! -f $DEPLOY_DIR_IMAGE/$BL1_FILE ]; then
> > -        echo "Could not find bl1 ($BL1_FILE) in $DEPLOY_DIR_IMAGE" >&2
> > -        exit 1
> > -    fi
> > -    FVPARGS="$FVPARGS -C bp.secureflashloader.fname=$DEPLOY_DIR_IMAGE/$BL1_FILE"
> > -fi
> > -
> > -# Add fip arg
> > -if [ -n "$FIP_FILE" ]; then
> > -    if [ ! -f $DEPLOY_DIR_IMAGE/$FIP_FILE ]; then
> > -        echo "Could not find fip ($FIP_FILE) in $DEPLOY_DIR_IMAGE" >&2
> > -        exit 1
> > -    fi
> > -    FVPARGS="$FVPARGS -C bp.flashloader0.fname=$DEPLOY_DIR_IMAGE/$FIP_FILE"
> > -fi
> > -
> > -# Add Linux kernel
> > -if [ -n "$KERNEL_FILE" ]; then
> > -    if [ ! -f $DEPLOY_DIR_IMAGE/$KERNEL_FILE ]; then
> > -        echo "Could not find Linux kernel ($KERNEL_FILE) in $DEPLOY_DIR_IMAGE" >&2
> > -        exit 1
> > -    fi
> > -    FVPARGS="$FVPARGS \
> > -        --data cluster0.cpu0=$DEPLOY_DIR_IMAGE/$KERNEL_FILE@$KERNEL_ADDR"
> > -fi
> > -
> > -# Add xen if present
> > -if [ -n "$XEN_FILE" -a -f $DEPLOY_DIR_IMAGE/$XEN_FILE ]; then
> > -    FVPARGS="$FVPARGS \
> > -        --data cluster0.cpu0=$DEPLOY_DIR_IMAGE/$XEN_FILE@$XEN_ADDR"
> > -   #switch dtb if there
> > -   if [ -f $DEPLOY_DIR_IMAGE/$(basename ${DTB_FILE} .dtb)-xen.dtb ]; then
> > -      DTB_FILE=$(basename ${DTB_FILE} .dtb)-xen.dtb
> > -   fi
> > -fi
> > -
> > -# Add DTB
> > -if [ -n "$DTB_FILE" ]; then
> > -    if [ ! -f $DEPLOY_DIR_IMAGE/$DTB_FILE ]; then
> > -        echo "Could not find the DTB ($DTB_FILE) in $DEPLOY_DIR_IMAGE" >&2
> > -        exit 1
> > -    fi
> > -    FVPARGS="$FVPARGS \
> > -        --data cluster0.cpu0=$DEPLOY_DIR_IMAGE/$DTB_FILE@$DTB_ADDR"
> > -fi
> > -
> > -# Add disk if present
> > -if [ -n "$DISK_FILE" -a -f $DEPLOY_DIR_IMAGE/$DISK_FILE ]; then
> > -    FVPARGS="$FVPARGS \
> > -        -C bp.virtioblockdevice.image_path=$DEPLOY_DIR_IMAGE/$DISK_FILE"
> > -fi
> > -FVPEXEC="${STAGING_BINDIR_NATIVE}/${FVPEXEC}"
> > -
> > -echo "$FVPEXEC $FVPARGS $EXTRA_ARGS"
> > -$FVPEXEC $FVPARGS $EXTRA_ARGS
> > diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/foundation-armv8-native_r11p8-61rel0.bb b/meta-arm-bsp/recipes-devtools/fvp-common/foundation-armv8-native_r11p8-61rel0.bb
> > deleted file mode 100644
> > index 4c1745d..0000000
> > --- a/meta-arm-bsp/recipes-devtools/fvp-common/foundation-armv8-native_r11p8-61rel0.bb
> > +++ /dev/null
> > @@ -1,45 +0,0 @@
> > -# Armv8-A Foundation Platform build recipe
> > -
> > -#
> > -# Download and install recipe specific for Armv8-A Foundation Platform build are
> > -# captured in the file.
> > -#
> > -
> > -# The tar file required to build this package must be downloaded from
> > -# https://developer.arm.com/tools-and-software/simulation-models/fixed-virtual-platforms
> > -# and put in the sub-directory 'licensed/silver.arm.com' of one of the
> > -# following locations:
> > -# - in the directory 'files' of this file directory
> > -# - in your Yocto project download directory (DL_DIR parameter of local.conf)
> > -# - in your Download mirror if you have one
> > -SRC_URI = "file://licensed/silver.arm.com/FM000-KT-00035-${PV}.tgz"
> > -SRC_URI += "file://start-foundation-armv8.sh"
> > -
> > -S = "${WORKDIR}/Foundation_Platformpkg"
> > -
> > -# Checksums to compare against downloaded package files' checksums
> > -LIC_FILES_CHKSUM = " \
> > -    file://license_terms/license_agreement.txt;md5=ae7b47c67a033995c6b4510476a50f03 \
> > -    file://license_terms/redistributables.txt;md5=f9fafcaf37ce6c9427568b9dbdbaabe5 \
> > -    file://license_terms/supplementary_terms.txt;md5=26e4b214f639a22c8e7e207abc10eccb \
> > -    file://license_terms/third_party_licenses.txt;md5=6394c171d6657fc195573c4d239341c4 \
> > -    "
> > -
> > -require fvp-native.inc
> > -
> > -do_install_append() {
> > -    cp -a --no-preserve=ownership -rf doc license_terms models plugins \
> > -        ${D}/${datadir}/fvp/.
> > -
> > -    cat <<EOF > ${D}${bindir}/Foundation_Platform
> > -#!/bin/bash
> > -basedir=\$(cd \$(dirname \$0)/../../; pwd)
> > -export LD_LIBRARY_PATH="\$basedir/lib:\$basedir/usr/lib"
> > -\$basedir/usr/share/fvp/models/Linux64_GCC-6.4/Foundation_Platform "\$@"
> > -EOF
> > -    chmod 755 ${D}${bindir}/Foundation_Platform
> > -}
> > -
> > -do_deploy_append() {
> > -    install -m 755 ${WORKDIR}/start-foundation-armv8.sh ${DEPLOYDIR}/.
> > -}
> > diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/fvp-base-native_r11p7-30rel0.bb b/meta-arm-bsp/recipes-devtools/fvp-common/fvp-base-native_r11p7-30rel0.bb
> > deleted file mode 100644
> > index 3d784f9..0000000
> > --- a/meta-arm-bsp/recipes-devtools/fvp-common/fvp-base-native_r11p7-30rel0.bb
> > +++ /dev/null
> > @@ -1,45 +0,0 @@
> > -# Armv8-A Base Platform FVP build recipe
> > -
> > -#
> > -# Download and install recipe specific for Armv8-A Base Platform FVP build are
> > -# captured in the file.
> > -#
> > -
> > -# The tar file required to build this package must be downloaded from
> > -# https://developer.arm.com/tools-and-software/simulation-models/fixed-virtual-platforms
> > -# and put in the sub-directory 'licensed/silver.arm.com' of one of the
> > -# following locations:
> > -# - in the directory 'files' of this file directory
> > -# - in your Yocto project download directory (DL_DIR parameter of local.conf)
> > -# - in your Download mirror if you have one
> > -SRC_URI = "file://licensed/silver.arm.com/FM000-KT-00173-${PV}.tgz"
> > -SRC_URI += "file://start-fvp-base.sh"
> > -
> > -S = "${WORKDIR}/Base_RevC_AEMv8A_pkg"
> > -
> > -# Checksums to compare against downloaded package files' checksums
> > -LIC_FILES_CHKSUM = " \
> > -    file://license_terms/license_agreement.txt;md5=ae7b47c67a033995c6b4510476a50f03 \
> > -    file://license_terms/redistributables.txt;md5=f9fafcaf37ce6c9427568b9dbdbaabe5 \
> > -    file://license_terms/supplementary_terms.txt;md5=26e4b214f639a22c8e7e207abc10eccb \
> > -    file://license_terms/third_party_licenses.txt;md5=1aa4ab9ee0642b1bc92063d29426c25f \
> > -    "
> > -
> > -require fvp-native.inc
> > -
> > -do_install_append() {
> > -    cp -a --no-preserve=ownership -rf bin doc fmtplib license_terms models \
> > -        plugins scripts ${D}/${datadir}/fvp/.
> > -
> > -    cat <<EOF > ${D}${bindir}/FVP_Base_RevC-2xAEMv8A
> > -#!/bin/bash
> > -basedir=\$(cd \$(dirname \$0)/../../; pwd)
> > -export LD_LIBRARY_PATH="\$basedir/lib:\$basedir/usr/lib"
> > -\$basedir/usr/share/fvp/models/Linux64_GCC-4.9/FVP_Base_RevC-2xAEMv8A "\$@"
> > -EOF
> > -    chmod 755 ${D}${bindir}/FVP_Base_RevC-2xAEMv8A
> > -}
> > -
> > -do_deploy_append() {
> > -    install -m 755 ${WORKDIR}/start-fvp-base.sh ${DEPLOYDIR}/.
> > -}
> > diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/fvp-native.inc b/meta-arm-bsp/recipes-devtools/fvp-common/fvp-native.inc
> > deleted file mode 100644
> > index 4107080..0000000
> > --- a/meta-arm-bsp/recipes-devtools/fvp-common/fvp-native.inc
> > +++ /dev/null
> > @@ -1,34 +0,0 @@
> > -# Fixed Virtual Platform (FVP) executable installation recipe
> > -
> > -#
> > -# Package specific information like checksums and source information captured
> > -# in specific bb files.
> > -#
> > -
> > -SUMMARY = "Arm Fixed Virtual Platform"
> > -HOMEPAGE = "https://developer.arm.com/tools-and-software/simulation-models/fixed-virtual-platforms"
> > -LICENSE = "Proprietary & GPLv2 & Apache-2"
> > -
> > -
> > -inherit native deploy
> > -
> > -do_configure[noexec] = "1"
> > -do_compile[noexec] = "1"
> > -
> > -do_install() {
> > -    install -d ${D}/${datadir}/fvp
> > -    install -d ${D}${bindir}
> > -}
> > -FILES_${PN} = "${datadir}/fvp/* ${bindir}/*"
> > -INSANE_SKIP_${PN} += "already-stripped"
> > -
> > -# This is required so that our binaries are in the sysroot. We need this
> > -# to have both fvp required libraries and fvp in the same sysroot.
> > -addtask addto_recipe_sysroot after do_populate_sysroot before do_build
> > -
> > -do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_TOOLS}"
> > -do_deploy() {
> > -    install -d ${DEPLOYDIR}
> > -}
> > -addtask deploy before do_build after do_compile
> > -
> > -- 
> > 2.7.4
> > 
> > 
> 

> 

