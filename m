Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08AAEC16B13
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 13:37:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.18669.1713793065536584667
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Apr 2024 06:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8801213D5;
	Mon, 22 Apr 2024 06:38:13 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE9883F73F;
	Mon, 22 Apr 2024 06:37:44 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 4/6] arm-bsp: add new sbsa-ref machine
Date: Mon, 22 Apr 2024 13:37:37 +0000
Message-Id: <20240422133739.190536-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240422133739.190536-1-ross.burton@arm.com>
References: <20240422133739.190536-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 22 Apr 2024 13:37:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5581

This is mostly based on the existing qemu-generic-arm64 machine, but by
not being based on the genericarm64 and instead being specifically a
machine to run on the qemu sbsa-ref machine we get to tune differently.

Specifically, this configures sbsa-ref to be a Neoverse N2 (v9), and the
tune is set to match.  Another notable difference to qemu-generic-arm64
is that the kernel configuration is at present defconfig.  We may wish
to change this in the future to be the same fragmented configuration as
genericarm64.

We have to ignore two testimage parselogs failures: one from NUMA which
will be fixed in a future EDK2 release, and one from efifb where we
should be using the bochsdrm driver instead (further investigation is
needed)

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml                                | 10 +++++
 ci/sbsa-ref.yml                               | 10 +++++
 meta-arm-bsp/conf/layer.conf                  |  2 +
 meta-arm-bsp/conf/machine/sbsa-ref.conf       | 43 +++++++++++++++++++
 .../cases/parselogs-ignores-sbsa-ref.txt      |  5 +++
 .../trusted-firmware-a-sbsa-ref.inc           |  6 +++
 .../trusted-firmware-a_%.bbappend             |  1 +
 .../uefi/edk2-firmware-sbsa-ref.inc           | 19 ++++++++
 .../recipes-bsp/uefi/edk2-firmware_%.bbappend |  1 +
 .../linux/linux-arm-platforms.inc             |  7 +++
 .../optee/optee-ftpm_%.bbappend               |  1 +
 .../optee/optee-os-sbsa-ref.inc               |  1 +
 .../optee/optee-os_4.%.bbappend               |  1 +
 13 files changed, 107 insertions(+)
 create mode 100644 ci/sbsa-ref.yml
 create mode 100644 meta-arm-bsp/conf/machine/sbsa-ref.conf
 create mode 100644 meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores=
-sbsa-ref.txt
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a-sbsa-ref.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sbsa-ref.=
inc
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-ftpm_%.bbap=
pend
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-sbsa-ref=
.inc

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 36d3a6d6..e94ea733 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -172,6 +172,16 @@ genericarm64:
 generic-arm64:
   extends: .build
=20
+sbsa-ref:
+  extends: .build
+  parallel:
+    matrix:
+      - KERNEL: [linux-yocto, linux-yocto-rt]
+        TOOLCHAINS: [gcc, clang]
+        TESTING: testimage
+      - KERNEL: linux-yocto-dev
+        TESTING: testimage
+
 juno:
   extends: .build
   parallel:
diff --git a/ci/sbsa-ref.yml b/ci/sbsa-ref.yml
new file mode 100644
index 00000000..23680bd1
--- /dev/null
+++ b/ci/sbsa-ref.yml
@@ -0,0 +1,10 @@
+header:
+  version: 14
+  includes:
+    - ci/base.yml
+
+machine: sbsa-ref
+
+target:
+  - core-image-sato
+  - sbsa-acs
diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 9013d11f..1a458400 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -26,3 +26,5 @@ BBFILES_DYNAMIC +=3D " \
 "
=20
 WARN_QA:append:layer-meta-arm-bsp =3D " patch-status"
+
+addpylib ${LAYERDIR}/lib oeqa
diff --git a/meta-arm-bsp/conf/machine/sbsa-ref.conf b/meta-arm-bsp/conf/=
machine/sbsa-ref.conf
new file mode 100644
index 00000000..ccfc45a8
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/sbsa-ref.conf
@@ -0,0 +1,43 @@
+#@TYPE: Machine
+#@NAME: sbsa-ref
+#@DESCRIPTION: Reference SBSA machine in qemu-system-aarch64 on Neoverse=
 N2
+
+require conf/machine/include/arm/armv9a/tune-neoversen2.inc
+require conf/machine/include/qemu.inc
+
+PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
+KERNEL_IMAGETYPE =3D "Image"
+MACHINE_EXTRA_RRECOMMENDS +=3D "kernel-modules"
+
+MACHINE_FEATURES =3D " alsa bluetooth efi qemu-usermode rtc screen usbho=
st vfat wifi"
+
+IMAGE_FSTYPES +=3D "wic.qcow2"
+
+# This unique WIC file is necessary because kernel boot args cannot be p=
assed
+# because there is no default kernel (see below).  There is no default k=
ernel
+# because QEMU will only allow firmware or kernel to be passed in as a
+# parameter, and we need the firmware.  So, to allow for "ip=3Ddhcp" as =
a kernel
+# boot arg (which we need for testimage), we have to have a WIC file uni=
que to
+# this platform.
+WKS_FILE =3D "qemu-efi-disk.wks.in"
+
+EFI_PROVIDER ?=3D "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "s=
ystemd-boot", "grub-efi", d)}"
+
+SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;hvc0"
+
+EXTRA_IMAGEDEPENDS +=3D "edk2-firmware"
+
+QB_SYSTEM_NAME =3D "qemu-system-aarch64"
+QB_MACHINE =3D "-machine sbsa-ref"
+QB_CPU =3D "-cpu neoverse-n2"
+QB_MEM =3D "-m 1024"
+QB_DEFAULT_FSTYPE =3D "wic.qcow2"
+QB_NETWORK_DEVICE =3D "-device virtio-net-pci,netdev=3Dnet0,mac=3D@MAC@"
+QB_DRIVE_TYPE =3D "/dev/hd"
+QB_ROOTFS_OPT =3D "-drive file=3D@ROOTFS@,if=3Dide,format=3Dqcow2"
+QB_DEFAULT_KERNEL =3D "none"
+QB_OPT_APPEND =3D "-device usb-tablet -device usb-kbd -pflash @DEPLOY_DI=
R_IMAGE@/SBSA_FLASH0.fd -pflash @DEPLOY_DIR_IMAGE@/SBSA_FLASH1.fd"
+QB_SERIAL_OPT =3D "-device virtio-serial-pci -chardev null,id=3Dvirtcon =
-device virtconsole,chardev=3Dvirtcon"
+QB_TCPSERIAL_OPT =3D "-device virtio-serial-pci -chardev socket,id=3Dvir=
tcon,port=3D@PORT@,host=3D127.0.0.1 -device virtconsole,chardev=3Dvirtcon=
"
+# sbsa-ref is a true virtual machine so can't use KVM
+QEMU_USE_KVM =3D "0"
diff --git a/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-sbsa-r=
ef.txt b/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-sbsa-ref.t=
xt
new file mode 100644
index 00000000..dd477996
--- /dev/null
+++ b/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-sbsa-ref.txt
@@ -0,0 +1,5 @@
+# The release of EDK2 after 202402 should fix this
+NUMA: Failed to initialise from firmware
+
+# TODO: we should be using bochsdrm over efifb?
+efifb: cannot reserve video memory at 0x80000000
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-sbsa-ref.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a-sbsa-ref.inc
new file mode 100644
index 00000000..15061397
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-sbsa=
-ref.inc
@@ -0,0 +1,6 @@
+# sbsa-ref specific TF-A support
+
+COMPATIBLE_MACHINE =3D "sbsa-ref"
+
+TFA_PLATFORM       =3D "qemu_sbsa"
+TFA_INSTALL_TARGET =3D "bl1 fip"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_%.bbappend
index cb482a6f..214996a9 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bb=
append
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bb=
append
@@ -7,6 +7,7 @@ MACHINE_TFA_REQUIRE:corstone1000 =3D "trusted-firmware-a-=
corstone1000.inc"
 MACHINE_TFA_REQUIRE:fvp-base =3D "trusted-firmware-a-fvp-base.inc"
 MACHINE_TFA_REQUIRE:juno =3D "trusted-firmware-a-juno.inc"
 MACHINE_TFA_REQUIRE:n1sdp =3D "trusted-firmware-a-n1sdp.inc"
+MACHINE_TFA_REQUIRE:sbsa-ref =3D "trusted-firmware-a-sbsa-ref.inc"
 MACHINE_TFA_REQUIRE:sgi575 =3D "trusted-firmware-a-sgi575.inc"
 MACHINE_TFA_REQUIRE:tc =3D "trusted-firmware-a-tc.inc"
=20
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sbsa-ref.inc b/m=
eta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sbsa-ref.inc
new file mode 100644
index 00000000..450f6af2
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sbsa-ref.inc
@@ -0,0 +1,19 @@
+COMPATIBLE_MACHINE:sbsa-ref =3D "sbsa-ref"
+
+DEPENDS:append:sbsa-ref     =3D " trusted-firmware-a coreutils-native"
+
+EDK2_PLATFORM:sbsa-ref      =3D "SbsaQemu"
+EDK2_PLATFORM_DSC:sbsa-ref  =3D "Platform/Qemu/SbsaQemu/SbsaQemu.dsc"
+EDK2_BIN_NAME:sbsa-ref      =3D "SBSA_FLASH0.fd"
+
+do_compile:prepend:sbsa-ref() {
+    mkdir -p ${B}/Platform/Qemu/Sbsa/
+    cp ${RECIPE_SYSROOT}/firmware/bl1.bin ${B}/Platform/Qemu/Sbsa/
+    cp ${RECIPE_SYSROOT}/firmware/fip.bin ${B}/Platform/Qemu/Sbsa/
+}
+
+do_install:append:sbsa-ref() {
+    install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILE=
R}/FV/SBSA_FLASH*.fd ${D}/firmware/
+    # QEMU requires that the images be minimum of 256M in size
+    truncate -s 256M ${D}/firmware/SBSA_FLASH*.fd
+}
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend b/met=
a-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend
index e5018bb0..cba48460 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend
@@ -4,6 +4,7 @@ MACHINE_EDK2_REQUIRE ?=3D ""
=20
 MACHINE_EDK2_REQUIRE:fvp-base =3D "edk2-firmware-fvp-base.inc"
 MACHINE_EDK2_REQUIRE:juno =3D "edk2-firmware-juno.inc"
+MACHINE_EDK2_REQUIRE:sbsa-ref =3D "edk2-firmware-sbsa-ref.inc"
 MACHINE_EDK2_REQUIRE:sgi575 =3D "edk2-firmware-sgi575.inc"
 MACHINE_EDK2_REQUIRE:n1sdp =3D "edk2-firmware-n1sdp.inc"
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 2856b461..933acc3e 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -100,3 +100,10 @@ KCONFIG_MODE:sgi575 =3D "--alldefconfig"
 COMPATIBLE_MACHINE:tc =3D "(tc0|tc1)"
 KBUILD_DEFCONFIG:tc =3D "defconfig"
 KCONFIG_MODE:tc =3D "--alldefconfig"
+
+#
+# sbsa-ref KMACHINE
+#
+COMPATIBLE_MACHINE:sbsa-ref =3D "sbsa-ref"
+KBUILD_DEFCONFIG:sbsa-ref =3D "defconfig"
+KCONFIG_MODE:sbsa-ref =3D "--alldefconfig"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-ftpm_%.bbappend b/=
meta-arm-bsp/recipes-security/optee/optee-ftpm_%.bbappend
new file mode 100644
index 00000000..6e46c371
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-ftpm_%.bbappend
@@ -0,0 +1 @@
+COMPATIBLE_MACHINE:sbsa-ref =3D "sbsa-ref"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-sbsa-ref.inc b/=
meta-arm-bsp/recipes-security/optee/optee-os-sbsa-ref.inc
new file mode 100644
index 00000000..6e46c371
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-sbsa-ref.inc
@@ -0,0 +1 @@
+COMPATIBLE_MACHINE:sbsa-ref =3D "sbsa-ref"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_4.%.bbappend b/=
meta-arm-bsp/recipes-security/optee/optee-os_4.%.bbappend
index 788a23ef..ee0945d9 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_4.%.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_4.%.bbappend
@@ -3,5 +3,6 @@
 MACHINE_OPTEE_OS_REQUIRE ?=3D ""
 MACHINE_OPTEE_OS_REQUIRE:corstone1000 =3D "optee-os-corstone1000-common.=
inc"
 MACHINE_OPTEE_OS_REQUIRE:n1sdp =3D "optee-os-n1sdp.inc"
+MACHINE_OPTEE_OS_REQUIRE:sbsa-ref =3D "optee-os-sbsa-ref.inc"
=20
 require ${MACHINE_OPTEE_OS_REQUIRE}
--=20
2.34.1


