Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 895C4CDD570
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 02:54:18 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
 by mx.groups.io with SMTP id smtpd.web11.10885.1726714456334299598
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Sep 2024 19:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=lSWSzH8e;
 spf=pass (domain: linaro.org, ip: 209.85.221.180, mailfrom: javier.tia@linaro.org)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-502b8d7033cso112648e0c.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 18 Sep 2024 19:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726714455; x=1727319255; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVB7iOg8qLW6mkfXz8CH37NQ7FeM0Z5URR/ncDVgCfI=;
        b=lSWSzH8es5LeCL1BOxBUna0nr3XO2oWVuMLqeRz3/ConubghHRJ1DTls/RwTVK5/fI
         dWsOl7tH4je2ry8LqpVBg1lTE2NMiF3JbBoCzpDQMRkgCArfPBloEXhCAOeqf9IMa3uX
         mhZEVYbmW08uSSrj9sn8eR+5ZYdrCpkzYwJ5mCcYrPCfCr7SV5DhZ+8SPE+8X4EECbdy
         OgM/RsFmbNINJoQRH9Uy63HF9H8S9x11qIG7aB0O/+nVGPIM7b3YsO/lhSGe+ekBh3/A
         2hQVAHKoegHL030utyOQ6oiizTsdaw+RyCP11WnFTG2vlhK2oIESZ5D0ueelUcvGqfeU
         7vQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726714455; x=1727319255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KVB7iOg8qLW6mkfXz8CH37NQ7FeM0Z5URR/ncDVgCfI=;
        b=jViV7tPjHsuS+Pav3N3DpO7IHFIg71NAviVc7sa0GJ4Ov0rlCFtU/QJJhU0iDGHNNy
         RBGC4e/Kl9se26vjJMYwff0mRdhAhCpb6Xh2JMaxJuEUjhsZ2yZsetRqBMfmJJUFo5p8
         WScY0LaWVFPrkaXO4f+oVROLjFjA0KwHOCvju6xSV+LRsinKFpts7C/9KSMWS5FLtH5B
         wKOnHY3ZwmhAt2dbWGGU0ZnApm3jJpk1IKNVtz4PP75YUaUOb1XSpRNUjAvjpzgJWVAN
         Bc+FX3XY4Y0F97dS2U3cNhJtBmyAXusq8sWChiIUVzyhSsaUOLTGuWJ0xrdHBoeG/Rvh
         pgpA==
X-Gm-Message-State: AOJu0YzqHKp+OXvrsCuNjLyYZcTx4q/UqZ1soxUoaeGYp3bWD4Fe8Dt7
	ZmX1DjiyauWQHoxiFd59auAJDIT3vtlL+TXDqjoD7e678DsVKfGaap10G4qwpTQd0C2Eo96nb1h
	r
X-Google-Smtp-Source: AGHT+IHXDrdP5DwryVjRhu4w+oW2JUokToDOUcD2TfH4pDW9Sw19fKkzPfrQB3T8I4X35nhDaxcLVg==
X-Received: by 2002:a05:6122:8d2:b0:4eb:499a:2453 with SMTP id 71dfb90a1353d-5032d4de083mr18150892e0c.8.1726714454525;
        Wed, 18 Sep 2024 19:54:14 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5035ba92e49sm1238181e0c.31.2024.09.18.19.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 19:54:13 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v6 1/2] Enable Secure Boot in all required recipes
Date: Wed, 18 Sep 2024 20:54:06 -0600
Message-ID: <20240919025407.64543-2-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240919025407.64543-1-javier.tia@linaro.org>
References: <20240919025407.64543-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 19 Sep 2024 02:54:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6084

In the target, Secure Boot starts from the firmware (u-boot), adds the
signing keys, and verifies the bootloader (systemd-boot) and kernel
(Linux).

The gen-sbkeys recipe generates keys in the host during build time. If
keys are found, it will skip the keys generation. As long as the keys
are the same, it will guarantee build reproducibility. 

sbsign bbclass is used to sign the binaries. sbsign is the name of the
tool used to sign these binaries. Hence the name of this class to sbsign
and variables with SBSIGN prefix.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 .../u-boot/u-boot-uefi-secureboot.inc         | 17 ++++++
 .../u-boot/u-boot/uefi-secureboot.cfg         | 10 ++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 meta-arm-bsp/wic/efi-disk-no-swap.wks.in      |  2 +-
 meta-arm/classes/sbsign.bbclass               | 31 +++++++++++
 meta-arm/recipes-bsp/uefi/gen-sbkeys.bb       | 48 +++++++++++++++++
 .../recipes-bsp/uefi/gen-sbkeys/gen_sbkeys.sh | 52 +++++++++++++++++++
 .../systemd/systemd-boot-uefi-secureboot.inc  |  7 +++
 .../systemd/systemd-boot_%.bbappend           |  1 +
 meta-arm/recipes-core/systemd/systemd-efi.inc |  1 +
 .../recipes-core/systemd/systemd_%.bbappend   |  1 +
 .../linux/linux-yocto%.bbappend               |  2 +
 .../linux/linux-yocto-uefi-secureboot.inc     | 14 +++++
 13 files changed, 186 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/uefi-secureboot.cfg
 create mode 100644 meta-arm/classes/sbsign.bbclass
 create mode 100644 meta-arm/recipes-bsp/uefi/gen-sbkeys.bb
 create mode 100755 meta-arm/recipes-bsp/uefi/gen-sbkeys/gen_sbkeys.sh
 create mode 100644 meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
 create mode 100644 meta-arm/recipes-core/systemd/systemd-boot_%.bbappend
 create mode 100644 meta-arm/recipes-core/systemd/systemd-efi.inc
 create mode 100644 meta-arm/recipes-core/systemd/systemd_%.bbappend
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc
new file mode 100644
index 00000000..e58035a9
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc
@@ -0,0 +1,17 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://uefi-secureboot.cfg"
+
+inherit sbsign
+
+DEPENDS += 'python3-pyopenssl-native'
+
+do_compile:prepend() {
+    export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1
+
+    "${S}"/tools/efivar.py set -i "${S}"/ubootefi.var -n pk  -d "${SBSIGN_KEYS_DIR}"/PK.esl  -t file
+    "${S}"/tools/efivar.py set -i "${S}"/ubootefi.var -n kek -d "${SBSIGN_KEYS_DIR}"/KEK.esl -t file
+    "${S}"/tools/efivar.py set -i "${S}"/ubootefi.var -n db  -d "${SBSIGN_KEYS_DIR}"/db.esl  -t file
+    "${S}"/tools/efivar.py set -i "${S}"/ubootefi.var -n dbx -d "${SBSIGN_KEYS_DIR}"/dbx.esl -t file
+    "${S}"/tools/efivar.py print -i "${S}"/ubootefi.var
+}
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/uefi-secureboot.cfg b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/uefi-secureboot.cfg
new file mode 100644
index 00000000..d2edb5fb
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/uefi-secureboot.cfg
@@ -0,0 +1,10 @@
+CONFIG_CMD_BOOTMENU=y
+CONFIG_USE_BOOTCOMMAND=y
+CONFIG_BOOTCOMMAND="bootmenu"
+CONFIG_USE_PREBOOT=y
+CONFIG_EFI_VAR_BUF_SIZE=65536
+CONFIG_FIT_SIGNATURE=y
+CONFIG_EFI_SECURE_BOOT=y
+CONFIG_EFI_VARIABLES_PRESEED=y
+CONFIG_PREBOOT="setenv bootmenu_0 UEFI Boot Manager=bootefi bootmgr; setenv bootmenu_1 UEFI Maintenance Menu=eficonfig"
+CONFIG_PREBOOT_DEFINED=y
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 11f332ad..c761eb7d 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -5,6 +5,7 @@ MACHINE_U-BOOT_REQUIRE:corstone1000 = "u-boot-corstone1000.inc"
 MACHINE_U-BOOT_REQUIRE:fvp-base = "u-boot-fvp-base.inc"
 MACHINE_U-BOOT_REQUIRE:juno = "u-boot-juno.inc"
 MACHINE_U-BOOT_REQUIRE:tc = "u-boot-tc.inc"
+MACHINE_U-BOOT_REQUIRE += "${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'u-boot-uefi-secureboot.inc', '', d)}"
 
 require ${MACHINE_U-BOOT_REQUIRE}
 
diff --git a/meta-arm-bsp/wic/efi-disk-no-swap.wks.in b/meta-arm-bsp/wic/efi-disk-no-swap.wks.in
index 6ae7ad9d..8a9fb18e 100644
--- a/meta-arm-bsp/wic/efi-disk-no-swap.wks.in
+++ b/meta-arm-bsp/wic/efi-disk-no-swap.wks.in
@@ -7,4 +7,4 @@ part /boot --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}" --label
 
 part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid --exclude-path boot/
 
-bootloader --ptable gpt --timeout=1 --append="${GRUB_LINUX_APPEND}"
+bootloader --ptable gpt --timeout=5
diff --git a/meta-arm/classes/sbsign.bbclass b/meta-arm/classes/sbsign.bbclass
new file mode 100644
index 00000000..7303c72f
--- /dev/null
+++ b/meta-arm/classes/sbsign.bbclass
@@ -0,0 +1,31 @@
+# Sign binaries for UEFI Secure Boot
+#
+# Usage in recipes:
+#
+# Set binary to sign per recipe:
+# SBSIGN_TARGET_BINARY = "${B}/binary_to_sign"
+#
+# Then call do_sbsign() in correct stage of the build
+# do_compile:append() {
+#     do_sbsign
+# }
+
+DEPENDS += 'gen-sbkeys'
+DEPENDS += "sbsigntool-native"
+
+SBSIGN_KEY = "${SBSIGN_KEYS_DIR}/db.key"
+SBSIGN_CERT = "${SBSIGN_KEYS_DIR}/db.crt"
+SBSIGN_TARGET_BINARY ?= "binary_to_sign"
+
+# Not adding as task since recipes may need to sign binaries at different
+# stages. Instead they can call this function when needed by calling this function
+do_sbsign() {
+    bbnote "Signing ${PN} binary ${SBSIGN_TARGET_BINARY} with ${SBSIGN_KEY} and ${SBSIGN_CERT}"
+    ${STAGING_BINDIR_NATIVE}/sbsign \
+        --key "${SBSIGN_KEY}" \
+        --cert "${SBSIGN_CERT}" \
+        --output  "${SBSIGN_TARGET_BINARY}.signed" \
+        "${SBSIGN_TARGET_BINARY}"
+    cp "${SBSIGN_TARGET_BINARY}" "${SBSIGN_TARGET_BINARY}.unsigned"
+    cp "${SBSIGN_TARGET_BINARY}.signed" "${SBSIGN_TARGET_BINARY}"
+}
\ No newline at end of file
diff --git a/meta-arm/recipes-bsp/uefi/gen-sbkeys.bb b/meta-arm/recipes-bsp/uefi/gen-sbkeys.bb
new file mode 100644
index 00000000..30c3aced
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/gen-sbkeys.bb
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: MIT
+
+SUMMARY = "Generate Signing UEFI keys for Secure Boot"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+DEPENDS += "bash-native"
+DEPENDS += "coreutils-native"
+DEPENDS += "efitools-native"
+DEPENDS += "openssl-native"
+
+SRC_URI = "file://gen_sbkeys.sh"
+
+UNPACKDIR = "${S}"
+
+do_patch[noexec] = "1"
+do_compile[noexec] = "1"
+do_configure[noexec] = "1"
+do_install[nostamp] = "1"
+
+python do_install() {
+    keys_dir = d.getVar('SBSIGN_KEYS_DIR', True)
+
+    keys_to_check = [
+        keys_dir + "/PK.esl",
+        keys_dir + "/KEK.esl",
+        keys_dir + "/db.esl",
+        keys_dir + "/dbx.esl",
+        keys_dir + "/db.key",
+        keys_dir + "/db.crt",
+    ]
+
+    missing_keys = [f for f in keys_to_check if not os.path.exists(f)]
+
+    if not missing_keys:
+        bb.debug(2, "All UEFI keys found in '%s' to sign binaries'" % keys_dir)
+        return
+
+    gen_sbkeys = d.getVar('UNPACKDIR', True) + "/gen_sbkeys.sh"
+
+    import subprocess
+    bb.debug(2, "Calling '%s' to generate UEFI keys in path: '%s'" % (gen_sbkeys, keys_dir))
+    cmd = "%s %s" % (gen_sbkeys, keys_dir)
+    subprocess.Popen(cmd, shell=True)
+}
+
+FILES:${PN} += "${SBSIGN_KEYS_DIR}/db.key"
+FILES:${PN} += "${SBSIGN_KEYS_DIR}/db.crt"
diff --git a/meta-arm/recipes-bsp/uefi/gen-sbkeys/gen_sbkeys.sh b/meta-arm/recipes-bsp/uefi/gen-sbkeys/gen_sbkeys.sh
new file mode 100755
index 00000000..6ad74a31
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/gen-sbkeys/gen_sbkeys.sh
@@ -0,0 +1,52 @@
+#!/bin/bash
+#
+# SPDX-License-Identifier: MIT
+#
+#
+# Set up UEFI Secure Boot keys. Generate keys and certificates, convert them
+# into EFI Signature Lists, and sign them. By managing these keys, you can
+# control what is considered trusted on your system.
+
+set -eux
+
+KEYS_PATH=${1:-./}
+SUBJECT="/CN=OpenEmbedded/"
+
+# The number used is just a GUID random number that has not special meaning.
+# GUID (Globally Unique Identifier) is associated with the signature list. GUIDs
+# in this context are used to uniquely identify the owner or the purpose of the
+# keys within the EFI environment. This GUID can be used to distinguish
+# different lists or purposes within the UEFI firmware settings
+GUID="11111111-2222-3333-4444-123456789abc"
+
+if [ ! -d "${KEYS_PATH}" ]; then
+    mkdir -p "${KEYS_PATH}"
+fi
+
+if [ -f "${KEYS_PATH}"/PK.crt ]; then
+    exit 0
+fi
+
+# Platform Key (PK): The root key in Secure Boot, which authorizes changes to
+# the KEK
+openssl req -x509 -sha256 -newkey rsa:2048 -subj "${SUBJECT}" \
+    -keyout "${KEYS_PATH}"/PK.key -out "${KEYS_PATH}"/PK.crt \
+    -nodes -days 3650
+cert-to-efi-sig-list -g ${GUID} \
+    "${KEYS_PATH}"/PK.crt "${KEYS_PATH}"/PK.esl
+sign-efi-sig-list -c "${KEYS_PATH}"/PK.crt -k "${KEYS_PATH}"/PK.key \
+    "${KEYS_PATH}"/PK "${KEYS_PATH}"/PK.esl "${KEYS_PATH}"/PK.auth
+
+# Key Exchange Key (KEK): Allows for updates to the db and dbx lists
+#
+# db and dbx: Control lists for allowed and disallowed executable files and
+# drivers
+for key in KEK db dbx; do
+    openssl req -x509 -sha256 -newkey rsa:2048 -subj "${SUBJECT}" \
+        -keyout "${KEYS_PATH}"/${key}.key -out "${KEYS_PATH}"/${key}.crt \
+        -nodes -days 3650
+    cert-to-efi-sig-list -g ${GUID} \
+        "${KEYS_PATH}"/${key}.crt "${KEYS_PATH}"/${key}.esl
+    sign-efi-sig-list -c "${KEYS_PATH}"/PK.crt -k "${KEYS_PATH}"/PK.key \
+        "${KEYS_PATH}"/${key} "${KEYS_PATH}"/${key}.esl "${KEYS_PATH}"/${key}.auth
+done
diff --git a/meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc b/meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
new file mode 100644
index 00000000..84196a68
--- /dev/null
+++ b/meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
@@ -0,0 +1,7 @@
+inherit sbsign
+
+SBSIGN_TARGET_BINARY = "${B}/src/boot/efi/systemd-boot${EFI_ARCH}.efi"
+
+do_compile:append() {
+    do_sbsign
+}
diff --git a/meta-arm/recipes-core/systemd/systemd-boot_%.bbappend b/meta-arm/recipes-core/systemd/systemd-boot_%.bbappend
new file mode 100644
index 00000000..caba9830
--- /dev/null
+++ b/meta-arm/recipes-core/systemd/systemd-boot_%.bbappend
@@ -0,0 +1 @@
+require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'systemd-boot-uefi-secureboot.inc', '', d)}
\ No newline at end of file
diff --git a/meta-arm/recipes-core/systemd/systemd-efi.inc b/meta-arm/recipes-core/systemd/systemd-efi.inc
new file mode 100644
index 00000000..5572e51a
--- /dev/null
+++ b/meta-arm/recipes-core/systemd/systemd-efi.inc
@@ -0,0 +1 @@
+PACKAGECONFIG:append = " efi"
diff --git a/meta-arm/recipes-core/systemd/systemd_%.bbappend b/meta-arm/recipes-core/systemd/systemd_%.bbappend
new file mode 100644
index 00000000..660358c2
--- /dev/null
+++ b/meta-arm/recipes-core/systemd/systemd_%.bbappend
@@ -0,0 +1 @@
+require ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'systemd-efi.inc', '', d)}
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
index a287d0e1..29c21355 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
@@ -25,3 +25,5 @@ SRC_URI:append:qemuarm = " \
 
 FFA_TRANSPORT_INCLUDE = "${@bb.utils.contains('MACHINE_FEATURES', 'arm-ffa', 'arm-ffa-transport.inc', '' , d)}"
 require ${FFA_TRANSPORT_INCLUDE}
+
+require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'linux-yocto-uefi-secureboot.inc', '', d)}
\ No newline at end of file
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc b/meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc
new file mode 100644
index 00000000..5c1f4de7
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc
@@ -0,0 +1,14 @@
+KERNEL_FEATURES += "cfg/efi-ext.scc"
+
+inherit sbsign
+
+# shell variable set inside do_compile task
+SBSIGN_TARGET_BINARY = "$KERNEL_IMAGE"
+
+do_compile:append() {
+    KERNEL_IMAGE=$(find ${B} -name ${KERNEL_IMAGETYPE} -print -quit)
+    do_sbsign
+}
+
+RRECOMMENDS:${PN} += "kernel-module-efivarfs"
+RRECOMMENDS:${PN} += "kernel-module-efivars"
-- 
2.46.1


