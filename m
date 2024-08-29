Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FB7C87FC3
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 16:32:26 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.24043.1724949142673106422
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Aug 2024 09:32:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qcvEtgzb;
 spf=pass (domain: linaro.org, ip: 209.85.128.173, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6c130ffa0adso8991607b3.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 09:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724949142; x=1725553942; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4i8i4tDl/w+2Hz1m76fbFHZdoBoOcID//NRfTskNKvw=;
        b=qcvEtgzb/OxOn2937UlSx1bJihcMoTOGOWatHfytJRP4EVBV/5ceemBbUrX7yrZgoz
         rsHOSzXzLOiw+KAsoDMipgL+lxjBUZie2zzWtdsxUlguLG9N8UTW/VHGRsdhi8i3QSMg
         +4Wqgv6Uh8NUG4i7DhD8JxFCC8j7i3Hy3lF0p3Gu1oGhyISPa93xsw58ycqxEVDY2C/w
         2gDQCl3yCFdYzDj1rgdnCTKM2oLUEYwayuHzOg8gdAbMf6wbQqtmPcbyy/MrF0YdsZQ4
         twY/k71y0WcJ+fMrYRJYVSqWTmt8d2rXij+ExSqh6jSVnV184VWu6lzhAvIhc0bVYVm4
         E0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724949142; x=1725553942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4i8i4tDl/w+2Hz1m76fbFHZdoBoOcID//NRfTskNKvw=;
        b=fug/aw3XeZlyLxWRZiFVOBhMXg8SMlcjz5DFILJhAI5wnGrVgr4wam9XTw0G7APqoL
         rw+teRPGblmM8wGne8u6Xqfzs3pUzdSh8075Yxei7hWD6t/LV9vCBVSFO42RRaK3BGy9
         Z2QRpPShrNX0bYApm7VEw4LPC/evuQat1DfPeVqROl2P+xpz1qoj+jh1g0SB8MEJQ7QF
         Y7gTPfs/DLiPttJrqQW/prT/EBhqCkvG63GSUe5Z+wTnthhQMkAJSZgcgTw4JULbNM+K
         TM/BQYlzXXbaowgdJuLT2BM2iTHYbVP2KKEDV9YMQrAYF38o7FuI6l2V2AGY3oIBixPo
         +RQw==
X-Gm-Message-State: AOJu0YxEV42tu5NqI8LLMuVcdzpCryAD4ZCezuZZwes+AxP+8aBatucH
	BQ9tU5wgNdP1SnNmXw3dBlFT0RdCfjZGhEEz26+L1qhD+fmUMrESh2VB42TqtsQ4f5r+OWoBbQ4
	Q
X-Google-Smtp-Source: AGHT+IF6PhjOiWfQd7E9Qfb0BXuPfNiHpDKjbs71AVPhF6KnDdiKDYiddAl5ASWJ5LdoSM9HlHcTSQ==
X-Received: by 2002:a05:690c:6206:b0:6b2:1b65:4c05 with SMTP id 00721157ae682-6d2764fa003mr40222297b3.17.1724949141740;
        Thu, 29 Aug 2024 09:32:21 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d438e18asm2993517b3.60.2024.08.29.09.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 09:32:21 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v4 08/13] u-boot: Setup UEFI and Secure Boot
Date: Thu, 29 Aug 2024 10:32:04 -0600
Message-ID: <20240829163209.47945-9-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240829163209.47945-1-javier.tia@linaro.org>
References: <20240829163209.47945-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 16:32:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6018

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


