Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7738EC07545
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:52:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.148341.1698155562011932508
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 145092F4;
	Tue, 24 Oct 2023 06:53:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 870743F762;
	Tue, 24 Oct 2023 06:52:40 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/4] arm/fvp-corstone1000: upgrade to 11.22.35, add aarch64 binaries
Date: Tue, 24 Oct 2023 14:52:33 +0100
Message-Id: <20231024135236.3510412-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 24 Oct 2023 13:52:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5162

From: Ross Burton <ross.burton@arm.com>

Upgrade to the 11.22.35 release of the FVP.

Also add the aarch64 binaries as these are now available.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb b/meta-arm=
/recipes-devtools/fvp/fvp-corstone1000.bb
index 7d556616..2373d9f2 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb
@@ -1,11 +1,14 @@
 require fvp-ecosystem.inc
=20
-MODEL =3D "Corstone-1000-23"
+MODEL =3D "Corstone-1000"
 MODEL_CODE =3D "FVP_Corstone_1000"
-PV =3D "11.19_21"
+PV =3D "11.22_35"
=20
-SRC_URI =3D "https://developer.arm.com/-/media/Arm%20Developer%20Communi=
ty/Downloads/OSS/FVP/${MODEL}/Linux/${MODEL_CODE}_${PV}_${FVP_ARCH}.tgz;s=
ubdir=3D${BP}"
-SRC_URI[sha256sum] =3D "dbdcb8b0c206fd56fd2296fe338a62902eb978883ba07f4d=
a28440e180383b24"
+SRC_URI =3D "https://developer.arm.com/-/media/Arm%20Developer%20Communi=
ty/Downloads/OSS/FVP/${MODEL}/${MODEL_CODE}_${PV}_${FVP_ARCH}.tgz;subdir=3D=
${BP};name=3Dfvp-${HOST_ARCH}"
+SRC_URI[fvp-aarch64.sha256sum] =3D "40c76551ca73328d34513dbc5de2bd094c28=
da7e91b73fe0361ec8faef644b68"
+SRC_URI[fvp-x86_64.sha256sum] =3D "30eb648d26827212faeb74b8c10070cbf8bf2=
12d106ee609579f781a32aac6d9"
=20
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
-                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D34a1ba318d745f05e6197def68ea5411"
+                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D0c32ac6f58ebff83065105042ab98211"
+
+COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux"
--=20
2.34.1


