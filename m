Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9C7C05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 20:29:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9824.1675888161062694385
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 12:29:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B5811477;
	Wed,  8 Feb 2023 12:30:03 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F0463F703;
	Wed,  8 Feb 2023 12:29:20 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm/trusted-firmware-m: Do not use release branches
Date: Wed,  8 Feb 2023 20:29:17 +0000
Message-Id: <20230208202918.2662658-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Feb 2023 20:29:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4374

TF-M does not use persistent release branches and the release-* branches
have been removed from the repository, so switch the branches to master.

Also update the tf-m-tests SRVREV to the 1.7.0 tag, not the RC2.

99% based on a patch by Peter Hoyes <Peter.Hoyes@arm.com>.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m_1.7.0.bb        | 8 ++++----
 .../trusted-firmware-m-scripts-native_1.6.0.bb            | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.7.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.=
0.bb
index b4a4c41f..f4219be6 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.0.bb
@@ -30,14 +30,14 @@ SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D=
${SRCBRANCH_tfm};name=3Dtfm;dests
=20
 # The required dependencies are documented in tf-m/config/config_default=
.cmake
 # TF-Mv1.7.0
-SRCBRANCH_tfm ?=3D "release/1.7.x"
+SRCBRANCH_tfm ?=3D "master"
 SRCREV_tfm =3D "b725a1346cdb9ec75b1adcdc4c84705881e8fd4e"
 # mbedtls-3.2.0
 SRCBRANCH_mbedtls ?=3D "master"
 SRCREV_mbedtls =3D "869298bffeea13b205343361b7a7daf2b210e33d"
-# TF-Mv1.6.0
-SRCBRANCH_tfm-tests ?=3D "release/1.7.x"
-SRCREV_tfm-tests =3D "4972e8df3fcbd386a5b0c18613d8a803f4dda082"
+# TF-Mv1.7.0
+SRCBRANCH_tfm-tests ?=3D "master"
+SRCREV_tfm-tests =3D "4c4b58041c6c01670266690538a780b4a23d08b8"
 # v1.9.0
 SRCBRANCH_mcuboot ?=3D "main"
 SRCREV_mcuboot =3D "c657cbea75f2bb1faf1fceacf972a0537a8d26dd"
diff --git a/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted=
-firmware-m-scripts-native_1.6.0.bb b/meta-arm/recipes-devtools/trusted-f=
irmware-m-scripts/trusted-firmware-m-scripts-native_1.6.0.bb
index 217f08a6..db35ecf7 100644
--- a/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted-firmwa=
re-m-scripts-native_1.6.0.bb
+++ b/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted-firmwa=
re-m-scripts-native_1.6.0.bb
@@ -2,7 +2,7 @@
 SRC_URI_TRUSTED_FIRMWARE_M ?=3D "git://git.trustedfirmware.org/TF-M/trus=
ted-firmware-m.git;protocol=3Dhttps"
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${SRCBRANCH}"
 # Use the wrapper script from TF-Mv1.6.0
-SRCBRANCH ?=3D "release/1.6.x"
+SRCBRANCH ?=3D "master"
 SRCREV =3D "7387d88158701a3c51ad51c90a05326ee12847a8"
=20
 LICENSE =3D "BSD-3-Clause"
--=20
2.34.1


