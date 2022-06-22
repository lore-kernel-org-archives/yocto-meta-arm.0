Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26AF4CCA47E
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 08:59:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.5296.1655888356974908944
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Jun 2022 01:59:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAB6A1477;
	Wed, 22 Jun 2022 01:59:16 -0700 (PDT)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown
 [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB7693F66F;
	Wed, 22 Jun 2022 01:59:15 -0700 (PDT)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Xueliang Zhong <xueliang.zhong@arm.com>
Subject: [PATCH 1/1] arm-bsp/n1sdp: fix boot due to TF-A 2.7 update
Date: Wed, 22 Jun 2022 08:59:07 +0000
Message-Id: <20220622085907.22892-2-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220622085907.22892-1-xueliang.zhong@arm.com>
References: <20220622085907.22892-1-xueliang.zhong@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Jun 2022 08:59:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3523

From: Xueliang Zhong <xueliang.zhong@arm.com>

N1SDP board cannot boot after recent TF-A 2.7 update in meta-arm.  This
is due to TF-A 2.7 not configured correctly for N1SDP board to support
trusted boot feature.

This patch temporarily brings back TF-A 2.6 recipes for fixing the N1SDP
boot.

A proper fix is in work progress to configure TF-A 2.7 correctly to
support trutsed boot on N1SDP.

Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf                 |  2 ++
 .../trusted-firmware-a_2.6.bbappend                  |  8 ++++++++
 .../trusted-firmware-a/trusted-firmware-a_2.6.bb     | 12 ++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bbappend
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index 5e87e61d..5423618c 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -25,6 +25,8 @@ PREFERRED_VERSION_linux-yocto ?= "5.15%"
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "linux-firmware-rtl8168"
 
 EXTRA_IMAGEDEPENDS += "trusted-firmware-a"
+PREFERRED_VERSION_trusted-firmware-a = "2.6"
+
 EXTRA_IMAGEDEPENDS += "virtual/control-processor-firmware"
 
 #UEFI EDK2 firmware
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bbappend
new file mode 100644
index 00000000..ad02f40d
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bbappend
@@ -0,0 +1,8 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/files/:"
+
+# Machine specific TFAs
+
+MACHINE_TFA_REQUIRE ?= ""
+MACHINE_TFA_REQUIRE:n1sdp = "trusted-firmware-a-n1sdp.inc"
+
+require ${MACHINE_TFA_REQUIRE}
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb
new file mode 100644
index 00000000..ec1bec95
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb
@@ -0,0 +1,12 @@
+require trusted-firmware-a.inc
+
+# TF-A v2.6
+SRCREV_tfa = "a1f02f4f3daae7e21ee58b4c93ec3e46b8f28d15"
+
+LIC_FILES_CHKSUM += "file://docs/license.rst;md5=b2c740efedc159745b9b31f88ff03dde"
+
+# mbed TLS v2.26.0
+SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls;branch=master"
+SRCREV_mbedtls = "e483a77c85e1f9c1dd2eb1c5a8f552d2617fe400"
+
+LIC_FILES_CHKSUM_MBEDTLS = "file://mbedtls/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-- 
2.17.1


