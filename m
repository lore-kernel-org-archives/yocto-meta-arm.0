Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 220AEC433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 13:59:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12452.1638971961947980297
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 05:59:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A816D6E;
	Wed,  8 Dec 2021 05:59:21 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.6.202])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF2D03F73B;
	Wed,  8 Dec 2021 05:59:19 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 7/8] arm-bsp/secure-partitions: Implement mhu driver
Date: Wed,  8 Dec 2021 13:58:59 +0000
Message-Id: <20211208135900.683-8-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211208135900.683-1-abdellatif.elkhlifi@arm.com>
References: <20211208135900.683-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Dec 2021 13:59:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2568

From: Vishnu Banavath <vishnu.banavath@arm.com>

This commit adds mhu driver (v2.1 and v2) to the secure
partition se_proxy and a conversion layer to communicate with
the secure enclave using OpenAmp.

Change-Id: I3d7893f2f52fdcfe6aae4c471c261b6ffd76b274
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 ...iver-and-the-OpenAmp-conversion-laye.patch | 1083 +++++++++++++++++
 .../trusted-services/ts-corstone1000.inc      |    5 +-
 2 files changed, 1085 insertions(+), 3 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/0008-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.pat=
ch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0008-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch b/me=
ta-arm-bsp/recipes-security/trusted-services/secure-partitions/0008-Imple=
ment-mhu-driver-and-the-OpenAmp-conversion-laye.patch
new file mode 100644
index 0000000..7d8bf49
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/00=
08-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch
@@ -0,0 +1,1083 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From 4243448e35da5c500f6e0ea6d68ab2ac23ada986 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Fri, 3 Dec 2021 18:00:46 +0000
+Subject: [PATCH] Implement mhu driver and the OpenAmp conversion layer.
+
+This commit adds an mhu driver (v2.1 and v2) to the secure
+partition se_proxy and a conversion layer to communicate with
+the secure enclave using OpenAmp.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+diff --git a/deployments/se-proxy/opteesp/default_se-proxy.dts.in b/depl=
oyments/se-proxy/opteesp/default_se-proxy.dts.in
+index 9f5cf71..f351a59 100644
+--- a/deployments/se-proxy/opteesp/default_se-proxy.dts.in
++++ b/deployments/se-proxy/opteesp/default_se-proxy.dts.in
+@@ -17,5 +17,21 @@
+ 		execution-state =3D <0>; /* AArch64 */
+ 		xlat-granule =3D <0>; /* 4KiB */
+ 		messaging-method =3D <0>; /* Direct messaging only */
++
++		device-regions {
++			compatible =3D "arm,ffa-manifest-device-regions";
++			mhu-sender {
++				/* Armv8 A Foundation Platform values */
++				base-address =3D <0x00000000 0x1b820000>;
++				pages-count =3D <16>;
++				attributes =3D <0x3>; /* read-write */
++			};
++			mhu-receiver {
++				/* Armv8 A Foundation Platform values */
++				base-address =3D <0x00000000 0x1b830000>;
++				pages-count =3D <16>;
++				attributes =3D <0x3>; /* read-write */
++			};
++		};
+ 	};
+ };
+diff --git a/platform/drivers/arm/mhu_driver/component.cmake b/platform/=
drivers/arm/mhu_driver/component.cmake
+new file mode 100644
+index 0000000..77a5a50
+--- /dev/null
++++ b/platform/drivers/arm/mhu_driver/component.cmake
+@@ -0,0 +1,12 @@
++#----------------------------------------------------------------------=
---------
++# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved=
.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#----------------------------------------------------------------------=
---------
++
++# Add source files for using mhu driver
++target_sources(${TGT}
++	PRIVATE
++	"${CMAKE_CURRENT_LIST_DIR}/mhu_v2_x.c"
++)
+diff --git a/platform/drivers/arm/mhu_driver/mhu_v2.h b/platform/drivers=
/arm/mhu_driver/mhu_v2.h
+new file mode 100644
+index 0000000..2e4ba80
+--- /dev/null
++++ b/platform/drivers/arm/mhu_driver/mhu_v2.h
+@@ -0,0 +1,391 @@
++/*
++ * Copyright (c) 2021 Arm Limited
++ *
++ * Licensed under the Apache License, Version 2.0 (the "License");
++ * you may not use this file except in compliance with the License.
++ * You may obtain a copy of the License at
++ *
++ *     http://www.apache.org/licenses/LICENSE-2.0
++ *
++ * Unless required by applicable law or agreed to in writing, software
++ * distributed under the License is distributed on an "AS IS" BASIS,
++ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or impl=
ied.
++ * See the License for the specific language governing permissions and
++ * limitations under the License.
++ */
++
++/**
++ * \file mhu_v2_x.h
++ * \brief Driver for Arm MHU v2.0 and v2.1
++ */
++
++#ifndef __MHU_V2_X_H__
++#define __MHU_V2_X_H__
++
++#include <stdint.h>
++#include <stdbool.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++#define MHU_2_X_INTR_NR2R_OFF             (0x0u)
++#define MHU_2_X_INTR_R2NR_OFF             (0x1u)
++#define MHU_2_1_INTR_CHCOMB_OFF           (0x2u)
++
++#define MHU_2_X_INTR_NR2R_MASK            (0x1u << MHU_2_X_INTR_NR2R_OF=
F)
++#define MHU_2_X_INTR_R2NR_MASK            (0x1u << MHU_2_X_INTR_R2NR_OF=
F)
++#define MHU_2_1_INTR_CHCOMB_MASK          (0x1u << MHU_2_1_INTR_CHCOMB_=
OFF)
++
++enum mhu_v2_x_frame_t {
++    MHU_V2_X_SENDER_FRAME   =3D 0x0u,
++    MHU_V2_X_RECEIVER_FRAME =3D 0x1u,
++};
++
++enum mhu_v2_x_supported_revisions {
++     MHU_REV_READ_FROM_HW =3D 0,
++     MHU_REV_2_0,
++     MHU_REV_2_1,
++};
++
++struct mhu_v2_x_dev_t {
++    uint32_t base;
++    enum mhu_v2_x_frame_t frame;
++    uint32_t subversion;    /*!< Hardware subversion: v2.X */
++    bool is_initialized;    /*!< Indicates if the MHU driver
++                             *   is initialized and enabled
++                             */
++};
++
++/**
++ * \brief MHU v2 error enumeration types.
++ */
++enum mhu_v2_x_error_t {
++    MHU_V_2_X_ERR_NONE                =3D  0,
++    MHU_V_2_X_ERR_NOT_INIT            =3D -1,
++    MHU_V_2_X_ERR_ALREADY_INIT        =3D -2,
++    MHU_V_2_X_ERR_UNSUPPORTED_VERSION =3D -3,
++    MHU_V_2_X_ERR_INVALID_ARG         =3D -4,
++    MHU_V_2_X_ERR_GENERAL             =3D -5
++};
++
++/**
++ * \brief Initializes the driver
++ *
++ * \param[in] dev   MHU device struct \ref mhu_v2_x_dev_t
++ * \param[in] rev   MHU revision (if can't be identified from HW)
++ *
++ * Reads the MHU hardware version
++ *
++ * \return Returns mhu_v2_x_error_t error code
++ *
++ * \note MHU revision only has to be specified when versions can't be r=
ead
++ *       from HW (ARCH_MAJOR_REV reg reads as 0x0).
++ *
++ * \note This function doesn't check if dev is NULL.
++ */
++enum mhu_v2_x_error_t mhu_v2_x_driver_init(struct mhu_v2_x_dev_t *dev,
++     enum mhu_v2_x_supported_revisions rev);
++
++/**
++ * \brief Returns the number of channels implemented.
++ *
++ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
++ *
++ * Returns the number of channels implemented.
++ *
++ * \return Returns the number of channels implemented.
++ *
++ * \note This function doesn't check if dev is NULL.
++ */
++uint32_t mhu_v2_x_get_num_channel_implemented(
++         const struct mhu_v2_x_dev_t *dev);
++
++/**
++ * \brief Sends the value over a channel.
++ *
++ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
++ * \param[in] channel     Channel to send the value over.
++ * \param[in] val         Value to send.
++ *
++ * Sends the value over a channel.
++ *
++ * \return Returns mhu_v2_x_error_t error code
++ *
++ * \note This function doesn't check if dev is NULL.
++ * \note This function doesn't check if channel is implemented.
++ */
++enum mhu_v2_x_error_t mhu_v2_x_channel_send(const struct mhu_v2_x_dev_t=
 *dev,
++     uint32_t channel, uint32_t val);
++
++/**
++ * \brief Clears the channel after the value is send over it.
++ *
++ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
++ * \param[in] channel     Channel to clear.
++ *
++ * Clears the channel after the value is send over it.
++ *
++ * \return Returns mhu_v2_x_error_t error code
++ *
++ * \note This function doesn't check if dev is NULL.
++ * \note This function doesn't check if channel is implemented.
++ */
++enum mhu_v2_x_error_t mhu_v2_x_channel_clear(const struct mhu_v2_x_dev_=
t *dev,
++     uint32_t channel);
++
++/**
++ * \brief Receives the value over a channel.
++ *
++ * \param[in]  dev         MHU device struct \ref mhu_v2_x_dev_t
++ * \param[in]  channel     Channel to receive the value from.
++ * \param[out] value       Pointer to variable that will store the valu=
e.
++ *
++ * Receives the value over a channel.
++ *
++ * \return Returns mhu_v2_x_error_t error code
++ *
++ * \note This function doesn't check if dev is NULL.
++ * \note This function doesn't check if channel is implemented.
++ */
++enum mhu_v2_x_error_t mhu_v2_x_channel_receive(
++     const struct mhu_v2_x_dev_t *dev, uint32_t channel, uint32_t *valu=
e);
++
++/**
++ * \brief Sets bits in the Channel Mask.
++ *
++ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
++ * \param[in] channel     Which channel's mask to set.
++ * \param[in] mask        Mask to be set over a receiver frame.
++ *
++ * Sets bits in the Channel Mask.
++ *
++ * \return Returns mhu_v2_x_error_t error code
++ *
++ * \note This function doesn't check if dev is NULL.
++ * \note This function doesn't check if channel is implemented.
++ */
++enum mhu_v2_x_error_t mhu_v2_x_channel_mask_set(
++     const struct mhu_v2_x_dev_t *dev, uint32_t channel, uint32_t mask)=
;
++
++/**
++ * \brief Clears bits in the Channel Mask.
++ *
++ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
++ * \param[in] channel     Which channel's mask to clear.
++ * \param[in] mask        Mask to be clear over a receiver frame.
++ *
++ * Clears bits in the Channel Mask.
++ *
++ * \return Returns mhu_v2_x_error_t error code
++ *
++ * \note This function doesn't check if dev is NULL.
++ * \note This function doesn't check if channel is implemented.
++ */
++enum mhu_v2_x_error_t mhu_v2_x_channel_mask_clear(
++     const struct mhu_v2_x_dev_t *dev, uint32_t channel, uint32_t mask)=
;
++
++/**
++ * \brief Enables the Channel interrupt.
++ *
++ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
++ * \param[in] channel     Which channel's interrupt to enable.
++ *
++ * Enables the Channel clear interrupt.
++ *
++ * \return Returns mhu_v2_x_error_t error code
++ *
++ * \note This function doesn't check if dev is NULL.
++ * \note This function doesn't check if channel is implemented.
++ */
++enum mhu_v2_x_error_t mhu_v2_x_channel_interrupt_enable(
++     const struct mhu_v2_x_dev_t *dev, uint32_t channel);
++
++/**
++ * \brief Disables the Channel interrupt.
++ *
++ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
++ * \param[in] channel     Which channel's interrupt to disable.
++ *
++ * Disables the Channel interrupt.
++ *
++ * \return Returns mhu_v2_x_error_t error code
++ *
++ * \note This function doesn't check if dev is NULL.
++ * \note This function doesn't check if channel is implemented.
++ */
++enum mhu_v2_x_error_t mhu_v2_x_channel_interrupt_disable(
++     const struct mhu_v2_x_dev_t *dev, uint32_t channel);
++
++/**
++ * \brief Cleares the Channel interrupt.
++ *
++ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
++ * \param[in] channel     Which channel's interrupt to clear.
++ *
++ * Cleares the Channel interrupt.
++ *
++ * \return Returns mhu_v2_x_error_t error code
++ *
++ * \note This function doesn't check if dev is NULL.
++ * \note This function doesn't check if channel is implemented.
++ */
++enum mhu_v2_x_error_t mhu_v2_x_channel_interrupt_clear(
++     const struct mhu_v2_x_dev_t *dev, uint32_t channel);
++
++/**
++ * \brief Initiates a MHU transfer with the handshake signals.
++ *
++ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
++ *
++ * Initiates a MHU transfer with the handshake signals in a blocking mo=
de.
++ *
++ * \return Returns mhu_v2_x_error_t error code
++ *
++ * \note This function doesn't check if dev is NULL.
++ */
++enum mhu_v2_x_error_t mhu_v2_x_initiate_transfer(
++     const struct mhu_v2_x_dev_t *dev);
++
++/**
++ * \brief Closes a MHU transfer with the handshake signals.
++ *
++ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
++ *
++ * Closes a MHU transfer with the handshake signals in a blocking mode.
++ *
++ * \return Returns mhu_v2_x_error_t error code
++ *
++ * \note This function doesn't check if dev is NULL.
++ */
++enum mhu_v2_x_error_t mhu_v2_x_close_transfer(
++     const struct mhu_v2_x_dev_t *dev);
++
++/**
++ * \brief Returns the value of access request signal.
++ *
++ * \param[in]  dev         MHU device struct \ref mhu_v2_x_dev_t
++ * \param[out] val         Pointer to variable that will store the valu=
e.
++ *
++ * For more information please read the MHU v2 user guide
++ *
++ * \return Returns mhu_v2_x_error_t error code
++ *
++ * \note This function doesn't check if dev is NULL.
++ */
++enum mhu_v2_x_error_t mhu_v2_x_get_access_request(
++     const struct mhu_v2_x_dev_t *dev, uint32_t *val);
++
++/**
++ * \brief Sets the value of access request signal to high.
++ *
++ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
++ *
++ * For more information please read the MHU v2 user guide
++ *
++ * \return Returns mhu_v2_x_error_t error code
++ *
++ * \note This function doesn't check if dev is NULL.
++ */
++enum mhu_v2_x_error_t mhu_v2_x_set_access_request(
++     const struct mhu_v2_x_dev_t *dev);
++
++/**
++ * \brief Sets the value of access request signal to low.
++ *
++ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
++ *
++ * For more information please read the MHU v2 user guide
++ *
++ * \return Returns mhu_v2_x_error_t error code
++ *
++ * \note This function doesn't check if dev is NULL.
++ */
++enum mhu_v2_x_error_t mhu_v2_x_reset_access_request(
++     const struct mhu_v2_x_dev_t *dev);
++
++/**
++ * \brief Returns the value of access ready signal.
++ *
++ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
++ * \param[out] val        Pointer to variable that will store the value=
.
++ *
++ * For more information please read the MHU v2 user guide
++ *
++ * \return Returns mhu_v2_x_error_t error code
++ *
++ * \note This function doesn't check if dev is NULL.
++ */
++enum mhu_v2_x_error_t mhu_v2_x_get_access_ready(
++     const struct mhu_v2_x_dev_t *dev, uint32_t *val);
++
++/**
++ * \brief Returns the MHU interrupt status.
++ *
++ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
++ *
++ * \return Interrupt status register value. Masking is needed for indiv=
idual
++ *         interrupts.
++ *
++ * \note This function doesn't check if dev is NULL.
++ */
++uint32_t mhu_v2_x_get_interrupt_status(const struct mhu_v2_x_dev_t *dev=
);
++
++/**
++ * \brief Enables MHU interrupts.
++ *
++ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
++ * \param[in] mask        Bit mask for enabling/disabling interrupts
++ *
++ * \return Returns mhu_v2_x_error_t error code
++ *
++ * \note This function doesn't check if dev is NULL.
++ */
++enum mhu_v2_x_error_t mhu_v2_x_interrupt_enable(
++     const struct mhu_v2_x_dev_t *dev, uint32_t mask);
++
++/**
++ * \brief Disables MHU interrupts.
++ *
++ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
++ * \param[in] mask        Bit mask for enabling/disabling interrupts
++ *
++ * \return Returns mhu_v2_x_error_t error code
++ *
++ * \note This function doesn't check if dev is NULL.
++ */
++enum mhu_v2_x_error_t mhu_v2_x_interrupt_disable(
++     const struct mhu_v2_x_dev_t *dev, uint32_t mask);
++
++/**
++ * \brief Clears MHU interrupts.
++ *
++ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
++ * \param[in] mask        Bit mask for clearing interrupts
++ *
++ * \return Returns mhu_v2_x_error_t error code
++ *
++ * \note This function doesn't check if dev is NULL.
++ */
++enum mhu_v2_x_error_t mhu_v2_x_interrupt_clear(
++     const struct mhu_v2_x_dev_t *dev, uint32_t mask);
++
++/**
++ * \brief Returns the first channel number whose interrupt bit is high.
++ *
++ * \param[in]  dev         MHU device struct \ref mhu_v2_x_dev_t
++ * \param[out] channel     Pointer to variable that will have the chann=
el value.
++ *
++ * \return Returns the first channel number whose interrupt bit is high=
.
++ * \return Returns mhu_v2_x_error_t error code.
++ *
++ * \note This function doesn't check if dev is NULL.
++ */
++enum mhu_v2_x_error_t mhu_v2_1_get_ch_interrupt_num(
++     const struct mhu_v2_x_dev_t *dev, uint32_t *channel);
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* __MHU_V2_X_H__ */
+diff --git a/platform/drivers/arm/mhu_driver/mhu_v2_x.c b/platform/drive=
rs/arm/mhu_driver/mhu_v2_x.c
+new file mode 100644
+index 0000000..01d8f65
+--- /dev/null
++++ b/platform/drivers/arm/mhu_driver/mhu_v2_x.c
+@@ -0,0 +1,602 @@
++/*
++ * Copyright (c) 2021 Arm Limited
++ *
++ * Licensed under the Apache License, Version 2.0 (the "License");
++ * you may not use this file except in compliance with the License.
++ * You may obtain a copy of the License at
++ *
++ *     http://www.apache.org/licenses/LICENSE-2.0
++ *
++ * Unless required by applicable law or agreed to in writing, software
++ * distributed under the License is distributed on an "AS IS" BASIS,
++ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or impl=
ied.
++ * See the License for the specific language governing permissions and
++ * limitations under the License.
++ */
++#include <stdint.h>
++#include <stdbool.h>
++#include "mhu_v2.h"
++
++#define _MHU_V2_X_MAX_CHANNELS    124
++#define _MHU_V2_1_MAX_CHCOMB_INT  4
++#define ENABLE                    0x1
++#define DISABLE                   0x0
++#define CLEAR_INTR                0x1
++#define CH_PER_CH_COMB            0x20
++#define SEND_FRAME(p_mhu)       ((struct _mhu_v2_x_send_frame_t *)p_mhu=
)
++#define RECV_FRAME(p_mhu)       ((struct _mhu_v2_x_recv_frame_t *)p_mhu=
)
++
++#define MHU_MAJOR_REV_V2      0x1u
++#define MHU_MINOR_REV_2_0     0x0u
++#define MHU_MINOR_REV_2_1     0x1u
++
++struct _mhu_v2_x_send_ch_window_t {
++    /* Offset: 0x00 (R/ ) Channel Status */
++    volatile uint32_t ch_st;
++    /* Offset: 0x04 (R/ ) Reserved */
++    volatile uint32_t reserved_0;
++    /* Offset: 0x08 (R/ ) Reserved */
++    volatile uint32_t reserved_1;
++    /* Offset: 0x0C ( /W) Channel Set */
++    volatile uint32_t ch_set;
++    /* Offset: 0x10 (R/ ) Channel Interrupt Status (Reserved in 2.0) */
++    volatile uint32_t ch_int_st;
++    /* Offset: 0x14 ( /W) Channel Interrupt Clear  (Reserved in 2.0) */
++    volatile uint32_t ch_int_clr;
++    /* Offset: 0x18 (R/W) Channel Interrupt Enable (Reserved in 2.0) */
++    volatile uint32_t ch_int_en;
++    /* Offset: 0x1C (R/ ) Reserved */
++    volatile uint32_t reserved_2;
++};
++
++struct _mhu_v2_x_send_frame_t {
++    /* Offset: 0x000 ( / ) Sender Channel Window 0 -123 */
++    struct _mhu_v2_x_send_ch_window_t send_ch_window[_MHU_V2_X_MAX_CHAN=
NELS];
++    /* Offset: 0xF80 (R/ ) Message Handling Unit Configuration */
++    volatile uint32_t mhu_cfg;
++    /* Offset: 0xF84 (R/W) Response Configuration */
++    volatile uint32_t resp_cfg;
++    /* Offset: 0xF88 (R/W) Access Request */
++    volatile uint32_t access_request;
++    /* Offset: 0xF8C (R/ ) Access Ready */
++    volatile uint32_t access_ready;
++    /* Offset: 0xF90 (R/ ) Interrupt Status */
++    volatile uint32_t int_st;
++    /* Offset: 0xF94 ( /W) Interrupt Clear */
++    volatile uint32_t int_clr;
++    /* Offset: 0xF98 (R/W) Interrupt Enable */
++    volatile uint32_t int_en;
++    /* Offset: 0xF9C (R/ ) Reserved */
++    volatile uint32_t reserved_0;
++    /* Offset: 0xFA0 (R/W) Channel Combined Interrupt Stat (Reserved in=
 2.0) */
++    volatile uint32_t ch_comb_int_st[_MHU_V2_1_MAX_CHCOMB_INT];
++    /* Offset: =E2=80=AD0xFC4=E2=80=AC (R/ ) Reserved */
++    volatile uint32_t reserved_1[6];
++    /* Offset: 0xFC8 (R/ ) Implementer Identification Register */
++    volatile uint32_t iidr;
++    /* Offset: 0xFCC (R/ ) Architecture Identification Register */
++    volatile uint32_t aidr;
++    /* Offset: 0xFD0 (R/ )  */
++    volatile uint32_t pid_1[4];
++    /* Offset: 0xFE0 (R/ )  */
++    volatile uint32_t pid_0[4];
++    /* Offset: 0xFF0 (R/ )  */
++    volatile uint32_t cid[4];
++};
++
++struct _mhu_v2_x_rec_ch_window_t {
++    /* Offset: 0x00 (R/ ) Channel Status */
++    volatile uint32_t ch_st;
++    /* Offset: 0x04 (R/ ) Channel Status Masked */
++    volatile uint32_t ch_st_msk;
++    /* Offset: 0x08 ( /W) Channel Clear */
++    volatile uint32_t ch_clr;
++    /* Offset: 0x0C (R/ ) Reserved */
++    volatile uint32_t reserved_0;
++    /* Offset: 0x10 (R/ ) Channel Mask Status */
++    volatile uint32_t ch_msk_st;
++    /* Offset: 0x14 ( /W) Channel Mask Set */
++    volatile uint32_t ch_msk_set;
++    /* Offset: 0x18 ( /W) Channel Mask Clear */
++    volatile uint32_t ch_msk_clr;
++    /* Offset: 0x1C (R/ ) Reserved */
++    volatile uint32_t reserved_1;
++};
++
++struct _mhu_v2_x_recv_frame_t {
++    /* Offset: 0x000 ( / ) Receiver Channel Window 0 -123 */
++    struct _mhu_v2_x_rec_ch_window_t rec_ch_window[_MHU_V2_X_MAX_CHANNE=
LS];
++    /* Offset: 0xF80 (R/ ) Message Handling Unit Configuration */
++    volatile uint32_t mhu_cfg;
++    /* Offset: 0xF84 (R/ ) Reserved */
++    volatile uint32_t reserved_0[3];
++    /* Offset: 0xF90 (R/ ) Interrupt Status (Reserved in 2.0) */
++    volatile uint32_t int_st;
++    /* Offset: 0xF94 (R/ ) Interrupt Clear  (Reserved in 2.0) */
++    volatile uint32_t int_clr;
++    /* Offset: 0xF98 (R/W) Interrupt Enable (Reserved in 2.0) */
++    volatile uint32_t int_en;
++    /* Offset: 0xF9C (R/ ) Reserved  */
++    volatile uint32_t reserved_1;
++    /* Offset: 0xFA0 (R/ ) Channel Combined Interrupt Stat (Reserved in=
 2.0) */
++    volatile uint32_t ch_comb_int_st[_MHU_V2_1_MAX_CHCOMB_INT];
++    /* Offset: 0xFB0 (R/ ) Reserved */
++    volatile uint32_t reserved_2[6];
++    /* Offset: 0xFC8 (R/ ) Implementer Identification Register */
++    volatile uint32_t iidr;
++    /* Offset: 0xFCC (R/ ) Architecture Identification Register */
++    volatile uint32_t aidr;
++    /* Offset: 0xFD0 (R/ )  */
++    volatile uint32_t pid_1[4];
++    /* Offset: 0xFE0 (R/ )  */
++    volatile uint32_t pid_0[4];
++    /* Offset: 0xFF0 (R/ )  */
++    volatile uint32_t cid[4];
++};
++
++union _mhu_v2_x_frame_t {
++    struct _mhu_v2_x_send_frame_t send_frame;
++    struct _mhu_v2_x_recv_frame_t recv_frame;
++};
++
++enum mhu_v2_x_error_t mhu_v2_x_driver_init(struct mhu_v2_x_dev_t *dev,
++     enum mhu_v2_x_supported_revisions rev)
++{
++    uint32_t AIDR =3D 0;
++    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
++
++    if (dev->is_initialized) {
++        return MHU_V_2_X_ERR_ALREADY_INIT;
++    }
++
++    if (rev =3D=3D MHU_REV_READ_FROM_HW) {
++        /* Read revision from HW */
++        if (dev->frame =3D=3D MHU_V2_X_RECEIVER_FRAME) {
++            AIDR =3D p_mhu->recv_frame.aidr;
++        } else {
++            AIDR =3D p_mhu->send_frame.aidr;
++        }
++
++        /* Get bits 7:4 to read major revision */
++        if ( ((AIDR >> 4) & 0b1111) !=3D MHU_MAJOR_REV_V2) {
++            /* Unsupported MHU version */
++            return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
++        } /* No need to save major version, driver only supports MHUv2 =
*/
++
++        /* Get bits 3:0 to read minor revision */
++        dev->subversion =3D AIDR & 0b1111;
++
++        if (dev->subversion !=3D MHU_MINOR_REV_2_0 &&
++            dev->subversion !=3D MHU_MINOR_REV_2_1) {
++            /* Unsupported subversion */
++            return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
++        }
++    } else {
++        /* Revisions were provided by caller */
++        if (rev =3D=3D MHU_REV_2_0) {
++            dev->subversion =3D MHU_MINOR_REV_2_0;
++        } else if (rev =3D=3D MHU_REV_2_1) {
++            dev->subversion =3D MHU_MINOR_REV_2_1;
++        } else {
++            /* Unsupported subversion */
++            return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
++        }/* No need to save major version, driver only supports MHUv2 *=
/
++    }
++
++    dev->is_initialized =3D true;
++
++    return MHU_V_2_X_ERR_NONE;
++}
++
++uint32_t mhu_v2_x_get_num_channel_implemented(const struct mhu_v2_x_dev=
_t *dev)
++{
++    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
++
++    if ( !(dev->is_initialized) ) {
++        return MHU_V_2_X_ERR_NOT_INIT;
++    }
++
++    if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
++        return (SEND_FRAME(p_mhu))->mhu_cfg;
++    } else {
++        return (RECV_FRAME(p_mhu))->mhu_cfg;
++    }
++}
++
++enum mhu_v2_x_error_t mhu_v2_x_channel_send(const struct mhu_v2_x_dev_t=
 *dev,
++     uint32_t channel, uint32_t val)
++{
++    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
++
++    if ( !(dev->is_initialized) ) {
++        return MHU_V_2_X_ERR_NOT_INIT;
++    }
++
++    if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
++        (SEND_FRAME(p_mhu))->send_ch_window[channel].ch_set =3D val;
++        return MHU_V_2_X_ERR_NONE;
++    } else {
++        return MHU_V_2_X_ERR_INVALID_ARG;
++    }
++}
++
++enum mhu_v2_x_error_t mhu_v2_x_channel_clear(const struct mhu_v2_x_dev_=
t *dev,
++     uint32_t channel)
++{
++    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
++
++    if ( !(dev->is_initialized) ) {
++        return MHU_V_2_X_ERR_NOT_INIT;
++    }
++
++    if(dev->frame =3D=3D MHU_V2_X_RECEIVER_FRAME) {
++        (RECV_FRAME(p_mhu))->rec_ch_window[channel].ch_clr =3D UINT32_M=
AX;
++        return MHU_V_2_X_ERR_NONE;
++    } else {
++        return MHU_V_2_X_ERR_INVALID_ARG;
++    }
++}
++
++enum mhu_v2_x_error_t mhu_v2_x_channel_receive(
++     const struct mhu_v2_x_dev_t *dev, uint32_t channel, uint32_t *valu=
e)
++{
++    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
++
++    if ( !(dev->is_initialized) ) {
++        return MHU_V_2_X_ERR_NOT_INIT;
++    }
++
++    if(dev->frame =3D=3D MHU_V2_X_RECEIVER_FRAME) {
++        *value =3D (RECV_FRAME(p_mhu))->rec_ch_window[channel].ch_st;
++        return MHU_V_2_X_ERR_NONE;
++    } else {
++        return MHU_V_2_X_ERR_INVALID_ARG;
++    }
++}
++
++enum mhu_v2_x_error_t mhu_v2_x_channel_mask_set(
++     const struct mhu_v2_x_dev_t *dev, uint32_t channel, uint32_t mask)
++{
++    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
++
++    if ( !(dev->is_initialized) ) {
++        return MHU_V_2_X_ERR_NOT_INIT;
++    }
++
++    if(dev->frame =3D=3D MHU_V2_X_RECEIVER_FRAME) {
++        (RECV_FRAME(p_mhu))->rec_ch_window[channel].ch_msk_set =3D mask=
;
++        return MHU_V_2_X_ERR_NONE;
++    } else {
++        return MHU_V_2_X_ERR_INVALID_ARG;
++    }
++}
++
++enum mhu_v2_x_error_t mhu_v2_x_channel_mask_clear(
++     const struct mhu_v2_x_dev_t *dev, uint32_t channel, uint32_t mask)
++{
++    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
++
++    if ( !(dev->is_initialized) ) {
++        return MHU_V_2_X_ERR_NOT_INIT;
++    }
++
++    if(dev->frame =3D=3D MHU_V2_X_RECEIVER_FRAME) {
++        (RECV_FRAME(p_mhu))->rec_ch_window[channel].ch_msk_clr =3D mask=
;
++        return MHU_V_2_X_ERR_NONE;
++    } else {
++        return MHU_V_2_X_ERR_INVALID_ARG;
++    }
++}
++
++enum mhu_v2_x_error_t mhu_v2_x_channel_interrupt_enable(
++     const struct mhu_v2_x_dev_t *dev, uint32_t channel)
++{
++    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
++
++    if ( !(dev->is_initialized) ) {
++        return MHU_V_2_X_ERR_NOT_INIT;
++    }
++
++    if (dev->subversion =3D=3D MHU_MINOR_REV_2_1) {
++        return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
++    }
++
++    if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
++        (SEND_FRAME(p_mhu))->send_ch_window[channel].ch_int_en =3D ENAB=
LE;
++        return MHU_V_2_X_ERR_NONE;
++    } else {
++        return MHU_V_2_X_ERR_INVALID_ARG;
++    }
++}
++
++enum mhu_v2_x_error_t mhu_v2_x_channel_interrupt_disable(
++     const struct mhu_v2_x_dev_t *dev, uint32_t channel)
++{
++    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
++
++    if ( !(dev->is_initialized) ) {
++        return MHU_V_2_X_ERR_NOT_INIT;
++    }
++
++    if (dev->subversion =3D=3D MHU_MINOR_REV_2_1) {
++        return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
++    }
++
++    if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
++        (SEND_FRAME(p_mhu))->send_ch_window[channel].ch_int_en =3D DISA=
BLE;
++        return MHU_V_2_X_ERR_NONE;
++    } else {
++        return MHU_V_2_X_ERR_INVALID_ARG;
++    }
++}
++
++enum mhu_v2_x_error_t mhu_v2_x_channel_interrupt_clear(
++     const struct mhu_v2_x_dev_t *dev, uint32_t channel)
++{
++    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
++
++    if ( !(dev->is_initialized) ) {
++        return MHU_V_2_X_ERR_NOT_INIT;
++    }
++
++    if (dev->subversion =3D=3D MHU_MINOR_REV_2_1) {
++        return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
++    }
++
++    if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
++        (SEND_FRAME(p_mhu))->send_ch_window[channel].ch_int_clr =3D CLE=
AR_INTR;
++        return MHU_V_2_X_ERR_NONE;
++    } else {
++        return MHU_V_2_X_ERR_INVALID_ARG;
++    }
++}
++
++enum mhu_v2_x_error_t mhu_v2_x_initiate_transfer(
++     const struct mhu_v2_x_dev_t *dev)
++{
++    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
++
++    if ( !(dev->is_initialized) ) {
++        return MHU_V_2_X_ERR_NOT_INIT;
++    }
++
++    if(dev->frame !=3D MHU_V2_X_SENDER_FRAME) {
++        return MHU_V_2_X_ERR_INVALID_ARG;
++    }
++
++    (SEND_FRAME(p_mhu))->access_request =3D ENABLE;
++
++    while ( !((SEND_FRAME(p_mhu))->access_ready) ) {
++        /* Wait in a loop for access ready signal to be high */
++        ;
++    }
++
++    return MHU_V_2_X_ERR_NONE;
++}
++
++enum mhu_v2_x_error_t mhu_v2_x_close_transfer(const struct mhu_v2_x_dev=
_t *dev)
++{
++    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
++
++    if ( !(dev->is_initialized) ) {
++        return MHU_V_2_X_ERR_NOT_INIT;
++    }
++
++    if(dev->frame !=3D MHU_V2_X_SENDER_FRAME) {
++        return MHU_V_2_X_ERR_INVALID_ARG;
++    }
++
++    (SEND_FRAME(p_mhu))->access_request =3D DISABLE;
++
++    return MHU_V_2_X_ERR_NONE;
++}
++
++enum mhu_v2_x_error_t mhu_v2_x_get_access_request(
++     const struct mhu_v2_x_dev_t *dev, uint32_t *val)
++{
++    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
++
++    if ( !(dev->is_initialized) ) {
++        return MHU_V_2_X_ERR_NOT_INIT;
++    }
++
++    if(dev->frame !=3D MHU_V2_X_SENDER_FRAME) {
++        return MHU_V_2_X_ERR_INVALID_ARG;
++    }
++
++    *val =3D (SEND_FRAME(p_mhu))->access_request;
++
++    return MHU_V_2_X_ERR_NONE;
++}
++
++enum mhu_v2_x_error_t mhu_v2_x_set_access_request(
++     const struct mhu_v2_x_dev_t *dev)
++{
++    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
++
++    if ( !(dev->is_initialized) ) {
++        return MHU_V_2_X_ERR_NOT_INIT;
++    }
++
++    if(dev->frame !=3D MHU_V2_X_SENDER_FRAME) {
++        return MHU_V_2_X_ERR_INVALID_ARG;
++    }
++
++    (SEND_FRAME(p_mhu))->access_request =3D ENABLE;
++
++    return MHU_V_2_X_ERR_NONE;
++}
++
++enum mhu_v2_x_error_t mhu_v2_x_reset_access_request(
++     const struct mhu_v2_x_dev_t *dev)
++{
++    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
++
++    if ( !(dev->is_initialized) ) {
++        return MHU_V_2_X_ERR_NOT_INIT;
++    }
++
++    if(dev->frame !=3D MHU_V2_X_SENDER_FRAME) {
++        return MHU_V_2_X_ERR_INVALID_ARG;
++    }
++
++    (SEND_FRAME(p_mhu))->access_request =3D DISABLE;
++
++    return MHU_V_2_X_ERR_NONE;
++}
++
++enum mhu_v2_x_error_t mhu_v2_x_get_access_ready(
++     const struct mhu_v2_x_dev_t *dev, uint32_t *val)
++{
++    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
++
++    if ( !(dev->is_initialized) ) {
++        return MHU_V_2_X_ERR_NOT_INIT;
++    }
++
++    if(dev->frame !=3D MHU_V2_X_SENDER_FRAME) {
++        return MHU_V_2_X_ERR_INVALID_ARG;
++    }
++
++    *val =3D (SEND_FRAME(p_mhu))->access_ready;
++
++    return MHU_V_2_X_ERR_NONE;
++}
++
++uint32_t mhu_v2_x_get_interrupt_status(const struct mhu_v2_x_dev_t *dev=
)
++{
++    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
++
++    if ( !(dev->is_initialized) ) {
++        return MHU_V_2_X_ERR_NOT_INIT;
++    }
++
++    if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
++        return (SEND_FRAME(p_mhu))->int_st;
++    } else {
++        return (RECV_FRAME(p_mhu))->int_st;
++    }
++}
++
++enum mhu_v2_x_error_t mhu_v2_x_interrupt_enable(
++     const struct mhu_v2_x_dev_t *dev, uint32_t mask)
++{
++    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
++
++    if ( !(dev->is_initialized) ) {
++        return MHU_V_2_X_ERR_NOT_INIT;
++    }
++
++    if (dev->subversion =3D=3D MHU_MINOR_REV_2_0) {
++        if (mask & MHU_2_1_INTR_CHCOMB_MASK) {
++            /* Combined channel IRQ is not present in v2.0 */
++            return MHU_V_2_X_ERR_INVALID_ARG;
++        }
++
++        if (dev->frame =3D=3D MHU_V2_X_RECEIVER_FRAME) {
++            /* Only sender frame has these registers */
++            return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
++        }
++    }
++
++    if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
++        (SEND_FRAME(p_mhu))->int_en |=3D mask;
++    } else {
++        (RECV_FRAME(p_mhu))->int_en |=3D mask;
++    }
++
++    return MHU_V_2_X_ERR_NONE;
++}
++
++enum mhu_v2_x_error_t mhu_v2_x_interrupt_disable(
++     const struct mhu_v2_x_dev_t *dev, uint32_t mask)
++{
++    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
++
++    if ( !(dev->is_initialized) ) {
++        return MHU_V_2_X_ERR_NOT_INIT;
++    }
++
++    if (dev->subversion =3D=3D MHU_MINOR_REV_2_0) {
++        if (mask & MHU_2_1_INTR_CHCOMB_MASK) {
++            /* Combined channel IRQ is not present in v2.0 */
++            return MHU_V_2_X_ERR_INVALID_ARG;
++        }
++
++        if (dev->frame =3D=3D MHU_V2_X_RECEIVER_FRAME) {
++            /* Only sender frame has these registers */
++            return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
++        }
++    }
++
++    if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
++        (SEND_FRAME(p_mhu))->int_en &=3D ~mask;
++    } else {
++        (RECV_FRAME(p_mhu))->int_en &=3D ~mask;
++    }
++
++    return MHU_V_2_X_ERR_NONE;
++}
++
++enum mhu_v2_x_error_t mhu_v2_x_interrupt_clear(
++     const struct mhu_v2_x_dev_t *dev, uint32_t mask)
++{
++    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
++
++    if ( !(dev->is_initialized) ) {
++        return MHU_V_2_X_ERR_NOT_INIT;
++    }
++
++    if (dev->subversion =3D=3D MHU_MINOR_REV_2_0) {
++        if (mask & MHU_2_1_INTR_CHCOMB_MASK) {
++            /* Combined channel IRQ is not present in v2.0 */
++            return MHU_V_2_X_ERR_INVALID_ARG;
++        }
++
++        if (dev->frame =3D=3D MHU_V2_X_RECEIVER_FRAME) {
++            /* Only sender frame has these registers */
++            return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
++        }
++    }
++
++    if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
++        (SEND_FRAME(p_mhu))->int_clr =3D mask;
++    } else {
++        (RECV_FRAME(p_mhu))->int_clr =3D mask;
++    }
++
++    return MHU_V_2_X_ERR_NONE;
++}
++
++enum mhu_v2_x_error_t mhu_v2_1_get_ch_interrupt_num(
++     const struct mhu_v2_x_dev_t *dev, uint32_t *channel)
++{
++    uint32_t i, j, status;
++    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
++
++    if ( !(dev->is_initialized) ) {
++        return MHU_V_2_X_ERR_NOT_INIT;
++    }
++
++    if (dev->subversion !=3D MHU_MINOR_REV_2_1) {
++        /* Feature is only supported in MHU v2.1 */
++        return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
++    }
++
++    for(i =3D 0; i < _MHU_V2_1_MAX_CHCOMB_INT; i++) {
++        if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
++            status =3D (SEND_FRAME(p_mhu))->ch_comb_int_st[i];
++        } else {
++            status =3D (RECV_FRAME(p_mhu))->ch_comb_int_st[i];
++        }
++
++        for(j =3D 0; j < CH_PER_CH_COMB; j++) {
++            if ((status >> CH_PER_CH_COMB - j - 1) & (ENABLE)) {
++                *channel =3D (CH_PER_CH_COMB - j -1 + (i * CH_PER_CH_CO=
MB));
++                return MHU_V_2_X_ERR_NONE;
++            }
++        }
++    }
++
++    return MHU_V_2_X_ERR_GENERAL;
++}
+diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
+new file mode 100644
+index 0000000..bb778bb
+--- /dev/null
++++ b/platform/providers/arm/corstone1000/platform.cmake
+@@ -0,0 +1,10 @@
++#----------------------------------------------------------------------=
---------
++# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved=
.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++# Platform definition for the 'fvp_base_revc-2xaem8a' virtual platform.
++#----------------------------------------------------------------------=
---------
++
++# include MHU driver
++include(${TS_ROOT}/platform/drivers/arm/mhu_driver/component.cmake)
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone10=
00.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.i=
nc
index 04bde3c..acf604f 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -18,6 +18,7 @@ SRC_URI:append =3D " \
                   file://0005-Configure-NV-storage-macro.patch \
                   file://0006-Use-device-region.patch \
                   file://0007-Add-openamp-to-SE-proxy-deployment.patch \
+                  file://0008-Implement-mhu-driver-and-the-OpenAmp-conve=
rsion-laye.patch \
 		  "
=20
 SRCREV_ts =3D "882a2db4f9181fc6ddb505b82262f82e5a0c2fd5"
@@ -34,12 +35,10 @@ SRCREV_openamp =3D "347397decaa43372fc4d00f965640ebde=
042966d"
 SRC_URI_LIBMETAL =3D "git://github.com/OpenAMP/libmetal.git;name=3Dlibme=
tal;protocol=3Dhttps;branch=3Dmain;destsuffix=3Dgit/libmetal"
 SRCREV_libmetal =3D "f252f0e007fbfb8b3a52b1d5901250ddac96baad"
=20
-TS_PLATFORM =3D "arm/fvp/fvp_base_revc-2xaemv8a"
+TS_PLATFORM =3D "arm/corstone1000"
 TS_ENVIRONMENT =3D "opteesp"
 SP_PACKAGING_METHOD =3D "embedded"
=20
-EXTRA_OEMAKE +=3D "TS_PLATFORM=3D${TS_PLATFORM}"
-
 # Secure Enclave proxy secure partition
 TS_DEPLOYMENTS +=3D "'deployments/se-proxy/${TS_ENVIRONMENT}'"
=20
--=20
2.17.1


