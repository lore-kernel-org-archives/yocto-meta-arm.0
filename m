Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA596CD5BAD
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 12:44:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7499.1695127480288240573
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 Sep 2023 05:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 366111FB
	for <meta-arm@lists.yoctoproject.org>; Tue, 19 Sep 2023 05:45:17 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BEC693F67D
	for <meta-arm@lists.yoctoproject.org>; Tue, 19 Sep 2023 05:44:39 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm/trusted-firmware-m: update to 1.8.1
Date: Tue, 19 Sep 2023 07:44:33 -0500
Message-Id: <20230919124435.3776850-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 19 Sep 2023 12:44:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5060

TFM updated to 1.8.1.  Note, TF-Mv1.8.1 tags point to the same SHA as
the TF-Mv1.8.0 tag for tf-m-tests and tf-m-extras.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ....8.0-src.inc =3D> trusted-firmware-m-1.8.1-src.inc} | 12 ++++++------
 ...bb =3D> trusted-firmware-m-scripts-native_1.8.1.bb} |  2 +-
 ...rmware-m_1.8.0.bb =3D> trusted-firmware-m_1.8.1.bb} |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)
 rename meta-arm/recipes-bsp/trusted-firmware-m/{trusted-firmware-m-1.8.0=
-src.inc =3D> trusted-firmware-m-1.8.1-src.inc} (93%)
 rename meta-arm/recipes-bsp/trusted-firmware-m/{trusted-firmware-m-scrip=
ts-native_1.8.0.bb =3D> trusted-firmware-m-scripts-native_1.8.1.bb} (57%)
 rename meta-arm/recipes-bsp/trusted-firmware-m/{trusted-firmware-m_1.8.0=
.bb =3D> trusted-firmware-m_1.8.1.bb} (52%)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1=
.8.0-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-1.8.1-src.inc
similarity index 93%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.=
8.0-src.inc
rename to meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.8.=
1-src.inc
index 393ce439..f7e202ad 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.8.0-sr=
c.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.8.1-sr=
c.inc
@@ -22,22 +22,22 @@ SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D=
${SRCBRANCH_tfm};name=3Dtfm;dests
             "
=20
 # The required dependencies are documented in tf-m/config/config_default=
.cmake
-# TF-Mv1.8.0
+# TF-Mv1.8.1
 SRCBRANCH_tfm ?=3D "master"
-SRCREV_tfm =3D "35ac80c8581d483da7d18cb8bcd20aaed096550c"
-# TF-Mv1.8.0
+SRCREV_tfm =3D "53aa78efef274b9e46e63b429078ae1863609728"
+# TF-Mv1.8.1
 SRCBRANCH_tfm-tests ?=3D "master"
 SRCREV_tfm-tests =3D "1273c5bcd3d8ade60d51524797e0b22b6fd7eea1"
-# mbedtls-3.4.0
+# mbedtls-3.4.1
 SRCBRANCH_mbedtls ?=3D "master"
-SRCREV_mbedtls =3D "1873d3bfc2da771672bd8e7e8f41f57e0af77f33"
+SRCREV_mbedtls =3D "72718dd87e087215ce9155a826ee5a66cfbe9631"
 # mcuboot v1.10.0
 SRCBRANCH_mcuboot ?=3D "main"
 SRCREV_mcuboot =3D "23d28832f02dcdc18687782c6cd8ba99e9b274d2"
 # QCBOR v1.2
 SRCBRANCH_qcbor ?=3D "master"
 SRCREV_qcbor =3D "b0e7033268e88c9f27146fa9a1415ef4c19ebaff"
-# TF-Mv1.8.0
+# TF-Mv1.8.1
 SRCBRANCH_tfm-extras ?=3D "master"
 SRCREV_tfm-extras =3D "504ae9a9a50981e9dd4d8accec8261a1dba9e965"
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-s=
cripts-native_1.8.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-=
firmware-m-scripts-native_1.8.1.bb
similarity index 57%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-sc=
ripts-native_1.8.0.bb
rename to meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scri=
pts-native_1.8.1.bb
index 10b141d7..d50d886f 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-=
native_1.8.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-=
native_1.8.1.bb
@@ -1,2 +1,2 @@
-require recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.8.0-src.inc
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m-${PV}-src.inc
 require recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-native=
.inc
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.8.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.8.=
1.bb
similarity index 52%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.=
8.0.bb
rename to meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.8.=
1.bb
index 5794c1ee..3464f49d 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.8.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.8.1.bb
@@ -1,2 +1,2 @@
-require recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.8.0-src.inc
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m-${PV}-src.inc
 require recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
--=20
2.30.2


