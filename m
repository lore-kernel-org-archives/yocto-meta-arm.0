Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04EB0EB64DD
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 17:50:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.114424.1692035449444882270
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Aug 2023 10:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49F79143D
	for <meta-arm@lists.yoctoproject.org>; Mon, 14 Aug 2023 10:51:31 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DAE6C3F762
	for <meta-arm@lists.yoctoproject.org>; Mon, 14 Aug 2023 10:50:48 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH mickledore 2/3] arm/linux-yocto: move 6.1 patches to a unique bbappend
Date: Mon, 14 Aug 2023 12:50:41 -0500
Message-Id: <20230814175042.3629846-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230814175042.3629846-1-jon.mason@arm.com>
References: <20230814175042.3629846-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 14 Aug 2023 17:50:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4956

Move the 3 patches only needed by the 6.1 kernel into a unique bbappend
The defconfig changes cannot be moved into a config fragment because
they only exist in the defconfig file (because the patches that
integrated their functionality into the kernel were not merged).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-kernel/linux/linux-yocto%.bbappend        | 6 ------
 meta-arm/recipes-kernel/linux/linux-yocto-rt_6.1%.bbappend | 6 ++++++
 meta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappend    | 6 ++++++
 3 files changed, 12 insertions(+), 6 deletions(-)
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-rt_6.1%.bba=
ppend
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappe=
nd

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend b/meta-a=
rm/recipes-kernel/linux/linux-yocto%.bbappend
index 883ed2ca..0a42ce4a 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
@@ -1,11 +1,5 @@
 ARMFILESPATHS :=3D "${THISDIR}/files:"
=20
-FILESEXTRAPATHS:prepend:aarch64 =3D "${ARMFILESPATHS}"
-SRC_URI:append:aarch64 =3D " \
-    file://0001-Revert-arm64-defconfig-Enable-Tegra-MGBE-driver.patch \
-    file://0002-Revert-arm64-defconfig-Add-Nuvoton-NPCM-family-suppo.pat=
ch \
-    "
-
 COMPATIBLE_MACHINE:generic-arm64 =3D "generic-arm64"
 FILESEXTRAPATHS:prepend:generic-arm64 =3D "${ARMFILESPATHS}"
 SRC_URI:append:generic-arm64 =3D " \
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto-rt_6.1%.bbappend b=
/meta-arm/recipes-kernel/linux/linux-yocto-rt_6.1%.bbappend
new file mode 100644
index 00000000..e6d50a4b
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto-rt_6.1%.bbappend
@@ -0,0 +1,6 @@
+
+FILESEXTRAPATHS:prepend:aarch64 =3D "${ARMFILESPATHS}"
+SRC_URI:append:aarch64 =3D " \
+    file://0001-Revert-arm64-defconfig-Enable-Tegra-MGBE-driver.patch \
+    file://0002-Revert-arm64-defconfig-Add-Nuvoton-NPCM-family-suppo.pat=
ch \
+    "
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappend b/me=
ta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappend
new file mode 100644
index 00000000..e6d50a4b
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappend
@@ -0,0 +1,6 @@
+
+FILESEXTRAPATHS:prepend:aarch64 =3D "${ARMFILESPATHS}"
+SRC_URI:append:aarch64 =3D " \
+    file://0001-Revert-arm64-defconfig-Enable-Tegra-MGBE-driver.patch \
+    file://0002-Revert-arm64-defconfig-Add-Nuvoton-NPCM-family-suppo.pat=
ch \
+    "
--=20
2.30.2


