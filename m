Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.808.1632161190002108799
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Sep 2021 11:06:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2508911D4
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 11:06:30 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4AB53F718
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 11:06:29 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 07/12] arm/fvp: add upstream version checking
Date: Mon, 20 Sep 2021 19:06:17 +0100
Message-Id: <20210920180622.3614621-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920180622.3614621-1-ross.burton@arm.com>
References: <20210920180622.3614621-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-base-a-aem.bb | 4 +++-
 meta-arm/recipes-devtools/fvp/fvp-ecosystem.inc | 3 +++
 meta-arm/recipes-devtools/fvp/fvp-envelope.inc  | 3 +++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem.bb b/meta-arm/r=
ecipes-devtools/fvp/fvp-base-a-aem.bb
index 6b1e020d..2ef85995 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem.bb
@@ -6,5 +6,7 @@ LIC_FILES_CHKSUM =3D "file://license_terms/license_agreem=
ent.txt;md5=3D1a33828e132ba
=20
 PV =3D "11.15.18"
=20
-SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/ecosystem=
-models/FVP_Base_RevC-2xAEMvA_${PV_URL}.tgz;subdir=3D${BP}"
+SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/ecosystem=
-models/${MODEL_CODE}_${PV_URL}.tgz;subdir=3D${BP}"
 SRC_URI[sha256sum] =3D "05e474d6b8197c749c66968315fdb7059d398b279bef5978=
7025a88219c71ae4"
+
+MODEL_CODE =3D "FVP_Base_RevC-2xAEMvA"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-ecosystem.inc b/meta-arm/r=
ecipes-devtools/fvp/fvp-ecosystem.inc
index 100f6a23..ef01bdc1 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-ecosystem.inc
+++ b/meta-arm/recipes-devtools/fvp/fvp-ecosystem.inc
@@ -13,6 +13,9 @@ SRC_URI =3D "https://developer.arm.com/-/media/Arm%20De=
veloper%20Community/Downloa
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
                     file://license_terms/third_party_licenses.txt;md5=3D=
47473b1e04b70938cf0a7ffea8ea4cc3"
=20
+UPSTREAM_CHECK_URI =3D "${HOMEPAGE}"
+UPSTREAM_CHECK_REGEX =3D "${MODEL_CODE}_(?P<pver>(\d+[\.\-_]*)+).tgz"
+
 do_install() {
     mkdir --parents ${D}${FVPDIR} ${D}${bindir}
=20
diff --git a/meta-arm/recipes-devtools/fvp/fvp-envelope.inc b/meta-arm/re=
cipes-devtools/fvp/fvp-envelope.inc
index eda98762..4f6bb370 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-envelope.inc
+++ b/meta-arm/recipes-devtools/fvp/fvp-envelope.inc
@@ -2,6 +2,9 @@ require fvp-common.inc
=20
 HOMEPAGE =3D "https://developer.arm.com/tools-and-software/simulation-mo=
dels/fixed-virtual-platforms/arm-ecosystem-models"
=20
+UPSTREAM_CHECK_URI =3D "${HOMEPAGE}"
+UPSTREAM_CHECK_REGEX =3D "${MODEL_CODE}_(?P<pver>(\d+[\.\-_]*)+).tgz"
+
 do_install() {
     mkdir --parents ${D}${FVPDIR} ${D}${bindir}
=20
--=20
2.25.1

