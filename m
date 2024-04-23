Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBE8C4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 16:33:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.23270.1713890014580472098
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Apr 2024 09:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20AF5339;
	Tue, 23 Apr 2024 09:34:02 -0700 (PDT)
Received: from FWLNXWH7M5.arm.com (unknown [10.57.21.110])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 79D7D3F7BD;
	Tue, 23 Apr 2024 09:33:33 -0700 (PDT)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <gyorgy.szing@arm.com>
Subject: [PATCH 5/9] arm/devtools/fvp-base-a-aem: update the AEM FVP to 11.25.15
Date: Tue, 23 Apr 2024 18:32:01 +0200
Message-ID: <20240423163205.5885-5-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240423163205.5885-1-gyorgy.szing@arm.com>
References: <20240423163205.5885-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Apr 2024 16:33:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5590

Version v11.25 was released and it fixes measured boot. Update the
recipe and integrate the new version.

The pattern of the download URL has changed. Add functionality to
calculate a new URL fragment from the package version.

Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
---
 ...p-base-a-aem_11.24.11.bb =3D> fvp-base-a-aem_11.25.15.bb} | 4 ++--
 meta-arm/recipes-devtools/fvp/fvp-common.inc               | 7 +++++++
 meta-arm/recipes-devtools/fvp/fvp-envelope.inc             | 2 +-
 3 files changed, 10 insertions(+), 3 deletions(-)
 rename meta-arm/recipes-devtools/fvp/{fvp-base-a-aem_11.24.11.bb =3D> fv=
p-base-a-aem_11.25.15.bb} (74%)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.24.11.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.25.15.bb
similarity index 74%
rename from meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.24.11.bb
rename to meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.25.15.bb
index fe89e01f..4dd254a2 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.24.11.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.25.15.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM =3D "file://license_terms/license_agreem=
ent.txt;md5=3D1a33828e132ba
                     file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3Db9005e55057311e41efe02ccfea8ea72 \
                     file://license_terms/third_party_licenses/arm_licens=
e_management_utilities/third_party_licenses.txt;md5=3Dc09526c02e631abb95a=
d61528892552d"
=20
-SRC_URI[fvp-aarch64.sha256sum] =3D "7a3593dafd3af6897b3a0a68f66701201f8f=
3e02a3d981ba47494b2f18853648"
-SRC_URI[fvp-x86_64.sha256sum] =3D "0f132334834cbc66889a62dd72057c976d7c7=
dfcfeec21799e9c78fb2ce24720"
+SRC_URI[fvp-aarch64.sha256sum] =3D "22096fc2267ad776abe0ff32d0d3b870c9fa=
e10036d9c16f4f0fe4a64487a11e"
+SRC_URI[fvp-x86_64.sha256sum] =3D "5f33707a1bdaa96a933b89949f28643110ad8=
0ac9835a75f139c200b64a394dc"
=20
 MODEL_CODE =3D "FVP_Base_RevC-2xAEMvA"
=20
diff --git a/meta-arm/recipes-devtools/fvp/fvp-common.inc b/meta-arm/reci=
pes-devtools/fvp/fvp-common.inc
index a20959b7..29de89f2 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-common.inc
+++ b/meta-arm/recipes-devtools/fvp/fvp-common.inc
@@ -29,10 +29,17 @@ def get_real_pv(d):
     pv =3D d.getVar("PV")
     return "%s.%s_%s" % tuple(pv.split("."))
=20
+def get_fm_short_pv_url(d):
+    # FVP versions are like 11.12_43
+    pv =3D d.getVar("PV")
+    return "FM_%s_%s" % tuple(pv.split("."))[:2]
+
+
 # If PV is 1.2.3, VERSION=3D1.2, BUILD=3D3, PV_URL=3D1.2_3.
 VERSION =3D "${@oe.utils.trim_version(d.getVar('PV', -1))}"
 BUILD =3D "${@d.getVar('PV').split('.')[-1]}"
 PV_URL =3D "${@get_real_pv(d)}"
+PV_URL_SHORT=3D"${@get_fm_short_pv_url(d)}"
=20
 # The directory the FVP is installed into
 FVPDIR =3D "${libdir}/fvp/${BPN}"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-envelope.inc b/meta-arm/re=
cipes-devtools/fvp/fvp-envelope.inc
index 1e8bb407..f48d823f 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-envelope.inc
+++ b/meta-arm/recipes-devtools/fvp/fvp-envelope.inc
@@ -2,7 +2,7 @@ require fvp-common.inc
=20
 HOMEPAGE =3D "https://developer.arm.com/Tools%20and%20Software/Fixed%20V=
irtual%20Platforms"
=20
-SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/ecosystem=
-models/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;subdir=3D${BP};name=3Dfvp=
-${HOST_ARCH}"
+SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/ecosystem=
-models/${PV_URL_SHORT}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;subdir=3D=
${BP};name=3Dfvp-${HOST_ARCH}"
=20
 UPSTREAM_CHECK_URI =3D "${HOMEPAGE}"
 UPSTREAM_CHECK_REGEX =3D "${MODEL_CODE}_(?P<pver>(\d+[\.\-_]*)+).tgz"
--=20
2.43.1


