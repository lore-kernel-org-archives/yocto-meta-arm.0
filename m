Return-Path: <frazer.carsley@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B884CEB26EC
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 17:13:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24719.1770743586840095863
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Feb 2026 09:13:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: frazer.carsley@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18289339;
	Tue, 10 Feb 2026 09:13:00 -0800 (PST)
Received: from e138143.cambridge.arm.com (e138143.arm.com [10.1.30.169])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A08383F63F;
	Tue, 10 Feb 2026 09:13:05 -0800 (PST)
From: Frazer Carsley <frazer.carsley@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH 2/3] arm-bsp/u-boot:cs1k: Remove broken patch
Date: Tue, 10 Feb 2026 17:12:41 +0000
Message-ID: <20260210171242.196332-3-frazer.carsley@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210171242.196332-1-frazer.carsley@arm.com>
References: <20260210171242.196332-1-frazer.carsley@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 Feb 2026 17:13:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6898

The removed patch file breaks the U-Boot efi_selftest utility and has
been denied by upstream in any event. All subsequent patches renumbered.

Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
---
 .../u-boot/u-boot-corstone1000.inc            | 11 ++--
 ...-Call-the-EVT_FT_FIXUP-event-handler.patch | 55 -------------------
 ...1000-Purge-U-Boot-specific-DT-nodes.patch} |  0
 ...stone1000-purge-remoteproc-DTS-node.patch} |  0
 ...ble-OF_UPSTREAM-device-tree-support.patch} |  0
 ...use-32-bit-cells-for-reserved-memor.patch} |  0
 ...1000-Add-Cortex-A320-support-on-FVP.patch} |  0
 7 files changed, 5 insertions(+), 61 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
035-bootefi-Call-the-EVT_FT_FIXUP-event-handler.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0036-corston=
e1000-Purge-U-Boot-specific-DT-nodes.patch =3D> 0035-corstone1000-Purge-U=
-Boot-specific-DT-nodes.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0037-corston=
e1000-purge-remoteproc-DTS-node.patch =3D> 0036-corstone1000-purge-remote=
proc-DTS-node.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0038-corston=
e1000-enable-OF_UPSTREAM-device-tree-support.patch =3D> 0037-corstone1000=
-enable-OF_UPSTREAM-device-tree-support.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0039-corston=
e1000-dts-use-32-bit-cells-for-reserved-memor.patch =3D> 0038-corstone100=
0-dts-use-32-bit-cells-for-reserved-memor.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0040-corston=
e1000-Add-Cortex-A320-support-on-FVP.patch =3D> 0039-corstone1000-Add-Cor=
tex-A320-support-on-FVP.patch} (100%)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
index 6aadcd05..4edd8f18 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
@@ -58,25 +58,24 @@ SRC_URI:append =3D " \
 # Purging device tree nodes
 SRC_URI:append =3D " \
     file://0034-dt-Provide-a-way-to-remove-non-compliant-nodes-and-p.pat=
ch \
-    file://0035-bootefi-Call-the-EVT_FT_FIXUP-event-handler.patch       =
   \
-    file://0036-corstone1000-Purge-U-Boot-specific-DT-nodes.patch       =
   \
+    file://0035-corstone1000-Purge-U-Boot-specific-DT-nodes.patch       =
   \
     ${@bb.utils.contains('MACHINE_FEATURES', 'corstone1000-extsys', \
-                         '', 'file://0037-corstone1000-purge-remoteproc-=
DTS-node.patch' , d)} \
+                         '', 'file://0036-corstone1000-purge-remoteproc-=
DTS-node.patch' , d)} \
     "
=20
 # Add OF_UPSTREAM support
 SRC_URI:append =3D " \
-    file://0038-corstone1000-enable-OF_UPSTREAM-device-tree-support.patc=
h \
+    file://0037-corstone1000-enable-OF_UPSTREAM-device-tree-support.patc=
h \
 "
=20
 # Use 32 bit cells for reserved-memory node in dts
 SRC_URI:append =3D " \
-    file://0039-corstone1000-dts-use-32-bit-cells-for-reserved-memor.pat=
ch \
+    file://0038-corstone1000-dts-use-32-bit-cells-for-reserved-memor.pat=
ch \
 "
=20
 # Add Cortex-a320 support
 SRC_URI:append =3D " \
-    file://0040-corstone1000-Add-Cortex-A320-support-on-FVP.patch \
+    file://0039-corstone1000-Add-Cortex-A320-support-on-FVP.patch \
 "
=20
 # Add Cortex-a320 specific configurations
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-boo=
tefi-Call-the-EVT_FT_FIXUP-event-handler.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0035-bootefi-Call-the-EVT_FT_FIXUP-event-hand=
ler.patch
deleted file mode 100644
index 57a1c3fe..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-bootefi-Ca=
ll-the-EVT_FT_FIXUP-event-handler.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From c8d3f4c9ad0cc67d708a2ecbe5f0d8caa3b0dae0 Mon Sep 17 00:00:00 2001
-From: Sughosh Ganu <sughosh.ganu@linaro.org>
-Date: Thu, 22 May 2025 18:08:38 +0100
-Subject: [PATCH] bootefi: Call the EVT_FT_FIXUP event handler
-
-The bootefi command passes the devicetree to the kernel through the
-EFI config table. Call the event handlers for fixing the devicetree
-before jumping into the kernel. This removes any devicetree nodes
-and/or properties that are specific only to U-Boot, and are not to be
-passed to the OS.
-
-Signed-off-by: Sughosh Ganu <sughosh.ganu@linaro.org>
-Upstream-Status: Denied [RFC: https://lore.kernel.org/u-boot/aca7e6fa-2d=
ec-a7c5-e47e-84c5ffa6f9b7@gmx.de/T/#m16d14ee960427cc88066bdcdd76f0a26738b=
b66d]
----
- cmd/bootefi.c | 20 ++++++++++++++++++++
- 1 file changed, 20 insertions(+)
-
-diff --git a/cmd/bootefi.c b/cmd/bootefi.c
-index b8f5bb35950..d03e71d1a46 100644
---- a/cmd/bootefi.c
-+++ b/cmd/bootefi.c
-@@ -122,6 +122,24 @@ static int do_efi_selftest(void)
- 	return ret !=3D EFI_SUCCESS;
- }
-=20
-+/**
-+ * event_notify_dt_fixup() - call ft_fixup event
-+ *
-+ * @fdt:	address of the device tree to be passed to the kernel
-+ *		through the configuration table
-+ * Return:	None
-+ */
-+static void event_notify_dt_fixup(void *fdt)
-+{
-+	int ret;
-+	struct event_ft_fixup fixup =3D {0};
-+
-+	fixup.tree.fdt =3D fdt;
-+	ret =3D event_notify(EVT_FT_FIXUP, &fixup, sizeof(fixup));
-+	if (ret)
-+		printf("Error: %d: FDT Fixup event failed\n", ret);
-+}
-+
- /**
-  * do_bootefi() - execute `bootefi` command
-  *
-@@ -194,6 +212,8 @@ static int do_bootefi(struct cmd_tbl *cmdtp, int fla=
g, int argc,
- 		if (ret !=3D EFI_SUCCESS)
- 			return CMD_RET_FAILURE;
-=20
-+		event_notify_dt_fixup(fdt);
-+
- 		return do_efi_selftest();
- 	}
-=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-cor=
stone1000-Purge-U-Boot-specific-DT-nodes.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0035-corstone1000-Purge-U-Boot-specific-DT-no=
des.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-cors=
tone1000-Purge-U-Boot-specific-DT-nodes.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-corsto=
ne1000-Purge-U-Boot-specific-DT-nodes.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-cor=
stone1000-purge-remoteproc-DTS-node.patch b/meta-arm-bsp/recipes-bsp/u-bo=
ot/u-boot/corstone1000/0036-corstone1000-purge-remoteproc-DTS-node.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-cors=
tone1000-purge-remoteproc-DTS-node.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-corsto=
ne1000-purge-remoteproc-DTS-node.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-cor=
stone1000-enable-OF_UPSTREAM-device-tree-support.patch b/meta-arm-bsp/rec=
ipes-bsp/u-boot/u-boot/corstone1000/0037-corstone1000-enable-OF_UPSTREAM-=
device-tree-support.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-cors=
tone1000-enable-OF_UPSTREAM-device-tree-support.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-corsto=
ne1000-enable-OF_UPSTREAM-device-tree-support.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-cor=
stone1000-dts-use-32-bit-cells-for-reserved-memor.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0038-corstone1000-dts-use-32-bit-cel=
ls-for-reserved-memor.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-cors=
tone1000-dts-use-32-bit-cells-for-reserved-memor.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-corsto=
ne1000-dts-use-32-bit-cells-for-reserved-memor.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-cor=
stone1000-Add-Cortex-A320-support-on-FVP.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0039-corstone1000-Add-Cortex-A320-support-on-=
FVP.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-cors=
tone1000-Add-Cortex-A320-support-on-FVP.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corsto=
ne1000-Add-Cortex-A320-support-on-FVP.patch

