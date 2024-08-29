Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580E1C83F3D
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 16:32:36 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.24079.1724949147384437068
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Aug 2024 09:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=BTLwtCk1;
 spf=pass (domain: linaro.org, ip: 209.85.219.169, mailfrom: javier.tia@linaro.org)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e17c1881a52so1515562276.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 09:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724949146; x=1725553946; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2+l50kfaOxxxSVJkvG1/4w38RWMsAAekjoRFZ7EGew=;
        b=BTLwtCk1OrsFdXY/kwcugtxlzwTGxulZeq7REanbzVKjlHpN9i9og/fOPeyYWJPFRD
         RfT/Rx4aDsjclEGkM2qSfnAmJfGk1rOiIbHxYzlafAzv1gcFn/QaFdytSo5Ghn435GsV
         fFF8R4PvpdK/grUmE4N0FFfhlhkiPtR4YuA1xtns5FGI6ZSUoffeTcnAC+4DWyRs0H1/
         bCfnqZ/vnkECB6fL95rJNXPCSZkmbgQm2W7aiEbQdzc+eW9YMh+LDa+ZjPFpQMjw4Ui5
         VAucjCK/57/fDZ9qxi2QW8Mp5uw8hU8jEvjSLOhI0aGRL3HHs3Po6dH+jnJ8qrbGrBMa
         vNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724949146; x=1725553946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d2+l50kfaOxxxSVJkvG1/4w38RWMsAAekjoRFZ7EGew=;
        b=DeeHIgBhUtI4X45f4SuqWY851acJR+FSMi0JrT1rQdM/Y8YXaG6xKLPFSpbwafJ4pV
         VQefBCqlraKXEPRXx12Cdyvr07dC6Baw/AR4AjUvgYnmdi8hVm/G0RCADQpe/zD2I5El
         oPGlRph1XEAX/BlFoZZbtX9L7KjwYk0dWx9o2EekJljVOjaiWWZEljadrqauJ0esjh6z
         KE0SlQubvs+xPB0thY1/6YrTbsoXLNzfHj3yMgYTy6R0tt0dqcw5PSmyMBbwhFW6jxmY
         2rPbWOqg0sZ+sldvyqwygsF8TZcJpnXqPNKcmLAPKxSFyhyrCpEtDt23IKR/nxGkGTr4
         pJ/Q==
X-Gm-Message-State: AOJu0Ywzezz6LdZo8Ge1rLDkapohXVmlGamtXJjaRcys6HouDsQ+EoO5
	v4kCVbbGZVKdDZ8BikhxGrTF/3R9G73+S/dSfddtOg0SuG/Jb+VnWRW2Op7X8j1h6B8Y5eQ09x9
	W
X-Google-Smtp-Source: AGHT+IGcfrGWjLskmYxhWh5hHDnRijKr82sa9x+AguEx3i2iXqhZmaGvYqUk9L/C1HHxitW4OZjGDw==
X-Received: by 2002:a05:690c:6d07:b0:66b:c28b:f234 with SMTP id 00721157ae682-6d2ee80eb4amr25201167b3.21.1724949146441;
        Thu, 29 Aug 2024 09:32:26 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d438e18asm2993517b3.60.2024.08.29.09.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 09:32:26 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v4 12/13] systemd-boot: Use it as bootloader & sign UEFI image
Date: Thu, 29 Aug 2024 10:32:08 -0600
Message-ID: <20240829163209.47945-13-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240829163209.47945-1-javier.tia@linaro.org>
References: <20240829163209.47945-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 16:32:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6022

As qemuarm64-secureboot is already using systemd as Init manager, use
too systemd-boot as bootloader. It has a simpler and more intuitive
configuration format compared to grub. It uses a single configuration
file that is easy to understand and modify.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 meta-arm-bsp/wic/efi-disk-no-swap.wks.in             |  2 +-
 meta-arm/conf/machine/qemuarm64-secureboot.conf      |  2 ++
 .../images/core-image-minimal-uefi-secureboot.inc    |  2 +-
 .../systemd/systemd-boot-uefi-secureboot.inc         | 12 ++++++++++++
 .../recipes-core/systemd/systemd-boot_%.bbappend     |  1 +
 5 files changed, 17 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
 create mode 100644 meta-arm/recipes-core/systemd/systemd-boot_%.bbappend

diff --git a/meta-arm-bsp/wic/efi-disk-no-swap.wks.in b/meta-arm-bsp/wic/efi-disk-no-swap.wks.in
index 6ae7ad9d..6d77d3aa 100644
--- a/meta-arm-bsp/wic/efi-disk-no-swap.wks.in
+++ b/meta-arm-bsp/wic/efi-disk-no-swap.wks.in
@@ -7,4 +7,4 @@ part /boot --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}" --label
 
 part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid --exclude-path boot/
 
-bootloader --ptable gpt --timeout=1 --append="${GRUB_LINUX_APPEND}"
+bootloader --ptable gpt --timeout=5 --append="${LINUX_KERNEL_ARGS}"
diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
index 542d09a3..9c8496cb 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -25,6 +25,8 @@ MACHINE_FEATURES += "optee-ftpm"
 MACHINE_FEATURES += "efi"
 MACHINE_FEATURES += "uefi-secureboot"
 
+EFI_PROVIDER = "systemd-boot"
+
 INIT_MANAGER = "systemd"
 DISTRO_FEATURES += "systemd"
 DISTRO_FEATURES_NATIVE += "systemd"
diff --git a/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc b/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
index 07e315a3..e5cf7760 100644
--- a/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
+++ b/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
@@ -10,4 +10,4 @@ QB_DEFAULT_KERNEL = "none"
 
 KERNEL_IMAGETYPE = "Image"
 
-IMAGE_INSTALL += "systemd"
+IMAGE_INSTALL += "systemd systemd-boot"
diff --git a/meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc b/meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
new file mode 100644
index 00000000..c0753614
--- /dev/null
+++ b/meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
@@ -0,0 +1,12 @@
+DEPENDS += 'gen-uefi-sb-keys'
+DEPENDS += "sbsigntool-native"
+
+inherit sbsign
+
+SBSIGN_KEY = "${UEFI_SB_KEYS_DIR}/db.key"
+SBSIGN_CERT = "${UEFI_SB_KEYS_DIR}/db.crt"
+SBSIGN_TARGET_BINARY = "${B}/src/boot/efi/systemd-boot${EFI_ARCH}.efi"
+
+do_compile:append() {
+    do_sbsign
+}
diff --git a/meta-arm/recipes-core/systemd/systemd-boot_%.bbappend b/meta-arm/recipes-core/systemd/systemd-boot_%.bbappend
new file mode 100644
index 00000000..caba9830
--- /dev/null
+++ b/meta-arm/recipes-core/systemd/systemd-boot_%.bbappend
@@ -0,0 +1 @@
+require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'systemd-boot-uefi-secureboot.inc', '', d)}
\ No newline at end of file
-- 
2.46.0


