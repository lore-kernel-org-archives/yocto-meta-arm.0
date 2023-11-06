Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D47C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 14:50:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.56442.1699282214453318097
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 06:50:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CA671FB;
	Mon,  6 Nov 2023 06:50:58 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EBA2B3F6C4;
	Mon,  6 Nov 2023 06:50:12 -0800 (PST)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm/generic-arm64: remove obsolete SERIAL_CONSOLES_CHECK
Date: Mon,  6 Nov 2023 14:50:10 +0000
Message-Id: <20231106145010.1059052-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Nov 2023 14:50:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5208

From: Ross Burton <ross.burton@arm.com>

This is no longer needed as Nanbield uses ttyrun to avoid re-spawning
gettys.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/conf/machine/generic-arm64.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arm/conf/machine/generic-arm64.conf b/meta-arm/conf/mac=
hine/generic-arm64.conf
index 2e82e86a..9594e041 100644
--- a/meta-arm/conf/machine/generic-arm64.conf
+++ b/meta-arm/conf/machine/generic-arm64.conf
@@ -18,7 +18,6 @@ EFI_PROVIDER ?=3D "${@bb.utils.contains("DISTRO_FEATURE=
S", "systemd", "systemd-boo
 MACHINE_FEATURES:append =3D " alsa bluetooth efi qemu-usermode rtc scree=
n usbhost vfat wifi"
=20
 SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;hvc0"
-SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
=20
 XSERVER ?=3D "xserver-xorg \
             xf86-video-fbdev \
--=20
2.34.1


