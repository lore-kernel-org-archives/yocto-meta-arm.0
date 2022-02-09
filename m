Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A98AC433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 17:46:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.30238.1644428789183622211
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Feb 2022 09:46:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 833C6ED1
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Feb 2022 09:46:28 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 26D093F70D
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Feb 2022 09:46:28 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/5] arm-bsp/linux-yocto: drop redundant KMACHINE assignments
Date: Wed,  9 Feb 2022 17:46:20 +0000
Message-Id: <20220209174624.3824874-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 09 Feb 2022 17:46:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2969

KMACHINE defaults to MACHINE, so remove the redundant assignments.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 0f62011c..4b395af4 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -25,7 +25,6 @@ SRCREV:arm-platforms-kmeta =3D "6147e82375aa9df8f2a162d=
42ea6406c79c854c5"
 # Corstone-500 KMACHINE
 #
 COMPATIBLE_MACHINE:corstone500 =3D "corstone500"
-KMACHINE:corstone500 =3D "corstone500"
 KBUILD_DEFCONFIG:corstone500  =3D "multi_v7_defconfig"
 KCONFIG_MODE:corstone500 =3D "--alldefconfig"
=20
@@ -137,7 +136,6 @@ SRC_URI:append:fvp-baser-aemv8r64 =3D " file://fvp-ba=
ser-aemv8r64.dts;subdir=3Dgit/a
 # Juno KMACHINE
 #
 COMPATIBLE_MACHINE:juno =3D "juno"
-KMACHINE:juno =3D "juno"
 KBUILD_DEFCONFIG:juno =3D "defconfig"
 KCONFIG_MODE:juno =3D "--alldefconfig"
 #FIXME - temporarily pin kernel version to allow for juno patches to app=
ly
@@ -188,7 +186,6 @@ KCONF_AUDIT_LEVEL:n1sdp:pn-linux-yocto-rt =3D "0"
 # SGI575 KMACHINE
 #
 COMPATIBLE_MACHINE:sgi575 =3D "sgi575"
-KMACHINE:sgi575 =3D "sgi575"
 KBUILD_DEFCONFIG:sgi575 =3D "defconfig"
 KCONFIG_MODE:sgi575 =3D "--alldefconfig"
=20
--=20
2.25.1


