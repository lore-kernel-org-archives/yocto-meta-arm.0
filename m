Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C28C3601E
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 03:25:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16745.1744341936377541227
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Apr 2025 20:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8018C106F
	for <meta-arm@lists.yoctoproject.org>; Thu, 10 Apr 2025 20:25:35 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 295763F694
	for <meta-arm@lists.yoctoproject.org>; Thu, 10 Apr 2025 20:25:35 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm/edk2-firmware: add version to be printed out
Date: Thu, 10 Apr 2025 23:25:30 -0400
Message-Id: <20250411032532.10270-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Apr 2025 03:25:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6456

Currently, the version number is not being specified, which is causing
the version to be printed as an empty string.  Such as:
    UEFI firmware (version  built at 00:50:36 on Feb 21 2025)
and
    Tianocore/EDK2 firmware version

Add the package version as the version to be printed out, which results
in:
    UEFI firmware (version 202502 built at 00:50:36 on Feb 21 2025)
and
    Tianocore/EDK2 firmware version 202502

An intermediate variable was used instead of PV to allow for the
variable to be overridden if necessary.

Also, minor white space clean-up to match the style in the rest of the
file.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recip=
es-bsp/uefi/edk2-firmware.inc
index 5475b0a1bc5c..6d86a68f6ed5 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -22,7 +22,7 @@ SRC_URI =3D "\
     ${SRC_URI_EDK2_PLATFORMS};branch=3D${SRCBRANCH_edk2_platforms};name=3D=
edk2-platforms;destsuffix=3Dedk2/edk2-platforms \
 "
=20
-SRCREV_FORMAT         =3D "edk2_edk2-platforms"
+SRCREV_FORMAT =3D "edk2_edk2-platforms"
 UPSTREAM_CHECK_GITTAGREGEX =3D "^edk2-stable(?P<pver>\d+)$"
=20
 COMPATIBLE_MACHINE ?=3D "invalid"
@@ -42,6 +42,9 @@ EDK2_ARCH:x86      =3D "IA32"
 EDK2_ARCH:x86-64   =3D "X64"
 EDK2_ARCH:riscv64  =3D "RISCV64"
=20
+# Use the package version as the version to be printed out but allow for=
 it to be overridden
+EDK2_VERSION ?=3D "${PV}"
+
 # Extra arguments passed to build
 EDK2_EXTRA_BUILD   =3D ""
=20
@@ -115,6 +118,7 @@ do_compile() {
        --tagname ${EDK_COMPILER} \
        --platform ${EDK2_PLATFORM_DSC} \
        ${@oe.utils.parallel_make_argument(d, "-n %d")} \
+       -D FIRMWARE_VER=3D"${EDK2_VERSION}" \
        ${EDK2_EXTRA_BUILD}
 }
=20
--=20
2.39.5 (Apple Git-154)


