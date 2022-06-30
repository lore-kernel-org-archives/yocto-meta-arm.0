Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4201AC433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 09:44:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.23032.1656582243327455959
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 02:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D5E51042;
	Thu, 30 Jun 2022 02:44:03 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com
 [10.1.194.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4AB963F5A1;
	Thu, 30 Jun 2022 02:44:02 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 1/4] arm-bsp/n1sdp: revert "fix boot due to TF-A 2.7 update"
Date: Thu, 30 Jun 2022 10:43:30 +0100
Message-Id: <20220630094333.3738129-2-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630094333.3738129-1-adam.johnston@arm.com>
References: <20220630094333.3738129-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 30 Jun 2022 09:44:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3543

From: Adam Johnston <adam.johnston@arm.com>

This reverts commit ea3479c27c5e67a1c1a5680d2abb8ecd22e5777f.

Signed-off-by: Adam Johnston <adam.johnston@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf                 |  2 --
 .../trusted-firmware-a_2.6.bbappend                  |  8 --------
 .../trusted-firmware-a/trusted-firmware-a_2.6.bb     | 12 ------------
 3 files changed, 22 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a_2.6.bbappend
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_2.6.bb

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/mac=
hine/n1sdp.conf
index 5423618c..5e87e61d 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -25,8 +25,6 @@ PREFERRED_VERSION_linux-yocto ?=3D "5.15%"
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "linux-firmware-rtl8168"
=20
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
-PREFERRED_VERSION_trusted-firmware-a =3D "2.6"
-
 EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
=20
 #UEFI EDK2 firmware
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.6.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_2.6.bbappend
deleted file mode 100644
index ad02f40d..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.=
bbappend
+++ /dev/null
@@ -1,8 +0,0 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/:"
-
-# Machine specific TFAs
-
-MACHINE_TFA_REQUIRE ?=3D ""
-MACHINE_TFA_REQUIRE:n1sdp =3D "trusted-firmware-a-n1sdp.inc"
-
-require ${MACHINE_TFA_REQUIRE}
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.6.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb
deleted file mode 100644
index ec1bec95..00000000
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require trusted-firmware-a.inc
-
-# TF-A v2.6
-SRCREV_tfa =3D "a1f02f4f3daae7e21ee58b4c93ec3e46b8f28d15"
-
-LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3Db2c740efedc159745b9=
b31f88ff03dde"
-
-# mbed TLS v2.26.0
-SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmaster"
-SRCREV_mbedtls =3D "e483a77c85e1f9c1dd2eb1c5a8f552d2617fe400"
-
-LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D3b83ef96387f1=
4655fc854ddc3c6bd57"
--=20
2.25.1


