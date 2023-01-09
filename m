Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A239AC677F1
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 17:20:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.78498.1673284826524526116
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Jan 2023 09:20:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 015FA1042;
	Mon,  9 Jan 2023 09:21:08 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EBE93F587;
	Mon,  9 Jan 2023 09:20:25 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/4] arm/fvp-envelope: name the FVP tarballs for checksums
Date: Mon,  9 Jan 2023 17:20:19 +0000
Message-Id: <20230109172022.2280271-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 09 Jan 2023 17:20:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4244

We can download both x86-64 and aarch64 binaries, so ensure the SRC_URI
entry is named to identify them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.20.15.bb | 2 +-
 meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.20.15.bb | 2 +-
 meta-arm/recipes-devtools/fvp/fvp-envelope.inc           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.20.15.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.20.15.bb
index 6545a6ef..85c752bc 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.20.15.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.20.15.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM =3D "file://license_terms/license_agreem=
ent.txt;md5=3D1a33828e132ba
                     file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D34a1ba318d745f05e6197def68ea5411 \
                     file://license_terms/third_party_licenses/arm_licens=
e_management_utilities/third_party_licenses.txt;md5=3D2e53bda6ff2db4c35d6=
9944b93926c9f"
=20
-SRC_URI[sha256sum] =3D "f9db2076e3a63e2f8eb2ea9ed60f30db04e5f81f535bc7e3=
ed24e270d857ea6f"
+SRC_URI[fvp-x86_64.sha256sum] =3D "f9db2076e3a63e2f8eb2ea9ed60f30db04e5f=
81f535bc7e3ed24e270d857ea6f"
=20
 MODEL_CODE =3D "FVP_Base_RevC-2xAEMvA"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.20.15.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.20.15.bb
index f5175b2c..3f8139ca 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.20.15.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.20.15.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM =3D "file://license_terms/license_agreem=
ent.txt;md5=3D1a33828e132ba
                     file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D34a1ba318d745f05e6197def68ea5411 \
                     file://license_terms/third_party_licenses/arm_licens=
e_management_utilities/third_party_licenses.txt;md5=3D2e53bda6ff2db4c35d6=
9944b93926c9f"
=20
-SRC_URI[sha256sum] =3D "c252616489b79fffa3bb721255b1c99ff4ee8c38e4beebce=
4fa05862a3195fe9"
+SRC_URI[fvp-x86_64.sha256sum] =3D "c252616489b79fffa3bb721255b1c99ff4ee8=
c38e4beebce4fa05862a3195fe9"
=20
 MODEL_CODE =3D "FVP_Base_AEMv8R"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-envelope.inc b/meta-arm/re=
cipes-devtools/fvp/fvp-envelope.inc
index 887d9d27..2884bb56 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-envelope.inc
+++ b/meta-arm/recipes-devtools/fvp/fvp-envelope.inc
@@ -2,7 +2,7 @@ require fvp-common.inc
=20
 HOMEPAGE =3D "https://developer.arm.com/tools-and-software/simulation-mo=
dels/fixed-virtual-platforms/arm-ecosystem-models"
=20
-SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/ecosystem=
-models/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;subdir=3D${BP}"
+SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/ecosystem=
-models/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;subdir=3D${BP};name=3Dfvp=
-${HOST_ARCH}"
=20
 UPSTREAM_CHECK_URI =3D "${HOMEPAGE}"
 UPSTREAM_CHECK_REGEX =3D "${MODEL_CODE}_(?P<pver>(\d+[\.\-_]*)+).tgz"
--=20
2.34.1


