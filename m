Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03EEDC46CA3
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 14:53:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.102549.1701788017041504057
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 Dec 2023 06:53:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7608139F
	for <meta-arm@lists.yoctoproject.org>; Tue,  5 Dec 2023 06:54:22 -0800 (PST)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 092FE3F6C4
	for <meta-arm@lists.yoctoproject.org>; Tue,  5 Dec 2023 06:53:35 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm/trusted-firmware-a: move patch file to bbappend
Date: Mon,  4 Dec 2023 11:19:50 -0600
Message-Id: <20231204171952.13471-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 05 Dec 2023 14:53:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5287

TF-A is being patched in the recipe for qemuarm64-secureboot.  This
should be done in the bbappend.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a_%.bbappend        | 6 ++++++
 .../trusted-firmware-a/trusted-firmware-a_2.9.0.bb          | 5 -----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%=
.bbappend b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.=
bbappend
index e58a0902..ca0448f5 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappe=
nd
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappe=
nd
@@ -6,6 +6,12 @@ COMPATIBLE_MACHINE:qemuarm-secureboot =3D "qemuarm-secur=
eboot"
 # arm/aarch32.  This is a known testing hole in TF-A.
 TOOLCHAIN:qemuarm-secureboot =3D "gcc"
=20
+# Enable passing TOS_FW_CONFIG from FIP package to Trusted OS.
+FILESEXTRAPATHS:prepend:qemuarm64-secureboot :=3D "${THISDIR}/files:"
+SRC_URI:append:qemuarm64-secureboot =3D " \
+            file://0001-Add-spmc_manifest-for-qemu.patch \
+        "
+
 TFA_PLATFORM:qemuarm64-secureboot =3D "qemu"
 TFA_PLATFORM:qemu-generic-arm64 =3D "qemu_sbsa"
 TFA_PLATFORM:qemuarm-secureboot =3D "qemu"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.9.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.9.=
0.bb
index 5e526958..31a6a909 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.9.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.9.0.bb
@@ -3,11 +3,6 @@ require trusted-firmware-a.inc
 # TF-A v2.9.0
 SRCREV_tfa =3D "d3e71ead6ea5bc3555ac90a446efec84ef6c6122"
=20
-# Enable passing TOS_FW_CONFIG from FIP package to Trusted OS.
-SRC_URI:append:qemuarm64-secureboot =3D " \
-            file://0001-Add-spmc_manifest-for-qemu.patch \
-        "
-
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3Db2c740efedc159745b9=
b31f88ff03dde"
=20
 # mbedtls-3.4.0
--=20
2.30.2


