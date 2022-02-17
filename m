Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F14C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:10:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1815.1645114235867347141
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Feb 2022 08:10:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C321113E;
	Thu, 17 Feb 2022 08:10:35 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.87.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 715313F718;
	Thu, 17 Feb 2022 08:10:34 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 0/6] Add UEFI to fvp-baser-aemv8r64 using U-Boot
Date: Thu, 17 Feb 2022 16:09:53 +0000
Message-Id: <20220217160959.4157807-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Feb 2022 16:10:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3015

From: Peter Hoyes <Peter.Hoyes@arm.com>

These patches provide the following updates for the fvp-baser-aemv8r64 BS=
P:

 * Add board support patches for U-Boot v2022.01, and bundle U-Boot in th=
e=20
   boot-wrapper-aarch64 binary to provide UEFI support.
 * Update boot-wrapper to more recent version and include patches to boot
   U-Boot at S-EL2.
 * Align FVP RAM size with upstream kernel device tree.
 * Enable the use_real_time FVP flag so that the counter increments using
   the wall clock.
 * Update documentation, including a section on the new boot architecture=
.

Peter Hoyes (6):
  arm/boot-wrapper-aarch64: Upgrade to newer revision
  arm-bsp/boot-wrapper-aarch64: Update patches for fvp-baser-aemv8r64
  arm-bsp/u-boot: Add U-Boot for fvp-baser-aemv8r64
  arm-bsp/kernel: Use 4 Gb of RAM in fvp-baser-aemv8r64
  arm-bsp/conf: Use real-time clock for fvp-baser-aemv8r64
  arm-bsp/docs: Update fvp-baser-aemv8r64 docs

 .../conf/machine/fvp-baser-aemv8r64.conf      |    8 +-
 .../documentation/fvp-baser-aemv8r64.md       |   65 +-
 ...oot-wrapper-aarch64-fvp-baser-aemv8r64.inc |   24 +-
 ...M_SYS-config-by-auto-detect-dtb-node.patch |   67 -
 ...abels-and-prepare-for-lower-EL-booti.patch |  135 +
 ...0002-aarch64-Prepare-for-EL1-booting.patch |   48 +
 ...4-Introduce-EL2-boot-code-for-v8-r64.patch |  314 -
 ...aarch64-Prepare-for-lower-EL-booting.patch |   55 +
 ...04-gic-v3-Prepare-for-gicv3-with-EL2.patch |  105 +
 ...aarch64-Prepare-for-booting-with-EL2.patch |   63 +
 ...ce-EL2-boot-code-for-Armv8-R-AArch64.patch |  182 +
 ...-psci-to-choose-between-smc-and-hvc.patch} |   42 +-
 ...4-Disable-CNTPCT_EL0-trap-for-v8-R64.patch |   48 +
 .../0009-lds-Mark-the-mem-range.patch         |   38 +
 .../0010-common-Introduce-the-libfdt.patch    | 6044 +++++++++++++++++
 ...-common-Add-essential-libc-functions.patch |  101 +
 ...dd-the-libfdt-to-the-Makefile-system.patch |   61 +
 .../0013-platform-Add-print_hex-func.patch    |   67 +
 ...4-common-Add-mem-usage-to-memreserve.patch |   96 +
 ...dd-the-enable-keep-el-compile-option.patch |  102 +
 ...efile-Change-COUNTER_FREQ-to-100-MHz.patch |   34 +
 ...ation-for-the-Arm-VExpress64-board-c.patch |  109 +
 ...tor-header-file-to-make-it-easier-to.patch |  172 +
 ...Clean-up-BASE_FVP-boot-configuration.patch |   99 +
 ...e-OF_CONTROL-and-OF_BOARD-for-VExpre.patch |  110 +
 ...s64-Enable-VIRTIO_NET-network-driver.patch |   62 +
 ...v8-Add-ARMv8-MPU-configuration-logic.patch |  259 +
 ...bling-exception-vectors-on-non-SPL-b.patch |  111 +
 ...mv8-ARMV8_SWITCH_TO_EL1-improvements.patch |  163 +
 ...ling-HVC-configurable-when-switching.patch |   73 +
 ...press64-Do-not-set-COUNTER_FREQUENCY.patch |   37 +
 ...Add-BASER_FVP-vexpress-board-variant.patch |  275 +
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   17 +
 .../fvp-baser-aemv8r64/fvp-baser-aemv8r64.dts |    2 +-
 .../boot-wrapper-aarch64_git.bb               |    2 +-
 .../boot-wrapper-aarch64_%.bbappend           |    3 +
 36 files changed, 8784 insertions(+), 409 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0001-Decouple-V2M_SYS-config-by-auto-detect-dtb-node.pa=
tch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0001-aarch64-Rename-labels-and-prepare-for-lower-EL-boo=
ti.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0002-aarch64-Prepare-for-EL1-booting.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0002-arch64-Introduce-EL2-boot-code-for-v8-r64.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0003-aarch64-Prepare-for-lower-EL-booting.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0004-gic-v3-Prepare-for-gicv3-with-EL2.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0005-aarch64-Prepare-for-booting-with-EL2.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0006-aarch64-Introduce-EL2-boot-code-for-Armv8-R-AArch6=
4.patch
 rename meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aem=
v8r64/{0003-Allow-enable-psci-to-choose-between-smc-and-hvc.patch =3D> 00=
07-Allow-enable-psci-to-choose-between-smc-and-hvc.patch} (71%)
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0008-aarch64-Disable-CNTPCT_EL0-trap-for-v8-R64.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0009-lds-Mark-the-mem-range.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0010-common-Introduce-the-libfdt.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0011-common-Add-essential-libc-functions.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0012-Makefile-Add-the-libfdt-to-the-Makefile-system.pat=
ch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0013-platform-Add-print_hex-func.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0014-common-Add-mem-usage-to-memreserve.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0015-boot-Add-the-enable-keep-el-compile-option.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0016-Makefile-Change-COUNTER_FREQ-to-100-MHz.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0001-doc-Add-documentation-for-the-Arm-VExpress64-board-c.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0002-vexpress64-Refactor-header-file-to-make-it-easier-to.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0003-vexpress64-Clean-up-BASE_FVP-boot-configuration.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0004-vexpress64-Enable-OF_CONTROL-and-OF_BOARD-for-VExpre.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0005-vexpress64-Enable-VIRTIO_NET-network-driver.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0006-armv8-Add-ARMv8-MPU-configuration-logic.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0007-armv8-Allow-disabling-exception-vectors-on-non-SPL-b.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0008-armv8-ARMV8_SWITCH_TO_EL1-improvements.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0009-armv8-Make-disabling-HVC-configurable-when-switching.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0010-vexpress64-Do-not-set-COUNTER_FREQUENCY.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0011-vexpress64-Add-BASER_FVP-vexpress-board-variant.patch

--=20
2.25.1


