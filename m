Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAA4CD11C2
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 14:33:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9161.1711031593407815960
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 21 Mar 2024 07:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F53D1063
	for <meta-arm@lists.yoctoproject.org>; Thu, 21 Mar 2024 07:33:47 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E11B63F762
	for <meta-arm@lists.yoctoproject.org>; Thu, 21 Mar 2024 07:33:12 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/7] arm/edk2: update to 202402
Date: Thu, 21 Mar 2024 10:33:07 -0400
Message-Id: <20240321143312.85262-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240321143312.85262-1-jon.mason@arm.com>
References: <20240321143312.85262-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 21 Mar 2024 14:33:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5471

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-bsp/uefi/edk2-firmware_202311.bb               | 0
 ...ls-native_202311.bb =3D> edk2-basetools-native_202402.bb} | 2 +-
 meta-arm/recipes-bsp/uefi/edk2-firmware_202402.bb          | 7 +++++++
 meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.2.bb                | 2 +-
 4 files changed, 9 insertions(+), 2 deletions(-)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-bsp/uefi/edk2-firmware_20231=
1.bb (100%)
 rename meta-arm/recipes-bsp/uefi/{edk2-basetools-native_202311.bb =3D> e=
dk2-basetools-native_202402.bb} (93%)
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202402.bb

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202311.bb b/meta-arm=
-bsp/recipes-bsp/uefi/edk2-firmware_202311.bb
similarity index 100%
rename from meta-arm/recipes-bsp/uefi/edk2-firmware_202311.bb
rename to meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202311.bb
diff --git a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202311.bb b/=
meta-arm/recipes-bsp/uefi/edk2-basetools-native_202402.bb
similarity index 93%
rename from meta-arm/recipes-bsp/uefi/edk2-basetools-native_202311.bb
rename to meta-arm/recipes-bsp/uefi/edk2-basetools-native_202402.bb
index 6bd880bdbc53..bd840967314e 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202311.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202402.bb
@@ -10,7 +10,7 @@ LICENSE =3D "BSD-2-Clause-Patent"
 SRC_URI =3D "git://github.com/tianocore/edk2.git;branch=3Dmaster;protoco=
l=3Dhttps"
 LIC_FILES_CHKSUM =3D "file://License.txt;md5=3D2b415520383f7964e96700ae1=
2b4570a"
=20
-SRCREV =3D "8736b8fdca85e02933cdb0a13309de14c9799ece"
+SRCREV =3D "edc6681206c1a8791981a2f911d2fb8b3d2f5768"
=20
 S =3D "${WORKDIR}/git"
=20
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202402.bb b/meta-arm=
/recipes-bsp/uefi/edk2-firmware_202402.bb
new file mode 100644
index 000000000000..05885315aa8d
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202402.bb
@@ -0,0 +1,7 @@
+SRCREV_edk2           ?=3D "edc6681206c1a8791981a2f911d2fb8b3d2f5768"
+SRCREV_edk2-platforms ?=3D "07842635c80b64c4a979a652104ea1141ba5007a"
+
+# FIXME - clang is having issues with antlr
+TOOLCHAIN:aarch64 =3D "gcc"
+
+require recipes-bsp/uefi/edk2-firmware.inc
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.2.bb b/meta-arm/recip=
es-bsp/uefi/sbsa-acs_7.1.2.bb
index a564e2ac2998..2cc9372dfe5e 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.2.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.2.bb
@@ -1,4 +1,4 @@
-require recipes-bsp/uefi/edk2-firmware_202311.bb
+require recipes-bsp/uefi/edk2-firmware_202402.bb
 PROVIDES:remove =3D "virtual/bootloader"
=20
 LICENSE +=3D "& Apache-2.0"
--=20
2.39.3 (Apple Git-146)


