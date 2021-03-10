Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.609.1615397614473125248
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Mar 2021 09:33:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: nathan.dunne@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CC411FB;
	Wed, 10 Mar 2021 09:33:34 -0800 (PST)
Received: from e120809.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6779A3F800;
	Wed, 10 Mar 2021 09:33:33 -0800 (PST)
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH 4/4] arm-autonomy: replace xen distro feature dependencies with arm-autonomy-host
Date: Wed, 10 Mar 2021 17:32:55 +0000
Message-Id: <20210310173255.15222-4-nathan.dunne@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210310173255.15222-1-nathan.dunne@arm.com>
References: <20210310173255.15222-1-nathan.dunne@arm.com>

From: Nathan Dunne <Nathan.Dunne@arm.com>

Features in meta-arm-autonomy should depend on the 'arm-autonomy-host'
DISTRO_FEATURES entry rather than 'xen'

Issue-Id: SCM-2040
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Change-Id: Ib39b761827dbeaf80635c748e6fc3a6d6109a1a1
---
 .../images/firmware-image-juno.bbappend          | 16 ++++++++--------
 .../recipes-bsp/grub/grub-efi_%.bbappend         |  2 +-
 .../recipes-devtools/qemu/qemu_%.bbappend        | 12 ++++++------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
index 6b94dc9..d855136 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
@@ -1,14 +1,14 @@
 # Use OVERRIDES to minimize the usage of
-# ${@bb.utils.contains('DISTRO_FEATURES', 'xen', ...
-OVERRIDES_append = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ':xen', '', d)}"
+# ${@bb.utils.contains('DISTRO_FEATURES', 'autonomy-host', ...
+OVERRIDES_append = "${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', ':autonomy-host', '', d)}"
 
-FILESEXTRAPATHS_prepend_xen := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS_prepend_autonomy-host := "${THISDIR}/${PN}:"
 
-DEPENDS_append_xen = " dos2unix-native"
+DEPENDS_append_autonomy-host = " dos2unix-native"
 
-SRC_URI_append_xen = " file://add-xen-support.patch;patchdir=../"
+SRC_URI_append_autonomy-host = " file://add-xen-support.patch;patchdir=../"
 
-do_install_append_xen() {
+do_install_append_autonomy-host() {
     mv -v ${D}/${UNPACK_DIR}/SOFTWARE/uEnv.txt \
           ${D}/${UNPACK_DIR}/SOFTWARE/uenvfile
     for dir in $(ls ${D}/${UNPACK_DIR}/SITE1/)
@@ -18,11 +18,11 @@ do_install_append_xen() {
 }
 
 DEPLOY_EXTRA_DEPS ??= ""
-DEPLOY_EXTRA_DEPS_xen = "xen:do_deploy xen-devicetree:do_deploy"
+DEPLOY_EXTRA_DEPS_autonomy-host = "xen:do_deploy xen-devicetree:do_deploy"
 
 do_deploy[depends] += "${DEPLOY_EXTRA_DEPS}"
 
-do_deploy_prepend_xen() {
+do_deploy_prepend_autonomy-host() {
     # To avoid dependency loop between firmware-image-juno:do_install,
     # xen:do_deploy and xen-devicetree:do_deploy when
     # INITRAMFS_IMAGE_BUNDLE = "1", we need to handle the xen and
diff --git a/meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend b/meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend
index 6d60011..c59fd09 100644
--- a/meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend
+++ b/meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend
@@ -1 +1 @@
-GRUB_BUILDIN += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'xen_boot', '', d)}"
+GRUB_BUILDIN += "${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', 'xen_boot', '', d)}"
diff --git a/meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend b/meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend
index dbd89aa..e2e1fe5 100644
--- a/meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend
+++ b/meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend
@@ -1,12 +1,12 @@
 # Use OVERRIDES to minimize the usage of
-# ${@bb.utils.contains('DISTRO_FEATURES', 'xen', ...
-OVERRIDES_append = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ':xen', '', d)}"
+# ${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', ...
+OVERRIDES_append = "${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', ':autonomy-host', '', d)}"
 
 # For Xen we only need the i386 binaries
-QEMU_TARGETS_xen = "i386"
+QEMU_TARGETS_autonomy-host = "i386"
 
 PACKAGECONFIG[noaudio] = "--audio-drv-list='',,"
-PACKAGECONFIG_append_xen = " noaudio"
-PACKAGECONFIG_remove_xen = "fdt sdl kvm"
+PACKAGECONFIG_append_autonomy-host = " noaudio"
+PACKAGECONFIG_remove_autonomy-host = "fdt sdl kvm"
 
-require ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'recipes-devtools/qemu/${BPN}-package-split.inc', '', d)}
+require ${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', 'recipes-devtools/qemu/${BPN}-package-split.inc', '', d)}
-- 
2.17.1

