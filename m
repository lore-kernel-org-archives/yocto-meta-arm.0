Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88024CDD56F
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 02:54:18 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web11.10886.1726714457936075416
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Sep 2024 19:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=VEfW/aWv;
 spf=pass (domain: linaro.org, ip: 209.85.221.179, mailfrom: javier.tia@linaro.org)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5010861905bso743621e0c.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 18 Sep 2024 19:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726714457; x=1727319257; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfYQN1FZLOsg1p4vez/5z0QvYTzYNu/ke6pkUpC9YUY=;
        b=VEfW/aWvpehf3bU9x9cJB00t/63c3+GHnfIA9KPNerrnG26FefY9SEFlL3Vlq0Z82q
         ix9ZVi7o98fle7xp4xYu+npimdZ520OoHZ5MFtKhZkpg0Hws4D1iTzxSmfPgXcw/HW8k
         l4F+BSS+GFaDqXog1OLP+WWI27cVxffo3s/k3nQU2wFWt7gXd+CCi3GwSoteJayotsSS
         1dCIB9ZaUZj1loJZDyFi/JOjEy4VClpi8UeRfFE9t6+qdkiuU/iH8pRsTEI9ojfn+EUg
         orjj34HCycx8Hd+4CZAhnQhgkjkUiQ2YIYWEV3z0hd7D35EEfHqkYgH8XcaPghbC6K/r
         2DLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726714457; x=1727319257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfYQN1FZLOsg1p4vez/5z0QvYTzYNu/ke6pkUpC9YUY=;
        b=QWvNaNzfKLQl1Hu7SpXCfdlbajSDhYFubUlbdMeiLF10gTYzcaDewp6LBpmDdMm36q
         2y1UQ8Y9blFHScc8SZYlFVro7yA89u9hmeBOZYzJu0RwPP94tiCOcCGCvuXx2qPuwRu5
         A31KrwxwV2pbeIGEBeLo72bbnNG9n9EBUkAHnzMMYzjNirv/J5YrkCiGcMohO8JufXhF
         lVEEDgmPJtnydDaXbMYyNrWw3CSeJUIaZ9Qg38x0bWkcOshcNQLmsEa775TP/LC3CqPu
         yHfp680hx6vn61YHsENqaPNUaYH5HUGsQYRTAKHtTDxezO1Qg6Rpil2MG+lzt3brEed7
         VwOQ==
X-Gm-Message-State: AOJu0YxYpC01ovAliQKFE3ckM8BCskHHiRK+g3NdzK8WKOTz565yK7ct
	CWFAwLj16Q0s4lylXdMb7d/ZVwiVQzkX7vlZQRd8lzWIfP9sydBRSng7ae/LAbkTPygktGgagMY
	P
X-Google-Smtp-Source: AGHT+IFOGyGNF5f8y+H5aZx05PpD16vrQr3/T18DqUn70bp/svg6upIj1jwIvbcX4zb/tISqgwJ3vw==
X-Received: by 2002:a05:6122:4124:b0:4f6:b302:5c50 with SMTP id 71dfb90a1353d-503c9a2e8bdmr1204128e0c.0.1726714456639;
        Wed, 18 Sep 2024 19:54:16 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5035ba92e49sm1238181e0c.31.2024.09.18.19.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 19:54:15 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v6 2/2] qemuarm64-secureboot: Enable UEFI Secure Boot
Date: Wed, 18 Sep 2024 20:54:07 -0600
Message-ID: <20240919025407.64543-3-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240919025407.64543-1-javier.tia@linaro.org>
References: <20240919025407.64543-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 19 Sep 2024 02:54:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6085

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
---
 .gitlab-ci.yml                                |  1 +
 ci/uefi-secureboot.yml                        | 37 +++++++++++++++++++
 .../lib/oeqa/runtime/cases/uefi_secureboot.py | 29 +++++++++++++++
 3 files changed, 67 insertions(+)
 create mode 100644 ci/uefi-secureboot.yml
 create mode 100644 meta-arm/lib/oeqa/runtime/cases/uefi_secureboot.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e8627731..1ea167c6 100644
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
index 00000000..f3d03ec1
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
2.46.1


