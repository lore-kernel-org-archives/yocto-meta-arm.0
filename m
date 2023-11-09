Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1E0C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 10:58:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.118876.1699527490214458244
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Nov 2023 02:58:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA6F81477;
	Thu,  9 Nov 2023 02:58:53 -0800 (PST)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 651AF3F64C;
	Thu,  9 Nov 2023 02:58:08 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 1/1] arm-bsp/u-boot: corstone1000: scatter gather list workaround for ondisk capsule update
Date: Thu,  9 Nov 2023 10:58:03 +0000
Message-Id: <20231109105803.1577272-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231109105803.1577272-1-emekcan.aras@arm.com>
References: <20231109105803.1577272-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Nov 2023 10:58:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5220

From: Emekcan Aras <emekcan.aras@arm.com>

Corstone1000 capsule update implementation does not support use of
scatter_gather_list. This workaround passes 1 as scatter_gather_list valu=
e
to pass the NULL checks for scatter_gather_list while
CAPSULE_FLAGS_PERSIST_ACROSS_RESET flag is set (which is introduced latel=
y to
align with UEFI specs). Since these flag checks are not implemented in u-=
boot
properly and corstone1000 does not support scatter_gather_list during cap=
sule
update, this patch will skip the check only for on-disk capsule update.
This will be fixed with new capsule update design.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 .../u-boot/u-boot-corstone1000.inc            |  1 +
 .../0041-scatter-gather-flag-workaround.patch | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
041-scatter-gather-flag-workaround.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
index 7a7b155c..01a8683c 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
@@ -48,6 +48,7 @@ SRC_URI:append =3D " \
     file://0038-corstone1000-introduce-EFI-authenticated-capsule-upd.pat=
ch \
     file://0039-enables-ondisk-capsule-update-feature.patch		  \
     file://0040-fix-runtime-capsule-update-flags-checks.patch		  \
+    file://0041-scatter-gather-flag-workaround.patch			  \
     "
=20
 do_configure:append(){
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-sca=
tter-gather-flag-workaround.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t/corstone1000/0041-scatter-gather-flag-workaround.patch
new file mode 100644
index 00000000..8ce82a75
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-scatter-ga=
ther-flag-workaround.patch
@@ -0,0 +1,39 @@
+From abc3b43996198012498abe5777cfeedde4538a90 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Mon, 6 Nov 2023 14:52:05 +0000
+Subject: [PATCH] workaround for scatter gather flag check for corstone10=
00
+
+This workaround passes 1 as scatter_gather_list value to pass the NULL c=
hecks
+for scatter_gather_list while CAPSULE_FLAGS_PERSIST_ACROSS_RESET flag is=
 set
+(which is introduced lately to align with UEFI specs). Since these flag =
checks
+are not implemented in u-boot properly and corstone1000 does not support
+scatter_gather_list during capsule update, this patch will skip the chec=
k only
+for on-disk capsule update.
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Upstream-Status: Inappropriate [Redesign of Capsule update interface is =
required]
+---
+ lib/efi_loader/efi_capsule.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
+index a7d70acf2a..efbedce460 100644
+--- a/lib/efi_loader/efi_capsule.c
++++ b/lib/efi_loader/efi_capsule.c
+@@ -1530,8 +1530,11 @@ efi_status_t efi_launch_capsules(void)
+		ret =3D efi_capsule_read_file(files[i], &capsule);
+		if (ret =3D=3D EFI_SUCCESS) {
+			#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
+-			/* capsule update only supports 1 image and no scatter gather list f=
or corstone1000 */
+-			efi_update_capsule(&capsule, 1, 0);
++			/* capsule update only supports 1 image and use of scatter_gather_li=
st
++			 * is not implemented for corstone1000 passing 1 to pass
++			 * the NULL flag checks. This should will be fixed with
++			 * new capsule update design*/
++			ret =3D efi_update_capsule(&capsule, 1, 1);
+			#elif
+			ret =3D efi_capsule_update_firmware(capsule);
+			#endif
+--
+2.25.1
+
--=20
2.25.1


