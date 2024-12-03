Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7EF5E64AB4
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 14:29:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.21082.1733236152174192544
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 Dec 2024 06:29:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C699FEC
	for <meta-arm@lists.yoctoproject.org>; Tue,  3 Dec 2024 06:29:39 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C95E73F71E
	for <meta-arm@lists.yoctoproject.org>; Tue,  3 Dec 2024 06:29:10 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/fvp-base-a-aem: upgrade to 11.27.19
Date: Tue,  3 Dec 2024 14:29:04 +0000
Message-Id: <20241203142904.2700807-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 03 Dec 2024 14:29:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6262

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-base-a-aem_11.26.11.bb =3D> fvp-base-a-aem_11.27.19.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-arm/recipes-devtools/fvp/{fvp-base-a-aem_11.26.11.bb =3D> fv=
p-base-a-aem_11.27.19.bb} (65%)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.26.11.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.27.19.bb
similarity index 65%
rename from meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.26.11.bb
rename to meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.27.19.bb
index 54c7e0fd..dc9086c9 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.26.11.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.27.19.bb
@@ -2,13 +2,13 @@ require fvp-envelope.inc
=20
 SUMMARY =3D "Arm Fixed Virtual Platform - Armv-A Base RevC Architecture =
Envelope Model FVP"
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
-                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D58b552b918d097a8ba802168312d76b2 \
+                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3Da3ce84371977a6b9c624408238309a90 \
                     file://license_terms/third_party_licenses/arm_licens=
e_management_utilities/third_party_licenses.txt;md5=3Dabcaafefc7b7a0cdf66=
64c51f9075c5b"
=20
=20
-SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/permalink/Fixed-V=
irtual-Platforms/${PV_URL_SHORT}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;=
subdir=3D${BP};name=3Dfvp-${HOST_ARCH}"
-SRC_URI[fvp-aarch64.sha256sum] =3D "0a262327073d410146a6689c068162f60e72=
f45845734650b08a1d45483853ca"
-SRC_URI[fvp-x86_64.sha256sum] =3D "a314f0f8c55492b70ab469fbbe2bb71ab8bb7=
c7ae4608ed1c432d8de8f4edb27"
+SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Ar=
chitecture/${PV_URL_SHORT}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;subdir=
=3D${BP};name=3Dfvp-${HOST_ARCH}"
+SRC_URI[fvp-aarch64.sha256sum] =3D "66c9939cb2b2104e415dcddb46a2ab52168e=
8a2b7f30a339e1c05d5d4864ed1d"
+SRC_URI[fvp-x86_64.sha256sum] =3D "cd70946a6b632950dca5def33d7656991a298=
27fa2f6f72f75011d85bdcee248"
=20
 # The CSS used in the FVP homepage make it too difficult to query with t=
he tooling currently in Yocto
 UPSTREAM_VERSION_UNKNOWN =3D "1"
--=20
2.34.1


