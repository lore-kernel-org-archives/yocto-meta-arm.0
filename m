Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8396AC43217
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 17:46:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.30023.1644428791814044522
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Feb 2022 09:46:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63C0BED1
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Feb 2022 09:46:31 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A82B3F70D
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Feb 2022 09:46:30 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/5] arm-bsp/linux-yocto: remove unused 5.4 and 5.7 kernels
Date: Wed,  9 Feb 2022 17:46:24 +0000
Message-Id: <20220209174624.3824874-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209174624.3824874-1-ross.burton@arm.com>
References: <20220209174624.3824874-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 09 Feb 2022 17:46:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2973

These were used by SGI575 and Juno, but they are now tracking the latest
release in oe-core.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux-yocto-5.7/coresight-traceid.patch   |  71 -----------
 .../linux/linux-yocto-5.7/defconfig.patch     | 112 ------------------
 .../recipes-kernel/linux/linux-yocto_5.4.bb   |  22 ----
 .../linux/linux-yocto_5.7%.bbappend           |   5 -
 .../recipes-kernel/linux/linux-yocto_5.7.bb   |  22 ----
 5 files changed, 232 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.7/cor=
esight-traceid.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.7/def=
config.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bb
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bb=
append
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7.bb

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.7/coresight-=
traceid.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.7/coresig=
ht-traceid.patch
deleted file mode 100644
index f72e59db..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.7/coresight-traceid=
.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-Fix the build with coresight enabled.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From d5d9bc542a53b3fa3b0272090b152303cf4a57d9 Mon Sep 17 00:00:00 2001
-From: Leo Yan <leo.yan@linaro.org>
-Date: Tue, 5 May 2020 21:36:42 +0800
-Subject: [PATCH] perf cs-etm: Move definition of 'traceid_list' global
- variable from header file
-
-The variable 'traceid_list' is defined in the header file cs-etm.h,
-if multiple C files include cs-etm.h the compiler might complaint for
-multiple definition of 'traceid_list'.
-
-To fix multiple definition error, move the definition of 'traceid_list'
-into cs-etm.c.
-
-Fixes: cd8bfd8c973e ("perf tools: Add processing of coresight metadata")
-Reported-by: Thomas Backlund <tmb@mageia.org>
-Signed-off-by: Leo Yan <leo.yan@linaro.org>
-Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
-Reviewed-by: Mike Leach <mike.leach@linaro.org>
-Tested-by: Mike Leach <mike.leach@linaro.org>
-Tested-by: Thomas Backlund <tmb@mageia.org>
-Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
-Cc: Jiri Olsa <jolsa@redhat.com>
-Cc: Mark Rutland <mark.rutland@arm.com>
-Cc: Namhyung Kim <namhyung@kernel.org>
-Cc: Peter Zijlstra <peterz@infradead.org>
-Cc: Suzuki Poulouse <suzuki.poulose@arm.com>
-Cc: Tor Jeremiassen <tor@ti.com>
-Cc: linux-arm-kernel@lists.infradead.org
-Link: http://lore.kernel.org/lkml/20200505133642.4756-1-leo.yan@linaro.o=
rg
-Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
----
- tools/perf/util/cs-etm.c | 3 +++
- tools/perf/util/cs-etm.h | 3 ---
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
-index 62d2f9b9ce1b..381d9708e9bd 100644
---- a/tools/perf/util/cs-etm.c
-+++ b/tools/perf/util/cs-etm.c
-@@ -94,6 +94,9 @@ struct cs_etm_queue {
- 	struct cs_etm_traceid_queue **traceid_queues;
- };
-=20
-+/* RB tree for quick conversion between traceID and metadata pointers *=
/
-+static struct intlist *traceid_list;
-+
- static int cs_etm__update_queues(struct cs_etm_auxtrace *etm);
- static int cs_etm__process_queues(struct cs_etm_auxtrace *etm);
- static int cs_etm__process_timeless_queues(struct cs_etm_auxtrace *etm,
-diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
-index 650ecc2a6349..4ad925d6d799 100644
---- a/tools/perf/util/cs-etm.h
-+++ b/tools/perf/util/cs-etm.h
-@@ -114,9 +114,6 @@ enum cs_etm_isa {
- 	CS_ETM_ISA_T32,
- };
-=20
--/* RB tree for quick conversion between traceID and metadata pointers *=
/
--struct intlist *traceid_list;
--
- struct cs_etm_queue;
-=20
- struct cs_etm_packet {
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.7/defconfig.=
patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.7/defconfig.patch
deleted file mode 100644
index 71b1b1ed..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.7/defconfig.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-Change USB_CONN_GPIO to 'y' by default and regenerate the defconfig via
-`make savedefconfig`.
-
-Upstream-Status: Inappropriate [not needed in newer kernels]
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-
-diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index 03d0189f7d68..a4baafe01c34 100644
---- a/arch/arm64/configs/defconfig
-+++ b/arch/arm64/configs/defconfig
-@@ -165,9 +165,9 @@ CONFIG_QRTR_SMD=3Dm
- CONFIG_QRTR_TUN=3Dm
- CONFIG_BPF_JIT=3Dy
- CONFIG_CAN=3Dm
-+CONFIG_CAN_FLEXCAN=3Dm
- CONFIG_CAN_RCAR=3Dm
- CONFIG_CAN_RCAR_CANFD=3Dm
--CONFIG_CAN_FLEXCAN=3Dm
- CONFIG_BT=3Dm
- CONFIG_BT_HIDP=3Dm
- # CONFIG_BT_HS is not set
-@@ -202,20 +202,19 @@ CONFIG_PCI_HOST_THUNDER_ECAM=3Dy
- CONFIG_PCIE_ROCKCHIP_HOST=3Dm
- CONFIG_PCIE_BRCMSTB=3Dm
- CONFIG_PCI_LAYERSCAPE=3Dy
--CONFIG_PCIE_LAYERSCAPE_GEN4=3Dy
- CONFIG_PCI_HISI=3Dy
- CONFIG_PCIE_QCOM=3Dy
- CONFIG_PCIE_ARMADA_8K=3Dy
- CONFIG_PCIE_KIRIN=3Dy
- CONFIG_PCIE_HISI_STB=3Dy
- CONFIG_PCIE_TEGRA194_HOST=3Dm
-+CONFIG_PCIE_LAYERSCAPE_GEN4=3Dy
- CONFIG_DEVTMPFS=3Dy
- CONFIG_DEVTMPFS_MOUNT=3Dy
- CONFIG_FW_LOADER_USER_HELPER=3Dy
- CONFIG_FW_LOADER_USER_HELPER_FALLBACK=3Dy
- CONFIG_HISILICON_LPC=3Dy
- CONFIG_SIMPLE_PM_BUS=3Dy
--CONFIG_FSL_MC_BUS=3Dy
- CONFIG_MTD=3Dy
- CONFIG_MTD_BLOCK=3Dy
- CONFIG_MTD_CFI=3Dy
-@@ -494,10 +493,10 @@ CONFIG_SENSORS_INA3221=3Dm
- CONFIG_THERMAL_GOV_POWER_ALLOCATOR=3Dy
- CONFIG_CPU_THERMAL=3Dy
- CONFIG_THERMAL_EMULATION=3Dy
--CONFIG_QORIQ_THERMAL=3Dm
--CONFIG_SUN8I_THERMAL=3Dy
- CONFIG_IMX_SC_THERMAL=3Dm
- CONFIG_IMX8MM_THERMAL=3Dm
-+CONFIG_QORIQ_THERMAL=3Dm
-+CONFIG_SUN8I_THERMAL=3Dy
- CONFIG_ROCKCHIP_THERMAL=3Dm
- CONFIG_RCAR_THERMAL=3Dy
- CONFIG_RCAR_GEN3_THERMAL=3Dy
-@@ -567,7 +566,6 @@ CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
- CONFIG_MEDIA_SDR_SUPPORT=3Dy
- CONFIG_MEDIA_CONTROLLER=3Dy
- CONFIG_VIDEO_V4L2_SUBDEV_API=3Dy
--CONFIG_MEDIA_PLATFORM_SUPPORT=3Dy
- # CONFIG_DVB_NET is not set
- CONFIG_MEDIA_USB_SUPPORT=3Dy
- CONFIG_USB_VIDEO_CLASS=3Dm
-@@ -611,10 +609,10 @@ CONFIG_DRM_MSM=3Dm
- CONFIG_DRM_TEGRA=3Dm
- CONFIG_DRM_PANEL_LVDS=3Dm
- CONFIG_DRM_PANEL_SIMPLE=3Dm
--CONFIG_DRM_SIMPLE_BRIDGE=3Dm
- CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=3Dm
- CONFIG_DRM_DISPLAY_CONNECTOR=3Dm
- CONFIG_DRM_SII902X=3Dm
-+CONFIG_DRM_SIMPLE_BRIDGE=3Dm
- CONFIG_DRM_THINE_THC63LVD1024=3Dm
- CONFIG_DRM_TI_SN65DSI86=3Dm
- CONFIG_DRM_I2C_ADV7511=3Dm
-@@ -662,7 +660,6 @@ CONFIG_SND_SOC_WSA881X=3Dm
- CONFIG_SND_SIMPLE_CARD=3Dm
- CONFIG_SND_AUDIO_GRAPH_CARD=3Dm
- CONFIG_I2C_HID=3Dm
--CONFIG_USB_CONN_GPIO=3Dm
- CONFIG_USB=3Dy
- CONFIG_USB_OTG=3Dy
- CONFIG_USB_XHCI_HCD=3Dy
-@@ -797,14 +794,13 @@ CONFIG_QCOM_A53PLL=3Dy
- CONFIG_QCOM_CLK_APCS_MSM8916=3Dy
- CONFIG_QCOM_CLK_SMD_RPM=3Dy
- CONFIG_QCOM_CLK_RPMH=3Dy
--CONFIG_IPQ_GCC_8074=3Dy
- CONFIG_IPQ_GCC_6018=3Dy
-+CONFIG_IPQ_GCC_8074=3Dy
- CONFIG_MSM_GCC_8916=3Dy
- CONFIG_MSM_GCC_8994=3Dy
- CONFIG_MSM_MMCC_8996=3Dy
- CONFIG_MSM_GCC_8998=3Dy
- CONFIG_QCS_GCC_404=3Dy
--CONFIG_SDM_GCC_845=3Dy
- CONFIG_SDM_GPUCC_845=3Dy
- CONFIG_SDM_DISPCC_845=3Dy
- CONFIG_SM_GCC_8150=3Dy
-@@ -933,10 +929,10 @@ CONFIG_FPGA_REGION=3Dm
- CONFIG_OF_FPGA_REGION=3Dm
- CONFIG_TEE=3Dy
- CONFIG_OPTEE=3Dy
-+CONFIG_MUX_MMIO=3Dy
- CONFIG_SLIMBUS=3Dm
- CONFIG_SLIM_QCOM_CTRL=3Dm
- CONFIG_SLIM_QCOM_NGD_CTRL=3Dm
--CONFIG_MUX_MMIO=3Dy
- CONFIG_EXT2_FS=3Dy
- CONFIG_EXT3_FS=3Dy
- CONFIG_EXT4_FS_POSIX_ACL=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bb b/meta-=
arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bb
deleted file mode 100644
index 0a67f878..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-KBRANCH ?=3D "v5.4/standard/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-SRCREV_machine ?=3D "807b4668ff7fe3be031ace442a84d70821ef9571"
-SRCREV_meta ?=3D "98ba88191b7c489bc0d83b6c87a31b2330fcd886"
-
-SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;b=
ranch=3D${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.4;destsuffix=3D${KMETA}"
-
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8=
814"
-LINUX_VERSION ?=3D "5.4.139"
-
-DEPENDS +=3D "openssl-native util-linux-native"
-
-PV =3D "${LINUX_VERSION}+git${SRCPV}"
-
-KMETA =3D "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL =3D "1"
-
-# Functionality flags
-KERNEL_FEATURES:append =3D " ${KERNEL_EXTRA_FEATURES}"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend =
b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend
deleted file mode 100644
index 03ce8e96..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/linux-yocto-5.7:"
-
-SRC_URI:append =3D " file://coresight-traceid.patch \
-                   file://defconfig.patch \
-                 "
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7.bb b/meta-=
arm-bsp/recipes-kernel/linux/linux-yocto_5.7.bb
deleted file mode 100644
index 81b602d6..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-KBRANCH ?=3D "v5.7/standard/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-SRCREV_machine =3D "6b9830fecd4a87d7ebb4d93484fef00f46d0fa0f"
-SRCREV_meta =3D "b9e6fd082dc5bfb51699809d7119d4b20d280c0b"
-
-SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;b=
ranch=3D${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.7;destsuffix=3D${KMETA}"
-
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
-LINUX_VERSION =3D "5.7.19"
-
-DEPENDS +=3D "openssl-native util-linux-native"
-
-PV =3D "${LINUX_VERSION}+git${SRCPV}"
-
-KMETA =3D "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL =3D "1"
-
-# Functionality flags
-KERNEL_FEATURES:append =3D " ${KERNEL_EXTRA_FEATURES}"
--=20
2.25.1


