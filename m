Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F394AECD6C3
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 15:58:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22413.1770825490745269579
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 07:58:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B077A497
	for <meta-arm@lists.yoctoproject.org>; Wed, 11 Feb 2026 07:58:03 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E7C9B3F632
	for <meta-arm@lists.yoctoproject.org>; Wed, 11 Feb 2026 07:58:09 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/corstone1000-a320: split off FVP into a unique file and add to CI
Date: Wed, 11 Feb 2026 10:58:08 -0500
Message-ID: <20260211155809.6450-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260211155809.6450-1-jon.mason@arm.com>
References: <20260211155809.6450-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 11 Feb 2026 15:58:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6903

The corstone1000-a320 FVP is a unique download and should be treated as
such in our CI.  Split the relevant parts off, add it to the fvps.yml
file, workaround the staticdev and useless-rpath errors that were
present in the FVP tarball, and the correct depends in the machine
config file.

Also, add this machine to the CI so that any issues can be found with
this unique configuration.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/fvps.yml                                   |  2 ++
 .../conf/machine/corstone1000-fvp.conf        |  1 +
 .../fvp/fvp-corstone1000-a320.bb              | 24 +++++++++++++++++++
 .../recipes-devtools/fvp/fvp-corstone1000.bb  | 11 +--------
 4 files changed, 28 insertions(+), 10 deletions(-)
 create mode 100644 meta-arm/recipes-devtools/fvp/fvp-corstone1000-a320.b=
b

diff --git a/ci/fvps.yml b/ci/fvps.yml
index e736c519c03d..1ef3e0fa0b9a 100644
--- a/ci/fvps.yml
+++ b/ci/fvps.yml
@@ -19,11 +19,13 @@ target:
   # Target packages to test aarch64
   - fvp-base-a-aem
   - fvp-corstone1000
+  - fvp-corstone1000-a320
   - fvp-rd1-ae
   - fvp-v3-r1
   # Nativesdk to test x86-64
   - nativesdk-fvp-base-a-aem
   - nativesdk-fvp-corstone1000
+  - nativesdk-fvp-corstone1000-a320
   - nativesdk-fvp-rd1-ae
   - nativesdk-fvp-v3-r1
   # These are x86 only... :(
diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-b=
sp/conf/machine/corstone1000-fvp.conf
index ecdb4e193b3a..07f299602c9a 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -22,6 +22,7 @@ DEFAULT_TEST_SUITES:append =3D " fvp_boot fvp_devices"
=20
 # FVP Config
 FVP_PROVIDER ?=3D "fvp-corstone1000-native"
+FVP_PROVIDER:cortexa320 ?=3D "fvp-corstone1000-a320-native"
 FVP_EXE ?=3D "FVP_Corstone-1000"
 FVP_EXE:cortexa320 =3D "FVP_Corstone-1000-A320"
 FVP_CONSOLES[default] =3D "host_terminal_0"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-corstone1000-a320.bb b/met=
a-arm/recipes-devtools/fvp/fvp-corstone1000-a320.bb
new file mode 100644
index 000000000000..f3093d7173cb
--- /dev/null
+++ b/meta-arm/recipes-devtools/fvp/fvp-corstone1000-a320.bb
@@ -0,0 +1,24 @@
+require fvp-ecosystem.inc
+
+MODEL =3D "Corstone-1000-with-Cortex-A320"
+MODEL_CODE =3D "FVP_Corstone_1000-A320"
+PV =3D "11.30.27"
+
+FVP_AARCH64_SHA256SUM =3D "a45898fead5549779153263c3544fa1032c285d532275=
eb678f58cae3317b01f"
+FVP_X86_64_SHA256SUM =3D "d57b248a1c1bc5a6040605d50af94a5151adc4da26ec9a=
cc456ec86b819ffb76"
+
+SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Co=
rstone-IoT/${MODEL}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;subdir=3D${BP=
};name=3Dfvp-${HOST_ARCH}"
+SRC_URI[fvp-aarch64.sha256sum] =3D "${FVP_AARCH64_SHA256SUM}"
+SRC_URI[fvp-x86_64.sha256sum] =3D "${FVP_X86_64_SHA256SUM}"
+
+# The CSS used in the FVP homepage make it too difficult to query with t=
he tooling currently in Yocto
+UPSTREAM_VERSION_UNKNOWN =3D "1"
+
+LIC_FILES_CHKSUM =3D "\
+    file://license_terms/license_agreement.txt;md5=3D1a33828e132ba71861c=
11688dbb0bd16 \
+    file://license_terms/third_party_licenses/third_party_licenses.txt;m=
d5=3Da5ce56e117d0ab63791fbb7c35ec2211 \
+"
+
+COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux"
+INSANE_SKIP:${PN} +=3D "staticdev rpaths useless-rpaths"
+INSANE_SKIP:nativesdk-${PN} +=3D "staticdev rpaths useless-rpaths"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb b/meta-arm=
/recipes-devtools/fvp/fvp-corstone1000.bb
index 1cf8a457efc5..b4288275c8fd 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb
@@ -1,31 +1,22 @@
 require fvp-ecosystem.inc
=20
 MODEL =3D "Corstone-1000"
-MODEL:cortexa320 =3D "Corstone-1000-with-Cortex-A320"
 MODEL_CODE =3D "FVP_Corstone_1000"
-MODEL_CODE:cortexa320 =3D "FVP_Corstone_1000-A320"
 PV =3D "11.23.25"
-PV:cortexa320 =3D "11.30.27"
=20
 FVP_AARCH64_SHA256SUM =3D "e299e81d5fa8b3d2afee0850fd03be31c1a1c3fad07f7=
9849c63e46ee5e36acc"
-FVP_AARCH64_SHA256SUM:cortexa320 =3D "a45898fead5549779153263c3544fa1032=
c285d532275eb678f58cae3317b01f"
 FVP_X86_64_SHA256SUM =3D "ec34c9564ccb5b1eb62fc2757673343a353db1d116a7cb=
1b5f82f9d985d99cdf"
-FVP_X86_64_SHA256SUM:cortexa320 =3D "d57b248a1c1bc5a6040605d50af94a5151a=
dc4da26ec9acc456ec86b819ffb76"
=20
 SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Co=
rstone-IoT/${MODEL}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;subdir=3D${BP=
};name=3Dfvp-${HOST_ARCH}"
 SRC_URI[fvp-aarch64.sha256sum] =3D "${FVP_AARCH64_SHA256SUM}"
 SRC_URI[fvp-x86_64.sha256sum] =3D "${FVP_X86_64_SHA256SUM}"
=20
-
 # The CSS used in the FVP homepage make it too difficult to query with t=
he tooling currently in Yocto
 UPSTREAM_VERSION_UNKNOWN =3D "1"
=20
-LIC_FILES_CHKSUM_MD5 =3D "0c32ac6f58ebff83065105042ab98211"
-LIC_FILES_CHKSUM_MD5:cortexa320 =3D "a5ce56e117d0ab63791fbb7c35ec2211"
-
 LIC_FILES_CHKSUM =3D "\
     file://license_terms/license_agreement.txt;md5=3D1a33828e132ba71861c=
11688dbb0bd16 \
-    file://license_terms/third_party_licenses/third_party_licenses.txt;m=
d5=3D${LIC_FILES_CHKSUM_MD5} \
+    file://license_terms/third_party_licenses/third_party_licenses.txt;m=
d5=3D0c32ac6f58ebff83065105042ab98211 \
 "
=20
 COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux"
--=20
2.50.1 (Apple Git-155)


