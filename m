Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2124DC433FE
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 15:59:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.13295.1637683196155812685
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Nov 2021 07:59:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1C4D1FB;
	Tue, 23 Nov 2021 07:59:55 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.78.53])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC8473F5A1;
	Tue, 23 Nov 2021 07:59:53 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Arpita.S.K@arm.com,
	vishnu.banavath@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Drew Reed <drew.reed@arm.com>,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Satish Kumar <satish.kumar01@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH][honister 08/19] arm-bsp/trusted-firmware-m: introducing
 corstone1000 FVP machine
Date: Tue, 23 Nov 2021 15:59:15 +0000
Message-Id: <20211123155926.31743-9-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123155926.31743-1-abdellatif.elkhlifi@arm.com>
References: <20211123155926.31743-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Nov 2021 15:59:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2437

From: Vishnu Banavath <vishnu.banavath@arm.com>

Enables trusted-firmware-m on the corstone1000-fvp machine.

Change-Id: Id38d565e1f2b2d0a80cbd58740e64f56ddbc4cee
Signed-off-by: Drew Reed <drew.reed@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Signed-off-by: Arpita S.K <Arpita.S.K@arm.com>
Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |  5 ++++
 .../trusted-firmware-m-corstone1000.inc       | 30 +++++++++++++++++++
 .../trusted-firmware-m_%.bbappend             |  6 ++++
 3 files changed, 41 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_%.bbappend

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
index 3d06143..b38e35a 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -2,6 +2,11 @@ require conf/machine/include/arm/armv8a/tune-cortexa35.inc
 
 MACHINEOVERRIDES =. "corstone1000:"
 
+# TF-M
+PREFERRED_VERSION_trusted-firmware-m ?= "1.4%"
+TFM_PLATFORM = "arm/corstone1000"
+EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-m"
+
 # Linux kernel
 PREFERRED_PROVIDER_virtual/kernel:forcevariable = "linux-yocto"
 PREFERRED_VERSION_linux-yocto = "5.10%"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
new file mode 100644
index 0000000..1967365
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
@@ -0,0 +1,30 @@
+# Corstone1000 machines specific TFM support
+
+COMPATIBLE_MACHINE = "(corstone1000)"
+
+TFM_DEBUG = "1"
+
+PACKAGECONFIG[test-secure] = "-DTEST_S=OFF,-DTEST_S=OFF"
+PACKAGECONFIG[test-nonsecure] = "-DTEST_NS=OFF,-DTEST_NS=OFF"
+
+INSANE_SKIP:${PN} = "arch"
+
+## Default is the FVP ##
+TFM_PLATFORM_IS_FVP ?= "TRUE"
+EXTRA_OECMAKE += "-DPLATFORM_IS_FVP=${TFM_PLATFORM_IS_FVP}"
+
+SRCREV_tfm = "ccd82e35f539c0d7261b2935d6d30c550cfc6736"
+
+SRCREV_FORMAT = "tfm_mcuboot_tfm-tests_mbedtls"
+
+do_install() {
+  if [ ! -d "${B}/install/outputs/ARM/CORSTONE1000" ]
+  then
+    bbfatal "'${B}/install/outputs/ARM/CORSTONE1000' output folder not found!"
+  fi
+
+  install -D -p -m 0644 ${B}/install/outputs/ARM/CORSTONE1000/tfm_s_signed.bin ${D}/firmware/tfm_s_signed.bin
+  install -D -p -m 0644 ${B}/install/outputs/ARM/CORSTONE1000/bl2_signed.bin ${D}/firmware/bl2_signed.bin
+  install -D -p -m 0644 ${B}/install/outputs/ARM/CORSTONE1000/bl1.bin ${D}/firmware/bl1.bin
+
+}
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_%.bbappend
new file mode 100644
index 0000000..da70bc7
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_%.bbappend
@@ -0,0 +1,6 @@
+# Machine specific configurations
+
+MACHINE_TFM_REQUIRE ?= ""
+MACHINE_TFM_REQUIRE:corstone1000 = "trusted-firmware-m-corstone1000.inc"
+
+require ${MACHINE_TFM_REQUIRE}
-- 
2.17.1


