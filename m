Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web12.3253.1592470136378203886
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jun 2020 01:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=j8sUNpx3;
 spf=pass (domain: linaro.org, ip: 209.85.208.194, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f194.google.com with SMTP id y11so6239703ljm.9
        for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jun 2020 01:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DpKTI4hoKeG2bmi32OylaruVBWMkZMX3mHO7++OLuyY=;
        b=j8sUNpx3wCSVdgXikUL2uSwAfYikVsIwWzVADyt1ICZWSBfB0s+80LLP/mKCUpiHBm
         LaO74gPADnEXAC5pz26te/rQ1DyMC7oHKavkYRrP1eRy3MqeDKHCshaBLCLEp+6z3MfN
         A/SrrmMo3vE3C11FNwFpvTawWkOfpqYm9EMZqiMStIh3ridKEUrZ3mrOvO9H1fuN/5X3
         jiIBlwqxWoWgL0AM9Q3E1yQmuGGuXBCGAN7uKQwDiQG2+VCVvLI4Ax1ZuBXX+91w+Mzc
         5JIVkhuMOoqWw7GJ8ZWNd2tPRdW3wwZlduiTSZPoq3HlN3K4HHiQE5HqeymxQgu5XnwG
         MuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DpKTI4hoKeG2bmi32OylaruVBWMkZMX3mHO7++OLuyY=;
        b=YL0icseO4aUMc7RItCFGmJ5TjFDJh9HTLglXy4RNkpxTBcyNGVQDVGRgSE7DDDOhbj
         Dn9/jVrvTVL66KlLhjYT14JLVgH9B7jSDN6sHqb9fpOmbqm5JOkYPLpO6zJgCCjs/mts
         TDsyvULGAwMCAcOi9ptbe2+TIzvQY8tTyvnqMSpp5wmwci9qTl0yEL7AhPvFTk6fWdLi
         SRN9+OSdUAF5WULnknl0efryQ374vAMIuMWJg4k4A8VGNjAnK567l2/d8beg3SBZycK4
         gLfoijyPltabkaTLL1isb0qB1ZjpR6HEvosEZucxtYwbZN7SfJThWQCJ7EHj9GoAgmgC
         sD1w==
X-Gm-Message-State: AOAM5303KOy+8+LmqTZbn8zFOLZryIWYMM7OCFBxYM8V3mxJQf5A6tF+
	nZCl1ztoA+ZBIwTAJffWF66OMoGwHjmPliQdet4+yw==
X-Google-Smtp-Source: ABdhPJw96krAWB8edt0rHi9g20Q3wCkMZkoGaLudN1U7nZpaCPXH18vcuX12nu5Do8RbvcvRjfZHrJ2kPlJdaOrMyL4=
X-Received: by 2002:a2e:5c47:: with SMTP id q68mr1939096ljb.30.1592470134447;
 Thu, 18 Jun 2020 01:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <1592464867-12851-1-git-send-email-denis@denix.org>
In-Reply-To: <1592464867-12851-1-git-send-email-denis@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Thu, 18 Jun 2020 14:18:43 +0530
Message-ID: <CAFA6WYO3s8iVRMDzgGYN0jdNQZw5L+BTNK0kxLvTUXS+wrPt1w@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] external-arm-toolchain: Add specific licenses for individual packages
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Jun 2020 at 12:51, Denys Dmytriyenko <denis@denix.org> wrote:
>
> From: Sumit Garg <sumit.garg@linaro.org>
>
> Add license.inc file to state license of various packages provided by
> pre-built Arm toolchain.
>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> This uses new EAT_*_LICENSE defines from external-arm-toolchain-versions.inc
>

This isn't something I meant via rebase as it introduces fragile
dependencies among patch-sets. Instead this change should be part of
the patch where you introduce new EAT_*_LICENSE defines in
external-arm-toolchain-versions.inc at first place.

Also, these defines will only be meaningful in
external-arm-toolchain-versions.inc when there are multiple recipes
(with external-arm-sdk-toolchain recipe) dependent on them.

So, IMO, we should go ahead with the v3 version of this patch.

-Sumit

>  .../external-arm-toolchain.bb                      |  4 +-
>  .../external-arm-toolchain/license.inc             | 73 ++++++++++++++++++++++
>  2 files changed, 75 insertions(+), 2 deletions(-)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
>
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> index 14a585f..7d59d8e 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> @@ -1,9 +1,9 @@
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
> index 0000000..53641b4
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> @@ -0,0 +1,73 @@
> +LICENSE = "${EAT_LICENSE}"
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
> +LICENSE_libasan-dev = "${EAT_RLE_LICENSE}"
> +LICENSE_libasan = "${EAT_RLE_LICENSE}"
> +LICENSE_libasan-staticdev = "${EAT_RLE_LICENSE}"
> +LICENSE_libatomic-dev = "${EAT_RLE_LICENSE}"
> +LICENSE_libatomic = "${EAT_RLE_LICENSE}"
> +LICENSE_libatomic-staticdev = "${EAT_RLE_LICENSE}"
> +LICENSE_libg2c-dev = "${EAT_RLE_LICENSE}"
> +LICENSE_libg2c = "${EAT_RLE_LICENSE}"
> +LICENSE_libgcc-dev = "${EAT_RLE_LICENSE}"
> +LICENSE_libgcc = "${EAT_RLE_LICENSE}"
> +LICENSE_libgfortran-dbg = "${EAT_RLE_LICENSE}"
> +LICENSE_libgfortran-dev = "${EAT_RLE_LICENSE}"
> +LICENSE_libgfortran = "${EAT_RLE_LICENSE}"
> +LICENSE_libgfortran-staticdev = "${EAT_RLE_LICENSE}"
> +LICENSE_libgomp-dev = "${EAT_RLE_LICENSE}"
> +LICENSE_libgomp = "${EAT_RLE_LICENSE}"
> +LICENSE_libgomp-staticdev = "${EAT_RLE_LICENSE}"
> +LICENSE_libitm-dev = "${EAT_RLE_LICENSE}"
> +LICENSE_libitm = "${EAT_RLE_LICENSE}"
> +LICENSE_libitm-staticdev = "${EAT_RLE_LICENSE}"
> +LICENSE_liblsan-dev = "${EAT_RLE_LICENSE}"
> +LICENSE_liblsan = "${EAT_RLE_LICENSE}"
> +LICENSE_liblsan-staticdev = "${EAT_RLE_LICENSE}"
> +LICENSE_libmudflap-dev = "${EAT_RLE_LICENSE}"
> +LICENSE_libmudflap = "${EAT_RLE_LICENSE}"
> +LICENSE_libmudflap-staticdev = "${EAT_RLE_LICENSE}"
> +LICENSE_libquadmath-dev = "${EAT_RLE_LICENSE}"
> +LICENSE_libquadmath = "${EAT_RLE_LICENSE}"
> +LICENSE_libquadmath-staticdev = "${EAT_RLE_LICENSE}"
> +LICENSE_libssp-dev = "${EAT_RLE_LICENSE}"
> +LICENSE_libssp = "${EAT_RLE_LICENSE}"
> +LICENSE_libssp-staticdev = "${EAT_RLE_LICENSE}"
> +LICENSE_libstdc++-dbg = "${EAT_RLE_LICENSE}"
> +LICENSE_libstdc++-dev = "${EAT_RLE_LICENSE}"
> +LICENSE_libstdc++ = "${EAT_RLE_LICENSE}"
> +LICENSE_libstdc++-precompile-dev = "${EAT_RLE_LICENSE}"
> +LICENSE_libstdc++-staticdev = "${EAT_RLE_LICENSE}"
> +LICENSE_libtsan-dev = "${EAT_RLE_LICENSE}"
> +LICENSE_libtsan = "${EAT_RLE_LICENSE}"
> +LICENSE_libtsan-staticdev = "${EAT_RLE_LICENSE}"
> +LICENSE_libubsan-dev = "${EAT_RLE_LICENSE}"
> +LICENSE_libubsan = "${EAT_RLE_LICENSE}"
> +LICENSE_libubsan-staticdev = "${EAT_RLE_LICENSE}"
> +
> +LICENSE_linux-libc-headers-dev = "GPLv2"
> +LICENSE_linux-libc-headers = "GPLv2"
> +
> +LICENSE_gdbserver = "${EAT_GDB_LICENSE}"
> --
> 2.7.4
>
