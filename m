Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0413C36011
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 13:29:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11138.1743168544713675609
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 06:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2346C169C
	for <meta-arm@lists.yoctoproject.org>; Fri, 28 Mar 2025 06:29:09 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2D47F3F63F
	for <meta-arm@lists.yoctoproject.org>; Fri, 28 Mar 2025 06:29:04 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/fvp: add TC3 and Neoverse v3, remove n1 edge
Date: Fri, 28 Mar 2025 09:29:02 -0400
Message-Id: <20250328132903.66472-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250328132903.66472-1-jon.mason@arm.com>
References: <20250328132903.66472-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 28 Mar 2025 13:29:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6422

Add Total Compute 2023, Neoverse V3 R1, and Reference Design-1 AE FVPs.
Also, remove Neoverse N1 Edge.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/fvps.yml                                        |  7 ++++++-
 .../fvp/fvp-base-a-aem_11.28.23.bb                 |  1 -
 meta-arm/recipes-devtools/fvp/fvp-n1-edge.bb       | 11 -----------
 meta-arm/recipes-devtools/fvp/fvp-rd1-ae.bb        | 14 ++++++++++++++
 meta-arm/recipes-devtools/fvp/fvp-tc3.bb           | 11 +++++++++++
 meta-arm/recipes-devtools/fvp/fvp-v3-r1.bb         | 14 ++++++++++++++
 6 files changed, 45 insertions(+), 13 deletions(-)
 delete mode 100644 meta-arm/recipes-devtools/fvp/fvp-n1-edge.bb
 create mode 100644 meta-arm/recipes-devtools/fvp/fvp-rd1-ae.bb
 create mode 100644 meta-arm/recipes-devtools/fvp/fvp-tc3.bb
 create mode 100644 meta-arm/recipes-devtools/fvp/fvp-v3-r1.bb

diff --git a/ci/fvps.yml b/ci/fvps.yml
index 8f1de177848b..e736c519c03d 100644
--- a/ci/fvps.yml
+++ b/ci/fvps.yml
@@ -19,8 +19,13 @@ target:
   # Target packages to test aarch64
   - fvp-base-a-aem
   - fvp-corstone1000
+  - fvp-rd1-ae
+  - fvp-v3-r1
   # Nativesdk to test x86-64
   - nativesdk-fvp-base-a-aem
   - nativesdk-fvp-corstone1000
-  - nativesdk-fvp-n1-edge
+  - nativesdk-fvp-rd1-ae
+  - nativesdk-fvp-v3-r1
+  # These are x86 only... :(
   - nativesdk-fvp-sgi575
+  - nativesdk-fvp-tc3
diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.28.23.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.28.23.bb
index 8c7e4dc668eb..f411276bd4bd 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.28.23.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.28.23.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://license_terms/license_agreem=
ent.txt;md5=3D1a33828e132ba
                     file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3Dc51b57b6a4731881849eb0e2e2b6d799 \
                     file://license_terms/third_party_licenses/arm_licens=
e_management_utilities/third_party_licenses.txt;md5=3Dabcaafefc7b7a0cdf66=
64c51f9075c5b"
=20
-
 SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Ar=
chitecture/${PV_URL_SHORT}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;subdir=
=3D${BP};name=3Dfvp-${HOST_ARCH}"
 SRC_URI[fvp-aarch64.sha256sum] =3D "a380e271f14ce7cf99158018368ac86fe8c3=
05f82c7d332a93eb08bf7a172571"
 SRC_URI[fvp-x86_64.sha256sum] =3D "0f6d67d834a8ed5dff3c863e0e3545ef39c73=
6405ea8227577ac004cffd66e93"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-n1-edge.bb b/meta-arm/reci=
pes-devtools/fvp/fvp-n1-edge.bb
deleted file mode 100644
index 7fc3949b880b..000000000000
--- a/meta-arm/recipes-devtools/fvp/fvp-n1-edge.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require fvp-ecosystem.inc
-
-MODEL =3D "Neoverse-N1"
-MODEL_CODE =3D "FVP_RD_N1_edge"
-PV =3D "11.17.29"
-
-SRC_URI =3D "https://developer.arm.com/-/media/Arm%20Developer%20Communi=
ty/Downloads/OSS/FVP/${MODEL}/${MODEL_CODE}_${PV_URL}_Linux64.tgz;subdir=3D=
${BP}"
-SRC_URI[sha256sum] =3D "76f5d6ec50b64fad6d8d901101d9ae2c62805f50fcfd0edb=
125bc2c68de8c8f2"
-
-LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
-                    file://license_terms/third_party_licenses.txt;md5=3D=
41029e71051b1c786bae3112a29905a7"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-rd1-ae.bb b/meta-arm/recip=
es-devtools/fvp/fvp-rd1-ae.bb
new file mode 100644
index 000000000000..56558f83486d
--- /dev/null
+++ b/meta-arm/recipes-devtools/fvp/fvp-rd1-ae.bb
@@ -0,0 +1,14 @@
+require fvp-ecosystem.inc
+
+MODEL =3D "RD-1_AE"
+MODEL_CODE =3D "FVP_RD_1_AE"
+PV =3D "11.27.20"
+
+SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Au=
tomotive/${MODEL}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;subdir=3D${BP};=
name=3Dfvp-${HOST_ARCH}"
+SRC_URI[fvp-aarch64.sha256sum] =3D "297ded55d025772c9ad8497c6a97e0619fc1=
762dd1236e3ddec14da449f51ca4"
+SRC_URI[fvp-x86_64.sha256sum] =3D "e2b01fafac9cd560ed7a42f155241971d0cef=
086404c56bbb44dc6c9bf672e7d"
+
+LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
+                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3Da3ce84371977a6b9c624408238309a90"
+
+COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-tc3.bb b/meta-arm/recipes-=
devtools/fvp/fvp-tc3.bb
new file mode 100644
index 000000000000..e63a848a57e8
--- /dev/null
+++ b/meta-arm/recipes-devtools/fvp/fvp-tc3.bb
@@ -0,0 +1,11 @@
+require fvp-ecosystem.inc
+
+MODEL =3D "TC3"
+MODEL_CODE =3D "FVP_TC3"
+PV =3D "11.26.16"
+
+SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/permalink/FVPs-To=
tal-Compute/Total-Compute-TC3/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;sub=
dir=3D${BP}"
+SRC_URI[sha256sum] =3D "1d72b508e5d8b50de0e389140b4930e5de53c48ba0d3e086=
5ed4d15898610069"
+
+LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
+                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D58b552b918d097a8ba802168312d76b2"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-v3-r1.bb b/meta-arm/recipe=
s-devtools/fvp/fvp-v3-r1.bb
new file mode 100644
index 000000000000..5a451effafb6
--- /dev/null
+++ b/meta-arm/recipes-devtools/fvp/fvp-v3-r1.bb
@@ -0,0 +1,14 @@
+require fvp-ecosystem.inc
+
+MODEL =3D "RD-V3-r1"
+MODEL_CODE =3D "FVP_RD_V3_R1"
+PV =3D "11.27.51"
+
+SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Ne=
overse-Infrastructure/${MODEL}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;su=
bdir=3D${BP};name=3Dfvp-${HOST_ARCH}"
+SRC_URI[fvp-aarch64.sha256sum] =3D "6b25961a7dcac99ff5d2c63f297e1598b05e=
67938d71353b37c82e3d58d7ac3c"
+SRC_URI[fvp-x86_64.sha256sum] =3D "72f659ee3554ab0330984f35b2d640ea6553b=
bcbbf77cc485555be14277e4bc3"
+
+LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
+                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D9ddd501715f7e1fed82c57b260b020ba"
+
+COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux"
--=20
2.39.5 (Apple Git-154)


