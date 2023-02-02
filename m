Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B177C64EC4
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 09:55:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11191.1675331702897382180
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Feb 2023 01:55:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEC851042;
	Thu,  2 Feb 2023 01:55:44 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D2633F64C;
	Thu,  2 Feb 2023 01:55:02 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 5/6] arm-bsp: corstone500: bump kernel version to 6.1
Date: Thu,  2 Feb 2023 09:54:55 +0000
Message-Id: <20230202095456.3113221-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202095456.3113221-1-ross.burton@arm.com>
References: <20230202095456.3113221-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 02 Feb 2023 09:55:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4352

From: Rui Miguel Silva <rui.silva@linaro.org>

Bump corstone500 kernel version to 6.1 and drop the not
longer needed patch regarding the SND_SOC_AC97 config
option in multi_v7.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 meta-arm-bsp/conf/machine/corstone500.conf                | 2 +-
 meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc | 4 ----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/co=
nf/machine/corstone500.conf
index 2642ec71..a599660c 100644
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -12,7 +12,7 @@ require conf/machine/include/arm/armv7a/tune-cortexa5.i=
nc
 # apply.
 #
 PREFERRED_PROVIDER_virtual/kernel:forcevariable =3D "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?=3D "5.19%"
+PREFERRED_VERSION_linux-yocto ?=3D "6.1%"
=20
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a u-boot"
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index e2a36c9b..96873c90 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -27,10 +27,6 @@ SRCREV:arm-platforms-kmeta =3D "6147e82375aa9df8f2a162=
d42ea6406c79c854c5"
 COMPATIBLE_MACHINE:corstone500 =3D "corstone500"
 KBUILD_DEFCONFIG:corstone500  =3D "multi_v7_defconfig"
 KCONFIG_MODE:corstone500 =3D "--alldefconfig"
-FILESEXTRAPATHS:prepend:corstone500 :=3D "${ARMBSPFILESPATHS}"
-SRC_URI:append:corstone500 =3D " \
-           file://0001-arm-defconfig-drop-CONFIG_SND_SOC_AC97-from-multi=
_v7.patch \
-           "
=20
 #
 # Corstone1000 KMACHINE
--=20
2.34.1


