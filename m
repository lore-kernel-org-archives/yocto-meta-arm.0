Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D567C6FD1F
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 14:49:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.47010.1710946183914391758
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 Mar 2024 07:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30C9B1063
	for <meta-arm@lists.yoctoproject.org>; Wed, 20 Mar 2024 07:50:18 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5CE4D3F64C
	for <meta-arm@lists.yoctoproject.org>; Wed, 20 Mar 2024 07:49:43 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/trusted-firmware-a: update to 2.10.2
Date: Wed, 20 Mar 2024 10:49:41 -0400
Message-Id: <20240320144942.58433-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240320144942.58433-1-jon.mason@arm.com>
References: <20240320144942.58433-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 20 Mar 2024 14:49:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5463

Update the TF-A recipe to the latest stable version (2.10.2).
NOTE: tf-a-tests did not have a corresponding stable release.  So,
keeping back at 2.10.0.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../{fiptool-native_2.10.0.bb =3D> fiptool-native_2.10.2.bb}  | 6 +++---
 ...ed-firmware-a_2.10.0.bb =3D> trusted-firmware-a_2.10.2.bb} | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{fiptool-native_2.10.0.bb=
 =3D> fiptool-native_2.10.2.bb} (90%)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.10.=
0.bb =3D> trusted-firmware-a_2.10.2.bb} (82%)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.=
0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.2.bb
similarity index 90%
rename from meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.0=
.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.2.b=
b
index e45ea9c4a6e8..d0c057a1e8c1 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.2.bb
@@ -9,9 +9,9 @@ SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://git.trustedfirmwar=
e.org/TF-A/trusted-firmwa
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};destsuffix=3Dfiptool-${PV};br=
anch=3D${SRCBRANCH}"
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3Db2c740efedc159745b9b=
31f88ff03dde"
=20
-# Use fiptool from TF-A v2.10.0
-SRCREV =3D "b6c0948400594e3cc4dbb5a4ef04b815d2675808"
-SRCBRANCH =3D "master"
+# Use fiptool from TF-A v2.10.2
+SRCREV =3D "a1be69e6c5db450f841f0edd9d734bf3cffb6621"
+SRCBRANCH =3D "lts-v2.10"
=20
 DEPENDS +=3D "openssl-native"
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.10.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
0.2.bb
similarity index 82%
rename from meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.=
10.0.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10=
.2.bb
index d25c0aaa01c8..bf2a8c168c3d 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.0.b=
b
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.2.b=
b
@@ -1,7 +1,8 @@
 require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
=20
-# TF-A v2.10.0
-SRCREV_tfa =3D "b6c0948400594e3cc4dbb5a4ef04b815d2675808"
+# TF-A v2.10.2
+SRCREV_tfa =3D "a1be69e6c5db450f841f0edd9d734bf3cffb6621"
+SRCBRANCH =3D "lts-v2.10"
=20
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3Db2c740efedc159745b9=
b31f88ff03dde"
=20
--=20
2.39.3 (Apple Git-146)


