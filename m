Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88747C25B6B
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 12:43:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.199056.1698324192009866880
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Oct 2023 05:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C6BA1424;
	Thu, 26 Oct 2023 05:43:53 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D34313F738;
	Thu, 26 Oct 2023 05:43:10 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 1/2] arm-bsp/u-boot: corstone1000: enable on-disk capsule update
Date: Thu, 26 Oct 2023 13:43:02 +0100
Message-Id: <20231026124303.2433202-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231026124303.2433202-1-emekcan.aras@arm.com>
References: <20231026124303.2433202-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Oct 2023 12:43:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5177

From: Emekcan Aras <emekcan.aras@arm.com>

Enables on-disk capsule update feature for corstone1000.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 .../u-boot/u-boot-corstone1000.inc            |  1 +
 ...nables-ondisk-capsule-update-feature.patch | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
039-enables-ondisk-capsule-update-feature.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
index e978e06a..6c56c2fe 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
@@ -46,6 +46,7 @@ SRC_URI:append =3D " \
     file://0036-corstone1000-add-signature-device-tree-overlay.patch \
     file://0037-corstone1000-enable-authenticated-capsule-config.patch \
     file://0038-corstone1000-introduce-EFI-authenticated-capsule-upd.pat=
ch \
+    file://0039-enables-ondisk-capsule-update-feature.patch		  \
     "
=20
 do_configure:append(){
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-ena=
bles-ondisk-capsule-update-feature.patch b/meta-arm-bsp/recipes-bsp/u-boo=
t/u-boot/corstone1000/0039-enables-ondisk-capsule-update-feature.patch
new file mode 100644
index 00000000..cd002aca
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-enables-on=
disk-capsule-update-feature.patch
@@ -0,0 +1,33 @@
+From e5057a10641a7c84186bcbbcd12ee904300ebc53 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Fri, 13 Oct 2023 15:19:32 +0100
+Subject: [PATCH] Enables on-disk capsule update feature
+
+Enables on-disk capsule update feature for corstone1000.
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Upstream-Status: Inappropriate [Redesign of Capsule update interface is =
required]
+---
+ lib/efi_loader/efi_capsule.c | 5 ++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
+index e1c78d8c1c..63e4c06e58 100644
+--- a/lib/efi_loader/efi_capsule.c
++++ b/lib/efi_loader/efi_capsule.c
+@@ -1499,7 +1499,12 @@ efi_status_t efi_launch_capsules(void)
+			index =3D 0;
+		ret =3D efi_capsule_read_file(files[i], &capsule);
+		if (ret =3D=3D EFI_SUCCESS) {
++			#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
++			/* capsule update only supports 1 image and no scatter gather list f=
or corstone1000 */
++			efi_update_capsule(&capsule, 1, 0);
++			#elif
+			ret =3D efi_capsule_update_firmware(capsule);
++			#endif
+			if (ret !=3D EFI_SUCCESS) {
+				log_err("Applying capsule %ls failed.\n",
+					files[i]);
+--
+2.25.1
+
--=20
2.25.1


