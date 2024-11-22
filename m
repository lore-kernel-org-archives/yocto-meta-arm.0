Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDE9D75E46
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 13:39:36 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.24129.1732282772019550564
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Nov 2024 05:39:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ru0lgWkY;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539f6e1f756so2400402e87.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 22 Nov 2024 05:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732282770; x=1732887570; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THpwYuK/66N/83Nv4l54qiRGvZkoaaQq0A1yRLUBTb4=;
        b=ru0lgWkYl/oa/lmXLCKo/gaiQf7XD1VDAXXDSNavmFUEBPjwJq1zjBNoRrpCiJGvpG
         Tp6MWRXd4/JDO2GhrDdnQ8UzwzdwAeFIEOmBySnTha6rkx8ACRN1Cg/bzmlDDclkHabJ
         hyRG9NuffsIgE3c8ArKwTamtyobJA/ZVfVTcZBL4pkWI8lrgFuAPOo3Hvwdk7vhvlRRB
         bqZQITy9Er/BNCwyakZbaeoa0Vi7Dkb/h1tqEST4+8STGoL4luM0pRqKJsqzTpNKjiHd
         KSXZkhqmSppFmK7O2lzGtZCg7+mqjmg7x9YxQJ9AtcndreJDbrPCI9W6xbtABfIjTAiW
         Qp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732282770; x=1732887570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THpwYuK/66N/83Nv4l54qiRGvZkoaaQq0A1yRLUBTb4=;
        b=rPE3tXN2xqsv9DhE8i65e63ae8kl+BLGakSp5a/8YSDW3eslMCU/UzdSO3djRThnd2
         tCaosU862XIchYTGvBljYIHaUUtO3DghsBKNvUziVmyQdZzV4GmY1mSmQpIf3NXQXjG2
         QdT2cw5/aV9TGRYDMN+DDjmcCHsRvHuYPu7rG2iTOiKUM+m441FPOkXniSRERbdAa/Gs
         3BX5doiPspvQWcjBs2tDbcBMIIdEDDGl893nC/ZIIo7+kJSssJ5g/5MsHfBZiICNAwPF
         NTbwKNl8nY1lcOE+BvoQUYyEpiSJfCTiB4rZDlKKgCSeALCT9roxrUThQRUWX0SAG9a9
         iZWQ==
X-Gm-Message-State: AOJu0YzXE7cXAHRXQFv+BE5uCCOV6u+5RY2X+XsmOCR+ssisfrq3s8dB
	Ahsh3e8tun5OVBoELyNnmSsjCoUd2K5IsbChPkY8e1pKhbIJsYg/6rWrcDL3GnOm0XWNMRxMI/0
	c
X-Gm-Gg: ASbGncvZXiybyXJ0f2Rnw8ZHoFkBLuL6yZFdRThs5VuV20z2IKAQIKeeVx636MMDV2P
	efCzJqYvbAFCjngXioJMv9RqKbj4LXVAU1PU4CyXyJ9Iqm9kxdR3tMTHceLppkwOCex4goHUH71
	izue3dM4tnRraIXnhF03Gp0yTdLXMuzENi4cSCNO3UPVgobFWNSaYG099In9F6Nx0DP/D4i7n5M
	cCwmpDuGCJ5TqnDa0flSgl5HHkF1QIaEIPCv8sHXrFXQ349BjVuEXlSXvFiY2CV2nRjmTf0aCmL
	mmWNRe4dl/NXCp9aukW1vFKyrg==
X-Google-Smtp-Source: AGHT+IG4e2rrZo5rQMa8LucVOyXuz1595ZnUzUFZPukJqwFPQUfCS0eYA1JgxXpWv1r6dHr3I3ehsQ==
X-Received: by 2002:a05:6512:3c98:b0:539:920a:f886 with SMTP id 2adb3069b0e04-53dd39b56fbmr1581360e87.50.1732282770177;
        Fri, 22 Nov 2024 05:39:30 -0800 (PST)
Received: from localhost.localdomain (2001-14ba-7452-eb00--133.rev.dnainternet.fi. [2001:14ba:7452:eb00::133])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd248b1dcsm375253e87.203.2024.11.22.05.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 05:39:28 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 3/4] uefi-secureboot.yml: switch to Unified Kernel Image (UKI)
Date: Fri, 22 Nov 2024 15:39:03 +0200
Message-ID: <20241122133904.202082-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241122133904.202082-1-mikko.rapeli@linaro.org>
References: <20241122133904.202082-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Nov 2024 13:39:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6255

Unified Kernel Image includes kernel and initrd which
both are signed with UEFI secure boot. This brings secure
boot closer to userspace.

Use core-image-initramfs-boot to find the real
rootfs and boot systemd init there. No need to hard code
rootfs via qemuboot/runqemu variables.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ci/uefi-secureboot.yml | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/ci/uefi-secureboot.yml b/ci/uefi-secureboot.yml
index e84d3bc6..4cc4e658 100644
--- a/ci/uefi-secureboot.yml
+++ b/ci/uefi-secureboot.yml
@@ -32,4 +32,20 @@ local_conf_header:
 
     IMAGE_INSTALL:append = " systemd systemd-boot util-linux coreutils"
 
-    TEST_SUITES:append = " uefi_secureboot"
+    TEST_SUITES:append = " uefi_secureboot uki"
+
+    IMAGE_CLASSES += "uki"
+
+    IMAGE_CLASSES += "sbsign"
+    UKI_SB_KEY = "${SBSIGN_KEY}"
+    UKI_SB_CERT = "${SBSIGN_CERT}"
+    QB_KERNEL_ROOT = ""
+    IMAGE_BOOT_FILES:remove = "Image"
+
+    INITRAMFS_IMAGE = "core-image-initramfs-boot"
+    # not for initramfs image recipe
+    IMAGE_CLASSES:remove:pn-core-image-initramfs-boot = "uki"
+    IMAGE_CLASSES:remove:pn-core-image-initramfs-boot = "sbsign"
+    IMAGE_CLASSES:remove:pn-core-image-initramfs-boot = "testimage"
+    IMAGE_FEATURES:remove:pn-core-image-initramfs-boot = "ssh-server-dropbear"
+    CORE_IMAGE_EXTRA_INSTALL:remove:pn-core-image-initramfs-boot = "ssh-pregen-hostkeys"
-- 
2.43.0


