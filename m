Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96CC9D5B861
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 18:00:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.881.1765821657132734385
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Dec 2025 10:00:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83E6AFEC
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Dec 2025 10:00:49 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 530BF3F694
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Dec 2025 10:00:56 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/trusted-firmware-m: update _git recipe to 2.2.2-rc1
Date: Mon, 15 Dec 2025 18:00:51 +0000
Message-ID: <20251215180051.1476057-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215180051.1476057-1-ross.burton@arm.com>
References: <20251215180051.1476057-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Dec 2025 18:00:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6799

This is not git master, but it's a lot newer and gives a baseline to
test from further.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m-git-src.inc             | 18 ++++++++++--------
 .../trusted-firmware-m-scripts-native_git.bb   |  6 ++++++
 2 files changed, 16 insertions(+), 8 deletions(-)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m-scripts-native_git.bb

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-g=
it-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-g=
it-src.inc
index bf3a07d218..c3adc2e7d8 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.=
inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.=
inc
@@ -30,25 +30,27 @@ SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D=
${SRCBRANCH_tfm};name=3Dtfm;dests
             ${SRC_URI_TRUSTED_FIRMWARE_M_T_COSE};branch=3D${SRCBRANCH_t-=
cose};name=3Dt-cose;destsuffix=3Dt_cose \
             "
=20
+PV =3D "2.2.2~rc1"
+
 # The required dependencies are documented in tf-m/config/config_base.cm=
ake
 # latest (25 April 2025)
-SRCBRANCH_tfm ?=3D "main"
-SRCREV_tfm =3D "1e77550712f35730e8807fd1091fdac243d1b15a"
+SRCBRANCH_tfm ?=3D "release/2.2.x"
+SRCREV_tfm =3D "4706d567a2e5c2d88067370c5347ae5bbe59bcc6"
 # latest (7 April 2025)
 SRCBRANCH_tfm-extras ?=3D "main"
-SRCREV_tfm-extras =3D "8679c4c26091d19807eb68a1bd4b75fb2b6685bc"
-# latest (30 April 2025)
+SRCREV_tfm-extras =3D "3e6ac492b913c4c681e1dbc1f90c38cd765170ab"
+# From lib/ext/tf-m-tests/version.txt
 SRCBRANCH_tfm-tests ?=3D "main"
-SRCREV_tfm-tests =3D "96c110a7a70bdb28bdf0e56dcf791c37fedb20ad"
+SRCREV_tfm-tests =3D "e21dbfbb0c3b5e9758733793d834c55a2f280f25"
 # CMSIS v6.1.0, CMSIS_TAG from lib/ext/cmsis/CMakeLists.txt
 SRCBRANCH_cmsis ?=3D "main"
 SRCREV_cmsis =3D "b0bbb0423b278ca632cfe1474eb227961d835fd2"
-# mbedtls-3.6.3 (+2 commits), value from MBEDCRYPTO_VERSION(-ish)
+# mbedtls-3.6.5, value from MBEDCRYPTO_VERSION(-ish)
 SRCBRANCH_mbedtls ?=3D "mbedtls-3.6"
-SRCREV_mbedtls =3D "8cf5666a174237998a7965e284d7ba8c1655d16d"
+SRCREV_mbedtls =3D "e185d7fd85499c8ce5ca2a54f5cf8fe7dbe3f8df"
 # mcuboot v2.2.0-rc1+ (intermediate SHA), value from MCUBOOT_VERSION
 SRCBRANCH_mcuboot ?=3D "main"
-SRCREV_mcuboot =3D "6071ceb1d0d955b6ff4745499a0ff3ac7d79f24b"
+SRCREV_mcuboot =3D "2d61c318933819a0f4954fb2a5a957a62c6128ce"
 # QCBOR v1.2, value from QCBOR_VERSION in lib/ext/qcbor/CMakeLists.txt
 SRCBRANCH_qcbor ?=3D "master"
 SRCREV_qcbor =3D "92d3f89030baff4af7be8396c563e6c8ef263622"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-s=
cripts-native_git.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-fi=
rmware-m-scripts-native_git.bb
new file mode 100644
index 0000000000..752a56f989
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-=
native_git.bb
@@ -0,0 +1,6 @@
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.inc
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-native=
.inc
+
+# Not a release recipe, try our hardest to not pull this in implicitly
+DEFAULT_PREFERENCE =3D "-1"
+UPSTREAM_CHECK_COMMITS =3D "1"
--=20
2.43.0


