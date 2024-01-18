Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87270C4707B
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 14:30:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12737.1705588204766294120
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jan 2024 06:30:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A8ED1042
	for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jan 2024 06:30:49 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7CF293F73F
	for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jan 2024 06:30:03 -0800 (PST)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/fvp-base-a-aem: upgrade to 11.24.11
Date: Thu, 18 Jan 2024 14:30:01 +0000
Message-Id: <20240118143001.2600949-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Jan 2024 14:30:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5339

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...fvp-base-a-aem_11.23.9.bb =3D> fvp-base-a-aem_11.24.11.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-arm/recipes-devtools/fvp/{fvp-base-a-aem_11.23.9.bb =3D> fvp=
-base-a-aem_11.24.11.bb} (66%)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.23.9.bb b/me=
ta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.24.11.bb
similarity index 66%
rename from meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.23.9.bb
rename to meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.24.11.bb
index 7d179b45..fe89e01f 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.23.9.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.24.11.bb
@@ -2,11 +2,11 @@ require fvp-envelope.inc
=20
 SUMMARY =3D "Arm Fixed Virtual Platform - Armv-A Base RevC Architecture =
Envelope Model FVP"
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
-                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D0c32ac6f58ebff83065105042ab98211 \
+                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3Db9005e55057311e41efe02ccfea8ea72 \
                     file://license_terms/third_party_licenses/arm_licens=
e_management_utilities/third_party_licenses.txt;md5=3Dc09526c02e631abb95a=
d61528892552d"
=20
-SRC_URI[fvp-aarch64.sha256sum] =3D "d0925791ec4cfb99c3b4122afbb442ad076f=
92c4e173ed3bd092a3bf180d56f0"
-SRC_URI[fvp-x86_64.sha256sum] =3D "9d43c8eb347bf169a024cdbbc04572d169f60=
098fe061316b36bdbd4a44ffd79"
+SRC_URI[fvp-aarch64.sha256sum] =3D "7a3593dafd3af6897b3a0a68f66701201f8f=
3e02a3d981ba47494b2f18853648"
+SRC_URI[fvp-x86_64.sha256sum] =3D "0f132334834cbc66889a62dd72057c976d7c7=
dfcfeec21799e9c78fb2ce24720"
=20
 MODEL_CODE =3D "FVP_Base_RevC-2xAEMvA"
=20
--=20
2.34.1


