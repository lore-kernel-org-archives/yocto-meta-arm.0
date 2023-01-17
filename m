Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7655C3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 20:23:26 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.208365.1673987001478323368
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Jan 2023 12:23:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8864F40C87;
	Tue, 17 Jan 2023 20:23:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TRl8WTArTI-j; Tue, 17 Jan 2023 20:23:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 529E140C1C;
	Tue, 17 Jan 2023 20:23:16 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 673D41636FA; Tue, 17 Jan 2023 15:22:57 -0500 (EST)
Date: Tue, 17 Jan 2023 15:22:57 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Emekcan Aras <emekcan.aras@arm.com>
Cc: meta-arm@lists.yoctoproject.org, Jon.Mason@arm.com, Ross.Burton@arm.com,
	nd@arm.com
Subject: Re: [meta-arm] [PATCH 1/1] arm/optee: Cleaning optee-os-3.19 recipe
Message-ID: <20230117202257.GC22689@denix.org>
References: <20230117132441.44548-1-emekcan.aras@arm.com>
 <20230117132441.44548-2-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117132441.44548-2-emekcan.aras@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Jan 2023 20:23:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4291

On Tue, Jan 17, 2023 at 01:24:41PM +0000, Emekcan Aras wrote:
> From: Emekcan Aras <emekcan.aras@arm.com>
> 
> Removes the optee-os_3.19.inc file since optee-os.inc is very similar and
> cleans optee-os.inc.
> 
> Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
> ---
>  .../recipes-security/optee/optee-os-3_19.inc  | 82 -------------------
>  meta-arm/recipes-security/optee/optee-os.inc  |  6 +-
>  .../recipes-security/optee/optee-os_3.19.0.bb |  2 +-
>  3 files changed, 3 insertions(+), 87 deletions(-)
>  delete mode 100644 meta-arm/recipes-security/optee/optee-os-3_19.inc
> 
> diff --git a/meta-arm/recipes-security/optee/optee-os-3_19.inc b/meta-arm/recipes-security/optee/optee-os-3_19.inc
> deleted file mode 100644
> index 61475dcf..00000000
> --- a/meta-arm/recipes-security/optee/optee-os-3_19.inc
> +++ /dev/null
> @@ -1,82 +0,0 @@
> -SUMMARY = "OP-TEE Trusted OS"
> -DESCRIPTION = "Open Portable Trusted Execution Environment - Trusted side of the TEE"
> -HOMEPAGE = "https://www.op-tee.org/"
> -
> -LICENSE = "BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
> -
> -inherit deploy python3native
> -require optee.inc
> -
> -FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os-3.19.0:"
> -
> -CVE_PRODUCT = "linaro:op-tee op-tee:op-tee_os"
> -
> -DEPENDS = "python3-pyelftools-native python3-cryptography-native"
> -
> -DEPENDS:append:toolchain-clang = " compiler-rt"
> -
> -SRC_URI = "git://github.com/OP-TEE/optee_os.git;branch=master;protocol=https"
> -
> -SRC_URI:append = " \
> -    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
> -    file://0007-allow-setting-sysroot-for-clang.patch \
> -    file://0008-no-warn-rwx-segments.patch \
> -   "
> -
> -S = "${WORKDIR}/git"
> -B = "${WORKDIR}/build"
> -
> -EXTRA_OEMAKE += " \
> -    PLATFORM=${OPTEEMACHINE} \
> -    CFG_${OPTEE_CORE}_core=y \
> -    CROSS_COMPILE_core=${HOST_PREFIX} \
> -    CROSS_COMPILE_ta_${OPTEE_ARCH}=${HOST_PREFIX} \
> -    NOWERROR=1 \
> -    ta-targets=ta_${OPTEE_ARCH} \
> -    O=${B} \
> -"
> -EXTRA_OEMAKE += " HOST_PREFIX=${HOST_PREFIX}"
> -EXTRA_OEMAKE += " CROSS_COMPILE64=${HOST_PREFIX}"
> -
> -CFLAGS[unexport] = "1"
> -LDFLAGS[unexport] = "1"
> -CPPFLAGS[unexport] = "1"
> -AS[unexport] = "1"
> -LD[unexport] = "1"
> -
> -do_compile:prepend() {
> -	PLAT_LIBGCC_PATH=$(${CC} -print-libgcc-file-name)
> -}
> -
> -do_compile() {
> -    oe_runmake -C ${S} all
> -}
> -do_compile[cleandirs] = "${B}"
> -
> -do_install() {
> -    #install core in firmware
> -    install -d ${D}${nonarch_base_libdir}/firmware/
> -    install -m 644 ${B}/core/*.bin ${B}/core/tee.elf ${D}${nonarch_base_libdir}/firmware/
> -}
> -
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
> -do_deploy() {
> -    install -d ${DEPLOYDIR}/${MLPREFIX}optee
> -    install -m 644 ${D}${nonarch_base_libdir}/firmware/* ${DEPLOYDIR}/${MLPREFIX}optee
> -}
> -
> -addtask deploy before do_build after do_install
> -
> -SYSROOT_DIRS += "${nonarch_base_libdir}/firmware"
> -
> -FILES:${PN} = "${nonarch_base_libdir}/firmware/"
> -
> -# note: "textrel" is not triggered on all archs
> -INSANE_SKIP:${PN} = "textrel"
> -# Build paths are currently embedded
> -INSANE_SKIP:${PN} += "buildpaths"
> -INSANE_SKIP:${PN}-dev = "staticdev"
> -INHIBIT_PACKAGE_STRIP = "1"
> -
> diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
> index a03ea6a3..5d1df55b 100644
> --- a/meta-arm/recipes-security/optee/optee-os.inc
> +++ b/meta-arm/recipes-security/optee/optee-os.inc
> @@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
>  inherit deploy python3native
>  require optee.inc
>  
> +FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os-3.19.0:"

1. What would happen to 3.18 recipe that also includes this version-agnostic 
.inc file?

2. I agree with Ross, it should be "optee-os-3.19" here, so it's usable when 
bumping slightly past 3.19.0 release and use PV=3.19+git{SRCPV}
https://lists.yoctoproject.org/g/meta-arm/message/4278


> +
>  CVE_PRODUCT = "linaro:op-tee op-tee:op-tee_os"
>  
>  DEPENDS = "python3-pyelftools-native python3-cryptography-native"
> @@ -43,10 +45,6 @@ CPPFLAGS[unexport] = "1"
>  AS[unexport] = "1"
>  LD[unexport] = "1"
>  
> -do_compile:prepend() {
> -	PLAT_LIBGCC_PATH=$(${CC} -print-libgcc-file-name)
> -}
> -
>  do_compile() {
>      oe_runmake -C ${S} all
>  }
> diff --git a/meta-arm/recipes-security/optee/optee-os_3.19.0.bb b/meta-arm/recipes-security/optee/optee-os_3.19.0.bb
> index 656a0974..97aff5aa 100644
> --- a/meta-arm/recipes-security/optee/optee-os_3.19.0.bb
> +++ b/meta-arm/recipes-security/optee/optee-os_3.19.0.bb
> @@ -1,4 +1,4 @@
> -require optee-os-3_19.inc
> +require optee-os.inc
>  
>  DEPENDS += "dtc-native"
>  
> -- 
> 2.17.1

