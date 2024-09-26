Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A4BCCDE017
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 15:47:47 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.47366.1727365664571022975
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Sep 2024 08:47:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=13OGJURE;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4583068795eso8318871cf.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 26 Sep 2024 08:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1727365663; x=1727970463; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZw7Gt9Oav6RjglQ5lIw9mp2qpi1ZjslzBC6PMijJy8=;
        b=13OGJURE45Y8WDhfZ6prQ/Pjsn2+Pp0r/7Kf1KZtD2fRlqIcbjnuqs/8wl/Korpw9y
         VgkuPw4fxi3Thufvz/tEquLqAmUMb1c+YWOhJux7e+5tJzN7sEtOaKHAS8/1xwWfAjWl
         PifWD92zRNtU71L7+D0YBUcTj6cE5IQ9DZ2f1XeZzYjEY1S91coH2TUYLaq+nd9jJkYn
         ctbJ1aE3/z8Qdt6x2YVJa3ruRgIL0/DfspFHt9AasC4uAUorcmnsgtYxfoh/9T/ebrVU
         x4sT0IeSs7Uyd+vLPQJSnM6TUCEVyE1Y8/jk6HAsJ4XrujZO7t3sgvVxxfxVT90sAs24
         anfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727365663; x=1727970463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZw7Gt9Oav6RjglQ5lIw9mp2qpi1ZjslzBC6PMijJy8=;
        b=pWYU+PfEyTL0H8V4t96SYhWNZF9jMIoV8D20fYo2Gn1S4gXuHKQM5/AWdazauuHcGm
         cecQ0W+4KZnZdKl8xMZIAnNE4y89ofk2lvO9FCaO6WQwnDf2mg6iRDuDqGpkibvAld44
         6BtVoHfGaZmcQMF+/My4cHwm936C6d0h9VNcc5pPjmA7VMVNRMqzLwJQ7x0JtprC/kro
         VzSxt359AkHOideH4v9Tr3gIPpIW9YRWfZRTEAKXf5yHKZ9VAuN5mgNt+7bP4pu0kShD
         zPorfOKI7uRxs2od0fqgQM9DNv7Fo0medv0vqxoTS4ebuNy+UqPbbAZKyqDd/6lewj9O
         jcFQ==
X-Gm-Message-State: AOJu0Yzb7krI3jERwUXcUhwTorikWA+3Jn3cut4zEsSfEX4l058rS128
	u0E/XIJIS8+jmR4+WKgmhVAqiW/s6/ZuxiVW6jSq6DbH01S8TG+WUKxGAu7qzC6ZW814pEiouvU
	=
X-Google-Smtp-Source: AGHT+IEtVw4ByWlJWn9a333HWf7CfPiADVl2liON+GQCCUBl6u5Tcy82fXSZRVZdZFLT3cgugw2HEg==
X-Received: by 2002:a05:622a:143:b0:458:571c:f9b3 with SMTP id d75a77b69052e-45c9f1bea1dmr620971cf.1.1727365663293;
        Thu, 26 Sep 2024 08:47:43 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45c9f2e0cfasm41601cf.43.2024.09.26.08.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 08:47:42 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v7 4/4] arm/qemuarm64-secureboot: Enable UEFI Secure Boot
Date: Thu, 26 Sep 2024 11:47:39 -0400
Message-Id: <20240926154739.2379609-5-jon.mason@arm.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6121

From: Javier Tia <javier.tia@linaro.org>

Encapsulate all UEFI Secure Boot required settings in one Kas
configuration file.

Introduce SBSIGN_KEYS_DIR variable where UEFI keys will be generated
to sign UEFI binaries. 

Introduce uefi-secureboot machine feature, which is being used to
conditionally set the proper UEFI settings in recipes.

Replace Grub bootloader with systemd-boot, which it makes easier to
enable Secure Boot.

Advantages using systemd as Init Manager:

- Extending secure boot to userspace is a lot easier with systemd than
with sysvinit where custom scripts will need to be written for all use
cases.

- systemd supports dm-verity and TPM devices for encryption usecases out
of the box. Enabling them is a lot easier than writing custom scripts
for sysvinit.

- systemd also supports EUFI signing the UKI binaries which merge kernel,
command line and initrd which helps in bringing secure boot towards
rootfs.

- systemd offers a modular structure with unit files that are more
predictable and easier to manage than the complex and varied scripts
used by SysVinit. This modularity allows for better control and
customization of the boot process, which is beneficial in Secure Boot
environments.

- Add CI settings to build and test UEFI Secure Boot.

Add one test to verify Secure Boot using OE Testing infraestructure:

$ kas build ci/qemuarm64-secureboot.yml:ci/uefi-secureboot.yml:ci/testimage.yml
...
RESULTS - uefi_secureboot.UEFI_SB_TestSuite.test_uefi_secureboot: PASSED (0.62s)
...
SUMMARY:
core-image-base () - Ran 73 tests in 28.281s
core-image-base - OK - All required tests passed (successes=19, skipped=54, failures=0, errors=0)

Signed-off-by: Javier Tia <javier.tia@linaro.org>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                                |  1 +
 ci/uefi-secureboot.yml                        | 37 +++++++++++++++++++
 .../lib/oeqa/runtime/cases/uefi_secureboot.py | 29 +++++++++++++++
 3 files changed, 67 insertions(+)
 create mode 100644 ci/uefi-secureboot.yml
 create mode 100644 meta-arm/lib/oeqa/runtime/cases/uefi_secureboot.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e8627731e244..1ea167c63d8e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -272,6 +272,7 @@ qemuarm64-secureboot:
         TOOLCHAINS: [gcc, clang]
         TCLIBC: [glibc, musl]
         TS: [none, qemuarm64-secureboot-ts]
+        UEFISB: [none, uefi-secureboot]
         TESTING: testimage
       - KERNEL: linux-yocto-dev
         TESTING: testimage
diff --git a/ci/uefi-secureboot.yml b/ci/uefi-secureboot.yml
new file mode 100644
index 000000000000..fd95b876943c
--- /dev/null
+++ b/ci/uefi-secureboot.yml
@@ -0,0 +1,37 @@
+# yaml-language-server: $schema=https://raw.githubusercontent.com/siemens/kas/master/kas/schema-kas.json
+
+# UEFI Secure Boot: A mechanism to ensure that only trusted software is executed
+# during the boot process.
+
+header:
+  version: 14
+  includes:
+    - ci/meta-openembedded.yml
+    - ci/meta-secure-core.yml
+
+local_conf_header:
+  uefi_secureboot: |
+    SBSIGN_KEYS_DIR = "${TOPDIR}/sbkeys"
+    BB_ENV_PASSTHROUGH_ADDITIONS = "SBSIGN_KEYS_DIR"
+
+    # Detected by passing kernel parameter
+    QB_KERNEL_ROOT = ""
+
+    # kernel is in the image, should not be loaded separately
+    QB_DEFAULT_KERNEL = "none"
+
+    WKS_FILE = "efi-disk.wks.in"
+    KERNEL_IMAGETYPE = "Image"
+
+    MACHINE_FEATURES:append = " efi uefi-secureboot"
+
+    EFI_PROVIDER = "systemd-boot"
+
+    # Use systemd as the init system
+    INIT_MANAGER = "systemd"
+    DISTRO_FEATURES:append = " systemd"
+    DISTRO_FEATURES_NATIVE:append = " systemd"
+
+    IMAGE_INSTALL:append = " systemd systemd-boot util-linux coreutils efivar"
+
+    TEST_SUITES:append = " uefi_secureboot"
diff --git a/meta-arm/lib/oeqa/runtime/cases/uefi_secureboot.py b/meta-arm/lib/oeqa/runtime/cases/uefi_secureboot.py
new file mode 100644
index 000000000000..9e47ea8dfecd
--- /dev/null
+++ b/meta-arm/lib/oeqa/runtime/cases/uefi_secureboot.py
@@ -0,0 +1,29 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.oetimeout import OETimeout
+
+
+class UEFI_SB_TestSuite(OERuntimeTestCase):
+    """
+    Validate Secure Boot is Enabled
+    """
+
+    @OETimeout(1300)
+    def test_uefi_secureboot(self):
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
2.39.5


