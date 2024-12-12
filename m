Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94520E77180
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 02:13:07 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web10.10924.1733969585971329266
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Dec 2024 18:13:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 12 Dec
 2024 10:12:56 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 12 Dec 2024 10:12:56 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <meta-arm@lists.yoctoproject.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>
Subject: [PATCH v1] arm: remove python3-pyhsslms recipe
Date: Thu, 12 Dec 2024 10:12:56 +0800
Message-ID: <20241212021256.1911359-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 Dec 2024 02:13:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6283

I upstreamed this recipe in meta-openembedded/meta-python,
so removes this recipe from meta-arm meta layer.

https://github.com/openembedded/meta-openembedded/blob/master/meta-python/r=
ecipes-devtools/python/python3-pyhsslms_2.0.0.bb

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 .../python/python3-pyhsslms_2.0.0.bb               | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 meta-arm/recipes-devtools/python/python3-pyhsslms_2.0.0=
.bb

diff --git a/meta-arm/recipes-devtools/python/python3-pyhsslms_2.0.0.bb b/m=
eta-arm/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
deleted file mode 100644
index b18d1c8e..00000000
--- a/meta-arm/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY =3D "Pure-Python implementation of HSS/LMS Digital Signatures (RFC=
 8554)"
-HOMEPAGE =3D"https://pypi.org/project/pyhsslms"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dbbc59ef8bf238c2902ca816b87b=
58571"
-
-inherit python_setuptools_build_meta
-
-# Maintainer refused to upload source to pypi.org, but said he would in a =
future release.  In the meantime, do github
-SRC_URI =3D "git:///github.com/russhousley/pyhsslms.git;branch=3Dmaster;pr=
otocol=3Dhttps"
-SRCREV =3D "c798728deed6d3f681c9e6bfd7fe8a6705f5638b"
-
-S =3D "${WORKDIR}/git"
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


