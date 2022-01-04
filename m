Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 753F5C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 21:06:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.186.1641330361720583704
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jan 2022 13:06:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F422E12FC
	for <meta-arm@lists.yoctoproject.org>; Tue,  4 Jan 2022 13:06:00 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F7C83F66F
	for <meta-arm@lists.yoctoproject.org>; Tue,  4 Jan 2022 13:06:00 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-bsp/trusted-firmware-a: upgrade TC to 2.6
Date: Tue,  4 Jan 2022 21:05:58 +0000
Message-Id: <20220104210558.3504309-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220104210558.3504309-1-ross.burton@arm.com>
References: <20220104210558.3504309-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Jan 2022 21:06:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2791

Upgrade TC's TF-A from a post-2.5 snapshot to the 2.6 release.

This means increasing the maximum size of BL31.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/include/tc.inc              |  2 --
 .../0001-plat-tc-Increase-maximum-BL2-size.patch      | 11 ++++++++++-
 .../trusted-firmware-a/trusted-firmware-a-tc.inc      |  5 -----
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/include/tc.inc b/meta-arm-bsp/conf=
/machine/include/tc.inc
index 9f0239bb..abdbfd3d 100644
--- a/meta-arm-bsp/conf/machine/include/tc.inc
+++ b/meta-arm-bsp/conf/machine/include/tc.inc
@@ -21,8 +21,6 @@ UBOOT_SIGN_KEYNAME =3D "dev_key"
 UBOOT_SIGN_KEYDIR =3D "${DEPLOY_DIR_IMAGE}/keys"
 FIT_GENERATE_KEYS =3D "1"
=20
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.5%"
-
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-arm64-ack"
 PREFERRED_VERSION_linux-arm64-ack ?=3D "5.10"
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/0001-plat-=
tc-Increase-maximum-BL2-size.patch b/meta-arm-bsp/recipes-bsp/trusted-fir=
mware-a/files/0001-plat-tc-Increase-maximum-BL2-size.patch
index 22d32576..b6a5b4de 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/0001-plat-tc-Incr=
ease-maximum-BL2-size.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/0001-plat-tc-Incr=
ease-maximum-BL2-size.patch
@@ -27,8 +27,17 @@ index ccabced9e..f45457b9f 100644
 -# define PLAT_ARM_MAX_BL2_SIZE		0x14000
 +# define PLAT_ARM_MAX_BL2_SIZE		0x16000
  #endif
-=20
+
+ /*
+@@ -130,7 +130,7 @@
+  * calculated using the current BL31 PROGBITS debug size plus the sizes=
 of
+  * BL2 and BL1-RW
+  */
+-#define PLAT_ARM_MAX_BL31_SIZE		0x3F000
++#define PLAT_ARM_MAX_BL31_SIZE		0x4F000
+
  /*
+  * Size of cacheable stacks
 --=20
 2.17.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-tc.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a-tc.inc
index f47856b2..19b46230 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.i=
nc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.i=
nc
@@ -1,10 +1,5 @@
 # TC0 specific TFA configuration
=20
-# Intermediate SHA with 2.5 baseline version
-SRCREV_tfa =3D "34a87d74d9fbbe8037431ea5101110a9f1cf30e1"
-PV =3D "2.5+git${SRCPV}"
-LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3Db2c740efedc159745b9b=
31f88ff03dde"
-
 DEPENDS +=3D "scp-firmware util-linux-native gptfdisk-native"
=20
 SRC_URI:append =3D " \
--=20
2.25.1


