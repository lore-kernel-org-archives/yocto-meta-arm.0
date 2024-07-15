Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D18C3DA4B
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 20:45:52 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.2519.1721076345260235671
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Jul 2024 13:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=CAd4bQDO;
 spf=pass (domain: linaro.org, ip: 209.85.128.170, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-65f8b0df1f0so23096987b3.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 15 Jul 2024 13:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721076344; x=1721681144; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ERUCvXD1lwY15FBQhikceTF24WL1knYMfjHUNGlUzGU=;
        b=CAd4bQDORZ5XeBOA8iyFNwspK4Stlzxy2rSFrZ/dDr0yI+1BY81RSsgqXUNANZT0AV
         mk3cF62TdUCskW+H283/LLzM1O88LxA9DvlD9oH+01PuEu3ODmMq082UecIg56+CBbxt
         2FCXhsa+owZuqda7HjJDBew+9wRPdqiaxMzPemiUJeJB3OW+3QP7QNg8RYQRmtmacdZI
         6ICZzL8NSaIb01nlYr/Bf+uTv5n6mYvwKnr83V8CZo7I5/fJjV57rwQ8XHJmDbr7QfX/
         hCA9favYXpPlVQBzw1i2wcAzd6Nh5tVMS0tWfLrmvfdsMnS3IdoXT9jMdx79PgpFAqKH
         BKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721076344; x=1721681144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ERUCvXD1lwY15FBQhikceTF24WL1knYMfjHUNGlUzGU=;
        b=EC5s31ICto7Gplp3Z5KTmeewTCqLkY2t8KUsLfpZ21gQ4pujzyt0cFlWfUlWSv2lWU
         4vgqdApqlit8kbQnzfSbtECSE2KOSFnTT59Zz7gN6Qgmplnk9eSe0sTOZ6pBQwgApYiz
         v5zkFkfJFvXxrp4blj0v3MBZDLa9fSTmS/8EPGqlvcLL/yEL3OWT7oxm50ejQTk0u3oC
         zxruj7PlYq1OpbZEPcE0LuqjkMYMVr3NXeVCV7chiCCILqBk0bASAOQenLsa/wj81zBR
         Eb4cPOVkoGNBAKTP/XAhzMceNbdU/vqgQ8vmrGoWQ6r74SDmYRV/huu+bTm2/XaEIueV
         sfrQ==
X-Gm-Message-State: AOJu0YzuHoywphilA8E+51uBZzFLV0WHqTMRT6KdpyKvJ8fdZDiLLBkp
	iAAFslA1R65rMVKOHuJV+Vy7Q7W6xoVDV1V7dSH26pQYcTsq+7dsksSi/aIC21sJD1OPHIECSfP
	t
X-Google-Smtp-Source: AGHT+IEDQSX8xXt3nQ/dOYc1bu5vI9SNGESuilwsYX29g/lG3mtTruI4qHWqns9YWK3fA6rD13iYOQ==
X-Received: by 2002:a0d:ed01:0:b0:65b:a403:9eba with SMTP id 00721157ae682-6637f69bf8dmr2032347b3.11.1721076343250;
        Mon, 15 Jul 2024 13:45:43 -0700 (PDT)
Received: from localhost.localdomain ([190.171.102.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-65fc44516f4sm9004607b3.104.2024.07.15.13.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 13:45:42 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Javier Tia <javier.tia@linaro.org>
Subject: [PATCH] qemuarm64-secureboot: Enable UEFI Secure Boot
Date: Mon, 15 Jul 2024 14:45:17 -0600
Message-ID: <20240715204517.781716-1-javier.tia@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Jul 2024 20:45:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5891

A backport from meta-ts with the minimal changes to add UEFI Secure Boot
into qemuarm64-secureboot machine.

Requirements:

  - Create a UEFI disk partition to copy EFI apps.

  - Add UEFI settings to U-Boot, Grub, and Linux kernel.

  - Generate keys that will be added to U-Boot and used to sign Grub and
    Linux kernel.

  - A Grub patch has been implemented to prevent an error from being
    returned for a deferred image. It is still pending acceptance
    upstream.

Optional:

  - Add systemd as Init manager to auto-mount efivarfs.

  - Upgrade u-boot to latest release. Secure Boot works in the 2023.04
    release.

Introduces uefi-secureboot machine feature.

Ideally, these changes would be submitted to meta-secure-core, but the
code currently doesn't support ARM.

Sample keys are added in order to be added in u-boot and sign grub and
Linux kernel image. A script is provided to generate new keys.

Build and verification steps:

$ kas build ci/qemuarm64-secureboot.yml

$ kas shell ci/qemuarm64-secureboot.yml -c 'runqemu nographic novga slirp'

Log in as root with no password:

$ efivar -d -n 8be4df61-93ca-11d2-aa0d-00e098032b8c-SecureBoot
1

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 ci/qemuarm64-secureboot.yml                   |  12 +++--
 .../u-boot/u-boot-qemuarm64-secureboot.inc    |  18 +++++++
 .../qemuarm64-secureboot.cfg                  |  10 ++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   1 +
 .../recipes-bsp/u-boot/u-boot_2027.04.bb      |   5 ++
 meta-arm/conf/layer.conf                      |   2 +
 .../conf/machine/qemuarm64-secureboot.conf    |  21 ++++++--
 ...on-t-return-error-for-deferred-image.patch |  48 ++++++++++++++++++
 .../recipes-bsp/grub/files/grub-initial.cfg   |   8 +++
 .../grub/grub-efi-uefi-secureboot.inc         |  40 +++++++++++++++
 meta-arm/recipes-bsp/grub/grub-efi_%.bbappend |   1 +
 .../systemd/systemd-uefi-secureboot.inc       |   1 +
 .../recipes-core/systemd/systemd_%.bbappend   |   1 +
 .../linux/linux-yocto%.bbappend               |   2 +
 .../linux/linux-yocto-uefi-secureboot.inc     |  18 +++++++
 meta-arm/uefi-sb-keys/KEK.auth                | Bin 0 -> 2049 bytes
 meta-arm/uefi-sb-keys/KEK.crt                 |  19 +++++++
 meta-arm/uefi-sb-keys/KEK.esl                 | Bin 0 -> 831 bytes
 meta-arm/uefi-sb-keys/KEK.key                 |  28 ++++++++++
 meta-arm/uefi-sb-keys/PK.auth                 | Bin 0 -> 2049 bytes
 meta-arm/uefi-sb-keys/PK.crt                  |  19 +++++++
 meta-arm/uefi-sb-keys/PK.esl                  | Bin 0 -> 831 bytes
 meta-arm/uefi-sb-keys/PK.key                  |  28 ++++++++++
 meta-arm/uefi-sb-keys/db.auth                 | Bin 0 -> 3632 bytes
 meta-arm/uefi-sb-keys/db.crt                  |  19 +++++++
 meta-arm/uefi-sb-keys/db.esl                  | Bin 0 -> 2414 bytes
 meta-arm/uefi-sb-keys/db.key                  |  28 ++++++++++
 meta-arm/uefi-sb-keys/dbx.auth                | Bin 0 -> 2049 bytes
 meta-arm/uefi-sb-keys/dbx.crt                 |  19 +++++++
 meta-arm/uefi-sb-keys/dbx.esl                 | Bin 0 -> 831 bytes
 meta-arm/uefi-sb-keys/dbx.key                 |  28 ++++++++++
 meta-arm/uefi-sb-keys/gen_uefi_certs.sh       |  35 +++++++++++++
 meta-arm/uefi-sb-keys/ms.crt                  |  35 +++++++++++++
 meta-arm/uefi-sb-keys/ms.esl                  | Bin 0 -> 1583 bytes
 meta-arm/uefi-sb-keys/noPK.auth               | Bin 0 -> 1218 bytes
 meta-arm/uefi-sb-keys/noPK.esl                |   0
 36 files changed, 437 insertions(+), 9 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-qemuarm64-secureboot.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/qemuarm64-secureboot/qemuarm64-secureboot.cfg
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2027.04.bb
 create mode 100644 meta-arm/recipes-bsp/grub/files/0001-verifiers-Don-t-return-error-for-deferred-image.patch
 create mode 100644 meta-arm/recipes-bsp/grub/files/grub-initial.cfg
 create mode 100644 meta-arm/recipes-bsp/grub/grub-efi-uefi-secureboot.inc
 create mode 100644 meta-arm/recipes-bsp/grub/grub-efi_%.bbappend
 create mode 100644 meta-arm/recipes-core/systemd/systemd-uefi-secureboot.inc
 create mode 100644 meta-arm/recipes-core/systemd/systemd_%.bbappend
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc
 create mode 100644 meta-arm/uefi-sb-keys/KEK.auth
 create mode 100644 meta-arm/uefi-sb-keys/KEK.crt
 create mode 100644 meta-arm/uefi-sb-keys/KEK.esl
 create mode 100644 meta-arm/uefi-sb-keys/KEK.key
 create mode 100644 meta-arm/uefi-sb-keys/PK.auth
 create mode 100644 meta-arm/uefi-sb-keys/PK.crt
 create mode 100644 meta-arm/uefi-sb-keys/PK.esl
 create mode 100644 meta-arm/uefi-sb-keys/PK.key
 create mode 100644 meta-arm/uefi-sb-keys/db.auth
 create mode 100644 meta-arm/uefi-sb-keys/db.crt
 create mode 100644 meta-arm/uefi-sb-keys/db.esl
 create mode 100644 meta-arm/uefi-sb-keys/db.key
 create mode 100644 meta-arm/uefi-sb-keys/dbx.auth
 create mode 100644 meta-arm/uefi-sb-keys/dbx.crt
 create mode 100644 meta-arm/uefi-sb-keys/dbx.esl
 create mode 100644 meta-arm/uefi-sb-keys/dbx.key
 create mode 100755 meta-arm/uefi-sb-keys/gen_uefi_certs.sh
 create mode 100644 meta-arm/uefi-sb-keys/ms.crt
 create mode 100644 meta-arm/uefi-sb-keys/ms.esl
 create mode 100644 meta-arm/uefi-sb-keys/noPK.auth
 create mode 100644 meta-arm/uefi-sb-keys/noPK.esl

diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
index b26941e0..958a1ff1 100644
--- a/ci/qemuarm64-secureboot.yml
+++ b/ci/qemuarm64-secureboot.yml
@@ -4,13 +4,15 @@ header:
   version: 14
   includes:
     - ci/base.yml
-
-machine: qemuarm64-secureboot
-
-target:
-  - core-image-base
+    - ci/meta-openembedded.yml
+    - ci/meta-secure-core.yml
 
 local_conf_header:
   optee: |
     IMAGE_INSTALL:append = " optee-test optee-client optee-os-ta"
     TEST_SUITES:append = " optee ftpm"
+
+machine: qemuarm64-secureboot
+
+target:
+  - core-image-base
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-qemuarm64-secureboot.inc b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-qemuarm64-secureboot.inc
new file mode 100644
index 00000000..23bdf970
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-qemuarm64-secureboot.inc
@@ -0,0 +1,18 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/${MACHINE}:"
+
+SRC_URI += "file://${MACHINE}.cfg"
+
+UBOOT_BOARDDIR = "${S}/board/emulation/qemu-arm"
+UBOOT_ENV_NAME = "qemu-arm.env"
+
+DEPENDS += 'python3-pyopenssl-native'
+
+do_compile:prepend() {
+	export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1
+
+	"${S}"/tools/efivar.py set -i "${S}"/ubootefi.var -n pk  -d "${UEFI_SB_KEYS}"/PK.esl  -t file
+	"${S}"/tools/efivar.py set -i "${S}"/ubootefi.var -n kek -d "${UEFI_SB_KEYS}"/KEK.esl -t file
+	"${S}"/tools/efivar.py set -i "${S}"/ubootefi.var -n db  -d "${UEFI_SB_KEYS}"/db.esl  -t file
+	"${S}"/tools/efivar.py set -i "${S}"/ubootefi.var -n dbx -d "${UEFI_SB_KEYS}"/dbx.esl -t file
+	"${S}"/tools/efivar.py print -i "${S}"/ubootefi.var
+}
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/qemuarm64-secureboot/qemuarm64-secureboot.cfg b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/qemuarm64-secureboot/qemuarm64-secureboot.cfg
new file mode 100644
index 00000000..d2edb5fb
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/qemuarm64-secureboot/qemuarm64-secureboot.cfg
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
index 11f332ad..8df993ae 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -5,6 +5,7 @@ MACHINE_U-BOOT_REQUIRE:corstone1000 = "u-boot-corstone1000.inc"
 MACHINE_U-BOOT_REQUIRE:fvp-base = "u-boot-fvp-base.inc"
 MACHINE_U-BOOT_REQUIRE:juno = "u-boot-juno.inc"
 MACHINE_U-BOOT_REQUIRE:tc = "u-boot-tc.inc"
+MACHINE_U-BOOT_REQUIRE:qemuarm64-secureboot = "${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'u-boot-qemuarm64-secureboot.inc', '', d)}"
 
 require ${MACHINE_U-BOOT_REQUIRE}
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2027.04.bb b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2027.04.bb
new file mode 100644
index 00000000..8c8d5dd8
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2027.04.bb
@@ -0,0 +1,5 @@
+require recipes-bsp/u-boot/u-boot-common.inc
+require recipes-bsp/u-boot/u-boot.inc
+
+SRCREV = "3f772959501c99fbe5aa0b22a36efe3478d1ae1c"
+PV="2027.04"
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index 9e9c9dbd..10657dbd 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -21,3 +21,5 @@ HOSTTOOLS_NONFATAL += "telnet"
 addpylib ${LAYERDIR}/lib oeqa
 
 WARN_QA:append:layer-meta-arm = " patch-status"
+
+UEFI_SB_KEYS = "${LAYERDIR}/uefi-sb-keys"
\ No newline at end of file
diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
index 78a39c03..730e29a4 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -13,12 +13,25 @@ QB_DEFAULT_FSTYPE = "wic.qcow2"
 QB_DEFAULT_BIOS = "flash.bin"
 QB_FSINFO = "wic:no-kernel-in-fs"
 QB_ROOTFS_OPT = ""
-QB_KERNEL_ROOT = "/dev/vda2"
+
+# kernel is in the image, should not be loaded separately
+QB_DEFAULT_KERNEL = "none"
 
 IMAGE_FSTYPES += "wic wic.qcow2"
-
-WKS_FILE ?= "qemuarm64.wks"
-WKS_FILE_DEPENDS = "trusted-firmware-a"
+KERNEL_IMAGETYPE = "Image"
 IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
 
+WKS_FILE ?= "efi-disk-no-swap.wks.in"
+WKS_FILE_DEPENDS = "trusted-firmware-a"
+
+EFI_PROVIDER = "grub-efi"
+IMAGE_INSTALL += "grub-efi"
+
+MACHINE_FEATURES += "efi"
+MACHINE_FEATURES += "uefi-secureboot"
 MACHINE_FEATURES += "optee-ftpm"
+
+INIT_MANAGER = "systemd"
+IMAGE_INSTALL += "systemd util-linux bash coreutils efivar"
+
+EXTRA_IMAGE_FEATURES += "empty-root-password allow-root-login"
diff --git a/meta-arm/recipes-bsp/grub/files/0001-verifiers-Don-t-return-error-for-deferred-image.patch b/meta-arm/recipes-bsp/grub/files/0001-verifiers-Don-t-return-error-for-deferred-image.patch
new file mode 100644
index 00000000..e55128df
--- /dev/null
+++ b/meta-arm/recipes-bsp/grub/files/0001-verifiers-Don-t-return-error-for-deferred-image.patch
@@ -0,0 +1,48 @@
+From 70fe34e1e61e0560af8a2018c5486b07b217f7fc Mon Sep 17 00:00:00 2001
+From: Leo Yan <leo.yan@linaro.org>
+Date: Thu, 22 Dec 2022 15:28:12 +0800
+Subject: [PATCH] verifiers: Don't return error for deferred image
+
+When boot from menu and the flag GRUB_VERIFY_FLAGS_DEFER_AUTH is set,
+grub returns error:
+
+ Booting a command list
+
+ error: verification requested but nobody cares: (hd0,gpt1)/Image.
+
+ Press any key to continue...
+
+In this case, the image should be deferred for authentication, grub
+should return the file handle and pass down to later firmware (e.g.
+U-Boot, etc) for authentication.
+
+For this purpose, rather than returning error, this patch prints log
+and returns file handler.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Leo Yan <leo.yan@linaro.org>
+---
+ grub-core/kern/verifiers.c | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/grub-core/kern/verifiers.c b/grub-core/kern/verifiers.c
+index 75d7994cf..ada753e69 100644
+--- a/grub-core/kern/verifiers.c
++++ b/grub-core/kern/verifiers.c
+@@ -115,11 +115,7 @@ grub_verifiers_open (grub_file_t io, enum grub_file_type type)
+   if (!ver)
+     {
+       if (defer)
+-	{
+-	  grub_error (GRUB_ERR_ACCESS_DENIED,
+-		      N_("verification requested but nobody cares: %s"), io->name);
+-	  goto fail_noclose;
+-	}
++	grub_printf("%s verification is deferred\n", io->name);
+ 
+       /* No verifiers wanted to verify. Just return underlying file. */
+       return io;
+-- 
+2.35.1
+
diff --git a/meta-arm/recipes-bsp/grub/files/grub-initial.cfg b/meta-arm/recipes-bsp/grub/files/grub-initial.cfg
new file mode 100644
index 00000000..1da15480
--- /dev/null
+++ b/meta-arm/recipes-bsp/grub/files/grub-initial.cfg
@@ -0,0 +1,8 @@
+# First partition on first disk, most likely EFI system partition. Set it here
+# as fallback in case the search doesn't find the given UUID.
+set root='hd0,gpt1'
+search --no-floppy --fs-uuid --set=root 7819-74F8
+
+configfile /EFI/BOOT/grub.cfg
+
+# If fail to load config file, it runs into GRUB shell.
diff --git a/meta-arm/recipes-bsp/grub/grub-efi-uefi-secureboot.inc b/meta-arm/recipes-bsp/grub/grub-efi-uefi-secureboot.inc
new file mode 100644
index 00000000..4da89afc
--- /dev/null
+++ b/meta-arm/recipes-bsp/grub/grub-efi-uefi-secureboot.inc
@@ -0,0 +1,40 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
+
+SRC_URI += "file://grub-initial.cfg"
+SRC_URI += "file://0001-verifiers-Don-t-return-error-for-deferred-image.patch"
+
+DEPENDS += "sbsigntool-native"
+
+GRUB_PREFIX_DIR ?= "/EFI/BOOT"
+EFI_BOOT_PATH ?= "/boot/efi/EFI/BOOT"
+
+do_mkimage() {
+    install -d "${D}${EFI_BOOT_PATH}"
+    install -m 0600 "${UNPACKDIR}/grub-initial.cfg" "${D}${EFI_BOOT_PATH}/grub.cfg"
+
+    grub-mkimage --disable-shim-lock \
+        --prefix="${GRUB_PREFIX_DIR}" \
+        --format="${GRUB_TARGET}-efi" \
+        --directory="${B}/grub-core" \
+        --output="${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE}" \
+        ${GRUB_BUILDIN}
+}
+
+fakeroot do_sign() {
+    "${STAGING_BINDIR_NATIVE}/sbsign" \
+        --key "${UEFI_SB_KEYS}/db.key" \
+        --cert "${UEFI_SB_KEYS}/db.crt" \
+        "${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE}" \
+        --output "${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE}.signed"
+
+   install -m 0644 "${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE}.signed" "${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE}"
+
+   install -d "${D}${EFI_BOOT_PATH}"
+   install -m 0644 "${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE}.signed" "${D}${EFI_BOOT_PATH}/${GRUB_IMAGE}"
+}
+
+addtask sign after do_install before do_deploy do_package
+
+FILES:${PN} += "${EFI_BOOT_PATH}"
+
+CONFFILES:${PN} += "${EFI_BOOT_PATH}/grub.cfg"
diff --git a/meta-arm/recipes-bsp/grub/grub-efi_%.bbappend b/meta-arm/recipes-bsp/grub/grub-efi_%.bbappend
new file mode 100644
index 00000000..fd3baba0
--- /dev/null
+++ b/meta-arm/recipes-bsp/grub/grub-efi_%.bbappend
@@ -0,0 +1 @@
+require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'grub-efi-uefi-secureboot.inc', '', d)}
\ No newline at end of file
diff --git a/meta-arm/recipes-core/systemd/systemd-uefi-secureboot.inc b/meta-arm/recipes-core/systemd/systemd-uefi-secureboot.inc
new file mode 100644
index 00000000..5572e51a
--- /dev/null
+++ b/meta-arm/recipes-core/systemd/systemd-uefi-secureboot.inc
@@ -0,0 +1 @@
+PACKAGECONFIG:append = " efi"
diff --git a/meta-arm/recipes-core/systemd/systemd_%.bbappend b/meta-arm/recipes-core/systemd/systemd_%.bbappend
new file mode 100644
index 00000000..577c4f0c
--- /dev/null
+++ b/meta-arm/recipes-core/systemd/systemd_%.bbappend
@@ -0,0 +1 @@
+require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'systemd-uefi-secureboot.inc', '', d)}
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
index 00000000..afd6d55f
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc
@@ -0,0 +1,18 @@
+KERNEL_FEATURES += "cfg/efi-ext.scc"
+
+DEPENDS += "sbsigntool-native"
+
+do_compile:append() {
+	KERNEL_IMAGE=$(find "${B}" -name "${KERNEL_IMAGETYPE}" -print -quit)
+
+    "${STAGING_BINDIR_NATIVE}/sbsign" \
+        --key "${UEFI_SB_KEYS}/db.key" \
+        --cert "${UEFI_SB_KEYS}/db.crt" \
+        "${KERNEL_IMAGE}" \
+        --output "${KERNEL_IMAGETYPE}.signed"
+
+	install -m 0644 "${KERNEL_IMAGETYPE}.signed" "${KERNEL_IMAGE}"
+}
+
+RRECOMMENDS:${PN} += "kernel-module-efivarfs"
+RRECOMMENDS:${PN} += "kernel-module-efivars"
\ No newline at end of file
diff --git a/meta-arm/uefi-sb-keys/KEK.auth b/meta-arm/uefi-sb-keys/KEK.auth
new file mode 100644
index 0000000000000000000000000000000000000000..b300cfd3fdf3bac36be7f53c10de380ffc6d249b
GIT binary patch
literal 2049
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

literal 0
HcmV?d00001

diff --git a/meta-arm/uefi-sb-keys/KEK.crt b/meta-arm/uefi-sb-keys/KEK.crt
new file mode 100644
index 00000000..04a25c5d
--- /dev/null
+++ b/meta-arm/uefi-sb-keys/KEK.crt
@@ -0,0 +1,19 @@
+-----BEGIN CERTIFICATE-----
+MIIDDzCCAfegAwIBAgIUN+ftFJpDcZ239avSVLOv0Nr/OucwDQYJKoZIhvcNAQEL
+BQAwFzEVMBMGA1UEAwwMTGluYXJvX0xFREdFMB4XDTIxMDQwNTE0MDA1NVoXDTMx
+MDQwMzE0MDA1NVowFzEVMBMGA1UEAwwMTGluYXJvX0xFREdFMIIBIjANBgkqhkiG
+9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtUmK355QQpFIJILvc6EJXbGQr6j4MLXvuCxl
+ITjIOx8KpWjq1mLB4BzSiOLgBz8TnLmGWSi2E8RzKj5y6qKvaAj8FlXHEG4I1W6e
+lxuBy4c3qUblJ0wiqM6IDZbRDH1pGbNGFfoAFuhbd0i6KViVQ9ScbuHj6g0PBZRT
+w9tEOIOHFURSVytxLHHCp2B0kWkua7iTxZ+SHvBnunzFUbTGZL2rt0gyCenqkjjt
+M0ZjKXOO2lxlPTB2H1zF80IPzQQL1Y/4cQcVjpyg+SIRvVPvJ/D2eBwgsnX+2P+v
+929Y3gerfOgxDGPccRtDxyJwBdhnp6w8q+6mIVam27dvJmVCPwIDAQABo1MwUTAd
+BgNVHQ4EFgQUwtRAQcrLJX45v3PPWsWxntGOQgAwHwYDVR0jBBgwFoAUwtRAQcrL
+JX45v3PPWsWxntGOQgAwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOC
+AQEABT49cOIu6SSIfS5INlmMhq4E7qmAR0mIfLZxxTJhzxgfR2wkgMZS/Ydo5Iga
+mu5Ep2+5gRfIM51e1nWnLjcpcRXH0udCJvfSbVVOtRZ5+Mdgj7y3JYIiFLlbTXnp
+QQMZcSybfuGtWm6vTK4jXkmH/wupkydxHl/Qf7Pu+QuyYKPc2UpmjWzut0Hje4dI
+Jwmhzf8qA/x6GuauEBYSQLHidujZmQS9TVLYqUhpUomPYQgcp9DzN72z479nVs5d
+FhutIeYFRgS/tla+1D/QxnMLU2DUUaGXNR7OsDbCQ5dvhuQL023lxvY51QlUVBqh
+dXybY5g5xx156LaACAz+aB9TBQ==
+-----END CERTIFICATE-----
diff --git a/meta-arm/uefi-sb-keys/KEK.esl b/meta-arm/uefi-sb-keys/KEK.esl
new file mode 100644
index 0000000000000000000000000000000000000000..1391be0e36ad399e514094a62726817851b060fc
GIT binary patch
literal 831
zcmZ1&d0^?2Da*aux2_hA(f&|m&&&V@%0OBW2$YnJja^)XOu{N=?J;O#<~L|!{Jwyh
ziIIs(#QgbNky*}#bGLt8eJNz~`U|)ITRk`6W#iOp^Jx3d%gD&h%3vUFC~6?g#vIDR
z%){f8nU`3UAMfMp;_hl7C(dhRXkcPsYG`6$U}_pA&T9<f8bi6bH8wFSAzQ-8%D~*j
z$j<<D7Z+0#BO}9B&#wFP0-Pp#s5HGVUdS1{al-l)KMc0M-=UMLXmP??o@;5wt7}OI
zAIMzlc=UkXUU<&Vwn&X_!bgg=?22A3TA#u3M=bQXKpw}{ym`~58&9{JuXKB=?xVEg
zTnF#8i#)ZNlAGN`e=&%?h%Wcor5Q2R`O2KUhmT+J^0Q6}K78B7qPbnvB`93GP^a+F
z@`RF!nR?kfCLf(YN$x}Xu9~BPTaKmdUA^7Ii1X#ENfvL7-I6tn`)<Xg+8UI}#~l6a
z#DA8B`)dD>LUz%<ISYO&3GNMkum0g%g^a?c(tkJpum7GOagTj<%?m@G<U57Z&c~Gs
zSZ|~+Ut_cS-7>|nWw*EItED>GGchwVFfI-@2sDrdhPx~uix`W@p(_rKr%tQZS?(`B
zA9Zx&yo-HK3<mNbX=N4(1F;6|3iv?^gc%wCv#=U411aQS2gWTh*clmE?Q9Dk>Ah6x
zsMYf@i|lDz$MSAvgS%%(&9=g$Mv3Po<lS>r8jc11ZO?epAvNor%kuo4jp8Sa=f+(t
zU9M-YStxq^(sL)Z@0W5z{kDo#{y3h{zh}E@lak2JXy3}0j?9vUI<xB@u8qoD@3T%h
z&a?eL_sYrYg>vy1>Nmgp$-OCI@tvDqX}vk`wmUwqZud~<TzK}s7W1Dfsb}j1#Dp9+
zJ}P^0b0*7P-=G^SJu-tj`x7~2mS6a6zIXHE{pn%nV#TD_Dn4U%W7)qgY~L083&)DN
zgA=X<E}U*EcW#5(A?NA&ZBMu_=RQ65&GIT|NQl(J(wf=HGc1qGR=(KQz`^q`Lq3=l
E09d<A!2kdN

literal 0
HcmV?d00001

diff --git a/meta-arm/uefi-sb-keys/KEK.key b/meta-arm/uefi-sb-keys/KEK.key
new file mode 100644
index 00000000..c6016c15
--- /dev/null
+++ b/meta-arm/uefi-sb-keys/KEK.key
@@ -0,0 +1,28 @@
+-----BEGIN PRIVATE KEY-----
+MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC1SYrfnlBCkUgk
+gu9zoQldsZCvqPgwte+4LGUhOMg7HwqlaOrWYsHgHNKI4uAHPxOcuYZZKLYTxHMq
+PnLqoq9oCPwWVccQbgjVbp6XG4HLhzepRuUnTCKozogNltEMfWkZs0YV+gAW6Ft3
+SLopWJVD1Jxu4ePqDQ8FlFPD20Q4g4cVRFJXK3EsccKnYHSRaS5ruJPFn5Ie8Ge6
+fMVRtMZkvau3SDIJ6eqSOO0zRmMpc47aXGU9MHYfXMXzQg/NBAvVj/hxBxWOnKD5
+IhG9U+8n8PZ4HCCydf7Y/6/3b1jeB6t86DEMY9xxG0PHInAF2GenrDyr7qYhVqbb
+t28mZUI/AgMBAAECggEACyGQ3VojI3M4MsW3XiotIQueDqsZUiRZq71OGFQcN0UY
+qj9e6/r0XIZohu8nQkqlMaJSlXbidyRAzf83nyCOFJ04nUZ3CpM3B6PbKPwPZCfR
+SxuHRnpuRl8oC22POG0a3vEbBI5tIvrxYsmcZJ2DzL5pPIWyMNTMb1NEMWptLesL
+CgHUySkPVVMXA7HhoXrLxCxPaW1ciUthky8xG0uclbmGs5owR0j54/fyvPYjZ8wa
+h2QRA+xSx4jzYnacGFG/lggEJfUHOROe2sY/jujovifGP2m1+mA5S7FROGhZKQfZ
+jp9cst+th29pVl4NuwdGAZp7WZ3wDrhcXq8qP8vDAQKBgQDjTM9wvxKIkiQYA74y
+QN6HdSIiYIS28FYj1jbU6XLpU0073D4ioCjATq5nZceYf843JeowELJ8civ91MQ5
+NdeB6Nxdm3uSSODquRviVREOxvuK4GSA1/OA0q4nFHLoJOyJGqRrlzWuSIC3TsFc
+N2DHHeGGLrcv8d7+fy6ZHqcJMQKBgQDMLW1S5hpnbuOHmWXdVFThDHetmDRu3Krg
+vQkZ+40x+iXZY+OkcMzLy1ATfIRd4Sb51iA905iF5nbUoCVfkLHjg1//vAXW3DNR
+lLGNO/QDC+6GHAvEPNnMJzvYrnb/I+ujPpR7hK3mdB9VpTSJ0C9KeHTlDSqhqJHt
+IUWYg4smbwKBgDMq2lO2H5Tw2QEy7oDfi3iQzLNSaO3JooqEsWkyeDTAFNXR2Ybv
+6NyJmcca6ViSBLjzZwmU6KkNBowodleuoCnVYq4Lz0B5+W+9ZeKIZcOe1YdIxjce
+5ejtBFk1yDwr+7dNcQ/rRSFLnvYk23BH4xhPyLHtGD3Jw/okZTgA53cxAoGAHkRB
+p39KvLh4bBp2OjgNGQtTFl2wsBpwDj6Xgc2DYbw2LiKblT3PbgpmhWz45j3BHFn8
+j421V2wRg3V19NOrOxG3gl5p8y7TQK2tIEWZ53W2VxUDPYTTuGq8eWNramj1vk5B
+jondiYL/Ph/uSNuelwiCM44fGrW1ZBSBj5k4YGsCgYBgOqD+SgY2Ed4IQlejNuv+
+ITBV8ExmgyGVytxFBBCRCWoNsLTLmg5tDABUEumzVdZalCbqSKqJyoAs2IxXp+r4
+C6ixxgzt+iaC3ibfmrjGmvbjm9Fvkxzjepk4QHO10C2s03bYta0LcPj3zPQ780z1
+6sBZJdImaj4dhgIHhkGa4w==
+-----END PRIVATE KEY-----
diff --git a/meta-arm/uefi-sb-keys/PK.auth b/meta-arm/uefi-sb-keys/PK.auth
new file mode 100644
index 0000000000000000000000000000000000000000..c2f7067f6a474f78e9b77d52f2827ac4f40da46e
GIT binary patch
literal 2049
zcmaFL&ce#aV9o#on^=G>rjLAcFRk~wpYhJKYo$r8d06UlgC>?~OpJ_%{06*ioC$3n
zjH%2lOpL4y2Hb3%T5TR}-+39?85cA$3mY^s^BXiVeqX@M#K^=XB6;BKB8|mMthdda
zH{}RN5yM>%uMHq0pn4d&fkucMiW&&BF^94+^YHj&<|P*8$NRXtxVsw2iSrs68kiWE
z8k!gwn3_h3^BRM=#!xP9jZKV7$d&-z$=t-q&j5567gG}>Bg5g3UO&IKXc}IOnAkCM
zeaEM5-`8)hQ<^ZZR>ghEYm>ASD=d5Bo->{hStw?<?g@Jo^DB+ZY0oxql74ZXBkj)D
z|5}<Je^}gVewM$Tc~~;xD^KQoxmjg$ADFcdWlVTHNtr?81XF8Wjr!KyN?z0a)|rYg
zqc*QQ|EP!iKH~ze?lV1sEbhFey~%0e+dVudB~4OwGn;QULoL<FS-!{MufmDGnDCCP
zla!w9pZ~uiB#8BLz>Uq}$2c#UzEVv-P*hR;bpmIdNolT3G4q7V*n`&hxVL3$%y`l`
z!}XTO`uugzYuVZQ+ZMiXb9}4u?5*FM?i&tWS2Gs6?q_`AeJtafh0c?;=TF{dVrFDu
zTpVl=Xdnv=cUe9bF&2@Tnu>dUo}Bx?_I%#k<Gd!DRrJoxH;@NOE3-%#h&5nWzz<R&
z%*gnkh1Gx=NFfJ1Fm8dt&d6YSaGh<!)w1Z?853uPDo1>JIz95F?k?l_JxViJuj-jA
z>}#0fvia|?DlT^aa|>_OHWq(c|GKHz@lC}3Zy_093${N>zx%k#zxQ{ZTCkxzlU<s|
zHI?^9NBo3cHr{)+Bv9(ZSJu{9b5CvFX7ymA$&>__eV1RA3$L;|*tBTlgT~3tYa~Si
zPFtUy*EZL5jtuj`nQ0R~hiFHvte?2{xV+W167KQ{2mVJTlfrXMFHSMvD#x_=G3Wjr
z`u7tz2d-e8Bid<cVR>xcgv_)x=>~ZcLhsi!={onF>U+HUUscoUq=u8B8-G9eTN3T9
za&hC|OZ(KjzNDGof4cgn$~WeiK>I(b_Rn5l?>1~=i~=UTFkt>M(8rl*apx7}?1q$e
zfT^0LiIE{>|CfafO7nNJ{wZ(dS+e=$%_(A=Sqr9}z3I-jR5(2>aJ|GS(UqBQhLaxD
zKjq6@_Qzu3-G%kivUwjLA8R!03!52mL%sK>*3td)uUL8`H>B>azouB_pL4e)gtg_x
zp=hBS+(nzNoh`_f<bGIrkfr}l!fHR^>2htaW=zjld$LSwZu^vd=YzAqPZ3|P{zY0X
zbzOPKhcjDpitnBbj1~O0dYR3x6CCyPlv|fI%7&XxxafD_(IJ};6Zk5PSBstJ;{K=V
zu;FriYLfc>=P%5vl6$x>J~+ED?4faeBNyA&g3w6@3#0UZ>Lk4rmfw8KGP`i@p6H`S
zeR6G$x)+x2+%D2E^XksJtc8&WmOh!X+^c=-YS9?&4@LIOkg`k}NDBgil9I8pi;Iv+
YSjDV8qlMFG;RLCyKo!qu;RGz40PyEYkN^Mx

literal 0
HcmV?d00001

diff --git a/meta-arm/uefi-sb-keys/PK.crt b/meta-arm/uefi-sb-keys/PK.crt
new file mode 100644
index 00000000..b30f1593
--- /dev/null
+++ b/meta-arm/uefi-sb-keys/PK.crt
@@ -0,0 +1,19 @@
+-----BEGIN CERTIFICATE-----
+MIIDDzCCAfegAwIBAgIUGcDNoiijpDu2mZ6UxAhyAN1ISrAwDQYJKoZIhvcNAQEL
+BQAwFzEVMBMGA1UEAwwMTGluYXJvX0xFREdFMB4XDTIxMDQwNTE0MDA1NVoXDTMx
+MDQwMzE0MDA1NVowFzEVMBMGA1UEAwwMTGluYXJvX0xFREdFMIIBIjANBgkqhkiG
+9w0BAQEFAAOCAQ8AMIIBCgKCAQEAw/FK+fWEKTHRWJGIma+I8rb3r7N+IpCefSRH
+pOs0ZsioOYxe5wHIFKEWNq7kB1oD6ijTZuazshvozwhm3PX/KilI/ARGfPl37ZnD
+GWD1DGnvHpp2HvADK8JokOOSIwAoyAKFfnwntW15DTVvhZkh6Vqzrs/ijAvfAaAK
+i8yMUQRHDXWNY2ZXt0hJkmKSJUY2nzqYJmUyQx+MMP0gyI5cV4jVkiLkv5//eFRS
+BdNQ2LNXxgnSNeolY8ByeHP1kAl+NHVtHHMDkHldwTveC7ZpKJjkgZhF2kivb67n
+fQcGj4ah6EZB7Sjm7U7si9hAitVooUW/AehLxmj2OCzkrc/J2wIDAQABo1MwUTAd
+BgNVHQ4EFgQUmSkhvUzkzv+tz27txw00syQuzJ8wHwYDVR0jBBgwFoAUmSkhvUzk
+zv+tz27txw00syQuzJ8wDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOC
+AQEAOcGuPWDVdlt9mJGaVSNY8uWXWcktujNfvCKYBdUuNyC+gJREs/36egoHT86h
+2H2Bc/Kv64JzQexYv/ZUaPVwt+Jn3eN6T437biZTMUcCPmYo1iTvMsROE0Sx3uqk
+URrw9QWFmp3Ks7Y64JE0lGBEvtPqdxOqOsGCorHggZODrBkUUMs7zZ6GnTWcHAPB
+mWaQ81QrWKl/ka3HHzrWdAt3WEAP4nSSV2w10ZQ3tR4Co+MJv7gv32GzUagBnBWJ
+OTg5xp6QaWasZzBuGBLvrIItQ47KjuOr/nqCq2KAyVWx++D9dFtLJNGx/dK+J4r0
+Zjff5avZJPYDXFE//GU/5uvXiw==
+-----END CERTIFICATE-----
diff --git a/meta-arm/uefi-sb-keys/PK.esl b/meta-arm/uefi-sb-keys/PK.esl
new file mode 100644
index 0000000000000000000000000000000000000000..3435ef9bcedc04b8aa06bd24fdeb7e37ea8bb832
GIT binary patch
literal 831
zcmZ1&d0^?2Da*aux2_hA(f&|m&&&V@%0OBW2$YnJja^)XOu{N=?J;O#<~L|!{Jwyh
ziIIs(MDoDdMH-8jSZ|v-Z^{vlB8IyjUK<Q}**LY@JlekVGBR?rG8l*(iW&&BF^94+
z^YHj&<|P*8$NRXtxVsw2iSrs68kiWE8k!gwn3_h3^BRM=#!xP9jZKV7$d)j&GB7tW
z@-qP4#l_Ub$jET`qu0-`Et-ZGBPMptT;K6&+xPXG>y#$Ut5tDd^4cWr#0txvxaW)~
zL>7vft$V^A#r#U+a@w=ao1|Zy=SaKr^}m*;#~&8AnxExwXC9VJ_{x*{UT#*I+y`du
zLm3kuPf}*kIKk9fSEIf)x02U1zjdbK%c#xk&OhqmzR$RTtNTn(Ad5S1X>W2`_;wG^
zNlBAb-OT1&%}`4<a+dEg_^WWDFDAU>>LjHn`{)0!2nk}n9B^ZE_%Y5)rms|!4-{1t
zf1SWtXHuFgQ_MV}GWMYLJ??Fp8Z(|W&Tzfuu|9v@^ICSc{<eiL+#KI(JbUZ+ru&9N
z*VT-LuKO8ZcpuC7W})+B?fH|pnV1<F7#9Z{1RBT!!(En-MT|vcrl#UvpC{-3uRWjl
z_BgM}W);0N^9|%d(#k9n24W4^74U-;2s1MNXJIv922#ku4vbr1uro4P9$aUeaJ4MD
zcE-e6p~?}To=%TEsk_TKevi@&)~kBv3i}$SxNQFWtBQ-=|J=eGwT;D}*1v8lc6<}D
z|654L*MjYj((gX5^6&kfrxtAJ&SaOSaZTmD(GfpkmyP#cEeVwR@RhZ7*4$H@w^==y
zXfh?iW#8pj<-)714mK^?_@Hre^BPH!fYa7z=e5l>og>41aAw+s&mr0oE9)n&JuYu`
zt%SQg!h!!$$)xZc(~DEgx5_ase$2UlhyMM<&4DWz=ZJP%T38;NHz6}^O}aszgwXpn
zO}fr~r}`eR{#VtsI;r7g=*Hg<{+2|0t6bdp_tHM~t}kik_n)r5sq&3ECeZ#*s{OOq
G*Si7CnO39#

literal 0
HcmV?d00001

diff --git a/meta-arm/uefi-sb-keys/PK.key b/meta-arm/uefi-sb-keys/PK.key
new file mode 100644
index 00000000..26952b71
--- /dev/null
+++ b/meta-arm/uefi-sb-keys/PK.key
@@ -0,0 +1,28 @@
+-----BEGIN PRIVATE KEY-----
+MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDD8Ur59YQpMdFY
+kYiZr4jytvevs34ikJ59JEek6zRmyKg5jF7nAcgUoRY2ruQHWgPqKNNm5rOyG+jP
+CGbc9f8qKUj8BEZ8+XftmcMZYPUMae8emnYe8AMrwmiQ45IjACjIAoV+fCe1bXkN
+NW+FmSHpWrOuz+KMC98BoAqLzIxRBEcNdY1jZle3SEmSYpIlRjafOpgmZTJDH4ww
+/SDIjlxXiNWSIuS/n/94VFIF01DYs1fGCdI16iVjwHJ4c/WQCX40dW0ccwOQeV3B
+O94LtmkomOSBmEXaSK9vrud9BwaPhqHoRkHtKObtTuyL2ECK1WihRb8B6EvGaPY4
+LOStz8nbAgMBAAECggEANEni+TtUjm218Q29R035nNPI20FqCq1PLhQNbmw56qfn
+hJv6A2mNTDwEookfXvrdipJkf9RW5dPe18jlMlgPROAJkv9NFDK6l1RuJQqjujFW
+13LezLi+D+JsZyXjrKVxPJa3qx5UtmzFXgoBfcR0sUI8Kw1c5oSQeW2NAuuOElw7
+AKeHnA3EHUb3f50dJF1Xcp5B8zJrGCNFUDzq9Ui0lu4pmP8L53eOMkPalW7f16oz
+mbopyWrtmPbJ5HJvn5PHnsq6WS+89wTIwQu3CJxStLj0FQWl/DTUha8oFFJ3Pj4l
+g8ZjaakOiiFIr1w0cMftuCowJHSts+lcFnQ+Sq1u2QKBgQDxLZ48o0Awbb0HRvnG
+Z2wFvYgUMmqxp+szSVxp8v3XKgNiwm108rIN18zR6VDTOavA5HfGjvHaakHBWhcs
+a4G4H15m0a3qUQP+636PjlTap/ewtZHjgrdXdTDvkGSq40nFNJJ5YU2GHPNW7KZx
+mEQeJnRAdl1x+o4jIgrN7TJM9QKBgQDP+/8RWImSHPTFdISU+YX/ShklrduzQmvJ
+3yYttGK4cdMjVy/AW/pJ1j/KzcB2h1SYRdP7LR1XQdu/DOFQqLQb0nQl5XIsZcxo
+871zqjnauH4PVar4nZU6BaaXe9Pa0h1V/d+P7Tw0QPf95FSTdbdxvKVQIkjnwInz
+bIy6kJt5jwKBgBCjLfxO4rm0iEq9ObPXJJuMxJtoEvYoeFA0alygt6QlMNCaSwS7
+TU8pKOb+KmY330JSQHUBHWwM0nZtKZYV4H/8If4DzvSQHC90vWlXz0C6P5sAG41P
+UiiFXBfapScowMkK5GPdM4Th8GN5tc22TFSsIG7l+3JGb5G64nXsPAEVAoGAAY1G
+zPFVLXLr3KFO7/Ggr1P1NhPDBOZk+X+hwEuNRQUMZ0IaSBwnlO91UGUSn4/I8M3s
+k/41LtZ99kH5WGm51k9OsI2yuWQVD19qNXe6sMgZoLGp8erzFxi9snmpDgPtVhvr
+1B4YCefGMe3HN8Z0FPQsY5mt45TLMrbHogi8MD8CgYEAlY7mVrgW0SSlcqBbZhyQ
+8VY0401+Riu91olCQr8TQWvGQY73jyx4yeVAmZw3rADfsZSRCncv0tFG+rE0Ps/L
+kFoEea+ucIoSQWAGT2Hi6DlVbOeAx1TcDMIPW7TPCXTa/SQE+ivJRdK0U5d8UbNa
+1zkXHTFECHkicdxQuh1YJT8=
+-----END PRIVATE KEY-----
diff --git a/meta-arm/uefi-sb-keys/db.auth b/meta-arm/uefi-sb-keys/db.auth
new file mode 100644
index 0000000000000000000000000000000000000000..ba9b48f5cc4ad5b421565843d4e57f7d25c17d6b
GIT binary patch
literal 3632
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

literal 0
HcmV?d00001

diff --git a/meta-arm/uefi-sb-keys/db.crt b/meta-arm/uefi-sb-keys/db.crt
new file mode 100644
index 00000000..ba7d7cac
--- /dev/null
+++ b/meta-arm/uefi-sb-keys/db.crt
@@ -0,0 +1,19 @@
+-----BEGIN CERTIFICATE-----
+MIIDDzCCAfegAwIBAgIUUsXg+PHGcPMF5OQA/mgLPzz4t08wDQYJKoZIhvcNAQEL
+BQAwFzEVMBMGA1UEAwwMTGluYXJvX0xFREdFMB4XDTIxMDQwNTE0MDA1NVoXDTMx
+MDQwMzE0MDA1NVowFzEVMBMGA1UEAwwMTGluYXJvX0xFREdFMIIBIjANBgkqhkiG
+9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzHJGmFeIZA1a9zXjAyU8g0j3ET5mU8VeMP1N
+Jk3EsGEd16qJP7/Att9hzUtfH/kFMd1HwabFTF81kuW4NtGzWkVKlu4y262ij4Vh
+8+B4xfJUkuKmKWomqzVxe24+lQ2zhyPyfMsT8SHt1dOtJgtec0mFviG4yeS7nv7o
+poxSYz4+VZT4sRp91c4iA2j/0xnFUKizbkaOGNKe4Gijci17G8yPqePer1Jzm+kL
+m1fiRm8h4PHw08Lts0N+tB9XjQ3Vy2J48e286dxJUYCAaOl7oTyMJZJlN6KK/6mn
+CkVZOVrUw5kVv90W+mf4oc8Ec3Qd5SXGev9ISczTkhmS3u/5KwIDAQABo1MwUTAd
+BgNVHQ4EFgQUaeJZBKqG+F11Dx1hCESPsB5PEFAwHwYDVR0jBBgwFoAUaeJZBKqG
++F11Dx1hCESPsB5PEFAwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOC
+AQEAsD51onb8kzvfW07Mhoom/Wryft+0XSNKPicrFFF9Mi0cciWp9uqVZ1o5TQXH
+PIG8GVAY9diBOAukGv7F6LF1TjM1UACrxLdS9pVKKlAu6U6XFN+7UW+FgRwNYPET
+DjMdXaZlV+TYLHY7CivHRomBLMbnrqxHlVOb2WKfatSEAONJDurxeZjMUsAYM90z
+2hlOLU55Xd6PXCwUPMCL1ftuP2ahaUbHd5n5fsiCiDaDu0VRXGyzemWM3htwF7x0
+a2mXLW/swW+y5DAk4UNMSjLURTLwKtH8Os2MCLOSCDfCUgg/B+UltfSnZR4j4Tcx
+yaGQlGvzkMK2AsLK1pl8qXHVRw==
+-----END CERTIFICATE-----
diff --git a/meta-arm/uefi-sb-keys/db.esl b/meta-arm/uefi-sb-keys/db.esl
new file mode 100644
index 0000000000000000000000000000000000000000..703eb98820ea4c8e7df643639483bd391d7184b1
GIT binary patch
literal 2414
zcmd6oc|6qp7RP6mZERyVBwM2Nn;9cpq>N=S7$L?sF$^-pn0k<C##SgyqiiKATaSnq
zm%<~861OW$$r7Vf6p^Il&fK2Y>prh~?*I4vb6)3r&Ubm8@Av)rmie?_;qxj988@#g
z_!%xRt)Za*n6|*n3QS82i?y|tGxmxrx&v^a(f|ki`63hohCt*=U6ZSe_oJ8Kd_L$q
zO~Tr8^|mX35D_y-cS!$?0D~pqAV3MN03b!6o-nASq;oi(!ej(G<8AHnfQAwRg9eNN
z9NHKFa5!Hj1XdVg{|x{4L=IT%ubY73ASeec4HBG79Kr#ELA^}70`C(c2;a}RX{fGc
zio<7Ft5A=w0ASrk&!w}TqCQ-6(z>nv)&%9TQ{d(=aP*k{9~E8BfjI6=lgX1tUp(RL
zd(3EUc}^N-X)><s<9_Z`#kL5&tGJk>bgO(sV}|y}#7D@*E%So|wR#c(v5sl2Tbg?K
zEf>DeR%DZct*ktGtJhVJ4fbh4X&VD7U2av4bi32a|GF?qyTsgaRIN9sdV0K$6kGg8
zqS$-Nj<IEOabciizHwjDjm_St5QC2n#x2g@dGo^2{rGX(o1<lx*}7cnuJX){>Pm6E
zkD2e&dxZ*ZV~T5Gt7ZMLSeE*X?)`)f2glw4t_pYj!xuvc6bu4i@&MccbwS_NrC^FM
z`S2+pSWWt>|6yr$il}W)y@sod8?afJ)`lqqipT%HKw4OU1cNtVZ~!WBe{H+qZUt=z
zgX*mgmmm3d#$tj@>`l+qTaWmdG;zaUn_#uoP~QC*W(SI?TfOo&Kg`$61^&R2eMiMj
z`O^s7RN}Jg_paINhlyC68|Z51ZPH3U!NASv4e^}(M2kBkjg3MCEh43`>i!i}Z~n;k
zBNpO@5A05|x8Hw#?RWcpkK$(sOCz49f~Fm%-Y&)$^pe_@v18chD#RVcc>nPnzwPpt
z?OB6g>DHlT;dT#xEBunw%{gI`(t>yQJJgs!%^p{aR=UHA3_rJnG4}_ffe+}s+~-Wd
zJjG)c44!;5f1EAa$Q9kyK@zpzG^2ZSxss}({c;z&r!1Ejxs=;+3)1m$s4%fQX3)Ou
zCwz8_{J;k(@W0{%-w+`5`UgHT*!&U|H;0(Ky`~ef12>9x|I}W9orjhH#DwgKAR(R}
zXe1yj3`CLQ-jrBcI6aKTprd5~DdFHI<R%g|B#J=~L2Cdg;fOd=!6iJH$%tiyvNZQG
zn9&R-g%vKCVF8#4^H3z_Z}Xb_Y2nNeO*aaY6|d<+VMbC}(T6C(R810t!4gu72G9av
zF&F@YF%?pa`!h7dVtxNF&&+}RDi{!<U_b<d0Re*+Y6CcX;5%qKK99!5XH$C}{$ZhB
zpGDG@l9TV0Q7}(!WltV{)hxA2nT}NNJFhWOs*g2!o`UHvE1UNrOl1d2MsThdiIw|l
z8JW#<SJ>c$jXYXz+NF}rb15-$JUV7rVe6|fiR76C$k*JB1xJu-KOlK@;|;M&WL*ob
z7&Yz~b+#r?PZ4TUtSJA!po#1>u()$H3HTOYL6ak-|7JNigS|KLmhGuhD;hu@7_Yk<
zz(VS!l=L0&a+u7l4Cl@>N5eQBuS|*kfrb|?2JU4Q6)DMi?ym@m<*j;neN=zh@~n?L
zwUvCV)2rm2_cz1^etCjV;a%-c>Y>~y(T0EwReI%<g|~1_TAYZR<Jp3f`d*QUZSlCU
zrh}!I`ah%vueK__nCHO~qbSnFamE@P=P?6RPSo*RV+ruhsq-VA!?N!(&M1`@xk%}=
zYJL}Ul@e|H?$Z|ferm}brF7cLikz$ycL}xpuwzJNefHhFEAL96ac9ZY{$_`itPtCQ
zy%q`)_r+;4ItE(FPWACa<1^DrD!BzB=I?yi6~yJU+ScW#dXIFg5bx4FEl1XKQf<vn
zy2w!SRcA|j>lR&1uW?Yps5aVLe7VW36A`fOk&i;3KClr()GpQED3FT{-+DUemB`%t
zOa?IHKkBuxU`Vp8v@lRjYTtl%%}s8b_#v3?fGZ#&07G3G1`~X5>A)}Q_g^{1hm!Wa
zOgbRjHblIj?I~(ut`$)Q$cTs;ihyBY&MpP8a0Sp$JVS+VZ70{eFk!6ca?q5?6?+>w
z={>1s4w6<fmsf6{={GP4;n~>DY3O|FCO<uLP8ENXKj_{)>R-5rXgOnF-Bp(Ek5xJJ
z<n*G%r(RZ*CcV_2(B0q`9OIFG6A{*<rsgeCxMjHeyb<@^Zr?re%^A1ake^PmFRs|M
zgk;{H8fjHCUN?`HeO>jn`Ae+rLvxqbX=aU-N(H*bI4QX!@z?-8WmLTQp3|9}aq<U%
zVHavLv@NB|w<$=HZz<Ja8;wfzGeomuOaq%ASE1JMncU4!s4~p_Syw>+&eV!M<(P$r
ziLL=c(XOYCEORlaE;|1eG;kTRx1o2VCVfJ$+cdqYeIv?Qt83brA1d}wUp{&J)!^>=
z7)9ezXVe;Vj~ZqdJ5=jIHQ9P%2E^->T~W&tt54}xJBe>CtrJPkSa&Si1S~Fhq?~W=
zfd!<Pd5|Hq%?-oahXbqQSM>9Ss<6QY)mZxRy(<rK%A|S&YOr4RY?do6moUmtwIc_m
zw%vVEny-=Qpq9ZIj`e@JJLiB_1Bs84*42o9Y`&jYQP5r3CW!<Oj^OcmjyQr}gMVSG
zwbNIf<>$t=w{2Y7SL>Ata3iPHwf^gSm1|_<U8M-0JN0=+;@Pb87+4Xmg-zSKR<@QA
gb^TeT<cGfYYjl&j_M9c6=6c2SN)!d_sMBZkZ*P0i{Qv*}

literal 0
HcmV?d00001

diff --git a/meta-arm/uefi-sb-keys/db.key b/meta-arm/uefi-sb-keys/db.key
new file mode 100644
index 00000000..01451973
--- /dev/null
+++ b/meta-arm/uefi-sb-keys/db.key
@@ -0,0 +1,28 @@
+-----BEGIN PRIVATE KEY-----
+MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDMckaYV4hkDVr3
+NeMDJTyDSPcRPmZTxV4w/U0mTcSwYR3Xqok/v8C232HNS18f+QUx3UfBpsVMXzWS
+5bg20bNaRUqW7jLbraKPhWHz4HjF8lSS4qYpaiarNXF7bj6VDbOHI/J8yxPxIe3V
+060mC15zSYW+IbjJ5Lue/uimjFJjPj5VlPixGn3VziIDaP/TGcVQqLNuRo4Y0p7g
+aKNyLXsbzI+p496vUnOb6QubV+JGbyHg8fDTwu2zQ360H1eNDdXLYnjx7bzp3ElR
+gIBo6XuhPIwlkmU3oor/qacKRVk5WtTDmRW/3Rb6Z/ihzwRzdB3lJcZ6/0hJzNOS
+GZLe7/krAgMBAAECggEAGNjmpYs141sQLC1bar1yzk3m4SyhSRsaqH+QidA30Gvt
+MZHjXmESrecWPtojNIKSVA4ds3ZuUircGv9aVSdFUfpL524JtlMzB5hhYD9uzjf2
+eWecZDonevVi1mp+pqTkpc8DoJEZ2luSSUORrqcBEqfj3kjA6aCoANngMqWpObBW
+NRbjwhfrBxPmBHEw267nPtqY96mhNsMkonYMN7NeqIIf5BC3s7t+2/qGrfgzxNse
+RGFHWYF8mtOtwQO6e62V8eU9Q0GYbA36Vw8y1hr5bQJLnn5l+M5vJfFgzP+HWY/t
+1S/6IQ/9u1hfEsjjWFQRfDIOURQuY4i/vNEfbFH/uQKBgQDyeXG75xAGT9mzAl+5
+WLZWD/w/m15le6YbU2zLzxWzrRs0RD3hCbOEOXIo//v7vDKMmXqlNMmPkJrV3MIn
+HwlnUAcRNd76yHBvxtIbJjeKTKbqLNfLpjbSU4r/xaSiW12PTCEXkQQrIrUzDR1m
+/W2YM9QQEWtvIHzJLmSOQyDv3wKBgQDX2cnLhrd51me4DHi6s90OlNrehbfSuL0y
+utOUmY91isIvlVNVJsFnKE9ETGSu71KQN5Isc5bq3nq+e1R2jCm6D6XetAbtJVya
+OTg3xZPoAppOF2P3SJO85xztEL4D7/qnv7oYkbVAdT+Q/mfQ6US4Zu2sq2KwtJsM
+TLsmLmuwNQKBgAzTxeOF3sAmu0KQDpZUjhjRcau/wWem+euaJzhE9UXzE2xZa9ia
+1cdZ7qMin6b6lsX/XJCe0UbqBHbp3c+KAcpYXndXnTsxHVmccAMFq4yCb5YV1zir
+y1ynFMRhJUt9f96TzXBcuJa7mFBiEjsfjwutOju7YC6ZzmAqNyGbhYOLAoGANmgP
+5DwdrRks5YhHOhAyDQXaMTKVRgkIr2vF/vPB5EfIcIP8ED+Hij/v0vBKhImQTwei
+0Y+FH8haOf8OKB9mOR7OmVbZVBcRw1He6LflcxqM2Fgu+1qQ2pGKifqpWoa3sGa0
+OpMnk4q6LgriEhdqGezfxaEhbBbp6ezBU3tp620CgYAyRvEcmpq38mDmutEF/lF6
+wfuze3/y2wq6MW9a7db1tW1AEwXTEYh2hyD0+n34mqpMSq87DwOO1W+Ro6B2STSR
+B3ejga1Be4vzBNZtiFGg5dT9dxNL1i0gpZW3QtntgExTyBM7OkEJbYWb8huRRMRi
+x7Q4387Tslc0sBtPct4WYw==
+-----END PRIVATE KEY-----
diff --git a/meta-arm/uefi-sb-keys/dbx.auth b/meta-arm/uefi-sb-keys/dbx.auth
new file mode 100644
index 0000000000000000000000000000000000000000..58e17be1821daff8a049879ac74b6c9fd41a8990
GIT binary patch
literal 2049
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

literal 0
HcmV?d00001

diff --git a/meta-arm/uefi-sb-keys/dbx.crt b/meta-arm/uefi-sb-keys/dbx.crt
new file mode 100644
index 00000000..dc7d12a6
--- /dev/null
+++ b/meta-arm/uefi-sb-keys/dbx.crt
@@ -0,0 +1,19 @@
+-----BEGIN CERTIFICATE-----
+MIIDDzCCAfegAwIBAgIUSGbdFlDkTvqCGPXJYPpR0eC93J8wDQYJKoZIhvcNAQEL
+BQAwFzEVMBMGA1UEAwwMTGluYXJvX0xFREdFMB4XDTIxMDQwNTE0MDA1NVoXDTMx
+MDQwMzE0MDA1NVowFzEVMBMGA1UEAwwMTGluYXJvX0xFREdFMIIBIjANBgkqhkiG
+9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuY0rs4JUijxKPasOl9sEQeJbPMTF6Z3bOy5y
+KmpD8h0iXusXH2rxHD9HLUUw2b74tXxIGASnw0ny+FDpXjodR4zWDa8tYYVm0d5v
+9LrBI0EGFZry4P11CB2/Cyi11d5wf4vvRIWfKJ3R03Ae+HkWgk2HF3g9hFSOYBnx
+cGXjMqwg99UYGiqD6AGPMIG6I5lxkrZv8gGheBdXwn2kBqqXz6gLC3cXv7gkyWvA
+Xy9R8D30QDgJB6+RVpTK0GwsqGlzliQngKTw5zhoJNp5mQUrboeGdVpKfhSXz2cS
+Bb4/5aNXZiGtgrKbEupbb77Ke6ikVfisIle0musF3pv6wvYhSQIDAQABo1MwUTAd
+BgNVHQ4EFgQUg1DFCynH2vQ8XrsXR7CZaJ0DE/YwHwYDVR0jBBgwFoAUg1DFCynH
+2vQ8XrsXR7CZaJ0DE/YwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOC
+AQEAkUTU7DUnTX3i6ucgSXx45pJFgovcm6+mxnbZGtDNiVt2ZvHTcAGreorO320e
+WdZgoWV/oTja5qzSr4AwtA2OzIAYH3AJ8RXpjKT6lw1msJFx0yqoS2Y7ZEWnIi/U
+uMcJD6so3ahYu9+yXmiM4bqkQqjJIuxS+cOKNpApnU8JjUIHSBqQoj324kehhlxy
+Z+HCfohv1a/rl2C9wcAvJ5sLi9Fm2poztvuufbBG25VLmyrnGFBjgUulf/4a7AdW
+r4Mi/JaHS0t8Y/gYdvTTQegSgs8oUgB7RU1ELZRAkvdG2SXW0ngU9UQqv7G4nmRE
+u2tzhDeGbnWPnZfwTamyBPzTNQ==
+-----END CERTIFICATE-----
diff --git a/meta-arm/uefi-sb-keys/dbx.esl b/meta-arm/uefi-sb-keys/dbx.esl
new file mode 100644
index 0000000000000000000000000000000000000000..51667e6d73c9a0aa0aa0979e0af7d32d298c2e28
GIT binary patch
literal 831
zcmZ1&d0^?2Da*aux2_hA(f&|m&&&V@%0OBW2$YnJja^)XOu{N=?J;O#<~L|!{Jwyh
ziIIs(#3SvlSilp%UriEUPbT~dy!c@6o%sg5Y@Awc9&O)w85y}*84Sb?MGb`6m_u2Z
zd3by>^Ad~l<9%FR++7Xi#CeSj4NMG74NVLTOiiQ2d5u9_V<;E5#wJE3WJ?%X8JL?G
z`5A!j;$muIWMtUctG&4?q|3(3b~WGh+boWcqHT^GeL45GwO)}{mh&fBrMTDP@>w5c
z?A>);4Q}rHv9-oSf@S$(&rd%BUdCC;y7ye;U9X$ins)JC{+C?`l^xkcXMK9`x0FM6
zKexu#tM>}(yWhLC&excG@p6IOk4mv7-*)i|+m?{N1j&yDsgI4;D15&vA*I#)g0bJA
zahLMU!b#imKQS(>5D!08yM%4k^z$pYxy!}(?@&3JeIQ;x@Pq9a2MbR2^%KLUoVt*s
zvm&#2nu>bEk`K=<GE{C=&ScfjYi}!!@~RV=em-4@b)Wsy#o=j+YnwLB7J3z(zwcD_
ziY1{x)+mK<nf03W-t1q8zA1V#F*7nSE)F&bG>`>`yDT4z7>h`Az)^0^<F~%p#O)S$
z-!L;{F0=4A19_0NGK++PSOazi{2&FwjEw(TSPhtg6mqZw;}#g~j0_W9uDmf-_pN>O
z>bZhvO~tcGu1(!{X0Km%tn8-Lg|nT}WoaKT7cj1_>N<BnS1$5e!ot-0g%-D-t+}+m
z!C(t--<bvp`2x<5qAz=v{F=_2wqau7Wvvz7Y1S#O%a!!6>^RQJzgpw&iiq9!H^pW2
zJlwU!X~jvUH$guScbQGloa@io>%{IMHDQtMw@2;^+hU5+A0Ddf$iKS&_4I_j2M_40
z&*tvFn09NH@wVUVYB#vup6WeY>$yZga-;Xs`hQYy*u&O0EB%?)?(JQZ{6nJb%VozG
zLQUs2f*7h@eO+{?I86HPc2o7*r3#U+E?WCH?wFV2vOBxD#k?)Aw14jO556lmvHZDg
F3IL5qQIP-u

literal 0
HcmV?d00001

diff --git a/meta-arm/uefi-sb-keys/dbx.key b/meta-arm/uefi-sb-keys/dbx.key
new file mode 100644
index 00000000..0468a10f
--- /dev/null
+++ b/meta-arm/uefi-sb-keys/dbx.key
@@ -0,0 +1,28 @@
+-----BEGIN PRIVATE KEY-----
+MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC5jSuzglSKPEo9
+qw6X2wRB4ls8xMXpnds7LnIqakPyHSJe6xcfavEcP0ctRTDZvvi1fEgYBKfDSfL4
+UOleOh1HjNYNry1hhWbR3m/0usEjQQYVmvLg/XUIHb8LKLXV3nB/i+9EhZ8ondHT
+cB74eRaCTYcXeD2EVI5gGfFwZeMyrCD31RgaKoPoAY8wgbojmXGStm/yAaF4F1fC
+faQGqpfPqAsLdxe/uCTJa8BfL1HwPfRAOAkHr5FWlMrQbCyoaXOWJCeApPDnOGgk
+2nmZBStuh4Z1Wkp+FJfPZxIFvj/lo1dmIa2CspsS6ltvvsp7qKRV+KwiV7Sa6wXe
+m/rC9iFJAgMBAAECggEAf4LJDmI5EIogBsL/k1G6WkBgrKEY1NNbLg9b+1Ptf3uP
+/CSYTkniiaPemPicenanWaifrom8dBLkesq3pL5RErNxAhRpHkRbhUvUKh0QztZH
+hR9nW0AyZbJzcAq48tEbBDu44KDm4DWcVS4OyngEBOWcOX+y3rZw5Q/PAIu0F0RQ
+YeCe2hGlYdRijaU8jhwLrW3hugiKhBo+uea/IfysD54znfNjYThcnI5sC25CWMUk
+3TMrWX/rf11yhB+5cQqgDIdnkitbs+nmxy/Z/VTF3NQA6mzoRrLgMjZpoHpwZpZL
+3K8lCGjPDN861JSF3r0sayXqpWzgk4jbLDOUDEo5kQKBgQDpPw1RPBz/QllB+qyh
++ckoXjs3tpaaAwnYrBALv8tPEN/PWhkXDBBMf+I+xFdZvSsdKngKyg1I6A1MopdR
+CkjeYGEIGPBPRnP5O2+ORjEOvZjzqnj5NA+WDgIAiBHLslmpOdl99rNdv9GpERn9
+b74EXWRjbCjIT7zUEIbqPo4DdQKBgQDLpwRmiHfrHR5Dkdaa8ZxA/RXhbc6f9JRW
+nvAB8TZSEkau0fAOiKCqqoyoV/eUqb17fkVo73Oh8fXC+7N1vDJG/Rf7VG5KOGPs
+NtDnh/i9dFJoH9Ttef/IngHRMRKiUPSYsrgkxaoPGMCJSQfFnxj+7f++yyknTgr3
+J6q78r3QBQKBgFBl2XNM4znhZt7lRyg1726ovITBvTutHHHBLW6/V5cTW/IfPlLB
+Z8TWt+emye021WuiPeqKJvYgdqUZzkqy3tc4JXojDoJk6IjaQeOqsjJAjD5BXp2X
+ol+4yFviiy/JdDpupFdU+BKykdRS/sBrCfZ7MqVKnOwfABmg8MBBe7YZAoGARzj6
+CQHhLpDYbLksXLPy+aeJZ3WHtdlLp5+eQI+jd8B8h9dUJUETL5zF5HofVBao9e+L
+Rs+3mQON98sfUCWpT7pkELnOeJaQG6RwGwkqrNdpmpDHXuYz1m2sJQUMh0fYwy59
+yB55Ax6c92ZbGXoyu7Vwo8FZey2IGDf/NgwG5iECgYBcrpB3BH5W2Fc91AEPWHlk
+o0z5ACqCJIUG6StnfULqmikri6NjNWyjtB5599XJbOnEe6O65kueU9KZKsr+oZdY
+y5RHa1qqAi8+bXD96YBcA115GOxiRfl7tBlczR5ivoSTMtDbltPBsXrXrsQkfm8p
+R0Mvq9LQ+BaNgwRF+JdI+A==
+-----END PRIVATE KEY-----
diff --git a/meta-arm/uefi-sb-keys/gen_uefi_certs.sh b/meta-arm/uefi-sb-keys/gen_uefi_certs.sh
new file mode 100755
index 00000000..fc7f25c9
--- /dev/null
+++ b/meta-arm/uefi-sb-keys/gen_uefi_certs.sh
@@ -0,0 +1,35 @@
+#/bin/sh
+
+set -eux
+
+#Create PK
+openssl req -x509 -sha256 -newkey rsa:2048 -subj /CN=Linaro_LEDGE/ -keyout PK.key -out PK.crt -nodes -days 3650
+cert-to-efi-sig-list -g 11111111-2222-3333-4444-123456789abc PK.crt PK.esl
+sign-efi-sig-list -c PK.crt -k PK.key PK PK.esl PK.auth
+
+#Create KEK
+openssl req -x509 -sha256 -newkey rsa:2048 -subj /CN=Linaro_LEDGE/ -keyout KEK.key -out KEK.crt -nodes -days 3650
+cert-to-efi-sig-list -g 11111111-2222-3333-4444-123456789abc KEK.crt KEK.esl
+sign-efi-sig-list -c PK.crt -k PK.key KEK KEK.esl KEK.auth
+
+#Create DB
+openssl req -x509 -sha256 -newkey rsa:2048 -subj /CN=Linaro_LEDGE/ -keyout db.key -out db.crt -nodes -days 3650
+cert-to-efi-sig-list -g 11111111-2222-3333-4444-123456789abc db.crt db.esl
+sign-efi-sig-list -c KEK.crt -k KEK.key db db.esl db.auth
+
+#Create DBX
+openssl req -x509 -sha256 -newkey rsa:2048 -subj /CN=Linaro_LEDGE/ -keyout dbx.key -out dbx.crt -nodes -days 3650
+cert-to-efi-sig-list -g 11111111-2222-3333-4444-123456789abc dbx.crt dbx.esl
+sign-efi-sig-list -c KEK.crt -k KEK.key dbx dbx.esl dbx.auth
+
+#Sign image
+#sbsign --key db.key --cert db.crt Image
+
+#Digest image
+#hash-to-efi-sig-list Image db_Image.hash
+#sign-efi-sig-list -c KEK.crt -k KEK.key db db_Image.hash db_Image.auth
+
+#Empty cert for testing
+touch noPK.esl
+sign-efi-sig-list -c PK.crt -k PK.key PK noPK.esl noPK.auth
+
diff --git a/meta-arm/uefi-sb-keys/ms.crt b/meta-arm/uefi-sb-keys/ms.crt
new file mode 100644
index 00000000..75c62b3a
--- /dev/null
+++ b/meta-arm/uefi-sb-keys/ms.crt
@@ -0,0 +1,35 @@
+-----BEGIN CERTIFICATE-----
+MIIF/zCCA+egAwIBAgIQM5WcGVBIcZFCON9z07SaPTANBgkqhkiG9w0BAQsFADCB
+kTELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1Jl
+ZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjE7MDkGA1UEAxMy
+TWljcm9zb2Z0IENvcnBvcmF0aW9uIFRoaXJkIFBhcnR5IE1hcmtldHBsYWNlIFJv
+b3QwHhcNMTAxMDA1MjIwMjI4WhcNMzUxMDA1MjIwOTMzWjCBkTELMAkGA1UEBhMC
+VVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNV
+BAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjE7MDkGA1UEAxMyTWljcm9zb2Z0IENv
+cnBvcmF0aW9uIFRoaXJkIFBhcnR5IE1hcmtldHBsYWNlIFJvb3QwggIiMA0GCSqG
+SIb3DQEBAQUAA4ICDwAwggIKAoICAQDwrV6CQAUtaCRZy94K6ITMSLk7HbCLUiUO
+EhTEEBU6hL6B4HXmug74YeNrHc6dHt+fKDM22oMyyKGh7VlK4oxgDGqCsZoJolwi
+LjntkvaBAXr/kWiQhaOcipeDcRKUbjLXFSfmZwt/5XoC+5D/8EkAGs8wDHv/6U6o
+Bv0iMRZt3kltlqqRJhYDQZsWFO6YuFtL0/Ev234w/HmmaBJKhnc87OUzw9/qgVUZ
+rQheZdPer71edBMmg5zOWFZI4IqnaZLtcttngsLmOE7PXyugO9PDi5qaFxJVVKZk
+c5T4U1byHeG72c6S4idbfcRWnOtX/A2e5KJ6WZm9I8RlbJBtCLJehxpup9Hw6gUy
+hXgGUEmWmIkoVmsNKXk1Z7hin6PP74Vj+L4W3O2UBHxtYQ+beDQegkzdKhyPbYC2
+3XoFH4Tt2FXXEeuHkxefmk0OKHSqrAlPDgi//lm/Zu7i81EcF44+Plt/JHijHPTK
+wtYZ/ejr7U+UpV80xJziVLpIg4tkRNNCOxVqxgpoECQqIn9LsHnW3uXjFxmQmAY6
+61mBpk70liM/oo3MdsgZTr1oVTzY/Y+ERDmJTRBhlRronMyv8U04roIcYxy/aOpF
+oja2iGoELGvLZtTHQQkNrfOwtJgSc2knjmDmBuzuim8w5V3bVvDwK1I8pzsqGn7A
+/wPF7OAp3wIDAQABo1EwTzALBgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAd
+BgNVHQ4EFgQURWZSQ+F+WBG/1k6eI1UIOzoiaqgwEAYJKwYBBAGCNxUBBAMCAQAw
+DQYJKoZIhvcNAQELBQADggIBAC+SV5l63cmkYOI2pUdBEg9AhKFIDD4QpPa1k88q
+KmSUQUbsHiT1yFvUdpcaRbXk1VHI212ZQE485UepxaGGXTMZbNGO8Qv1zHS4IG6f
+R0rIslBjcVOGtQ1nyRsbVwuZIdfInS6S6z1aQHm6h7a/E/WNgaD2Qbtkirfi2L4b
+NP06cBHnqPu6+XNEyjpNvuNyqg4ZpjG7NH5/wnx9026D2wqbw0uTj95b7zBvRmY2
+1imDqFq4YAzkPA6yRHAcfFwrMXRxOF+6zagc+kWKkh/RZRBylehPMCi84vZHYX07
+HjYlKg0WRsmvWxCgYK9wleYDX/QCQrLM/6qG3ybIOIa4wP9tTCLF4zTkZgnQWuRb
+LKtjyO1xFjTbTBz6ckAbMjeBZiLHqVs/3+UAlMQR9huLCbCDyBuJRb6frwZ/h/1J
+mgcw8fTCg526yQRegzlTWwLourLXI3VfqXn2KJHWqDNjmKkzboBC9so1GFKwKmVj
+Jozoi09okErb5IRGW2CEv73cn5UefEgbh4LXc13hPY9YIrJS5BwPJR5wzTpUlKaY
+yJm/DBMB1dhFRZFJNUpcsl2Zvj9L+yT02jStt0FNwPiwGEoFLkv4+s+xQhiqEXlP
+Dkr3xCiULgqMdJ0yBJo1u4FoJ/qh+odtsdmnDO/OwK5uNuzAj/NOIP2m4/ZtYTNJ
+JM4u
+-----END CERTIFICATE-----
diff --git a/meta-arm/uefi-sb-keys/ms.esl b/meta-arm/uefi-sb-keys/ms.esl
new file mode 100644
index 0000000000000000000000000000000000000000..ba5005920d3f7a9e7730627f14431ae04a378b46
GIT binary patch
literal 1583
zcmZ1&d0^?2Da*aux2_hA(f&}R&&B`-!a!OO2$YnJja^)XOu{N=?J;O#{cq63{Coj3
z6C)FofbrBhk^vrt6P+yX7hm2o%hrIGjZ>@5qwPB{BO^B}gF)j&Lv903Hs(+kHesgF
zU_)U8K@f*Sm@7Q7I3qJJy(B-+P{4o>B*-qz9+aAro1d3rC}$u865$dS_03E!$}i4O
zD^YOHFDl3{N-W6)>aaGj1j#cC8)21K2+7DSN>K<%EGnr~@J%erPAw_ONlZ>v2+Ged
zF_07IH8e0ZFfcVTGB7f-h!W>DHidF6jg6xQrJI|Wl#qj#k(GhDiHV=Vpoxi#sfme^
z;ltXvCI?pC43)^!_qblPoblLcExVyRNR>}W<cNT%Rm;A{2c^$;@%>1AoGp89uH60k
z8pdX~nvG5@T=+K9>rqbvPgc{$S)7Yvl=Lj$PWsl!SoMEm#)Q_zbGoKC7Ya?uGrBIS
z{w$rl{%IA{?+O1ucrr+xH{hxM|I%*-+g~L^vD|x}xzkonR1;%%oGm8uZpMyi@5>+c
zZ`T?8sa%#J<kePg^X94X;rp)|LnYU8#HC)ow|;M2iLhGpoO2Oj9uK;fXHI%sbUVH2
z&@&6a^YPjXtS=w#o;6EcC^TeQO7WB*!C{|dAMU<+Zqg(5=-MM;b6$u4;hpznQB~y3
zy~;;Yb0*|+Y>I1_%3FT%!z)&!)(W-&&uKF{HNvuaH7iZicO=bUeExlF@{fIDciv86
zsmV>`pIu=h*W`0oOQt`!VcXp*R{55<H$txqzHXl^K7W=kpGL{5HJtu@9Q*%8?oWI7
z=yRZqc%PkJbiGQ&Vwo?e4qcP{`{MOm|0zr3O^(cY6tc^sxjV(>vXixF)-kRO0TnH!
zdhZRD*X})iEG{`=2AkFE$i`)UU#2PBFX}y0c0$r`Z$_xijlcaZE|#6X0*O<lUd%bO
z{-dwOx+a-qnf)2BTo;*b>&Rl!$v&NS<+vj!@7m8Bw#*PJ&Q$M9c*geTU01%r)7aZ#
zA3kUY*(|r#lBzrKpZVyU2b%Ypm>C%u7Y7>n8*l?NhAck|3ow7S8SsNR!i<dnSy&C2
zfs}zPNPv$;j77vXEy(#{U4-ENYku>TLpiLil(JSB2(WQ#voW$THkpeuf=pmQPISQh
z3`}&44EmG8XI9-kxg_C{*;02$A%2IJg&sV10!zMaoqS$PD`kqK+Z#ERuP36flueg%
z-TLHe;ECI@GadYFp1Q9*y09(QSTg5g-$(ARXG(S`<jr^YI<YArxiGkGD{uNqY3Xq8
znTpp>%+;Ip+BV9ea##Dd{lZ^+8y9?Y+?~?3{n3qm(k6ec3Iw08_`U0AvCAnd-+hmZ
zR`E$LGu&-bSAVFc_HthHZLZmey(jnIi+*pA@0MnEO|yAL)Q$w6CpLVWTnc1rVzdoQ
z3N7Myon0aG%e8Bg{KZs(qNy+Z4K(&V`sSWkYb|G{s>Lhjc5;2Rz=DMJ1yi3f$A4jR
z+H~gss<!)TCoI}_9QdE>qjdDK$&)nB3sFy^byg>zcv~oDa@$AdSCNCXk$Gd9((#qi
z_V=GMOgSR>O}d+NL-PsgPS<_&*R$2P|Mi^3Zt(HTq2{@}PO`)`TLwonz1X$sx^ij!
z%F1sV6R)i>PM)#SIIqF!+bL6tpbc87$!a|>y8SaIc-?-|;uf9IvVZTL`BUX;Jfz#3
zt{2BXwC#^j+7$FehF?{#;H*{1lw~tc%-qi-%y{*NtLsEhQ?Hm!u`~DCd;eDXa?51x
zc1Pa>KQ>5svFdsM_;r4xlf){)N`F4D??*JI=yCOw%r#<}WxBgDL;csnU+uXYZ!YI~
cf9}A#JhL|k`ak<A{9X3=TW+GUr^-1!0Eqa38vp<R

literal 0
HcmV?d00001

diff --git a/meta-arm/uefi-sb-keys/noPK.auth b/meta-arm/uefi-sb-keys/noPK.auth
new file mode 100644
index 0000000000000000000000000000000000000000..cc8ba1c44c747666a2d19101b02075d2ed033cd3
GIT binary patch
literal 1218
zcmaFP&L||VCc^*&n^=G>rjLAcFRk~wpYhJKYo$r8d06UlgC>?~OpJ_%{06*ioC$3n
zjH%2lOpL4y2Hb3%T5TR}-+39?85cA$3mY^s^BXiVeqX@M#K^=XB6;BKB8|mMthdda
zH{}RN5yM>%uMHq0pn4d&fkucMiW&&BF^94+^YHj&<|P*8$NRXtxVsw2iSrs68kiWE
z8k!gwn3_h3^BRM=#!xP9jZKV7$d&-z$=t-q&j5567gG}>Bg5g3UO&IKXc}IOnAkCM
zeaEM5-`8)hQ<^ZZR>ghEYm>ASD=d5Bo->{hStw?<?g@Jo^DB+ZY0oxql74ZXBkj)D
z|5}<Je^}gVewM$Tc~~;xD^KQoxmjg$ADFcdWlVTHNtr?81XF8Wjr!KyN?z0a)|rYg
zqc*QQ|EP!iKH~ze?lV1sEbhFey~%0e+dVudB~4OwGn;QULoL<FS-!{MufmDGnDCCP
zla!w9pZ~uiB#8BLz>Uq}$2c#UzEVv-P*hR;bpmIdNolT3G4q7V*n`&hxVL3$%y`l`
z!}XTO`uugzYuVZQ+ZMiXb9}4u?5*FM?i&tWS2Gs6?q_`AeJtafh0c?;=TF{dVrFDu
zTpVl=Xdnv=cUe9bF&2@Tnu>dUo}Bx?_I%#k<Gd!DRrJoxH;@NOE3-%#h&5nWzz<R&
z%*gnkh1Gx=NFfJ1Fm8dt&d6YSaGh<!)w1Z?853uPDo1>JIz95F?k?l_JxViJuj-jA
z>}#0fvia|?DlT^aa|>_OHWq(c|GKHz@lC}3Zy_093${N>zx%k#zxQ{ZTCkxzlU<s|
zHI?^9NBo3cHr{)+Bv9(ZSJu{9b5CvFX7ymA$&>__eV1RA3$L;|*tBTlgT~3tYa~Si
zPFtUy*EZL5jtuj`nQ0R~hiFHvte?2{xV+W167KQ{2mVJTlfrXMFHSMvD#x_=G3Wjr
z`u7tz2d-e8Bid<cVR>xcgv_)x=>~ZcLhsi!={onF>U+HUUscoUq=u8B8-G9eTN3T9
za&hC|OZ(KjzNDGof4cgn$~WeiK>I(b_Rn5l?>1~=i~=UTFkt>M(8rl*apx7}?1q$e
zfT^0LiIHJS?oZv%EL}^5wU6CDvu0wE+xHd1js5@DHWnV6-(T7K;*8gaQ_9mn3CFzB
zdS1qPvqK~MRY~%afIHvUpPTyVT7#Uw&I#Qh^{nm6*M*uxr%pD~3H=>wKbPa{j!ByX
zW8<eW%?#hXjzzh1XU40rEI!|!S$~flvwrhgy1eO@&!iWed|Si|=4{iQ$Eub7X_=<z
zy`w^ff;x5AzT8atIZ@24!NBjf(a*_&<{y-j4D1XXtuHL8Th$@(wRPwE%?F?Jnf`ay
zy7u-{pU{&l*PP71U+S7TV^#m`p003~X-nt5@@0GVw*21Ns7Y7!FAM$BV6oi2wfCsc
WhO4sj8~BpKEoX66S0x<0Hw6H|iuUdR

literal 0
HcmV?d00001

diff --git a/meta-arm/uefi-sb-keys/noPK.esl b/meta-arm/uefi-sb-keys/noPK.esl
new file mode 100644
index 00000000..e69de29b
-- 
2.45.2


