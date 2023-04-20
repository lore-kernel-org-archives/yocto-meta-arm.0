Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1F0C77B73
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 12:52:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6969.1681995155828851487
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Apr 2023 05:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50CEC1042;
	Thu, 20 Apr 2023 05:53:19 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 12D733F587;
	Thu, 20 Apr 2023 05:52:34 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/6] arm/trusted-firmware-m: add the tf-m-extras repository that some machines need
Date: Thu, 20 Apr 2023 13:52:28 +0100
Message-Id: <20230420125233.1918925-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Apr 2023 12:52:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4593

Some machines use components from tf-m-extras, so fetch that too.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m-1.7.0-src.inc      | 5 +++++
 .../recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc    | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1=
.7.0-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-1.7.0-src.inc
index 7d5b4b53..6a209c37 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-sr=
c.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-sr=
c.inc
@@ -12,11 +12,13 @@ SRC_URI_TRUSTED_FIRMWARE_M_TESTS ?=3D "git://git.trus=
tedfirmware.org/TF-M/tf-m-tes
 SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS ?=3D "git://github.com/ARMmbed/mbedtl=
s.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT ?=3D "git://github.com/mcu-tools/mcub=
oot.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_QCBOR ?=3D "git://github.com/laurencelundblad=
e/QCBOR.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS ?=3D "git://git.trustedfirmware.org/TF=
-M/tf-m-extras.git;protocol=3Dhttps"
 SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${SRCBRANCH_tfm};na=
me=3Dtfm;destsuffix=3Dgit/tfm \
             ${SRC_URI_TRUSTED_FIRMWARE_M_TESTS};branch=3D${SRCBRANCH_tfm=
-tests};name=3Dtfm-tests;destsuffix=3Dgit/tf-m-tests \
             ${SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS};branch=3D${SRCBRANCH_m=
bedtls};name=3Dmbedtls;destsuffix=3Dgit/mbedtls \
             ${SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT};branch=3D${SRCBRANCH_m=
cuboot};name=3Dmcuboot;destsuffix=3Dgit/mcuboot \
             ${SRC_URI_TRUSTED_FIRMWARE_M_QCBOR};branch=3D${SRCBRANCH_qcb=
or};name=3Dqcbor;destsuffix=3Dgit/qcbor \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS};branch=3D${SRCBRANCH_tf=
m-extras};name=3Dtfm-extras;destsuffix=3Dgit/tfm-extras \
             "
=20
 # The required dependencies are documented in tf-m/config/config_default=
.cmake
@@ -35,6 +37,9 @@ SRCREV_mcuboot =3D "c657cbea75f2bb1faf1fceacf972a0537a8=
d26dd"
 # qcbor
 SRCBRANCH_qcbor ?=3D "master"
 SRCREV_qcbor =3D "b0e7033268e88c9f27146fa9a1415ef4c19ebaff"
+# TF-Mv1.7.0
+SRCBRANCH_tfm-extras ?=3D "master"
+SRCREV_tfm-extras =3D "daacaa6df3881e205bc03d75fc8fb688afe9f0f1"
=20
 SRCREV_FORMAT =3D "tfm"
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
index 9062df8c..a753a3da 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
@@ -72,7 +72,7 @@ EXTRA_OECMAKE +=3D "${@bb.utils.contains('TFM_DEBUG', '=
1', '-DCMAKE_BUILD_TYPE=3DDeb
 # Verbose builds
 EXTRA_OECMAKE +=3D "-DCMAKE_VERBOSE_MAKEFILE:BOOL=3DON"
=20
-EXTRA_OECMAKE +=3D "-DMBEDCRYPTO_PATH=3D${S}/../mbedtls -DTFM_TEST_REPO_=
PATH=3D${S}/../tf-m-tests -DMCUBOOT_PATH=3D${S}/../mcuboot -DQCBOR_PATH=3D=
${S}/../qcbor"
+EXTRA_OECMAKE +=3D "-DMBEDCRYPTO_PATH=3D${S}/../mbedtls -DTFM_TEST_REPO_=
PATH=3D${S}/../tf-m-tests -DTFM_EXTRAS_REPO_PATH=3D${S}/../tfm-extras -DM=
CUBOOT_PATH=3D${S}/../mcuboot -DQCBOR_PATH=3D${S}/../qcbor"
=20
 export CMAKE_BUILD_PARALLEL_LEVEL =3D "${@oe.utils.parallel_make(d, Fals=
e)}"
=20
--=20
2.34.1


