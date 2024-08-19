Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6525CC3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 19:04:54 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.1049.1724094286785101291
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Aug 2024 12:04:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=pBjXFOAs;
 spf=pass (domain: linaro.org, ip: 209.85.219.51, mailfrom: javier.tia@linaro.org)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6bf7658f4aaso23588906d6.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 19 Aug 2024 12:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724094286; x=1724699086; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNiYqaJ6/dp6Rz4Asy2D9hWleJVQzKyC4j+Ug6hTpEI=;
        b=pBjXFOAsGnoSTtfCuaTrTGyXVs6pKPZXN+nKZoC/gZn80dDmzWENwC4nUSOCW8m0aR
         nOUBNPM2iGIIamv/5NJQVy3jv0dK3QJsYdPtqAyuR6Fdrr6jl0wQbTNgZHYiEqqLXPwq
         a0E0TmniL6aZQ17RmjJPHAX+8/ewEu656UXdS351racgLe69WYX24zjKzrS5pkf0rtd8
         XT2Bmg/Wv+YrpyBFGg1fs3j/gCzKQHF2g2r/MmHyno2vNOjEw+DWqBnY0BB6nCnJEqCh
         28P3xPGtWe5ul40XSm01aUnH14EjfBCEPWYCDLL3Bp7kKtM/WU1X4G+2mM6c9rpwpEx2
         uUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724094286; x=1724699086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MNiYqaJ6/dp6Rz4Asy2D9hWleJVQzKyC4j+Ug6hTpEI=;
        b=N/E/40tPOSqak7EK/5qUSau6EFTEYUAqlpdMmPHAmRCJ2e0mU8LY7rAm2bqMvhGrfY
         /RCmIbZ8J3DtWWEKJV7GReLU5IIt8zv9SXpciKhyLYAF+SW9Qz8ympAZYPDspBleiDZZ
         6+xU9wloqeJtaqHPiJDkC3201maYikG5mGixIOJqLNpYqUH186veTzpZUtoUIn19qSgo
         OETbbcmtOfTsGLrN9JTRLd4TrNqlORfw7YvHyP9mnawfFH/pjpHVROaFMJz8OeTkaUDq
         +BBJrvrXtLAPS4WsvT+2I90Y0dFZHd16Z2MWC/C+x0cr8JbTL3cXj3qOBhdy2b+xR8pr
         uA8A==
X-Gm-Message-State: AOJu0YxKWcqISJh3Qt0qqL15Z1z7bFpP/5f3beE9qxvgbbCr7IicKaI9
	N52Qb33tSvJF/z3L/dDhigQrR1oO3/YaCVO4N+NF3y0jNVX/N50Rxj40NoqXA1cNNFvJ1Dkw8Go
	r
X-Google-Smtp-Source: AGHT+IGxHbi+ZsyHAuAvahs/GWf223TGabh/8vTvU7vsS88GBunbzmS/QQl/G7Sca8ELtMM6YQIsTQ==
X-Received: by 2002:a0c:fcc4:0:b0:6bf:7d3c:a64d with SMTP id 6a1803df08f44-6bf7d3ca727mr114239586d6.32.1724094285471;
        Mon, 19 Aug 2024 12:04:45 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([177.93.4.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fe06feasm45371756d6.40.2024.08.19.12.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 12:04:45 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v2 10/14] linux-yocto: Setup UEFI and sign kernel image
Date: Mon, 19 Aug 2024 13:04:25 -0600
Message-ID: <20240819190429.2897888-11-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819190429.2897888-1-javier.tia@linaro.org>
References: <20240819190429.2897888-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 19 Aug 2024 19:04:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5976

efivarfs kernel module is required to access EFI vars.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 .../core-image-base-uefi-secureboot.inc       |  8 ++++++++
 .../linux/linux-yocto%.bbappend               |  2 ++
 .../linux/linux-yocto-uefi-secureboot.inc     | 19 +++++++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc

diff --git a/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc b/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
index 2232d3b3..06046f6e 100644
--- a/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
+++ b/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
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


