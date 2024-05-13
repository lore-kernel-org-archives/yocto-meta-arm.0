Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF04C25B10
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 15:56:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.64515.1715615785383743491
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 May 2024 08:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EBAC1007
	for <meta-arm@lists.yoctoproject.org>; Mon, 13 May 2024 08:56:50 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8BD8D3F641
	for <meta-arm@lists.yoctoproject.org>; Mon, 13 May 2024 08:56:24 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/trusted-firmware-a: use correct git URL
Date: Mon, 13 May 2024 15:56:22 +0000
Message-Id: <20240513155622.373417-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 May 2024 15:56:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5712

As per the documentation[1] the correct git server to use is
review.trustedfirmware.org. We occasionally see failures connecting to
git.trustedfirmware.org so hopefully the documented URLs are more stable.

[1] https://trustedfirmware-a.readthedocs.io/en/latest/getting_started/pr=
erequisites.html

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 922c0a34..80d41f32 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -5,7 +5,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit deploy
=20
-SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://git.trustedfirmware.org/TF-A/trus=
ted-firmware-a.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://review.trustedfirmware.org/TF-A/t=
rusted-firmware-a;protocol=3Dhttps"
 SRCBRANCH =3D "master"
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};name=3Dtfa;branch=3D${SRCBRAN=
CH}"
=20
--=20
2.34.1


