Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.550.1615597322792840882
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Mar 2021 17:02:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1F7C040BEC;
	Sat, 13 Mar 2021 01:02:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eCc5qpMyLuvq; Sat, 13 Mar 2021 01:02:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F3DA240BA7;
	Sat, 13 Mar 2021 01:02:00 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5DE92174542; Fri, 12 Mar 2021 20:02:00 -0500 (EST)
Date: Fri, 12 Mar 2021 20:02:00 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/3] arm: tf-a and edk2 cleanups
Message-ID: <20210313010200.GG4892@denix.org>
References: <20210312183956.24840-1-jon.mason@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210312183956.24840-1-jon.mason@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 12, 2021 at 01:39:54PM -0500, Jon Mason wrote:
> Do some preparatory moving of code for add QEMU SBSA machine support.
> Pulling out the qemuarm64 specific enablement from the universal inc
> file into a bbappend.
> 
> Change-Id: I445132337f7851d666214f87e3250b2f0db84406
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  .../trusted-firmware-a/trusted-firmware-a.inc | 21 ---------------
>  .../trusted-firmware-a_%.bbappend             | 26 +++++++++++++++++++
>  meta-arm/recipes-bsp/uefi/edk2-firmware.inc   | 11 ++++----
>  .../recipes-bsp/uefi/edk2-firmware_%.bbappend |  8 ++++++
>  4 files changed, 39 insertions(+), 27 deletions(-)
>  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>  create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
> 
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index 69d5ca8..807e125 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -11,11 +11,9 @@ SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=ht
>  UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
>  
>  COMPATIBLE_MACHINE ?= "invalid"
> -COMPATIBLE_MACHINE_qemuarm64 ?= "qemuarm64"
>  
>  # Platform must be set for each machine
>  TFA_PLATFORM ?= "invalid"
> -TFA_PLATFORM_aarch64_qemuall ?= "qemu"
>  
>  # Some platforms can have multiple board configurations
>  # Leave empty for default behavior
> @@ -25,7 +23,6 @@ TFA_BOARD ?= ""
>  # Few options are "opteed", "tlkd", "trusty", "tspd", "spmd"...
>  # Leave empty to not use SPD
>  TFA_SPD ?= ""
> -TFA_SPD_aarch64_qemuall ?= "opteed"
>  
>  # Variable used when TFA_SPD=spmd
>  TFA_SPMD_SPM_AT_SEL2 ?= "1"
> @@ -66,19 +63,16 @@ SRC_URI_append = " \
>  # U-boot support (set TFA_UBOOT to 1 to activate)
>  # When U-Boot support is activated BL33 is activated with u-boot.bin file
>  TFA_UBOOT ?= "0"
> -TFA_UBOOT_aarch64_qemuall ?= "1"
>  
>  # What to build
>  # By default we only build bl1, do_deploy will copy
>  # everything listed in this variable (by default bl1.bin)
>  TFA_BUILD_TARGET ?= "bl1"
> -TFA_BUILD_TARGET_aarch64_qemuall ?= "all fip"
>  
>  # What to install
>  # do_install and do_deploy will install everything listed in this
>  # variable. It is set by default to TFA_BUILD_TARGET
>  TFA_INSTALL_TARGET ?= "${TFA_BUILD_TARGET}"
> -TFA_INSTALL_TARGET_aarch64_qemuall ?= "flash.bin"
>  
>  # Requires CROSS_COMPILE set by hand as there is no configure script
>  export CROSS_COMPILE="${TARGET_PREFIX}"
> @@ -98,7 +92,6 @@ DEPENDS_remove = "virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
>  # We need dtc for dtbs compilation
>  # We need openssl for fiptool
>  DEPENDS = "dtc-native openssl-native"
> -DEPENDS_append_aarch64_qemuall ?= " optee-os"
>  DEPENDS_append_toolchain-clang = " compiler-rt"
>  
>  # CC and LD introduce arguments which conflict with those otherwise provided by
> @@ -156,13 +149,6 @@ EXTRA_OEMAKE += "OPENSSL_DIR=${STAGING_DIR_NATIVE}/${prefix_native}"
>  EXTRA_OEMAKE += "RUNTIME_SYSROOT=${STAGING_DIR_HOST}"
>  EXTRA_OEMAKE += "TARGET_FPU=${TARGET_FPU}"
>  
> -EXTRA_OEMAKE_append_aarch64_qemuall = " \
> -    BL32=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-header_v2.bin \
> -    BL32_EXTRA1=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pager_v2.bin \
> -    BL32_EXTRA2=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pageable_v2.bin \
> -    BL32_RAM_LOCATION=tdram \
> -    "
> -
>  BUILD_DIR = "${B}/${TFA_PLATFORM}"
>  BUILD_DIR .= "${@'/${TFA_BOARD}' if d.getVar('TFA_BOARD') else ''}"
>  BUILD_DIR .= "/${@'debug' if d.getVar("TFA_DEBUG") == '1' else 'release'}"
> @@ -186,13 +172,6 @@ do_compile() {
>  }
>  do_compile[cleandirs] = "${B}"
>  
> -do_compile_append_aarch64_qemuall() {
> -    # Create a secure flash image for booting AArch64 Qemu. See:
> -    # https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/tree/docs/plat/qemu.rst
> -    dd if=${BUILD_DIR}/bl1.bin of=${BUILD_DIR}/flash.bin bs=4096 conv=notrunc
> -    dd if=${BUILD_DIR}/fip.bin of=${BUILD_DIR}/flash.bin seek=64 bs=4096 conv=notrunc
> -}
> -
>  do_install() {
>      install -d -m 755 ${D}/firmware
>      for atfbin in ${TFA_INSTALL_TARGET}; do
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> new file mode 100644
> index 0000000..dd1da1b
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> @@ -0,0 +1,26 @@
> +COMPATIBLE_MACHINE_qemuarm64 = "qemuarm64"
> +
> +TFA_PLATFORM_qemuarm64-secureboot = "qemu"
> +
> +TFA_SPD_qemuarm64-secureboot = "opteed"
> +
> +TFA_UBOOT_qemuarm64-secureboot = "1"
> +TFA_BUILD_TARGET_aarch64_qemuall = "all fip"
> +
> +TFA_INSTALL_TARGET_qemuarm64-secureboot = "flash.bin"

Would it be better to move all TFA_* variables to the corresponding machine 
config?


> +DEPENDS_append_aarch64_qemuall = " optee-os"
> +
> +EXTRA_OEMAKE_append_aarch64_qemuall = " \
> +    BL32=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-header_v2.bin \
> +    BL32_EXTRA1=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pager_v2.bin \
> +    BL32_EXTRA2=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pageable_v2.bin \
> +    BL32_RAM_LOCATION=tdram \
> +    "
> +
> +do_compile_append_qemuarm64-secureboot() {
> +    # Create a secure flash image for booting AArch64 Qemu. See:
> +    # https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/tree/docs/plat/qemu.rst
> +    dd if=${BUILD_DIR}/bl1.bin of=${BUILD_DIR}/flash.bin bs=4096 conv=notrunc
> +    dd if=${BUILD_DIR}/fip.bin of=${BUILD_DIR}/flash.bin seek=64 bs=4096 conv=notrunc
> +}
> diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> index 1160c3a..4748ae3 100644
> --- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> @@ -23,11 +23,11 @@ SRC_URI = "\
>  SRCREV_FORMAT         = "edk2_edk2-platforms"
>  UPSTREAM_CHECK_GITTAGREGEX = "^edk2-stable(?P<pver>\d+)$"
>  
> -EDK2_BUILD_RELEASE   ?= "1"
> -EDK2_PLATFORM        ?= "ArmVirtQemu-AARCH64"
> -EDK2_PLATFORM_DSC    ?= "ArmVirtPkg/ArmVirtQemu.dsc"
> -EDK2_BIN_NAME        ?= "QEMU_EFI.fd"
> -EDK2_ARCH            ?= "AARCH64"
> +EDK2_BUILD_RELEASE = ""
> +EDK2_PLATFORM      = ""
> +EDK2_PLATFORM_DSC  = ""
> +EDK2_BIN_NAME      = ""
> +EDK2_ARCH          = ""
>  
>  EDK2_BUILD_MODE = "${@bb.utils.contains('EDK2_BUILD_RELEASE', '1', 'RELEASE', 'DEBUG', d)}"
>  
> @@ -41,7 +41,6 @@ S = "${WORKDIR}/edk2"
>  B = "${WORKDIR}/build"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> -COMPATIBLE_MACHINE ?= "qemuarm64"
>  
>  LDFLAGS[unexport] = "1"
>  
> diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend b/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
> new file mode 100644
> index 0000000..318afc4
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
> @@ -0,0 +1,8 @@
> +COMPATIBLE_MACHINE = "qemuarm64"
> +
> +EDK2_BUILD_RELEASE_aarch64_qemuall = "1"
> +EDK2_ARCH_aarch64_qemuall          = "AARCH64"
> +
> +EDK2_PLATFORM_qemuarm64-secureboot      = "ArmVirtQemu-AARCH64"
> +EDK2_PLATFORM_DSC_qemuarm64-secureboot  = "ArmVirtPkg/ArmVirtQemu.dsc"
> +EDK2_BIN_NAME_qemuarm64-secureboot      = "QEMU_EFI.fd"
> -- 
> 2.17.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
