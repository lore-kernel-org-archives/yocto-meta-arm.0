Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCF0C433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 13:28:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20085.1669210110551367767
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Nov 2022 05:28:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30F381FB;
	Wed, 23 Nov 2022 05:28:36 -0800 (PST)
Received: from e126835.arm.com (unknown [10.57.38.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 512573F73D;
	Wed, 23 Nov 2022 05:28:28 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan <emekcan.aras@arm.com>
Subject: [PATCH 1/2] arm/fvp: Upgrade Corstone1000 FVP
Date: Wed, 23 Nov 2022 13:28:14 +0000
Message-Id: <20221123132815.555983-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221123132815.555983-1-emekcan.aras@arm.com>
References: <20221123132815.555983-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Nov 2022 13:28:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4156

From: Emekcan <emekcan.aras@arm.com>

Upgrades the Corstone1000 FVP to the latest release
version.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb b/meta-arm=
/recipes-devtools/fvp/fvp-corstone1000.bb
index 35ffe0b7..7d556616 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb
@@ -2,10 +2,10 @@ require fvp-ecosystem.inc
=20
 MODEL =3D "Corstone-1000-23"
 MODEL_CODE =3D "FVP_Corstone_1000"
-PV =3D "11.17_23"
+PV =3D "11.19_21"
=20
-SRC_URI =3D "https://developer.arm.com/-/media/Arm%20Developer%20Communi=
ty/Downloads/OSS/FVP/${MODEL}/Linux/${MODEL_CODE}_${PV}.tgz;subdir=3D${BP=
}"
-SRC_URI[sha256sum] =3D "00ccb72d02c90e2424d24a625d275cabf8ea8dc024713985=
208f618bb88d1934"
+SRC_URI =3D "https://developer.arm.com/-/media/Arm%20Developer%20Communi=
ty/Downloads/OSS/FVP/${MODEL}/Linux/${MODEL_CODE}_${PV}_${FVP_ARCH}.tgz;s=
ubdir=3D${BP}"
+SRC_URI[sha256sum] =3D "dbdcb8b0c206fd56fd2296fe338a62902eb978883ba07f4d=
a28440e180383b24"
=20
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
-                    file://license_terms/third_party_licenses.txt;md5=3D=
41029e71051b1c786bae3112a29905a7"
+                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D34a1ba318d745f05e6197def68ea5411"
--=20
2.25.1


