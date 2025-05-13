Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F379C3ABD7
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 13:24:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.75943.1747142632340181532
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 May 2025 06:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7C8722F8
	for <meta-arm@lists.yoctoproject.org>; Tue, 13 May 2025 06:23:40 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B3A533F673
	for <meta-arm@lists.yoctoproject.org>; Tue, 13 May 2025 06:23:51 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/trusted-firmware-m: add development git recipe
Date: Tue, 13 May 2025 09:23:50 -0400
Message-Id: <20250513132350.72095-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250513132350.72095-1-jon.mason@arm.com>
References: <20250513132350.72095-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 13 May 2025 13:24:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6500

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../trusted-firmware-m-git-src.inc            | 66 +++++++++++++++++++
 .../trusted-firmware-m_git.bb                 |  6 ++
 2 files changed, 72 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m-git-src.inc
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m_git.bb

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-g=
it-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-g=
it-src.inc
new file mode 100644
index 000000000000..9a7f23ff556d
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.=
inc
@@ -0,0 +1,66 @@
+# Common src definitions for trusted-firmware-m and trusted-firmware-m-s=
cripts
+
+LICENSE =3D "BSD-2-Clause & BSD-3-Clause & Apache-2.0"
+
+EXTRA_OECMAKE +=3D "-DT_COSE_PATH=3D${S}/../t_cose"
+
+LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368487da347f3c7bd0fc30=
85f3afa \
+                    file://../tf-m-tests/license.rst;md5=3D4481bae2221b0=
cfca76a69fb3411f390 \
+                    file://../mbedtls/LICENSE;md5=3D379d5819937a6c2f1ef1=
630d341e026d \
+                    file://../mcuboot/LICENSE;md5=3Db6ee33f1d12a5e6ee3de=
1e82fb51eeb8 \
+                    file://../tfm-psa-adac/license.rst;md5=3D07f368487da=
347f3c7bd0fc3085f3afa \
+                    file://../t_cose/LICENSE;md5=3Db2ebdbfb82602b97aa628=
f64cf4b65ad \
+                   "
+
+SRC_URI_TRUSTED_FIRMWARE_M ?=3D "git://git.trustedfirmware.org/TF-M/trus=
ted-firmware-m.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS ?=3D "git://git.trustedfirmware.org/TF=
-M/tf-m-extras.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_TESTS ?=3D "git://git.trustedfirmware.org/TF-=
M/tf-m-tests.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_CMSIS ?=3D "git://github.com/ARM-software/CMS=
IS_6.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS ?=3D "gitsm://github.com/ARMmbed/mbed=
tls.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT ?=3D "git://github.com/mcu-tools/mcub=
oot.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_QCBOR ?=3D "git://github.com/laurencelundblad=
e/QCBOR.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC ?=3D "git://git.trustedfirmware.org/=
shared/psa-adac.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_T_COSE ?=3D "git://github.com/laurencelundbla=
de/t_cose.git;protocol=3Dhttps"
+SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${SRCBRANCH_tfm};na=
me=3Dtfm;destsuffix=3Dgit/tfm \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS};branch=3D${SRCBRANCH_tf=
m-extras};name=3Dtfm-extras;destsuffix=3Dgit/tfm-extras \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_TESTS};branch=3D${SRCBRANCH_tfm=
-tests};name=3Dtfm-tests;destsuffix=3Dgit/tf-m-tests \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_CMSIS};branch=3D${SRCBRANCH_cms=
is};name=3Dcmsis;destsuffix=3Dgit/cmsis \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS};branch=3D${SRCBRANCH_m=
bedtls};name=3Dmbedtls;destsuffix=3Dgit/mbedtls \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT};branch=3D${SRCBRANCH_m=
cuboot};name=3Dmcuboot;destsuffix=3Dgit/mcuboot \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_QCBOR};branch=3D${SRCBRANCH_qcb=
or};name=3Dqcbor;destsuffix=3Dgit/qcbor \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC};branch=3D${SRCBRANCH_=
tfm-psa-adac};name=3Dtfm-psa-adac;destsuffix=3Dgit/tfm-psa-adac \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_T_COSE};branch=3D${SRCBRANCH_t-=
cose};name=3Dt-cose;destsuffix=3Dgit/t_cose \
+            "
+
+# The required dependencies are documented in tf-m/config/config_base.cm=
ake
+# latest (25 April 2025)
+SRCBRANCH_tfm ?=3D "main"
+SRCREV_tfm =3D "1e77550712f35730e8807fd1091fdac243d1b15a"
+# latest (7 April 2025)
+SRCBRANCH_tfm-extras ?=3D "main"
+SRCREV_tfm-extras =3D "8679c4c26091d19807eb68a1bd4b75fb2b6685bc"
+# latest (30 April 2025)
+SRCBRANCH_tfm-tests ?=3D "main"
+SRCREV_tfm-tests =3D "96c110a7a70bdb28bdf0e56dcf791c37fedb20ad"
+# CMSIS v6.1.0, CMSIS_TAG from lib/ext/cmsis/CMakeLists.txt
+SRCBRANCH_cmsis ?=3D "main"
+SRCREV_cmsis =3D "b0bbb0423b278ca632cfe1474eb227961d835fd2"
+# mbedtls-3.6.3 (+2 commits), value from MBEDCRYPTO_VERSION(-ish)
+SRCBRANCH_mbedtls ?=3D "mbedtls-3.6"
+SRCREV_mbedtls =3D "8cf5666a174237998a7965e284d7ba8c1655d16d"
+# mcuboot v2.2.0-rc1+ (intermediate SHA), value from MCUBOOT_VERSION
+SRCBRANCH_mcuboot ?=3D "main"
+SRCREV_mcuboot =3D "6071ceb1d0d955b6ff4745499a0ff3ac7d79f24b"
+# QCBOR v1.2, value from QCBOR_VERSION in lib/ext/qcbor/CMakeLists.txt
+SRCBRANCH_qcbor ?=3D "master"
+SRCREV_qcbor =3D "92d3f89030baff4af7be8396c563e6c8ef263622"
+# PSA-ADAC (intermediate SHA), value from PLATFORM_PSA_ADAC_VERSION
+SRCBRANCH_tfm-psa-adac =3D "master"
+SRCREV_tfm-psa-adac =3D "819a254af6fb5eefdcef194ec85d2c7627451351"
+# T_COSE v2.0-alpha-2, from lib/ext/t_cose/CMakeLists.txt
+SRCBRANCH_t-cose =3D "dev"
+SRCREV_t-cose =3D "3076010eeb6383f0827bd992c75b68af9311cf1d"
+
+SRCREV_FORMAT =3D "tfm"
+
+S =3D "${WORKDIR}/git/tfm"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_g=
it.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_git.bb
new file mode 100644
index 000000000000..610deac038b2
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_git.bb
@@ -0,0 +1,6 @@
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.inc
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
+
+# Not a release recipe, try our hardest to not pull this in implicitly
+DEFAULT_PREFERENCE =3D "-1"
+UPSTREAM_CHECK_COMMITS =3D "1"
--=20
2.39.5 (Apple Git-154)


