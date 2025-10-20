Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2EEFCCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 15:09:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.21332.1760972968669619370
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Oct 2025 08:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 689711063
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Oct 2025 08:09:20 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E16F43F66E
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Oct 2025 08:09:27 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/5] arm/edk2-firmware: move the gcc toolchain force to the versioned recipe
Date: Mon, 20 Oct 2025 16:09:23 +0100
Message-ID: <20251020150924.84223-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251020150924.84223-1-jon.mason@arm.com>
References: <20251020150924.84223-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 20 Oct 2025 15:09:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6742

Hopefully this issue can be fixed in a newer release.  Move the
toolchain forcing to the versioned so that it can be tracked easier.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc       | 3 ---
 meta-arm/recipes-bsp/uefi/edk2-firmware_202508.bb | 5 ++++-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recip=
es-bsp/uefi/edk2-firmware.inc
index a5590d3b7274..8b6f153a836c 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -82,9 +82,6 @@ EDK_COMPILER:toolchain-clang =3D "CLANGDWARF"
 export CLANG38_AARCH64_PREFIX =3D "${TARGET_PREFIX}"
 export CLANG38_ARM_PREFIX =3D "${TARGET_PREFIX}"
=20
-#FIXME - arm32 doesn't work with clang due to a linker issue
-TOOLCHAIN:arm =3D "gcc"
-
 do_configure:prepend() {
     sed -i -e "s#-target ${HOST_ARCH}-linux-gnu.*#-target ${HOST_SYS}#" =
${S}/BaseTools/Conf/tools_def.template
 }
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202508.bb b/meta-arm=
/recipes-bsp/uefi/edk2-firmware_202508.bb
index 6a82835f054c..7d766d594d85 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202508.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202508.bb
@@ -3,4 +3,7 @@ require recipes-bsp/uefi/edk2-firmware.inc
 SRCREV_edk2           ?=3D "d46aa46c8361194521391aa581593e556c707c6e"
 SRCREV_edk2-platforms ?=3D "d82aa92c1d360c1b53ccad4dc45bdd8164a560d5"
=20
-SRC_URI +=3D " file://edk2_fix_epoch.patch"
+SRC_URI +=3D "file://edk2_fix_epoch.patch"
+
+#FIXME - arm32 doesn't work with clang due to a linker issue
+TOOLCHAIN:arm =3D "gcc"
--=20
2.50.1 (Apple Git-155)


