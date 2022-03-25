Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D53C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 13:48:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5506.1648216136941621022
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 25 Mar 2022 06:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1232112FC
	for <meta-arm@lists.yoctoproject.org>; Fri, 25 Mar 2022 06:48:56 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B88B13F73B
	for <meta-arm@lists.yoctoproject.org>; Fri, 25 Mar 2022 06:48:55 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/7] arm/fvp: generalise FVP_ARCH
Date: Fri, 25 Mar 2022 13:48:47 +0000
Message-Id: <20220325134853.3068169-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Mar 2022 13:48:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3205

Use wildcards in the FVP_ARCH assignment, as older FVPs use _GCC-6.4
whilst newer FVPs use _GCC-9.3.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-base-r-aem.bb   | 1 -
 meta-arm/recipes-devtools/fvp/fvp-common.inc      | 4 +++-
 meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb | 2 --
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-r-aem.bb b/meta-arm/r=
ecipes-devtools/fvp/fvp-base-r-aem.bb
index 911cc00a..f21ccae3 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-r-aem.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-r-aem.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D "file://license_terms/license_agreem=
ent.txt;md5=3D1a33828e132ba
 # (for example, file:///home/user/FVP_Base_AEMv8R_11.17_21.tgz).
 FVP_BASE_R_AEM_TARBALL_URI ?=3D ""
 PV =3D "11.17.21"
-FVP_ARCH =3D "Linux64_GCC-9.3"
=20
 SRC_URI =3D "${FVP_BASE_R_AEM_TARBALL_URI};subdir=3D${BP}"
 python() {
diff --git a/meta-arm/recipes-devtools/fvp/fvp-common.inc b/meta-arm/reci=
pes-devtools/fvp/fvp-common.inc
index 9667892b..cf6cad04 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-common.inc
+++ b/meta-arm/recipes-devtools/fvp/fvp-common.inc
@@ -7,7 +7,9 @@ LICENSE_FLAGS =3D "Arm-FVP-EULA"
 LICENSE =3D "Proprietary & Apache-2.0 & Python-2.0 & GPL-3.0-with-GCC-ex=
ception & Zlib & NCSA & LGPL-2.0-or-later & MIT & BSD-3-Clause"
=20
 COMPATIBLE_HOST =3D '(x86_64|i.86).*-linux'
-FVP_ARCH =3D "Linux64_GCC-6.4"
+
+# The architecture-specific directory the binaries are installed under
+FVP_ARCH =3D "Linux64_GCC-*"
=20
 def get_real_pv(d):
     # FVP versions are like 11.12_43
diff --git a/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb b/meta-arm=
/recipes-devtools/fvp/fvp-corstone1000.bb
index dcb6b7d1..b7b22f12 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb
@@ -10,5 +10,3 @@ SRC_URI[sha256sum] =3D "00ccb72d02c90e2424d24a625d275ca=
bf8ea8dc024713985208f618bb8
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
                     file://license_terms/third_party_licenses.txt;md5=3D=
41029e71051b1c786bae3112a29905a7"
=20
-FVP_ARCH =3D "Linux64_GCC-9.3"
-
--=20
2.25.1


