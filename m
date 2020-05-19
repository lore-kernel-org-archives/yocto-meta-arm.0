Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web10.13779.1589901583499006532
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 May 2020 08:19:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=xPuAx7G0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f193.google.com with SMTP id 190so15617983qki.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 19 May 2020 08:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qx1vrjRjWCCp9qW2NOtCYDdhSB8JuM7N1tds+zmzP50=;
        b=xPuAx7G0O495JS/Hz3CVxlQgGPFVSkl+ZSSHs6Y1B/WU+UcB9TTebKCK5DhEDPL63u
         M8M3DbjZ0v8OGjFwZtt5qQtU8xvzPgwYXojcZlhhxAnzPIhDI2cIoa/9DTqR7AQS4XTc
         dqB+aL01X2BjcMOnCD1lbA69vGd6dyEgw0S4QQutRIIZFEWu/b8zz1bvN1aJQXv9FaVe
         HHQ8azRnpLAQvGUot05y07b9MRKeDuXP7AsHiPVFib43wDrG0t9GOnm0PIjQYZ6Q5q4F
         Wq3ps2qkoRuAUL63Tiwdree1q/7RnySsYk9Slj0IWUGhLEPr5UL5XIO9CM3mGSx5wRog
         ALyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qx1vrjRjWCCp9qW2NOtCYDdhSB8JuM7N1tds+zmzP50=;
        b=emzpK1BeHDhyonO47hi5pBM/F9q1txYTCML2Od+G0wj9b/zlytfalRc2CDaH690sI0
         aFTbaAnEkm/WZojHfDZpPumz/2iAvCmS7CM2hkoD0FX6oxlyPyNfx25Yum2sAZieSItz
         P5qxeO9UT/mad+8/tflm0WgTuHi1IbTIMKkqZbqR32aMmZusFLAAbwLP37WkR1Of/4tU
         moNt7JKvHOmknHCJSHwgRjtYeKIUAPgYLz80GvvYBldDXs+O2FQCqkuh3g/uakYqQJUS
         qRQkLhNYftxEwk9Qg5z5TvcM76y7/3w7RWScV73x6VZOvwkJc7nztHhHxmR71MGuz+8I
         OW3A==
X-Gm-Message-State: AOAM531eH93jQ6zXxYrp2+wG7EX+g1OnKS/KsDDowO0XeQbQDtU4wpyj
	f6vxp8VzHjv5+DVmL5E1WVKXlg==
X-Google-Smtp-Source: ABdhPJxOI7Oedq9XSBZOZn5T3jD5UDxtSeaQPifu/6g0D15ClgEibihwd46CUq9BLJZnwoguOEGbew==
X-Received: by 2002:a37:a455:: with SMTP id n82mr22551955qke.258.1589901582573;
        Tue, 19 May 2020 08:19:42 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:1ca0:41e:d9bc:f60c])
        by smtp.gmail.com with ESMTPSA id k57sm5923949qta.20.2020.05.19.08.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 08:19:42 -0700 (PDT)
Date: Tue, 19 May 2020 11:19:40 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Joshua Watt <JPEWhacker@gmail.com>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH v3] arm-toolchain: gcc-arm-none-eabi-native: Add recipe
Message-ID: <20200519151939.GC22197@kudzu.us>
References: <1589506580-40706-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1589506580-40706-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 14, 2020 at 09:36:20PM -0400, Denys Dmytriyenko wrote:
> From: Jon Mason <jdmason@kudzu.us>
> 
> Adds a recipe to pull down the prebuilt GCC for compiling on Cortex-R
> and Cortex-M processors from ARM. This toolchain is required to build
> Arm Trusted Firmware for the Rockchip rk3399 SoC, since it must compile
> some firmware for the M0 coprocessor.
> 
> This was originally taken from meta-rockchip, but has been modified from
> mailing list feedback.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>


Pulled in to the master branch.

Thanks,
Jon

> ---
> v3 changes:
> * rename recipe to not contain -native in the name
> * fix typo in "subsidiaries" word
> * use SUMMARY instead of DESCRIPTION
> * remove inherit native
> * add FILES_${PN} for nativesdk package
> * add extra INSANE_SKIP_${PN} due to prebuilt binary package
> 
>  .../gcc-arm-none-eabi_9-2019-q4-major.bb           | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
> 
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
> new file mode 100644
> index 0000000..84f6dba
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
> @@ -0,0 +1,39 @@
> +# Copyright (C) 2019 Garmin Ltd. or its subsidiaries
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY = "Baremetal GCC for ARM-R and ARM-M processors"
> +LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> +
> +LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c18349634b740b7b95f2c2159af888f5"
> +
> +PROVIDES = "virtual/arm-none-eabi-gcc"
> +
> +SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/${BPN}-${PV}-x86_64-linux.tar.bz2"
> +
> +SRC_URI[md5sum] = "fe0029de4f4ec43cf7008944e34ff8cc"
> +SRC_URI[sha256sum] = "bcd840f839d5bf49279638e9f67890b2ef3a7c9c7a9b25271e83ec4ff41d177a"
> +
> +S = "${WORKDIR}/${BPN}-${PV}"
> +
> +COMPATIBLE_HOST = "x86_64.*-linux"
> +
> +do_install() {
> +    install -d ${D}${datadir}/arm-none-eabi/
> +    cp -r ${S}/. ${D}${datadir}/arm-none-eabi/
> +
> +    install -d ${D}${bindir}
> +    # Symlink all executables into bindir
> +    for f in ${D}${datadir}/arm-none-eabi/bin/arm-none-eabi-*; do
> +        lnr $f ${D}${bindir}/$(basename $f)
> +    done
> +}
> +
> +FILES_${PN} = "${datadir} ${bindir}"
> +
> +INSANE_SKIP_${PN} = "already-stripped libdir staticdev file-rdeps"
> +
> +INHIBIT_SYSROOT_STRIP = "1"
> +INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +
> +BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.7.4
> 
