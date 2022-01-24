Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE1EC4332F
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 16:30:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5983.1643041816660299407
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Jan 2022 08:30:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50B60101E
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 08:30:16 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0A463F793
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 08:30:15 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] arm-bsp/u-boot: remove old 2020.04 recipe
Date: Mon, 24 Jan 2022 16:30:10 +0000
Message-Id: <20220124163012.3796553-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124163012.3796553-1-ross.burton@arm.com>
References: <20220124163012.3796553-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 16:30:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2899

This was only used by Corstone 700, so is redundant now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/u-boot/u-boot_2020.04.bb      | 28 -------------------
 1 file changed, 28 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bb

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bb b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_2020.04.bb
deleted file mode 100644
index 1cd54be4..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-HOMEPAGE =3D "http://www.denx.de/wiki/U-Boot/WebHome"
-DESCRIPTION =3D "U-Boot, a boot loader for Embedded boards based on Powe=
rPC, \
-ARM, MIPS and several other processors, which can be installed in a boot=
 \
-ROM and used to initialize and test the hardware or to download and run =
\
-application code."
-SECTION =3D "bootloaders"
-DEPENDS +=3D "flex-native bison-native"
-
-COMPATIBLE_MACHINE =3D "(corstone700-*)"
-
-LICENSE =3D "GPLv2+"
-LIC_FILES_CHKSUM =3D "file://Licenses/README;md5=3D30503fd321432fc713238=
f582193b78e"
-PE =3D "1"
-
-# We use the revision in order to avoid having to fetch it from the
-# repo during parse
-SRCREV =3D "36fec02b1f90b92cf51ec531564f9284eae27ab4"
-
-SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster \
-          "
-
-S =3D "${WORKDIR}/git"
-B =3D "${WORKDIR}/build"
-do_configure[cleandirs] =3D "${B}"
-
-require recipes-bsp/u-boot/u-boot.inc
-
-DEPENDS +=3D "bc-native dtc-native"
--=20
2.25.1


