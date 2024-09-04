Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0D4CD4F47
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 22:44:01 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web11.63666.1725489839330412216
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Sep 2024 15:43:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=kGFw6EfY;
 spf=pass (domain: linaro.org, ip: 209.85.222.45, mailfrom: javier.tia@linaro.org)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-846bc2104c8so115776241.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 04 Sep 2024 15:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725489838; x=1726094638; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PoxNITYWPcj8otBoh5aRQB7jtLca5oxAprVM/MsmfnI=;
        b=kGFw6EfYpqF/oY6V5Y4Hi0N8bCSxpAx4rTmcf1/hXtAzG1Dv0Nke0lHhlA+uD9NN7g
         Ob81+yDPD1hJlOSRCy494imqqujc2apPZC0Qt/LJ6tn3KiDRHBXXs8kLPJK7+uoJn3Oq
         4ZqLyTmwIlF1rl3IhTjIJ0zoqnqF1rVsH2eVoaB27vrIV14+1T1836rs02u/69QBj6Ac
         aDuhuocmDt8kBhHPuUQCEfKyAyio6HYJERnVwRPRgMAsoo7RWCoBGv1otAIxg7ux5UBp
         UdqM1D+8GQRYYmVxpfheiqGlzdD5kEuxLOWdI4UqeQZECGCq1nUFFoUWZFRjUtbJc5je
         Jz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725489838; x=1726094638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PoxNITYWPcj8otBoh5aRQB7jtLca5oxAprVM/MsmfnI=;
        b=RD+mUXJVjHHc6T++BZfvZroHuACLQGgR9WoU8TvOtpZ/wXH2oyJlUbrqe5MZsFqpqc
         GuOl2wihMvEu15A3/xbYZaxewMVw0Vpjuehkqv4eqIznrajz/c/8izMFYEMrHKJuu71y
         cy4n5VVKCEGvOGtRgGmvYX4lEMPT1ZeIz2U5Lwl5Ui5eA9RSSzQVp3hCDXrqfzPOnTsC
         bzqVp2IboRZgv/IQkxX90982RSbBVhXd0uZPqVgKjZbhS4Nzw93lEtbPlCFmhzDBCvN6
         aEhOdrNUS/e+LPQHsQq5lm8Fhl4L7cmBo5ot4KvtwCg9qkzxqSZkTkji86Nd8Ai6kw5E
         Z+LA==
X-Gm-Message-State: AOJu0Yy197PENIXt9xAew23KTf4pCGAoTqDRqlyh2h5lVFj/fRIO6AMZ
	TI623bXL6xEmWQVK/gJmgTzjgkTvfpAol+lUB6QYUAI5vSuTKI1giGvWjrirLJNIyY+R22bBWJV
	N
X-Google-Smtp-Source: AGHT+IGpOagXMIwxXtYRDzT1hZfilBwymHswBlqchVRf+QXgpZ8sH7rnYZgHus3wbQtJGD/LeFlCXw==
X-Received: by 2002:a05:6102:3596:b0:498:f38a:2c5a with SMTP id ada2fe7eead31-49bba5d92camr2932701137.2.1725489838081;
        Wed, 04 Sep 2024 15:43:58 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-49bc733df39sm167299137.9.2024.09.04.15.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 15:43:57 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v5 2/2] qemuarm64-secureboot: Enable UEFI Secure Boot
Date: Wed,  4 Sep 2024 16:43:49 -0600
Message-ID: <20240904224349.108885-3-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904224349.108885-1-javier.tia@linaro.org>
References: <20240904224349.108885-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 Sep 2024 22:44:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6063

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

Add one test to verify Secure Boot using OE Testing infraestructure:

$ kas build ci/qemuarm64-secureboot.yml:ci/testimage.yml
...
RESULTS - uefi_secureboot.UEFI_SB_TestSuite.test_uefi_secureboot: PASSED (0.62s)
...
SUMMARY:
core-image-base () - Ran 73 tests in 28.281s
core-image-base - OK - All required tests passed (successes=19, skipped=54, failures=0, errors=0)

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 ci/qemuarm64-secureboot.yml                   |  1 +
 ci/uefi-secureboot.yml                        | 34 +++++++++++++++++++
 .../lib/oeqa/runtime/cases/uefi_secureboot.py | 29 ++++++++++++++++
 3 files changed, 64 insertions(+)
 create mode 100644 ci/uefi-secureboot.yml
 create mode 100644 meta-arm/lib/oeqa/runtime/cases/uefi_secureboot.py

diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
index b26941e0..7866adbb 100644
--- a/ci/qemuarm64-secureboot.yml
+++ b/ci/qemuarm64-secureboot.yml
@@ -4,6 +4,7 @@ header:
   version: 14
   includes:
     - ci/base.yml
+    - ci/uefi-secureboot.yml
 
 machine: qemuarm64-secureboot
 
diff --git a/ci/uefi-secureboot.yml b/ci/uefi-secureboot.yml
new file mode 100644
index 00000000..d65beed3
--- /dev/null
+++ b/ci/uefi-secureboot.yml
@@ -0,0 +1,34 @@
+# yaml-language-server: $schema=https://raw.githubusercontent.com/siemens/kas/master/kas/schema-kas.json
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
+    WKS_FILE = "efi-disk-no-swap.wks.in"
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
\ No newline at end of file
diff --git a/meta-arm/lib/oeqa/runtime/cases/uefi_secureboot.py b/meta-arm/lib/oeqa/runtime/cases/uefi_secureboot.py
new file mode 100644
index 00000000..9e47ea8d
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
2.46.0


