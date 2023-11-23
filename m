Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF4CC636D0
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 17:47:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.99502.1700761643864669862
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Nov 2023 09:47:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E18B61063;
	Thu, 23 Nov 2023 09:48:09 -0800 (PST)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B3DCA3F7A6;
	Thu, 23 Nov 2023 09:47:22 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH nanbield 1/5] arm/fvp-corstone1000: upgrade to 11.23_25
Date: Thu, 23 Nov 2023 17:47:07 +0000
Message-Id: <20231123174711.2175145-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231123174711.2175145-1-emekcan.aras@arm.com>
References: <20231123174711.2175145-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Nov 2023 17:47:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5266

From: Emekcan Aras <emekcan.aras@arm.com>

Upgrade to the 11.23_25 release of the FVP.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb b/meta-arm=
/recipes-devtools/fvp/fvp-corstone1000.bb
index 2373d9f2..4ac9a6ca 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb
@@ -2,11 +2,11 @@ require fvp-ecosystem.inc
=20
 MODEL =3D "Corstone-1000"
 MODEL_CODE =3D "FVP_Corstone_1000"
-PV =3D "11.22_35"
+PV =3D "11.23_25"
=20
 SRC_URI =3D "https://developer.arm.com/-/media/Arm%20Developer%20Communi=
ty/Downloads/OSS/FVP/${MODEL}/${MODEL_CODE}_${PV}_${FVP_ARCH}.tgz;subdir=3D=
${BP};name=3Dfvp-${HOST_ARCH}"
-SRC_URI[fvp-aarch64.sha256sum] =3D "40c76551ca73328d34513dbc5de2bd094c28=
da7e91b73fe0361ec8faef644b68"
-SRC_URI[fvp-x86_64.sha256sum] =3D "30eb648d26827212faeb74b8c10070cbf8bf2=
12d106ee609579f781a32aac6d9"
+SRC_URI[fvp-aarch64.sha256sum] =3D "e299e81d5fa8b3d2afee0850fd03be31c1a1=
c3fad07f79849c63e46ee5e36acc"
+SRC_URI[fvp-x86_64.sha256sum] =3D "ec34c9564ccb5b1eb62fc2757673343a353db=
1d116a7cb1b5f82f9d985d99cdf"
=20
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
                     file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D0c32ac6f58ebff83065105042ab98211"
--=20
2.25.1


