Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.13428.1591936014838630347
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 21:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3C7D040C37;
	Fri, 12 Jun 2020 04:26:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F8GRLdgVxtIv; Fri, 12 Jun 2020 04:26:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D75E040A46;
	Fri, 12 Jun 2020 04:26:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CD9B8173217; Fri, 12 Jun 2020 00:26:47 -0400 (EDT)
Date: Fri, 12 Jun 2020 00:26:47 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, pbarker@konsulko.com, wmills@ti.com,
	richard.purdie@linuxfoundation.org, daniel.thompson@linaro.org
Subject: Re: [PATCH v2 5/5] external-arm-toolchain: Add package specific licenses
Message-ID: <20200612042647.GJ17660@denix.org>
References: <1591796582-5015-1-git-send-email-sumit.garg@linaro.org>
 <1591796582-5015-6-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1591796582-5015-6-git-send-email-sumit.garg@linaro.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 10, 2020 at 07:13:02PM +0530, Sumit Garg wrote:
> Add license.inc file to state license of various packages provided by
> pre-built Arm tool-set.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>

Reviewed-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  .../external-arm-toolchain.bb                      |  4 +-
>  .../external-arm-toolchain/license.inc             | 76 ++++++++++++++++++++++
>  2 files changed, 78 insertions(+), 2 deletions(-)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> 
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> index 7c7c607..6968536 100644
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
>  	file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302 \
>  	file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420 \
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
