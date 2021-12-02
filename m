Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 007E7C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 20:28:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.2489.1638476928954323883
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Dec 2021 12:28:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C5321435
	for <meta-arm@lists.yoctoproject.org>; Thu,  2 Dec 2021 12:28:47 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8EEB3F766
	for <meta-arm@lists.yoctoproject.org>; Thu,  2 Dec 2021 12:28:46 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/edk2-firmware: force debug builds when using Clang
Date: Thu,  2 Dec 2021 20:28:43 +0000
Message-Id: <20211202202844.2555322-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 02 Dec 2021 20:28:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2511

edk2-firmware release builds with clang fail:

MdePkg/Library/UefiMemoryAllocationLib/MemoryAllocationLib.c:142:15:
error: variable 'Status' set but not used [-Werror,-Wunused-but-set-varia=
ble]

This is upstream as https://bugzilla.tianocore.org/show_bug.cgi?id=3D3758=
,
but until that is resolved we can just force debug builds with clang.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recip=
es-bsp/uefi/edk2-firmware.inc
index 7072d1b4..dd428d41 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -26,6 +26,10 @@ COMPATIBLE_MACHINE ?=3D "invalid"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 EDK2_BUILD_RELEASE =3D "1"
+# Release builds don't work with clang yet:
+# https://bugzilla.tianocore.org/show_bug.cgi?id=3D3758
+EDK2_BUILD_RELEASE:toolchain-clang =3D "0"
+
 EDK2_PLATFORM      =3D "unset"
 # build --platform
 EDK2_PLATFORM_DSC  =3D "unset"
@@ -110,3 +114,4 @@ do_deploy() {
     cp -rf ${D}/firmware/* ${DEPLOYDIR}/
 }
 addtask deploy after do_install
+TOOLCHAIN =3D "clang"
\ No newline at end of file
--=20
2.25.1


