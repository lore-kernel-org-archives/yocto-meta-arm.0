Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D36CD98F9
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 12:59:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18807.1781787561421563651
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jun 2026 05:59:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Hg5gbz4E;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CAF82BC3
	for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jun 2026 05:59:16 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BC4BF3F915
	for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jun 2026 05:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781787560; bh=u9scEH31mrQxnIgEnfdUzCT4BFko5GfcgXIKvV2YQVw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Hg5gbz4EtJXvcoqNzK/jJDVpEP6TEsia4ZDODq6Q3yLm2zVXkLY8252SplDXULARS
	 cQO1ioySSnHSk1pdyfcN3p4D61UdB5h2QVNG03fWoq0VsPnQQZ3obufq0sbAU5ZMoa
	 MXtOV40cEDj5RmI4oEQxCpKMLU/LhDAEU6HPyJow=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/7] arm/trusted-firmware-a: Update LTS to 2.14.2
Date: Thu, 18 Jun 2026 08:59:14 -0400
Message-ID: <20260618125918.62619-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260618125918.62619-1-jon.mason@arm.com>
References: <20260618125918.62619-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Jun 2026 12:59:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7087

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../{fiptool-native_2.14.1.bb =3D> fiptool-native_2.14.2.bb}    | 4 ++--
 ...sted-firmware-a_2.14.1.bb =3D> trusted-firmware-a_2.14.2.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{fiptool-native_2.14.1.bb=
 =3D> fiptool-native_2.14.2.bb} (92%)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.14.=
1.bb =3D> trusted-firmware-a_2.14.2.bb} (96%)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.14.=
1.bb b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.14.2.bb
similarity index 92%
rename from meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.14.1=
.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.14.2.b=
b
index d70304aa1299..b6d302d47354 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.14.1.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.14.2.bb
@@ -9,8 +9,8 @@ SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://review.trustedfirm=
ware.org/TF-A/trusted-fir
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};destsuffix=3Dfiptool-${PV};br=
anch=3D${SRCBRANCH}"
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc63021c6=
eba7b524039e"
=20
-# Use fiptool from TF-A v2.14.1
-SRCREV =3D "e82c7ced9e76aea35b176e608d67dfe5ebe1c569"
+# Use fiptool from TF-A v2.14.2
+SRCREV =3D "aa1793fff49a1b5a6a877c278a0df0a188e2b1f2"
 SRCBRANCH =3D "lts-v2.14"
=20
 DEPENDS +=3D "openssl-native"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.14.1.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
4.2.bb
similarity index 96%
rename from meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.=
14.1.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.14=
.2.bb
index de29941b2c8d..3d0b80188e9b 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.14.1.b=
b
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.14.2.b=
b
@@ -1,8 +1,8 @@
 require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
=20
-# TF-A v2.14.1
+# TF-A v2.14.2
 SRC_URI_TRUSTED_FIRMWARE_A =3D "gitsm://review.trustedfirmware.org/TF-A/=
trusted-firmware-a;protocol=3Dhttps"
-SRCREV_tfa =3D "e82c7ced9e76aea35b176e608d67dfe5ebe1c569"
+SRCREV_tfa =3D "aa1793fff49a1b5a6a877c278a0df0a188e2b1f2"
 SRCBRANCH =3D "lts-v2.14"
=20
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D6ed7bace7b0bc63021c=
6eba7b524039e"
--=20
2.50.1 (Apple Git-155)


