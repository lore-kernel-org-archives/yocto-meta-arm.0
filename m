Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web12.17969.1604954381181435574
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 12:39:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=PMkBpKor;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id l2so9327197qkf.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 09 Nov 2020 12:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5bwUWiytKAgWujka2tTKCdrwYkGaRyYYyI4W+DCVrHA=;
        b=PMkBpKordqZE279HQVUV1xvIzc7n3lF+QUJV5lMq0Zuu0xRaXamrovtS52rlQLouNI
         PTWdj7cj6bzhp+C4UJfBZ/aP5c5RUPCzXwf+0iaWXQLUH4AWpA49O1QaOXh8ow+QIm1E
         TFLdtKUtGpu5zRwgxjBE5TE0JezkPOi94uMt/Kyv1SxZBJRak5Rw5cybli7ZYX0Mj0kL
         NUoDFbegrbtZqYjyyp8GIE+0yS2dtz0PmIP8MBvXPj/WPO0s1SFOOZLfWAh1O97SIvFJ
         ugrkD3/4O72ZH+90zoyEPPKG84wns5U+BTX+W9cdfD62ray1cuSphpGEOS1G2O0Yz24l
         D25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5bwUWiytKAgWujka2tTKCdrwYkGaRyYYyI4W+DCVrHA=;
        b=ICMHFXbS0N1tjvIMXI0TbOdsx9a7ydUTUXjpDRi/dqeKAovCbi70yPETK8UkNvY/+C
         NSLstwhzJcMtLW09oKJs9kvQq5AHyHjRbPv6pgmGlpWjpaEmtGcLFMw4s2QN5h8aLCSw
         A/Pv6tffS3to8mkfXgA5cEkkW5mllxlHA/eNHEyz0e/2Dm5aUNFvPJw4okPhr2hKw9kU
         jnOPXrvn7x2x+b/QE3inNzefSj1I7lRWNXWT/6Vw95yi2Oh0JZXlImhB8k4SbBSMhj+K
         AMk1u/+jJcdAmKJv7ameEfwSbsO6SZQg8TKpWopVBL7T4U+LgFHCywPAjVKhtTkXOESE
         Wemg==
X-Gm-Message-State: AOAM530YGwEzVBM1NJBolwE10pp7/Z12CnQS/8jmk5rXonYDzVfNaEEk
	3uS6gmdHsgwFtdrZuDPNT54nZw==
X-Google-Smtp-Source: ABdhPJxmKzwj9KnjK54B1BaGabk2smKXXrr2fJuilmtdgkWriEHEqqgtgtocRBtmjZRhJZNxDoALrQ==
X-Received: by 2002:a37:4953:: with SMTP id w80mr15122366qka.35.1604954380299;
        Mon, 09 Nov 2020 12:39:40 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:e05c:37c6:4b68:d472])
        by smtp.gmail.com with ESMTPSA id h125sm7092323qkc.36.2020.11.09.12.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 12:39:39 -0800 (PST)
Date: Mon, 9 Nov 2020 15:39:38 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp/n1sdp-board-firmware: rewrite recipe
Message-ID: <20201109203937.GC17359@kudzu.us>
References: <20201109093527.3951337-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201109093527.3951337-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 09, 2020 at 09:35:27AM +0000, Ross Burton wrote:
> Any recipe that needs to use RM_WORK_EXCLUDE is either being very clever
> or is breaking expectations.  This recipe is doing several things in
> non-idiomatic ways that breaks other tools, for example the source
> doesn't exist in do_unpack.
> 
> Rename from board-firmware-n1sdp to n1sdp-board-firmware to match the
> repository name.
> 
> As this recipe simply ships some precompiled binary, set
> INHIBIT_DEFAULT_DEPS to avoid depending on the toolchain to reduce how
> often it needs to be rebuilt.
> 
> Unpack normally and promptly delete the large SOFTWARE/ directory that
> we don't care about, instead of unpacking in do_install.
> 
> Ensure deploy is scheduled appropriately.
> 
> Remove LICENSE_FLAGS, this is for licenses which need to be opted-in.
> Setting LICENSE_FLAGS and then enabling it by default makes no sense.
> 
> Change-Id: I1fe906634977d323086de6f6c67a9c45aeb7585e
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Patch pushed to master.

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/machine/n1sdp.conf          |  2 -
>  .../images/board-firmware-n1sdp_2020.07.27.bb | 53 -------------------
>  .../images/n1sdp-board-firmware_2020.07.27.bb | 34 ++++++++++++
>  .../images/sdcard-image-n1sdp_0.1.bb          |  2 +-
>  4 files changed, 35 insertions(+), 56 deletions(-)
>  delete mode 100644 meta-arm-bsp/recipes-bsp/images/board-firmware-n1sdp_2020.07.27.bb
>  create mode 100644 meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2020.07.27.bb
> 
> diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
> index 3d31c4c..8cadf44 100644
> --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> @@ -39,6 +39,4 @@ EFI_PROVIDER ?= "grub-efi"
>  MACHINE_FEATURES += "efi"
>  
>  # SD-Card firmware
> -# Board firmware prebuilts are shared under custom license
> -LICENSE_FLAGS_WHITELIST += "stm-sla0044"
>  EXTRA_IMAGEDEPENDS += "sdcard-image-n1sdp"
> diff --git a/meta-arm-bsp/recipes-bsp/images/board-firmware-n1sdp_2020.07.27.bb b/meta-arm-bsp/recipes-bsp/images/board-firmware-n1sdp_2020.07.27.bb
> deleted file mode 100644
> index 8f7b6c1..0000000
> --- a/meta-arm-bsp/recipes-bsp/images/board-firmware-n1sdp_2020.07.27.bb
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -DESCRIPTION = "Board Firmware binaries for N1SDP"
> -
> -# Board-firmware-n1sdp custom license is whitelisted in n1sdp.conf file.
> -# Uncomment, or copy this line to your local.conf to build board firmware,
> -# if you are using custom n1sdp.conf file.
> -# Please make sure to check the applicable license beforehand!
> -#LICENSE_FLAGS_WHITELIST = "stm-sla0044"
> -
> -LICENSE = "STM-SLA0044-Rev5"
> -LICENSE_FLAGS = "stm-sla0044"
> -
> -LIC_FILES_CHKSUM = "file://${S}/LICENSES/STM.TXT;md5=4b8dab81d0bfc0a5f63c9a983402705b"
> -
> -SECTION = "firmware"
> -
> -inherit deploy
> -
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
> -COMPATIBLE_MACHINE = "n1sdp"
> -RM_WORK_EXCLUDE += "${PN}"
> -
> -PV = "2020.07.27"
> -TAG = "N1SDP-${PV}"
> -FIRMWARE_TARBALL = "n1sdp-board-firmware-${TAG}"
> -UNPACK_DIR = "n1sdp-board-firmware_source"
> -S = "${WORKDIR}/${UNPACK_DIR}"
> -
> -SRC_URI = "https://git.linaro.org/landing-teams/working/arm/n1sdp-board-firmware.git/snapshot/${FIRMWARE_TARBALL}.tar.gz;unpack=0"
> -SRC_URI[md5sum] = "8ba3807ff8f222201154861f11524b14"
> -SRC_URI[sha256sum] = "57feba404026f2d6d49c167d63e0e84653ad8b808b13e2244b81fea9e0d58d66"
> -
> -do_configure[noexec] = "1"
> -do_compile[noexec] = "1"
> -
> -do_install() {
> -    cd ${WORKDIR}
> -    tar -xvaf ${WORKDIR}/${FIRMWARE_TARBALL}.tar.gz --exclude=${FIRMWARE_TARBALL}/SOFTWARE/*
> -    mv -v ${WORKDIR}/${FIRMWARE_TARBALL}/* ${S}
> -
> -    cp -R --no-dereference --preserve=mode,links -v ${S} ${D}
> -}
> -do_install[dirs] += "${S}"
> -do_install[cleandirs] += "${S}"
> -
> -FILES_${PN} = "/${UNPACK_DIR}/*"
> -SYSROOT_DIRS += "/${UNPACK_DIR}"
> -addtask install after do_unpack before do_populate_lic
> -
> -do_deploy() {
> -    cp -av ${S} ${DEPLOYDIR}
> -}
> -addtask deploy after do_install
> diff --git a/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2020.07.27.bb b/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2020.07.27.bb
> new file mode 100644
> index 0000000..1551ac9
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2020.07.27.bb
> @@ -0,0 +1,34 @@
> +SUMMARY = "Board Firmware binaries for N1SDP"
> +SECTION = "firmware"
> +
> +LICENSE = "STM-SLA0044-Rev5"
> +LIC_FILES_CHKSUM = "file://LICENSES/STM.TXT;md5=4b8dab81d0bfc0a5f63c9a983402705b"
> +
> +inherit deploy
> +
> +INHIBIT_DEFAULT_DEPS = "1"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +COMPATIBLE_MACHINE = "n1sdp"
> +
> +SRC_URI = "https://git.linaro.org/landing-teams/working/arm/n1sdp-board-firmware.git/snapshot/${BPN}-N1SDP-${PV}.tar.gz"
> +SRC_URI[sha256sum] = "57feba404026f2d6d49c167d63e0e84653ad8b808b13e2244b81fea9e0d58d66"
> +
> +S = "${WORKDIR}/${BPN}-N1SDP-${PV}"
> +
> +INSTALL_DIR = "/n1sdp-board-firmware_source"
> +
> +do_install() {
> +    rm -rf ${S}/SOFTWARE
> +    install -d ${D}${INSTALL_DIR}
> +    cp -Rp --no-preserve=ownership ${S}/* ${D}${INSTALL_DIR}
> +}
> +
> +FILES_${PN} = "${INSTALL_DIR}"
> +SYSROOT_DIRS += "${INSTALL_DIR}"
> +
> +do_deploy() {
> +    install -d ${DEPLOYDIR}${INSTALL_DIR}
> +    cp -Rp --no-preserve=ownership ${S}/* ${DEPLOYDIR}${INSTALL_DIR}
> +}
> +addtask deploy after do_install before do_build
> diff --git a/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb b/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
> index 68b13eb..13fa560 100644
> --- a/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
> +++ b/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
> @@ -4,7 +4,7 @@ inherit deploy nopackages
>  
>  DEPENDS = "virtual/uefi-firmware \
>             virtual/control-processor-firmware \
> -           board-firmware-n1sdp"
> +           n1sdp-board-firmware"
>  
>  LICENSE = "MIT"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> -- 
> 2.25.1
> 

> 
> 
> 

