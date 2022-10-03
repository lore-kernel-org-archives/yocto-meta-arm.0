Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C60B0C43219
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 11:29:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.17956.1664796566869701460
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 04:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E31D2139F;
	Mon,  3 Oct 2022 04:29:32 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.80.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59A4B3F67D;
	Mon,  3 Oct 2022 04:29:25 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 1/3] arm-bsp/trusted-firmware-m: Make branch names
 configurable
Date: Mon,  3 Oct 2022 12:29:57 +0100
Message-Id: <20221003112959.2123869-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Oct 2022 11:29:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3891

From: Peter Hoyes <Peter.Hoyes@arm.com>

In order to support overriding the branch names in other layers, extract
the branch name for each repository and set using default assignment.

Issue-Id: SCM-4964
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I09d0c1f1d012c1abb84648ad974883bbdaa1db7a
---
 .../trusted-firmware-m/trusted-firmware-m_1.6.0.bb    | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.6.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.6.=
0.bb
index bda27713..c10efd5a 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.6.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.6.0.bb
@@ -16,20 +16,23 @@ LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368=
487da347f3c7bd0fc3085f3afa \
                     file://../mcuboot/LICENSE;md5=3Db6ee33f1d12a5e6ee3de=
1e82fb51eeb8"
=20
 SRC_URI  =3D "git://git.trustedfirmware.org/TF-M/trusted-firmware-m.git;=
protocol=3Dhttps;branch=3D${SRCBRANCH_tfm};name=3Dtfm;destsuffix=3Dgit/tf=
m \
-            git://git.trustedfirmware.org/TF-M/tf-m-tests.git;protocol=3D=
https;branch=3Drelease/1.6.x;name=3Dtfm-tests;destsuffix=3Dgit/tf-m-tests=
 \
-            git://github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;branch=
=3Dmaster;name=3Dmbedtls;destsuffix=3Dgit/mbedtls \
-            git://github.com/mcu-tools/mcuboot.git;protocol=3Dhttps;bran=
ch=3Dmain;name=3Dmcuboot;destsuffix=3Dgit/mcuboot \
+            git://git.trustedfirmware.org/TF-M/tf-m-tests.git;protocol=3D=
https;branch=3D${SRCBRANCH_tfm-tests};name=3Dtfm-tests;destsuffix=3Dgit/t=
f-m-tests \
+            git://github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;branch=
=3D${SRCBRANCH_mbedtls};name=3Dmbedtls;destsuffix=3Dgit/mbedtls \
+            git://github.com/mcu-tools/mcuboot.git;protocol=3Dhttps;bran=
ch=3D${SRCBRANCH_mcuboot};name=3Dmcuboot;destsuffix=3Dgit/mcuboot \
             "
=20
 # The required dependencies are documented in tf-m/config/config_default=
.cmake
 # TF-Mv1.6.0
-SRCBRANCH_tfm =3D "release/1.6.x"
+SRCBRANCH_tfm ?=3D "release/1.6.x"
 SRCREV_tfm =3D "7387d88158701a3c51ad51c90a05326ee12847a8"
 # mbedtls-3.1.0
+SRCBRANCH_mbedtls ?=3D "master"
 SRCREV_mbedtls =3D "d65aeb37349ad1a50e0f6c9b694d4b5290d60e49"
 # TF-Mv1.6.0
+SRCBRANCH_tfm-tests ?=3D "release/1.6.x"
 SRCREV_tfm-tests =3D "723905d46019596f3f2df66d79b5d6bff6f3f213"
 # v1.9.0
+SRCBRANCH_mcuboot ?=3D "main"
 SRCREV_mcuboot =3D "c657cbea75f2bb1faf1fceacf972a0537a8d26dd"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "^TF-Mv(?P<pver>\d+(\.\d+)+)$"
--=20
2.25.1


