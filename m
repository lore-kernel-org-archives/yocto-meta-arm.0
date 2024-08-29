Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54AECC87FC8
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 16:32:26 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.24077.1724949145169787445
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Aug 2024 09:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ezgfvhxQ;
 spf=pass (domain: linaro.org, ip: 209.85.128.182, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6b47ff8a59aso8107877b3.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 09:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724949144; x=1725553944; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkm13HMFP9FZqmdlE0W6Vw5KdIWOyYYCxFLq8AqBJLI=;
        b=ezgfvhxQ4WORxBlXLdOimaHzujDgyGQ5xSdUjkZnvB54hvrsnzrcqMDgPDotYvQTAn
         PBAmDWd/NCYK9MMPfnrkueuh2OqsO0WWJUT3zVIpISBo4eGOGEkO5ieRRmJCa6q8uZIS
         gkSrq/ikWY41IGq7w9a/9CIsv52v0r1plnvOmMe2JnG0aoJ26dEaFtvyZPaCiX+1gyKQ
         8qvE6YqbPf4yPZu9HZi1RiEMFOvC6OZOcbmZ37yphK7ix1BKOsN9zWC4omwRGsi/K64A
         2uTTPXbup+xE7EiRPcPnkSvpB5zSUODjaT7DcKYpPMDMT/9oQDEHq6C8lxNgFUp7Zj/T
         /YIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724949144; x=1725553944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rkm13HMFP9FZqmdlE0W6Vw5KdIWOyYYCxFLq8AqBJLI=;
        b=qwtgzIrvFTh8pkzuga6g/ExuLdW7Ubnyi3CRO7cHQPhp5CtbI9KSpur3dmStEQ9TmU
         mVNXf9OjzRFVf7jUKYR6MKZMt1OyUhwBFDfFSonEgV8H5/Oj5VLF5YDaJYstCQmzdDQW
         HiEeTE/5OGI/Pxzj3UyBwO+Y0cnJA5IR40wtVUFKulExXQSwnawwdh4gga7nEGdeDsnd
         1GHBCFeX11gP613AbRNeT30mrwUMxKSlsGGOnofgSks1tV9iVhFUzjX/F2em0DrtqijP
         4IsAY7f7pqaNevFnBd1g6aFWUCnKS0c7yuovDJiceIPHg5eViaI9TGQSz7RQ5+CViLQl
         5M1A==
X-Gm-Message-State: AOJu0YxXJ00+3vvPKADA/kVFJu45Hht9X+ZJaJLczZwl2vMG+GmW90kl
	GD7M9BZnldFI1zh3+8SJBpwkdLlAEklVR2NF3PJgXZyWyRi0ulwBfKgh0n2pRqsRR17KHRTurjF
	K
X-Google-Smtp-Source: AGHT+IHWl8i6H0FO4L03vjlsd8PoJqq2Q7g8KPtfHc70nRtlfbRH8usNtD9bww6owzExpSpe0xPORg==
X-Received: by 2002:a05:690c:e1d:b0:62f:9e2d:3e5d with SMTP id 00721157ae682-6d277f51ed8mr41938227b3.43.1724949144108;
        Thu, 29 Aug 2024 09:32:24 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d438e18asm2993517b3.60.2024.08.29.09.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 09:32:23 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v4 10/13] linux-yocto: Setup UEFI and sign kernel image
Date: Thu, 29 Aug 2024 10:32:06 -0600
Message-ID: <20240829163209.47945-11-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240829163209.47945-1-javier.tia@linaro.org>
References: <20240829163209.47945-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 16:32:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6020

efivarfs kernel module is required to access EFI vars.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 .../core-image-minimal-uefi-secureboot.inc    |  8 ++++++++
 .../linux/linux-yocto%.bbappend               |  2 ++
 .../linux/linux-yocto-uefi-secureboot.inc     | 19 +++++++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc

diff --git a/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc b/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
index 2232d3b3..06046f6e 100644
--- a/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
+++ b/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
@@ -1,3 +1,11 @@
 inherit uefi-sb-keys
 
 WKS_FILE = "efi-disk-no-swap.wks.in"
+
+# Detected by passing kernel parameter
+QB_KERNEL_ROOT = ""
+
+# kernel is in the image, should not be loaded separately
+QB_DEFAULT_KERNEL = "none"
+
+KERNEL_IMAGETYPE = "Image"
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
index a287d0e1..29c21355 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
@@ -25,3 +25,5 @@ SRC_URI:append:qemuarm = " \
 
 FFA_TRANSPORT_INCLUDE = "${@bb.utils.contains('MACHINE_FEATURES', 'arm-ffa', 'arm-ffa-transport.inc', '' , d)}"
 require ${FFA_TRANSPORT_INCLUDE}
+
+require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'linux-yocto-uefi-secureboot.inc', '', d)}
\ No newline at end of file
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc b/meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc
new file mode 100644
index 00000000..cb62fdee
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc
@@ -0,0 +1,19 @@
+KERNEL_FEATURES += "cfg/efi-ext.scc"
+
+DEPENDS += 'gen-uefi-sb-keys'
+
+inherit sbsign
+
+SBSIGN_KEY = "${UEFI_SB_KEYS_DIR}/db.key"
+SBSIGN_CERT = "${UEFI_SB_KEYS_DIR}/db.crt"
+
+# shell variable set inside do_compile task
+SBSIGN_TARGET_BINARY = "$KERNEL_IMAGE"
+
+do_compile:append() {
+    KERNEL_IMAGE=$(find ${B} -name ${KERNEL_IMAGETYPE} -print -quit)
+    do_sbsign
+}
+
+RRECOMMENDS:${PN} += "kernel-module-efivarfs"
+RRECOMMENDS:${PN} += "kernel-module-efivars"
-- 
2.46.0


