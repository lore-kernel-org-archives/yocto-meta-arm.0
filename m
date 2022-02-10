Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C0FAC433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 12:17:36 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web12.9461.1644495455619238834
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Feb 2022 04:17:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=68ibPIYP;
 spf=pass (domain: burtonini.com, ip: 209.85.219.44,
 mailfrom: ross@burtonini.com)
Received: by mail-qv1-f44.google.com with SMTP id g3so4701906qvb.8
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Feb 2022 04:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=inyrOctuWDzYj4dm2AQx+qR/0Cn46WOCxXlEFSgL7GU=;
        b=68ibPIYPy2kdxrY1s/MZ86j5dIVEXnfmfFtMVmfwwImaYv79F3LR7jUke+6Xk+tcKc
         TCPTB29/I4OJAli3yuj0E4WR2S7KoMV9YJuiQWASmyrODfBndMEH1ikg/HfV02DK0NAx
         ydH+eBLzXZEq6LEXzK8yVeSuB6VQDJpYKUst7WNouMEfWTjvECFXKjWoAbiDMHBHoMHJ
         IqmX0PMx1ZCAQsCCSpbxrDQBL1HJ0UQvOkJE5d/bRtbQJBVGzbPZb6Z42rCygacMjm3C
         fEvuTQUW97kG40xGNXiJUwFGn66FjPXQKCL/6PN08/6ugFWmzf13mfobFxyyfp7vP0yl
         hf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=inyrOctuWDzYj4dm2AQx+qR/0Cn46WOCxXlEFSgL7GU=;
        b=i+HaSQ49gPt9W/Ati1TbZL2wQVN/4x+PBl9Kp4plTLNzKFZZjUxMGU0cbd8Z3Ope1y
         moHHcNmQxx4ZOmuC6Qsc9noGAUbunsp3Epfn1qE6KGpTeu+GUHGdgFO6CkoVtF5Yhg+2
         JYIbRgoCZx3rbEj2tEYf+WmR2RNc+/PP/+O00X9CpsCkvsEpwM21kD9tbsPbylpQpi3E
         LL2Wb4R3NAFHv+7e+MoXQQZbbdBq43uN+cvWUd/q+MyQWQK8UgbahRwqu+ORJZwxaXHC
         xcBbwPK1xA/L4/g5aNiqZNxkHGzqhtVc0BjaWyMvqIKVq1PS589Zv5OcAzO78l2L7tC0
         8OVA==
X-Gm-Message-State: AOAM5330TBfLHod/jDoN4w9dG6dgW93jycLL+49Aou/cT7JIPx2UzCLj
	NfsUcWvMLNMXKSbm/NS0KiXbN3TPGgAIBJPIJBBsnWGcKGZLxw==
X-Google-Smtp-Source: 
 ABdhPJzkZ9yOiF0/5pDM5QqnzqaYkvcZkMtl+x31Du0QyUFaqfvHT7eyTRZqzTY+HTpSlFv7S5lpwUQ/rrzib/XzlAM=
X-Received: by 2002:a05:6214:b6d:: with SMTP id
 ey13mr4743556qvb.100.1644495454167;
 Thu, 10 Feb 2022 04:17:34 -0800 (PST)
MIME-Version: 1.0
References: <20220209174624.3824874-1-ross.burton@arm.com>
 <20220209174624.3824874-5-ross.burton@arm.com>
In-Reply-To: <20220209174624.3824874-5-ross.burton@arm.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 10 Feb 2022 12:17:23 +0000
Message-ID: 
 <CAAnfSTsYyT4Dn12YR5iXP0K_GO1PJf_tZ5fZz9BRLhP+Es+ZsQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 5/5] arm-bsp/linux-yocto: remove unused 5.4 and
 5.7 kernels
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 10 Feb 2022 12:17:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2977

Retracting this for now, we need 5.4 for gem5.

Ross

On Wed, 9 Feb 2022 at 17:46, Ross Burton via lists.yoctoproject.org
<ross=burtonini.com@lists.yoctoproject.org> wrote:
>
> These were used by SGI575 and Juno, but they are now tracking the latest
> release in oe-core.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../linux-yocto-5.7/coresight-traceid.patch   |  71 -----------
>  .../linux/linux-yocto-5.7/defconfig.patch     | 112 ------------------
>  .../recipes-kernel/linux/linux-yocto_5.4.bb   |  22 ----
>  .../linux/linux-yocto_5.7%.bbappend           |   5 -
>  .../recipes-kernel/linux/linux-yocto_5.7.bb   |  22 ----
>  5 files changed, 232 deletions(-)
>  delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.7/coresight-traceid.patch
>  delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.7/defconfig.patch
>  delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bb
>  delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend
>  delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7.bb
>
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.7/coresight-traceid.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.7/coresight-traceid.patch
> deleted file mode 100644
> index f72e59db..00000000
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.7/coresight-traceid.patch
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -Fix the build with coresight enabled.
> -
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> -From d5d9bc542a53b3fa3b0272090b152303cf4a57d9 Mon Sep 17 00:00:00 2001
> -From: Leo Yan <leo.yan@linaro.org>
> -Date: Tue, 5 May 2020 21:36:42 +0800
> -Subject: [PATCH] perf cs-etm: Move definition of 'traceid_list' global
> - variable from header file
> -
> -The variable 'traceid_list' is defined in the header file cs-etm.h,
> -if multiple C files include cs-etm.h the compiler might complaint for
> -multiple definition of 'traceid_list'.
> -
> -To fix multiple definition error, move the definition of 'traceid_list'
> -into cs-etm.c.
> -
> -Fixes: cd8bfd8c973e ("perf tools: Add processing of coresight metadata")
> -Reported-by: Thomas Backlund <tmb@mageia.org>
> -Signed-off-by: Leo Yan <leo.yan@linaro.org>
> -Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> -Reviewed-by: Mike Leach <mike.leach@linaro.org>
> -Tested-by: Mike Leach <mike.leach@linaro.org>
> -Tested-by: Thomas Backlund <tmb@mageia.org>
> -Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> -Cc: Jiri Olsa <jolsa@redhat.com>
> -Cc: Mark Rutland <mark.rutland@arm.com>
> -Cc: Namhyung Kim <namhyung@kernel.org>
> -Cc: Peter Zijlstra <peterz@infradead.org>
> -Cc: Suzuki Poulouse <suzuki.poulose@arm.com>
> -Cc: Tor Jeremiassen <tor@ti.com>
> -Cc: linux-arm-kernel@lists.infradead.org
> -Link: http://lore.kernel.org/lkml/20200505133642.4756-1-leo.yan@linaro.org
> -Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> ----
> - tools/perf/util/cs-etm.c | 3 +++
> - tools/perf/util/cs-etm.h | 3 ---
> - 2 files changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> -index 62d2f9b9ce1b..381d9708e9bd 100644
> ---- a/tools/perf/util/cs-etm.c
> -+++ b/tools/perf/util/cs-etm.c
> -@@ -94,6 +94,9 @@ struct cs_etm_queue {
> -       struct cs_etm_traceid_queue **traceid_queues;
> - };
> -
> -+/* RB tree for quick conversion between traceID and metadata pointers */
> -+static struct intlist *traceid_list;
> -+
> - static int cs_etm__update_queues(struct cs_etm_auxtrace *etm);
> - static int cs_etm__process_queues(struct cs_etm_auxtrace *etm);
> - static int cs_etm__process_timeless_queues(struct cs_etm_auxtrace *etm,
> -diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
> -index 650ecc2a6349..4ad925d6d799 100644
> ---- a/tools/perf/util/cs-etm.h
> -+++ b/tools/perf/util/cs-etm.h
> -@@ -114,9 +114,6 @@ enum cs_etm_isa {
> -       CS_ETM_ISA_T32,
> - };
> -
> --/* RB tree for quick conversion between traceID and metadata pointers */
> --struct intlist *traceid_list;
> --
> - struct cs_etm_queue;
> -
> - struct cs_etm_packet {
> ---
> -2.25.1
> -
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.7/defconfig.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.7/defconfig.patch
> deleted file mode 100644
> index 71b1b1ed..00000000
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.7/defconfig.patch
> +++ /dev/null
> @@ -1,112 +0,0 @@
> -Change USB_CONN_GPIO to 'y' by default and regenerate the defconfig via
> -`make savedefconfig`.
> -
> -Upstream-Status: Inappropriate [not needed in newer kernels]
> -Signed-off-by: Jon Mason <jon.mason@arm.com>
> -
> -diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> -index 03d0189f7d68..a4baafe01c34 100644
> ---- a/arch/arm64/configs/defconfig
> -+++ b/arch/arm64/configs/defconfig
> -@@ -165,9 +165,9 @@ CONFIG_QRTR_SMD=m
> - CONFIG_QRTR_TUN=m
> - CONFIG_BPF_JIT=y
> - CONFIG_CAN=m
> -+CONFIG_CAN_FLEXCAN=m
> - CONFIG_CAN_RCAR=m
> - CONFIG_CAN_RCAR_CANFD=m
> --CONFIG_CAN_FLEXCAN=m
> - CONFIG_BT=m
> - CONFIG_BT_HIDP=m
> - # CONFIG_BT_HS is not set
> -@@ -202,20 +202,19 @@ CONFIG_PCI_HOST_THUNDER_ECAM=y
> - CONFIG_PCIE_ROCKCHIP_HOST=m
> - CONFIG_PCIE_BRCMSTB=m
> - CONFIG_PCI_LAYERSCAPE=y
> --CONFIG_PCIE_LAYERSCAPE_GEN4=y
> - CONFIG_PCI_HISI=y
> - CONFIG_PCIE_QCOM=y
> - CONFIG_PCIE_ARMADA_8K=y
> - CONFIG_PCIE_KIRIN=y
> - CONFIG_PCIE_HISI_STB=y
> - CONFIG_PCIE_TEGRA194_HOST=m
> -+CONFIG_PCIE_LAYERSCAPE_GEN4=y
> - CONFIG_DEVTMPFS=y
> - CONFIG_DEVTMPFS_MOUNT=y
> - CONFIG_FW_LOADER_USER_HELPER=y
> - CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
> - CONFIG_HISILICON_LPC=y
> - CONFIG_SIMPLE_PM_BUS=y
> --CONFIG_FSL_MC_BUS=y
> - CONFIG_MTD=y
> - CONFIG_MTD_BLOCK=y
> - CONFIG_MTD_CFI=y
> -@@ -494,10 +493,10 @@ CONFIG_SENSORS_INA3221=m
> - CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
> - CONFIG_CPU_THERMAL=y
> - CONFIG_THERMAL_EMULATION=y
> --CONFIG_QORIQ_THERMAL=m
> --CONFIG_SUN8I_THERMAL=y
> - CONFIG_IMX_SC_THERMAL=m
> - CONFIG_IMX8MM_THERMAL=m
> -+CONFIG_QORIQ_THERMAL=m
> -+CONFIG_SUN8I_THERMAL=y
> - CONFIG_ROCKCHIP_THERMAL=m
> - CONFIG_RCAR_THERMAL=y
> - CONFIG_RCAR_GEN3_THERMAL=y
> -@@ -567,7 +566,6 @@ CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
> - CONFIG_MEDIA_SDR_SUPPORT=y
> - CONFIG_MEDIA_CONTROLLER=y
> - CONFIG_VIDEO_V4L2_SUBDEV_API=y
> --CONFIG_MEDIA_PLATFORM_SUPPORT=y
> - # CONFIG_DVB_NET is not set
> - CONFIG_MEDIA_USB_SUPPORT=y
> - CONFIG_USB_VIDEO_CLASS=m
> -@@ -611,10 +609,10 @@ CONFIG_DRM_MSM=m
> - CONFIG_DRM_TEGRA=m
> - CONFIG_DRM_PANEL_LVDS=m
> - CONFIG_DRM_PANEL_SIMPLE=m
> --CONFIG_DRM_SIMPLE_BRIDGE=m
> - CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
> - CONFIG_DRM_DISPLAY_CONNECTOR=m
> - CONFIG_DRM_SII902X=m
> -+CONFIG_DRM_SIMPLE_BRIDGE=m
> - CONFIG_DRM_THINE_THC63LVD1024=m
> - CONFIG_DRM_TI_SN65DSI86=m
> - CONFIG_DRM_I2C_ADV7511=m
> -@@ -662,7 +660,6 @@ CONFIG_SND_SOC_WSA881X=m
> - CONFIG_SND_SIMPLE_CARD=m
> - CONFIG_SND_AUDIO_GRAPH_CARD=m
> - CONFIG_I2C_HID=m
> --CONFIG_USB_CONN_GPIO=m
> - CONFIG_USB=y
> - CONFIG_USB_OTG=y
> - CONFIG_USB_XHCI_HCD=y
> -@@ -797,14 +794,13 @@ CONFIG_QCOM_A53PLL=y
> - CONFIG_QCOM_CLK_APCS_MSM8916=y
> - CONFIG_QCOM_CLK_SMD_RPM=y
> - CONFIG_QCOM_CLK_RPMH=y
> --CONFIG_IPQ_GCC_8074=y
> - CONFIG_IPQ_GCC_6018=y
> -+CONFIG_IPQ_GCC_8074=y
> - CONFIG_MSM_GCC_8916=y
> - CONFIG_MSM_GCC_8994=y
> - CONFIG_MSM_MMCC_8996=y
> - CONFIG_MSM_GCC_8998=y
> - CONFIG_QCS_GCC_404=y
> --CONFIG_SDM_GCC_845=y
> - CONFIG_SDM_GPUCC_845=y
> - CONFIG_SDM_DISPCC_845=y
> - CONFIG_SM_GCC_8150=y
> -@@ -933,10 +929,10 @@ CONFIG_FPGA_REGION=m
> - CONFIG_OF_FPGA_REGION=m
> - CONFIG_TEE=y
> - CONFIG_OPTEE=y
> -+CONFIG_MUX_MMIO=y
> - CONFIG_SLIMBUS=m
> - CONFIG_SLIM_QCOM_CTRL=m
> - CONFIG_SLIM_QCOM_NGD_CTRL=m
> --CONFIG_MUX_MMIO=y
> - CONFIG_EXT2_FS=y
> - CONFIG_EXT3_FS=y
> - CONFIG_EXT4_FS_POSIX_ACL=y
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bb b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bb
> deleted file mode 100644
> index 0a67f878..00000000
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bb
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -KBRANCH ?= "v5.4/standard/base"
> -
> -require recipes-kernel/linux/linux-yocto.inc
> -
> -SRCREV_machine ?= "807b4668ff7fe3be031ace442a84d70821ef9571"
> -SRCREV_meta ?= "98ba88191b7c489bc0d83b6c87a31b2330fcd886"
> -
> -SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
> -           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> -LINUX_VERSION ?= "5.4.139"
> -
> -DEPENDS += "openssl-native util-linux-native"
> -
> -PV = "${LINUX_VERSION}+git${SRCPV}"
> -
> -KMETA = "kernel-meta"
> -KCONF_BSP_AUDIT_LEVEL = "1"
> -
> -# Functionality flags
> -KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend
> deleted file mode 100644
> index 03ce8e96..00000000
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -FILESEXTRAPATHS:prepend := "${THISDIR}/linux-yocto-5.7:"
> -
> -SRC_URI:append = " file://coresight-traceid.patch \
> -                   file://defconfig.patch \
> -                 "
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7.bb b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7.bb
> deleted file mode 100644
> index 81b602d6..00000000
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7.bb
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -KBRANCH ?= "v5.7/standard/base"
> -
> -require recipes-kernel/linux/linux-yocto.inc
> -
> -SRCREV_machine = "6b9830fecd4a87d7ebb4d93484fef00f46d0fa0f"
> -SRCREV_meta = "b9e6fd082dc5bfb51699809d7119d4b20d280c0b"
> -
> -SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
> -           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.7;destsuffix=${KMETA}"
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> -LINUX_VERSION = "5.7.19"
> -
> -DEPENDS += "openssl-native util-linux-native"
> -
> -PV = "${LINUX_VERSION}+git${SRCPV}"
> -
> -KMETA = "kernel-meta"
> -KCONF_BSP_AUDIT_LEVEL = "1"
> -
> -# Functionality flags
> -KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2973): https://lists.yoctoproject.org/g/meta-arm/message/2973
> Mute This Topic: https://lists.yoctoproject.org/mt/89027170/1676615
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

