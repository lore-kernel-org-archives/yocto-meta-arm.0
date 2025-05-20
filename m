Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E60C3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 16:05:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.24950.1747757150646545135
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 May 2025 09:05:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EF851516
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 May 2025 09:05:36 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AD81D3F5A1
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 May 2025 09:05:49 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/fvp-base-a-aem: upgrade to 11.29.27
Date: Tue, 20 May 2025 17:05:44 +0100
Message-ID: <20250520160545.2283646-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 May 2025 16:05:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6506

Notably, this fixes the need for an executable stack.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...base-a-aem_11.28.23.bb =3D> fvp-base-a-aem_11.29.27.bb} | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
 rename meta-arm/recipes-devtools/fvp/{fvp-base-a-aem_11.28.23.bb =3D> fv=
p-base-a-aem_11.29.27.bb} (66%)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.28.23.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.29.27.bb
similarity index 66%
rename from meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.28.23.bb
rename to meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.29.27.bb
index 46884520..a45fa153 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.28.23.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.29.27.bb
@@ -4,11 +4,11 @@ LICENSE:append =3D " & Artistic-2.0 & BSL-1.0 & BSD-2-C=
lause & Unlicense"
=20
 SUMMARY =3D "Arm Fixed Virtual Platform - Armv-A Base RevC Architecture =
Envelope Model FVP"
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
-                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3Dc51b57b6a4731881849eb0e2e2b6d799 \
+                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D92ea58bb219213dfdc48111b693019b6 \
                     file://license_terms/third_party_licenses/arm_licens=
e_management_utilities/third_party_licenses.txt;md5=3Dabcaafefc7b7a0cdf66=
64c51f9075c5b"
=20
-SRC_URI[fvp-aarch64.sha256sum] =3D "a380e271f14ce7cf99158018368ac86fe8c3=
05f82c7d332a93eb08bf7a172571"
-SRC_URI[fvp-x86_64.sha256sum] =3D "0f6d67d834a8ed5dff3c863e0e3545ef39c73=
6405ea8227577ac004cffd66e93"
+SRC_URI[fvp-aarch64.sha256sum] =3D "8fce0dc6346c37b0df4809d08b599463c880=
b6375f9b58d89a73fa6f9ab2e129"
+SRC_URI[fvp-x86_64.sha256sum] =3D "8a8c4a609c32890ce96799aa7319fff3ecf75=
2c7a9dab52b2e968cb80cc1836f"
=20
 # The CSS used in the FVP homepage make it too difficult to query with t=
he tooling currently in Yocto
 UPSTREAM_VERSION_UNKNOWN =3D "1"
@@ -16,6 +16,3 @@ UPSTREAM_VERSION_UNKNOWN =3D "1"
 MODEL_CODE =3D "FVP_Base_RevC-2xAEMvA"
=20
 COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux"
-
-require remove-execstack.inc
-REMOVE_EXECSTACKS:x86-64 =3D "${FVPDIR}/models/${FVP_ARCH_DIR}*/libarmct=
model.so"
--=20
2.43.0


