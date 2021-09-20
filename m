Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.808.1632161190002108799
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Sep 2021 11:06:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 929E2113E
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 11:06:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E40D3F718
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 11:06:29 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 06/12] arm/fvp-ecosystem: use all-dots versions
Date: Mon, 20 Sep 2021 19:06:16 +0100
Message-Id: <20210920180622.3614621-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920180622.3614621-1-ross.burton@arm.com>
References: <20210920180622.3614621-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-ecosystem.inc | 2 +-
 meta-arm/recipes-devtools/fvp/fvp-n1-edge.bb    | 2 +-
 meta-arm/recipes-devtools/fvp/fvp-sgi575.bb     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-ecosystem.inc b/meta-arm/r=
ecipes-devtools/fvp/fvp-ecosystem.inc
index a5463155..100f6a23 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-ecosystem.inc
+++ b/meta-arm/recipes-devtools/fvp/fvp-ecosystem.inc
@@ -8,7 +8,7 @@ PV ?=3D "unset"
 SUMMARY =3D "Arm Fixed Virtual Platform - ${MODEL} Ecosystem Reference D=
esign"
 HOMEPAGE =3D "https://developer.arm.com/tools-and-software/open-source-s=
oftware/arm-platforms-software/arm-ecosystem-fvps"
=20
-SRC_URI =3D "https://developer.arm.com/-/media/Arm%20Developer%20Communi=
ty/Downloads/OSS/FVP/${MODEL}/${MODEL_CODE}_${PV}.tgz;subdir=3D${BP}"
+SRC_URI =3D "https://developer.arm.com/-/media/Arm%20Developer%20Communi=
ty/Downloads/OSS/FVP/${MODEL}/${MODEL_CODE}_${PV_URL}.tgz;subdir=3D${BP}"
=20
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
                     file://license_terms/third_party_licenses.txt;md5=3D=
47473b1e04b70938cf0a7ffea8ea4cc3"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-n1-edge.bb b/meta-arm/reci=
pes-devtools/fvp/fvp-n1-edge.bb
index edda411c..27493730 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-n1-edge.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-n1-edge.bb
@@ -2,6 +2,6 @@ require fvp-ecosystem.inc
=20
 MODEL =3D "Neoverse-N1"
 MODEL_CODE =3D "FVP_RD_N1_edge"
-PV =3D "11.12_43"
+PV =3D "11.12.43"
=20
 SRC_URI[sha256sum] =3D "e428cc44db251202bf45ae68d40832d01efbc5d0f1323f1c=
e46237213dd4f0fa"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-sgi575.bb b/meta-arm/recip=
es-devtools/fvp/fvp-sgi575.bb
index 2ad1d3af..6750907d 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-sgi575.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-sgi575.bb
@@ -2,6 +2,6 @@ require fvp-ecosystem.inc
=20
 MODEL =3D "SGI-575"
 MODEL_CODE =3D "FVP_CSS_SGI-575"
-PV =3D "11.12_59"
+PV =3D "11.12.59"
=20
 SRC_URI[sha256sum] =3D "86c7a16d83b0801278b4a3d05c8d42c4955ed22a0dbea3c5=
83798fb971bc425c"
--=20
2.25.1

