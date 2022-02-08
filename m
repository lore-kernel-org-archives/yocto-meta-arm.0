Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 436DDC433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 20:33:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.17133.1644352417926991027
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Feb 2022 12:33:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 074CCED1
	for <meta-arm@lists.yoctoproject.org>; Tue,  8 Feb 2022 12:33:36 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A27BE3F73B
	for <meta-arm@lists.yoctoproject.org>; Tue,  8 Feb 2022 12:33:35 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/u-boot: remove unused 2020.10 recipe
Date: Tue,  8 Feb 2022 20:33:33 +0000
Message-Id: <20220208203333.3098329-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Feb 2022 20:33:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2960

This was last used by TC0, but that upgraded in 6bf368c.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/u-boot/u-boot_2020.10.bb      | 26 -------------------
 1 file changed, 26 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.10.bb

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.10.bb b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_2020.10.bb
deleted file mode 100644
index 0c4926bc..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.10.bb
+++ /dev/null
@@ -1,26 +0,0 @@
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
-LICENSE =3D "GPLv2+"
-LIC_FILES_CHKSUM =3D "file://Licenses/README;md5=3D5a7450c57ffe5ae63fd73=
2446b988025"
-PE =3D "1"
-
-# We use the revision in order to avoid having to fetch it from the
-# repo during parse
-SRCREV =3D "050acee119b3757fee3bd128f55d720fdd9bb890"
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


