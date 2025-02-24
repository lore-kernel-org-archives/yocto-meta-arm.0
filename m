Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58906C021BB
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 14:51:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.91684.1740408673756712497
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Feb 2025 06:51:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF5421CE0
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Feb 2025 06:51:29 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 32F753F6A8
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Feb 2025 06:51:13 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm/fvp-base-a-aem: update to 11.28.23
Date: Mon, 24 Feb 2025 09:51:12 -0500
Message-Id: <20250224145112.71746-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250224145112.71746-1-jon.mason@arm.com>
References: <20250224145112.71746-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Feb 2025 14:51:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6381

Update to the latest version.

License SHA changed due to the addition of "Artistic License 2.0" and
was missing entries for a few others that were there previously.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...-base-a-aem_11.27.19.bb =3D> fvp-base-a-aem_11.28.23.bb} | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-arm/recipes-devtools/fvp/{fvp-base-a-aem_11.27.19.bb =3D> fv=
p-base-a-aem_11.28.23.bb} (71%)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.27.19.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.28.23.bb
similarity index 71%
rename from meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.27.19.bb
rename to meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.28.23.bb
index dc9086c9529e..8c7e4dc668eb 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.27.19.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.28.23.bb
@@ -1,14 +1,16 @@
 require fvp-envelope.inc
=20
+LICENSE:append =3D " & Artistic-2.0 & BSL-1.0 & BSD-2-Clause & Unlicense=
"
+
 SUMMARY =3D "Arm Fixed Virtual Platform - Armv-A Base RevC Architecture =
Envelope Model FVP"
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
-                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3Da3ce84371977a6b9c624408238309a90 \
+                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3Dc51b57b6a4731881849eb0e2e2b6d799 \
                     file://license_terms/third_party_licenses/arm_licens=
e_management_utilities/third_party_licenses.txt;md5=3Dabcaafefc7b7a0cdf66=
64c51f9075c5b"
=20
=20
 SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Ar=
chitecture/${PV_URL_SHORT}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;subdir=
=3D${BP};name=3Dfvp-${HOST_ARCH}"
-SRC_URI[fvp-aarch64.sha256sum] =3D "66c9939cb2b2104e415dcddb46a2ab52168e=
8a2b7f30a339e1c05d5d4864ed1d"
-SRC_URI[fvp-x86_64.sha256sum] =3D "cd70946a6b632950dca5def33d7656991a298=
27fa2f6f72f75011d85bdcee248"
+SRC_URI[fvp-aarch64.sha256sum] =3D "a380e271f14ce7cf99158018368ac86fe8c3=
05f82c7d332a93eb08bf7a172571"
+SRC_URI[fvp-x86_64.sha256sum] =3D "0f6d67d834a8ed5dff3c863e0e3545ef39c73=
6405ea8227577ac004cffd66e93"
=20
 # The CSS used in the FVP homepage make it too difficult to query with t=
he tooling currently in Yocto
 UPSTREAM_VERSION_UNKNOWN =3D "1"
--=20
2.39.5 (Apple Git-154)


