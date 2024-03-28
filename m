Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C4CCD11DD
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 20:12:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1945.1711656728157833639
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Mar 2024 13:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27DF11476
	for <meta-arm@lists.yoctoproject.org>; Thu, 28 Mar 2024 13:12:41 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 80A303F694
	for <meta-arm@lists.yoctoproject.org>; Thu, 28 Mar 2024 13:12:07 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/sbsa-acs: use UPSTREAM_CHECK_URI for version checking
Date: Thu, 28 Mar 2024 16:12:05 -0400
Message-Id: <20240328201206.14812-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 28 Mar 2024 20:12:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5500

Since sbsa-acs requires edk2-firmware, it bases its SRC_URI on that.
The first entry of SRC_URI is what is used to determine the latest
version.  So, specify an alternative URI to determine the correct
version.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.4.bb b/meta-arm/recip=
es-bsp/uefi/sbsa-acs_7.1.4.bb
index b61658c44bba..a29c16ecb466 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.4.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.4.bb
@@ -13,6 +13,8 @@ SRC_URI +=3D "git://github.com/ARM-software/sbsa-acs;de=
stsuffix=3Dedk2/ShellPkg/Appl
 SRCREV_acs =3D "be169f0008d86341e1e48cb70d524bd1518c3acc"
 SRCREV_libc =3D "4667a82f0d873221f8b25ea701ce57a29270e4cb"
=20
+UPSTREAM_CHECK_URI =3D "https://github.com/ARM-software/sbsa-acs/release=
s"
+
 COMPATIBLE_HOST =3D "aarch64.*-linux"
 COMPATIBLE_MACHINE =3D ""
 PACKAGE_ARCH =3D "${TUNE_PKGARCH}"
--=20
2.39.3 (Apple Git-146)


