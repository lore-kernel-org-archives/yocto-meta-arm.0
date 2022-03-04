Return-Path: <harry.moulton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C38C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 15:13:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.7991.1646406817830122568
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Mar 2022 07:13:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harry.moulton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CC9F143D;
	Fri,  4 Mar 2022 07:13:37 -0800 (PST)
Received: from e127418.cambridge.arm.com (e127418.cambridge.arm.com
 [10.1.25.136])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 114063F73D;
	Fri,  4 Mar 2022 07:13:35 -0800 (PST)
From: harry.moulton@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Harry Moulton <harry.moulton@arm.com>
Subject: [PATCH 1/1] arm/fvp-corstone1000: update to latest version
Date: Fri,  4 Mar 2022 15:11:34 +0000
Message-Id: <20220304151134.21729-2-harry.moulton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304151134.21729-1-harry.moulton@arm.com>
References: <20220304151134.21729-1-harry.moulton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Mar 2022 15:13:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3116

From: Harry Moulton <harry.moulton@arm.com>

Update the URL and checksums for the new Corstone1000 FVP version 11.17.2=
3.

Signed-off-by: Harry Moulton <harry.moulton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb b/meta-arm=
/recipes-devtools/fvp/fvp-corstone1000.bb
index 54cbd560..0e565264 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb
@@ -1,10 +1,14 @@
 require fvp-ecosystem.inc
=20
-MODEL =3D "Corstone-1000"
+MODEL =3D "Corstone-1000-23"
 MODEL_CODE =3D "FVP_Corstone_1000"
-PV =3D "11.16.21"
+PV =3D "11.17_23"
=20
-SRC_URI[sha256sum] =3D "3e2d39e553ae392bce3d71119b4425615f2ed2185d0c334e=
bd0193059cf6e4b0"
+SRC_URI =3D "https://developer.arm.com/-/media/Arm%20Developer%20Communi=
ty/Downloads/OSS/FVP/${MODEL}/Linux/${MODEL_CODE}_${PV}.tgz;subdir=3D${BP=
}"
+SRC_URI[sha256sum] =3D "00ccb72d02c90e2424d24a625d275cabf8ea8dc024713985=
208f618bb88d1934"
=20
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
-                    file://license_terms/third_party_licenses.txt;md5=3D=
72d3e09651c7560595c325ffad728252"
+                    file://license_terms/third_party_licenses.txt;md5=3D=
41029e71051b1c786bae3112a29905a7"
+
+FVP_ARCH =3D "Linux64_GCC-9.4"
+
--=20
2.25.1


