Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B69C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 14:27:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.11550.1639405645151301892
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 06:27:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA5B5D6E
	for <meta-arm@lists.yoctoproject.org>; Mon, 13 Dec 2021 06:27:14 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 545A33F73B
	for <meta-arm@lists.yoctoproject.org>; Mon, 13 Dec 2021 06:27:14 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/sbsa-acs: reset PACKAGE_ARCH
Date: Mon, 13 Dec 2021 14:27:11 +0000
Message-Id: <20211213142712.4080364-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Dec 2021 14:27:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2643

edk2-firmware is machine-specific, but this is a generic binary so we
can reset PACKAGE_ARCH to the tune.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb b/meta-arm/recipes=
-bsp/uefi/sbsa-acs_3.0.bb
index d049834c..3e0f6ab4 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb
@@ -13,8 +13,9 @@ SRC_URI +=3D "git://github.com/ARM-software/sbsa-acs;de=
stsuffix=3Dedk2/ShellPkg/Appl
 SRCREV_acs =3D "1b3a37214fe6809e07e471f79d1ef856461bc803"
 SRCREV_libc =3D "61687168fe02ac4d933a36c9145fdd242ac424d1"
=20
-COMPATIBLE_MACHINE =3D ""
 COMPATIBLE_HOST =3D "aarch64.*-linux"
+COMPATIBLE_MACHINE =3D ""
+PACKAGE_ARCH =3D "${TUNE_PKGARCH}"
=20
 EDK2_PLATFORM =3D "Shell"
 EDK2_PLATFORM_DSC =3D "ShellPkg/ShellPkg.dsc"
--=20
2.25.1


