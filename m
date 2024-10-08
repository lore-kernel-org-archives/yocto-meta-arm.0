Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E1DCED24E
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 00:22:40 +0000 (UTC)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.web11.7285.1728346954205682252
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Oct 2024 17:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=lAXFcAJ5;
 spf=pass (domain: linaro.org, ip: 209.85.221.172, mailfrom: javier.tia@linaro.org)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5086a0f25b2so1837003e0c.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 07 Oct 2024 17:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728346953; x=1728951753; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oailjq4PcZg54XQMPhQDTRpiQYFiFCuott2zmOMAJfc=;
        b=lAXFcAJ5pxSNYQbH2z/lQmqB8E/s1ibW1pYxkFzMWA8iWldvnSKeKOvuMiIwnvRTd7
         F6Ksvn+bUcql2xC0xRffVxPL1bCRO9l7YZP+7IjflcdPgaWckwm8QNBMLSA95LoR3kok
         XdEnzJDfjjo5eAYD3p5/mF8uCPVd54NaAY+p2rXCJBkm28gPUzxvSWh9AJdeKrXcQt6p
         yL27mDK/uHRIogRh8mWtfUCcr2WqSjVx1uzQKK54xs/15ZNmlDO2+TeUwsACjaLd750L
         b4OO02KI5AhbVbziJzKgP9cRHfjeipcxCs5OeyIUEqweKWZUPvJUtZVO6IWw4FQplyHD
         fnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728346953; x=1728951753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oailjq4PcZg54XQMPhQDTRpiQYFiFCuott2zmOMAJfc=;
        b=KJx+ZYM/NbYEan/M9laMRvUYDqH2H0L3FntXZB2NuMudJX8UgGsXYm0Fu/sCCej22d
         OYd0SZZaJn/o2KFhzQe6Rks9wMFitSTznZK07gwrekKf0gFoKdNjrZYzbam5BP+cBPPx
         GT8wzqEezM5dm4LTKxo7ZEKEZ6rPbppOtxJPnvQQlgXMq2xJqH40rxRgJgEG7pwLEJ5p
         MpgeRSvvrRz2FLz2iF+SSh9ksi/pRl1FcSmiK6n4ttZdI44W8qdU9hO8IKxyAnqzQr9y
         6+k516ccbkg/RguP5Tn9Eu3pjxSWMpO4eW761HJIKFRlf0ambDql5tHrdzfmJuSooiEO
         7X3A==
X-Gm-Message-State: AOJu0YwxtTsnMF42Vqx7P0NIQH1zcRzu8jOeCPZAYmbu1yprDI7YnUFM
	6VnuUDXK6YpOEMZUTnpYmzQve6nAqnD5Zy8y6THp+zi86eT2o0yn64jOjiuCwEuQ8my8mbw2w/s
	p
X-Google-Smtp-Source: AGHT+IF/mbZg2D9X7Mw5NLtlGf+fGSq//UJuH9ucHY0sJWj4NIGi8NiotUyUsqUJioYFmd4EZDcizg==
X-Received: by 2002:a05:6122:1793:b0:507:9165:209 with SMTP id 71dfb90a1353d-50c854cc1edmr8504252e0c.7.1728346952823;
        Mon, 07 Oct 2024 17:22:32 -0700 (PDT)
Received: from localhost.localdomain ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-50c9ad6b06fsm934426e0c.22.2024.10.07.17.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 17:22:32 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v0] arm/uefi-secureboot: Add uefi capsule update support
Date: Mon,  7 Oct 2024 18:22:21 -0600
Message-ID: <20241008002221.261923-1-javier.tia@linaro.org>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Oct 2024 00:22:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6182

UEFI capsule update is a mechanism that allows firmware updates to be
delivered and applied in a standardized way. It is part of the UEFI
specification and provides a way to update system firmware components
like the BIOS, UEFI drivers, or other platform firmware.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 ci/uefi-secureboot.yml                                     | 4 ++--
 meta-arm/recipes-bsp/u-boot/u-boot-uefi-capsule-update.inc | 3 +++
 meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc     | 1 +
 meta-arm/recipes-bsp/u-boot/u-boot/uefi-capsule-update.cfg | 5 +++++
 4 files changed, 11 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot-uefi-capsule-update.inc
 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot/uefi-capsule-update.cfg

diff --git a/ci/uefi-secureboot.yml b/ci/uefi-secureboot.yml
index 4e9572cc..e8aa6004 100644
--- a/ci/uefi-secureboot.yml
+++ b/ci/uefi-secureboot.yml
@@ -23,7 +23,7 @@ local_conf_header:
     WKS_FILE = "efi-disk.wks.in"
     KERNEL_IMAGETYPE = "Image"
 
-    MACHINE_FEATURES:append = " efi uefi-secureboot uefi-http-boot"
+    MACHINE_FEATURES:append = " efi uefi-secureboot uefi-http-boot uefi-capsule-updates"
 
     EFI_PROVIDER = "systemd-boot"
 
@@ -34,4 +34,4 @@ local_conf_header:
 
     IMAGE_INSTALL:append = " systemd systemd-boot util-linux coreutils"
 
-    TEST_SUITES:append = " uefi_secureboot"
\ No newline at end of file
+    TEST_SUITES:append = " uefi_secureboot"
diff --git a/meta-arm/recipes-bsp/u-boot/u-boot-uefi-capsule-update.inc b/meta-arm/recipes-bsp/u-boot/u-boot-uefi-capsule-update.inc
new file mode 100644
index 00000000..6b6913ad
--- /dev/null
+++ b/meta-arm/recipes-bsp/u-boot/u-boot-uefi-capsule-update.inc
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://uefi-capsule-update.cfg"
diff --git a/meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc b/meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc
index 48c2de86..cb2fed15 100644
--- a/meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc
+++ b/meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc
@@ -5,6 +5,7 @@ SRC_URI += "file://uefi-secureboot.cfg"
 inherit sbsign
 
 require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-http-boot', 'u-boot-uefi-http-boot.inc', '', d)}
+require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-capsule-update', 'u-boot-capsule-update.inc', '', d)}
 
 DEPENDS += 'python3-pyopenssl-native'
 
diff --git a/meta-arm/recipes-bsp/u-boot/u-boot/uefi-capsule-update.cfg b/meta-arm/recipes-bsp/u-boot/u-boot/uefi-capsule-update.cfg
new file mode 100644
index 00000000..8cc4a453
--- /dev/null
+++ b/meta-arm/recipes-bsp/u-boot/u-boot/uefi-capsule-update.cfg
@@ -0,0 +1,5 @@
+CONFIG_EFI_RUNTIME_UPDATE_CAPSULE=y
+CONFIG_EFI_CAPSULE_ON_DISK=y
+CONFIG_EFI_IGNORE_OSINDICATIONS=y
+CONFIG_EFI_CAPSULE_ON_DISK_EARLY=y
+CONFIG_EFI_CAPSULE_FIRMWARE_RAW=y
\ No newline at end of file
-- 
2.47.0


