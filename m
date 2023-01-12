Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A167AC677F1
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 17:59:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.62897.1673546363226843115
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Jan 2023 09:59:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0588E40C5D;
	Thu, 12 Jan 2023 17:59:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uF0Re8aruUXB; Thu, 12 Jan 2023 17:59:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C280C40A3F;
	Thu, 12 Jan 2023 17:59:17 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CD0101636F7; Thu, 12 Jan 2023 12:58:59 -0500 (EST)
Date: Thu, 12 Jan 2023 12:58:59 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: emekcan.aras@arm.com
Cc: meta-arm@lists.yoctoproject.org, Ross.Burton@arm.com, Jon.Mason@arm.com,
	nd@arm.com
Subject: Re: [meta-arm] [PATCH 2/5] arm/optee: support optee 3.19
Message-ID: <20230112175859.GZ22689@denix.org>
References: <20221221143942.15196-1-emekcan.aras@arm.com>
 <20221221143942.15196-3-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221221143942.15196-3-emekcan.aras@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 Jan 2023 17:59:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4275

On Wed, Dec 21, 2022 at 02:39:39PM +0000, emekcan.aras@arm.com wrote:
> From: Emekcan Aras <emekcan.aras@arm.com>
> 
> From: Emekcan <emekcan.aras@arm.com>
> 
> This commits adds a recipe to support optee-os 3.19.
> 
> Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>

Unfortunately, this breaks downstream users with own bbappends and 
customizations on top. Please pay close attention to the naming 
conventions. Thanks.

Also, what about updating optee-client, optee-test and optee-examples 
to 3.19?


> ---
> diff --git a/meta-arm/recipes-security/optee/optee-os-3_19.inc b/meta-arm/recipes-security/optee/optee-os-3_19.inc
> new file mode 100644
> index 00000000..8adb6996
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee/optee-os-3_19.inc

While not critical, why does this inc file has "3_19" version in the name?


> @@ -0,0 +1,82 @@
> +SUMMARY = "OP-TEE Trusted OS"
> +DESCRIPTION = "Open Portable Trusted Execution Environment - Trusted side of the TEE"
> +HOMEPAGE = "https://www.op-tee.org/"
> +
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
> +
> +inherit deploy python3native
> +require optee.inc
> +
> +FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os-3_19:"

Now, this is critical - why is there "3_19" version in the directory name?


> +CVE_PRODUCT = "linaro:op-tee op-tee:op-tee_os"
> +
> +DEPENDS = "python3-pyelftools-native python3-cryptography-native"
> +
> +DEPENDS:append:toolchain-clang = " compiler-rt"
> +
> +SRC_URI = "git://github.com/OP-TEE/optee_os.git;branch=master;protocol=https"
> +
> +SRC_URI:append = " \
> +    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
> +    file://0007-allow-setting-sysroot-for-clang.patch \
> +    file://0008-no-warn-rwx-segments.patch \
> +   "
> +
> +S = "${WORKDIR}/git"
> +B = "${WORKDIR}/build"
> +
> +EXTRA_OEMAKE += " \
> +    PLATFORM=${OPTEEMACHINE} \
> +    CFG_${OPTEE_CORE}_core=y \
> +    CROSS_COMPILE_core=${HOST_PREFIX} \
> +    CROSS_COMPILE_ta_${OPTEE_ARCH}=${HOST_PREFIX} \
> +    NOWERROR=1 \
> +    ta-targets=ta_${OPTEE_ARCH} \
> +    O=${B} \
> +"
> +EXTRA_OEMAKE += " HOST_PREFIX=${HOST_PREFIX}"
> +EXTRA_OEMAKE += " CROSS_COMPILE64=${HOST_PREFIX}"
> +
> +CFLAGS[unexport] = "1"
> +LDFLAGS[unexport] = "1"
> +CPPFLAGS[unexport] = "1"
> +AS[unexport] = "1"
> +LD[unexport] = "1"
> +
> +do_compile:prepend() {
> +	PLAT_LIBGCC_PATH=$(${CC} -print-libgcc-file-name)
> +}
> +
> +do_compile() {
> +    oe_runmake -C ${S} all
> +}
> +do_compile[cleandirs] = "${B}"
> +
> +do_install() {
> +    #install core in firmware
> +    install -d ${D}${nonarch_base_libdir}/firmware/
> +    install -m 644 ${B}/core/*.bin ${B}/core/tee.elf ${D}${nonarch_base_libdir}/firmware/
> +}
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +do_deploy() {
> +    install -d ${DEPLOYDIR}/${MLPREFIX}optee
> +    install -m 644 ${D}${nonarch_base_libdir}/firmware/* ${DEPLOYDIR}/${MLPREFIX}optee
> +}
> +
> +addtask deploy before do_build after do_install
> +
> +SYSROOT_DIRS += "${nonarch_base_libdir}/firmware"
> +
> +FILES:${PN} = "${nonarch_base_libdir}/firmware/"
> +
> +# note: "textrel" is not triggered on all archs
> +INSANE_SKIP:${PN} = "textrel"
> +# Build paths are currently embedded
> +INSANE_SKIP:${PN} += "buildpaths"
> +INSANE_SKIP:${PN}-dev = "staticdev"
> +INHIBIT_PACKAGE_STRIP = "1"
> +
> diff --git a/meta-arm/recipes-security/optee/optee-os_3.19.0.bb b/meta-arm/recipes-security/optee/optee-os_3.19.0.bb
> new file mode 100644
> index 00000000..9ad8a148
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee/optee-os_3.19.0.bb
> @@ -0,0 +1,5 @@
> +require optee-os-3_19.inc
> +
> +DEPENDS += "dtc-native"
> +
> +SRCREV = "afacf356f9593a7f83cae9f96026824ec242ff52"
> -- 
> 2.17.1

