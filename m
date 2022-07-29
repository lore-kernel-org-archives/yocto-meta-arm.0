Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F3A7C00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:16:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.8498.1659104165349741165
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Jul 2022 07:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F12441063;
	Fri, 29 Jul 2022 07:16:04 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3F0A3F73D;
	Fri, 29 Jul 2022 07:16:03 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm/fvp: upgrade FVPs
Date: Fri, 29 Jul 2022 15:16:00 +0100
Message-Id: <20220729141600.1377123-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Jul 2022 14:16:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3611

Upgrade the FVPs to the latest releases, and do some cleanups for future
changes.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-base-a-aem.bb      | 12 ------------
 .../recipes-devtools/fvp/fvp-base-a-aem_11.18.16.bb  | 10 ++++++++++
 .../recipes-devtools/fvp/fvp-base-r-aem_11.18.16.bb  |  1 -
 meta-arm/recipes-devtools/fvp/fvp-common.inc         | 12 ++++++++----
 meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb    |  1 -
 meta-arm/recipes-devtools/fvp/fvp-corstone500.bb     |  3 +++
 meta-arm/recipes-devtools/fvp/fvp-ecosystem.inc      |  3 ---
 meta-arm/recipes-devtools/fvp/fvp-envelope.inc       |  2 ++
 meta-arm/recipes-devtools/fvp/fvp-library.bb         |  6 +++---
 meta-arm/recipes-devtools/fvp/fvp-n1-edge.bb         |  7 ++++---
 meta-arm/recipes-devtools/fvp/fvp-tc0.bb             | 10 ++++++----
 11 files changed, 36 insertions(+), 31 deletions(-)
 delete mode 100644 meta-arm/recipes-devtools/fvp/fvp-base-a-aem.bb
 create mode 100644 meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.18.16=
.bb

diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem.bb b/meta-arm/r=
ecipes-devtools/fvp/fvp-base-a-aem.bb
deleted file mode 100644
index 568fafda..00000000
--- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require fvp-envelope.inc
-
-SUMMARY =3D "Arm Fixed Virtual Platform - Armv-A Base RevC Architecture =
Envelope Model FVP"
-LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
-                    file://license_terms/third_party_licenses.txt;md5=3D=
41029e71051b1c786bae3112a29905a7"
-
-PV =3D "11.17.21"
-
-SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/ecosystem=
-models/${MODEL_CODE}_${PV_URL}.tgz;subdir=3D${BP}"
-SRC_URI[sha256sum] =3D "ef42f685b4b970e56f6b14a5a76acb4eb88987dcb614d578=
8eee4d8ef5cf9b28"
-
-MODEL_CODE =3D "FVP_Base_RevC-2xAEMvA"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.18.16.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.18.16.bb
new file mode 100644
index 00000000..4d8519e3
--- /dev/null
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.18.16.bb
@@ -0,0 +1,10 @@
+require fvp-envelope.inc
+
+SUMMARY =3D "Arm Fixed Virtual Platform - Armv-A Base RevC Architecture =
Envelope Model FVP"
+LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
+                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D34a1ba318d745f05e6197def68ea5411 \
+                    file://license_terms/third_party_licenses/arm_licens=
e_management_utilities/third_party_licenses.txt;md5=3D2e53bda6ff2db4c35d6=
9944b93926c9f"
+
+SRC_URI[sha256sum] =3D "fe76f9ff217a44ed7680a0a6ccd6bd19758f5e0466ff98cc=
d82b2ae62289b9fe"
+
+MODEL_CODE =3D "FVP_Base_RevC-2xAEMvA"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.18.16.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.18.16.bb
index 88851892..e8704c2f 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.18.16.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.18.16.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://license_terms/license_agreem=
ent.txt;md5=3D1a33828e132ba
                     file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D34a1ba318d745f05e6197def68ea5411 \
                     file://license_terms/third_party_licenses/arm_licens=
e_management_utilities/third_party_licenses.txt;md5=3D2e53bda6ff2db4c35d6=
9944b93926c9f"
=20
-SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/ecosystem=
-models/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;subdir=3D${BP}"
 SRC_URI[sha256sum] =3D "a7a5ee0b7f3b84a2e98e136a6f3ab648e4b6b5ad365186a3=
97595f3f7c69f558"
=20
 MODEL_CODE =3D "FVP_Base_AEMv8R"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-common.inc b/meta-arm/reci=
pes-devtools/fvp/fvp-common.inc
index 12c933db..dd02a7c9 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-common.inc
+++ b/meta-arm/recipes-devtools/fvp/fvp-common.inc
@@ -6,12 +6,14 @@ LICENSE_FLAGS =3D "Arm-FVP-EULA"
=20
 LICENSE =3D "Proprietary & Apache-2.0 & Python-2.0 & GPL-3.0-with-GCC-ex=
ception & Zlib & NCSA & LGPL-2.0-or-later & MIT & BSD-3-Clause"
=20
-COMPATIBLE_HOST =3D '(x86_64|i.86).*-linux'
+COMPATIBLE_HOST =3D "x86_64.*-linux"
=20
 # The architecture-specific download filename suffix
-FVP_ARCH =3D "Linux64"
+FVP_ARCH:aarch64 =3D "Linux64_armv8l"
+FVP_ARCH:x86-64 =3D "Linux64"
+
 # The architecture-specific directory the binaries are installed under
-FVP_ARCH_DIR =3D "${FVP_ARCH}_GCC-*"
+FVP_ARCH_DIR =3D "${FVP_ARCH}"
=20
 def get_real_pv(d):
     # FVP versions are like 11.12_43
@@ -28,7 +30,7 @@ FVPDIR =3D "${libdir}/fvp/${BPN}"
=20
 # Used in do_install to create symlinks in $bindir to $FVPDIR
 fvp_link_binaries() {
-    DIR=3D"${D}${FVPDIR}/models/${FVP_ARCH_DIR}"
+    DIR=3D"${D}${FVPDIR}/models/${FVP_ARCH_DIR}*"
=20
     stat $DIR/FVP_* >/dev/null 2>&1 || bbfatal Cannot find FVP binaries =
in $DIR
=20
@@ -45,6 +47,8 @@ FILES:${PN} =3D "${bindir} ${FVPDIR}"
 INSANE_SKIP:${PN} +=3D "already-stripped"
 # FVP can optionally have a GUI, but we can use the host libraries in na=
tive/nativesdk
 INSANE_SKIP:${PN} +=3D "file-rdeps"
+# GNU_HASH warnings
+INSANE_SKIP:${PN} +=3D "ldflags"
=20
 # FVP brings its own standard library so don't let it be used as a shlib=
 provider
 PRIVATE_LIBS =3D "libgcc_s.so.1 libstdc++.so.6"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb b/meta-arm=
/recipes-devtools/fvp/fvp-corstone1000.bb
index b7b22f12..35ffe0b7 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb
@@ -9,4 +9,3 @@ SRC_URI[sha256sum] =3D "00ccb72d02c90e2424d24a625d275cabf=
8ea8dc024713985208f618bb8
=20
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
                     file://license_terms/third_party_licenses.txt;md5=3D=
41029e71051b1c786bae3112a29905a7"
-
diff --git a/meta-arm/recipes-devtools/fvp/fvp-corstone500.bb b/meta-arm/=
recipes-devtools/fvp/fvp-corstone500.bb
index 14704145..c80b94c4 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-corstone500.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-corstone500.bb
@@ -5,3 +5,6 @@ MODEL_CODE =3D "FVP_Corstone_500"
 PV =3D "11.12.59"
=20
 SRC_URI[sha256sum] =3D "26f0fbb52de2ccdb4c7b40b6f4ddb5eabdcb8173775fdd11=
c9a12173326f8614"
+
+LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
+                    file://license_terms/third_party_licenses.txt;md5=3D=
47473b1e04b70938cf0a7ffea8ea4cc3"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-ecosystem.inc b/meta-arm/r=
ecipes-devtools/fvp/fvp-ecosystem.inc
index ef01bdc1..365b39c4 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-ecosystem.inc
+++ b/meta-arm/recipes-devtools/fvp/fvp-ecosystem.inc
@@ -10,9 +10,6 @@ HOMEPAGE =3D "https://developer.arm.com/tools-and-softw=
are/open-source-software/ar
=20
 SRC_URI =3D "https://developer.arm.com/-/media/Arm%20Developer%20Communi=
ty/Downloads/OSS/FVP/${MODEL}/${MODEL_CODE}_${PV_URL}.tgz;subdir=3D${BP}"
=20
-LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
-                    file://license_terms/third_party_licenses.txt;md5=3D=
47473b1e04b70938cf0a7ffea8ea4cc3"
-
 UPSTREAM_CHECK_URI =3D "${HOMEPAGE}"
 UPSTREAM_CHECK_REGEX =3D "${MODEL_CODE}_(?P<pver>(\d+[\.\-_]*)+).tgz"
=20
diff --git a/meta-arm/recipes-devtools/fvp/fvp-envelope.inc b/meta-arm/re=
cipes-devtools/fvp/fvp-envelope.inc
index 4f6bb370..887d9d27 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-envelope.inc
+++ b/meta-arm/recipes-devtools/fvp/fvp-envelope.inc
@@ -2,6 +2,8 @@ require fvp-common.inc
=20
 HOMEPAGE =3D "https://developer.arm.com/tools-and-software/simulation-mo=
dels/fixed-virtual-platforms/arm-ecosystem-models"
=20
+SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/ecosystem=
-models/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;subdir=3D${BP}"
+
 UPSTREAM_CHECK_URI =3D "${HOMEPAGE}"
 UPSTREAM_CHECK_REGEX =3D "${MODEL_CODE}_(?P<pver>(\d+[\.\-_]*)+).tgz"
=20
diff --git a/meta-arm/recipes-devtools/fvp/fvp-library.bb b/meta-arm/reci=
pes-devtools/fvp/fvp-library.bb
index ab1de8c3..1a4319eb 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-library.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-library.bb
@@ -2,7 +2,7 @@ require fvp-ecosystem.inc
=20
 MODEL =3D "Library"
 MODEL_CODE =3D "FVP_ARM_Std_Library"
-PV =3D "11.15_14"
+PV =3D "11.18.16"
=20
 HOMEPAGE =3D "https://developer.arm.com/tools-and-software/simulation-mo=
dels/fixed-virtual-platforms"
=20
@@ -12,10 +12,10 @@ LIC_FILES_CHKSUM =3D "file://license_terms/license_ag=
reement.txt;md5=3Da50d186fffa51
=20
 # The FVP Library tarball cannot be downloaded directly, so download the=
 it
 # yourself from from the homepage and set FVP_LIBRARY_TARBALL_URI approp=
riately
-# (for example, "file:///home/user/FVP_ARM_Std_Library_11.14_21.tgz").
+# to the directory that contains the tarball (for example, "file:///home=
/user/").
 FVP_LIBRARY_TARBALL_URI ?=3D ""
=20
-SRC_URI =3D "${FVP_LIBRARY_TARBALL_URI};subdir=3D${BP}"
+SRC_URI =3D "${FVP_LIBRARY_TARBALL_URI}/${MODEL_CODE}_${PV_URL}_${FVP_AR=
CH}.tgz;subdir=3D${BP}"
 python() {
     if not d.getVar("FVP_LIBRARY_TARBALL_URI"):
         raise bb.parse.SkipRecipe("FVP_LIBRARY_TARBALL_URI not set")
diff --git a/meta-arm/recipes-devtools/fvp/fvp-n1-edge.bb b/meta-arm/reci=
pes-devtools/fvp/fvp-n1-edge.bb
index f7ccf729..7fc3949b 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-n1-edge.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-n1-edge.bb
@@ -2,9 +2,10 @@ require fvp-ecosystem.inc
=20
 MODEL =3D "Neoverse-N1"
 MODEL_CODE =3D "FVP_RD_N1_edge"
-PV =3D "11.15.26"
+PV =3D "11.17.29"
=20
-SRC_URI[sha256sum] =3D "a85026312f9784ad0d164ffc2cea4344b197d6fefff4aa04=
605a5eac8ff4ee37"
+SRC_URI =3D "https://developer.arm.com/-/media/Arm%20Developer%20Communi=
ty/Downloads/OSS/FVP/${MODEL}/${MODEL_CODE}_${PV_URL}_Linux64.tgz;subdir=3D=
${BP}"
+SRC_URI[sha256sum] =3D "76f5d6ec50b64fad6d8d901101d9ae2c62805f50fcfd0edb=
125bc2c68de8c8f2"
=20
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
-                    file://license_terms/third_party_licenses.txt;md5=3D=
3db0c4947b7e3405c40b943672d8de2f"
+                    file://license_terms/third_party_licenses.txt;md5=3D=
41029e71051b1c786bae3112a29905a7"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-tc0.bb b/meta-arm/recipes-=
devtools/fvp/fvp-tc0.bb
index bdcd5cab..78f2fc22 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-tc0.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-tc0.bb
@@ -2,9 +2,11 @@ require fvp-ecosystem.inc
=20
 MODEL =3D "TotalCompute"
 MODEL_CODE =3D "FVP_TC0"
-PV =3D "11.15.20"
+PV =3D "11.17.18"
=20
-SRC_URI[sha256sum] =3D "792ddb425eba0714a1590aa8e404845b7654758c66374569=
3216ae1343ceef2d"
+# Unconventional URI structure for this release
+SRC_URI =3D "https://developer.arm.com/-/media/Arm%20Developer%20Communi=
ty/Downloads/OSS/FVP/TotalCompute/Total%20Compute%20Update%202022/FVP_TC0=
_11.17_18.tgz;subdir=3D${BP}"
+SRC_URI[sha256sum] =3D "0bd78354e036a7e92bd7f8cbd78cd2b5197dc0872fe2b25c=
95ea734929fe83b8"
=20
-LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3Da=
50d186fffa51ed55599183aad911298 \
-                    file://license_terms/third_party_licenses.txt;md5=3D=
3db0c4947b7e3405c40b943672d8de2f"
+LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
+                    file://license_terms/third_party_licenses.txt;md5=3D=
41029e71051b1c786bae3112a29905a7"
--=20
2.34.1


