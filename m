Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D605C87FDA
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 17:19:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5102.1754414348847354631
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 Aug 2025 10:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5C3E150C
	for <meta-arm@lists.yoctoproject.org>; Tue,  5 Aug 2025 10:18:59 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 82A3B3F673
	for <meta-arm@lists.yoctoproject.org>; Tue,  5 Aug 2025 10:19:07 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/6] arm/hafnium: mark compatible with just qemuarm64-secureboot
Date: Tue,  5 Aug 2025 18:18:58 +0100
Message-ID: <20250805171903.277422-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 05 Aug 2025 17:19:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6656

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb b/meta-arm/re=
cipes-bsp/hafnium/hafnium_2.12.0.bb
index 42a02259b2..6987d520cf 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb
@@ -20,14 +20,14 @@ SRCREV =3D "2cf2ca7c4b81ab18e9cd363d9a5c8288e2a94fda"
 B =3D "${WORKDIR}/build"
=20
 COMPATIBLE_MACHINE ?=3D "invalid"
-COMPATIBLE_MACHINE:qemuarm64 =3D "qemuarm64"
+COMPATIBLE_MACHINE:qemuarm64-secureboot =3D "qemuarm64"
=20
 # Default build 'reference'
 HAFNIUM_PROJECT ?=3D "reference"
=20
 # Platform must be set for each machine
 HAFNIUM_PLATFORM ?=3D "invalid"
-HAFNIUM_PLATFORM:qemuarm64 =3D "secure_qemu_aarch64"
+HAFNIUM_PLATFORM:qemuarm64-secureboot =3D "secure_qemu_aarch64"
=20
 # do_deploy will install everything listed in this variable. It is set b=
y
 # default to hafnium
--=20
2.43.0


