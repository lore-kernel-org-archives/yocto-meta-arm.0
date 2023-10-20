Return-Path: <debbie.martin@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E83C001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 12:32:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.53197.1697805130804761947
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 05:32:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: debbie.martin@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FF692F4
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Oct 2023 05:32:50 -0700 (PDT)
Received: from e127725.arm.com (unknown [10.57.36.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE3EB3F5A1
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Oct 2023 05:32:08 -0700 (PDT)
From: Debbie Martin <Debbie.Martin@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/5] arm-bsp/u-boot: Divide the U-boot configuration by machine
Date: Fri, 20 Oct 2023 13:31:35 +0100
Message-Id: <20231020123139.339204-1-Debbie.Martin@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 20 Oct 2023 12:32:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5153

Have separate machine include files rather than multiple
machine-specific settings in the same file.

Signed-off-by: Debbie Martin <Debbie.Martin@arm.com>
---
 .../u-boot/u-boot-corstone1000.inc            | 59 +++++++++++++
 .../recipes-bsp/u-boot/u-boot-fvp-base.inc    |  5 ++
 .../recipes-bsp/u-boot/u-boot-juno.inc        |  3 +
 meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc.inc |  5 ++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      | 83 ++-----------------
 5 files changed, 78 insertions(+), 77 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.i=
nc
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-juno.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc.inc

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
new file mode 100644
index 00000000..e978e06a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
@@ -0,0 +1,59 @@
+# Corstone1000 specific U-boot support
+
+DEPENDS:append =3D " gnutls-native openssl-native efitools-native"
+CORSTONE1000_DEVICE_TREE:corstone1000-mps3 =3D "corstone1000-mps3"
+CORSTONE1000_DEVICE_TREE:corstone1000-fvp =3D "corstone1000-fvp"
+EXTRA_OEMAKE:append =3D ' DEVICE_TREE=3D${CORSTONE1000_DEVICE_TREE}'
+
+SYSROOT_DIRS:append =3D " /boot"
+
+SRC_URI:append =3D " \
+    file://0001-FF-A-v15-arm64-smccc-add-support-for-SMCCCv1.2-x0-x1.pat=
ch \
+    file://0002-FF-A-v15-lib-uuid-introduce-uuid_str_to_le_bin-funct.pat=
ch \
+    file://0003-FF-A-v15-lib-uuid-introduce-testcase-for-uuid_str_to.pat=
ch \
+    file://0004-FF-A-v15-arm_ffa-introduce-Arm-FF-A-support.patch \
+    file://0005-FF-A-v15-arm_ffa-introduce-armffa-command.patch \
+    file://0006-FF-A-v15-arm_ffa-introduce-sandbox-FF-A-support.patch \
+    file://0007-FF-A-v15-arm_ffa-introduce-sandbox-test-cases-for-UC.pat=
ch \
+    file://0008-FF-A-v15-arm_ffa-introduce-armffa-command-Sandbox-te.pat=
ch \
+    file://0009-FF-A-v15-arm_ffa-efi-introduce-FF-A-MM-communication.pat=
ch \
+    file://0010-FF-A-v15-arm_ffa-efi-corstone1000-enable-MM-communic.pat=
ch \
+    file://0011-efi-corstone1000-fwu-introduce-EFI-capsule-update.patch =
\
+    file://0012-arm-corstone1000-fix-unrecognized-filesystem-type.patch =
\
+    file://0013-efi_loader-corstone1000-remove-guid-check-from-corst.pat=
ch \
+    file://0014-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.pat=
ch \
+    file://0015-efi_firmware-add-get_image_info-for-corstone1000.patch \
+    file://0016-efi_loader-fix-null-pointer-exception-with-get_image.pat=
ch \
+    file://0017-arm-corstone1000-add-mmc-for-fvp.patch \
+    file://0018-corstone1000-add-compressed-kernel-support.patch \
+    file://0019-arm-corstone1000-esrt-support.patch \
+    file://0020-corstone1000-enable-distro-booting-command.patch \
+    file://0021-corstone1000-add-fwu-metadata-store-info.patch \
+    file://0022-fwu_metadata-make-sure-structures-are-packed.patch \
+    file://0023-corstone1000-add-boot-index.patch \
+    file://0024-corstone1000-adjust-boot-bank-and-kernel-location.patch =
\
+    file://0025-corstone1000-add-nvmxip-fwu-mdata-and-gpt-options.patch =
\
+    file://0026-nvmxip-move-header-to-include.patch \
+    file://0027-corstone1000-set-kernel_addr-based-on-boot_idx.patch \
+    file://0028-corstone1000-boot-index-from-active.patch \
+    file://0029-corstone1000-enable-PSCI-reset.patch \
+    file://0030-Enable-EFI-set-get-time-services.patch \
+    file://0031-corstone1000-detect-inflated-kernel-size.patch \
+    file://0032-corstone1000-ESRT-add-unique-firmware-GUID.patch \
+    file://0033-dt-Provide-a-way-to-remove-non-compliant-nodes-and-p.pat=
ch \
+    file://0034-bootefi-Call-the-EVT_FT_FIXUP-event-handler.patch \
+    file://0035-corstone1000-purge-U-Boot-specific-DT-nodes.patch \
+    file://0036-corstone1000-add-signature-device-tree-overlay.patch \
+    file://0037-corstone1000-enable-authenticated-capsule-config.patch \
+    file://0038-corstone1000-introduce-EFI-authenticated-capsule-upd.pat=
ch \
+    "
+
+do_configure:append(){
+    openssl req -x509 -sha256 -newkey rsa:2048 -subj /CN=3DCRT/ -keyout =
${B}/CRT.key -out ${B}/CRT.crt -nodes -days 365
+    cert-to-efi-sig-list ${B}/CRT.crt ${B}/corstone1000_defconfig/CRT.es=
l
+}
+
+do_install:append() {
+   install -D -p -m 0644 ${B}/CRT.crt ${DEPLOY_DIR_IMAGE}/corstone1000_c=
apsule_cert.crt
+   install -D -p -m 0644 ${B}/CRT.key ${DEPLOY_DIR_IMAGE}/corstone1000_c=
apsule_key.key
+}
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc b/meta-a=
rm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
new file mode 100644
index 00000000..21046724
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
@@ -0,0 +1,5 @@
+# FVP base specific U-boot support
+
+SRC_URI:append =3D " file://bootargs.cfg \
+    file://0001-Revert-vexpress64-pick-DRAM-size-from-DT.patch \
+    "
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-juno.inc b/meta-arm-b=
sp/recipes-bsp/u-boot/u-boot-juno.inc
new file mode 100644
index 00000000..e49d87c2
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-juno.inc
@@ -0,0 +1,3 @@
+# Juno specific U-boot support
+
+SRC_URI:append =3D " file://0001-configs-vexpress-modify-to-boot-compres=
sed-initramfs.patch"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc.inc b/meta-arm-bsp=
/recipes-bsp/u-boot/u-boot-tc.inc
new file mode 100644
index 00000000..ca182c55
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc.inc
@@ -0,0 +1,5 @@
+# TC0 and TC1 specific U-boot support=20
+
+SRC_URI:append =3D " \
+    file://bootargs.cfg \
+    "
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 4989ff61..11f332ad 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -1,81 +1,10 @@
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
-#
-# Corstone1000 64-bit machines
-#
-DEPENDS:append:corstone1000 =3D " gnutls-native openssl-native efitools-=
native"
-CORSTONE1000_DEVICE_TREE:corstone1000-mps3 =3D "corstone1000-mps3"
-CORSTONE1000_DEVICE_TREE:corstone1000-fvp =3D "corstone1000-fvp"
-EXTRA_OEMAKE:append:corstone1000 =3D ' DEVICE_TREE=3D${CORSTONE1000_DEVI=
CE_TREE}'
+MACHINE_U-BOOT_REQUIRE ?=3D ""
+MACHINE_U-BOOT_REQUIRE:corstone1000 =3D "u-boot-corstone1000.inc"
+MACHINE_U-BOOT_REQUIRE:fvp-base =3D "u-boot-fvp-base.inc"
+MACHINE_U-BOOT_REQUIRE:juno =3D "u-boot-juno.inc"
+MACHINE_U-BOOT_REQUIRE:tc =3D "u-boot-tc.inc"
=20
-SYSROOT_DIRS:append:corstone1000 =3D " /boot"
+require ${MACHINE_U-BOOT_REQUIRE}
=20
-SRC_URI:append:corstone1000 =3D " \
-        file://0001-FF-A-v15-arm64-smccc-add-support-for-SMCCCv1.2-x0-x1=
.patch    \
-        file://0002-FF-A-v15-lib-uuid-introduce-uuid_str_to_le_bin-funct=
.patch	  \
-        file://0003-FF-A-v15-lib-uuid-introduce-testcase-for-uuid_str_to=
.patch	  \
-	file://0004-FF-A-v15-arm_ffa-introduce-Arm-FF-A-support.patch		  \
-	file://0005-FF-A-v15-arm_ffa-introduce-armffa-command.patch		  \
-	file://0006-FF-A-v15-arm_ffa-introduce-sandbox-FF-A-support.patch	  \
-        file://0007-FF-A-v15-arm_ffa-introduce-sandbox-test-cases-for-UC=
.patch	  \
-        file://0008-FF-A-v15-arm_ffa-introduce-armffa-command-Sandbox-te=
.patch	  \
-	file://0009-FF-A-v15-arm_ffa-efi-introduce-FF-A-MM-communication.patch	=
  \
-	file://0010-FF-A-v15-arm_ffa-efi-corstone1000-enable-MM-communic.patch	=
  \
-	file://0011-efi-corstone1000-fwu-introduce-EFI-capsule-update.patch	  \
-	file://0012-arm-corstone1000-fix-unrecognized-filesystem-type.patch	  \
-	file://0013-efi_loader-corstone1000-remove-guid-check-from-corst.patch	=
  \
-	file://0014-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch	=
  \
-	file://0015-efi_firmware-add-get_image_info-for-corstone1000.patch	  \
-	file://0016-efi_loader-fix-null-pointer-exception-with-get_image.patch	=
  \
-	file://0017-arm-corstone1000-add-mmc-for-fvp.patch			  \
-	file://0018-corstone1000-add-compressed-kernel-support.patch		  \
-	file://0019-arm-corstone1000-esrt-support.patch			  \
-	file://0020-corstone1000-enable-distro-booting-command.patch		  \
-	file://0021-corstone1000-add-fwu-metadata-store-info.patch		  \
-	file://0022-fwu_metadata-make-sure-structures-are-packed.patch		  \
-	file://0023-corstone1000-add-boot-index.patch				  \
-	file://0024-corstone1000-adjust-boot-bank-and-kernel-location.patch	  \
-	file://0025-corstone1000-add-nvmxip-fwu-mdata-and-gpt-options.patch	  \
-	file://0026-nvmxip-move-header-to-include.patch			  \
-	file://0027-corstone1000-set-kernel_addr-based-on-boot_idx.patch	  \
-	file://0028-corstone1000-boot-index-from-active.patch			  \
-	file://0029-corstone1000-enable-PSCI-reset.patch			  \
-	file://0030-Enable-EFI-set-get-time-services.patch			  \
-	file://0031-corstone1000-detect-inflated-kernel-size.patch			  \
-	file://0032-corstone1000-ESRT-add-unique-firmware-GUID.patch		\
-	file://0033-dt-Provide-a-way-to-remove-non-compliant-nodes-and-p.patch =
\
-	file://0034-bootefi-Call-the-EVT_FT_FIXUP-event-handler.patch \
-	file://0035-corstone1000-purge-U-Boot-specific-DT-nodes.patch \
-	file://0036-corstone1000-add-signature-device-tree-overlay.patch	  \
-	file://0037-corstone1000-enable-authenticated-capsule-config.patch	  \
-	file://0038-corstone1000-introduce-EFI-authenticated-capsule-upd.patch	=
  \
-        "
-
-do_configure:append:corstone1000(){
-    openssl req -x509 -sha256 -newkey rsa:2048 -subj /CN=3DCRT/ -keyout =
${B}/CRT.key -out ${B}/CRT.crt -nodes -days 365
-    cert-to-efi-sig-list ${B}/CRT.crt ${B}/corstone1000_defconfig/CRT.es=
l
-}
-
-do_install:append:corstone1000() {
-   install -D -p -m 0644 ${B}/CRT.crt ${DEPLOY_DIR_IMAGE}/corstone1000_c=
apsule_cert.crt
-   install -D -p -m 0644 ${B}/CRT.key ${DEPLOY_DIR_IMAGE}/corstone1000_c=
apsule_key.key
-}
-
-#
-# FVP BASE
-#
-SRC_URI:append:fvp-base =3D " file://bootargs.cfg \
-	file://0001-Revert-vexpress64-pick-DRAM-size-from-DT.patch \
-	"
-#
-# Juno Machines
-#
-SRC_URI:append:juno =3D " file://0001-configs-vexpress-modify-to-boot-co=
mpressed-initramfs.patch"
-
-
-#
-# TC0 and TC1 MACHINES
-#
-SRC_URI:append:tc =3D " \
-        file://bootargs.cfg \
-        "
--=20
2.25.1


