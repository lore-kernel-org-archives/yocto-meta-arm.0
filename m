Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9E3C5AD4C
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 17:43:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.99405.1700761394239901308
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Nov 2023 09:43:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 382E51063;
	Thu, 23 Nov 2023 09:44:00 -0800 (PST)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 07FE63F7A6;
	Thu, 23 Nov 2023 09:43:12 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH nanbield 1/1] arm-bsp/corstone1000: fix synchronization issue on openamp notification
Date: Thu, 23 Nov 2023 17:43:06 +0000
Message-Id: <20231123174306.2174931-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231123174306.2174931-1-emekcan.aras@arm.com>
References: <20231123174306.2174931-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Nov 2023 17:43:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5264

From: Emekcan Aras <emekcan.aras@arm.com>

This fixes a race that is observed rarely in the FVP. It occurs in FVP
when tfm sends the notication ack in openamp, and then reset the access
request which resets the mhu registers before received by the host
processor. It implements the fix both in SE and the host processor openam=
p
wrapper. This solution enables polling on the status register of mhu unti=
l
the notificaiton is read by the host processor. (Inspired by
signal_and_wait_for_signal function in mhu_wrapper_v2_x.c in trusted-firm=
ware-m
https://git.trustedfirmware.org/TF-M/trusted-firmware-m.git/tree/platform=
/ext/target/arm/rss/common/native_drivers/mhu_wrapper_v2_x.c#n61)

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ...e1000-fix-synchronization-issue-on-o.patch |  50 +++++++++
 .../trusted-firmware-m-corstone1000.inc       |   1 +
 ...rstone1000-fix-synchronization-issue.patch | 105 ++++++++++++++++++
 .../trusted-services/ts-arm-platforms.inc     |   1 +
 4 files changed, 157 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0009-platform-corstone1000-fix-synchronization-issue-on-o.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0008-platform-corstone1000-fix-synchronization-issue.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0009-platform-corstone1000-fix-synchronization-issue-on-o.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-platform-=
corstone1000-fix-synchronization-issue-on-o.patch
new file mode 100644
index 00000000..be6bde6f
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009=
-platform-corstone1000-fix-synchronization-issue-on-o.patch
@@ -0,0 +1,50 @@
+From b70dd14eed59d7c5833ded8469cf99e631951e14 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Wed, 15 Nov 2023 09:52:19 +0000
+Subject: [PATCH] platform: corstone1000: fix synchronization issue on op=
enamp
+ notification
+
+This fixes a race that is observed rarely in the FVP. It occurs in FVP
+when tfm sends the notication ack in openamp, and then reset the access
+request which resets the mhu registers before received by the host
+processor. This solution introduces polling on the status register of
+mhu until the notificaiton is read by the host processor. (Inspired by
+signal_and_wait_for_signal function in mhu_wrapper_v2_x.c in trusted-fir=
mware-m
+https://git.trustedfirmware.org/TF-M/trusted-firmware-m.git/tree/platfor=
m/ext/target/arm/rss/common/native_drivers/mhu_wrapper_v2_x.c#n61)
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ .../corstone1000/openamp/platform_spe_dual_core_hal.c    | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/openamp/platform_spe_d=
ual_core_hal.c b/platform/ext/target/arm/corstone1000/openamp/platform_sp=
e_dual_core_hal.c
+index 7613345ffc..b58088032f 100644
+--- a/platform/ext/target/arm/corstone1000/openamp/platform_spe_dual_cor=
e_hal.c
++++ b/platform/ext/target/arm/corstone1000/openamp/platform_spe_dual_cor=
e_hal.c
+@@ -83,7 +83,7 @@ enum tfm_plat_err_t tfm_dual_core_hal_init(void)
+
+ enum tfm_plat_err_t tfm_hal_notify_peer(void)
+ {
+-    uint32_t access_ready;
++    uint32_t access_ready,val;
+     enum mhu_v2_x_error_t status;
+     struct mhu_v2_x_dev_t* dev =3D &MHU1_SE_TO_HOST_DEV;
+
+@@ -108,6 +108,13 @@ enum tfm_plat_err_t tfm_hal_notify_peer(void)
+         return TFM_PLAT_ERR_SYSTEM_ERR;
+     }
+
++    do {
++        status =3D mhu_v2_x_channel_poll(dev, MHU1_SEH_NOTIFY_CH, &val)=
;
++        if (status !=3D MHU_V_2_X_ERR_NONE) {
++            break;
++        }
++    } while(val !=3D 0);
++
+     status =3D mhu_v2_x_reset_access_request(dev);
+     if (status !=3D MHU_V_2_X_ERR_NONE) {
+         SPMLOG_ERRMSGVAL("mhu_v2_x_reset_access_request : ", status);
+--
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 94bec96c..7cf3b944 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -36,6 +36,7 @@ SRC_URI:append:corstone1000 =3D " \
     file://0006-Platform-Corstone1000-Enable-Signed-Capsule.patch \
     file://0007-platform-corstone1000-increase-ITS-max-asset-size.patch =
\
     file://0008-platform-corstone1000-align-capsule-update-structs.patch=
 \
+    file://0009-platform-corstone1000-fix-synchronization-issue-on-o.pat=
ch \
     "
=20
 # TF-M ships patches for external dependencies that needs to be applied
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0008-platform-corstone1000-fix-synchronization-issue.patch b/meta-arm-bsp=
/recipes-security/trusted-services/corstone1000/0008-platform-corstone100=
0-fix-synchronization-issue.patch
new file mode 100644
index 00000000..5d8f7318
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0008-pl=
atform-corstone1000-fix-synchronization-issue.patch
@@ -0,0 +1,105 @@
+From 06c3e612cb0927d783f115077d83ed97841c5668 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Tue, 14 Nov 2023 14:43:44 +0000
+Subject: [PATCH] plat: corstone1000: fix synchronization issue on openam=
p notification
+
+This fixes a race that is observed rarely in the FVP. It occurs in FVP
+when Secure Enclave sends the notication ack in openamp, and then reset =
the access
+request which resets the mhu registers before received by the SE-proxy-s=
p in the
+host processort. This solution introduces polling on the status register=
 of
+mhu until the notificaiton is read by the host processor. (Inspired by
+signal_and_wait_for_signal function in mhu_wrapper_v2_x.c in trusted-fir=
mware-m
+https://git.trustedfirmware.org/TF-M/trusted-firmware-m.git/tree/platfor=
m/ext/target/arm/rss/common/native_drivers/mhu_wrapper_v2_x.c#n61)
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ components/messaging/openamp/sp/openamp_mhu.c |  9 ++++++++-
+ platform/drivers/arm/mhu_driver/mhu_v2.h      | 18 ++++++++++++++++++
+ platform/drivers/arm/mhu_driver/mhu_v2_x.c    | 17 +++++++++++++++++
+ 3 files changed, 43 insertions(+), 1 deletion(-)
+
+diff --git a/components/messaging/openamp/sp/openamp_mhu.c b/components/=
messaging/openamp/sp/openamp_mhu.c
+index bafba3e3..0700b8b9 100644
+--- a/components/messaging/openamp/sp/openamp_mhu.c
++++ b/components/messaging/openamp/sp/openamp_mhu.c
+@@ -85,7 +85,7 @@ int openamp_mhu_notify_peer(struct openamp_messenger *=
openamp)
+	struct mhu_v2_x_dev_t *tx_dev;
+	enum mhu_v2_x_error_t ret;
+	struct openamp_mhu *mhu;
+-	uint32_t access_ready;
++	uint32_t access_ready,val;
+
+	if (!openamp->transport) {
+		EMSG("openamp: mhu: notify transport not initialized");
+@@ -116,6 +116,13 @@ int openamp_mhu_notify_peer(struct openamp_messenge=
r *openamp)
+		return -EPROTO;
+	}
+
++	do {
++		ret =3D mhu_v2_x_channel_poll(tx_dev, MHU_V_2_NOTIFY_CHANNEL, &val);
++		if (ret !=3D MHU_V_2_X_ERR_NONE) {
++			break;
++		}
++	} while (val !=3D 0);
++
+	ret =3D mhu_v2_x_reset_access_request(tx_dev);
+	if (ret !=3D MHU_V_2_X_ERR_NONE) {
+		EMSG("openamp: mhu: failed reset access request");
+diff --git a/platform/drivers/arm/mhu_driver/mhu_v2.h b/platform/drivers=
/arm/mhu_driver/mhu_v2.h
+index 26b3a5d6..2b4d6fcb 100644
+--- a/platform/drivers/arm/mhu_driver/mhu_v2.h
++++ b/platform/drivers/arm/mhu_driver/mhu_v2.h
+@@ -384,6 +384,24 @@ enum mhu_v2_x_error_t mhu_v2_x_interrupt_clear(
+ enum mhu_v2_x_error_t mhu_v2_1_get_ch_interrupt_num(
+      const struct mhu_v2_x_dev_t *dev, uint32_t *channel);
+
++
++/**
++ * \brief Polls sender channel status.
++ *
++ * \param[in]  dev         MHU device struct \ref mhu_v2_x_dev_t
++ * \param[in]  channel     Channel to poll the status of.
++ * \param[out] value       Pointer to variable that will store the valu=
e.
++ *
++ * Polls sender channel status.
++ *
++ * \return Returns mhu_v2_x_error_t error code
++ *
++ * \note This function doesn't check if dev is NULL.
++ * \note This function doesn't check if channel is implemented.
++ */
++enum mhu_v2_x_error_t mhu_v2_x_channel_poll(const struct mhu_v2_x_dev_t=
 *dev,
++     uint32_t channel, uint32_t *value);
++
+ #ifdef __cplusplus
+ }
+ #endif
+diff --git a/platform/drivers/arm/mhu_driver/mhu_v2_x.c b/platform/drive=
rs/arm/mhu_driver/mhu_v2_x.c
+index d7e70efa..022e287a 100644
+--- a/platform/drivers/arm/mhu_driver/mhu_v2_x.c
++++ b/platform/drivers/arm/mhu_driver/mhu_v2_x.c
+@@ -600,3 +600,20 @@ enum mhu_v2_x_error_t mhu_v2_1_get_ch_interrupt_num=
(
+
+     return MHU_V_2_X_ERR_GENERAL;
+ }
++
++enum mhu_v2_x_error_t mhu_v2_x_channel_poll(const struct mhu_v2_x_dev_t=
 *dev,
++     uint32_t channel, uint32_t *value)
++{
++    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
++
++    if ( !(dev->is_initialized) ) {
++        return MHU_V_2_X_ERR_NOT_INIT;
++    }
++
++    if (dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
++        *value =3D (SEND_FRAME(p_mhu))->send_ch_window[channel].ch_st;
++        return MHU_V_2_X_ERR_NONE;
++    } else {
++        return MHU_V_2_X_ERR_INVALID_ARG;
++    }
++}
+--
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index 6873c4e0..3c7e94e6 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -9,6 +9,7 @@ SRC_URI:append:corstone1000  =3D " \
     file://0005-plat-corstone1000-add-compile-definitions-for-ECP_DP.pat=
ch \
     file://0006-plat-corstone1000-Use-the-stateless-platform-service.pat=
ch \
     file://0007-plat-corstone1000-Initialize-capsule-update-provider.pat=
ch \
+    file://0008-platform-corstone1000-fix-synchronization-issue.patch \
     "
=20
=20
--=20
2.25.1


