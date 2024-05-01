Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B21C4345F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 12:31:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11398.1714566694539119799
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 May 2024 05:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DB292F4
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 May 2024 05:32:00 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E0E2E3F73F
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 May 2024 05:31:33 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/trusted-firmware-a: update to lts-2.10.4
Date: Wed,  1 May 2024 08:31:33 -0400
Message-Id: <20240501123133.62536-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 May 2024 12:31:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5679

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../{fiptool-native_2.10.3.bb =3D> fiptool-native_2.10.4.bb}    | 4 ++--
 ...sted-firmware-a_2.10.3.bb =3D> trusted-firmware-a_2.10.4.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{fiptool-native_2.10.3.bb=
 =3D> fiptool-native_2.10.4.bb} (92%)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.10.=
3.bb =3D> trusted-firmware-a_2.10.4.bb} (86%)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.=
3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.4.bb
similarity index 92%
rename from meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.3=
.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.4.b=
b
index 5ba8d48cb499..9072dca50a50 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.3.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.4.bb
@@ -9,8 +9,8 @@ SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://git.trustedfirmwar=
e.org/TF-A/trusted-firmwa
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};destsuffix=3Dfiptool-${PV};br=
anch=3D${SRCBRANCH}"
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3Db2c740efedc159745b9b=
31f88ff03dde"
=20
-# Use fiptool from TF-A v2.10.3
-SRCREV =3D "0f915309c3821ce6f78f8451e5a6178d0cf07611"
+# Use fiptool from TF-A v2.10.4
+SRCREV =3D "569e16caad976a0684147da1ecc6333fd9b7f813"
 SRCBRANCH =3D "lts-v2.10"
=20
 DEPENDS +=3D "openssl-native"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.10.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
0.4.bb
similarity index 86%
rename from meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.=
10.3.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10=
.4.bb
index b30ac7252d77..21598c822915 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.3.b=
b
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.4.b=
b
@@ -1,7 +1,7 @@
 require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
=20
-# TF-A v2.10.3
-SRCREV_tfa =3D "0f915309c3821ce6f78f8451e5a6178d0cf07611"
+# TF-A v2.10.4
+SRCREV_tfa =3D "569e16caad976a0684147da1ecc6333fd9b7f813"
 SRCBRANCH =3D "lts-v2.10"
=20
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3Db2c740efedc159745b9=
b31f88ff03dde"
--=20
2.39.3 (Apple Git-146)


