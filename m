Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B493C3DA61
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 20:35:59 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.4161.1721334956543979045
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jul 2024 13:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=LJLECWbF;
 spf=pass (domain: linaro.org, ip: 209.85.128.175, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6561850a7bcso13895537b3.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jul 2024 13:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721334955; x=1721939755; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E35ejzlXeD/67/aumw5V+DwkjGSuPq5GnUIlN8Yu4mg=;
        b=LJLECWbFn7uZcBQ6j+hXaUFkvblGWGbmLZ//65OKOATitn9INenu2yye1bMFAl0GXI
         gO8jUW2yRZ+2z9piUqKeg8rT3uiyHgrfakvR2TwigOIULZaeo3LGobnzznVleOCLqSgn
         s83J9d3IjE70paaG8k4rxq1KQZm3YZeIFQrzTxMoGwAv3GIgUlDpJy53zIOUU87UfKqw
         aeMzbFIDoj7DYBtztQ042pBvUcM8pzyTe0YsXjGvSotZt47TO3nBBtJQwhBLRYuvDCFd
         MhWHl9XvX19mJkWV9n8L91xlv0EAbcQqJ3NdJAyDq6lyIphOW9M4zmivbHHXorO5yBg7
         Sk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721334955; x=1721939755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E35ejzlXeD/67/aumw5V+DwkjGSuPq5GnUIlN8Yu4mg=;
        b=neVTVqurDLIp5ZHM4NTnCrZSVJDYIjky+NQ4NKteVT7emR8RFlm7tnaStIaNysbhfP
         bZbsBtE4/J/OOSN8bDadmK70hzaPTn3eYLpnn+jgK6sMlpj2dgH9anIBbRPlfmsjRuhP
         HLt14QV2xIPyg39DrYv8EONxzPXvuPP013LXpyrl/ErzKEGGtlOYHIw99B3fbP1D6Hvl
         VWV3V16+Ce8EIIHq2j/hhM1wkynSf5G7b9dnHdCN2tC3fUHtP8JsaoHUUefRaMrRCXtJ
         kQqyHg5Xkb4zIpFm4eVF3eUSzUc3OIHXJF4LlDHYHfzhbpA7tiB/XHHrNk0N9SehvBFT
         38jg==
X-Gm-Message-State: AOJu0Yw51zaV+DQEAvmnClKGCBCw7MdQqFOBHdcddXTIoBIH4U+56bRs
	SpbGAk2Z/IoP6EvIaW22VgfvLGJPEQ+V4U7Rwq5D4OMa8jiQ2redq2CF37shzMOh/L026kFuHss
	7RXk=
X-Google-Smtp-Source: AGHT+IH/C5hVyccGMpkDtd4AE5T1Zriibbw8iLibcvtFVnhimOcFw2r6B/9+QEbB4XywVMy3bw0mxw==
X-Received: by 2002:a81:9302:0:b0:646:53ce:b365 with SMTP id 00721157ae682-66500c3a8d4mr73390047b3.42.1721334955516;
        Thu, 18 Jul 2024 13:35:55 -0700 (PDT)
Received: from localhost.localdomain ([190.171.102.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6695245a1dasm171657b3.53.2024.07.18.13.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 13:35:55 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v1 5/7] qemuarm64-secureboot: Setup UEFI grub and sign EFI grub binary
Date: Thu, 18 Jul 2024 14:35:24 -0600
Message-ID: <20240718203526.52214-6-javier.tia@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240718203526.52214-1-javier.tia@linaro.org>
References: <20240718203526.52214-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Jul 2024 20:35:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5904

meta-secure-core is required because of sbsigntool.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 ci/qemuarm64-secureboot.yml                   | 12 +++--
 ...on-t-return-error-for-deferred-image.patch | 48 +++++++++++++++++++
 .../recipes-bsp/grub/files/grub-initial.cfg   |  8 ++++
 .../grub/grub-efi-uefi-secureboot.inc         | 40 ++++++++++++++++
 meta-arm/recipes-bsp/grub/grub-efi_%.bbappend |  1 +
 5 files changed, 104 insertions(+), 5 deletions(-)
 create mode 100644 meta-arm/recipes-bsp/grub/files/0001-verifiers-Don-t-return-error-for-deferred-image.patch
 create mode 100644 meta-arm/recipes-bsp/grub/files/grub-initial.cfg
 create mode 100644 meta-arm/recipes-bsp/grub/grub-efi-uefi-secureboot.inc
 create mode 100644 meta-arm/recipes-bsp/grub/grub-efi_%.bbappend

diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
index b26941e0..958a1ff1 100644
--- a/ci/qemuarm64-secureboot.yml
+++ b/ci/qemuarm64-secureboot.yml
@@ -4,13 +4,15 @@ header:
   version: 14
   includes:
     - ci/base.yml
-
-machine: qemuarm64-secureboot
-
-target:
-  - core-image-base
+    - ci/meta-openembedded.yml
+    - ci/meta-secure-core.yml
 
 local_conf_header:
   optee: |
     IMAGE_INSTALL:append = " optee-test optee-client optee-os-ta"
     TEST_SUITES:append = " optee ftpm"
+
+machine: qemuarm64-secureboot
+
+target:
+  - core-image-base
diff --git a/meta-arm/recipes-bsp/grub/files/0001-verifiers-Don-t-return-error-for-deferred-image.patch b/meta-arm/recipes-bsp/grub/files/0001-verifiers-Don-t-return-error-for-deferred-image.patch
new file mode 100644
index 00000000..e55128df
--- /dev/null
+++ b/meta-arm/recipes-bsp/grub/files/0001-verifiers-Don-t-return-error-for-deferred-image.patch
@@ -0,0 +1,48 @@
+From 70fe34e1e61e0560af8a2018c5486b07b217f7fc Mon Sep 17 00:00:00 2001
+From: Leo Yan <leo.yan@linaro.org>
+Date: Thu, 22 Dec 2022 15:28:12 +0800
+Subject: [PATCH] verifiers: Don't return error for deferred image
+
+When boot from menu and the flag GRUB_VERIFY_FLAGS_DEFER_AUTH is set,
+grub returns error:
+
+ Booting a command list
+
+ error: verification requested but nobody cares: (hd0,gpt1)/Image.
+
+ Press any key to continue...
+
+In this case, the image should be deferred for authentication, grub
+should return the file handle and pass down to later firmware (e.g.
+U-Boot, etc) for authentication.
+
+For this purpose, rather than returning error, this patch prints log
+and returns file handler.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Leo Yan <leo.yan@linaro.org>
+---
+ grub-core/kern/verifiers.c | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/grub-core/kern/verifiers.c b/grub-core/kern/verifiers.c
+index 75d7994cf..ada753e69 100644
+--- a/grub-core/kern/verifiers.c
++++ b/grub-core/kern/verifiers.c
+@@ -115,11 +115,7 @@ grub_verifiers_open (grub_file_t io, enum grub_file_type type)
+   if (!ver)
+     {
+       if (defer)
+-	{
+-	  grub_error (GRUB_ERR_ACCESS_DENIED,
+-		      N_("verification requested but nobody cares: %s"), io->name);
+-	  goto fail_noclose;
+-	}
++	grub_printf("%s verification is deferred\n", io->name);
+ 
+       /* No verifiers wanted to verify. Just return underlying file. */
+       return io;
+-- 
+2.35.1
+
diff --git a/meta-arm/recipes-bsp/grub/files/grub-initial.cfg b/meta-arm/recipes-bsp/grub/files/grub-initial.cfg
new file mode 100644
index 00000000..1da15480
--- /dev/null
+++ b/meta-arm/recipes-bsp/grub/files/grub-initial.cfg
@@ -0,0 +1,8 @@
+# First partition on first disk, most likely EFI system partition. Set it here
+# as fallback in case the search doesn't find the given UUID.
+set root='hd0,gpt1'
+search --no-floppy --fs-uuid --set=root 7819-74F8
+
+configfile /EFI/BOOT/grub.cfg
+
+# If fail to load config file, it runs into GRUB shell.
diff --git a/meta-arm/recipes-bsp/grub/grub-efi-uefi-secureboot.inc b/meta-arm/recipes-bsp/grub/grub-efi-uefi-secureboot.inc
new file mode 100644
index 00000000..e218cb50
--- /dev/null
+++ b/meta-arm/recipes-bsp/grub/grub-efi-uefi-secureboot.inc
@@ -0,0 +1,40 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
+
+SRC_URI += "file://grub-initial.cfg"
+SRC_URI += "file://0001-verifiers-Don-t-return-error-for-deferred-image.patch"
+
+DEPENDS += "sbsigntool-native"
+
+GRUB_PREFIX_DIR ?= "/EFI/BOOT"
+EFI_BOOT_PATH ?= "/boot/efi/EFI/BOOT"
+
+do_mkimage() {
+    install -d "${D}${EFI_BOOT_PATH}"
+    install -m 0600 "${UNPACKDIR}/grub-initial.cfg" "${D}${EFI_BOOT_PATH}/grub.cfg"
+
+    grub-mkimage --disable-shim-lock \
+        --prefix="${GRUB_PREFIX_DIR}" \
+        --format="${GRUB_TARGET}-efi" \
+        --directory="${B}/grub-core" \
+        --output="${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE}" \
+        ${GRUB_BUILDIN}
+}
+
+fakeroot do_sign() {
+    "${STAGING_BINDIR_NATIVE}/sbsign" \
+        --key "${UEFI_SB_KEYS_DIR}/db.key" \
+        --cert "${UEFI_SB_KEYS_DIR}/db.crt" \
+        "${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE}" \
+        --output "${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE}.signed"
+
+   install -m 0644 "${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE}.signed" "${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE}"
+
+   install -d "${D}${EFI_BOOT_PATH}"
+   install -m 0644 "${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE}.signed" "${D}${EFI_BOOT_PATH}/${GRUB_IMAGE}"
+}
+
+addtask sign after do_install before do_deploy do_package
+
+FILES:${PN} += "${EFI_BOOT_PATH}"
+
+CONFFILES:${PN} += "${EFI_BOOT_PATH}/grub.cfg"
diff --git a/meta-arm/recipes-bsp/grub/grub-efi_%.bbappend b/meta-arm/recipes-bsp/grub/grub-efi_%.bbappend
new file mode 100644
index 00000000..fd3baba0
--- /dev/null
+++ b/meta-arm/recipes-bsp/grub/grub-efi_%.bbappend
@@ -0,0 +1 @@
+require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'grub-efi-uefi-secureboot.inc', '', d)}
\ No newline at end of file
-- 
2.45.2


