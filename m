Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F2AC54722
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 19:04:54 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.1051.1724094289326965511
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Aug 2024 12:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=CCDEUPYj;
 spf=pass (domain: linaro.org, ip: 209.85.222.173, mailfrom: javier.tia@linaro.org)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7a1d0dc869bso339587085a.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 19 Aug 2024 12:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724094288; x=1724699088; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/r2Ucrd9qMllbfh6Tkmn1si3mm5VM1XainARIeqVZI=;
        b=CCDEUPYjk080c07IQkMdHaSoU4fCr1VrOarEfM6AGXXzmT0meGPQSA05ZTbHUE9Ywz
         zWz/xdRQz7efOOqzWaXF7JU2FMujmc+jDDeOVu2i3O39ra+zEuZYqaC4VlEqBawyoCqU
         QrrCt5usRqT0pksqa9hfeRH6/4HEgU4KeneXkcJaRqrVEadrl5jPUtZOzXjbtRMGilfM
         IRzRTvEmLtDqBxkqYdqm0odhc9Ldvrnj7v5dJLd9sGDroX2IsfkVFXP92SDIZJzJTVkN
         0LOWYsMcNdU5vqIHj/PWvpxxArTjb9RCw0atZ4YxFJ9Kb+zRxuimS7OsIswuS7bDcMVL
         ALXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724094288; x=1724699088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/r2Ucrd9qMllbfh6Tkmn1si3mm5VM1XainARIeqVZI=;
        b=SHH4x7DIRmZenBDuczYqKh2awIWiZz8r7DQZCC+3EJ7c7MPi7fRNv5Nvwja/TrH84f
         bHS+4E/1YEQIr4WkP2eUsOD5REX0BZeyiIsQeP6qSvCIrI+1dWw7UlfosRVZUfZEq0+X
         Fwr69vwSk3uhTNwWYhnfa/najBSxLld0pbWty/kXBasPFg+p5eyOoQHN8D2tNWUpQeu6
         16oMe7E/9GFoWz8nuC+BWbSBcB77MFWHwbFZBwEham3a9OvYS3O69rsWUsw0Q7AqjzMn
         9dBp9W/Ul/QzpNx1qDQsWLn+wDoeAHEyuTA7jQs0GKpUsz7zBMSeP6ven8+4gcd/UwyC
         9oOg==
X-Gm-Message-State: AOJu0YyYjBmDI56CaUb64G22wkXAxX0ofsR4n4mb7I/8fxeftABmcGmH
	hL6UUYWTuzE3e0w8pm8RI6BxzV+sToQVGM46O2dcgrgwvFrMDN7ciZP+aVsj/jPhtUcuHl94wAA
	O
X-Google-Smtp-Source: AGHT+IFb0+mOOgX8jT9OaDMxeEgQTQ5vjasKJIZ4MPZIFX7UGGC5NboTPpK5kqt4ljR4PO/Z5oiiGQ==
X-Received: by 2002:a05:6214:3d07:b0:6b5:e895:82f0 with SMTP id 6a1803df08f44-6bf7ce5f9c0mr159824486d6.43.1724094287900;
        Mon, 19 Aug 2024 12:04:47 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([177.93.4.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fe06feasm45371756d6.40.2024.08.19.12.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 12:04:47 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v2 12/14] systemd-boot: Use it as bootloader & sign UEFI image
Date: Mon, 19 Aug 2024 13:04:27 -0600
Message-ID: <20240819190429.2897888-13-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819190429.2897888-1-javier.tia@linaro.org>
References: <20240819190429.2897888-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 19 Aug 2024 19:04:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5978

As qemuarm64-secureboot is already using systemd as Init manager, use
too systemd-boot as bootloader. It has a simpler and more intuitive
configuration format compared to grub. It uses a single configuration
file that is easy to understand and modify.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 .../images/core-image-base-uefi-secureboot.inc       |  2 +-
 meta-arm-bsp/wic/efi-disk-no-swap.wks.in             |  2 +-
 meta-arm/conf/machine/qemuarm64-secureboot.conf      |  2 ++
 .../systemd/systemd-boot-uefi-secureboot.inc         | 12 ++++++++++++
 .../recipes-core/systemd/systemd-boot_%.bbappend     |  1 +
 5 files changed, 17 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
 create mode 100644 meta-arm/recipes-core/systemd/systemd-boot_%.bbappend

diff --git a/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc b/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
index 07e315a3..e5cf7760 100644
--- a/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
+++ b/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
@@ -10,4 +10,4 @@ QB_DEFAULT_KERNEL = "none"
 
 KERNEL_IMAGETYPE = "Image"
 
-IMAGE_INSTALL += "systemd"
+IMAGE_INSTALL += "systemd systemd-boot"
diff --git a/meta-arm-bsp/wic/efi-disk-no-swap.wks.in b/meta-arm-bsp/wic/efi-disk-no-swap.wks.in
index 6ae7ad9d..6d77d3aa 100644
--- a/meta-arm-bsp/wic/efi-disk-no-swap.wks.in
+++ b/meta-arm-bsp/wic/efi-disk-no-swap.wks.in
@@ -7,4 +7,4 @@ part /boot --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}" --label
 
 part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid --exclude-path boot/
 
-bootloader --ptable gpt --timeout=1 --append="${GRUB_LINUX_APPEND}"
+bootloader --ptable gpt --timeout=5 --append="${LINUX_KERNEL_ARGS}"
diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
index 79ab6080..38acc97d 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -26,6 +26,8 @@ MACHINE_FEATURES += "optee-ftpm"
 MACHINE_FEATURES += "efi"
 MACHINE_FEATURES += "uefi-secureboot"
 
+EFI_PROVIDER = "systemd-boot"
+
 INIT_MANAGER = "systemd"
 DISTRO_FEATURES += "systemd"
 DISTRO_FEATURES_NATIVE += "systemd"
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


