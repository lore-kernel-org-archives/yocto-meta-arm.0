Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A61ECC4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 13:48:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5562.1648216137745426687
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 25 Mar 2022 06:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96FA1139F
	for <meta-arm@lists.yoctoproject.org>; Fri, 25 Mar 2022 06:48:56 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B8303F73B
	for <meta-arm@lists.yoctoproject.org>; Fri, 25 Mar 2022 06:48:56 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/7] arm/fvp-base-a-aem: upgrade to latest release, 11.17.21
Date: Fri, 25 Mar 2022 13:48:48 +0000
Message-Id: <20220325134853.3068169-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220325134853.3068169-1-ross.burton@arm.com>
References: <20220325134853.3068169-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Mar 2022 13:48:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3207

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-base-a-aem.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem.bb b/meta-arm/r=
ecipes-devtools/fvp/fvp-base-a-aem.bb
index fae0cb66..568fafda 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem.bb
@@ -2,11 +2,11 @@ require fvp-envelope.inc
=20
 SUMMARY =3D "Arm Fixed Virtual Platform - Armv-A Base RevC Architecture =
Envelope Model FVP"
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
-                    file://license_terms/third_party_licenses.txt;md5=3D=
72d3e09651c7560595c325ffad728252"
+                    file://license_terms/third_party_licenses.txt;md5=3D=
41029e71051b1c786bae3112a29905a7"
=20
-PV =3D "11.16.16"
+PV =3D "11.17.21"
=20
 SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/ecosystem=
-models/${MODEL_CODE}_${PV_URL}.tgz;subdir=3D${BP}"
-SRC_URI[sha256sum] =3D "a19e18d675b73493b032502fdf6edb7afba01540c99400a4=
405a95f95009a734"
+SRC_URI[sha256sum] =3D "ef42f685b4b970e56f6b14a5a76acb4eb88987dcb614d578=
8eee4d8ef5cf9b28"
=20
 MODEL_CODE =3D "FVP_Base_RevC-2xAEMvA"
--=20
2.25.1


