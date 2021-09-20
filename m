Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.772.1632161188484205405
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Sep 2021 11:06:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FCA4113E
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 11:06:27 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B71C3F718
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 11:06:26 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 02/12] arm/fvp-base-*: factor out commonality to fvp-envelope.inc
Date: Mon, 20 Sep 2021 19:06:12 +0100
Message-Id: <20210920180622.3614621-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920180622.3614621-1-ross.burton@arm.com>
References: <20210920180622.3614621-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The fvp-base-a-aem and fvp-base-r-aem recipes have a lot in common, so
extract that into a fvp-envelope.inc file.

Change-Id: I9390f05e98bec0c1a236bc3c5d55b7144da1e1fd
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-base-a-aem.bb | 11 +----------
 meta-arm/recipes-devtools/fvp/fvp-base-r-aem.bb | 11 +----------
 meta-arm/recipes-devtools/fvp/fvp-envelope.inc  | 11 +++++++++++
 3 files changed, 13 insertions(+), 20 deletions(-)
 create mode 100644 meta-arm/recipes-devtools/fvp/fvp-envelope.inc

diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem.bb b/meta-arm/r=
ecipes-devtools/fvp/fvp-base-a-aem.bb
index facf8215..1d4e2a39 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem.bb
@@ -1,7 +1,6 @@
-require fvp-common.inc
+require fvp-envelope.inc
=20
 SUMMARY =3D "Arm Fixed Virtual Platform - Armv-A Base RevC Architecture =
Envelope Model FVP"
-HOMEPAGE =3D "https://developer.arm.com/tools-and-software/simulation-mo=
dels/fixed-virtual-platforms/arm-ecosystem-models"
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
                     file://license_terms/third_party_licenses.txt;md5=3D=
b40ecbbbd3409d48263437b782df6df9"
=20
@@ -16,11 +15,3 @@ python() {
     if not d.getVar("FVP_BASE_A_AEM_TARBALL_URI"):
         raise bb.parse.SkipRecipe("FVP_BASE_A_AEM_TARBALL_URI not set")
 }
-
-do_install() {
-    mkdir --parents ${D}${FVPDIR} ${D}${bindir}
-
-    cp --archive --no-preserve=3Downership ${S}/Base_RevC_AEMvA_pkg/* ${=
D}${FVPDIR}/
-
-    fvp_link_binaries
-}
diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-r-aem.bb b/meta-arm/r=
ecipes-devtools/fvp/fvp-base-r-aem.bb
index 50e6402a..67c5564e 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-r-aem.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-r-aem.bb
@@ -1,7 +1,6 @@
-require fvp-common.inc
+require fvp-envelope.inc
=20
 SUMMARY =3D "Arm Fixed Virtual Platform - Armv8-R Base Architecture Enve=
lope Model FVP"
-HOMEPAGE =3D "https://developer.arm.com/tools-and-software/simulation-mo=
dels/fixed-virtual-platforms/arm-ecosystem-models"
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
                     file://license_terms/third_party_licenses.txt;md5=3D=
3db0c4947b7e3405c40b943672d8de2f"
=20
@@ -16,11 +15,3 @@ python() {
     if not d.getVar("FVP_BASE_R_AEM_TARBALL_URI"):
         raise bb.parse.SkipRecipe("FVP_BASE_R_AEM_TARBALL_URI not set")
 }
-
-do_install() {
-    mkdir --parents ${D}${FVPDIR} ${D}${bindir}
-
-    cp --archive --no-preserve=3Downership ${S}/AEMv8R_base_pkg//* ${D}$=
{FVPDIR}/
-
-    fvp_link_binaries
-}
diff --git a/meta-arm/recipes-devtools/fvp/fvp-envelope.inc b/meta-arm/re=
cipes-devtools/fvp/fvp-envelope.inc
new file mode 100644
index 00000000..eda98762
--- /dev/null
+++ b/meta-arm/recipes-devtools/fvp/fvp-envelope.inc
@@ -0,0 +1,11 @@
+require fvp-common.inc
+
+HOMEPAGE =3D "https://developer.arm.com/tools-and-software/simulation-mo=
dels/fixed-virtual-platforms/arm-ecosystem-models"
+
+do_install() {
+    mkdir --parents ${D}${FVPDIR} ${D}${bindir}
+
+    cp --archive --no-preserve=3Downership ${S}/*_pkg/* ${D}${FVPDIR}/
+
+    fvp_link_binaries
+}
--=20
2.25.1

