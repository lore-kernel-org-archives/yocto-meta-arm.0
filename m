Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1EAC5472D
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 01:43:58 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.4154.1724291032047436550
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Aug 2024 18:43:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=gipI6bAZ;
 spf=pass (domain: linaro.org, ip: 209.85.128.170, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-68518bc1407so3738927b3.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 21 Aug 2024 18:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724291031; x=1724895831; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4i8i4tDl/w+2Hz1m76fbFHZdoBoOcID//NRfTskNKvw=;
        b=gipI6bAZhqsbVnBUCP7FAMO5X+xufmhfdkepr1Npfdb1tSP42i+ITpdcxCvEsuiENA
         dhRn2Pla9H/YB0TeE5ROR3UuAbcgxBUjfH253YNVo2CpVSqrY/F/aPcpHCT69VaSe8wr
         PoQ2cvpI4a+DBgECqrFahs/28PBFR9CxgnbTTnYk/IZFBnEMh4ytTqnA+z3Xiuvj2JTw
         A6ohA9gMrDRRY90Quie98jXeQ1Og/IpZ0Suu5j1eCVxFv1n1Ak4+ubLXjZoOy3FgD2iz
         y+Za6x633mVl4m3lbMNoNva+GuN6wrwIBlRCAzHyGl6tw8C12P8eeY6yzhBV4ZhLc5cT
         A4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724291031; x=1724895831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4i8i4tDl/w+2Hz1m76fbFHZdoBoOcID//NRfTskNKvw=;
        b=gEMnFU4lBtG1mm0l9hcKFiJYDhhnviDRQK2ZF2Avt5VOr4Fu5IdfVg27sCoC5zloJr
         kYvKVpZoWQJ0Ovaw4Q1k+PidbWjQBGp++NPAsebvDA28+zSU9otEYC7VTFFmYq0Ekyec
         +qf8+onJ6+o8FXrv8AyvbIPhPtMBa+9+ODmNih5BbZwlMVQKxF1Tmtx8/J95lak47Mem
         Bt5SqNTN6YnZmZqQd688D+pKH1p3phaeyNXGVbiWPAyOWvPgNp5IDTZwcL+Gbp4M66ex
         0Vn0CqKYpJLp7kioaSdIlO/vY1CgWDNIiuzsnvll10we7LFzaYl2RNntCFv8imEuHTOq
         u1rg==
X-Gm-Message-State: AOJu0YySll6DUOOiv4WJdmGCVjUjx2wTu/HnHLNA+B5dZQcPFxKzOCPJ
	iKm0TpJVNMI6bx3EQEGEOlfic9vxOlDcN+ByY3xS8UHORMO6nvKG2094Mj8VoklvjTQTRFtHUqo
	u
X-Google-Smtp-Source: AGHT+IERBpv9KA5aPLYSKpLN+cMDbmtTUGYoBPOAFSverfy8ZCENdAajSSSKaSflKpitwpxZsd1xVA==
X-Received: by 2002:a05:690c:f10:b0:64b:75d8:5002 with SMTP id 00721157ae682-6c3d149f64amr4524527b3.9.1724291031048;
        Wed, 21 Aug 2024 18:43:51 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39e6eae07sm707757b3.145.2024.08.21.18.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 18:43:50 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v3 08/13] u-boot: Setup UEFI and Secure Boot
Date: Wed, 21 Aug 2024 19:43:30 -0600
Message-ID: <20240822014335.3394568-9-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240822014335.3394568-1-javier.tia@linaro.org>
References: <20240822014335.3394568-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Aug 2024 01:43:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5998

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


