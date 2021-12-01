Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 430EBC43217
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 14:57:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.93232.1638370655704376787
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 06:57:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84B75143B
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 Dec 2021 06:57:36 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 300A93F766
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 Dec 2021 06:57:36 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/7] arm/edk2-firmware: set a default invalid
 COMPATIBLE_MACHINE
Date: Wed,  1 Dec 2021 14:57:28 +0000
Message-Id: <20211201145729.4138705-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201145729.4138705-1-ross.burton@arm.com>
References: <20211201145729.4138705-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 Dec 2021 14:57:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2506

Building edk2-firmware needs explicit configuration for the target
machine, so set an invalid COMPATIBLE_MACHINE to stop edk2-firmware
building for, example, qemumips.

sbsa-acs is an application, so unset COMPATIBLE_MACHINE in that recipe
as it will work on all aarch64 targets.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc | 5 +++--
 meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb   | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recip=
es-bsp/uefi/edk2-firmware.inc
index 264ffa94..dc4c6295 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -22,6 +22,9 @@ SRC_URI =3D "\
 SRCREV_FORMAT         =3D "edk2_edk2-platforms"
 UPSTREAM_CHECK_GITTAGREGEX =3D "^edk2-stable(?P<pver>\d+)$"
=20
+COMPATIBLE_MACHINE ?=3D "invalid"
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
 EDK2_BUILD_RELEASE =3D ""
 EDK2_PLATFORM      =3D "unset"
 # build --platform
@@ -50,8 +53,6 @@ inherit deploy
 S =3D "${WORKDIR}/edk2"
 B =3D "${WORKDIR}/build"
=20
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
 LDFLAGS[unexport] =3D "1"
=20
 do_configure[cleandirs] +=3D "${B}"
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb b/meta-arm/recipes=
-bsp/uefi/sbsa-acs_3.0.bb
index c4e07527..d049834c 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb
@@ -13,7 +13,9 @@ SRC_URI +=3D "git://github.com/ARM-software/sbsa-acs;de=
stsuffix=3Dedk2/ShellPkg/Appl
 SRCREV_acs =3D "1b3a37214fe6809e07e471f79d1ef856461bc803"
 SRCREV_libc =3D "61687168fe02ac4d933a36c9145fdd242ac424d1"
=20
+COMPATIBLE_MACHINE =3D ""
 COMPATIBLE_HOST =3D "aarch64.*-linux"
+
 EDK2_PLATFORM =3D "Shell"
 EDK2_PLATFORM_DSC =3D "ShellPkg/ShellPkg.dsc"
 EDK2_EXTRA_BUILD =3D "--module ShellPkg/Application/sbsa-acs/uefi_app/Sb=
saAvs.inf"
--=20
2.25.1


