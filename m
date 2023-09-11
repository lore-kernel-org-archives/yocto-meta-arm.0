Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D02D5EEB580
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 13:45:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.58820.1694439949502163582
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 Sep 2023 06:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0983D75;
	Mon, 11 Sep 2023 06:46:25 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 51B9D3F766;
	Mon, 11 Sep 2023 06:45:48 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/3] arm/generic-arm64: move SERIAL_CONSOLES to generic-arm64
Date: Mon, 11 Sep 2023 14:45:43 +0100
Message-Id: <20230911134545.426509-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 11 Sep 2023 13:45:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5029

From: Ross Burton <ross.burton@arm.com>

The consoles to use isn't specific to the qemu machine, and without a
value results in no serial consoles when running on real hardware under
sysvinit.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/conf/machine/generic-arm64.conf      | 3 +++
 meta-arm/conf/machine/qemu-generic-arm64.conf | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm/conf/machine/generic-arm64.conf b/meta-arm/conf/mac=
hine/generic-arm64.conf
index 2ee78056..27a0a2f1 100644
--- a/meta-arm/conf/machine/generic-arm64.conf
+++ b/meta-arm/conf/machine/generic-arm64.conf
@@ -16,3 +16,6 @@ WKS_FILE ?=3D "efi-disk.wks.in"
 EFI_PROVIDER ?=3D "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "s=
ystemd-boot", "grub-efi", d)}"
=20
 MACHINE_FEATURES:append =3D " alsa bluetooth efi qemu-usermode rtc scree=
n usbhost vfat wifi"
+
+SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;hvc0"
+SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
diff --git a/meta-arm/conf/machine/qemu-generic-arm64.conf b/meta-arm/con=
f/machine/qemu-generic-arm64.conf
index 717a45c9..edd15475 100644
--- a/meta-arm/conf/machine/qemu-generic-arm64.conf
+++ b/meta-arm/conf/machine/qemu-generic-arm64.conf
@@ -8,9 +8,6 @@ MACHINEOVERRIDES =3D. "generic-arm64:"
 require conf/machine/generic-arm64.conf
 require conf/machine/include/qemu.inc
=20
-SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;hvc0"
-SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
-
 EXTRA_IMAGEDEPENDS +=3D "edk2-firmware"
=20
 # This unique WIC file is necessary because kernel boot args cannot be p=
assed
--=20
2.34.1


