Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E32C25B67
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 12:43:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.199057.1698324192946489445
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Oct 2023 05:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 247A92F4;
	Thu, 26 Oct 2023 05:43:54 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CB3743F738;
	Thu, 26 Oct 2023 05:43:11 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 2/2] arm-bsp/u-boot: corstone1000: fix runtime capsule update flag checks
Date: Thu, 26 Oct 2023 13:43:03 +0100
Message-Id: <20231026124303.2433202-3-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231026124303.2433202-1-emekcan.aras@arm.com>
References: <20231026124303.2433202-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Oct 2023 12:43:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5178

From: Emekcan Aras <emekcan.aras@arm.com>

Platform-specific capsule-update feature in u-boot does not check the
capsule-update flags properly (as stated in UEFI specs). This patch fixes=
 the
capsule flags checks in u-boot for corstone1000.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 .../u-boot/u-boot-corstone1000.inc            |  1 +
 ...-runtime-capsule-update-flags-checks.patch | 56 +++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
040-fix-runtime-capsule-update-flags-checks.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
index 6c56c2fe..7a7b155c 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
@@ -47,6 +47,7 @@ SRC_URI:append =3D " \
     file://0037-corstone1000-enable-authenticated-capsule-config.patch \
     file://0038-corstone1000-introduce-EFI-authenticated-capsule-upd.pat=
ch \
     file://0039-enables-ondisk-capsule-update-feature.patch		  \
+    file://0040-fix-runtime-capsule-update-flags-checks.patch		  \
     "
=20
 do_configure:append(){
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-fix=
-runtime-capsule-update-flags-checks.patch b/meta-arm-bsp/recipes-bsp/u-b=
oot/u-boot/corstone1000/0040-fix-runtime-capsule-update-flags-checks.patc=
h
new file mode 100644
index 00000000..b1d400d7
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-fix-runtim=
e-capsule-update-flags-checks.patch
@@ -0,0 +1,56 @@
+From a83aa9e1b8f6e312da82e54614fbca498493c34d Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Thu, 19 Oct 2023 14:56:55 +0100
+Subject: [PATCH] fix runtime capsule update flags checks for corstone100=
0
+
+Fixes capsule update flags checks in capsule update as these checks are =
missing
+in the platform-specific capsule-update implementation in corstone1000.
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Upstream-Status: Inappropriate [Redesign of Capsule update interface is =
required]
+---
+ lib/efi_loader/efi_capsule.c | 28 ++++++++++++++++++++++++++++
+ 1 file changed, 28 insertions(+)
+
+diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
+index 307bcfd73c..34507482b7 100644
+--- a/lib/efi_loader/efi_capsule.c
++++ b/lib/efi_loader/efi_capsule.c
+@@ -854,6 +854,34 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsul=
e(
+			continue;
+		}
+
++		/* According to UEFI specs when the flag is CAPSULE_FLAGS_PERSIST_ACR=
OSS_RESET,
++		ScatterGatherList can't be NULL.*/
++		if ((capsule->flags & CAPSULE_FLAGS_PERSIST_ACROSS_RESET) &&
++		    scatter_gather_list =3D=3D 0){
++			ret =3D EFI_INVALID_PARAMETER;
++			goto out;
++		}
++
++		/*According to UEFI specs a capsule which has the CAPSULE_FLAGS_POPUL=
ATE_SYSTEM_TABLE
++		 * flag must have CAPSULE_FLAGS_PERSIST_ACROSS_RESET set in its
++		 * header as well.*/
++		if (capsule->flags & CAPSULE_FLAGS_POPULATE_SYSTEM_TABLE){
++			if(!(capsule->flags & CAPSULE_FLAGS_PERSIST_ACROSS_RESET)){
++				ret =3D EFI_INVALID_PARAMETER;
++				goto out;
++			}
++		}
++
++		/* According to UEFI specs, a capsule which has the CAPSULE_FLAGS_INI=
TIATE_RESET
++		 * Flag must have  CAPSULE_FLAGS_PERSIST_ACROSS_RESET set in its
++		 * header as well.*/
++		if (capsule->flags & CAPSULE_FLAGS_INITIATE_RESET){
++			if(!(capsule->flags & CAPSULE_FLAGS_PERSIST_ACROSS_RESET)){
++				ret =3D EFI_INVALID_PARAMETER;
++				goto out;
++			}
++		}
++
+		log_debug("Capsule[%d] (guid:%pUs)\n",
+			  i, &capsule->capsule_guid);
+
+--
+2.25.1
+
--=20
2.25.1


