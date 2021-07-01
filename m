Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.6935.1625145538786391023
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 01 Jul 2021 06:18:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=fPzbnm9F;
 spf=pass (domain: linaro.org, ip: 209.85.210.45, mailfrom: sumit.garg@linaro.org)
Received: by mail-ot1-f45.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so6483755otl.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 01 Jul 2021 06:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W5IoMMDM2jjkxLbLgZRmx9K3u7XPXXYnr4Xc4okTPLA=;
        b=fPzbnm9FHw9IHClpTfeghJBJjViOG2YCq8QOUB6SkArCiESAZMLZ3H0HhUa59pXFPA
         0rW5HkEYHTjUnkSWIdk80I5cl4nVxp6fzCcjKjRzsUPm/frqv4FHQBHlfppm7Oc9Ls/E
         DRu4BkQ7mU5OzCYLV9T+H9mK6wlB43P2cEWc4SxFjGot6TMUbkmHDN0XgPBXOYVgymUs
         BhRTzOMRf6pa/Uu1rnkZE2Ac/ighEKayfqGBoVBZe3+5wL/Xg30lXHFS7I10Szi9Fq2p
         KvovcL3eyYN/AU6yf+M0n4XvhqkqYTZG8bQVOGhyK+05M1jteLCwKnlnQeMp7sW7URNo
         FUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W5IoMMDM2jjkxLbLgZRmx9K3u7XPXXYnr4Xc4okTPLA=;
        b=QloZGGtP6VmDn74pkcxDCLdVBgmnVcl9slBxcAASuA8hVTNzuxH7f1jTOzFOzEg4Di
         qW46oRVT7RbCA5n+AE3IpDgNgzfyg/wB7Gcjlh7rg/jM7ka044nY6sWjW03e2CXBDtqj
         5BlKtkOD4KjBjyo3mADFXjowMvV1KhcTyU+INScdI9MxxonkC3vu37xudMDny2U9mAAh
         +xDO90Yaq6+2LUtTloFqav49qUdoVixqsy7J/4FHlOyF+gRfAPGGWG0L4t42aP4c7zi0
         yRYMWY+NUvF69HUpB/yo6YKUmfFqC1NR5gVuDP0wDHpVq6bbi4yWl4K+b1a+zhkRPX1F
         utDQ==
X-Gm-Message-State: AOAM532mJaqC89DX0QGOq0aLaWABiJwa7yHYIWh+RAms/DOMD9hib3hY
	28ws4JBDTLgzJp7a46oBKHQ81VujYr0fZVcqaIDm/g==
X-Google-Smtp-Source: ABdhPJx9crN0a9hxpnB5eKlDw6MUpUJiO2N3gMwF3W2wHVKpgH7sKgAZo7AaTY2SUAXm9uQIdwPZuOm/IvVv9XHvd/E=
X-Received: by 2002:a05:6830:1101:: with SMTP id w1mr10918412otq.156.1625145538131;
 Thu, 01 Jul 2021 06:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210511150609.15943-1-Joshua.Watt@garmin.com> <20210629210207.32008-1-timothy.mertz@garmin.com>
In-Reply-To: <20210629210207.32008-1-timothy.mertz@garmin.com>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Thu, 1 Jul 2021 18:48:47 +0530
Message-ID: <CAFA6WYOgiJEART1MUZXg_n=4RyS3791bvO_YiXS1grd8kJwMXA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v2] external-arm-sdk-toolchain: Fix parsing error with INCOMPATIBLE_LICENSE
To: Timothy Mertz <timothy.mertz@garmin.com>
Cc: meta-arm@lists.yoctoproject.org, Joshua Watt <Joshua.Watt@garmin.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Jun 2021 at 02:32, Timothy Mertz via lists.yoctoproject.org
<timothy.mertz=garmin.com@lists.yoctoproject.org> wrote:
>
> This change fixes parsing error that occurs when INCOMPATIBLE_LICENSE =
> "GPLv3" by defining EAT_BFD_LICENSE, EAT_GDB_LICENSE and EAT_RLE_LICENSE
> in license.inc and requiring it in external-arm-sdk-toolchain.bb
>
> Definitions in external-arm-toolchain-versions.inc are made redundant so
> they are removed.
>
> Signed-off-by: Timothy Mertz <timothy.mertz@garmin.com>
> Signed-off-by: Joshua Watt <Joshua.Watt@garmin.com>
> ---
>  .../include/external-arm-toolchain-versions.inc    | 14 --------------
>  .../external-arm-sdk-toolchain.bb                  |  5 ++---
>  .../external-arm-toolchain/license.inc             |  3 +++
>  3 files changed, 5 insertions(+), 17 deletions(-)
>

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

-Sumit

> diff --git a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> index 9d4f967..a89f2f0 100644
> --- a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> +++ b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> @@ -139,19 +139,5 @@ python external_arm_toolchain_version_handler () {
>      d.setVar('EAT_VER_KERNEL', eat_get_kernel_version(ld))
>      d.setVar('EAT_VER_GDB', eat_get_gdb_version(ld))
>      d.setVar('EAT_VER_BFD', eat_get_bfd_version(ld))
> -
> -    lc_libc = "LGPL-2.1"
> -    lc_gcc = "GPL-3.0"
> -    lc_rle = "GPL-3.0-with-GCC-exception"
> -    lc_gdb = "GPL-3.0"
> -    lc_bfd = "GPL-3.0"
> -
> -    d.setVar('EAT_LIBC_LICENSE', lc_libc)
> -    d.setVar('EAT_GCC_LICENSE', lc_gcc)
> -    d.setVar('EAT_RLE_LICENSE', lc_rle)
> -    d.setVar('EAT_GDB_LICENSE', lc_gdb)
> -    d.setVar('EAT_BFD_LICENSE', lc_bfd)
> -
> -    d.setVar('EAT_LICENSE', "%s & %s & %s & %s & %s" % (lc_libc, lc_gcc, lc_rle, lc_gdb, lc_bfd))
>  }
>  addhandler external_arm_toolchain_version_handler
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
> index 3f12b4d..4f0adce 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
> @@ -1,5 +1,7 @@
>  inherit cross-canadian
>
> +require license.inc
> +
>  PN = "external-arm-sdk-toolchain-${TARGET_ARCH}"
>  BPN = "external-arm-sdk-toolchain"
>  PV = "${EAT_VER_MAIN}"
> @@ -10,9 +12,6 @@ INHIBIT_SYSROOT_STRIP = "1"
>  INHIBIT_DEFAULT_DEPS = "1"
>  EXCLUDE_FROM_SHLIBS = "1"
>
> -EAT_LICENSE ??= ""
> -
> -LICENSE = "${EAT_LICENSE}"
>  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
>
>  # Skip packaging QA checks for prebuilt binaries
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> index b6ee42c..fcc9268 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> @@ -1,7 +1,10 @@
>  LICENSE = "GPL-3.0-with-GCC-exception & GPLv3 & GPLv2 & LGPLv3 & LGPLv2.1 & LGPLv2"
>
> +EAT_BFD_LICENSE = "GPL-3.0"
>  EAT_GCC_LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> +EAT_GDB_LICENSE = "GPL-3.0"
>  EAT_LIBC_LICENSE = "GPLv2 & LGPLv2.1"
> +EAT_RLE_LICENSE = "GPL-3.0-with-GCC-exception"
>
>  LICENSE_${PN} = "${EAT_LIBC_LICENSE}"
>  LICENSE_${PN}-dev = "${EAT_LIBC_LICENSE}"
> --
> 2.17.1
>
>
> 
>
