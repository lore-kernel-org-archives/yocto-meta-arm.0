Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30F4C61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 12:05:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6950.1677067500121034224
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 04:05:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72818139F;
	Wed, 22 Feb 2023 04:05:42 -0800 (PST)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F7143F881;
	Wed, 22 Feb 2023 04:04:58 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 1/6] arm/trusted-firmware-m: Synchronize with 1.7.0 release
Date: Wed, 22 Feb 2023 12:04:36 +0000
Message-Id: <20230222120441.2684534-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Feb 2023 12:05:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4437

From: Peter Hoyes <Peter.Hoyes@arm.com>

Update the TF-M image signing scripts to use the TF-M 1.7.0 sources, so
it is in sync with the TF-M recipe itself.

Synchronize the trusted-firmware-m and -scripts Python dependencies
with the in-repo requirements.txt files. This requires a recipe to be
carried for pyhsslms.

1.7.0 introduces the --measured-boot-record argument to the image
signing script, which is required to maintain existing behavior. Add it
to the arguments in the tfm_sign_image bbclass.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 meta-arm/classes/tfm_sign_image.bbclass            |  1 +
 .../trusted-firmware-m/trusted-firmware-m_1.7.0.bb | 14 ++++++++++----
 .../python/python3-pyhsslms_1.1.1.bb               | 10 ++++++++++
 ... =3D> trusted-firmware-m-scripts-native_1.7.0.bb} | 14 +++++++++++---
 4 files changed, 32 insertions(+), 7 deletions(-)
 create mode 100644 meta-arm/recipes-devtools/python/python3-pyhsslms_1.1=
.1.bb
 rename meta-arm/recipes-devtools/trusted-firmware-m-scripts/{trusted-fir=
mware-m-scripts-native_1.6.0.bb =3D> trusted-firmware-m-scripts-native_1.=
7.0.bb} (64%)

diff --git a/meta-arm/classes/tfm_sign_image.bbclass b/meta-arm/classes/t=
fm_sign_image.bbclass
index 542b708b..a5c41ae3 100644
--- a/meta-arm/classes/tfm_sign_image.bbclass
+++ b/meta-arm/classes/tfm_sign_image.bbclass
@@ -72,6 +72,7 @@ EOF
             --align 1 \
             --pad \
             --pad-header \
+            --measured-boot-record \
             -H ${RE_IMAGE_OFFSET} \
             -s auto \
             "${1}" \
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.7.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.=
0.bb
index f4219be6..8df21339 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.0.bb
@@ -59,15 +59,21 @@ INHIBIT_DEFAULT_DEPS =3D "1"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
+# See tools/requirements.txt for Python dependencies
 DEPENDS +=3D "cmake-native \
             ninja-native \
             gcc-arm-none-eabi-native \
-            python3-intelhex-native \
-            python3-jinja2-native \
-            python3-pyyaml-native \
+            python3-cbor2-native \
             python3-click-native \
             python3-cryptography-native \
-            python3-cbor2-native"
+            python3-pyasn1-native \
+            python3-imgtool-native \
+            python3-jinja2-native \
+            python3-pyyaml-native \
+            python3-pyhsslms-native \
+            python3-ecdsa-native \
+            python3-kconfiglib-native \
+"
=20
 S =3D "${WORKDIR}/git/tfm"
 B =3D "${WORKDIR}/build"
diff --git a/meta-arm/recipes-devtools/python/python3-pyhsslms_1.1.1.bb b=
/meta-arm/recipes-devtools/python/python3-pyhsslms_1.1.1.bb
new file mode 100644
index 00000000..6012ab2d
--- /dev/null
+++ b/meta-arm/recipes-devtools/python/python3-pyhsslms_1.1.1.bb
@@ -0,0 +1,10 @@
+SUMMARY =3D "Pure-Python implementation of HSS/LMS Digital Signatures (R=
FC 8554)"
+HOMEPAGE =3D"https://pypi.org/project/pyhsslms"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D58f6f7065b99f9d01d56e7592=
56a6f1b"
+
+inherit pypi python_setuptools_build_meta
+PYPI_PACKAGE =3D "pyhsslms"
+SRC_URI[sha256sum] =3D "58bf03e34c6f9d5a3cfd77875d0a1356d4f23d7ad6ffd129=
b1e60de1208db753"
+
+BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted=
-firmware-m-scripts-native_1.6.0.bb b/meta-arm/recipes-devtools/trusted-f=
irmware-m-scripts/trusted-firmware-m-scripts-native_1.7.0.bb
similarity index 64%
rename from meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted-=
firmware-m-scripts-native_1.6.0.bb
rename to meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted-fi=
rmware-m-scripts-native_1.7.0.bb
index db35ecf7..f30c3b52 100644
--- a/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted-firmwa=
re-m-scripts-native_1.6.0.bb
+++ b/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted-firmwa=
re-m-scripts-native_1.7.0.bb
@@ -1,9 +1,9 @@
=20
 SRC_URI_TRUSTED_FIRMWARE_M ?=3D "git://git.trustedfirmware.org/TF-M/trus=
ted-firmware-m.git;protocol=3Dhttps"
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${SRCBRANCH}"
-# Use the wrapper script from TF-Mv1.6.0
+# Use the wrapper script from TF-Mv1.7.0
 SRCBRANCH ?=3D "master"
-SRCREV =3D "7387d88158701a3c51ad51c90a05326ee12847a8"
+SRCREV =3D "b725a1346cdb9ec75b1adcdc4c84705881e8fd4e"
=20
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368487da347f3c7bd0fc30=
85f3afa"
@@ -12,7 +12,15 @@ S =3D "${WORKDIR}/git"
=20
 inherit native
=20
-RDEPENDS:${PN} =3D "python3-imgtool-native python3-click-native"
+# See bl2/ext/mcuboot/scripts/requirements.txt
+RDEPENDS:${PN} =3D "\
+    python3-cryptography-native \
+    python3-pyasn1-native \
+    python3-pyyaml-native \
+    python3-cbor2-native \
+    python3-imgtool-native \
+    python3-click-native \
+"
=20
 do_configure[noexec] =3D "1"
 do_compile[noexec] =3D "1"
--=20
2.34.1


