Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65316C52D7C
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 19:04:54 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.1081.1724094284426175061
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Aug 2024 12:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qA6vawxw;
 spf=pass (domain: linaro.org, ip: 209.85.219.54, mailfrom: javier.tia@linaro.org)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6bf790944f1so22920876d6.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 19 Aug 2024 12:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724094283; x=1724699083; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4i8i4tDl/w+2Hz1m76fbFHZdoBoOcID//NRfTskNKvw=;
        b=qA6vawxw0C8gn32R3xXKtrqeBylBmLo4oTYSvvTHDtb2hcfWRzVMcoY/YvfeHSeT0k
         tVVV5Yte4OTtnsxMoa7Cv0LcCPvaPWm+8ViLI2+ZXPfujr+DuU65WNh+nez8IYUd2YnL
         YfQ6jz2gZNqwiV5RYFOXKsdvC/t6Q032g3KstGFp+Pgd2oUh+s7rpAqZkRpc6juNMun/
         17F/lDoPVC7OCNqX9KI65ZSM+YfrtHGghsqGu8xwFaezVkXaBtwqM1IU4c85u00MZsjB
         +3J+Yqx3wm29SCLMkoxryCFM2zh+NPYO7UltIyoMmL5PxOm/ALSVGjKZqM1nPwxsGTHX
         B70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724094283; x=1724699083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4i8i4tDl/w+2Hz1m76fbFHZdoBoOcID//NRfTskNKvw=;
        b=ZCXh0B3OzQhJLCfjA2gvza6R7WylsoSVEAHUpLbNY8htjCiDtEUW2G47tTBatawZ3S
         eytEok+8KGZi37qmj9cLUGqepSmrP6CzOlVk/TIJLWgn5egQJ0wQ689xZP1bmO3mE5P6
         PjTt3XhH97AHwIvIeEzMBDim/gFYVNna0QTM8FDyS8M9dzCNekArN3bMOcsERp29v6Ab
         TOac2aBvzCn7UCTwgIwN2EZoeL9C9GAa5zKQqIpyS4cR0h1v66einfhFt9O8clwgISO5
         Y+YX6BwXMbu1O51tDbOVWn85DUU8ULblT1OjVetVa8eO9GOWDMFiKCV6ZOWthOdXIiEB
         ISQg==
X-Gm-Message-State: AOJu0Yw1CxNW9X8xM06hZtzJtLDz3Vq7pFIAfo5yezPaRBfSLROmEsHS
	jQpl5gS/0yBNAv/1nFi+7bV6LBiSDNWrF4JVMxjmHWHjpURo1DBGGtarulCcTyEZTN11CBOw/Pd
	C
X-Google-Smtp-Source: AGHT+IEcsisHO0WerHea0suK8gTWMUtdXGVaMkMTiK/aflctPHDxVQMBckK+rFuWXkeA02yw6T1VWw==
X-Received: by 2002:a0c:ff28:0:b0:6bf:8891:e305 with SMTP id 6a1803df08f44-6bf8891e505mr74266436d6.17.1724094283107;
        Mon, 19 Aug 2024 12:04:43 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([177.93.4.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fe06feasm45371756d6.40.2024.08.19.12.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 12:04:42 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v2 08/14] u-boot: Setup UEFI and Secure Boot
Date: Mon, 19 Aug 2024 13:04:23 -0600
Message-ID: <20240819190429.2897888-9-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819190429.2897888-1-javier.tia@linaro.org>
References: <20240819190429.2897888-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 19 Aug 2024 19:04:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5974

Add U-Boot minimal UEFI definitions.

Embedded UEFI variables with the keys previously generated. It's to
enable UEFI Secure Boot and verify the authenticity of the firmware and
operating system.

When U-Boot is built with UEFI support, it includes a set of efivars
that are used to store the Secure Boot variables. These efivars are
embedded in the U-Boot binary and are stored in the flash memory of the
system.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 .../u-boot/u-boot-qemuarm64-secureboot.inc     | 18 ++++++++++++++++++
 .../u-boot/u-boot/uefi-secureboot.cfg          | 10 ++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend       |  2 +-
 3 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-qemuarm64-secureboot.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/uefi-secureboot.cfg

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-qemuarm64-secureboot.inc b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-qemuarm64-secureboot.inc
new file mode 100644
index 00000000..ffad08e4
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-qemuarm64-secureboot.inc
@@ -0,0 +1,18 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://uefi-secureboot.cfg"
+
+UBOOT_BOARDDIR = "${S}/board/emulation/qemu-arm"
+UBOOT_ENV_NAME = "qemu-arm.env"
+
+DEPENDS += 'python3-pyopenssl-native'
+
+do_compile:prepend() {
+    export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1
+
+    "${S}"/tools/efivar.py set -i "${S}"/ubootefi.var -n pk  -d "${UEFI_SB_KEYS_DIR}"/PK.esl  -t file
+    "${S}"/tools/efivar.py set -i "${S}"/ubootefi.var -n kek -d "${UEFI_SB_KEYS_DIR}"/KEK.esl -t file
+    "${S}"/tools/efivar.py set -i "${S}"/ubootefi.var -n db  -d "${UEFI_SB_KEYS_DIR}"/db.esl  -t file
+    "${S}"/tools/efivar.py set -i "${S}"/ubootefi.var -n dbx -d "${UEFI_SB_KEYS_DIR}"/dbx.esl -t file
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
index 11f332ad..ee815b6a 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -5,6 +5,6 @@ MACHINE_U-BOOT_REQUIRE:corstone1000 = "u-boot-corstone1000.inc"
 MACHINE_U-BOOT_REQUIRE:fvp-base = "u-boot-fvp-base.inc"
 MACHINE_U-BOOT_REQUIRE:juno = "u-boot-juno.inc"
 MACHINE_U-BOOT_REQUIRE:tc = "u-boot-tc.inc"
+MACHINE_U-BOOT_REQUIRE += "${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'u-boot-qemuarm64-secureboot.inc', '', d)}"
 
 require ${MACHINE_U-BOOT_REQUIRE}
-
-- 
2.46.0


