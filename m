Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89452CDE01B
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 15:47:47 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.47058.1727365663391038182
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Sep 2024 08:47:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=JqeomNnA;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.210.48, mailfrom: jdmason@kudzu.us)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-710d77380cdso580503a34.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 26 Sep 2024 08:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1727365662; x=1727970462; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QgW74utrjrSN/o8Su8pi246NPX8sy/fcW29ZlyHv+s=;
        b=JqeomNnAqy69P2FspfcaOTrJeIe7LanK5Pvu5/lfxNagK7OhabmJeLKhXelnx8cSNF
         I1J5XP7eLeAj0Ip+DSFTxcex9bbBzb/Foy1WkWiJHKmNnCcUd3/Y8/l8JtNqj7CXjnNE
         bUDnSq+adyadpVNxghRfnvFWnl3ZyIl5z90gd3nmTMS06nEKmaiSeJ4hpgb1QjATWeJG
         khn4z3XVC1pul/Mmj7f4D51ypjdgeG3i5Y8ro6VlJ3T2PUEuT0ZPH2y4ANUl9HTyOP/O
         qnbgJav9kWf4+mAmG7itEk0w3vEG7vcDwmdSMfwpDEhc9sLzp2YA5g92NnTp5iqX8f8R
         jytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727365662; x=1727970462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6QgW74utrjrSN/o8Su8pi246NPX8sy/fcW29ZlyHv+s=;
        b=YP4dXG+TmqwA5Z75nfZAzqInqihThYN3jGmWDPUhXw1JO1DkzyjSdrvRi1mL9iJFw5
         a+rLlT8boNdN9OkpeS+HWB+fQTVHyMbt/zcAaKIZOhFrpaazWHW19lfev5wh4FrPkcnd
         hN+bGngOJGuhmx/gbp5Kp3QONndnuSkPTZAfKCHbI/20JiWQhhCaj0vn/G25DEAdlBuY
         7+xkevCxuI56+9/fanOmxPB1Khq/osEYb3YuZvQ7r5X+sBaBwuJV2QZcQOdr1oCodE+O
         BQqxHPPfQbCZUXEuvIlehboX816dcdteVIFcHucVwI7/zzPgUccpP3gX0D6gZpGwJv2b
         YdFg==
X-Gm-Message-State: AOJu0Yxa7y49xhWgpkGMcRkGUKKstSIetz/jMEjgbVkzC55SRWml39ci
	oMsL67F+/Sjma7CdmWAxq+6dOxoi46xTc6da3zL/5rwgdBni5FlzcFm7fXh/vPLD2+nETzK8GUQ
	=
X-Google-Smtp-Source: AGHT+IGfhXNGZHTIuskINZuoHB/6EF+a5sa2rMLtZfQGJFZmX/LWZcmNZN2TZj7YR66VvckiyZ6vvA==
X-Received: by 2002:a05:6830:630d:b0:710:f382:9342 with SMTP id 46e09a7af769-713c7dab4b1mr5305159a34.11.1727365662306;
        Thu, 26 Sep 2024 08:47:42 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b5ff1a4sm448896d6.28.2024.09.26.08.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 08:47:42 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v7 3/4] arm: Enable Secure Boot in all required recipes
Date: Thu, 26 Sep 2024 11:47:38 -0400
Message-Id: <20240926154739.2379609-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240926154739.2379609-1-jon.mason@arm.com>
References: <20240926154739.2379609-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Sep 2024 15:47:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6120

From: Javier Tia <javier.tia@linaro.org>

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
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/classes/sbsign.bbclass               | 31 +++++++++++
 .../u-boot/u-boot-uefi-secureboot.inc         | 17 ++++++
 .../u-boot/u-boot/uefi-secureboot.cfg         | 10 ++++
 meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend |  2 +
 meta-arm/recipes-bsp/uefi/gen-sbkeys.bb       | 48 +++++++++++++++++
 .../recipes-bsp/uefi/gen-sbkeys/gen_sbkeys.sh | 52 +++++++++++++++++++
 .../systemd/systemd-boot-uefi-secureboot.inc  |  7 +++
 .../systemd/systemd-boot_%.bbappend           |  1 +
 meta-arm/recipes-core/systemd/systemd-efi.inc |  1 +
 .../recipes-core/systemd/systemd_%.bbappend   |  1 +
 .../linux/linux-yocto%.bbappend               |  2 +
 .../linux/linux-yocto-uefi-secureboot.inc     | 14 +++++
 12 files changed, 186 insertions(+)
 create mode 100644 meta-arm/classes/sbsign.bbclass
 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc
 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot/uefi-secureboot.cfg
 create mode 100644 meta-arm/recipes-bsp/uefi/gen-sbkeys.bb
 create mode 100755 meta-arm/recipes-bsp/uefi/gen-sbkeys/gen_sbkeys.sh
 create mode 100644 meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
 create mode 100644 meta-arm/recipes-core/systemd/systemd-boot_%.bbappend
 create mode 100644 meta-arm/recipes-core/systemd/systemd-efi.inc
 create mode 100644 meta-arm/recipes-core/systemd/systemd_%.bbappend
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc

diff --git a/meta-arm/classes/sbsign.bbclass b/meta-arm/classes/sbsign.bbclass
new file mode 100644
index 000000000000..551b951dc2b4
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
diff --git a/meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc b/meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc
new file mode 100644
index 000000000000..e58035a9c236
--- /dev/null
+++ b/meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc
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
diff --git a/meta-arm/recipes-bsp/u-boot/u-boot/uefi-secureboot.cfg b/meta-arm/recipes-bsp/u-boot/u-boot/uefi-secureboot.cfg
new file mode 100644
index 000000000000..acdcfdddf3c2
--- /dev/null
+++ b/meta-arm/recipes-bsp/u-boot/u-boot/uefi-secureboot.cfg
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
diff --git a/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
index 0683a783891f..8542ccfc9084 100644
--- a/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -2,3 +2,5 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
 SRC_URI:append:qemuarm64-secureboot = " file://qemuarm64.cfg"
 SRC_URI:append:qemuarm-secureboot = " file://qemuarm.cfg"
+
+require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'u-boot-uefi-secureboot.inc', '', d)}
diff --git a/meta-arm/recipes-bsp/uefi/gen-sbkeys.bb b/meta-arm/recipes-bsp/uefi/gen-sbkeys.bb
new file mode 100644
index 000000000000..30c3aced55ea
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
index 000000000000..6ad74a315a59
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
index 000000000000..84196a681e06
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
index 000000000000..9850bbf9a663
--- /dev/null
+++ b/meta-arm/recipes-core/systemd/systemd-boot_%.bbappend
@@ -0,0 +1 @@
+require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'systemd-boot-uefi-secureboot.inc', '', d)}
diff --git a/meta-arm/recipes-core/systemd/systemd-efi.inc b/meta-arm/recipes-core/systemd/systemd-efi.inc
new file mode 100644
index 000000000000..5572e51ae917
--- /dev/null
+++ b/meta-arm/recipes-core/systemd/systemd-efi.inc
@@ -0,0 +1 @@
+PACKAGECONFIG:append = " efi"
diff --git a/meta-arm/recipes-core/systemd/systemd_%.bbappend b/meta-arm/recipes-core/systemd/systemd_%.bbappend
new file mode 100644
index 000000000000..660358c29b9d
--- /dev/null
+++ b/meta-arm/recipes-core/systemd/systemd_%.bbappend
@@ -0,0 +1 @@
+require ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'systemd-efi.inc', '', d)}
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
index a287d0e1814a..71e643a95496 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
@@ -25,3 +25,5 @@ SRC_URI:append:qemuarm = " \
 
 FFA_TRANSPORT_INCLUDE = "${@bb.utils.contains('MACHINE_FEATURES', 'arm-ffa', 'arm-ffa-transport.inc', '' , d)}"
 require ${FFA_TRANSPORT_INCLUDE}
+
+require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'linux-yocto-uefi-secureboot.inc', '', d)}
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc b/meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc
new file mode 100644
index 000000000000..5c1f4de7a0ad
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
2.39.5


