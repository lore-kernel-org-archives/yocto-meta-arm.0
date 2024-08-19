Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FAD2C5320E
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 19:04:54 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.1053.1724094290244566162
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Aug 2024 12:04:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uhBdPLig;
 spf=pass (domain: linaro.org, ip: 209.85.219.47, mailfrom: javier.tia@linaro.org)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6bf66fe9d8bso24238826d6.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 19 Aug 2024 12:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724094289; x=1724699089; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Sw6qgwfeoRcTz5HRF/e7ri5lXvqhu/5iyjFHNupvjw=;
        b=uhBdPLigHB/uNvn2SZg8Pl7neHyFE97SgHKlyrrIX6dMnM6Bky/qUBmfZiKUAkk6I5
         lA/a1RWQRmeM6vd6hyEmxTsAfUFhYzKW8o5wKKwIRh88ACfzTiRemMiKUa5xOrmk0k/U
         ksC6haOccRfYO2O0dQwUFT2fQkAisOF51deanuvs6tHloIxEj26UyrPSC3+1TQU/IuNK
         7agGaeQMtugh6I968B5oWDEgN0J/rfyVdHhpjNJX57aZOo5rq4hq58yHO4E2MWgOoy7N
         4PaaJ2rB+OeR6cADOHi6dd5F9RtzqaerBDykC237D7M0KRJFQGxG2qHbEbX631CbZZYA
         +Dmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724094289; x=1724699089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Sw6qgwfeoRcTz5HRF/e7ri5lXvqhu/5iyjFHNupvjw=;
        b=qsn07xPrFd1dRNFFaScvjg6P1wFRPHjT/pPwICDOSJrxh6Gf8a/KuTUB5iaGDVq072
         jX2AkJnA4y0JjgumW/LigRFo7/0kRaDU6eWeFsAgp4Av5JHFlMtE9/IZpch5ao1NbSg9
         ZvceuCGfwJ6O+a/ja6MUcIVbg2v/HdR7cyN4Htl82PfJw8RHYcPCYewuRBIzE5Yc0ya/
         IRHc0p0YmAA19Bp0fwD0RQRq2snEX3ALFLHf8M/mbFnjD/v0cr2xz3Kq5V9rNFxp/3lM
         IM3mQLi7mAWech9iyiFZUQAAxd4jJUjRpOAUkY+JNDnseHsftYI8XrRo9amVzK3St9hd
         /ZMg==
X-Gm-Message-State: AOJu0YyWRMgCMFi4zlxLsz7nNqnrCybR3lkqd6/MwppSuoQtIH+BsFtF
	uWgLK8BMQFCviqHC8TlD80mfqlUviM80ygQrmPKNdy2T12xgCj5HByajNPmjtpP3DifCmKigdkP
	o
X-Google-Smtp-Source: AGHT+IEeteqhkpxN5ynqyLm0/NkL9SqrT+N6qszSsT2+H9pLi5sI/C3/lm80K9BxeUc6YTH4feCueA==
X-Received: by 2002:a05:6214:2b87:b0:6bf:7a30:f438 with SMTP id 6a1803df08f44-6bf7ce517cfmr159380276d6.22.1724094289145;
        Mon, 19 Aug 2024 12:04:49 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([177.93.4.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fe06feasm45371756d6.40.2024.08.19.12.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 12:04:48 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v2 13/14] meta-arm: Add UEFI Secure Boot test
Date: Mon, 19 Aug 2024 13:04:28 -0600
Message-ID: <20240819190429.2897888-14-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819190429.2897888-1-javier.tia@linaro.org>
References: <20240819190429.2897888-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 19 Aug 2024 19:04:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5979

Add a test to verify UEFI Secure Boot is enabled

Run the test:

kas build 'ci/qemuarm64-secureboot.yml:ci/testimage.yml'

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 ci/qemuarm64-secureboot.yml                   |  2 ++
 .../core-image-base-uefi-secureboot.inc       |  6 +++-
 .../oeqa/runtime/cases/uefi_secure_boot.py    | 32 +++++++++++++++++++
 3 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/lib/oeqa/runtime/cases/uefi_secure_boot.py

diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
index 958a1ff1..02341934 100644
--- a/ci/qemuarm64-secureboot.yml
+++ b/ci/qemuarm64-secureboot.yml
@@ -11,6 +11,8 @@ local_conf_header:
   optee: |
     IMAGE_INSTALL:append = " optee-test optee-client optee-os-ta"
     TEST_SUITES:append = " optee ftpm"
+  uefi_secure_boot: |
+    TEST_SUITES:append = " uefi_secure_boot"
 
 machine: qemuarm64-secureboot
 
diff --git a/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc b/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
index e5cf7760..ce64b8b5 100644
--- a/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
+++ b/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
@@ -10,4 +10,8 @@ QB_DEFAULT_KERNEL = "none"
 
 KERNEL_IMAGETYPE = "Image"
 
-IMAGE_INSTALL += "systemd systemd-boot"
+IMAGE_INSTALL += "systemd systemd-boot util-linux coreutils efivar"
+
+inherit extrausers
+
+EXTRA_IMAGE_FEATURES += "allow-root-login empty-root-password"
diff --git a/meta-arm/lib/oeqa/runtime/cases/uefi_secure_boot.py b/meta-arm/lib/oeqa/runtime/cases/uefi_secure_boot.py
new file mode 100644
index 00000000..4a62b54c
--- /dev/null
+++ b/meta-arm/lib/oeqa/runtime/cases/uefi_secure_boot.py
@@ -0,0 +1,32 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+import os
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.runtime.decorator.package import OEHasPackage
+from oeqa.core.decorator.oetimeout import OETimeout
+
+
+class UEFI_SB_TestSuite(OERuntimeTestCase):
+    """
+    Validate Secure Boot is Enabled
+    """
+
+    @OETimeout(1300)
+    def test_uefi_secure_boot(self):
+        # Validate Secure Boot is enabled by checking
+        # 8be4df61-93ca-11d2-aa0d-00e098032b8c-SecureBoot.
+        # The GUID '8be4df61-93ca-11d2-aa0d-00e098032b8c' is a well-known
+        # identifier for the Secure Boot UEFI variable. By checking the value of
+        # this variable, specifically
+        # '8be4df61-93ca-11d2-aa0d-00e098032b8c-SecureBoot', we can determine
+        # whether Secure Boot is enabled or not. This variable is set by the
+        # UEFI firmware to indicate the current Secure Boot state. If the
+        # variable is set to a value of '0x1' (or '1'), it indicates that Secure
+        # Boot is enabled. If the variable is set to a value of '0x0' (or '0'),
+        # it indicates that Secure Boot is disabled.
+        cmd = "efivar -d -n 8be4df61-93ca-11d2-aa0d-00e098032b8c-SecureBoot"
+        status, output = self.target.run(cmd, timeout=120)
+        self.assertEqual(output, "1", msg="\n".join([cmd, output]))
-- 
2.46.0


