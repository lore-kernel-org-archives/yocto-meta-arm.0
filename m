Return-Path: <drew.reed@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB75C41513
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 14:24:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.282885.1697639060586009080
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Oct 2023 07:24:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: drew.reed@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4ACCD2F4;
	Wed, 18 Oct 2023 07:25:01 -0700 (PDT)
Received: from C02DP1BVML7H.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A3DF3F64C;
	Wed, 18 Oct 2023 07:24:19 -0700 (PDT)
From: drew.reed@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Drew Reed <Drew.Reed@arm.com>
Subject: [PATCH 1/2] arm-bsp: Enable TF-A test building for the N1SDP
Date: Wed, 18 Oct 2023 15:24:08 +0100
Message-ID: <20231018142409.5807-2-drew.reed@arm.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231018142409.5807-1-drew.reed@arm.com>
References: <20231018142409.5807-1-drew.reed@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Oct 2023 14:24:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5144

From: Drew Reed <Drew.Reed@arm.com>

To allow running of the TF-A tests we need to be able to build the TF-A
test recipe for the N1SDP machine.

Signed-off-by: Drew Reed <Drew.Reed@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf                        | 4 ++++
 .../recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend    | 2 ++
 .../trusted-firmware-a/trusted-firmware-a-n1sdp.inc         | 6 ++----
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/mac=
hine/n1sdp.conf
index b93e053d..b960c3b1 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -24,7 +24,11 @@ PREFERRED_VERSION_linux-yocto ?=3D "6.4%"
 # RTL8168E Gigabit Ethernet Controller is attached to the PCIe interface
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "linux-firmware-rtl8168"
=20
+# TF-A
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
+TFA_PLATFORM =3D "n1sdp"
+
+# SCP
 EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
=20
 #UEFI EDK2 firmware
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bba=
ppend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend
index 392c6090..074bc683 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend
@@ -2,3 +2,5 @@
=20
 COMPATIBLE_MACHINE:corstone1000 =3D "corstone1000"
 SRCREV:corstone1000 =3D "5f591f67738a1bbe6b262c53d9dad46ed8bbcd67"
+
+COMPATIBLE_MACHINE:n1sdp =3D "n1sdp"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwa=
re-a-n1sdp.inc
index 900decc2..878bff51 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sd=
p.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sd=
p.inc
@@ -5,17 +5,16 @@ SRCREV_tfa  =3D "31f60a968347497562b0129134928d7ac47677=
10"
 PV .=3D "+git"
=20
 COMPATIBLE_MACHINE =3D "n1sdp"
-TFA_PLATFORM       =3D "n1sdp"
 TFA_BUILD_TARGET   =3D "all fip"
 TFA_INSTALL_TARGET =3D "bl1 bl2 bl31 n1sdp-multi-chip n1sdp-single-chip =
n1sdp_fw_config n1sdp_tb_fw_config fip"
 TFA_DEBUG          =3D "1"
 TFA_MBEDTLS        =3D "1"
 TFA_UBOOT          =3D "0"
-TFA_UEFI           =3D "1"
+TFA_UEFI          ?=3D "1"
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/n1sdp:"
=20
-SRC_URI:append =3D " \=20
+SRC_URI:append =3D " \
     file://0001-Reserve-OP-TEE-memory-from-nwd.patch \
     "
=20
@@ -37,5 +36,4 @@ EXTRA_OEMAKE:append =3D "\
 		    ARM_ROTPK_LOCATION=3D"devel_rsa" \
 		    ROT_KEY=3D"${TFA_ROT_KEY}" \
 		    BL32=3D${RECIPE_SYSROOT}/${nonarch_base_libdir}/firmware/tee-pager=
_v2.bin \
-		    BL33=3D${RECIPE_SYSROOT}/firmware/uefi.bin \
 		    "
--=20
2.34.1


