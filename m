Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51451CCA473
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 16:34:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.525.1654533273916313668
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Jun 2022 09:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A96C1682;
	Mon,  6 Jun 2022 09:34:33 -0700 (PDT)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown
 [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 991DA3F73B;
	Mon,  6 Jun 2022 09:34:32 -0700 (PDT)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Xueliang Zhong <xueliang.zhong@arm.com>
Subject: [PATCH 1/1] arm-bsp/n1sdp: upgrade board-firmware version
Date: Mon,  6 Jun 2022 16:34:22 +0000
Message-Id: <20220606163422.8688-2-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220606163422.8688-1-xueliang.zhong@arm.com>
References: <20220606163422.8688-1-xueliang.zhong@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Jun 2022 16:34:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3474

From: Xueliang Zhong <xueliang.zhong@arm.com>

Upgraded N1SDP board-firmware to N1SDP-2021.10.12 version.

Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
---
 ..._2020.07.27.bb => n1sdp-board-firmware_2021.10.12.bb} | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-arm-bsp/recipes-bsp/images/{n1sdp-board-firmware_2020.07.27.bb => n1sdp-board-firmware_2021.10.12.bb} (65%)

diff --git a/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2020.07.27.bb b/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2021.10.12.bb
similarity index 65%
rename from meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2020.07.27.bb
rename to meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2021.10.12.bb
index 228ed927..dda99e74 100644
--- a/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2020.07.27.bb
+++ b/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2021.10.12.bb
@@ -2,7 +2,7 @@ SUMMARY = "Board Firmware binaries for N1SDP"
 SECTION = "firmware"
 
 LICENSE = "STM-SLA0044-Rev5"
-LIC_FILES_CHKSUM = "file://LICENSES/STM.TXT;md5=4b8dab81d0bfc0a5f63c9a983402705b"
+LIC_FILES_CHKSUM = "file://LICENSES/STM.TXT;md5=cd18335eff80d0a690a650f0e6748baf"
 
 inherit deploy
 
@@ -11,10 +11,11 @@ INHIBIT_DEFAULT_DEPS = "1"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE = "n1sdp"
 
-SRC_URI = "https://git.linaro.org/landing-teams/working/arm/n1sdp-board-firmware.git/snapshot/${BPN}-N1SDP-${PV}.tar.gz"
-SRC_URI[sha256sum] = "57feba404026f2d6d49c167d63e0e84653ad8b808b13e2244b81fea9e0d58d66"
+SRC_URI = "git://git.gitlab.arm.com/arm-reference-solutions/board-firmware.git;protocol=https;branch=n1sdp"
 
-S = "${WORKDIR}/${BPN}-N1SDP-${PV}"
+SRCREV = "e6cd91c7a9733e501bc3b57ff6f9eb2461ffee54"
+
+S = "${WORKDIR}/git"
 
 INSTALL_DIR = "/n1sdp-board-firmware_source"
 
-- 
2.17.1


