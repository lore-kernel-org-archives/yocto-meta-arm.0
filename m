Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE9FFC433F5
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 09:49:06 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.4509.1651657739209715399
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 May 2022 02:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wNkn13VP;
 spf=pass (domain: linaro.org, ip: 209.85.216.51,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-pj1-f51.google.com with SMTP id
 t11-20020a17090ad50b00b001d95bf21996so4736550pju.2
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 May 2022 02:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8uartjMGe7jC2YhsybxwODhaetqTXeMKyLK7cC97BbI=;
        b=wNkn13VPh1+tiQqjyyphMPOWpvMc9vuXmghI+b5N4Y+gY2tGXT2xTqAPNx2yjX6AZF
         lpGXYnnrIn1ZFHYwRZBOboBFfqApQ+pdvtWXnthdqpZWKxSwz/vYjy1G/NDfbNvXWmTr
         OXhNDf3GkBlHkKLseWMNnPQ50YxfHXLohcmI/c5pnErfKq+Hdc9qCzO2DxNmqGbnhSWG
         /+YRw8AvDdCXpfn7RQmbR9WptVfMZrQ6TURlydzaTUqJpoN1qPHZaRvAgyZwHCD/P0Bx
         +P/bKWzUcCVEvnX1O5DWhT+ZsOZLxbCnqag+iHeAszH/FpLyFBqBymmpkZ+9pSboNGNP
         1Hcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8uartjMGe7jC2YhsybxwODhaetqTXeMKyLK7cC97BbI=;
        b=OZMTNJXRvEfmNfgJAYNeBnR67+8SHY2IWEhVaSWV98oJKg9Hu+Qdu/IVRDyTsv7sX+
         ldcC+jtwzXP5l1KDAWVJW3qqSNGz3nGUO2TPwDYNJajK0Gtdci167gAakWq//XQ2He0l
         PxcVKihKQdSCLEkInVwiZceyl/8/udviikn75u3zoMH5CecsvFOpioWUAlwADpeeOXkw
         SPsNpVa4sLdM/QoHlow3/swPyV1nvwMjs/xp/fPFX6pi0JhqyUwjvJ3SQM+IJ0Me/nVC
         hGb8I3spLt/hRdUxdgOqcTFBsXH2TZxNPZhxSZJEeeCe8mMbUVULnoGLNBVLFfldA6nF
         z30Q==
X-Gm-Message-State: AOAM53161eqQSOWi4JrNalOy5Rd0GvHrRsDQwL0mZuoAiWCibCQL0Kzp
	z/f3I4pOcQreC6+rbLIp3NCl5MrZtcMlIg==
X-Google-Smtp-Source: 
 ABdhPJwIw2vf5rJ3gpgsFXsU9e3phPRAaUcVUdGetOu5C4vFkMpPKtfPyOn0RxKegePteFLBDdO/mw==
X-Received: by 2002:a17:902:ba8c:b0:14f:d9b7:ab4 with SMTP id
 k12-20020a170902ba8c00b0014fd9b70ab4mr20840285pls.23.1651657738456;
        Wed, 04 May 2022 02:48:58 -0700 (PDT)
Received: from localhost.localdomain ([223.177.214.13])
        by smtp.gmail.com with ESMTPSA id
 s6-20020aa78286000000b0050dc76281d1sm8063172pfm.171.2022.05.04.02.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 02:48:57 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH 1/2] Add new target: "qemuarm-secureboot"
Date: Wed,  4 May 2022 15:18:50 +0530
Message-Id: <20220504094851.201843-1-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 May 2022 09:49:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3350

Add a new 32 bit target as "qemuarm-secureboot" on similar lines as
"qemuarm64-secureboot". The boot flow looks like:

BL1 (TF-A) -> BL2 (TF-A) -> OP-TEE -> u-boot -> Linux

Along with this enable support for OP-TEE based firmware TPM.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 meta-arm/conf/machine/qemuarm-secureboot.conf | 22 ++++++++++++++++++
 .../trusted-firmware-a_%.bbappend             | 23 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot/qemuarm.cfg     |  6 +++++
 meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend |  1 +
 .../linux/linux-yocto_%.bbappend              |  5 ++++
 .../optee-ftpm/optee-ftpm_git.bb              |  1 +
 meta-arm/recipes-security/optee/optee.inc     |  4 +++-
 meta-arm/wic/qemuarm.cfg                      |  3 +++
 meta-arm/wic/qemuarm.wks                      |  4 ++++
 9 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/conf/machine/qemuarm-secureboot.conf
 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot/qemuarm.cfg
 create mode 100644 meta-arm/wic/qemuarm.cfg
 create mode 100644 meta-arm/wic/qemuarm.wks

diff --git a/meta-arm/conf/machine/qemuarm-secureboot.conf b/meta-arm/conf/machine/qemuarm-secureboot.conf
new file mode 100644
index 0000000..e8085fa
--- /dev/null
+++ b/meta-arm/conf/machine/qemuarm-secureboot.conf
@@ -0,0 +1,22 @@
+MACHINEOVERRIDES =. "qemuarm:"
+
+require ${COREBASE}/meta/conf/machine/qemuarm.conf
+
+# secure=on can't ever use KVM, so force it off
+QEMU_USE_KVM = ""
+
+QB_MACHINE = "-machine virt,highmem=off,secure=on"
+QB_MEM = "-m 1024"
+QB_DEFAULT_FSTYPE = "wic.qcow2"
+QB_DEFAULT_BIOS = "flash.bin"
+QB_FSINFO = "wic:no-kernel-in-fs"
+QB_ROOTFS_OPT = ""
+QB_KERNEL_ROOT = "/dev/vda2"
+
+IMAGE_FSTYPES += "wic wic.qcow2"
+
+WKS_FILE ?= "qemuarm.wks"
+WKS_FILE_DEPENDS = "trusted-firmware-a"
+IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
+
+MACHINE_FEATURES += "optee-ftpm"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 71055e1..76d2f41 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -1,18 +1,24 @@
 COMPATIBLE_MACHINE:qemuarm64-secureboot = "qemuarm64-secureboot"
 COMPATIBLE_MACHINE:qemu-generic-arm64 = "qemu-generic-arm64"
+COMPATIBLE_MACHINE:qemuarm-secureboot = "qemuarm-secureboot"
 
 TFA_PLATFORM:qemuarm64-secureboot = "qemu"
 TFA_PLATFORM:qemu-generic-arm64 = "qemu_sbsa"
+TFA_PLATFORM:qemuarm-secureboot = "qemu"
 
 TFA_SPD:qemuarm64-secureboot = "opteed"
 
 TFA_UBOOT:qemuarm64-secureboot = "1"
+TFA_UBOOT:qemuarm-secureboot = "1"
 TFA_BUILD_TARGET:aarch64:qemuall = "all fip"
+TFA_BUILD_TARGET:arm:qemuall = "all fip"
 
 TFA_INSTALL_TARGET:qemuarm64-secureboot = "flash.bin"
 TFA_INSTALL_TARGET:qemu-generic-arm64 = "bl1 fip"
+TFA_INSTALL_TARGET:qemuarm-secureboot = "flash.bin"
 
 DEPENDS:append:aarch64:qemuall = " optee-os"
+DEPENDS:append:arm:qemuall = " optee-os"
 
 EXTRA_OEMAKE:append:aarch64:qemuall = " \
     BL32=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-header_v2.bin \
@@ -21,9 +27,26 @@ EXTRA_OEMAKE:append:aarch64:qemuall = " \
     BL32_RAM_LOCATION=tdram \
     "
 
+EXTRA_OEMAKE:append:arm:qemuall = " \
+    BL32=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-header_v2.bin \
+    BL32_EXTRA1=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pager_v2.bin \
+    BL32_EXTRA2=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pageable_v2.bin \
+    ARM_ARCH_MAJOR=7 \
+    ARCH=aarch32 \
+    BL32_RAM_LOCATION=tdram \
+    AARCH32_SP=optee \
+    "
+
 do_compile:append:qemuarm64-secureboot() {
     # Create a secure flash image for booting AArch64 Qemu. See:
     # https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/tree/docs/plat/qemu.rst
     dd if=${BUILD_DIR}/bl1.bin of=${BUILD_DIR}/flash.bin bs=4096 conv=notrunc
     dd if=${BUILD_DIR}/fip.bin of=${BUILD_DIR}/flash.bin seek=64 bs=4096 conv=notrunc
 }
+
+do_compile:append:qemuarm-secureboot() {
+    # Create a secure flash image for booting AArch64 Qemu. See:
+    # https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/tree/docs/plat/qemu.rst
+    dd if=${BUILD_DIR}/bl1.bin of=${BUILD_DIR}/flash.bin bs=4096 conv=notrunc
+    dd if=${BUILD_DIR}/fip.bin of=${BUILD_DIR}/flash.bin seek=64 bs=4096 conv=notrunc
+}
diff --git a/meta-arm/recipes-bsp/u-boot/u-boot/qemuarm.cfg b/meta-arm/recipes-bsp/u-boot/u-boot/qemuarm.cfg
new file mode 100644
index 0000000..db8dfec
--- /dev/null
+++ b/meta-arm/recipes-bsp/u-boot/u-boot/qemuarm.cfg
@@ -0,0 +1,6 @@
+# This must match the address that TF-A jumps to for BL33
+CONFIG_SYS_TEXT_BASE=0x60000000
+CONFIG_ENV_IS_NOWHERE=y
+# CONFIG_ENV_IS_IN_FLASH is not set
+# CONFIG_MTD is not set
+# CONFIG_MTD_NOR_FLASH is not set
diff --git a/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
index f725156..0683a78 100644
--- a/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -1,3 +1,4 @@
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
 SRC_URI:append:qemuarm64-secureboot = " file://qemuarm64.cfg"
+SRC_URI:append:qemuarm-secureboot = " file://qemuarm.cfg"
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
index f12dc7c..f9bd2d6 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
@@ -11,3 +11,8 @@ SRC_URI:append:qemuarm64-secureboot = " \
     file://zone_dma_revert.patch \
     file://tee.cfg \
     "
+
+FILESEXTRAPATHS:prepend:qemuarm-secureboot = "${ARMFILESPATHS}"
+SRC_URI:append:qemuarm-secureboot = " \
+    file://tee.cfg \
+    "
diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
index 7ad408b..7028a9b 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
@@ -6,6 +6,7 @@ COMPATIBLE_MACHINE ?= "invalid"
 COMPATIBLE_MACHINE:qemuarm64 = "qemuarm64"
 COMPATIBLE_MACHINE:qemuarm64-secureboot = "qemuarm64"
 COMPATIBLE_MACHINE:qemu-generic-arm64 = "qemu-generic-arm64"
+COMPATIBLE_MACHINE:qemuarm-secureboot = "qemuarm"
 
 #FIXME - doesn't currently work with clang
 TOOLCHAIN = "gcc"
diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-security/optee/optee.inc
index beae366..0dd08a7 100644
--- a/meta-arm/recipes-security/optee/optee.inc
+++ b/meta-arm/recipes-security/optee/optee.inc
@@ -3,13 +3,15 @@ UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 COMPATIBLE_MACHINE ?= "invalid"
 COMPATIBLE_MACHINE:qemuarm64 ?= "qemuarm64"
 COMPATIBLE_MACHINE:qemu-generic-arm64 ?= "qemu-generic-arm64"
+COMPATIBLE_MACHINE:qemuarm ?= "qemuarm"
 # Please add supported machines below or set it in .bbappend or .conf
 
 OPTEEMACHINE ?= "${MACHINE}"
 OPTEEMACHINE:aarch64:qemuall ?= "vexpress-qemu_armv8a"
+OPTEEMACHINE:arm:qemuall ?= "vexpress-qemu_virt"
 
 OPTEE_ARCH = "null"
-OPTEE_ARCH:armv7a = "arm32"
+OPTEE_ARCH:arm = "arm32"
 OPTEE_ARCH:aarch64 = "arm64"
 OPTEE_CORE = "${@d.getVar('OPTEE_ARCH').upper()}"
 
diff --git a/meta-arm/wic/qemuarm.cfg b/meta-arm/wic/qemuarm.cfg
new file mode 100644
index 0000000..79ce7b4
--- /dev/null
+++ b/meta-arm/wic/qemuarm.cfg
@@ -0,0 +1,3 @@
+default Yocto
+label Yocto
+    kernel /zImage
diff --git a/meta-arm/wic/qemuarm.wks b/meta-arm/wic/qemuarm.wks
new file mode 100644
index 0000000..ccd53c2
--- /dev/null
+++ b/meta-arm/wic/qemuarm.wks
@@ -0,0 +1,4 @@
+bootloader --ptable gpt --configfile="qemuarm.cfg"
+
+part /boot --ondisk=vda --align 64 --size=100M --active --source bootimg-partition --fstype=ext4 --label boot --sourceparams="loader=u-boot"
+part /     --ondisk=vda                                 --source rootfs            --fstype=ext4 --label root
-- 
2.17.1


