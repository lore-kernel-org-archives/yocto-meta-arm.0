Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DDA8C001CC
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 21:14:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.31991.1712870063201597113
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Apr 2024 14:14:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34B5711FB;
	Thu, 11 Apr 2024 14:14:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C8223F766;
	Thu, 11 Apr 2024 14:14:22 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] arm-bsp/trusted-firmware-a: remove now-unused 2.9.0 recipe
Date: Thu, 11 Apr 2024 21:14:16 +0000
Message-Id: <20240411211416.2806039-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411211416.2806039-1-ross.burton@arm.com>
References: <20240411211416.2806039-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 21:14:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5534

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../fiptool-native_2.9.0.bb                   | 33 -------------------
 .../trusted-firmware-a_2.9.0.bb               | 16 ---------
 2 files changed, 49 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/fiptool-n=
ative_2.9.0.bb
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a_2.9.0.bb

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/fiptool-native_2=
.9.0.bb b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/fiptool-native_2.9.=
0.bb
deleted file mode 100644
index 58ee1dca..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/fiptool-native_2.9.0.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-# Firmware Image Package (FIP)
-# It is a packaging format used by TF-A to package the
-# firmware images in a single binary.
-
-DESCRIPTION =3D "fiptool - Trusted Firmware tool for packaging"
-LICENSE =3D "BSD-3-Clause"
-
-SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://git.trustedfirmware.org/TF-A/trus=
ted-firmware-a.git;protocol=3Dhttps"
-SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};destsuffix=3Dfiptool-${PV};br=
anch=3D${SRCBRANCH}"
-LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3Db2c740efedc159745b9b=
31f88ff03dde"
-
-# Use fiptool from TF-A v2.9.0
-SRCREV =3D "d3e71ead6ea5bc3555ac90a446efec84ef6c6122"
-SRCBRANCH =3D "master"
-
-DEPENDS +=3D "openssl-native"
-
-inherit native
-
-EXTRA_OEMAKE =3D "V=3D1 HOSTCC=3D'${BUILD_CC}' OPENSSL_DIR=3D${STAGING_D=
IR_NATIVE}/${prefix_native}"
-
-do_compile () {
-    # This is still needed to have the native fiptool executing properly=
 by
-    # setting the RPATH
-    sed -i '/^LDLIBS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makef=
ile
-    sed -i '/^INCLUDE_PATHS/ s,$, \$\{BUILD_CFLAGS},' ${S}/tools/fiptool=
/Makefile
-
-    oe_runmake fiptool
-}
-
-do_install () {
-    install -D -p -m 0755 tools/fiptool/fiptool ${D}${bindir}/fiptool
-}
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.9.0.bb b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a_2.9.0.bb
deleted file mode 100644
index d9fdf329..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.9.=
0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
-
-# TF-A v2.9.0
-SRCREV_tfa =3D "d3e71ead6ea5bc3555ac90a446efec84ef6c6122"
-
-LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3Db2c740efedc159745b9=
b31f88ff03dde"
-
-# mbedtls-3.4.0
-SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmaster"
-SRCREV_mbedtls =3D "1873d3bfc2da771672bd8e7e8f41f57e0af77f33"
-
-LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D3b83ef96387f1=
4655fc854ddc3c6bd57"
-
-do_compile:prepend() {
-    sed -i '/^LDLIBS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makef=
ile
-}
--=20
2.34.1


