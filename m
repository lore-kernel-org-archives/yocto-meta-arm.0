Return-Path: <harry.moulton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A47D0C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 09:27:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.3691.1646818057851194518
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Mar 2022 01:27:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harry.moulton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E38531650;
	Wed,  9 Mar 2022 01:27:36 -0800 (PST)
Received: from e127418.arm.com (unknown [10.57.20.152])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EFCD03FA20;
	Wed,  9 Mar 2022 01:27:35 -0800 (PST)
From: harry.moulton@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Harry Moulton <harry.moulton@arm.com>
Subject: [PATCH honister] arm/fvp-corstone1000: backport: update to latest
 version
Date: Wed,  9 Mar 2022 09:26:02 +0000
Message-Id: <20220309092602.982867-1-harry.moulton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 09 Mar 2022 09:27:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3139

From: Harry Moulton <harry.moulton@arm.com>

Backport patch from master to update the URL and checksums for the
new Corstone1000 FVP version 11.17.23.

Signed-off-by: Harry Moulton <harry.moulton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb

diff --git a/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb b/meta-arm=
/recipes-devtools/fvp/fvp-corstone1000.bb
new file mode 100644
index 00000000..dcb6b7d1
--- /dev/null
+++ b/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb
@@ -0,0 +1,14 @@
+require fvp-ecosystem.inc
+
+MODEL =3D "Corstone-1000-23"
+MODEL_CODE =3D "FVP_Corstone_1000"
+PV =3D "11.17_23"
+
+SRC_URI =3D "https://developer.arm.com/-/media/Arm%20Developer%20Communi=
ty/Downloads/OSS/FVP/${MODEL}/Linux/${MODEL_CODE}_${PV}.tgz;subdir=3D${BP=
}"
+SRC_URI[sha256sum] =3D "00ccb72d02c90e2424d24a625d275cabf8ea8dc024713985=
208f618bb88d1934"
+
+LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
+                    file://license_terms/third_party_licenses.txt;md5=3D=
41029e71051b1c786bae3112a29905a7"
+
+FVP_ARCH =3D "Linux64_GCC-9.3"
+
--=20
2.25.1


