Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D3AECE572
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 14:19:34 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.23375.1728051571813032207
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Oct 2024 07:19:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Z+8SvoTf;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5399675e14cso2570579e87.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 04 Oct 2024 07:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728051570; x=1728656370; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLZGV6yuSaD0YSxss//izVHhUHNIIsXnpegO9DXVOuY=;
        b=Z+8SvoTfARdY1iYSwFnZkIDXwaTm/mjQhoIFrCP5ERNgXIto2THU+xWhG4JfXUl0jB
         HeLUMGKSEHN3QM6dNPJy6HijjK3MV1G/0IQierjsc27RZDQ4TOYM8zipyJcnIGLtLiJC
         nnHwbR2rH2TJXN8vmgWL/Rfeu02ImUP/HpXWu1gyPK/N2WqNhLxaA8WwEIGHzx4AMQ69
         tS41KV5G6RcRS1yVx4BCiZZ2QavutGZZk1Y9wFPqRbgUjMQhe853ztAiCc/ATqB5RyoU
         uz8udAhLdX+IOIJgJM4EjRj4TPSXH0ljQtiMYqqt6+bi+CLtEXz0z4CQd9MqnoTv+LRr
         TWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728051570; x=1728656370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FLZGV6yuSaD0YSxss//izVHhUHNIIsXnpegO9DXVOuY=;
        b=CKfcY2SRKyhgmswnZoSS4JE5Wsit/emS97Ukcc2MmIM5got41P5PmqKBEGM9hhLzAn
         fEtb1wy6ssOD+7EsC3sJv33RgtCYAEOErQbmdWVlvACNndvge1WwsWVHKUN9EDLMXkxS
         a4i07LVHBhIea9wYADhRc1Eh7/+x6BU7/8W0LnPmAISSm94K9I5fLj+EUz7r3Voc6Xiq
         q2rb2yMXh0VEyhs0ZS0zDRuBGtbXxv1bjAzBFHvtjm4itI6n9rbmVUI4hHU5KkUwknKJ
         K0qx7eAJH8aPaJEaYHh+kAaNrcCrEYVKmEnRdHrIvddAiO0wLWhIVF4USPCwc1Zoz52n
         MZYg==
X-Gm-Message-State: AOJu0YxykBSSL9F1cDrFog8M6IS9q72VrGSgLvwfeVOA1X+XQP4UPlmC
	5neB9DmXWXPWCnBwpXm5ZfI3Dbi2y8r1AremI8REt6qQ1AlU8fVgURk3UThqMCB5bKpG0JvwSrH
	hJSY=
X-Google-Smtp-Source: AGHT+IGCAaFpVjIz3/btMw3mPuG71CAkirYQpIVqe3Xyqtnt6eNS6bCbSveLaIT5uPhMa9oBNFDJ2Q==
X-Received: by 2002:a05:6512:281b:b0:536:a583:2777 with SMTP id 2adb3069b0e04-539ab85b5bemr1880427e87.9.1728051569643;
        Fri, 04 Oct 2024 07:19:29 -0700 (PDT)
Received: from localhost.localdomain (2001-14ba-7430-3d00--193.rev.dnainternet.fi. [2001:14ba:7430:3d00::193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539a82ab2e4sm441339e87.287.2024.10.04.07.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 07:19:28 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Javier Tia <javier.tia@linaro.org>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH v9 2/2] arm/qemuarm64-secureboot: Enable UEFI Secure Boot
Date: Fri,  4 Oct 2024 17:19:06 +0300
Message-ID: <20241004141906.226451-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004141906.226451-1-mikko.rapeli@linaro.org>
References: <20241004141906.226451-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Oct 2024 14:19:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6171

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
 ci/uefi-secureboot.yml                        | 37 +++++++++++++++++++
 .../lib/oeqa/runtime/cases/uefi_secureboot.py | 29 +++++++++++++++
 3 files changed, 67 insertions(+)
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
index 00000000..f647f4b1
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
2.34.1


