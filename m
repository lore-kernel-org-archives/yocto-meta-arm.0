Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6CC1D18131
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 16:54:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.255.1728924890215438910
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Oct 2024 09:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 393B41007
	for <meta-arm@lists.yoctoproject.org>; Mon, 14 Oct 2024 09:55:19 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 758173F58B
	for <meta-arm@lists.yoctoproject.org>; Mon, 14 Oct 2024 09:54:49 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/edk2: update to 202408
Date: Mon, 14 Oct 2024 12:54:47 -0400
Message-Id: <20241014165448.46530-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 14 Oct 2024 16:54:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6189

Update edk2 to the latest stable release tag, and update edk2-platforms
to the last SHA that seems to work.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...ls-native_202405.bb =3D> edk2-basetools-native_202408.bb} | 2 +-
 meta-arm/recipes-bsp/uefi/edk2-firmware_202405.bb          | 7 -------
 meta-arm/recipes-bsp/uefi/edk2-firmware_202408.bb          | 7 +++++++
 meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.4.bb                | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)
 rename meta-arm/recipes-bsp/uefi/{edk2-basetools-native_202405.bb =3D> e=
dk2-basetools-native_202408.bb} (93%)
 delete mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202405.bb
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202408.bb

diff --git a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202405.bb b/=
meta-arm/recipes-bsp/uefi/edk2-basetools-native_202408.bb
similarity index 93%
rename from meta-arm/recipes-bsp/uefi/edk2-basetools-native_202405.bb
rename to meta-arm/recipes-bsp/uefi/edk2-basetools-native_202408.bb
index 851150744c6d..d89a79015a83 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202405.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202408.bb
@@ -10,7 +10,7 @@ LICENSE =3D "BSD-2-Clause-Patent"
 SRC_URI =3D "git://github.com/tianocore/edk2.git;branch=3Dmaster;protoco=
l=3Dhttps"
 LIC_FILES_CHKSUM =3D "file://License.txt;md5=3D2b415520383f7964e96700ae1=
2b4570a"
=20
-SRCREV =3D "3e722403cd16388a0e4044e705a2b34c841d76ca"
+SRCREV =3D "b158dad150bf02879668f72ce306445250838201"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "^edk2-stable(?P<pver>\d+)$"
=20
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202405.bb b/meta-arm=
/recipes-bsp/uefi/edk2-firmware_202405.bb
deleted file mode 100644
index 294a22322d9a..000000000000
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202405.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-SRCREV_edk2           ?=3D "3e722403cd16388a0e4044e705a2b34c841d76ca"
-SRCREV_edk2-platforms ?=3D "59c686673992d7549c2b054773d5d1b5e739a88b"
-
-# FIXME - clang is having issues with antlr
-TOOLCHAIN:aarch64 =3D "gcc"
-
-require recipes-bsp/uefi/edk2-firmware.inc
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202408.bb b/meta-arm=
/recipes-bsp/uefi/edk2-firmware_202408.bb
new file mode 100644
index 000000000000..81bfc0002396
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202408.bb
@@ -0,0 +1,7 @@
+SRCREV_edk2           ?=3D "b158dad150bf02879668f72ce306445250838201"
+SRCREV_edk2-platforms ?=3D "a3c898956a4d48dc5980336fa6ce6eeb23c4f72b"
+
+# FIXME - clang is having issues with antlr
+TOOLCHAIN:aarch64 =3D "gcc"
+
+require recipes-bsp/uefi/edk2-firmware.inc
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.4.bb b/meta-arm/recip=
es-bsp/uefi/sbsa-acs_7.1.4.bb
index 305588d1a11b..b6361346c5b4 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.4.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.4.bb
@@ -1,4 +1,4 @@
-require recipes-bsp/uefi/edk2-firmware_202405.bb
+require recipes-bsp/uefi/edk2-firmware_202408.bb
 PROVIDES:remove =3D "virtual/bootloader"
=20
 LICENSE +=3D "& Apache-2.0"
--=20
2.39.5 (Apple Git-154)


