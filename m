Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.780.1632161188670113856
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Sep 2021 11:06:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E61BB11D4
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 11:06:27 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91D1C3F718
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 11:06:27 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 03/12] arm/fvp-base-a-aem: use public SRC_URI
Date: Mon, 20 Sep 2021 19:06:13 +0100
Message-Id: <20210920180622.3614621-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920180622.3614621-1-ross.burton@arm.com>
References: <20210920180622.3614621-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This FVP is now freely available without a login, so we can download it
directly.

Change-Id: I8ba041c44233cfbba5e3c223f07acc531a2e5f5c
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-base-a-aem.bb | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem.bb b/meta-arm/r=
ecipes-devtools/fvp/fvp-base-a-aem.bb
index 1d4e2a39..22907ad9 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem.bb
@@ -2,16 +2,9 @@ require fvp-envelope.inc
=20
 SUMMARY =3D "Arm Fixed Virtual Platform - Armv-A Base RevC Architecture =
Envelope Model FVP"
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
-                    file://license_terms/third_party_licenses.txt;md5=3D=
b40ecbbbd3409d48263437b782df6df9"
+                    file://license_terms/third_party_licenses.txt;md5=3D=
3db0c4947b7e3405c40b943672d8de2f"
=20
-# This FVP cannot be downloaded directly, so download the Armv-A Base Re=
vC AEM
-# FVP yourself from the homepage and set FVP_BASE_A_AEM_TARBALL_URI appr=
opriately
-# (for example, file:///home/user/FVP_Base_RevC-2xAEMvA_11.14_21.tgz).
-FVP_BASE_A_AEM_TARBALL_URI ?=3D ""
-PV =3D "11.14_21"
+PV =3D "11.15_18"
=20
-SRC_URI =3D "${FVP_BASE_A_AEM_TARBALL_URI};subdir=3D${BP}"
-python() {
-    if not d.getVar("FVP_BASE_A_AEM_TARBALL_URI"):
-        raise bb.parse.SkipRecipe("FVP_BASE_A_AEM_TARBALL_URI not set")
-}
+SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/ecosystem=
-models/FVP_Base_RevC-2xAEMvA_${PV}.tgz;subdir=3D${BP}"
+SRC_URI[sha256sum] =3D "05e474d6b8197c749c66968315fdb7059d398b279bef5978=
7025a88219c71ae4"
--=20
2.25.1

