Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BAA2CCFA13
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 14:24:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16649.1762439073547661976
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 06:24:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 669291515
	for <meta-arm@lists.yoctoproject.org>; Thu,  6 Nov 2025 06:24:25 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CDB803F66E
	for <meta-arm@lists.yoctoproject.org>; Thu,  6 Nov 2025 06:24:32 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] arm/trusted-firmware-a: unify git repository URL
Date: Thu,  6 Nov 2025 14:24:28 +0000
Message-ID: <20251106142430.614591-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106142430.614591-1-ross.burton@arm.com>
References: <20251106142430.614591-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Nov 2025 14:24:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6753

git.trustedfirmware.org is an alias for review.trustedfirmware.org. We
moved the  main recipe to use review.trustedfirmware.org last year[1]
but not all other recipes that fetch the source followed, which means
that we have to fetch TF-A multiple times.

This commit ensures that all the recipes are using the same SRC_URI, so
we just fetch TF-A once.

[1] a6a4952e ("arm/trusted-firmware-a: use correct git URL")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb       | 2 +-
 .../recipes-bsp/trusted-firmware-a/fiptool-native_2.10.17.bb    | 2 +-
 .../recipes-bsp/trusted-firmware-a/fiptool-native_2.12.3.bb     | 2 +-
 .../recipes-bsp/trusted-firmware-a/fiptool-native_2.13.0.bb     | 2 +-
 meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.15.bb   | 2 +-
 meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.3.bb    | 2 +-
 meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.13.0.bb    | 2 +-
 meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb     | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb b/=
meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb
index ce021527b7..5d7efcc936 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb
@@ -2,7 +2,7 @@
 DESCRIPTION =3D "CoT-dt2c Tool is a python script to convert CoT DT file=
 into corresponding C file"
 LICENSE =3D "BSD-3-Clause"
=20
-SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://git.trustedfirmware.org/TF-A/trus=
ted-firmware-a.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://review.trustedfirmware.org/TF-A/t=
rusted-firmware-a;protocol=3Dhttps"
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};branch=3D${SRCBRANCH}"
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D83b7626b8c7a37263c6a=
58af8d19bee1"
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.=
17.bb b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.17.bb
index 1534b7e5f5..5ae8247c31 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.17.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.17.bb
@@ -5,7 +5,7 @@
 DESCRIPTION =3D "fiptool - Trusted Firmware tool for packaging"
 LICENSE =3D "BSD-3-Clause"
=20
-SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://git.trustedfirmware.org/TF-A/trus=
ted-firmware-a.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://review.trustedfirmware.org/TF-A/t=
rusted-firmware-a;protocol=3Dhttps"
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};destsuffix=3Dfiptool-${PV};br=
anch=3D${SRCBRANCH}"
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3Db2c740efedc159745b9b=
31f88ff03dde"
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.12.=
3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.12.3.bb
index cfbfe42bc4..af4f4f5b2f 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.12.3.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.12.3.bb
@@ -5,7 +5,7 @@
 DESCRIPTION =3D "fiptool - Trusted Firmware tool for packaging"
 LICENSE =3D "BSD-3-Clause"
=20
-SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://git.trustedfirmware.org/TF-A/trus=
ted-firmware-a.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://review.trustedfirmware.org/TF-A/t=
rusted-firmware-a;protocol=3Dhttps"
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};destsuffix=3Dfiptool-${PV};br=
anch=3D${SRCBRANCH}"
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D83b7626b8c7a37263c6a=
58af8d19bee1"
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.13.=
0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.13.0.bb
index 1eae9eebb8..1b5334d8bb 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.13.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.13.0.bb
@@ -5,7 +5,7 @@
 DESCRIPTION =3D "fiptool - Trusted Firmware tool for packaging"
 LICENSE =3D "BSD-3-Clause"
=20
-SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://git.trustedfirmware.org/TF-A/trus=
ted-firmware-a.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://review.trustedfirmware.org/TF-A/t=
rusted-firmware-a;protocol=3Dhttps"
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};destsuffix=3Dfiptool-${PV};br=
anch=3D${SRCBRANCH}"
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D1118e32884721c0be332=
67bd7ae11130"
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.15.b=
b b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.15.bb
index e2e46aa038..c484721b93 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.15.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.15.bb
@@ -7,7 +7,7 @@ inherit deploy
=20
 COMPATIBLE_MACHINE ?=3D "invalid"
=20
-SRC_URI_TRUSTED_FIRMWARE_A_TESTS ?=3D "git://git.trustedfirmware.org/TF-=
A/tf-a-tests.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_A_TESTS ?=3D "git://review.trustedfirmware.org/=
TF-A/tf-a-tests;protocol=3Dhttps"
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A_TESTS};branch=3D${SRCBRANCH}"
 SRCBRANCH =3D "lts-v2.10"
 SRCREV =3D "42c6a147d6f8957ff0b6e9eec4591b0927b8769f"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.3.bb=
 b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.3.bb
index 32baefa4ca..ecd02f67cd 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.3.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.3.bb
@@ -7,7 +7,7 @@ inherit deploy
=20
 COMPATIBLE_MACHINE ?=3D "invalid"
=20
-SRC_URI_TRUSTED_FIRMWARE_A_TESTS ?=3D "git://git.trustedfirmware.org/TF-=
A/tf-a-tests.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_A_TESTS ?=3D "git://review.trustedfirmware.org/=
TF-A/tf-a-tests;protocol=3Dhttps"
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A_TESTS};branch=3D${SRCBRANCH} \
           file://0001-fix-realm-make-PCIe-tests-default-for-testing.patc=
h \
           "
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.13.0.bb=
 b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.13.0.bb
index 08da7cbabb..aa7f49048b 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.13.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.13.0.bb
@@ -7,7 +7,7 @@ inherit deploy
=20
 COMPATIBLE_MACHINE ?=3D "invalid"
=20
-SRC_URI_TRUSTED_FIRMWARE_A_TESTS ?=3D "git://git.trustedfirmware.org/TF-=
A/tf-a-tests.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_A_TESTS ?=3D "git://review.trustedfirmware.org/=
TF-A/tf-a-tests;protocol=3Dhttps"
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A_TESTS};branch=3D${SRCBRANCH}"
 SRCBRANCH =3D "master"
 SRCREV =3D "fa267c12f9aa790b43b38d171273cf63892e8d51"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb =
b/meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb
index 0ec85b0cf9..e0230fbf26 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb
@@ -14,7 +14,7 @@ TS_SP_FWU_CONFIG ?=3D "default"
 OECMAKE_SOURCEPATH =3D "${S}/deployments/fwu/config/${TS_SP_FWU_CONFIG}-=
${TS_ENV}"
=20
 # The GPT parser component is needed from TF-A
-SRC_URI +=3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;=
name=3Dtfa;protocol=3Dhttps;branch=3Dmaster;destsuffix=3Dtf-a"
+SRC_URI +=3D "git://review.trustedfirmware.org/TF-A/trusted-firmware-a;n=
ame=3Dtfa;protocol=3Dhttps;branch=3Dmaster;destsuffix=3Dtf-a"
 SRCREV_tfa =3D "35f4c7295bafeb32c8bcbdfb6a3f2e74a57e732b"
 LIC_FILES_CHKSUM =3D "file://../tf-a/docs/license.rst;md5=3Db2c740efedc1=
59745b9b31f88ff03dde"
 do_apply_local_src_patches:append() {
--=20
2.43.0


