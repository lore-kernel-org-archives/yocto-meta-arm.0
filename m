Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F04C3DA7F
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 20:35:59 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.4183.1721334952411141470
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jul 2024 13:35:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=z0u3eQKw;
 spf=pass (domain: linaro.org, ip: 209.85.128.180, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-65f9b244018so12717287b3.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jul 2024 13:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721334951; x=1721939751; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6Zr6NSCymDnggv3lRQvMlTI2sUOIxCsHB1wjfnRh54=;
        b=z0u3eQKwbruegY/1SLt/uB/Xevt4k8dqQ4PKuDVLzlJGFQ8H+exQRLqeKztcYrs6Im
         V3uZ1W211Gqa0+2fVRJZc8CCPekUf3b07pO/WwVGIgZELrNL9NYcqXDePopQGLf3eYYR
         jVdG/n66pruKzCC4HXZx2rP0S5PJMTM2GVEN4o6r6zFS8GV9MGj/05JCC5OYjLacDB3e
         JZJpfxg5KE+PPyawhZp8mLJSeOG3UXNz+AHZ1x2kphg3GghdwvrXwd/yOzVT4J5uS6Yt
         u2t5V1ZHqa8+OKGPPHcxRaoWeI2JjDhwFuFLpbzJRxyg5k+kKvY8tXH0R++pmQSgPYyG
         iLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721334951; x=1721939751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6Zr6NSCymDnggv3lRQvMlTI2sUOIxCsHB1wjfnRh54=;
        b=FsKreSYXYzI0tMR9g9GeaVa+mATlQAltgdbC2c08I+bf3owXnTJfMVNklrs6SmcuCi
         LQlDEVZFakL8/wNdd4RS3B7aRWiuW4PrBs9MLI+pSNiFbPItO7Y6uoca4sYYOtWfnvQk
         zwgK93Uw0NBkMMuCLiLWFAJzBhJqr2LvcgAhXJlc1x8SI/CfZ99pPCCQv5gC+EelvUwE
         sGZB908f6FguIqYiVkk5W8Wb0oRi6VY+NuaAaeNUmhShkGeSmeL21lPvd0PAylGUGNfH
         VbckGwtLG46XVMWWMOnHtaX1aPGnv9y7jve2Zj3Baz+M2HORyyJDXr2DjvNe2/appla4
         Qbww==
X-Gm-Message-State: AOJu0YxJW+OVvuYo3+OtvdqL5mhYyCCkZ21L0DA3atC/JsZw5Sreye02
	zKPHrQ7JT9Zprg/KCFHbVBOvJTDWeWpuzuQtKC0j2c89+euDiTxVdfcaanD/XNEx2GYDKcOPaVz
	+O6s=
X-Google-Smtp-Source: AGHT+IGZWSqirOOD/zaGFMmnV1AaqPXmTJTlE/EYpuCcNDrvCorDpVX59BbPCr8A8+hr7MbwHP/Mhw==
X-Received: by 2002:a81:ae23:0:b0:619:da17:87be with SMTP id 00721157ae682-666a6dafaa8mr31629237b3.42.1721334951255;
        Thu, 18 Jul 2024 13:35:51 -0700 (PDT)
Received: from localhost.localdomain ([190.171.102.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6695245a1dasm171657b3.53.2024.07.18.13.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 13:35:50 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v1 1/7] qemuarm64-secureboot: Add poky machine UEFI settings
Date: Thu, 18 Jul 2024 14:35:20 -0600
Message-ID: <20240718203526.52214-2-javier.tia@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240718203526.52214-1-javier.tia@linaro.org>
References: <20240718203526.52214-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Jul 2024 20:35:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5900

- Introduce uefi-secureboot poky machine feature.

- Replace qemuarm64.wks with efi-disk-no-swap.wks.in disk definition to
  add expected UEFI disk partitions configuration.

- Enable poky machine feature and grub UEFI support.

- Remove hard-coded root partition as it will be detected based on GUID
  part.

- Use systemd as Init manager to auto-mount efivarfs required by efivar.

- Install additional userspace software required by Linux kernel and
  systemd.

- Set root password.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 .../core-image-base-uefi-secureboot.inc       | 21 +++++++++++++++++++
 .../images/core-image-base.bbappend           |  1 +
 .../conf/machine/qemuarm64-secureboot.conf    |  3 +++
 3 files changed, 25 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/images/core-image-base.bbappend

diff --git a/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc b/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
new file mode 100644
index 00000000..9f20e3f4
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
@@ -0,0 +1,21 @@
+# Detected by passing kernel parameter
+QB_KERNEL_ROOT = ""
+
+# kernel is in the image, should not be loaded separately
+QB_DEFAULT_KERNEL = "none"
+
+KERNEL_IMAGETYPE = "Image"
+
+WKS_FILE = "efi-disk-no-swap.wks.in"
+
+MACHINE_FEATURES += "efi"
+
+EFI_PROVIDER = "grub-efi"
+IMAGE_INSTALL += "grub-efi"
+
+IMAGE_INSTALL += "systemd util-linux bash coreutils efivar"
+
+inherit extrausers
+EXTRA_IMAGE_FEATURES += "allow-root-login"
+# Set the root password to toor
+EXTRA_USERS_PARAMS += "usermod -p '\$6\$cnS1MQVd07.jLdkj\$NgXwgR.LWtbi4qD3Drn6x0AQtVtX/CdfKPy1eJzuUC0YdD8s54fLAlsLm8vaoacAoqq6BHYGTAbUnAUNJKTOb1' root;"
diff --git a/meta-arm-bsp/recipes-bsp/images/core-image-base.bbappend b/meta-arm-bsp/recipes-bsp/images/core-image-base.bbappend
new file mode 100644
index 00000000..1f6dbd24
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/images/core-image-base.bbappend
@@ -0,0 +1 @@
+require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'core-image-base-uefi-secureboot.inc', '', d)}
\ No newline at end of file
diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
index 78a39c03..27581941 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -22,3 +22,6 @@ WKS_FILE_DEPENDS = "trusted-firmware-a"
 IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
 
 MACHINE_FEATURES += "optee-ftpm"
+MACHINE_FEATURES += "uefi-secureboot"
+
+INIT_MANAGER = "systemd"
\ No newline at end of file
-- 
2.45.2


