Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC3FC433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 13:40:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7912.1666186797023877508
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Oct 2022 06:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4E3A1424;
	Wed, 19 Oct 2022 06:40:02 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 233F03F7D8;
	Wed, 19 Oct 2022 06:39:56 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/3] arm/fvp-tc0: remove Total Compute 2020 FVP
Date: Wed, 19 Oct 2022 14:39:52 +0100
Message-Id: <20221019133952.3018499-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019133952.3018499-1-ross.burton@arm.com>
References: <20221019133952.3018499-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Oct 2022 13:40:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3985

This FVP doesn't support TC1, so remove it now that we don't support TC0.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/fvps.yml                              |  1 -
 meta-arm/recipes-devtools/fvp/fvp-tc0.bb | 12 ------------
 2 files changed, 13 deletions(-)
 delete mode 100644 meta-arm/recipes-devtools/fvp/fvp-tc0.bb

diff --git a/ci/fvps.yml b/ci/fvps.yml
index 576faa31..e3bc5fe5 100644
--- a/ci/fvps.yml
+++ b/ci/fvps.yml
@@ -17,4 +17,3 @@ target:
   - nativesdk-fvp-sgi575
   - nativesdk-fvp-corstone500
   - nativesdk-fvp-corstone1000
-  - nativesdk-fvp-tc0
diff --git a/meta-arm/recipes-devtools/fvp/fvp-tc0.bb b/meta-arm/recipes-=
devtools/fvp/fvp-tc0.bb
deleted file mode 100644
index 78f2fc22..00000000
--- a/meta-arm/recipes-devtools/fvp/fvp-tc0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require fvp-ecosystem.inc
-
-MODEL =3D "TotalCompute"
-MODEL_CODE =3D "FVP_TC0"
-PV =3D "11.17.18"
-
-# Unconventional URI structure for this release
-SRC_URI =3D "https://developer.arm.com/-/media/Arm%20Developer%20Communi=
ty/Downloads/OSS/FVP/TotalCompute/Total%20Compute%20Update%202022/FVP_TC0=
_11.17_18.tgz;subdir=3D${BP}"
-SRC_URI[sha256sum] =3D "0bd78354e036a7e92bd7f8cbd78cd2b5197dc0872fe2b25c=
95ea734929fe83b8"
-
-LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
-                    file://license_terms/third_party_licenses.txt;md5=3D=
41029e71051b1c786bae3112a29905a7"
--=20
2.34.1


