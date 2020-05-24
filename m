Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.20001.1590350910905707837
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 24 May 2020 13:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 47E7640BEF;
	Sun, 24 May 2020 20:08:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r9bFd5iU8hii; Sun, 24 May 2020 20:08:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1FBA640A35;
	Sun, 24 May 2020 20:08:29 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7FF64173205; Sun, 24 May 2020 16:08:28 -0400 (EDT)
Date: Sun, 24 May 2020 16:08:28 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm][PATCH v3 3/3] Add support for booting qemu with TFA and optee
Message-ID: <20200524200828.GI17660@denix.org>
References: <20200513221134.30072-1-JPEWhacker@gmail.com>
 <20200521142259.15363-1-JPEWhacker@gmail.com>
 <20200521142259.15363-4-JPEWhacker@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200521142259.15363-4-JPEWhacker@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2020 at 09:22:59AM -0500, Joshua Watt wrote:
> Adds support for booting AArch64 Qemu machines using TF-A + optee +
> u-boot. Most of the changes are applicable to any AArch64 qemu target,
> and a reference machine called qemuarm64-secureboot has been added that
> show how to enable support for it.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>

Looks good to me now, thanks!

Reviewed-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  .../conf/machine/qemuarm64-secureboot.conf    | 26 +++++++++++
>  .../trusted-firmware-a/trusted-firmware-a.inc | 44 +++++++++++++------
>  .../recipes-bsp/u-boot/u-boot/qemuarm64.cfg   |  4 ++
>  meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend |  3 ++
>  .../linux/linux-yocto-dev.bbappend            |  4 ++
>  .../linux/linux-yocto-dev/tee.cfg             |  4 ++
>  .../recipes-security/optee/optee-os_git.bb    |  3 ++
>  meta-arm/recipes-security/optee/optee.inc     |  1 +
>  meta-arm/wic/qemuarm64.wks                    |  4 ++
>  9 files changed, 80 insertions(+), 13 deletions(-)
>  create mode 100644 meta-arm/conf/machine/qemuarm64-secureboot.conf
>  create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot/qemuarm64.cfg
>  create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
>  create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-dev.bbappend
>  create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-dev/tee.cfg
>  create mode 100644 meta-arm/wic/qemuarm64.wks
> 
> diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> new file mode 100644
> index 0000000..a5b7401
> --- /dev/null
> +++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> @@ -0,0 +1,26 @@
> +MACHINEOVERRIDES =. "qemuarm64:"
> +
> +require ${COREBASE}/meta/conf/machine/qemuarm64.conf
> +
> +KMACHINE = "qemuarm64"
> +
> +UBOOT_MACHINE = "qemu_arm64_defconfig"
> +
> +# The 5.4 kernel panics when booting, so use the development kernel until the
> +# default kernel is upgraded (5.5. supposedly works)
> +PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-dev"
> +
> +QB_MACHINE = "-machine virt,secure=on"
> +QB_OPT_APPEND += "-no-acpi"
> +QB_MEM = "-m 1G"
> +QB_DEFAULT_FSTYPE = "wic.qcow2"
> +QB_DEFAULT_BIOS = "flash.bin"
> +QB_FSINFO = "wic:no-kernel-in-fs"
> +QB_ROOTFS_OPT = ""
> +
> +IMAGE_FSTYPES += "wic wic.qcow2"
> +
> +WKS_FILE ?= "qemuarm64.wks"
> +WKS_FILE_DEPENDS = "trusted-firmware-a"
> +IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
> +
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index fe9a4e0..6f64773 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -8,9 +8,11 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  inherit deploy
>  
>  COMPATIBLE_MACHINE ?= "invalid"
> +COMPATIBLE_MACHINE_qemuarm64 ?= "qemuarm64"
>  
>  # Platform must be set for each machine
>  TFA_PLATFORM ?= "invalid"
> +TFA_PLATFORM_aarch64_qemuall ?= "qemu"
>  
>  # Some platforms can have multiple board configurations
>  # Leave empty for default behavior
> @@ -20,6 +22,7 @@ TFA_BOARD ?= ""
>  # Few options are "opteed", "tlkd", "trusty", "tspd"...
>  # Leave empty to not use SPD
>  TFA_SPD ?= ""
> +TFA_SPD_aarch64_qemuall ?= "opteed"
>  
>  # Build for debug (set TFA_DEBUG to 1 to activate)
>  TFA_DEBUG ?= "0"
> @@ -44,16 +47,19 @@ SRCREV_FORMAT_append = "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbedtls', '',
>  # U-boot support (set TFA_UBOOT to 1 to activate)
>  # When U-Boot support is activated BL33 is activated with u-boot.bin file
>  TFA_UBOOT ?= "0"
> +TFA_UBOOT_aarch64_qemuall ?= "1"
>  
>  # What to build
>  # By default we only build bl1, do_deploy will copy
>  # everything listed in this variable (by default bl1.bin)
>  TFA_BUILD_TARGET ?= "bl1"
> +TFA_BUILD_TARGET_aarch64_qemuall ?= "all fip"
>  
>  # What to install
>  # do_install and do_deploy will install everything listed in this
>  # variable. It is set by default to TFA_BUILD_TARGET
>  TFA_INSTALL_TARGET ?= "${TFA_BUILD_TARGET}"
> +TFA_INSTALL_TARGET_aarch64_qemuall ?= "flash.bin"
>  
>  # Requires CROSS_COMPILE set by hand as there is no configure script
>  export CROSS_COMPILE="${TARGET_PREFIX}"
> @@ -70,13 +76,13 @@ do_configure[noexec] = "1"
>  # We need dtc for dtbs compilation
>  # We need openssl for fiptool
>  DEPENDS_append = " dtc-native openssl-native"
> +DEPENDS_append_aarch64_qemuall ?= " optee-os"
>  
>  # Add platform parameter
>  EXTRA_OEMAKE += "BUILD_BASE=${B} PLAT=${TFA_PLATFORM}"
>  
>  # Handle TFA_BOARD parameter
>  EXTRA_OEMAKE += "${@'TARGET_BOARD=${TFA_BOARD}' if d.getVar('TFA_BOARD') else ''}"
> -BUILD_DIR = "${TFA_PLATFORM}${@'/${TFA_BOARD}' if d.getVar('TFA_BOARD') else ''}"
>  
>  # Handle TFA_SPD parameter
>  EXTRA_OEMAKE += "${@'SPD=${TFA_SPD}' if d.getVar('TFA_SPD') else ''}"
> @@ -92,6 +98,17 @@ DEPENDS += " ${@bb.utils.contains('TFA_UBOOT', '1', 'u-boot', '', d)}"
>  do_compile[depends] += " ${@bb.utils.contains('TFA_UBOOT', '1', 'u-boot:do_deploy', '', d)}"
>  EXTRA_OEMAKE += "${@bb.utils.contains('TFA_UBOOT', '1', 'BL33=${DEPLOY_DIR_IMAGE}/u-boot.bin', '',d)}"
>  
> +EXTRA_OEMAKE_append_aarch64_qemuall = " \
> +    BL32=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-header_v2.bin \
> +    BL32_EXTRA1=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pager_v2.bin \
> +    BL32_EXTRA2=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pageable_v2.bin \
> +    BL32_RAM_LOCATION=tdram \
> +    "
> +
> +BUILD_DIR = "${B}/${TFA_PLATFORM}"
> +BUILD_DIR .= "${@'/${TFA_BOARD}' if d.getVar('TFA_BOARD') else ''}"
> +BUILD_DIR .= "/${@'debug' if d.getVar("TFA_DEBUG") == '1' else 'release'}"
> +
>  # The following hack is needed to fit properly in yocto build environment
>  # TFA is forcing the host compiler and its flags in the Makefile using :=
>  # assignment for GCC and CFLAGS.
> @@ -107,13 +124,14 @@ do_compile() {
>  }
>  do_compile[cleandirs] = "${B}"
>  
> -do_install() {
> -    if ${@"true" if d.getVar('TFA_DEBUG') == '1' else "false"}; then
> -        BUILD_PLAT=${B}/${BUILD_DIR}/debug/
> -    else
> -        BUILD_PLAT=${B}/${BUILD_DIR}/release/
> -    fi
> +do_compile_append_aarch64_qemuall() {
> +    # Create a secure flash image for booting AArch64 Qemu. See:
> +    # https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/tree/docs/plat/qemu.rst
> +    dd if=${BUILD_DIR}/bl1.bin of=${BUILD_DIR}/flash.bin bs=4096 conv=notrunc
> +    dd if=${BUILD_DIR}/fip.bin of=${BUILD_DIR}/flash.bin seek=64 bs=4096 conv=notrunc
> +}
>  
> +do_install() {
>      install -d -m 755 ${D}/firmware
>      for atfbin in ${TFA_INSTALL_TARGET}; do
>          processes="0"
> @@ -125,23 +143,23 @@ do_install() {
>              exit 1
>          fi
>  
> -        if [ -f $BUILD_PLAT/$atfbin.bin ]; then
> +        if [ -f ${BUILD_DIR}/$atfbin.bin ]; then
>              echo "Install $atfbin.bin"
> -            install -m 0644 $BUILD_PLAT/$atfbin.bin \
> +            install -m 0644 ${BUILD_DIR}/$atfbin.bin \
>                  ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
>              ln -sf $atfbin-${TFA_PLATFORM}.bin ${D}/firmware/$atfbin.bin
>              processes="1"
>          fi
> -        if [ -f $BUILD_PLAT/$atfbin/$atfbin.elf ]; then
> +        if [ -f ${BUILD_DIR}/$atfbin/$atfbin.elf ]; then
>              echo "Install $atfbin.elf"
> -            install -m 0644 $BUILD_PLAT/$atfbin/$atfbin.elf \
> +            install -m 0644 ${BUILD_DIR}/$atfbin/$atfbin.elf \
>                  ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
>              ln -sf $atfbin-${TFA_PLATFORM}.elf ${D}/firmware/$atfbin.elf
>              processes="1"
>          fi
> -        if [ -f $BUILD_PLAT/$atfbin ]; then
> +        if [ -f ${BUILD_DIR}/$atfbin ]; then
>              echo "Install $atfbin"
> -            install -m 0644 $BUILD_PLAT/$atfbin \
> +            install -m 0644 ${BUILD_DIR}/$atfbin \
>                  ${D}/firmware/$atfbin-${TFA_PLATFORM}
>              ln -sf $atfbin-${TFA_PLATFORM} ${D}/firmware/$atfbin
>              processes="1"
> diff --git a/meta-arm/recipes-bsp/u-boot/u-boot/qemuarm64.cfg b/meta-arm/recipes-bsp/u-boot/u-boot/qemuarm64.cfg
> new file mode 100644
> index 0000000..de0c6ec
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/u-boot/u-boot/qemuarm64.cfg
> @@ -0,0 +1,4 @@
> +CONFIG_TFABOOT=y
> +# This must match the address that TF-A jumps to for BL33
> +CONFIG_SYS_TEXT_BASE=0x60000000
> +
> diff --git a/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
> new file mode 100644
> index 0000000..afcd70a
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
> @@ -0,0 +1,3 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +
> +SRC_URI_append_qemuarm64-secureboot = " file://qemuarm64.cfg"
> diff --git a/meta-arm/recipes-kernel/linux/linux-yocto-dev.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto-dev.bbappend
> new file mode 100644
> index 0000000..c7742f8
> --- /dev/null
> +++ b/meta-arm/recipes-kernel/linux/linux-yocto-dev.bbappend
> @@ -0,0 +1,4 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +
> +SRC_URI_append_qemuarm64-secureboot = " file://tee.cfg"
> +
> diff --git a/meta-arm/recipes-kernel/linux/linux-yocto-dev/tee.cfg b/meta-arm/recipes-kernel/linux/linux-yocto-dev/tee.cfg
> new file mode 100644
> index 0000000..7415e18
> --- /dev/null
> +++ b/meta-arm/recipes-kernel/linux/linux-yocto-dev/tee.cfg
> @@ -0,0 +1,4 @@
> +CONFIG_HW_RANDOM_OPTEE=m
> +CONFIG_TEE=m
> +CONFIG_OPTEE=m
> +CONFIG_OPTEE_SHM_NUM_PRIV_PAGES=10
> diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/recipes-security/optee/optee-os_git.bb
> index dcbe990..6036bac 100644
> --- a/meta-arm/recipes-security/optee/optee-os_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-os_git.bb
> @@ -23,6 +23,7 @@ S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build"
>  
>  OPTEEMACHINE ?= "${MACHINE}"
> +OPTEEMACHINE_aarch64_qemuall ?= "vexpress-qemu_armv8a"
>  OPTEE_ARCH = "null"
>  OPTEE_ARCH_armv7a = "arm32"
>  OPTEE_ARCH_aarch64 = "arm64"
> @@ -75,6 +76,8 @@ do_deploy() {
>  
>  addtask deploy before do_build after do_install
>  
> +SYSROOT_DIRS += "${nonarch_base_libdir}/firmware"
> +
>  FILES_${PN} = "${nonarch_base_libdir}/firmware/"
>  FILES_${PN}-dev = "${includedir}/optee/"
>  
> diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-security/optee/optee.inc
> index b3e5271..4bf87fe 100644
> --- a/meta-arm/recipes-security/optee/optee.inc
> +++ b/meta-arm/recipes-security/optee/optee.inc
> @@ -1,2 +1,3 @@
>  COMPATIBLE_MACHINE ?= "invalid"
> +COMPATIBLE_MACHINE_qemuarm64 ?= "qemuarm64"
>  # Please add supported machines below or set it in .bbappend or .conf
> diff --git a/meta-arm/wic/qemuarm64.wks b/meta-arm/wic/qemuarm64.wks
> new file mode 100644
> index 0000000..7285279
> --- /dev/null
> +++ b/meta-arm/wic/qemuarm64.wks
> @@ -0,0 +1,4 @@
> +bootloader --ptable gpt
> +
> +part /boot --ondisk=vda --align 64 --size=100M --active --source bootimg-partition --fstype=ext4 --label boot --sourceparams="loader=u-boot"
> +part /     --ondisk=vda                                 --source rootfs            --fstype=ext4 --label root
> -- 
> 2.17.1
> 

> 

