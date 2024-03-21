Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FD1C54E58
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 14:34:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9270.1711031666843319292
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 21 Mar 2024 07:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC6941007
	for <meta-arm@lists.yoctoproject.org>; Thu, 21 Mar 2024 07:35:00 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5BC813F762
	for <meta-arm@lists.yoctoproject.org>; Thu, 21 Mar 2024 07:34:26 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm/scp-firmware: update to v2.14.0
Date: Thu, 21 Mar 2024 10:34:23 -0400
Message-Id: <20240321143425.85379-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 21 Mar 2024 14:34:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5477

Update to the latest version of SCP.  In this release, some of the
platforms were grouped into common family directories, which
necessitated adding a variable to specify which one.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-bsp/scp-firmware/scp-firmware-sgi575.inc      | 1 +
 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc | 1 +
 .../{scp-firmware_2.13.0.bb =3D> scp-firmware_2.14.0.bb}    | 8 +++-----
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-arm/recipes-bsp/scp-firmware/{scp-firmware_2.13.0.bb =3D> sc=
p-firmware_2.14.0.bb} (94%)

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.in=
c b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.inc
index 3413822a6413..79a41a06f66d 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.inc
@@ -1,5 +1,6 @@
 # SGI575 specific SCP configurations and build instructions
=20
 COMPATIBLE_MACHINE:sgi575 =3D "sgi575"
+SCP_PRODUCT_GROUP =3D "neoverse-rd"
=20
 SCP_LOG_LEVEL =3D "INFO"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc b/=
meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
index 2c6563573f3a..87160598d5cb 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
@@ -1,5 +1,6 @@
 # TC specific SCP configuration
=20
 COMPATIBLE_MACHINE =3D "(tc1)"
+SCP_PRODUCT_GROUP =3D "totalcompute"
=20
 FW_TARGETS =3D "scp"
diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.13.0.bb b/m=
eta-arm/recipes-bsp/scp-firmware/scp-firmware_2.14.0.bb
similarity index 94%
rename from meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.13.0.bb
rename to meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.14.0.bb
index 18867b03915b..c0e40d903e12 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.13.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.14.0.bb
@@ -12,12 +12,13 @@ SRC_URI =3D "${SRC_URI_SCP_FIRMWARE};branch=3D${SRCBR=
ANCH} \
           "
=20
 SRCBRANCH =3D "main"
-SRCREV  =3D "cc4c9e017348d92054f74026ee1beb081403c168"
+SRCREV  =3D "3267f2964114a56faaf46a40704be6ca78240725"
=20
 PROVIDES +=3D "virtual/control-processor-firmware"
=20
 CMAKE_BUILD_TYPE    ?=3D "RelWithDebInfo"
 SCP_PLATFORM        ?=3D "${MACHINE}"
+SCP_PRODUCT_GROUP   ?=3D "."
 SCP_LOG_LEVEL       ?=3D "WARN"
 SCP_PLATFORM_FEATURE_SET ?=3D "0"
=20
@@ -30,9 +31,6 @@ DEPENDS =3D "gcc-arm-none-eabi-native \
 # For now we only build with GCC, so stop meta-clang trying to get invol=
ved
 TOOLCHAIN =3D "gcc"
=20
-# remove once arm-none-eabi-gcc updates to 13 or newer like poky
-DEBUG_PREFIX_MAP:remove =3D "-fcanon-prefix-map"
-
 inherit deploy
=20
 B =3D "${WORKDIR}/build"
@@ -61,7 +59,7 @@ do_configure() {
     for FW in ${FW_TARGETS}; do
         for TYPE in ${FW_INSTALL}; do
             bbnote Configuring ${SCP_PLATFORM}/${FW}_${TYPE}...
-            cmake -GNinja ${EXTRA_OECMAKE} -S ${S} -B "${B}/${TYPE}/${FW=
}" -D SCP_FIRMWARE_SOURCE_DIR:PATH=3D"${SCP_PLATFORM}/${FW}_${TYPE}"
+            cmake -GNinja ${EXTRA_OECMAKE} -S ${S} -B "${B}/${TYPE}/${FW=
}" -D SCP_FIRMWARE_SOURCE_DIR:PATH=3D"${SCP_PRODUCT_GROUP}/${SCP_PLATFORM=
}/${FW}_${TYPE}"
         done
     done
 }
--=20
2.39.3 (Apple Git-146)


