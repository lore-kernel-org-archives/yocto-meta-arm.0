Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D976CF34CA
	for <webhook@archiver.kernel.org>; Thu,  3 Oct 2024 21:33:59 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web10.8291.1727991232180168104
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Oct 2024 14:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=zTBmSxQw;
 spf=pass (domain: linaro.org, ip: 209.85.217.43, mailfrom: javier.tia@linaro.org)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4a28a1ae1adso545824137.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 03 Oct 2024 14:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727991231; x=1728596031; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iox566YZPmfCMI9TqMPtHhEhrC0flA8NU9SYsQqRKGc=;
        b=zTBmSxQwNKTU04cLZ4XFdgSntn59XBJXxpeKe2ZNnU5I4ybNJJMdD32D37GVXdH5Oq
         cvC4FR3hX6cvI+NXx6D9mpvACEVWC9qnaU/jOKxRnvUQJ51ltmG/vL2x8Z8uriHtRCvV
         2ooVVg9sSgL5Tp+VLM6E1lt2/kaNF8ZhqxgM9SwrKIJw5KSzYwam+TQcF95j0zAO5dtG
         9WcafuAbkW+bra4BvqEkF+j8B8JYBNJbYaoUMhlGoQ+EcL213w3HzX/MDlgiUl5ax3F4
         ut3f6Ske836ztnlw+9BncigOxWTgWv8Mlg+zw0HKMDHep+Pdr1HwUNeCykoON+isaufV
         Q7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727991231; x=1728596031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iox566YZPmfCMI9TqMPtHhEhrC0flA8NU9SYsQqRKGc=;
        b=E42YP0r2oA4xLH77ViZW5HxpjJPRJM9rt6BkwJV/wz1ZObo8KBCWAc8zDMSsLdJ9ey
         v1oYAbs/CoayQWkR50IM7y1/nWKlwF9GsvTyEf0wZ3La882SOCENjz2ejMUY2G7IE3JC
         11gVVt1CEoPFu9d0uhmkWJkFptSGNVQKK43/2Y3kjLeQbzctOBHjyUnCCewo1QAhIpCf
         xPYgI5c8BSgSoRrDm77+b94Z2Vq3JquqgNdUDEhNqlpaIhYqaNUAnLz7cjhE2HAILa79
         WLuX44uFVePfHt4hsTwH4au5J4hO3xtfoS6/oflLtc7X4rfe8SzVfxGrn7cldvvnyLHJ
         4qow==
X-Gm-Message-State: AOJu0YwTpzz3w5vC817KyE6HksbbWfJah70RjmdEbr5hk98+vSiZ6nue
	wAdUJGHPL6uvqjSNNhOA6ZdOAckA5gKxlLD0vmTPeFp5BYtbj6SvMtPrMFxXa6zdq6TA/iSqoMn
	H
X-Google-Smtp-Source: AGHT+IFZc4sqTyBdnBp7skbKjG8AoGquaERKSAgHGMqBrEkdinZ/A5hUPje4fgbAGMeOLvkjtUEjLg==
X-Received: by 2002:a05:6102:f0b:b0:49b:f255:179a with SMTP id ada2fe7eead31-4a405749686mr769722137.5.1727991230682;
        Thu, 03 Oct 2024 14:33:50 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4a3f9bad33esm287545137.13.2024.10.03.14.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 14:33:50 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v8 2/2] arm/qemuarm64-secureboot: Enable UEFI Secure Boot
Date: Thu,  3 Oct 2024 15:33:30 -0600
Message-ID: <20241003213330.627644-3-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003213330.627644-1-javier.tia@linaro.org>
References: <20241003213330.627644-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 03 Oct 2024 21:33:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6165

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

$ kas build ci/qemuarm64-secureboot.yml:ci/meta-secure-core.yml:ci/uefi-secureboot.yml:ci/testimage.yml
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
 ci/uefi-secureboot.yml                        | 36 +++++++++++++++++++
 .../lib/oeqa/runtime/cases/uefi_secureboot.py | 29 +++++++++++++++
 3 files changed, 66 insertions(+)
 create mode 100644 ci/uefi-secureboot.yml
 create mode 100644 meta-arm/lib/oeqa/runtime/cases/uefi_secureboot.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e37f9d20..fcdae9f4 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -264,6 +264,7 @@ qemuarm64-secureboot:
         TOOLCHAINS: [gcc, clang]
         TCLIBC: [glibc, musl]
         TS: [none, qemuarm64-secureboot-ts]
+        UEFISB: [none, uefi-secureboot]
         TESTING: testimage
       - KERNEL: linux-yocto-dev
         TESTING: testimage
diff --git a/ci/uefi-secureboot.yml b/ci/uefi-secureboot.yml
new file mode 100644
index 00000000..0684266f
--- /dev/null
+++ b/ci/uefi-secureboot.yml
@@ -0,0 +1,36 @@
+# yaml-language-server: $schema=https://raw.githubusercontent.com/siemens/kas/master/kas/schema-kas.json
+
+# UEFI Secure Boot: A mechanism to ensure that only trusted software is executed
+# during the boot process.
+
+header:
+  version: 14
+  includes:
+    - ci/meta-openembedded.yml
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
+    IMAGE_INSTALL:append = " systemd systemd-boot util-linux coreutils"
+
+    TEST_SUITES:append = " uefi_secureboot"
\ No newline at end of file
diff --git a/meta-arm/lib/oeqa/runtime/cases/uefi_secureboot.py b/meta-arm/lib/oeqa/runtime/cases/uefi_secureboot.py
new file mode 100644
index 00000000..bdd97f5e
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
+        cmd = "echo $( od -t u2  -A n -j 4 -N 4 /sys/firmware/efi/efivars/SecureBoot-8be4df61-93ca-11d2-aa0d-00e098032b8c )"
+        status, output = self.target.run(cmd, timeout=120)
+        self.assertEqual(output, "1", msg="\n".join([cmd, output]))
-- 
2.46.2


