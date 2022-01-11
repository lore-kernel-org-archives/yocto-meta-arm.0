Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA571C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 18:30:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.11751.1641925849052102615
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 10:30:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92DF8ED1
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 Jan 2022 10:30:48 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E7033F766
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 Jan 2022 10:30:48 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm-bsp/edk2-firmware: enable building EDK2 for Juno
Date: Tue, 11 Jan 2022 18:30:43 +0000
Message-Id: <20220111183044.3220036-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111183044.3220036-1-ross.burton@arm.com>
References: <20220111183044.3220036-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Jan 2022 18:30:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2815

This doesn't build successfully with Clang, so for now the build forces
the use of GCC.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-juno.inc   | 10 ++++++++++
 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend |  1 +
 2 files changed, 11 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-juno.inc

diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-juno.inc b/meta-=
arm-bsp/recipes-bsp/uefi/edk2-firmware-juno.inc
new file mode 100644
index 00000000..076c551a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-juno.inc
@@ -0,0 +1,10 @@
+EDK2_PLATFORM      =3D "ArmJuno"
+EDK2_PLATFORM_DSC  =3D "Platform/ARM/JunoPkg/ArmJuno.dsc"
+EDK2_BIN_NAME      =3D "BL33_AP_UEFI.fd"
+
+COMPATIBLE_MACHINE =3D "juno"
+
+# As of 2022-01-10 the Juno build fails with Clang:
+# edk2-firmware/202111-r0/edk2/edk2-platforms/Platform/ARM/Library/ArmSh=
ellCmdRunAxf/RunAxf.c:216:11:
+# error: variable 'FileSize' is used uninitialized whenever 'if' conditi=
on is false [-Werror,-Wsometimes-uninitialized]
+TOOLCHAIN =3D "gcc"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend b/met=
a-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend
index bb3845d1..e5018bb0 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend
@@ -3,6 +3,7 @@
 MACHINE_EDK2_REQUIRE ?=3D ""
=20
 MACHINE_EDK2_REQUIRE:fvp-base =3D "edk2-firmware-fvp-base.inc"
+MACHINE_EDK2_REQUIRE:juno =3D "edk2-firmware-juno.inc"
 MACHINE_EDK2_REQUIRE:sgi575 =3D "edk2-firmware-sgi575.inc"
 MACHINE_EDK2_REQUIRE:n1sdp =3D "edk2-firmware-n1sdp.inc"
=20
--=20
2.25.1


