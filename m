Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D071C41513
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 18:09:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3229.1717524592011006779
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jun 2024 11:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0560B1063
	for <meta-arm@lists.yoctoproject.org>; Tue,  4 Jun 2024 11:10:16 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6589B3F762
	for <meta-arm@lists.yoctoproject.org>; Tue,  4 Jun 2024 11:09:51 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/6] arm/edk2: update to edk2-stable202405
Date: Tue,  4 Jun 2024 14:09:46 -0400
Message-Id: <20240604180949.15501-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240604180949.15501-1-jon.mason@arm.com>
References: <20240604180949.15501-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Jun 2024 18:09:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5787

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...ls-native_202402.bb =3D> edk2-basetools-native_202405.bb} | 2 +-
 meta-arm/recipes-bsp/uefi/edk2-firmware_202402.bb          | 7 -------
 meta-arm/recipes-bsp/uefi/edk2-firmware_202405.bb          | 7 +++++++
 meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.4.bb                | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)
 rename meta-arm/recipes-bsp/uefi/{edk2-basetools-native_202402.bb =3D> e=
dk2-basetools-native_202405.bb} (93%)
 delete mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202402.bb
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202405.bb

diff --git a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202402.bb b/=
meta-arm/recipes-bsp/uefi/edk2-basetools-native_202405.bb
similarity index 93%
rename from meta-arm/recipes-bsp/uefi/edk2-basetools-native_202402.bb
rename to meta-arm/recipes-bsp/uefi/edk2-basetools-native_202405.bb
index 9a1086fc5b24..851150744c6d 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202402.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202405.bb
@@ -10,7 +10,7 @@ LICENSE =3D "BSD-2-Clause-Patent"
 SRC_URI =3D "git://github.com/tianocore/edk2.git;branch=3Dmaster;protoco=
l=3Dhttps"
 LIC_FILES_CHKSUM =3D "file://License.txt;md5=3D2b415520383f7964e96700ae1=
2b4570a"
=20
-SRCREV =3D "edc6681206c1a8791981a2f911d2fb8b3d2f5768"
+SRCREV =3D "3e722403cd16388a0e4044e705a2b34c841d76ca"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "^edk2-stable(?P<pver>\d+)$"
=20
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202402.bb b/meta-arm=
/recipes-bsp/uefi/edk2-firmware_202402.bb
deleted file mode 100644
index 05885315aa8d..000000000000
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202402.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-SRCREV_edk2           ?=3D "edc6681206c1a8791981a2f911d2fb8b3d2f5768"
-SRCREV_edk2-platforms ?=3D "07842635c80b64c4a979a652104ea1141ba5007a"
-
-# FIXME - clang is having issues with antlr
-TOOLCHAIN:aarch64 =3D "gcc"
-
-require recipes-bsp/uefi/edk2-firmware.inc
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202405.bb b/meta-arm=
/recipes-bsp/uefi/edk2-firmware_202405.bb
new file mode 100644
index 000000000000..294a22322d9a
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202405.bb
@@ -0,0 +1,7 @@
+SRCREV_edk2           ?=3D "3e722403cd16388a0e4044e705a2b34c841d76ca"
+SRCREV_edk2-platforms ?=3D "59c686673992d7549c2b054773d5d1b5e739a88b"
+
+# FIXME - clang is having issues with antlr
+TOOLCHAIN:aarch64 =3D "gcc"
+
+require recipes-bsp/uefi/edk2-firmware.inc
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.4.bb b/meta-arm/recip=
es-bsp/uefi/sbsa-acs_7.1.4.bb
index a29c16ecb466..305588d1a11b 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.4.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.4.bb
@@ -1,4 +1,4 @@
-require recipes-bsp/uefi/edk2-firmware_202402.bb
+require recipes-bsp/uefi/edk2-firmware_202405.bb
 PROVIDES:remove =3D "virtual/bootloader"
=20
 LICENSE +=3D "& Apache-2.0"
--=20
2.39.3 (Apple Git-146)


