Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AEBC87FD1
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 17:19:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4934.1754414349695046681
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 Aug 2025 10:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37CD9150C
	for <meta-arm@lists.yoctoproject.org>; Tue,  5 Aug 2025 10:19:01 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D81DB3F673
	for <meta-arm@lists.yoctoproject.org>; Tue,  5 Aug 2025 10:19:08 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/6] arm/hafnium: clean up inherits
Date: Tue,  5 Aug 2025 18:19:00 +0100
Message-ID: <20250805171903.277422-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250805171903.277422-1-ross.burton@arm.com>
References: <20250805171903.277422-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 05 Aug 2025 17:19:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6658

This doesn't use pkgconfig, or python3native, or need to inherit clang.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb b/meta-arm/re=
cipes-bsp/hafnium/hafnium_2.12.0.bb
index c67bca57e9..602f36b33d 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb
@@ -7,10 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D782b40c14bad5=
294672c500501edc103"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-CLANGNATIVE =3D ""
-CLANGNATIVE:runtime-llvm =3D "clang-native"
-
-inherit deploy python3native pkgconfig ${CLANGNATIVE}
+inherit deploy
=20
 SRC_URI =3D "gitsm://git.trustedfirmware.org/hafnium/hafnium.git;protoco=
l=3Dhttps;branch=3Dmaster \
            file://0001-arm-hafnium-fix-kernel-tool-linking.patch  \
--=20
2.43.0


