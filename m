Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web08.416.1610652242231832847
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 Jan 2021 11:24:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=YKnJxOkO;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id h4so9408014qkk.4
        for <meta-arm@lists.yoctoproject.org>; Thu, 14 Jan 2021 11:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Soe4fV8vNvAMR1pbjxN0JLMxCNgUDQ56JvEkzOf7E9A=;
        b=YKnJxOkOKCdRpompV3QUDsO8j85jaPeOzwt7xNND3/CDXrZuz0q1n5M/4A4VOX9TnK
         McXYds4b0DPqx1SmEyOtuZcEGirNVQRJsP08AMbXLBpEcX802yXSO1hWY5T4aBFIBP2C
         DkkTGWJlZZdVlAzn91rlG1TBQEyRbBlGkBTPAmf7cQA6zTUPaHh7+vSY0OprwDM172x7
         nwZwhdE8ixyXxK8hLvtdDPyh914jitlACyYIubnUOw1aZxpj9l2G6PoRqVx+5G/M0XLR
         ho6NkSa23AObinMBNjvuWVbBW5JgoQdkuDdcwm7OrvrJpflVGx7yybzn5OCkJdRYn6uu
         3oXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Soe4fV8vNvAMR1pbjxN0JLMxCNgUDQ56JvEkzOf7E9A=;
        b=RK1QwN+VR3iyv0lZR9yZOjKUAfD8WBXWcMegNwWugxUutwfjD6n3SHCwhohrNSBf5J
         eTlRtcZ/ZL+WmH6Zv5fK9XzcoPgao8tuoJioI2ZjI2XcOf2pn1APuW6Mm7SU8UDMzi7y
         8NjAfR2F9HiMW0t2lYqISOsUi4kmj11Sx0YyIbnA7B8jLpZTMyV7Mn7OgS6thGsyjGyg
         vHXN4Tj6f1zV+CGGrLVgf3sJ5rttMrNdmJRvFSX5VKMW6A2pvGle4seoIyudt77oKBvQ
         qNdf+I26iBWJGD3+2hhHA63+xKkAXRipGRhvbkfH/vu8AuexO2v5Jloecc7ozoqjS94L
         kOnA==
X-Gm-Message-State: AOAM532FSkKA5pT8/f4zoIyJvMVsEjdBjwkPK6M7i3MGYDLAtRWgMbar
	pTPz7IY3IyjMPirHE7g6wXUmrg==
X-Google-Smtp-Source: ABdhPJzYiO+SO7sXkLC+99KifTseKDI4P1GswyPJ99Cel6iqW63IlFc01tD8LuASN1iaIYMO192C2A==
X-Received: by 2002:a05:620a:81b:: with SMTP id s27mr8799806qks.385.1610652241408;
        Thu, 14 Jan 2021 11:24:01 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:1d40:95cb:6898:8d5])
        by smtp.gmail.com with ESMTPSA id 128sm3570696qki.26.2021.01.14.11.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 11:24:00 -0800 (PST)
Date: Thu, 14 Jan 2021 14:23:59 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 01/10] arm: Add hafnium support
Message-ID: <20210114192358.GG511@kudzu.us>
References: <20210112152049.3436645-1-arunachalam.ganapathy@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210112152049.3436645-1-arunachalam.ganapathy@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 12, 2021 at 03:20:40PM +0000, Arunachalam Ganapathy wrote:
> Initial recipe for hafnium[1]. This enables build for reference Secure
> Partition Manager (SPM) for systems that implement the Armv8.4-A
> Secure-EL2 extension.
> 
> Link: [1] https://www.trustedfirmware.org/projects/hafnium/
> 
> Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
> Change-Id: Ib256d8ca03c94131e308d962d786d5d6a656c256
> ---

Series pulled into master.

Thanks,
Jon

>  meta-arm/recipes-bsp/hafnium/hafnium_2.4.bb | 74 +++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 meta-arm/recipes-bsp/hafnium/hafnium_2.4.bb
> 
> diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.4.bb b/meta-arm/recipes-bsp/hafnium/hafnium_2.4.bb
> new file mode 100644
> index 0000000..3a52599
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.4.bb
> @@ -0,0 +1,74 @@
> +SUMMARY = "Hafnium"
> +DESCRIPTION = "A reference Secure Partition Manager (SPM) for systems that implement the Armv8.4-A Secure-EL2 extension"
> +LICENSE = "BSD-3-Clause & GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=782b40c14bad5294672c500501edc103"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +inherit deploy python3native
> +
> +SRC_URI = "gitsm://git.trustedfirmware.org/hafnium/hafnium.git;protocol=https"
> +SRCREV = "410a3acaf669c12d41fb4c57fcaf3ecee6fdba61"
> +S = "${WORKDIR}/git"
> +
> +COMPATIBLE_MACHINE ?= "invalid"
> +
> +# Default build 'reference'
> +HAFNIUM_PROJECT ?= "reference"
> +
> +# Platform must be set for each machine
> +HAFNIUM_PLATFORM ?= "invalid"
> +
> +# hafnium build directory
> +# Append _clang as the build rule in hafnium adds this to the platform name.
> +HAFNIUM_BUILD_DIR_PLAT = "out/${HAFNIUM_PROJECT}/${HAFNIUM_PLATFORM}_clang"
> +
> +# do_deploy will install everything listed in this variable. It is set by
> +# default to hafnium
> +HAFNIUM_INSTALL_TARGET ?= "hafnium"
> +
> +DEPENDS = "bison-native bc-native"
> +
> +# set project to build
> +EXTRA_OEMAKE += "PROJECT=${HAFNIUM_PROJECT}"
> +
> +do_compile_prepend() {
> +    # Hafnium expects 'python'. Create symlink python to python3
> +    real=$(which ${PYTHON})
> +    ln -snf $real $(dirname $real)/python
> +}
> +
> +do_install() {
> +    install -d -m 755 ${D}/firmware
> +    for bldfile in ${HAFNIUM_INSTALL_TARGET}; do
> +        processed="0"
> +        if [ -f ${S}/${HAFNIUM_BUILD_DIR_PLAT}/$bldfile.bin ]; then
> +            echo "Install $bldfile.bin"
> +            install -m 0755 ${S}/${HAFNIUM_BUILD_DIR_PLAT}/$bldfile.bin \
> +                ${D}/firmware/$bldfile-${HAFNIUM_PLATFORM}.bin
> +            ln -sf $bldfile-${HAFNIUM_PLATFORM}.bin ${D}/firmware/$bldfile.bin
> +            processed="1"
> +        fi
> +        if [ -f ${S}/${HAFNIUM_BUILD_DIR_PLAT}/$bldfile.elf ]; then
> +            echo "Install $bldfile.elf"
> +            install -m 0755 ${S}/${HAFNIUM_BUILD_DIR_PLAT}/$bldfile.elf \
> +                ${D}/firmware/$bldfile-${HAFNIUM_PLATFORM}.elf
> +            ln -sf $bldfile-${HAFNIUM_PLATFORM}.elf ${D}/firmware/$bldfile.elf
> +            processed="1"
> +        fi
> +        if [ "$processed" = "0" ]; then
> +            bberror "Unsupported HAFNIUM_INSTALL_TARGET target $bldfile"
> +            exit 1
> +        fi
> +    done
> +}
> +
> +FILES_${PN} = "/firmware"
> +SYSROOT_DIRS += "/firmware"
> +# skip QA tests: {'ldflags'}
> +INSANE_SKIP_${PN} = "ldflags"
> +
> +do_deploy() {
> +    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
> +}
> +addtask deploy after do_install
> -- 
> 2.29.2
> 

> 
> 
> 

