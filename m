Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79FA8C369D2
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 13:12:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11289.1744981943619399192
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Apr 2025 06:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7883614BF
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 06:12:20 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4BAB03F66E
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 06:12:23 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/4] arm/fvps: correct broken versions
Date: Fri, 18 Apr 2025 09:12:19 -0400
Message-Id: <20250418131222.95241-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 13:12:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6472

With the change to webpages for the FVPs, it is not possible to detect
new versions anymore.  Add UPSTREAM_VERSION_UNKNOWN to avoid the
"UNKNOWN_BORKEN" when running `devtool check-upgrade-status`

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.28.23.bb | 1 -
 meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb        | 3 ++-
 meta-arm/recipes-devtools/fvp/fvp-envelope.inc           | 4 ++--
 meta-arm/recipes-devtools/fvp/fvp-rd1-ae.bb              | 3 +++
 meta-arm/recipes-devtools/fvp/fvp-sgi575.bb              | 3 +++
 meta-arm/recipes-devtools/fvp/fvp-tc3.bb                 | 3 +++
 meta-arm/recipes-devtools/fvp/fvp-v3-r1.bb               | 3 +++
 7 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.28.23.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.28.23.bb
index 45fd21fee783..46884520e11d 100644
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
-SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Ar=
chitecture/${PV_URL_SHORT}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;subdir=
=3D${BP};name=3Dfvp-${HOST_ARCH}"
 SRC_URI[fvp-aarch64.sha256sum] =3D "a380e271f14ce7cf99158018368ac86fe8c3=
05f82c7d332a93eb08bf7a172571"
 SRC_URI[fvp-x86_64.sha256sum] =3D "0f6d67d834a8ed5dff3c863e0e3545ef39c73=
6405ea8227577ac004cffd66e93"
=20
diff --git a/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb b/meta-arm=
/recipes-devtools/fvp/fvp-corstone1000.bb
index aef9edde510d..e200d94c78ed 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb
@@ -8,7 +8,8 @@ SRC_URI =3D "https://developer.arm.com/-/media/Arm%20Deve=
loper%20Community/Downloa
 SRC_URI[fvp-aarch64.sha256sum] =3D "e299e81d5fa8b3d2afee0850fd03be31c1a1=
c3fad07f79849c63e46ee5e36acc"
 SRC_URI[fvp-x86_64.sha256sum] =3D "ec34c9564ccb5b1eb62fc2757673343a353db=
1d116a7cb1b5f82f9d985d99cdf"
=20
-UPSTREAM_CHECK_REGEX =3D "${MODEL_CODE}_(?P<pver>(\d+[\.\-_]*)+)_${FVP_A=
RCH}\.tgz"
+# The CSS used in the FVP homepage make it too difficult to query with t=
he tooling currently in Yocto
+UPSTREAM_VERSION_UNKNOWN =3D "1"
=20
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
                     file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D0c32ac6f58ebff83065105042ab98211"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-envelope.inc b/meta-arm/re=
cipes-devtools/fvp/fvp-envelope.inc
index f48d823f60a3..a52691ebc505 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-envelope.inc
+++ b/meta-arm/recipes-devtools/fvp/fvp-envelope.inc
@@ -1,8 +1,8 @@
 require fvp-common.inc
=20
-HOMEPAGE =3D "https://developer.arm.com/Tools%20and%20Software/Fixed%20V=
irtual%20Platforms"
+HOMEPAGE =3D "https://developer.arm.com/Tools%20and%20Software/Fixed%20V=
irtual%20Platforms/Arm%20Architecture%20FVPs"
=20
-SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/ecosystem=
-models/${PV_URL_SHORT}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;subdir=3D=
${BP};name=3Dfvp-${HOST_ARCH}"
+SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Ar=
chitecture/${PV_URL_SHORT}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;subdir=
=3D${BP};name=3Dfvp-${HOST_ARCH}"
=20
 UPSTREAM_CHECK_URI =3D "${HOMEPAGE}"
 UPSTREAM_CHECK_REGEX =3D "${MODEL_CODE}_(?P<pver>(\d+[\.\-_]*)+).tgz"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-rd1-ae.bb b/meta-arm/recip=
es-devtools/fvp/fvp-rd1-ae.bb
index 56558f83486d..bf5671f09c13 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-rd1-ae.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-rd1-ae.bb
@@ -8,6 +8,9 @@ SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/pe=
rmalink/FVPs-Automotive/$
 SRC_URI[fvp-aarch64.sha256sum] =3D "297ded55d025772c9ad8497c6a97e0619fc1=
762dd1236e3ddec14da449f51ca4"
 SRC_URI[fvp-x86_64.sha256sum] =3D "e2b01fafac9cd560ed7a42f155241971d0cef=
086404c56bbb44dc6c9bf672e7d"
=20
+# The CSS used in the FVP homepage make it too difficult to query with t=
he tooling currently in Yocto
+UPSTREAM_VERSION_UNKNOWN =3D "1"
+
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
                     file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3Da3ce84371977a6b9c624408238309a90"
=20
diff --git a/meta-arm/recipes-devtools/fvp/fvp-sgi575.bb b/meta-arm/recip=
es-devtools/fvp/fvp-sgi575.bb
index efdd46f8ef4d..99a9940c37de 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-sgi575.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-sgi575.bb
@@ -6,5 +6,8 @@ PV =3D "11.15.26"
=20
 SRC_URI[sha256sum] =3D "d07241112f6c146362deec789e782e10e83bc3560cf605cc=
d055a606d0b44e74"
=20
+# The CSS used in the FVP homepage make it too difficult to query with t=
he tooling currently in Yocto
+UPSTREAM_VERSION_UNKNOWN =3D "1"
+
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
                     file://license_terms/third_party_licenses.txt;md5=3D=
3db0c4947b7e3405c40b943672d8de2f"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-tc3.bb b/meta-arm/recipes-=
devtools/fvp/fvp-tc3.bb
index e63a848a57e8..2b0f257db6db 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-tc3.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-tc3.bb
@@ -7,5 +7,8 @@ PV =3D "11.26.16"
 SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/permalink/FVPs-To=
tal-Compute/Total-Compute-TC3/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;sub=
dir=3D${BP}"
 SRC_URI[sha256sum] =3D "1d72b508e5d8b50de0e389140b4930e5de53c48ba0d3e086=
5ed4d15898610069"
=20
+# The CSS used in the FVP homepage make it too difficult to query with t=
he tooling currently in Yocto
+UPSTREAM_VERSION_UNKNOWN =3D "1"
+
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
                     file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D58b552b918d097a8ba802168312d76b2"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-v3-r1.bb b/meta-arm/recipe=
s-devtools/fvp/fvp-v3-r1.bb
index 5a451effafb6..a0de2a5baa6b 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-v3-r1.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-v3-r1.bb
@@ -8,6 +8,9 @@ SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/pe=
rmalink/FVPs-Neoverse-Inf
 SRC_URI[fvp-aarch64.sha256sum] =3D "6b25961a7dcac99ff5d2c63f297e1598b05e=
67938d71353b37c82e3d58d7ac3c"
 SRC_URI[fvp-x86_64.sha256sum] =3D "72f659ee3554ab0330984f35b2d640ea6553b=
bcbbf77cc485555be14277e4bc3"
=20
+# The CSS used in the FVP homepage make it too difficult to query with t=
he tooling currently in Yocto
+UPSTREAM_VERSION_UNKNOWN =3D "1"
+
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
                     file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D9ddd501715f7e1fed82c57b260b020ba"
=20
--=20
2.39.5 (Apple Git-154)


