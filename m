Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3581EC433EF
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 13:36:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.4952.1652880989702545655
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 May 2022 06:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C7411042
	for <meta-arm@lists.yoctoproject.org>; Wed, 18 May 2022 06:36:29 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 212413F73D
	for <meta-arm@lists.yoctoproject.org>; Wed, 18 May 2022 06:36:29 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] arm/linux-yocto: remove tcpci for generic-arm64
Date: Wed, 18 May 2022 09:36:22 -0400
Message-Id: <20220518133624.24874-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220518133624.24874-1-jon.mason@arm.com>
References: <20220518133624.24874-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 May 2022 13:36:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3437

Per the comment, it's not necessary post 5.12.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-kernel/linux/linux-yocto/tcpci.cfg  | 2 --
 meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend | 4 ----
 2 files changed, 6 deletions(-)
 delete mode 100644 meta-arm/recipes-kernel/linux/linux-yocto/tcpci.cfg

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/tcpci.cfg b/meta-arm/recipes-kernel/linux/linux-yocto/tcpci.cfg
deleted file mode 100644
index 33205a9a..00000000
--- a/meta-arm/recipes-kernel/linux/linux-yocto/tcpci.cfg
+++ /dev/null
@@ -1,2 +0,0 @@
-# The upstream defconfig has this in 5.12 onwards, but until then set it manually.
-CONFIG_TYPEC_TCPCI=m
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
index 6658b91a..14cc6df1 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
@@ -1,10 +1,6 @@
 ARMFILESPATHS := "${THISDIR}/${PN}:"
 
 COMPATIBLE_MACHINE:generic-arm64 = "generic-arm64"
-FILESEXTRAPATHS:prepend:generic-arm64 = "${ARMFILESPATHS}"
-SRC_URI:append:generic-arm64 = " \
-    file://tcpci.cfg \
-    "
 
 FILESEXTRAPATHS:prepend:qemuarm64-secureboot = "${ARMFILESPATHS}"
 SRC_URI:append:qemuarm64-secureboot = " \
-- 
2.17.1


