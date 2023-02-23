Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643D5C64ED8
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 14:37:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11954.1677163023269890070
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Feb 2023 06:37:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA10F11FB
	for <meta-arm@lists.yoctoproject.org>; Thu, 23 Feb 2023 06:37:45 -0800 (PST)
Received: from jdm-VirtualBox.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C5C033F881
	for <meta-arm@lists.yoctoproject.org>; Thu, 23 Feb 2023 06:37:02 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/5] arm/trusted-firmware-a: update version and relocate fiptool
Date: Thu, 23 Feb 2023 09:36:56 -0500
Message-Id: <20230223143657.424913-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230223143657.424913-1-jon.mason@arm.com>
References: <20230223143657.424913-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Feb 2023 14:37:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4449

Update tfa version to v2.8.  Also, fiptool uses tfa sources.  So, keep
it with the rest of tfa to prevent the version from becoming stale.

NOTE: tf-a-tests is being held back for corstone1000 due to compilation
errors.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...f-a-tests_2.7.0.bbappend =3D> tf-a-tests_2.8.0.bbappend} | 1 +
 ...a_2.7.%.bbappend =3D> trusted-firmware-a_2.8.%.bbappend} | 0
 .../trusted-firmware-a/fiptool-native_2.8.bb}             | 4 ++--
 .../{tf-a-tests_2.7.0.bb =3D> tf-a-tests_2.8.0.bb}          | 2 +-
 ...ed-firmware-a_2.7.0.bb =3D> trusted-firmware-a_2.8.0.bb} | 8 ++++----
 5 files changed, 8 insertions(+), 7 deletions(-)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/{tf-a-tests_2.7.0.bba=
ppend =3D> tf-a-tests_2.8.0.bbappend} (53%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2=
.7.%.bbappend =3D> trusted-firmware-a_2.8.%.bbappend} (100%)
 rename meta-arm/{recipes-devtools/fiptool/fiptool-native_2.7.bb =3D> rec=
ipes-bsp/trusted-firmware-a/fiptool-native_2.8.bb} (92%)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{tf-a-tests_2.7.0.bb =3D>=
 tf-a-tests_2.8.0.bb} (96%)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.7.0=
.bb =3D> trusted-firmware-a_2.8.0.bb} (71%)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.0=
.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.8.0.=
bbappend
similarity index 53%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.0.=
bbappend
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.8.0.bb=
append
index ff22ff12..392c6090 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.0.bbappe=
nd
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.8.0.bbappe=
nd
@@ -1,3 +1,4 @@
 # Machine specific TFAs
=20
 COMPATIBLE_MACHINE:corstone1000 =3D "corstone1000"
+SRCREV:corstone1000 =3D "5f591f67738a1bbe6b262c53d9dad46ed8bbcd67"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.7.%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a_2.8.%.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a_2.7.%.bbappend
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_=
2.8.%.bbappend
diff --git a/meta-arm/recipes-devtools/fiptool/fiptool-native_2.7.bb b/me=
ta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.8.bb
similarity index 92%
rename from meta-arm/recipes-devtools/fiptool/fiptool-native_2.7.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.8.bb
index 66cf2ced..578f5a29 100644
--- a/meta-arm/recipes-devtools/fiptool/fiptool-native_2.7.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.8.bb
@@ -10,8 +10,8 @@ SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};destsuffix=3D=
fiptool-${PV};branch=3D${SRCBR
 SRCBRANCH =3D "master"
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3Db2c740efedc159745b9b=
31f88ff03dde"
=20
-# Use fiptool from TF-A v2.7
-SRCREV =3D "35f4c7295bafeb32c8bcbdfb6a3f2e74a57e732b"
+# Use fiptool from TF-A v2.8
+SRCREV =3D "9881bb93a3bc0a3ea37e9f093e09ab4b360a9e48"
=20
 DEPENDS +=3D "openssl-native"
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.0.bb =
b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.8.0.bb
similarity index 96%
rename from meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.0.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.8.0.bb
index 8ded64dd..0c094995 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.8.0.bb
@@ -11,7 +11,7 @@ SRC_URI_TRUSTED_FIRMWARE_A_TESTS ?=3D "git://git.truste=
dfirmware.org/TF-A/tf-a-tes
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A_TESTS};branch=3D${SRCBRANCH} \
           file://tf-a-tests-no-warn-rwx-segments.patch"
 SRCBRANCH =3D "master"
-SRCREV =3D "5f591f67738a1bbe6b262c53d9dad46ed8bbcd67"
+SRCREV =3D "f7b3be91ab954c495912fc7bc48383cd83bfec2d"
=20
 DEPENDS +=3D "optee-os"
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.7.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.8.=
0.bb
similarity index 71%
rename from meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.=
7.0.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.8.=
0.bb
index 35817c0c..3a5006e5 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.8.0.bb
@@ -1,14 +1,14 @@
 require trusted-firmware-a.inc
=20
-# TF-A v2.7
-SRCREV_tfa =3D "35f4c7295bafeb32c8bcbdfb6a3f2e74a57e732b"
+# TF-A v2.8
+SRCREV_tfa =3D "9881bb93a3bc0a3ea37e9f093e09ab4b360a9e48"
=20
 SRC_URI +=3D "file://rwx-segments.patch"
=20
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3Db2c740efedc159745b9=
b31f88ff03dde"
=20
-# mbed TLS v2.28.0
+# mbed TLS v2.28.2
 SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmbedtls-2.28"
-SRCREV_mbedtls =3D "8b3f26a5ac38d4fdccbc5c5366229f3e01dafcc0"
+SRCREV_mbedtls =3D "89f040a5c938985c5f30728baed21e49d0846a53"
=20
 LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D3b83ef96387f1=
4655fc854ddc3c6bd57"
--=20
2.25.1


