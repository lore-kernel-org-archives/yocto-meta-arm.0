Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAAA7C28B30
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 12:09:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.36016.1741608593510394635
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Mar 2025 05:09:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 838F6152B
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 Mar 2025 05:10:04 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A73123F5A1
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 Mar 2025 05:09:52 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/arm-bsp/trusted-firmware-a: use main branch when fetching mbedtls
Date: Mon, 10 Mar 2025 12:09:47 +0000
Message-ID: <20250310120948.1807735-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 10 Mar 2025 12:09:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6399

mbedtls pushes to both master and main, but main is preferred.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.11.0.bb | 2 +-
 .../recipes-security/trusted-services/trusted-services-src.inc  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.11.0.bb b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwa=
re-a_2.11.0.bb
index cb73b48d..d4dd8c2a 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.11=
.0.bb
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.11=
.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3Db5fb=
fdeb6855162dded31fadcd5d4dc
=20
 # in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
 # mbedtls-3.6.0
-SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmaster"
+SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmain"
 SRCREV_mbedtls =3D "2ca6c285a0dd3f33982dd57299012dacab1ff206"
=20
 LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-=
src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src=
.inc
index e05aadd7..b30b20b6 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
@@ -24,7 +24,7 @@ SRCREV_dtc =3D "b6910bec11614980a21e46fbccc35934b671bd8=
1"
 LIC_FILES_CHKSUM +=3D "file://../dtc/README.license;md5=3Da1eb22e37f09df=
5b5511b8a278992d0e"
=20
 # MbedTLS, tag "v3.5.1"
-SRC_URI +=3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls;protoc=
ol=3Dhttps;branch=3Dmaster;destsuffix=3Dgit/mbedtls"
+SRC_URI +=3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls;protoc=
ol=3Dhttps;branch=3Dmain;destsuffix=3Dgit/mbedtls"
 SRCREV_mbedtls =3D "15254759342494c7e969766d5424d78d7deb9bfa"
 LIC_FILES_CHKSUM +=3D "file://../mbedtls/LICENSE;md5=3D379d5819937a6c2f1=
ef1630d341e026d"
=20
--=20
2.43.0


