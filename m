Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.773.1632161189694011319
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Sep 2021 11:06:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C41E6D
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 11:06:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC0573F718
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 11:06:28 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 05/12] arm/fvp-base-*-aem: use all-dots versions
Date: Mon, 20 Sep 2021 19:06:15 +0100
Message-Id: <20210920180622.3614621-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920180622.3614621-1-ross.burton@arm.com>
References: <20210920180622.3614621-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: Ie1a5f2de6dcdd1331914798f072ce752e4de1532
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-base-a-aem.bb | 4 ++--
 meta-arm/recipes-devtools/fvp/fvp-base-r-aem.bb | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem.bb b/meta-arm/r=
ecipes-devtools/fvp/fvp-base-a-aem.bb
index 22907ad9..6b1e020d 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem.bb
@@ -4,7 +4,7 @@ SUMMARY =3D "Arm Fixed Virtual Platform - Armv-A Base Rev=
C Architecture Envelope M
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
                     file://license_terms/third_party_licenses.txt;md5=3D=
3db0c4947b7e3405c40b943672d8de2f"
=20
-PV =3D "11.15_18"
+PV =3D "11.15.18"
=20
-SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/ecosystem=
-models/FVP_Base_RevC-2xAEMvA_${PV}.tgz;subdir=3D${BP}"
+SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/ecosystem=
-models/FVP_Base_RevC-2xAEMvA_${PV_URL}.tgz;subdir=3D${BP}"
 SRC_URI[sha256sum] =3D "05e474d6b8197c749c66968315fdb7059d398b279bef5978=
7025a88219c71ae4"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-r-aem.bb b/meta-arm/r=
ecipes-devtools/fvp/fvp-base-r-aem.bb
index 67c5564e..6c612ab6 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-r-aem.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-r-aem.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://license_terms/license_agreem=
ent.txt;md5=3D1a33828e132ba
 # yourself from the homepage and set FVP_BASE_R_AEM_TARBALL_URI appropri=
ately
 # (for example, file:///home/user/FVP_Base_AEMv8R_11.15_14.tgz).
 FVP_BASE_R_AEM_TARBALL_URI ?=3D ""
-PV =3D "11.15_14"
+PV =3D "11.15.14"
=20
 SRC_URI =3D "${FVP_BASE_R_AEM_TARBALL_URI};subdir=3D${BP}"
 python() {
--=20
2.25.1

