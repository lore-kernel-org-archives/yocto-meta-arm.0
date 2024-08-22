Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18ECFC52D7C
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 01:43:58 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.4044.1724291036695156983
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Aug 2024 18:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=rblwELXs;
 spf=pass (domain: linaro.org, ip: 209.85.128.178, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6bd3407a12aso3405237b3.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 21 Aug 2024 18:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724291036; x=1724895836; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZyqnpDgh+apJec1H7CpeIJ27iw+lfaisWYZY4N7CEI=;
        b=rblwELXs0Ru1aOryXTbFjp5ERD3S3rpD9pe9hYGsW7+fIDRCP3QjFEdCQ3NUQdm6Zj
         pPr5xKJpihfU7wAMprm9NqtjikIu0S2yHC24sv693sf+sfEpx/zW21QT7/rkCabA42Ty
         6H6jZ97OpjX/YNgkgcjtNCkH/8xg3DeEPEvF40IpuCR9+1Fqspm1mfWM/rre0YjIcoTE
         rvx8B00DxWljkufR5DOBefZ3t+VorabogNdYcIrYRxxzPff2kySTloUzY+hIAGP32VJQ
         my/ykC9m5dPJS+psHJ6TzzO/GRuD0ZX311fqQMGMYKFw84QeCVVgmxnMYr+fO5d93X0k
         GF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724291036; x=1724895836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uZyqnpDgh+apJec1H7CpeIJ27iw+lfaisWYZY4N7CEI=;
        b=OFQYxg9toU1lCXUVOd6i4distzubXe//UaEYiGWRVmM0KKb7sohY108R5e73xtIp+p
         +rEhh0cDyzEZi+YT2siZzl8yHKAn6vInxLx+98Ivgp8IxwaBDE7mbE0+W15E+HtAG/nc
         wH7Fp07WbpFBjhzh1HedP6aBe/QCTg8UbRFUaNKSDNnonvyxvu9TDWUyCr1N6VczY8fQ
         FjaYOf17YGFZOWVd5XcwpVUYwdXEUSJcMVRhQArENPyc5NWcOi8qUVYXhU2xOpnzE2Jc
         xvQakBR7P/Tl6UeUyi059hJmmxqAElu+Dg4eqqGyCbbA8pn6PORhuCZy/BnMe7sZ4a99
         /AjQ==
X-Gm-Message-State: AOJu0Yz4m8SMyYxd4VCE6IgBJbnoP32klzmCSQ5GedrbadCjlXtBY7U+
	r3SyOREg/QJNJlc9EUmhPDGvYQ/VROGOVr9tqQXDGe4YwcsPHbqdIEk1cEBjsr5cL5HwU20Bf+R
	N
X-Google-Smtp-Source: AGHT+IHmnHin5abAWBFIqQx63bHJamo/DHlrwgZ3bz+zGv8SyzuwvGLCW7OPY0tWU+nLAzGfgvJkkg==
X-Received: by 2002:a05:690c:5241:b0:6ad:deef:4abc with SMTP id 00721157ae682-6c3d561ae6emr3275817b3.36.1724291035652;
        Wed, 21 Aug 2024 18:43:55 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39e6eae07sm707757b3.145.2024.08.21.18.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 18:43:55 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v3 12/13] systemd-boot: Use it as bootloader & sign UEFI image
Date: Wed, 21 Aug 2024 19:43:34 -0600
Message-ID: <20240822014335.3394568-13-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240822014335.3394568-1-javier.tia@linaro.org>
References: <20240822014335.3394568-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Aug 2024 01:43:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6002

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
index d6a7e22b..2f40d360 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -28,6 +28,8 @@ MACHINE_FEATURES += "optee-ftpm"
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


