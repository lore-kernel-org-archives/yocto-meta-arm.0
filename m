Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6442BC433EF
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 13:17:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6295.1651670237006169961
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 May 2022 06:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBABF1042;
	Wed,  4 May 2022 06:17:15 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72BD93FA49;
	Wed,  4 May 2022 06:17:15 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] arm/trusted-firmware-m: upgrade to 1.6.0.
Date: Wed,  4 May 2022 14:17:10 +0100
Message-Id: <20220504131711.783449-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 May 2022 13:17:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3352

Upgrade all SRCREVs, and drop the merged patch to use cbor2.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m/files/cbor2.patch      | 80 -------------------
 ...m_1.5.0.bb =3D> trusted-firmware-m_1.6.0.bb} | 21 +++--
 2 files changed, 10 insertions(+), 91 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/files/cbor2.p=
atch
 rename meta-arm/recipes-bsp/trusted-firmware-m/{trusted-firmware-m_1.5.0=
.bb =3D> trusted-firmware-m_1.6.0.bb} (91%)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/files/cbor2.patch b/=
meta-arm/recipes-bsp/trusted-firmware-m/files/cbor2.patch
deleted file mode 100644
index ec5749d4..00000000
--- a/meta-arm/recipes-bsp/trusted-firmware-m/files/cbor2.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-Upstream-Status: Backport [https://github.com/mcu-tools/mcuboot/commit/a=
6df132b68f8e08c2b0ab428377d478436376556]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From a5f747643e3a51b8dfce192203b9b84e033728b9 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Tue, 2 Nov 2021 11:12:04 +0000
-Subject: [PATCH] imgtool: prefer cbor2 over cbor
-
-The cbor module is unmaintained, with the last release in 2016[1]. The
-cbor2 module however is under active development and was last released
-just last month[2].
-
-As the APIs are identical, we can import cbor2 and if that fails fall
-back to cbor.
-
-[1] https://pypi.org/project/cbor/#history
-[2] https://pypi.org/project/cbor2/#history
-
-Closes #1189
-
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-Change-Id: Iaf2d0df625a200a5cebf72dec4a89877a26194ea
----
- scripts/imgtool.nix            | 2 +-
- scripts/imgtool/boot_record.py | 9 ++++++---
- scripts/requirements.txt       | 2 +-
- scripts/setup.py               | 2 +-
- 4 files changed, 9 insertions(+), 6 deletions(-)
-
-diff --git a/scripts/imgtool.nix b/scripts/imgtool.nix
-index 9ac41bc..ea9ba8b 100644
-diff --git a/scripts/imgtool/boot_record.py b/scripts/imgtool/boot_recor=
d.py
-index ac433aa..8ab2f60 100644
---- a/scripts/imgtool/boot_record.py
-+++ b/scripts/imgtool/boot_record.py
-@@ -14,8 +14,11 @@
- # limitations under the License.
-=20
- from enum import Enum
--import cbor
-=20
-+try:
-+    from cbor2 import dumps
-+except ImportError:
-+    from cbor import dumps
-=20
- class SwComponent(int, Enum):
-     """
-@@ -46,4 +49,4 @@ def create_sw_component_data(sw_type, sw_version, sw_m=
easurement_description,
-     #       list because later it will be modified by the bootloader.
-     properties[SwComponent.MEASUREMENT_VALUE] =3D sw_measurement_value
-=20
--    return cbor.dumps(properties)
-+    return dumps(properties)
-diff --git a/scripts/requirements.txt b/scripts/requirements.txt
-index 9481e2c..2446928 100644
---- a/scripts/requirements.txt
-+++ b/scripts/requirements.txt
-@@ -1,4 +1,4 @@
- cryptography>=3D2.6
- intelhex
- click
--cbor>=3D1.0.0
-+cbor2
-diff --git a/scripts/setup.py b/scripts/setup.py
-index a228ea3..692cfb7 100644
---- a/scripts/setup.py
-+++ b/scripts/setup.py
-@@ -15,7 +15,7 @@ setuptools.setup(
-         'cryptography>=3D2.4.2',
-         'intelhex>=3D2.2.1',
-         'click',
--        'cbor>=3D1.0.0',
-+        'cbor2',
-     ],
-     entry_points=3D{
-         "console_scripts": ["imgtool=3Dimgtool.main:imgtool"]
---=20
-2.25.1
-
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.5.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.6.=
0.bb
similarity index 91%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.=
5.0.bb
rename to meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.6.=
0.bb
index 652abdd6..3a5e57ea 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.6.0.bb
@@ -16,22 +16,21 @@ LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368=
487da347f3c7bd0fc3085f3afa \
                     file://../mcuboot/LICENSE;md5=3Db6ee33f1d12a5e6ee3de=
1e82fb51eeb8"
=20
 SRC_URI  =3D "git://git.trustedfirmware.org/TF-M/trusted-firmware-m.git;=
protocol=3Dhttps;branch=3D${SRCBRANCH_tfm};name=3Dtfm;destsuffix=3Dgit/tf=
m \
-            git://git.trustedfirmware.org/TF-M/tf-m-tests.git;protocol=3D=
https;branch=3Drelease/1.5.x;name=3Dtfm-tests;destsuffix=3Dgit/tf-m-tests=
 \
+            git://git.trustedfirmware.org/TF-M/tf-m-tests.git;protocol=3D=
https;branch=3Drelease/1.6.x;name=3Dtfm-tests;destsuffix=3Dgit/tf-m-tests=
 \
             git://github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;branch=
=3Dmaster;name=3Dmbedtls;destsuffix=3Dgit/mbedtls \
             git://github.com/mcu-tools/mcuboot.git;protocol=3Dhttps;bran=
ch=3Dmain;name=3Dmcuboot;destsuffix=3Dgit/mcuboot \
-            file://cbor2.patch;patchdir=3D../mcuboot \
             "
=20
 # The required dependencies are documented in tf-m/config/config_default=
.cmake
-# TF-Mv1.5.0
-SRCBRANCH_tfm =3D "release/1.5.x"
-SRCREV_tfm =3D "6fb14a14140f94150f959c88e3b880f48372da06"
-# mbedtls-3.0.0
-SRCREV_mbedtls =3D "8df2f8e7b9c7bb9390ac74bb7bace27edca81a2b"
-# TF-Mv1.5.0
-SRCREV_tfm-tests =3D "6131778527cf60d9b5b7ea73700a30c0fdb9ff66"
-# v1.8.0
-SRCREV_mcuboot =3D "29099e1d17f93ae1d09fe945ad191b703aacd3d8"
+# TF-Mv1.6.0
+SRCBRANCH_tfm =3D "release/1.6.x"
+SRCREV_tfm =3D "7387d88158701a3c51ad51c90a05326ee12847a8"
+# mbedtls-3.1.0
+SRCREV_mbedtls =3D "d65aeb37349ad1a50e0f6c9b694d4b5290d60e49"
+# TF-Mv1.6.0
+SRCREV_tfm-tests =3D "723905d46019596f3f2df66d79b5d6bff6f3f213"
+# v1.9.0
+SRCREV_mcuboot =3D "c657cbea75f2bb1faf1fceacf972a0537a8d26dd"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "^TF-Mv(?P<pver>\d+(\.\d+)+)$"
=20
--=20
2.25.1


