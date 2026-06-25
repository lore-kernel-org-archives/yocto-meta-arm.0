Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA66CDE00E
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 21:00:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21546.1782421222381370617
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 14:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=E7DxMHvm;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 186F83535
	for <meta-arm@lists.yoctoproject.org>; Thu, 25 Jun 2026 14:00:17 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 820083F836
	for <meta-arm@lists.yoctoproject.org>; Thu, 25 Jun 2026 14:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782421221; bh=M9QJ8Ll3Srhd9DlJ8lm7Vt2jap2zPL9IQjNqSlBGSM4=;
	h=From:To:Subject:Date:From;
	b=E7DxMHvmRdS3LyUdaOy/OsxJf8FDC/mUvQuN+RDQk/X6Cz3/K1G92dJ2h6xT1lyrH
	 OSrCwkDEEA1ViVf6VII+J604FvVnjzbpHJOsy8W5XhmldQUK5rlfosonknIjAVXFl9
	 fwRexFnix5KqvLx0niwQjvWb7v7XzIasgwyfLtCw=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/u-boot: fix uefi-secureboot on u-boot v2026.04
Date: Thu, 25 Jun 2026 17:00:20 -0400
Message-ID: <20260625210020.29112-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 25 Jun 2026 21:00:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7096

u-boot v2026.04 changed to kbuild 6.1, which broke how ubootefi.var is
used.  Apply patch from u-boot mailing list to address the issue.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../u-boot/u-boot-uefi-secureboot.inc         |  4 +-
 ...uilding-with-CONFIG_EFI_VARIABLES_PR.patch | 67 +++++++++++++++++++
 2 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot/0001-efi_loader-fi=
x-building-with-CONFIG_EFI_VARIABLES_PR.patch

diff --git a/meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc b/met=
a-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc
index cb2fed1573f9..af641278e06e 100644
--- a/meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc
+++ b/meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc
@@ -1,6 +1,8 @@
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
-SRC_URI +=3D "file://uefi-secureboot.cfg"
+SRC_URI +=3D "file://uefi-secureboot.cfg \
+            file://0001-efi_loader-fix-building-with-CONFIG_EFI_VARIABLE=
S_PR.patch \
+           "
=20
 inherit sbsign
=20
diff --git a/meta-arm/recipes-bsp/u-boot/u-boot/0001-efi_loader-fix-build=
ing-with-CONFIG_EFI_VARIABLES_PR.patch b/meta-arm/recipes-bsp/u-boot/u-bo=
ot/0001-efi_loader-fix-building-with-CONFIG_EFI_VARIABLES_PR.patch
new file mode 100644
index 000000000000..f6df099a4ffe
--- /dev/null
+++ b/meta-arm/recipes-bsp/u-boot/u-boot/0001-efi_loader-fix-building-wit=
h-CONFIG_EFI_VARIABLES_PR.patch
@@ -0,0 +1,67 @@
+From 8f5501a6118a8b889bac710560d2ba6ed420dab3 Mon Sep 17 00:00:00 2001
+From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
+Date: Wed, 24 Jun 2026 07:48:19 +0200
+Subject: [PATCH] efi_loader: fix building with CONFIG_EFI_VARIABLES_PRES=
EED=3Dy
+
+Since commit bd3f9ee679b4 ("kbuild: Bump the build system to 6.1")
+out-of-tree builds with CONFIG_EFI_VARIABLES_PRESEED=3Dy fail with error=
s
+like:
+
+    ../lib/efi_loader/efi_var_seed.S:14: Error: file not found:
+    ubootefi.var
+
+For out-of-tree build we cannot use CONFIG_EFI_VAR_SEED_FILE in the
+.incbin statement of file efi_var_seed.S.
+
+* We have to prepend $(srctree) if the path is relative.
+* We must not prepend $(srctree) if the path is absolute.
+
+Fixes: bd3f9ee679b4 ("kbuild: Bump the build system to 6.1")
+Reported-by: Jon Mason <jon.mason@arm.com>
+Closes: https://lore.kernel.org/u-boot/CAPoiz9zg4OXgHo5J3WtJHKOEuWOdCDru=
gWfAt6Z+d71j=3D+q8oA@mail.gmail.com/T/#mffaca10a9e812d03eceafad59999a02e5=
7258b9a
+Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
+
+Upstream-Status: Submitted [https://lists.denx.de/pipermail/u-boot/2026-=
June/622729.html]
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+---
+ lib/efi_loader/Makefile       | 7 +++++--
+ lib/efi_loader/efi_var_seed.S | 4 +---
+ 2 files changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/lib/efi_loader/Makefile b/lib/efi_loader/Makefile
+index f490081f6542..d28db04b8709 100644
+--- a/lib/efi_loader/Makefile
++++ b/lib/efi_loader/Makefile
+@@ -73,8 +73,11 @@ obj-$(CONFIG_EFI_SIGNATURE_SUPPORT) +=3D efi_signatur=
e.o
+ obj-$(CONFIG_EFI_ECPT) +=3D efi_conformance.o
+ obj-$(CONFIG_EFI_DEBUG_SUPPORT) +=3D efi_debug_support.o
+=20
+-EFI_VAR_SEED_FILE :=3D $(subst $\",,$(CONFIG_EFI_VAR_SEED_FILE))
+-$(obj)/efi_var_seed.o: $(srctree)/$(EFI_VAR_SEED_FILE)
++TMP_VAR_SEED :=3D $(subst $\",,$(CONFIG_EFI_VAR_SEED_FILE))
++EFI_VAR_SEED_FILE :=3D $(if $(filter /% ,$(TMP_VAR_SEED)) \
++  ,$(TMP_VAR_SEED),$(srctree)/$(TMP_VAR_SEED))
++AFLAGS_efi_var_seed.o :=3D -DEFI_VAR_SEED_FILE=3D\"$(EFI_VAR_SEED_FILE)=
\"
++$(obj)/efi_var_seed.o: $(EFI_VAR_SEED_FILE)
+=20
+ ifeq ($(CONFIG_EFI_CAPSULE_AUTHENTICATE),y)
+ capsule_crt_path=3D($(subst $(quote),,$(CONFIG_EFI_CAPSULE_CRT_FILE)))
+diff --git a/lib/efi_loader/efi_var_seed.S b/lib/efi_loader/efi_var_seed=
.S
+index e0a40cf46c8d..008a505d19ef 100644
+--- a/lib/efi_loader/efi_var_seed.S
++++ b/lib/efi_loader/efi_var_seed.S
+@@ -5,13 +5,11 @@
+  * Copyright (c) 2020, Heinrich Schuchardt <xypron.glpk@gmx.de>
+  */
+=20
+-#include <config.h>
+-
+ .section .rodata.efi_seed.init,"a"
+ .balign 16
+ .global __efi_var_file_begin
+ __efi_var_file_begin:
+-.incbin CONFIG_EFI_VAR_SEED_FILE
++.incbin EFI_VAR_SEED_FILE
+ .global __efi_var_file_end
+ __efi_var_file_end:
+ .balign 16
--=20
2.50.1 (Apple Git-155)


