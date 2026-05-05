Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7BB8CD3427
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 12:34:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37733.1777984449735020549
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 May 2026 05:34:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=foss header.b=EzRtQ3qA;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90A912308
	for <meta-arm@lists.yoctoproject.org>; Tue,  5 May 2026 05:34:03 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DED023F763
	for <meta-arm@lists.yoctoproject.org>; Tue,  5 May 2026 05:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777984449; bh=Fn3h08rMv33NFey4iavWWxcCf0lHozlLdcj/Q4FLm0w=;
	h=From:To:Subject:Date:From;
	b=EzRtQ3qAeCjqQoDKyExU/rTwDhCsMSWJPeymhUlc9bym/bNKt7ZsZwojAIfuAP8Ke
	 hb447xclBt5ZGFYbqVJyrernw97uUq5F5MEOBiKa/B5RlfzYF+7PZ7eyy2tEUtLrCR
	 bKqv2jMS5jwSZxSxIX2MKHr0I2cYKnl8o0oR3Bkk=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/edk2-firmware: workaround apcica changes
Date: Tue,  5 May 2026 08:34:08 -0400
Message-ID: <20260505123408.41657-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 05 May 2026 12:34:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7035

With the latest version of acpica (20260408), the following error is
being encountered in edk2 platforms for Arm SGI

| "iasl"  -p/builder/meta-arm/build/tmp/work/rdn2-poky-linux/edk2-firmware/=
202602/build/Build/RdN2/DEBUG_GCC5/AARCH64/Platform/ARM/SgiPkg/AcpiTables/R=
dN2AcpiTables/OUTPUT/./SsdtEvents.aml /builder/meta-arm/build/tmp/work/rdn2=
-poky-linux/edk2-firmware/202602/build/Build/RdN2/DEBUG_GCC5/AARCH64/Platfo=
rm/ARM/SgiPkg/AcpiTables/RdN2AcpiTables/OUTPUT/./SsdtEvents.iiii
| /builder/meta-arm/build/tmp/work/rdn2-poky-linux/edk2-firmware/202602/bui=
ld/Build/RdN2/DEBUG_GCC5/AARCH64/Platform/ARM/SgiPkg/AcpiTables/RdN2AcpiTab=
les/OUTPUT/./SsdtEvents.iiii     61:       Printf ("GPIO0 Pin0 Toggled")
| Error    6010 -                                                          =
                                                                           =
                                             Internal compiler error ^  (In=
valid parse opcode in OpcGenerateAmlOpcode)

Since this appears to be a debug message, and the relevant platforms are
a work in progress.  Work around this issue by removing the printf.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-bsp/uefi/edk2-firmware-rdn2.inc   |  3 +++
 .../recipes-bsp/uefi/edk2-firmware-rdv2.inc   |  3 +++
 ...a-20260408-are-now-causing-issues-wi.patch | 24 +++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/0001-Changes-in-acp=
ica-20260408-are-now-causing-issues-wi.patch

diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-rdn2.inc b/meta-ar=
m-bsp/recipes-bsp/uefi/edk2-firmware-rdn2.inc
index ef069c789055..e020c5d87b29 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-rdn2.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-rdn2.inc
@@ -9,6 +9,9 @@ COMPATIBLE_MACHINE =3D "rdn2"
 SRC_URI_EDK2 =3D "gitsm://gitlab.arm.com/infra-solutions/reference-design/=
platsw/edk2.git;protocol=3Dhttps"
 SRC_URI_EDK2_PLATFORMS =3D "git://gitlab.arm.com/infra-solutions/reference=
-design/platsw/edk2-platforms.git;protocol=3Dhttps"
=20
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
+SRC_URI:append =3D " file://0001-Changes-in-acpica-20260408-are-now-causin=
g-issues-wi.patch;patchdir=3Dedk2-platforms"
+
 SRCBRANCH_edk2 =3D "refinfra"
 SRCBRANCH_edk2_platforms =3D "refinfra"
=20
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-rdv2.inc b/meta-ar=
m-bsp/recipes-bsp/uefi/edk2-firmware-rdv2.inc
index c2fd6fecfd32..89126c5fdcff 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-rdv2.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-rdv2.inc
@@ -9,6 +9,9 @@ COMPATIBLE_MACHINE =3D "rdv2"
 SRC_URI_EDK2 =3D "gitsm://gitlab.arm.com/infra-solutions/reference-design/=
platsw/edk2.git;protocol=3Dhttps"
 SRC_URI_EDK2_PLATFORMS =3D "git://gitlab.arm.com/infra-solutions/reference=
-design/platsw/edk2-platforms.git;protocol=3Dhttps"
=20
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
+SRC_URI:append =3D " file://0001-Changes-in-acpica-20260408-are-now-causin=
g-issues-wi.patch;patchdir=3Dedk2-platforms"
+
 SRCBRANCH_edk2 =3D "refinfra"
 SRCBRANCH_edk2_platforms =3D "refinfra"
=20
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/0001-Changes-in-acpica-202=
60408-are-now-causing-issues-wi.patch b/meta-arm-bsp/recipes-bsp/uefi/files=
/0001-Changes-in-acpica-20260408-are-now-causing-issues-wi.patch
new file mode 100644
index 000000000000..67faa7e025ee
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/files/0001-Changes-in-acpica-20260408-a=
re-now-causing-issues-wi.patch
@@ -0,0 +1,24 @@
+From 075fc90da4636b8bca9c21b8527364b31498eeaf Mon Sep 17 00:00:00 2001
+From: Jon Mason <jon.mason@arm.com>
+Date: Mon, 4 May 2026 14:40:05 -0400
+Subject: [PATCH] Changes in acpica 20260408 are now causing issues with the
+ Printf in SsdrEvents.asl.  Since this is probably for debug, remove it.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+---
+ Platform/ARM/SgiPkg/AcpiTables/SsdtEvents.asl | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Platform/ARM/SgiPkg/AcpiTables/SsdtEvents.asl b/Platform/ARM/=
SgiPkg/AcpiTables/SsdtEvents.asl
+index 58efe62c93ea..61489513f61b 100644
+--- a/Platform/ARM/SgiPkg/AcpiTables/SsdtEvents.asl
++++ b/Platform/ARM/SgiPkg/AcpiTables/SsdtEvents.asl
+@@ -56,7 +56,6 @@ DefinitionBlock("SsdtEvent.aml", "SSDT", 2, "ARMLTD", "A=
RMSGI", EFI_ACPI_ARM_OEM
+ =0D
+     /* Event handler for pin0 */=0D
+     Method (_L00) {=0D
+-      Printf ("GPIO0 Pin0 Toggled")=0D
+       Store (1, INC0)=0D
+     }=0D
+ =0D
--=20
2.50.1 (Apple Git-155)


