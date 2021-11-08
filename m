Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B32C433EF
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 17:17:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1389.1636391840623008979
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Nov 2021 09:17:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38E7E101E
	for <meta-arm@lists.yoctoproject.org>; Mon,  8 Nov 2021 09:17:20 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7B343F800
	for <meta-arm@lists.yoctoproject.org>; Mon,  8 Nov 2021 09:17:19 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm: add fvp-corestone1000
Date: Mon,  8 Nov 2021 17:17:18 +0000
Message-Id: <20211108171718.3617494-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 08 Nov 2021 17:17:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2345

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/fvps.yml                                       |  1 +
 meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb | 10 ++++++++++
 2 files changed, 11 insertions(+)
 create mode 100644 meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb

diff --git a/ci/fvps.yml b/ci/fvps.yml
index 4087c348..a3df9cd3 100644
--- a/ci/fvps.yml
+++ b/ci/fvps.yml
@@ -17,4 +17,5 @@ target:
   - nativesdk-fvp-sgi575
   - nativesdk-fvp-corstone500
   - nativesdk-fvp-corstone700
+  - nativesdk-fvp-corstone1000
   - nativesdk-fvp-tc0
diff --git a/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb b/meta-arm=
/recipes-devtools/fvp/fvp-corstone1000.bb
new file mode 100644
index 00000000..54cbd560
--- /dev/null
+++ b/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb
@@ -0,0 +1,10 @@
+require fvp-ecosystem.inc
+
+MODEL =3D "Corstone-1000"
+MODEL_CODE =3D "FVP_Corstone_1000"
+PV =3D "11.16.21"
+
+SRC_URI[sha256sum] =3D "3e2d39e553ae392bce3d71119b4425615f2ed2185d0c334e=
bd0193059cf6e4b0"
+
+LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
+                    file://license_terms/third_party_licenses.txt;md5=3D=
72d3e09651c7560595c325ffad728252"
--=20
2.25.1


