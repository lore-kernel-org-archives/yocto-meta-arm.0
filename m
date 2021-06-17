Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.141.1623934307414946066
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Jun 2021 05:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAB7B12FC
	for <meta-arm@lists.yoctoproject.org>; Thu, 17 Jun 2021 05:51:46 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5583F3F719
	for <meta-arm@lists.yoctoproject.org>; Thu, 17 Jun 2021 05:51:46 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][hardknott 2/9] arm/fvp-base-a-aem: add Architecture Envelope Model FVP for Arm v8-A
Date: Thu, 17 Jun 2021 13:51:36 +0100
Message-Id: <20210617125143.489231-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617125143.489231-1-ross.burton@arm.com>
References: <20210617125143.489231-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add a recipe for the general purpose Armv-A Base RevC AEM FVP.

This FVP is behind a login-wall so the user has to download it themselves=
,
but the FVP is free to use.

Change-Id: I14d7b965a05ff9f405a2a12d4da2afd3dd2ecb87
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/fvp/fvp-base-a-aem.bb    | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-arm/recipes-devtools/fvp/fvp-base-a-aem.bb

diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem.bb b/meta-arm/r=
ecipes-devtools/fvp/fvp-base-a-aem.bb
new file mode 100644
index 0000000..facf821
--- /dev/null
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem.bb
@@ -0,0 +1,26 @@
+require fvp-common.inc
+
+SUMMARY =3D "Arm Fixed Virtual Platform - Armv-A Base RevC Architecture =
Envelope Model FVP"
+HOMEPAGE =3D "https://developer.arm.com/tools-and-software/simulation-mo=
dels/fixed-virtual-platforms/arm-ecosystem-models"
+LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
+                    file://license_terms/third_party_licenses.txt;md5=3D=
b40ecbbbd3409d48263437b782df6df9"
+
+# This FVP cannot be downloaded directly, so download the Armv-A Base Re=
vC AEM
+# FVP yourself from the homepage and set FVP_BASE_A_AEM_TARBALL_URI appr=
opriately
+# (for example, file:///home/user/FVP_Base_RevC-2xAEMvA_11.14_21.tgz).
+FVP_BASE_A_AEM_TARBALL_URI ?=3D ""
+PV =3D "11.14_21"
+
+SRC_URI =3D "${FVP_BASE_A_AEM_TARBALL_URI};subdir=3D${BP}"
+python() {
+    if not d.getVar("FVP_BASE_A_AEM_TARBALL_URI"):
+        raise bb.parse.SkipRecipe("FVP_BASE_A_AEM_TARBALL_URI not set")
+}
+
+do_install() {
+    mkdir --parents ${D}${FVPDIR} ${D}${bindir}
+
+    cp --archive --no-preserve=3Downership ${S}/Base_RevC_AEMvA_pkg/* ${=
D}${FVPDIR}/
+
+    fvp_link_binaries
+}
--=20
2.25.1

