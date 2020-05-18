Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web11.361.1589819456360824310
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 May 2020 09:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hV3PrUEC;
 spf=pass (domain: gmail.com, ip: 209.85.166.66, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f66.google.com with SMTP id e18so11232348iog.9
        for <meta-arm@lists.yoctoproject.org>; Mon, 18 May 2020 09:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=kZ9IUtiNaD+6MZ2ywXfgYX9dkVvk6NHd0y9P6zmBy4E=;
        b=hV3PrUEC1e40zLshb8Fx1qqAidOQgox4mQuCymEBSIljszW4dh7JueGgX3CjMKJ+PR
         lOXte0JEc0qDCQ1vBCUPMndFwq8kwtGWlUGs5h85LE+gCbwSoHydJW1rhlLZIW/j8GZp
         KaXnigPuJpRAbwf5IW4Nd4PydJImzBQnK4Xw/nJzePxSrj2xuceGgF3q6lzvTAtZ3NQS
         9h+ulMtY96oeokf9u959iURGsVLv24ziouSVVuWQqtMBHO2PiGFa22wQNlU5+GyWJVoE
         W3aw42OIVTSYD+6p07rTkXtPvZlikf2JarVALR7aNWcZpcUjJde6hzNmOdq3pGC5Uecv
         qb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=kZ9IUtiNaD+6MZ2ywXfgYX9dkVvk6NHd0y9P6zmBy4E=;
        b=iwW8I9gPa1AAxKCkvh9Nby9/jKWjPSyrgUalPsI8et3+h+0g5rV29LWMIXTsrZDOZt
         MLLBkrzoo/426Ka16HmwkLaG9lZZrJsU4u7e8zXtxOWH4KEnna2IH1kKCiZPFwz7EBlM
         2e2YRIFOzO5j49UfqDJO3MkrngskqF7lwdGFfQA84mFyB9MydbKnTjZjkmxk6ceclu/U
         rNTiwcoatTXtRbcdK5a2l+g7ugnWfQne5XAYbuGKZf7efaECp2ITr5/4TuihnoLN0GuW
         AkNfB2kfltX4luOR+YkvVGZcYAiO48CZiych7jywX4nESKImRsh6LLNzp0RZOtI+kZih
         B5sQ==
X-Gm-Message-State: AOAM532VbVlJ7BFeRvMLVZXuq307CpnNoB7lL7n5RGj9JVPDZjPvU3KT
	HceEekyXN/oRmOLPqkIeKwVXupaoEj0=
X-Google-Smtp-Source: ABdhPJwHzflXQoI62zS+z8Ir6uZLXCyVd33OfNw5UCqGDMfXVsY1Uogx4LdkwGhWXrbCa4cxxA2iNw==
X-Received: by 2002:a5d:9547:: with SMTP id a7mr15403200ios.6.1589819455005;
        Mon, 18 May 2020 09:30:55 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:3995:b857:4ddd:5854? ([2605:a601:ac3d:c100:3995:b857:4ddd:5854])
        by smtp.gmail.com with ESMTPSA id j2sm4054111ioo.8.2020.05.18.09.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2020 09:30:54 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [meta-arm][PATCH v2 3/3] Add support for booting qemu with TFA and optee
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org
References: <20200513221134.30072-1-JPEWhacker@gmail.com>
 <20200515160240.16395-1-JPEWhacker@gmail.com>
 <20200515160240.16395-4-JPEWhacker@gmail.com>
 <20200517165832.GK11927@denix.org>
Message-ID: <f1646808-d143-5976-01be-6893bbf2da0a@gmail.com>
Date: Mon, 18 May 2020 11:30:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200517165832.GK11927@denix.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/17/20 11:58 AM, Denys Dmytriyenko wrote:
> On Fri, May 15, 2020 at 11:02:40AM -0500, Joshua Watt wrote:
>> Adds support for booting AArch64 Qemu machines using TF-A + optee +
>> u-boot. Most of the changes are applicable to any AArch64 qemu target,
>> and a reference machine called qemuarm64-secureboot has been added that
>> show how to enable support for it.
>>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
>>   .../conf/machine/qemuarm64-secureboot.conf    | 26 +++++++++++++
>>   .../trusted-firmware-a/trusted-firmware-a.inc | 39 ++++++++++++-------
>>   .../recipes-bsp/u-boot/u-boot/qemuarm64.cfg   |  4 ++
>>   meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend |  3 ++
>>   .../linux/linux-yocto-dev.bbappend            |  4 ++
>>   .../linux/linux-yocto-dev/tee.cfg             |  4 ++
>>   .../recipes-security/optee/optee-os_git.bb    |  4 ++
>>   meta-arm/recipes-security/optee/optee.inc     |  2 +-
>>   meta-arm/wic/qemuarm64.wks                    |  4 ++
>>   9 files changed, 76 insertions(+), 14 deletions(-)
>>   create mode 100644 meta-arm/conf/machine/qemuarm64-secureboot.conf
>>   create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot/qemuarm64.cfg
>>   create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
>>   create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-dev.bbappend
>>   create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-dev/tee.cfg
>>   create mode 100644 meta-arm/wic/qemuarm64.wks
>>
>> diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
>> new file mode 100644
>> index 0000000..a5b7401
>> --- /dev/null
>> +++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
>> @@ -0,0 +1,26 @@
>> +MACHINEOVERRIDES =. "qemuarm64:"
>> +
>> +require ${COREBASE}/meta/conf/machine/qemuarm64.conf
>> +
>> +KMACHINE = "qemuarm64"
>> +
>> +UBOOT_MACHINE = "qemu_arm64_defconfig"
>> +
>> +# The 5.4 kernel panics when booting, so use the development kernel until the
>> +# default kernel is upgraded (5.5. supposedly works)
>> +PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-dev"
>> +
>> +QB_MACHINE = "-machine virt,secure=on"
>> +QB_OPT_APPEND += "-no-acpi"
>> +QB_MEM = "-m 1G"
>> +QB_DEFAULT_FSTYPE = "wic.qcow2"
>> +QB_DEFAULT_BIOS = "flash.bin"
>> +QB_FSINFO = "wic:no-kernel-in-fs"
>> +QB_ROOTFS_OPT = ""
>> +
>> +IMAGE_FSTYPES += "wic wic.qcow2"
>> +
>> +WKS_FILE ?= "qemuarm64.wks"
>> +WKS_FILE_DEPENDS = "trusted-firmware-a"
>> +IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
>> +
>> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
>> index c9c5710..1369372 100644
>> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
>> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
>> @@ -7,10 +7,11 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>>   
>>   inherit deploy nopackages
>>   
>> -COMPATIBLE_MACHINE ?= "invalid"
>> +COMPATIBLE_MACHINE = "qemuarm64"
> Should this be a weak assignment? Maybe like this:
>
> COMPATIBLE_MACHINE ?= "invalid"
> COMPATIBLE_MACHINE_qemuarm64 = "qemuarm64"

Yes, I'll clean those up

>
>
> BTW, I noticed you are defining qemuarm64-secureboot machine, but not using it
> and all overrides are _aarch64_qemuall - will that break if one tries to build
> for regular qemuarm64 machine with meta-arm?

The idea was that the recipes would do the correct thing by default for 
any ARM based qemu machine, not just qemuarm64 (or a machine that adds 
"qemuarm64" to its MACHINEOVERRIDES to get all the oe-core qemuarm64 
behavior). Perhaps this is being too "cute" and we should just use 
qemuarm64 as the override? Either way, this won't affect the qemuarm64 
machine currently because these recipes didn't compile for it before (it 
wasn't in COMPATIBLE_MACHINE), and none of my change will make it start 
compiling it. I was careful to use the qemuarm64-secureboot override in 
the places were it would have actually affected the oe-core qemuarm64 
machine (e.g. u-boot and kernel bbappends)

>
>
>>   # Platform must be set for each machine
>>   TFA_PLATFORM ?= "invalid"
>> +TFA_PLATFORM_aarch64_qemuall = "qemu"
>>   
>>   # Some platforms can have multiple board configurations
>>   # Leave empty for default behavior
>> @@ -20,6 +21,7 @@ TFA_BOARD ?= ""
>>   # Few options are "opteed", "tlkd", "trusty", "tspd"...
>>   # Leave empty to not use SPD
>>   TFA_SPD ?= ""
>> +TFA_SPD_aarch64_qemuall = "opteed"
>>   
>>   # Build for debug (set TFA_DEBUG to 1 to activate)
>>   TFA_DEBUG ?= "0"
>> @@ -44,16 +46,19 @@ SRCREV_FORMAT_append = "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbedtls', '',
>>   # U-boot support (set TFA_UBOOT to 1 to activate)
>>   # When U-Boot support is activated BL33 is activated with u-boot.bin file
>>   TFA_UBOOT ?= "0"
>> +TFA_UBOOT_aarch64_qemuall = "1"
>>   
>>   # What to build
>>   # By default we only build bl1, do_deploy will copy
>>   # everything listed in this variable (by default bl1.bin)
>>   TFA_BUILD_TARGET ?= "bl1"
>> +TFA_BUILD_TARGET_aarch64_qemuall = "all fip"
>>   
>>   # What to install
>>   # do_install and do_deploy will install everything listed in this
>>   # variable. It is set by default to TFA_BUILD_TARGET
>>   TFA_INSTALL_TARGET ?= "${TFA_BUILD_TARGET}"
>> +TFA_INSTALL_TARGET_aarch64_qemuall = "flash.bin"
>>   
>>   # Requires CROSS_COMPILE set by hand as there is no configure script
>>   export CROSS_COMPILE="${TARGET_PREFIX}"
>> @@ -70,6 +75,7 @@ do_configure[noexec] = "1"
>>   # We need dtc for dtbs compilation
>>   # We need openssl for fiptool
>>   DEPENDS_append = " dtc-native openssl-native"
>> +DEPENDS_append_aarch64_qemuall = " optee-os"
>>   
>>   # Add platform parameter
>>   EXTRA_OEMAKE += "BUILD_BASE=${B} PLAT=${TFA_PLATFORM}"
>> @@ -91,6 +97,14 @@ EXTRA_OEMAKE += "${@bb.utils.contains('TFA_MBEDTLS', '1', 'MBEDTLS_DIR=${TFA_MBE
>>   DEPENDS += " ${@bb.utils.contains('TFA_UBOOT', '1', 'u-boot', '', d)}"
>>   do_compile[depends] += " ${@bb.utils.contains('TFA_UBOOT', '1', 'u-boot:do_deploy', '', d)}"
>>   EXTRA_OEMAKE += "${@bb.utils.contains('TFA_UBOOT', '1', 'BL33=${DEPLOY_DIR_IMAGE}/u-boot.bin', '',d)}"
>> +EXTRA_OEMAKE_append_aarch64_qemuall = " \
>> +    BL32=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-header_v2.bin \
>> +    BL32_EXTRA1=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pager_v2.bin \
>> +    BL32_EXTRA2=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pageable_v2.bin \
>> +    BL32_RAM_LOCATION=tdram \
>> +    "
>> +
>> +BUILD_PLAT = "${B}/${TFA_PLATFORM}/${@"debug" if d.getVar("TFA_DEBUG") == "1" else "release"}/"
>>   
>> -do_install() {
>> -    if ${@"true" if d.getVar('TFA_DEBUG') == '1' else "false"}; then
>> -        BUILD_PLAT=${B}/${BUILD_DIR}/debug/
>> -    else
>> -        BUILD_PLAT=${B}/${BUILD_DIR}/release/
>> -    fi
> You are breaking TFA_BOARD use case here - your BUILD_PLAT is not the same as
> original BUILD_PLAT.

Oops, sorry about that, I will fix it.

>
>
>> +do_compile_append_aarch64_qemuall() {
>> +    dd if=${BUILD_PLAT}/bl1.bin of=${BUILD_PLAT}/flash.bin bs=4096 conv=notrunc
>> +    dd if=${BUILD_PLAT}/fip.bin of=${BUILD_PLAT}/flash.bin seek=64 bs=4096 conv=notrunc
> Is there some sort of a manual/howto with these tricks?


Yes, I will reference it in the commit message: 
https://github.com/ARM-software/arm-trusted-firmware/blob/master/docs/plat/qemu.rst#booting-via-flash-based-firmwares

They are using EFI firmware, but I didn't want to figure out how to 
build that, so I'm booting with u-boot instead.

>
>
>> +}
>>   
>> +do_install() {
>>       install -d -m 755 ${D}/firmware
>>       for atfbin in ${TFA_INSTALL_TARGET}; do
>>           processes="0"
>> @@ -125,23 +138,23 @@ do_install() {
>>               exit 1
>>           fi
>>   
>> -        if [ -f $BUILD_PLAT/$atfbin.bin ]; then
>> +        if [ -f ${BUILD_PLAT}/$atfbin.bin ]; then
>>               echo "Install $atfbin.bin"
>> -            install -m 0644 $BUILD_PLAT/$atfbin.bin \
>> +            install -m 0644 ${BUILD_PLAT}/$atfbin.bin \
>>                   ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
>>               ln -sf $atfbin-${TFA_PLATFORM}.bin ${D}/firmware/$atfbin.bin
>>               processes="1"
>>           fi
>> -        if [ -f $BUILD_PLAT/$atfbin/$atfbin.elf ]; then
>> +        if [ -f ${BUILD_PLAT}/$atfbin/$atfbin.elf ]; then
>>               echo "Install $atfbin.elf"
>> -            install -m 0644 $BUILD_PLAT/$atfbin/$atfbin.elf \
>> +            install -m 0644 ${BUILD_PLAT}/$atfbin/$atfbin.elf \
>>                   ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
>>               ln -sf $atfbin-${TFA_PLATFORM}.elf ${D}/firmware/$atfbin.elf
>>               processes="1"
>>           fi
>> -        if [ -f $BUILD_PLAT/$atfbin ]; then
>> +        if [ -f ${BUILD_PLAT}/$atfbin ]; then
>>               echo "Install $atfbin"
>> -            install -m 0644 $BUILD_PLAT/$atfbin \
>> +            install -m 0644 ${BUILD_PLAT}/$atfbin \
>>                   ${D}/firmware/$atfbin-${TFA_PLATFORM}
>>               ln -sf $atfbin-${TFA_PLATFORM} ${D}/firmware/$atfbin
>>               processes="1"
>> diff --git a/meta-arm/recipes-bsp/u-boot/u-boot/qemuarm64.cfg b/meta-arm/recipes-bsp/u-boot/u-boot/qemuarm64.cfg
>> new file mode 100644
>> index 0000000..de0c6ec
>> --- /dev/null
>> +++ b/meta-arm/recipes-bsp/u-boot/u-boot/qemuarm64.cfg
>> @@ -0,0 +1,4 @@
>> +CONFIG_TFABOOT=y
>> +# This must match the address that TF-A jumps to for BL33
>> +CONFIG_SYS_TEXT_BASE=0x60000000
>> +
>> diff --git a/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
>> new file mode 100644
>> index 0000000..afcd70a
>> --- /dev/null
>> +++ b/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
>> @@ -0,0 +1,3 @@
>> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>> +
>> +SRC_URI_append_qemuarm64-secureboot = " file://qemuarm64.cfg"
>> diff --git a/meta-arm/recipes-kernel/linux/linux-yocto-dev.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto-dev.bbappend
>> new file mode 100644
>> index 0000000..c7742f8
>> --- /dev/null
>> +++ b/meta-arm/recipes-kernel/linux/linux-yocto-dev.bbappend
>> @@ -0,0 +1,4 @@
>> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>> +
>> +SRC_URI_append_qemuarm64-secureboot = " file://tee.cfg"
>> +
>> diff --git a/meta-arm/recipes-kernel/linux/linux-yocto-dev/tee.cfg b/meta-arm/recipes-kernel/linux/linux-yocto-dev/tee.cfg
>> new file mode 100644
>> index 0000000..7415e18
>> --- /dev/null
>> +++ b/meta-arm/recipes-kernel/linux/linux-yocto-dev/tee.cfg
>> @@ -0,0 +1,4 @@
>> +CONFIG_HW_RANDOM_OPTEE=m
>> +CONFIG_TEE=m
>> +CONFIG_OPTEE=m
>> +CONFIG_OPTEE_SHM_NUM_PRIV_PAGES=10
>> diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/recipes-security/optee/optee-os_git.bb
>> index d58b89f..5e3c59a 100644
>> --- a/meta-arm/recipes-security/optee/optee-os_git.bb
>> +++ b/meta-arm/recipes-security/optee/optee-os_git.bb
>> @@ -22,6 +22,8 @@ S = "${WORKDIR}/git"
>>   B = "${WORKDIR}/build"
>>   
>>   OPTEEMACHINE ?= "${MACHINE}"
>> +OPTEEMACHINE_aarch64_qemuall = "vexpress-qemu_armv8a"
>> +OPTEEMACHINE_armv7a_qemuall = "vexpress-qemu_virt"
> Do you plan to also do armv7a "qemuarm-secureboot"?

No, I will remove this.

>
>
>>   OPTEE_ARCH = "null"
>>   OPTEE_ARCH_armv7a = "arm32"
>>   OPTEE_ARCH_aarch64 = "arm64"
>> @@ -74,6 +76,8 @@ do_deploy() {
>>   
>>   addtask deploy before do_build after do_install
>>   
>> +SYSROOT_DIRS += "${nonarch_base_libdir}/firmware"
>> +
>>   FILES_${PN} = "${nonarch_base_libdir}/firmware/"
>>   FILES_${PN}-dev = "${includedir}/optee/"
>>   
>> diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-security/optee/optee.inc
>> index b3e5271..3138148 100644
>> --- a/meta-arm/recipes-security/optee/optee.inc
>> +++ b/meta-arm/recipes-security/optee/optee.inc
>> @@ -1,2 +1,2 @@
>> -COMPATIBLE_MACHINE ?= "invalid"
>> +COMPATIBLE_MACHINE = "qemuarm64"
> Dropping weak assignment?
>
>
>>   # Please add supported machines below or set it in .bbappend or .conf
>> diff --git a/meta-arm/wic/qemuarm64.wks b/meta-arm/wic/qemuarm64.wks
>> new file mode 100644
>> index 0000000..7285279
>> --- /dev/null
>> +++ b/meta-arm/wic/qemuarm64.wks
>> @@ -0,0 +1,4 @@
>> +bootloader --ptable gpt
>> +
>> +part /boot --ondisk=vda --align 64 --size=100M --active --source bootimg-partition --fstype=ext4 --label boot --sourceparams="loader=u-boot"
>> +part /     --ondisk=vda                                 --source rootfs            --fstype=ext4 --label root
>> -- 
>> 2.17.1
>>
>> 
