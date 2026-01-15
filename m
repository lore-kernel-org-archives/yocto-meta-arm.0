Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C011D44C5C
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 14:51:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37445.1768488662886891135
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 06:51:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A89EAFEC
	for <meta-arm@lists.yoctoproject.org>; Thu, 15 Jan 2026 06:50:55 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 087F33F632
	for <meta-arm@lists.yoctoproject.org>; Thu, 15 Jan 2026 06:51:01 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/linux-yocto: disable kconfig checking for sbsa-ref and sgi575
Date: Thu, 15 Jan 2026 14:50:56 +0000
Message-ID: <20260115145056.3069017-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 15 Jan 2026 14:51:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6849

The linux-yocto kernel has strict configuration warnings enabled and this
often causes warning, for example with 6.18.3:

[INFO]: the following symbols were not found in the active configuration:
     - CONFIG_SND_SOC_ROCKCHIP
     - CONFIG_SLIM_QCOM_CTRL

For these machines we're using the upstream defconfig and not a config
file that we're maintaining, so fixing these problems upstream is slower
than one would like.

As we don't maintain the config, we can disable the checker for these
two machines. This is _not_ precedence for disabling the audit for any
machines where we're not simply using the upstream defconfig without any
changes.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index ff19169efe..cdfa3d358e 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -107,6 +107,8 @@ COMPATIBLE_MACHINE:musca-s1 =3D "(^$)"
 COMPATIBLE_MACHINE:sgi575 =3D "sgi575"
 KBUILD_DEFCONFIG:sgi575 =3D "defconfig"
 KCONFIG_MODE:sgi575 =3D "--alldefconfig"
+# Upstream defconfig often causes warnings but we don't maintain it
+KCONF_BSP_AUDIT_LEVEL:sgi575 =3D "0"
=20
 #
 # sbsa-ref KMACHINE
@@ -114,3 +116,5 @@ KCONFIG_MODE:sgi575 =3D "--alldefconfig"
 COMPATIBLE_MACHINE:sbsa-ref =3D "sbsa-ref"
 KBUILD_DEFCONFIG:sbsa-ref =3D "defconfig"
 KCONFIG_MODE:sbsa-ref =3D "--alldefconfig"
+# Upstream defconfig often causes warnings but we don't maintain it
+KCONF_BSP_AUDIT_LEVEL:sbsa-ref =3D "0"
--=20
2.43.0


