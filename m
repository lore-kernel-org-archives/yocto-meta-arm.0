Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E883DCF857F
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 14:19:34 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.23092.1728051565523492187
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Oct 2024 07:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vDWK0v/G;
 spf=pass (domain: linaro.org, ip: 209.85.208.175, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fada911953so31026411fa.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 04 Oct 2024 07:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728051564; x=1728656364; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KQfQRmPwup3FwlxzKXH3HGq+exX+A2AIh/7KbH0EUcI=;
        b=vDWK0v/G4+64aFWpGREckLsXu8jUQqAVchwZgrbWq3BFGvpPucGsCXpbhpA40LiOCQ
         wWCnZkAiuiV+usCxTPD5GsEU1M7vUTWYgECMk6NSYCDuWSkn3cxq13lZ3RtbSYzX9/cz
         fbMnElZIIZDUWtlvqYVCmAl2Qw4EhMifAHbsiQZVgMcv6XsiqEb6eOZWedH6zj/Wh1AT
         gSVdye8kp5d2L6tMRvml8MrJHLAxwXczGhv9N8NLYFaKxtgwHb48XAx24Iq0hfZuJry4
         DC5qfeyYZRbOguoCrJ5vN7nxQlGdg4zQ7aMgyk15IwzObMEFAKyQpPSn5wujHlmMMJNl
         c1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728051564; x=1728656364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KQfQRmPwup3FwlxzKXH3HGq+exX+A2AIh/7KbH0EUcI=;
        b=VWfLxUpkRKh6G32z0H/RR/U5s9rRTZcNrOnfHgnegJpA4zqhwFSAQxWqh6ZY8VP2e2
         eJe9idQphXP0RtN9rAbeBrMdICLNnb6dkvVOKUgRG+spJfJscl+lZ4NdNv4HOZhFLMXg
         iS5eY7YR5MfIJ4oy6aGm3ezHeemm8g6Gj4rp//Ee88pv7wjDJsYXXUwmBnK1oJnY/kHO
         0wEp1O2PrDW+9CXc7f7cjq56N93DoujIWe8hI5JDBpZ0zGqE/REmLZKfTV22jWzaIKOh
         UaIx4adB5CkRh6BH5/4uSVpNSxY5If4IdAATdod/ijweE+RnhxrFZpswpTNqRVT3AE9h
         64PA==
X-Gm-Message-State: AOJu0Yxy9DTikcT89ap56XsYaDYfGtzI4iYQzV97Y0VoxS1bA0Xv+VCT
	AeXAKkDrxlG8Dn7cgdjAPuRCariaLjdwMhcl6wGf292tW6cVxEM7D3kK5UB23jvC4I4QTdQy/VM
	raGI=
X-Google-Smtp-Source: AGHT+IEzLWTN3vxtldmZ+6D2/7ak3kpscQY0GwWi/RM7pi+rbJUQG+RYeExXNKMPkbgPVjjvi8gwJw==
X-Received: by 2002:a05:6512:ea4:b0:536:7a79:b4df with SMTP id 2adb3069b0e04-539ac154e6dmr938529e87.14.1728051563350;
        Fri, 04 Oct 2024 07:19:23 -0700 (PDT)
Received: from localhost.localdomain (2001-14ba-7430-3d00--193.rev.dnainternet.fi. [2001:14ba:7430:3d00::193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539a82ab2e4sm441339e87.287.2024.10.04.07.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 07:19:21 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Javier Tia <javier.tia@linaro.org>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH v9 1/2] arm: Enable Secure Boot in all required recipes
Date: Fri,  4 Oct 2024 17:19:05 +0300
Message-ID: <20241004141906.226451-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Oct 2024 14:19:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6170

From: Javier Tia <javier.tia@linaro.org>

In the target, Secure Boot starts from the firmware (u-boot), adds the
signing keys, and verifies the bootloader (systemd-boot) and kernel
(Linux).

sbsign bbclass is used to sign the binaries. sbsign is the name of the
tool used to sign these binaries. Hence the name of this class to sbsign
and variables with SBSIGN prefix.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/classes/sbsign.bbclass               | 31 +++++++++++++++++++
 .../u-boot/u-boot-uefi-secureboot.inc         | 17 ++++++++++
 .../u-boot/u-boot/uefi-secureboot.cfg         | 10 ++++++
 meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend |  2 ++
 .../systemd/systemd-boot-uefi-secureboot.inc  |  7 +++++
 .../systemd/systemd-boot_%.bbappend           |  1 +
 meta-arm/recipes-core/systemd/systemd-efi.inc |  1 +
 .../recipes-core/systemd/systemd_%.bbappend   |  1 +
 .../linux/linux-yocto%.bbappend               |  2 ++
 .../linux/linux-yocto-uefi-secureboot.inc     | 14 +++++++++
 10 files changed, 86 insertions(+)
 create mode 100644 meta-arm/classes/sbsign.bbclass
 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc
 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot/uefi-secureboot.cfg
 create mode 100644 meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
 create mode 100644 meta-arm/recipes-core/systemd/systemd-boot_%.bbappend
 create mode 100644 meta-arm/recipes-core/systemd/systemd-efi.inc
 create mode 100644 meta-arm/recipes-core/systemd/systemd_%.bbappend
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc

diff --git a/meta-arm/classes/sbsign.bbclass b/meta-arm/classes/sbsign.bbclass
new file mode 100644
index 00000000..551b951d
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
index 00000000..e58035a9
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
index 00000000..acdcfddd
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
index 0683a783..8542ccfc 100644
--- a/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -2,3 +2,5 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
 SRC_URI:append:qemuarm64-secureboot = " file://qemuarm64.cfg"
 SRC_URI:append:qemuarm-secureboot = " file://qemuarm.cfg"
+
+require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'u-boot-uefi-secureboot.inc', '', d)}
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
index 00000000..9850bbf9
--- /dev/null
+++ b/meta-arm/recipes-core/systemd/systemd-boot_%.bbappend
@@ -0,0 +1 @@
+require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'systemd-boot-uefi-secureboot.inc', '', d)}
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
index a287d0e1..71e643a9 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
@@ -25,3 +25,5 @@ SRC_URI:append:qemuarm = " \
 
 FFA_TRANSPORT_INCLUDE = "${@bb.utils.contains('MACHINE_FEATURES', 'arm-ffa', 'arm-ffa-transport.inc', '' , d)}"
 require ${FFA_TRANSPORT_INCLUDE}
+
+require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'linux-yocto-uefi-secureboot.inc', '', d)}
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
2.34.1


