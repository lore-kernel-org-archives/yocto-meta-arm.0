Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86182C433FE
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 14:31:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.32856.1635172310635043487
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 25 Oct 2021 07:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1C7F1FB
	for <meta-arm@lists.yoctoproject.org>; Mon, 25 Oct 2021 07:31:39 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C0323F5A1
	for <meta-arm@lists.yoctoproject.org>; Mon, 25 Oct 2021 07:31:39 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/fvp-*: upgrade N1 Edge and SGI575 ecosystem models to
 11.15.26
Date: Mon, 25 Oct 2021 15:31:34 +0100
Message-Id: <20211025143135.2058165-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 25 Oct 2021 14:31:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2296

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-n1-edge.bb | 7 +++++--
 meta-arm/recipes-devtools/fvp/fvp-sgi575.bb  | 7 +++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-n1-edge.bb b/meta-arm/reci=
pes-devtools/fvp/fvp-n1-edge.bb
index 27493730..f7ccf729 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-n1-edge.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-n1-edge.bb
@@ -2,6 +2,9 @@ require fvp-ecosystem.inc
=20
 MODEL =3D "Neoverse-N1"
 MODEL_CODE =3D "FVP_RD_N1_edge"
-PV =3D "11.12.43"
+PV =3D "11.15.26"
=20
-SRC_URI[sha256sum] =3D "e428cc44db251202bf45ae68d40832d01efbc5d0f1323f1c=
e46237213dd4f0fa"
+SRC_URI[sha256sum] =3D "a85026312f9784ad0d164ffc2cea4344b197d6fefff4aa04=
605a5eac8ff4ee37"
+
+LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
+                    file://license_terms/third_party_licenses.txt;md5=3D=
3db0c4947b7e3405c40b943672d8de2f"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-sgi575.bb b/meta-arm/recip=
es-devtools/fvp/fvp-sgi575.bb
index 6750907d..efdd46f8 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-sgi575.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-sgi575.bb
@@ -2,6 +2,9 @@ require fvp-ecosystem.inc
=20
 MODEL =3D "SGI-575"
 MODEL_CODE =3D "FVP_CSS_SGI-575"
-PV =3D "11.12.59"
+PV =3D "11.15.26"
=20
-SRC_URI[sha256sum] =3D "86c7a16d83b0801278b4a3d05c8d42c4955ed22a0dbea3c5=
83798fb971bc425c"
+SRC_URI[sha256sum] =3D "d07241112f6c146362deec789e782e10e83bc3560cf605cc=
d055a606d0b44e74"
+
+LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
+                    file://license_terms/third_party_licenses.txt;md5=3D=
3db0c4947b7e3405c40b943672d8de2f"
--=20
2.25.1


