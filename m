Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C89FEB64DD
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 15:34:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.265.1689867275863438726
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Jul 2023 08:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB77C2F4
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 Jul 2023 08:35:18 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3B0013F738
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 Jul 2023 08:34:35 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp/juno: remove commented out KCONFIG
Date: Thu, 20 Jul 2023 10:34:29 -0500
Message-Id: <20230720153430.3580005-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Jul 2023 15:34:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4910

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 38bea022..64b1e41e 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -76,8 +76,6 @@ SRC_URI:append:fvp-baser-aemv8r64 =3D " file://fvp-base=
r-aemv8r64.dts;subdir=3Dgit/a
 # Juno KMACHINE
 #
 COMPATIBLE_MACHINE:juno =3D "juno"
-#KBUILD_DEFCONFIG:juno =3D "defconfig"
-#KCONFIG_MODE:juno =3D "--alldefconfig"
 FILESEXTRAPATHS:prepend:juno :=3D "${ARMBSPFILESPATHS}"
 SRC_URI:append:juno =3D " \
     file://0001-arm64-dts-Update-cache-properties-for-Arm-Ltd-platfo.pat=
ch \
--=20
2.30.2


