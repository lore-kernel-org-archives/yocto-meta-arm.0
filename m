Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 600CECFA462
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 19:39:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6815.1729712390890596039
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Oct 2024 12:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A35D497
	for <meta-arm@lists.yoctoproject.org>; Wed, 23 Oct 2024 12:40:20 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5283D3F528
	for <meta-arm@lists.yoctoproject.org>; Wed, 23 Oct 2024 12:39:50 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-bsp/tc: remove all references to total compute
Date: Wed, 23 Oct 2024 15:39:49 -0400
Message-Id: <20241023193949.59449-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241023193949.59449-1-jon.mason@arm.com>
References: <20241023193949.59449-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Oct 2024 19:39:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6224

The tc files were removed some time ago, but there are still entries
in the bbappends trying to reference those files.  Remove them.

Signed-off-by: Jon Mason <jon.mason@arm.com>
Fixes: 0af53c645348 ("arm-bsp: Remove tc1")
---
 meta-arm-bsp/recipes-bsp/hafnium/hafnium_%.bbappend        | 1 -
 .../recipes-bsp/scp-firmware/scp-firmware_%.bbappend       | 1 -
 .../trusted-firmware-a/trusted-firmware-a_%.bbappend       | 1 -
 meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend          | 1 -
 meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc  | 7 -------
 5 files changed, 11 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/hafnium/hafnium_%.bbappend b/meta-a=
rm-bsp/recipes-bsp/hafnium/hafnium_%.bbappend
index bfc2c464a1a1..79096bf1175d 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/hafnium_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/hafnium/hafnium_%.bbappend
@@ -1,6 +1,5 @@
 # Machine specific configurations
=20
 MACHINE_HAFNIUM_REQUIRE ?=3D ""
-MACHINE_HAFNIUM_REQUIRE:tc =3D "hafnium-tc.inc"
=20
 require ${MACHINE_HAFNIUM_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappen=
d b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
index 4421e79c8d51..bf0af54a671b 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
@@ -4,6 +4,5 @@ MACHINE_SCP_REQUIRE ?=3D ""
=20
 MACHINE_SCP_REQUIRE:juno =3D "scp-firmware-juno.inc"
 MACHINE_SCP_REQUIRE:sgi575 =3D "scp-firmware-sgi575.inc"
-MACHINE_SCP_REQUIRE:tc =3D "scp-firmware-tc.inc"
=20
 require ${MACHINE_SCP_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_%.bbappend
index 444d66cdc91c..01ce095ef225 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bb=
append
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bb=
append
@@ -8,6 +8,5 @@ MACHINE_TFA_REQUIRE:fvp-base =3D "trusted-firmware-a-fvp-=
base.inc"
 MACHINE_TFA_REQUIRE:juno =3D "trusted-firmware-a-juno.inc"
 MACHINE_TFA_REQUIRE:sbsa-ref =3D "trusted-firmware-a-sbsa-ref.inc"
 MACHINE_TFA_REQUIRE:sgi575 =3D "trusted-firmware-a-sgi575.inc"
-MACHINE_TFA_REQUIRE:tc =3D "trusted-firmware-a-tc.inc"
=20
 require ${MACHINE_TFA_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 11f332ad3975..0bb60e6bd6f6 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -4,7 +4,6 @@ MACHINE_U-BOOT_REQUIRE ?=3D ""
 MACHINE_U-BOOT_REQUIRE:corstone1000 =3D "u-boot-corstone1000.inc"
 MACHINE_U-BOOT_REQUIRE:fvp-base =3D "u-boot-fvp-base.inc"
 MACHINE_U-BOOT_REQUIRE:juno =3D "u-boot-juno.inc"
-MACHINE_U-BOOT_REQUIRE:tc =3D "u-boot-tc.inc"
=20
 require ${MACHINE_U-BOOT_REQUIRE}
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 01803ba20561..8e964e17df60 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -90,13 +90,6 @@ COMPATIBLE_MACHINE:sgi575 =3D "sgi575"
 KBUILD_DEFCONFIG:sgi575 =3D "defconfig"
 KCONFIG_MODE:sgi575 =3D "--alldefconfig"
=20
-#
-# Total Compute (TC0/TC1) KMACHINE
-#
-COMPATIBLE_MACHINE:tc =3D "(tc0|tc1)"
-KBUILD_DEFCONFIG:tc =3D "defconfig"
-KCONFIG_MODE:tc =3D "--alldefconfig"
-
 #
 # sbsa-ref KMACHINE
 #
--=20
2.39.5 (Apple Git-154)


