Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
 by mx.groups.io with SMTP id smtpd.web12.28450.1591618242906241172
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Jun 2020 05:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nSzEmTKV;
 spf=pass (domain: konsulko.com, ip: 209.85.167.194, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f194.google.com with SMTP id 25so14108778oiy.13
        for <meta-arm@lists.yoctoproject.org>; Mon, 08 Jun 2020 05:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=34NjDu+vyPFiuKKe/NiFzV3djXmqjucIeTKIre4tS2w=;
        b=nSzEmTKVs0uJbu0hZxeVWfRX0HlBdACioLJ4152QXQCMad2kbgW9Yz1zcoixt65vz+
         rMjMVtj7A2IuuN1BadiGf6M02Nwgl4a6mghD/acc4tCqJCXuVKHyIMYvuy8lmQX3KR4I
         oWw90X4oLIBbK6gQs53OJQ494XFBofJVRAxac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=34NjDu+vyPFiuKKe/NiFzV3djXmqjucIeTKIre4tS2w=;
        b=dANm8W/JYqsRSe4UUGGhyIJk0N4D6dZtRrmMJPl92VqxZTrdFeP90EYVL+EkY3opYq
         JVI/SLMZzj+DnvXaKF1oIb1KRt2zyYb8lO6K+FoaUjXHY3reP+b/TKmsTqrhgnbS97K6
         X55C7b8ftRR1irU5nM4HNdyCjnUVmDXglmqBNKKFvas9fL8qDR7towvPtCaCuc1/RDVw
         bEnmxkrEXxgJafhCrI8zjW2IJtiobdN2npyRRbHsp9Ljwo5jiire8nmA2I1xXHrSoLgG
         Vw1iJTAreITOrv+MXtp5G6cZnlqWhDLAJfM4grBCuLU1dwfQjNmoGl5wEpqER/0YTJNV
         lMtA==
X-Gm-Message-State: AOAM531IydxZJuWBt/HIIRJH71mZL/Fxe/JQTTwVBd4T7+6SC6WzSYw7
	J6wRFDl92+09OXqUe9oi0zJCXrDaHXufJUvSEYliVw==
X-Google-Smtp-Source: ABdhPJzCXPQS8Xk47lorZx1GXJinkeMqAzhZWWEklTUlCKV/ivVvQghqMrCTCy0fKuf8o7iUmEjGBwUAuCa6EoD01d0=
X-Received: by 2002:a54:439a:: with SMTP id u26mr9690899oiv.6.1591618242240;
 Mon, 08 Jun 2020 05:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <1591095894-15178-1-git-send-email-sumit.garg@linaro.org> <1591095894-15178-5-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1591095894-15178-5-git-send-email-sumit.garg@linaro.org>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Mon, 8 Jun 2020 13:10:31 +0100
Message-ID: <CAM9ZRVu8BnsMPBBsvWN7rHvWspOFvMeD5B+TnB0DYtE3BkhB2w@mail.gmail.com>
Subject: Re: [PATCH 4/4] external-arm-toolchain: Add package specific licenses
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Denys Dmytriyenko <denis@denix.org>, wmills@ti.com, 
	Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jun 2020 at 12:05, Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Add license.inc file to state license of various packages provided by
> pre-built Arm tool-set.
>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  .../external-arm-toolchain.bb                      |  6 +-
>  .../external-arm-toolchain/license.inc             | 76 ++++++++++++++++++++++
>  2 files changed, 80 insertions(+), 2 deletions(-)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
>
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> index 7f5a6f5..6bceed0 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> @@ -1,9 +1,11 @@
> +# This recipe is distributed under MIT license.
> +

This shouldn't be needed, see other recipes in the meta-arm layer.

>  require recipes-core/glibc/glibc-package.inc
>
> +require license.inc
> +
>  INHIBIT_DEFAULT_DEPS = "1"
>
> -# License applies to this recipe code, not the toolchain itself
> -LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "\
>         file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302 \
>         file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420 \
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> new file mode 100644
> index 0000000..b6ee42c
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> @@ -0,0 +1,76 @@
> +LICENSE = "GPL-3.0-with-GCC-exception & GPLv3 & GPLv2 & LGPLv3 & LGPLv2.1 & LGPLv2"
> +
> +EAT_GCC_LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> +EAT_LIBC_LICENSE = "GPLv2 & LGPLv2.1"
> +
> +LICENSE_${PN} = "${EAT_LIBC_LICENSE}"
> +LICENSE_${PN}-dev = "${EAT_LIBC_LICENSE}"
> +LICENSE_${PN}-doc = "${EAT_LIBC_LICENSE}"
> +LICENSE_${PN}-dbg = "${EAT_LIBC_LICENSE}"
> +LICENSE_${PN}-pic = "${EAT_LIBC_LICENSE}"
> +LICENSE_${PN}-utils = "${EAT_LIBC_LICENSE}"
> +LICENSE_${PN}-mtrace = "${EAT_LIBC_LICENSE}"
> +LICENSE_${PN}-gconv = "${EAT_LIBC_LICENSE}"
> +LICENSE_${PN}-extra-nss = "${EAT_LIBC_LICENSE}"
> +LICENSE_${PN}-thread-db = "${EAT_LIBC_LICENSE}"
> +LICENSE_${PN}-pcprofile = "${EAT_LIBC_LICENSE}"
> +LICENSE_${PN}-staticdev = "${EAT_LIBC_LICENSE}"
> +LICENSE_catchsegv = "${EAT_LIBC_LICENSE}"
> +LICENSE_glibc-extra-nss = "${EAT_LIBC_LICENSE}"
> +LICENSE_glibc-thread-db = "${EAT_LIBC_LICENSE}"
> +
> +LICENSE_libmemusage = "${EAT_LIBC_LICENSE}"
> +LICENSE_libsegfault = "${EAT_LIBC_LICENSE}"
> +LICENSE_libsotruss = "${EAT_LIBC_LICENSE}"
> +LICENSE_sln = "${EAT_LIBC_LICENSE}"
> +LICENSE_nscd = "${EAT_LIBC_LICENSE}"
> +LICENSE_ldd = "${EAT_LIBC_LICENSE}"
> +
> +LICENSE_libasan-dev = "${EAT_GCC_LICENSE}"
> +LICENSE_libasan = "${EAT_GCC_LICENSE}"
> +LICENSE_libasan-staticdev = "${EAT_GCC_LICENSE}"
> +LICENSE_libatomic-dev = "${EAT_GCC_LICENSE}"
> +LICENSE_libatomic = "${EAT_GCC_LICENSE}"
> +LICENSE_libatomic-staticdev = "${EAT_GCC_LICENSE}"
> +LICENSE_libg2c-dev = "${EAT_GCC_LICENSE}"
> +LICENSE_libg2c = "${EAT_GCC_LICENSE}"
> +LICENSE_libgcc-dev = "${EAT_GCC_LICENSE}"
> +LICENSE_libgcc = "${EAT_GCC_LICENSE}"
> +LICENSE_libgfortran-dbg = "${EAT_GCC_LICENSE}"
> +LICENSE_libgfortran-dev = "${EAT_GCC_LICENSE}"
> +LICENSE_libgfortran = "${EAT_GCC_LICENSE}"
> +LICENSE_libgfortran-staticdev = "${EAT_GCC_LICENSE}"
> +LICENSE_libgomp-dev = "${EAT_GCC_LICENSE}"
> +LICENSE_libgomp = "${EAT_GCC_LICENSE}"
> +LICENSE_libgomp-staticdev = "${EAT_GCC_LICENSE}"
> +LICENSE_libitm-dev = "${EAT_GCC_LICENSE}"
> +LICENSE_libitm = "${EAT_GCC_LICENSE}"
> +LICENSE_libitm-staticdev = "${EAT_GCC_LICENSE}"
> +LICENSE_liblsan-dev = "${EAT_GCC_LICENSE}"
> +LICENSE_liblsan = "${EAT_GCC_LICENSE}"
> +LICENSE_liblsan-staticdev = "${EAT_GCC_LICENSE}"
> +LICENSE_libmudflap-dev = "${EAT_GCC_LICENSE}"
> +LICENSE_libmudflap = "${EAT_GCC_LICENSE}"
> +LICENSE_libmudflap-staticdev = "${EAT_GCC_LICENSE}"
> +LICENSE_libquadmath-dev = "${EAT_GCC_LICENSE}"
> +LICENSE_libquadmath = "${EAT_GCC_LICENSE}"
> +LICENSE_libquadmath-staticdev = "${EAT_GCC_LICENSE}"
> +LICENSE_libssp-dev = "${EAT_GCC_LICENSE}"
> +LICENSE_libssp = "${EAT_GCC_LICENSE}"
> +LICENSE_libssp-staticdev = "${EAT_GCC_LICENSE}"
> +LICENSE_libstdc++-dbg = "${EAT_GCC_LICENSE}"
> +LICENSE_libstdc++-dev = "${EAT_GCC_LICENSE}"
> +LICENSE_libstdc++ = "${EAT_GCC_LICENSE}"
> +LICENSE_libstdc++-precompile-dev = "${EAT_GCC_LICENSE}"
> +LICENSE_libstdc++-staticdev = "${EAT_GCC_LICENSE}"
> +LICENSE_libtsan-dev = "${EAT_GCC_LICENSE}"
> +LICENSE_libtsan = "${EAT_GCC_LICENSE}"
> +LICENSE_libtsan-staticdev = "${EAT_GCC_LICENSE}"
> +LICENSE_libubsan-dev = "${EAT_GCC_LICENSE}"
> +LICENSE_libubsan = "${EAT_GCC_LICENSE}"
> +LICENSE_libubsan-staticdev = "${EAT_GCC_LICENSE}"
> +
> +LICENSE_linux-libc-headers-dev = "GPLv2"
> +LICENSE_linux-libc-headers = "GPLv2"
> +
> +LICENSE_gdbserver = "GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
> --
> 2.7.4
>


-- 
Paul Barker
Konsulko Group
