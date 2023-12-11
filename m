Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16729C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 14:33:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9647.1702305206761721984
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 Dec 2023 06:33:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED6191007
	for <meta-arm@lists.yoctoproject.org>; Mon, 11 Dec 2023 06:34:12 -0800 (PST)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 45CDE3F738
	for <meta-arm@lists.yoctoproject.org>; Mon, 11 Dec 2023 06:33:26 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2] arm/edk2: update to 202311
Date: Mon, 11 Dec 2023 08:33:16 -0600
Message-Id: <20231211143316.20581-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 11 Dec 2023 14:33:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5302

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...ls-native_202308.bb =3D> edk2-basetools-native_202311.bb} | 2 +-
 meta-arm/recipes-bsp/uefi/edk2-firmware_202308.bb          | 7 -------
 meta-arm/recipes-bsp/uefi/edk2-firmware_202311.bb          | 7 +++++++
 meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.2.bb                | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)
 rename meta-arm/recipes-bsp/uefi/{edk2-basetools-native_202308.bb =3D> e=
dk2-basetools-native_202311.bb} (93%)
 delete mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202308.bb
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202311.bb

diff --git a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202308.bb b/=
meta-arm/recipes-bsp/uefi/edk2-basetools-native_202311.bb
similarity index 93%
rename from meta-arm/recipes-bsp/uefi/edk2-basetools-native_202308.bb
rename to meta-arm/recipes-bsp/uefi/edk2-basetools-native_202311.bb
index 31b8fb08..6bd880bd 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202308.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202311.bb
@@ -10,7 +10,7 @@ LICENSE =3D "BSD-2-Clause-Patent"
 SRC_URI =3D "git://github.com/tianocore/edk2.git;branch=3Dmaster;protoco=
l=3Dhttps"
 LIC_FILES_CHKSUM =3D "file://License.txt;md5=3D2b415520383f7964e96700ae1=
2b4570a"
=20
-SRCREV =3D "819cfc6b42a68790a23509e4fcc58ceb70e1965e"
+SRCREV =3D "8736b8fdca85e02933cdb0a13309de14c9799ece"
=20
 S =3D "${WORKDIR}/git"
=20
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202308.bb b/meta-arm=
/recipes-bsp/uefi/edk2-firmware_202308.bb
deleted file mode 100644
index 2619f2fd..00000000
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202308.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-SRCREV_edk2           ?=3D "819cfc6b42a68790a23509e4fcc58ceb70e1965e"
-SRCREV_edk2-platforms ?=3D "88ea1c2b62d44d6a4ebf2626ddaeecbc74f96877"
-
-# FIXME - clang is having issues with antlr
-TOOLCHAIN:aarch64 =3D "gcc"
-
-require recipes-bsp/uefi/edk2-firmware.inc
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202311.bb b/meta-arm=
/recipes-bsp/uefi/edk2-firmware_202311.bb
new file mode 100644
index 00000000..aa11cfd1
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202311.bb
@@ -0,0 +1,7 @@
+SRCREV_edk2           ?=3D "8736b8fdca85e02933cdb0a13309de14c9799ece"
+SRCREV_edk2-platforms ?=3D "d61836283a4c9198a02387fe7b31a8242e732f3f"
+
+# FIXME - clang is having issues with antlr
+TOOLCHAIN:aarch64 =3D "gcc"
+
+require recipes-bsp/uefi/edk2-firmware.inc
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.2.bb b/meta-arm/recip=
es-bsp/uefi/sbsa-acs_7.1.2.bb
index 781d6e05..a564e2ac 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.2.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.2.bb
@@ -1,4 +1,4 @@
-require recipes-bsp/uefi/edk2-firmware_202308.bb
+require recipes-bsp/uefi/edk2-firmware_202311.bb
 PROVIDES:remove =3D "virtual/bootloader"
=20
 LICENSE +=3D "& Apache-2.0"
--=20
2.30.2


