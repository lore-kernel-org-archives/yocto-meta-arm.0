Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0342C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 18:30:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.11741.1641925849508414552
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 10:30:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25C12113E
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 Jan 2022 10:30:49 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C58B83F766
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 Jan 2022 10:30:48 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm-bsp/juno: also build EDK2 firmware
Date: Tue, 11 Jan 2022 18:30:44 +0000
Message-Id: <20220111183044.3220036-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111183044.3220036-1-ross.burton@arm.com>
References: <20220111183044.3220036-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Jan 2022 18:30:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2817

So that all possible combinations are built, add edk2-firmware to the
default image dependencies too.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/juno.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/mach=
ine/juno.conf
index 86253adf..18d52b30 100644
--- a/meta-arm-bsp/conf/machine/juno.conf
+++ b/meta-arm-bsp/conf/machine/juno.conf
@@ -22,7 +22,7 @@ PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?=3D "5.4%"
 PREFERRED_VERSION_u-boot ?=3D "2020.07"
=20
-EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a u-boot firmware-image-juno"
+EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a edk2-firmware u-boot firmwar=
e-image-juno"
=20
 # Juno u-boot configuration
 UBOOT_MACHINE =3D "vexpress_aemv8a_juno_defconfig"
--=20
2.25.1


