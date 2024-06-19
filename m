Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F474C2BA1A
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 20:56:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.32144.1718830612728913344
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Jun 2024 13:56:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E85361042
	for <meta-arm@lists.yoctoproject.org>; Wed, 19 Jun 2024 13:57:16 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 144BA3F73B
	for <meta-arm@lists.yoctoproject.org>; Wed, 19 Jun 2024 13:56:52 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/fvp-base: update version to 11.26.11
Date: Wed, 19 Jun 2024 16:56:50 -0400
Message-Id: <20240619205650.22335-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Jun 2024 20:56:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5837

Update to the latest version of fvp-base-a-aem.  The licence files
changed with an addition of language to add 'Arm License Management
Utilities', but still is licensed under the Arm Proprietary license (and
still requires the EULA to be acknowledged).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...se-a-aem_11.25.15.bb =3D> fvp-base-a-aem_11.26.11.bb} | 10 ++++++----
 meta-arm/recipes-devtools/fvp/fvp-common.inc           |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)
 rename meta-arm/recipes-devtools/fvp/{fvp-base-a-aem_11.25.15.bb =3D> fv=
p-base-a-aem_11.26.11.bb} (51%)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.25.15.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.26.11.bb
similarity index 51%
rename from meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.25.15.bb
rename to meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.26.11.bb
index eab2255f6f3c..54c7e0fd0579 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.25.15.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.26.11.bb
@@ -2,11 +2,13 @@ require fvp-envelope.inc
=20
 SUMMARY =3D "Arm Fixed Virtual Platform - Armv-A Base RevC Architecture =
Envelope Model FVP"
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
-                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3Db9005e55057311e41efe02ccfea8ea72 \
-                    file://license_terms/third_party_licenses/arm_licens=
e_management_utilities/third_party_licenses.txt;md5=3Dc09526c02e631abb95a=
d61528892552d"
+                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D58b552b918d097a8ba802168312d76b2 \
+                    file://license_terms/third_party_licenses/arm_licens=
e_management_utilities/third_party_licenses.txt;md5=3Dabcaafefc7b7a0cdf66=
64c51f9075c5b"
=20
-SRC_URI[fvp-aarch64.sha256sum] =3D "22096fc2267ad776abe0ff32d0d3b870c9fa=
e10036d9c16f4f0fe4a64487a11e"
-SRC_URI[fvp-x86_64.sha256sum] =3D "5f33707a1bdaa96a933b89949f28643110ad8=
0ac9835a75f139c200b64a394dc"
+
+SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/permalink/Fixed-V=
irtual-Platforms/${PV_URL_SHORT}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;=
subdir=3D${BP};name=3Dfvp-${HOST_ARCH}"
+SRC_URI[fvp-aarch64.sha256sum] =3D "0a262327073d410146a6689c068162f60e72=
f45845734650b08a1d45483853ca"
+SRC_URI[fvp-x86_64.sha256sum] =3D "a314f0f8c55492b70ab469fbbe2bb71ab8bb7=
c7ae4608ed1c432d8de8f4edb27"
=20
 # The CSS used in the FVP homepage make it too difficult to query with t=
he tooling currently in Yocto
 UPSTREAM_VERSION_UNKNOWN =3D "1"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-common.inc b/meta-arm/reci=
pes-devtools/fvp/fvp-common.inc
index 29de89f2226f..477c45f4117e 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-common.inc
+++ b/meta-arm/recipes-devtools/fvp/fvp-common.inc
@@ -32,7 +32,7 @@ def get_real_pv(d):
 def get_fm_short_pv_url(d):
     # FVP versions are like 11.12_43
     pv =3D d.getVar("PV")
-    return "FM_%s_%s" % tuple(pv.split("."))[:2]
+    return "FM-%s.%s" % tuple(pv.split("."))[:2]
=20
=20
 # If PV is 1.2.3, VERSION=3D1.2, BUILD=3D3, PV_URL=3D1.2_3.
--=20
2.39.3 (Apple Git-146)


