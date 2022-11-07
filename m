Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7752C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 09:12:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.1379.1667812316541262555
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Nov 2022 01:11:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: luca.fancellu@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C9841FB
	for <meta-arm@lists.yoctoproject.org>; Mon,  7 Nov 2022 01:12:01 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com [10.1.195.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC4543F534
	for <meta-arm@lists.yoctoproject.org>; Mon,  7 Nov 2022 01:11:54 -0800 (PST)
From: Luca Fancellu <luca.fancellu@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm,arm-bsp/recipes-kernel: don't use PN in arm-ffa-transport.inc
Date: Mon,  7 Nov 2022 09:11:45 +0000
Message-Id: <20221107091145.4373-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Nov 2022 09:12:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4091

There are some cases where PN is not expanded into linux-yocto in the
arm-ffa-transport.inc file required from linux-yocto_%.bbappend,
because of the := usage, in those cases PN gets "defaultpkgname".

To fix the issue, rename "linux-yocto" folder into "files" and adjust
ARMFILESPATHS to point to that in linux-yocto_%.bbappend, prepend
ARMFILESPATHS to FILESEXTRAPATHS in arm-ffa-transport.inc.

Remove ARMFILESPATHS prepend from FILESEXTRAPATHS for corstone1000 in
meta-arm-bsp, because the platform has always the "arm-ffa" in
MACHINE_FEATURES, which causes ARMFILESPATHS to be prepended.

While there, remove the FILESEXTRAPATHS prepend of ARMFILESPATHS for
the n1sdp that will be added by arm-ffa-transport.inc only when
needed.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc       | 2 --
 meta-arm/recipes-kernel/linux/arm-ffa-transport.inc             | 2 +-
 .../linux/{linux-yocto => files}/arm-ffa-transport.cfg          | 0
 meta-arm/recipes-kernel/linux/{linux-yocto => files}/efi.cfg    | 0
 .../generic-arm64-kmeta/generic-arm64-standard.scc              | 0
 .../linux/{linux-yocto => files}/no-strict-devmem.cfg           | 0
 meta-arm/recipes-kernel/linux/{linux-yocto => files}/tee.cfg    | 0
 meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend            | 2 +-
 8 files changed, 2 insertions(+), 4 deletions(-)
 rename meta-arm/recipes-kernel/linux/{linux-yocto => files}/arm-ffa-transport.cfg (100%)
 rename meta-arm/recipes-kernel/linux/{linux-yocto => files}/efi.cfg (100%)
 rename meta-arm/recipes-kernel/linux/{linux-yocto => files}/generic-arm64-kmeta/generic-arm64-standard.scc (100%)
 rename meta-arm/recipes-kernel/linux/{linux-yocto => files}/no-strict-devmem.cfg (100%)
 rename meta-arm/recipes-kernel/linux/{linux-yocto => files}/tee.cfg (100%)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 99a40e77775f..79d9e0c3da2e 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -36,7 +36,6 @@ SRC_URI:append:corstone500 = " \
 # Corstone1000 KMACHINE
 #
 FILESEXTRAPATHS:prepend:corstone1000 := "${ARMBSPFILESPATHS}"
-FILESEXTRAPATHS:prepend:corstone1000 := "${ARMFILESPATHS}"
 COMPATIBLE_MACHINE:corstone1000 = "${MACHINE}"
 KCONFIG_MODE:corstone1000 = "--alldefconfig"
 KMACHINE:corstone1000 = "corstone1000"
@@ -115,7 +114,6 @@ COMPATIBLE_MACHINE:n1sdp = "n1sdp"
 KBUILD_DEFCONFIG:n1sdp = "defconfig"
 KCONFIG_MODE:n1sdp = "--alldefconfig"
 FILESEXTRAPATHS:prepend:n1sdp := "${ARMBSPFILESPATHS}"
-FILESEXTRAPATHS:prepend:n1sdp := "${ARMFILESPATHS}"
 SRC_URI:append:n1sdp = " \
     file://0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch \
     file://0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch \
diff --git a/meta-arm/recipes-kernel/linux/arm-ffa-transport.inc b/meta-arm/recipes-kernel/linux/arm-ffa-transport.inc
index dec31dd44da1..b3d377b4bf7a 100644
--- a/meta-arm/recipes-kernel/linux/arm-ffa-transport.inc
+++ b/meta-arm/recipes-kernel/linux/arm-ffa-transport.inc
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend := "${ARMFILESPATHS}"
 
 # Enable ARM-FFA transport
 SRC_URI:append = " \
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/arm-ffa-transport.cfg b/meta-arm/recipes-kernel/linux/files/arm-ffa-transport.cfg
similarity index 100%
rename from meta-arm/recipes-kernel/linux/linux-yocto/arm-ffa-transport.cfg
rename to meta-arm/recipes-kernel/linux/files/arm-ffa-transport.cfg
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/efi.cfg b/meta-arm/recipes-kernel/linux/files/efi.cfg
similarity index 100%
rename from meta-arm/recipes-kernel/linux/linux-yocto/efi.cfg
rename to meta-arm/recipes-kernel/linux/files/efi.cfg
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/generic-arm64-kmeta/generic-arm64-standard.scc b/meta-arm/recipes-kernel/linux/files/generic-arm64-kmeta/generic-arm64-standard.scc
similarity index 100%
rename from meta-arm/recipes-kernel/linux/linux-yocto/generic-arm64-kmeta/generic-arm64-standard.scc
rename to meta-arm/recipes-kernel/linux/files/generic-arm64-kmeta/generic-arm64-standard.scc
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/no-strict-devmem.cfg b/meta-arm/recipes-kernel/linux/files/no-strict-devmem.cfg
similarity index 100%
rename from meta-arm/recipes-kernel/linux/linux-yocto/no-strict-devmem.cfg
rename to meta-arm/recipes-kernel/linux/files/no-strict-devmem.cfg
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg b/meta-arm/recipes-kernel/linux/files/tee.cfg
similarity index 100%
rename from meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg
rename to meta-arm/recipes-kernel/linux/files/tee.cfg
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
index 896add8d0a6c..a641ec2da26c 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
@@ -1,4 +1,4 @@
-ARMFILESPATHS := "${THISDIR}/${PN}:"
+ARMFILESPATHS := "${THISDIR}/files:"
 
 COMPATIBLE_MACHINE:generic-arm64 = "generic-arm64"
 FILESEXTRAPATHS:prepend:generic-arm64 = "${ARMFILESPATHS}"
-- 
2.17.1


