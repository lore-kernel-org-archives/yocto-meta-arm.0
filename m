Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A2B4C3F6B0
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 16:23:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.661.1659111778606530110
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Jul 2022 09:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A2B91570;
	Fri, 29 Jul 2022 09:22:58 -0700 (PDT)
Received: from e125903.cambridge.arm.com (e125903.cambridge.arm.com
 [10.1.195.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 543823F73B;
	Fri, 29 Jul 2022 09:22:57 -0700 (PDT)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 1/1] arm/optee: support optee-os v3.18.0
Date: Fri, 29 Jul 2022 17:22:30 +0100
Message-Id: <20220729162230.45859-2-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220729162230.45859-1-vishnu.banavath@arm.com>
References: <20220729162230.45859-1-vishnu.banavath@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Jul 2022 16:23:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3613

From: Vishnu Banavath <vishnu.banavath@arm.com>

This change is to add yocot recipe to support optee-os
3.18.0 version.
Also, move the SRC_URI:append and DEPENDS to optee-os.inc
as these are common accross different optee versions.

Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 meta-arm/recipes-security/optee/optee-os.inc       | 5 +++++
 meta-arm/recipes-security/optee/optee-os_3.14.0.bb | 4 ----
 meta-arm/recipes-security/optee/optee-os_3.17.0.bb | 4 ----
 meta-arm/recipes-security/optee/optee-os_3.18.0.bb | 5 +++++
 4 files changed, 10 insertions(+), 8 deletions(-)
 create mode 100644 meta-arm/recipes-security/optee/optee-os_3.18.0.bb

diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
index 8942facd..aa15e478 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -16,6 +16,11 @@ DEPENDS:append:toolchain-clang = " compiler-rt"
 
 SRC_URI = "git://github.com/OP-TEE/optee_os.git;branch=master;protocol=https"
 
+SRC_URI:append = " \
+    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
+    file://0007-allow-setting-sysroot-for-clang.patch \
+   "
+
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
 
diff --git a/meta-arm/recipes-security/optee/optee-os_3.14.0.bb b/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
index 92e1f88e..83b89c4b 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
@@ -2,8 +2,4 @@ require optee-os.inc
 
 SRCREV = "d21befa5e53eae9db469eba1685f5aa5c6f92c2f"
 
-SRC_URI:append = " \
-    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
-    file://0007-allow-setting-sysroot-for-clang.patch \
-"
 DEPENDS = "python3-pycryptodome-native python3-pyelftools-native"
diff --git a/meta-arm/recipes-security/optee/optee-os_3.17.0.bb b/meta-arm/recipes-security/optee/optee-os_3.17.0.bb
index b81c12f1..3e5e0a69 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.17.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.17.0.bb
@@ -2,8 +2,4 @@ require optee-os.inc
 
 SRCREV = "f9e550142dd4b33ee1112f5dd64ffa94ba79cefa"
 
-SRC_URI:append = " \
-    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
-    file://0007-allow-setting-sysroot-for-clang.patch \
-   "
 DEPENDS += "dtc-native"
diff --git a/meta-arm/recipes-security/optee/optee-os_3.18.0.bb b/meta-arm/recipes-security/optee/optee-os_3.18.0.bb
new file mode 100644
index 00000000..65d661f9
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os_3.18.0.bb
@@ -0,0 +1,5 @@
+require optee-os.inc
+
+DEPENDS += "dtc-native"
+
+SRCREV = "1ee647035939e073a2e8dddb727c0f019cc035f1"
-- 
2.17.1


