Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.984.1625011978092559743
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 29 Jun 2021 17:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8D1C640C90;
	Wed, 30 Jun 2021 00:12:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w4ow1ke3iDUT; Wed, 30 Jun 2021 00:12:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 608D340AB7;
	Wed, 30 Jun 2021 00:12:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1616717461C; Tue, 29 Jun 2021 20:12:55 -0400 (EDT)
Date: Tue, 29 Jun 2021 20:12:55 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: timothy.mertz@garmin.com
Cc: meta-arm@lists.yoctoproject.org, Joshua Watt <Joshua.Watt@garmin.com>
Subject: Re: [meta-arm] [PATCH v2] external-arm-sdk-toolchain: Fix parsing error with INCOMPATIBLE_LICENSE
Message-ID: <20210630001255.GC1528@denix.org>
References: <20210511150609.15943-1-Joshua.Watt@garmin.com>
 <20210629210207.32008-1-timothy.mertz@garmin.com>
MIME-Version: 1.0
In-Reply-To: <20210629210207.32008-1-timothy.mertz@garmin.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 29, 2021 at 04:02:07PM -0500, Timothy Mertz via lists.yoctoproject.org wrote:
> This change fixes parsing error that occurs when INCOMPATIBLE_LICENSE =
> "GPLv3" by defining EAT_BFD_LICENSE, EAT_GDB_LICENSE and EAT_RLE_LICENSE
> in license.inc and requiring it in external-arm-sdk-toolchain.bb
> 
> Definitions in external-arm-toolchain-versions.inc are made redundant so
> they are removed.
> 
> Signed-off-by: Timothy Mertz <timothy.mertz@garmin.com>
> Signed-off-by: Joshua Watt <Joshua.Watt@garmin.com>

Reviewed-by: Denys Dmytriyenko <denis@denix.org>


> ---
>  .../include/external-arm-toolchain-versions.inc    | 14 --------------
>  .../external-arm-sdk-toolchain.bb                  |  5 ++---
>  .../external-arm-toolchain/license.inc             |  3 +++
>  3 files changed, 5 insertions(+), 17 deletions(-)
> 
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

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
