Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B9C1EB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 15:34:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.266.1689867276279073819
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Jul 2023 08:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2951AD75
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 Jul 2023 08:35:19 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9F3C23F738
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 Jul 2023 08:34:35 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/linux-yocto: move 6.1 patches to a unique bbappend
Date: Thu, 20 Jul 2023 10:34:30 -0500
Message-Id: <20230720153430.3580005-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230720153430.3580005-1-jon.mason@arm.com>
References: <20230720153430.3580005-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Jul 2023 15:34:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4911

Move the 3 patches only needed by the 6.1 kernel into a unique bbappend
The defconfig changes cannot be moved into a config fragment because
they only exist in the defconfig file (because the patches that
integrated their functionality into the kernel were not merged).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-kernel/linux/linux-yocto%.bbappend        | 7 -------
 meta-arm/recipes-kernel/linux/linux-yocto-rt_6.1%.bbappend | 7 +++++++
 meta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappend    | 7 +++++++
 3 files changed, 14 insertions(+), 7 deletions(-)
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-rt_6.1%.bba=
ppend
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappe=
nd

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend b/meta-a=
rm/recipes-kernel/linux/linux-yocto%.bbappend
index 3f2c83fd..0a42ce4a 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
@@ -1,12 +1,5 @@
 ARMFILESPATHS :=3D "${THISDIR}/files:"
=20
-FILESEXTRAPATHS:prepend:aarch64 =3D "${ARMFILESPATHS}"
-SRC_URI:append:aarch64 =3D " \
-    file://0001-Revert-arm64-defconfig-Enable-Tegra-MGBE-driver.patch \
-    file://0002-Revert-arm64-defconfig-Add-Nuvoton-NPCM-family-suppo.pat=
ch \
-    file://0001-gcc-plugins-Reorganize-gimple-includes-for-GCC-13.patch =
\
-    "
-
 COMPATIBLE_MACHINE:generic-arm64 =3D "generic-arm64"
 FILESEXTRAPATHS:prepend:generic-arm64 =3D "${ARMFILESPATHS}"
 SRC_URI:append:generic-arm64 =3D " \
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto-rt_6.1%.bbappend b=
/meta-arm/recipes-kernel/linux/linux-yocto-rt_6.1%.bbappend
new file mode 100644
index 00000000..d0a0ff0e
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto-rt_6.1%.bbappend
@@ -0,0 +1,7 @@
+
+FILESEXTRAPATHS:prepend:aarch64 =3D "${ARMFILESPATHS}"
+SRC_URI:append:aarch64 =3D " \
+    file://0001-Revert-arm64-defconfig-Enable-Tegra-MGBE-driver.patch \
+    file://0002-Revert-arm64-defconfig-Add-Nuvoton-NPCM-family-suppo.pat=
ch \
+    file://0001-gcc-plugins-Reorganize-gimple-includes-for-GCC-13.patch =
\
+    "
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappend b/me=
ta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappend
new file mode 100644
index 00000000..d0a0ff0e
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappend
@@ -0,0 +1,7 @@
+
+FILESEXTRAPATHS:prepend:aarch64 =3D "${ARMFILESPATHS}"
+SRC_URI:append:aarch64 =3D " \
+    file://0001-Revert-arm64-defconfig-Enable-Tegra-MGBE-driver.patch \
+    file://0002-Revert-arm64-defconfig-Add-Nuvoton-NPCM-family-suppo.pat=
ch \
+    file://0001-gcc-plugins-Reorganize-gimple-includes-for-GCC-13.patch =
\
+    "
--=20
2.30.2


