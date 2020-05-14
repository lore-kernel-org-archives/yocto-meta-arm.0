Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web10.6832.1589432651770152215
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 May 2020 22:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ehdHgxTO;
 spf=pass (domain: linaro.org, ip: 209.85.167.67, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f67.google.com with SMTP id c21so1468550lfb.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 13 May 2020 22:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ccz6L4OxnyUU7MBKb8oIYmLyWEFWW4hkUKKrO48EeLU=;
        b=ehdHgxTO5pkwlTbpkJehVFxc6GtkgJqx80NZdGNCaRc5sOP0Z001ysKS0ZpKPKfxho
         X/vNji9dsSDzemQ1Wd63BBdR1DieE16t4hfpIy35pGPmeT9iD1KQHXygQk/i34IjSZNt
         vht6wt51kJ6CXwm5Ytg7IhpQlvRqChobS3x0kHipF0Y8nc9ckGtqhW2Z36QD/0QxqAa0
         DqETvqgS/e9y6uSFsDJeIx0yf/HASC2Qz2/60pkdGkZNvTMRaNQoRa1Qy+Bdz/OZSmmm
         AOdVjuhJHSiZza/x1PnRu3apYp6KTqslh5IQImWEqExHzbv5ZHXu+9vKGPRJf++eva7N
         v2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ccz6L4OxnyUU7MBKb8oIYmLyWEFWW4hkUKKrO48EeLU=;
        b=VBZ2Z4lw7XHmTRI6aThDYRpgOTeuslGDNr8Ux3IMnwaWAHPDi1iOgnLRVHKcsFCeyL
         EcYQqT0mX011DcI10SlGv2DnVNDMC5BN/3PNBhBj96TEn1ofHAiCMGEpdWr26x6RrNMC
         jOoxIhww8UE4FwNEID+rUWfnrWWxwOpav8d5CdhA0qktFbXxNyCNCsrsp533MdTOrOZq
         I1Elt+nA8L83Haskpne7/R//pOTk4mhqNj63QdBa8znZi1vDepBAtxoP9E+jWnI37Zda
         DOCCEmqlNOrdWz8emONf/Kga6E1GwaMXgYjv2eyMa+uxAVN26BhnAu+VbOajAifOe2Kr
         65Yg==
X-Gm-Message-State: AOAM530TWp6NYPKvRqVBPYtj5s0D5O74bUsP7RWZJW+sMl9NuMLdgV98
	U7iOvV5JzU+4Fqnw2iNRRyuTCrQiVJ/wBBITy72IYg==
X-Google-Smtp-Source: ABdhPJxiC6mxiKvOWD8Rola+md6styy5NngYKrc6xCzh9cOhhmQFlhIAw7q7D7rhmrtG+PBl1EybhcA92MiUyDxTHHE=
X-Received: by 2002:ac2:44bb:: with SMTP id c27mr1991182lfm.40.1589432649796;
 Wed, 13 May 2020 22:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200514024932.19962-1-jdmason@kudzu.us>
In-Reply-To: <20200514024932.19962-1-jdmason@kudzu.us>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Thu, 14 May 2020 10:33:58 +0530
Message-ID: <CAFA6WYNWT3pAPSFEsUietGvfNiDx1qBsD2jpqXYZW=ioYFrsZA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-toolchain: gcc-arm-none-eabi-native: Add recipe
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, Joshua Watt <JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jon,

On Thu, 14 May 2020 at 08:19, Jon Mason <jdmason@kudzu.us> wrote:
>
> Adds a recipe to pull down the prebuilt GCC for compiling on Cortex-R
> and Cortex-M processors from ARM. This toolchain is required to build
> Arm Trusted Firmware for the Rockchip rk3399 SoC, since it must compile
> some firmware for the M0 coprocessor.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  ...cc-arm-none-eabi-native_9-2019-q4-major.bb | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-none-eabi-native_9-2019-q4-major.bb
>
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-none-eabi-native_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-none-eabi-native_9-2019-q4-major.bb

This recipe seems to install the pre-built (external) GCC tool-set for
Cortex-R and Cortex-M. So I would suggest you to import it under
"meta-arm-toolchain/recipes-devtools/external-arm-toolchain/"
directory rather than "meta-arm-toolchain/recipes-devtools/gcc/"
directory as it is meant for recipes used to build ARM GCC tool-set
from source.

-Sumit

> new file mode 100644
> index 0000000..a0c832d
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-none-eabi-native_9-2019-q4-major.bb
> @@ -0,0 +1,37 @@
> +# Copyright (C) 2019 Garmin Ltd. or its subsidaries
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +DESCRIPTION = "Baremetal GCC for ARM-R and ARM-M processors"
> +LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> +
> +LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c18349634b740b7b95f2c2159af888f5"
> +
> +PROVIDES = "virtual/arm-none-eabi-gcc"
> +
> +SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/RC2.1/${BPN}-${PV}-x86_64-linux.tar.bz2"
> +
> +SRC_URI[md5sum] = "fe0029de4f4ec43cf7008944e34ff8cc"
> +SRC_URI[sha256sum] = "bcd840f839d5bf49279638e9f67890b2ef3a7c9c7a9b25271e83ec4ff41d177a"
> +
> +S = "${WORKDIR}/${BPN}-${PV}"
> +
> +inherit native
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
> +INSANE_SKIP_${PN} = "already-stripped"
> +
> +INHIBIT_SYSROOT_STRIP = "1"
> +INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> --
> 2.20.1
>
> 
