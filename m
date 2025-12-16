Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E161D609CE
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 16:23:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26761.1765902207453087434
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 08:23:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6AC3FEC
	for <meta-arm@lists.yoctoproject.org>; Tue, 16 Dec 2025 08:23:19 -0800 (PST)
Received: from e133390.cambridge.arm.com (unknown [10.1.198.56])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B10EE3F73F
	for <meta-arm@lists.yoctoproject.org>; Tue, 16 Dec 2025 08:23:26 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/4] arm/classes-recipe: Introduce firmware.bbclass
Date: Tue, 16 Dec 2025 16:23:07 +0000
Message-ID: <20251216162311.3985918-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Dec 2025 16:23:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6801

There are now a handful of firmware component recipes in meta-arm, each
of which does its own (slightly different) deployment handling.

Introduce a bbclass to standardize this, with the aim of cleaning up the
DEPLOY_DIR_IMAGE. Crucially, each firmware component deploys into a
${PN} subdirectory of DEPLOY_DIR_IMAGE. This has a few advantages:

 * Many Arm components have the same or similar binary names (BL1, BL2
   etc). This ensures unique naming and avoids confusion.
 * Recipes can afford to be less picky about which binaries are deployed.
   This simplifies component recipes.
 * It is easier to deploy debug symbols in a common way to an expected
   location.
 * It keeps the DEPLOY_DIR_IMAGE clean in the face of ever-increasing
   firmware complexity.

The bbclass also provides a FIRMWARE_DEBUG_BUILD variable to control the
build type of the firmware in one place, defaulting to the global
DEBUG_BUILD. This should allow BSPs in meta-arm-bsp to more easily
provide a release build by default (by providing an easy switch for
development purposes when needed).

Signed-off-by: Peter Hoyes <peter.hoyes@arm.com>
---
 meta-arm/classes-recipe/firmware.bbclass | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-arm/classes-recipe/firmware.bbclass

diff --git a/meta-arm/classes-recipe/firmware.bbclass b/meta-arm/classes-=
recipe/firmware.bbclass
new file mode 100644
index 00000000..575f2cf0
--- /dev/null
+++ b/meta-arm/classes-recipe/firmware.bbclass
@@ -0,0 +1,27 @@
+# Common configuration for Arm firmware components
+
+# Firmware packages are always machine-specific
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+# Allow all firmware to be debugged together
+FIRMWARE_DEBUG_BUILD ?=3D "${@oe.utils.vartrue('DEBUG_BUILD', '1', '0', =
d)}"
+
+# Use ${MACHINE} as the default platform name for firmware
+FIRMWARE_PLATFORM ?=3D "${MACHINE}"
+
+# Provide a standard folder layout for firmware packages
+FIRMWARE_BASE_DIR ?=3D "/firmware"
+FIRMWARE_DIR ?=3D "${FIRMWARE_BASE_DIR}/${PN}"
+FILES:${PN} =3D "${FIRMWARE_DIR}/*.bin"
+FILES:${PN}-dbg =3D "${FIRMWARE_DIR}/*.elf"
+SYSROOT_DIRS +=3D "${FIRMWARE_DIR}"
+
+# Provide a default deploy implementation, which deploys to a subdirecto=
ry
+# of ${DEPLOY_DIR_IMAGE}
+inherit deploy
+
+do_deploy() {
+    install -d ${DEPLOYDIR}/${PN}
+    cp -rf ${D}${FIRMWARE_DIR}/* ${DEPLOYDIR}/${PN}
+}
+addtask deploy after do_install
--=20
2.43.0


