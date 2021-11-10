Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624E5C433FE
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 16:24:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.478.1636561458948296045
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Nov 2021 08:24:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 897DB139F
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Nov 2021 08:24:17 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3400F3F718
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Nov 2021 08:24:17 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm/trusted-firmware-m: use python3-cbor2 instead of
 python3-cbor
Date: Wed, 10 Nov 2021 16:24:11 +0000
Message-Id: <20211110162414.3428096-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Nov 2021 16:24:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2357

Backport a patch to switch from the unmaintained python3-cbor module to
the active python3-cbor2 module.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m/files/cbor2.patch      | 80 +++++++++++++++++++
 .../trusted-firmware-m_1.4.0.bb               |  3 +-
 2 files changed, 82 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/files/cbor2.p=
atch

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/files/cbor2.patch b/=
meta-arm/recipes-bsp/trusted-firmware-m/files/cbor2.patch
new file mode 100644
index 00000000..ec5749d4
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/files/cbor2.patch
@@ -0,0 +1,80 @@
+Upstream-Status: Backport [https://github.com/mcu-tools/mcuboot/commit/a=
6df132b68f8e08c2b0ab428377d478436376556]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From a5f747643e3a51b8dfce192203b9b84e033728b9 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 2 Nov 2021 11:12:04 +0000
+Subject: [PATCH] imgtool: prefer cbor2 over cbor
+
+The cbor module is unmaintained, with the last release in 2016[1]. The
+cbor2 module however is under active development and was last released
+just last month[2].
+
+As the APIs are identical, we can import cbor2 and if that fails fall
+back to cbor.
+
+[1] https://pypi.org/project/cbor/#history
+[2] https://pypi.org/project/cbor2/#history
+
+Closes #1189
+
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+Change-Id: Iaf2d0df625a200a5cebf72dec4a89877a26194ea
+---
+ scripts/imgtool.nix            | 2 +-
+ scripts/imgtool/boot_record.py | 9 ++++++---
+ scripts/requirements.txt       | 2 +-
+ scripts/setup.py               | 2 +-
+ 4 files changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/scripts/imgtool.nix b/scripts/imgtool.nix
+index 9ac41bc..ea9ba8b 100644
+diff --git a/scripts/imgtool/boot_record.py b/scripts/imgtool/boot_recor=
d.py
+index ac433aa..8ab2f60 100644
+--- a/scripts/imgtool/boot_record.py
++++ b/scripts/imgtool/boot_record.py
+@@ -14,8 +14,11 @@
+ # limitations under the License.
+=20
+ from enum import Enum
+-import cbor
+=20
++try:
++    from cbor2 import dumps
++except ImportError:
++    from cbor import dumps
+=20
+ class SwComponent(int, Enum):
+     """
+@@ -46,4 +49,4 @@ def create_sw_component_data(sw_type, sw_version, sw_m=
easurement_description,
+     #       list because later it will be modified by the bootloader.
+     properties[SwComponent.MEASUREMENT_VALUE] =3D sw_measurement_value
+=20
+-    return cbor.dumps(properties)
++    return dumps(properties)
+diff --git a/scripts/requirements.txt b/scripts/requirements.txt
+index 9481e2c..2446928 100644
+--- a/scripts/requirements.txt
++++ b/scripts/requirements.txt
+@@ -1,4 +1,4 @@
+ cryptography>=3D2.6
+ intelhex
+ click
+-cbor>=3D1.0.0
++cbor2
+diff --git a/scripts/setup.py b/scripts/setup.py
+index a228ea3..692cfb7 100644
+--- a/scripts/setup.py
++++ b/scripts/setup.py
+@@ -15,7 +15,7 @@ setuptools.setup(
+         'cryptography>=3D2.4.2',
+         'intelhex>=3D2.2.1',
+         'click',
+-        'cbor>=3D1.0.0',
++        'cbor2',
+     ],
+     entry_points=3D{
+         "console_scripts": ["imgtool=3Dimgtool.main:imgtool"]
+--=20
+2.25.1
+
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.4.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.4.=
0.bb
index 14fcbb1b..326b5a66 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.4.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.4.0.bb
@@ -19,6 +19,7 @@ SRC_URI  =3D "git://git.trustedfirmware.org/TF-M/truste=
d-firmware-m.git;protocol=3Dh
             git://git.trustedfirmware.org/TF-M/tf-m-tests.git;protocol=3D=
https;branch=3Dmaster;name=3Dtfm-tests;destsuffix=3D${S}/../tf-m-tests \
             git://github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;branch=
=3Dmaster;name=3Dmbedtls;destsuffix=3D${S}/../mbedtls \
             git://github.com/mcu-tools/mcuboot.git;protocol=3Dhttps;bran=
ch=3Dmain;name=3Dmcuboot;destsuffix=3D${S}/../mcuboot \
+            file://cbor2.patch;patchdir=3D${S}/../mcuboot \
             "
=20
 # The required dependencies are documented in tf-m/config/config_default=
.cmake
@@ -52,7 +53,7 @@ DEPENDS +=3D "cmake-native \
             python3-click-native \
             python3-cryptography-native \
             python3-pyasn1-native \
-            python3-cbor-native"
+            python3-cbor2-native"
=20
 S =3D "${WORKDIR}/git/tfm"
 B =3D "${WORKDIR}/build"
--=20
2.25.1


