Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE9CC41513
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 20:35:59 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.4184.1721334955306142850
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jul 2024 13:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=SVpfsg68;
 spf=pass (domain: linaro.org, ip: 209.85.128.180, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-661d7e68e89so9729487b3.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jul 2024 13:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721334954; x=1721939754; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ijs/PqslDJCjWaUWOXOubABw9algRuVzD/iiwfcaJI=;
        b=SVpfsg68z2XjIQLW2LVCLttQ9mgUL3E80uk1DyxVUBXbt9iazmjP0+RBpHgPIMwLXi
         Jyu1EritmxCMjzDxoIGX//gswmp7WYx6wCxZcQA1S5fbc1ETDSoCapQF5UUnAZ12LjLx
         S6Gfp5JJOpCO8G8uQEhg6bH0F8NU6mN8CWTenQguKCxYtgUtLU5WEkYLvbE6ISo0vLln
         wHMgn1VujHPVpQG2aCnJPUundzvNhThHKjBtSDZOzH+dvI2bK4JQv5u6KQa0fXJhS9FL
         QYuZJf5Nap2bcSrlz7xpbAjZoFek4xzw8vsCItnLYNXTqK/XWI97wDapTH55Xzq2fQK/
         LhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721334954; x=1721939754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ijs/PqslDJCjWaUWOXOubABw9algRuVzD/iiwfcaJI=;
        b=pytL18OrhddhpI2qLPhhwCFtcI1xAeAPXk68DO/dNQtm2Hfw5+LiAsSU8oCjRuO7MP
         B9N+YqXi7RSQZ/cpu58x5cugD6NEXuYPiN8CFJoS0VjgJq+8ddAkivZIQPYf4hBgTIWs
         ZQ6T+H5XqsxTSNZFQ/n04dwnXFjeaKrWP8t+SJcTxUg4zpZQqgvzRedncAO+mw+zn9iw
         HwNdG6GXqyzRyt1jGzcwULIfPYb09Qd2DXY04HlWtzrEkV8nXYtXz1oYb+bezAq6UgnS
         Ns7GI638OlPmJAdJ6EDYtit4kAbNj7HYVNy6FSD5YNMn7W12YxrRN0QLpZJJfF03IDnX
         z+Sw==
X-Gm-Message-State: AOJu0Yx9O5W0dHa4e5JMWJ00+2V5y99vcmPlLWTMOkjDf+6zyF11q+1S
	Xq2jp/j5iH1KQn/VAswZSscD9Gv5AmARBO1xWddzlI0rP8KwlRkttoMc00QfvXe/0XXG4fhSaLE
	5wDQ=
X-Google-Smtp-Source: AGHT+IHWE8RTlipkVR/rrPMHHZHRaetrxS9OmNe8brRDpa/F/eRvksblcWJkiKAOQoauj0henlKbxg==
X-Received: by 2002:a05:690c:298:b0:644:4a1c:1868 with SMTP id 00721157ae682-6660f319993mr28502237b3.24.1721334954294;
        Thu, 18 Jul 2024 13:35:54 -0700 (PDT)
Received: from localhost.localdomain ([190.171.102.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6695245a1dasm171657b3.53.2024.07.18.13.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 13:35:54 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v1 4/7] qemuarm64-secureboot: Setup UEFI and Secure Boot in u-boot
Date: Thu, 18 Jul 2024 14:35:23 -0600
Message-ID: <20240718203526.52214-5-javier.tia@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240718203526.52214-1-javier.tia@linaro.org>
References: <20240718203526.52214-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Jul 2024 20:35:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5903

Add u-boot minimal UEFI definitions. Setup UEFI variables with the keys
previously generated.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 .../u-boot/u-boot-qemuarm64-secureboot.inc     | 18 ++++++++++++++++++
 .../qemuarm64-secureboot.cfg                   | 10 ++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend       |  1 +
 3 files changed, 29 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-qemuarm64-secureboot.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/qemuarm64-secureboot/qemuarm64-secureboot.cfg

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-qemuarm64-secureboot.inc b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-qemuarm64-secureboot.inc
new file mode 100644
index 00000000..0a0accd1
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
+    export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1
+
+    "${S}"/tools/efivar.py set -i "${S}"/ubootefi.var -n pk  -d "${UEFI_SB_KEYS_DIR}"/PK.esl  -t file
+    "${S}"/tools/efivar.py set -i "${S}"/ubootefi.var -n kek -d "${UEFI_SB_KEYS_DIR}"/KEK.esl -t file
+    "${S}"/tools/efivar.py set -i "${S}"/ubootefi.var -n db  -d "${UEFI_SB_KEYS_DIR}"/db.esl  -t file
+    "${S}"/tools/efivar.py set -i "${S}"/ubootefi.var -n dbx -d "${UEFI_SB_KEYS_DIR}"/dbx.esl -t file
+    "${S}"/tools/efivar.py print -i "${S}"/ubootefi.var
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
 
-- 
2.45.2


