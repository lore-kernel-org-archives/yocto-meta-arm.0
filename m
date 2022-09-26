Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37879C6FA82
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 17:18:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.674.1664212695555787958
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 10:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0B7C1D15;
	Mon, 26 Sep 2022 10:18:21 -0700 (PDT)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown
 [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 786DE3F66F;
	Mon, 26 Sep 2022 10:18:14 -0700 (PDT)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Xueliang Zhong <xueliang.zhong@arm.com>
Subject: [PATCH 1/1] arm-bsp/n1sdp: upgrade scp-firmware version
Date: Mon, 26 Sep 2022 17:18:06 +0000
Message-Id: <20220926171806.12213-2-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220926171806.12213-1-xueliang.zhong@arm.com>
References: <20220926171806.12213-1-xueliang.zhong@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 26 Sep 2022 17:18:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3841

From: Xueliang Zhong <xueliang.zhong@arm.com>

Upgraded N1SDP scp-firmware to N1SDP-2022.06.22 version.

Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
---
 .../recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc    | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
index e66469c3..85f89a01 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
@@ -3,14 +3,20 @@
 SCP_PLATFORM  = "n1sdp"
 SCP_LOG_LEVEL = "INFO"
 
-# master branch at n1sdp: Introduce trusted board boot
-SRCREV  = "3e4c34ceccc1c960eb3a4adaa922f2a0c6b36be3"
+SRCREV  = "de7e464ecd77130147103cf48328099c2d0e6289"
 PV .= "+git${SRCPV}"
 
 COMPATIBLE_MACHINE:n1sdp = "n1sdp"
 
 DEPENDS += "fiptool-native"
 DEPENDS += "trusted-firmware-a"
+DEPENDS += "n1sdp-board-firmware"
+
+# The n1sdp sensor library is needed for building SCP N1SDP Platform
+# https://github.com/ARM-software/SCP-firmware/tree/master/product/n1sdp
+EXTRA_OECMAKE:append = " \
+    -DSCP_N1SDP_SENSOR_LIB_PATH=${RECIPE_SYSROOT}/n1sdp-board-firmware_source/LIB/sensor.a \
+"
 
 do_install:append() {
    fiptool \
-- 
2.17.1


