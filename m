Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB1FEC4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 18:25:45 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.2669.1713896735880062924
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Apr 2024 11:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=E1uM8pvB;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-434d0f63c31so36736881cf.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 23 Apr 2024 11:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1713896735; x=1714501535; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G7c5HpsMSzYs0xw318u9bCTABHy0xWQH0PtsRQXYUU8=;
        b=E1uM8pvBzMwaIk6sZuKEMPIozkQldQuMkIg8oJfpRUsN9EeN/6sItnI39HOydlML7n
         kQwZ1xOSX3zrflh8hHixMFMdvDDmTQzEY5dZB/141XUaGiIik8nIRx98/DUyzYrNGcN/
         ELB9i0vFRoY0W9ZbAdmTUSNX8De+Q/erhgMgg+JwtIzxp3Ok5NUnBBzzb12/IZr0XHfu
         sfihY8SDjrIj6JlThQ09OgGmkXuw7Xk3W6/dIdJEb/PCL/Lt+cPCNUvS78IYRl5vSn4a
         HVfHZJIyzj6gDAwQ3WlSmxojbVSUzGMc5Ri1D7Ml6ormOwMlMBNF2hnKDjrBmGMbkxN6
         R0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713896735; x=1714501535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G7c5HpsMSzYs0xw318u9bCTABHy0xWQH0PtsRQXYUU8=;
        b=YH9x66TkR7+pqLFmQzQK9Pt8AJfBKeu3R0ejhoq/+MCgXm2Otq1JhOWuHHN8aQ459R
         G4sfaI5Zu5dX59fpBfVPEKOCH6t6GSBfnonsbEb7azbU+iuIGIyd/zpFcC+BmABsJOcK
         iaZrxodt9cBdyAnjqofiC/M0HQEfOxEX2I2r1XeHABvWfs9KPOo9KO83YtWQWtVDjDbV
         A5qiFeQGpq1Bl97QHDnY2/A8+mZbEK6Uwe1k6XDTTeynzOLRR9YLGo8EJ1EdJpQgdI7f
         3acrQSfEZdgslf5sSJbIVJY/9GHmjNiXlevqslAXqVtiOMXzXFbzJBRXfaTR2tXkyQC/
         Cmdg==
X-Gm-Message-State: AOJu0Yw+00zpj9+leOBmwGLVI746ZQDaIivtsXf3NSEc5beHbfJmddCn
	qFzdoo+Vaanx0Vfwe4rBi8sVan7DV9ae9Bd4DMee6OH6sDXQxRhKS7fl3Daj9WBv4bO+6nJWdZA
	=
X-Google-Smtp-Source: AGHT+IGZ32M56y0GoTwA6JUv+alraiDO1O0meQt/yj2BjOOFqORNstMr3pHwVkt40sYPfOkJCCDZ6Q==
X-Received: by 2002:ad4:4345:0:b0:6a0:745b:f4fe with SMTP id q5-20020ad44345000000b006a0745bf4femr190520qvs.54.1713896734865;
        Tue, 23 Apr 2024 11:25:34 -0700 (PDT)
Received: from localhost ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id ez4-20020ad45904000000b00690c77505bdsm4495924qvb.37.2024.04.23.11.25.34
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 11:25:34 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] Revert "arm-bsp/corstone1000-flash-firmware-image: add nopt generation"
Date: Tue, 23 Apr 2024 14:25:17 -0400
Message-Id: <20240423182517.2590896-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240423182517.2590896-1-jon.mason@arm.com>
References: <20240423182517.2590896-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Apr 2024 18:25:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5600

This reverts commit e6ff022d6d3d6cbcbd9b30006a75be69f7d35c29.
---
 .../images/corstone1000-flash-firmware-image.bb | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.bb b/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.bb
index 5238d1d34fff..73fc17664d87 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.bb
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.bb
@@ -38,11 +38,6 @@ RE_LAYOUT_WRAPPER_VERSION = "0.0.7"
 TFM_SIGN_PRIVATE_KEY = "${libdir}/tfm-scripts/root-RSA-3072_1.pem"
 RE_IMAGE_OFFSET = "0x1000"
 
-# Offsets for the .nopt image generation
-TFM_OFFSET = "102400"
-FIP_OFFSET = "479232"
-KERNEL_OFFSET = "2576384"
-
 do_sign_images() {
     # Sign TF-A BL2
     sign_host_image ${RECIPE_SYSROOT}/firmware/${TFA_BL2_BINARY} \
@@ -61,15 +56,3 @@ do_sign_images() {
 do_sign_images[depends] = "\
     fiptool-native:do_populate_sysroot \
     "
-
-# This .nopt image is not the same as the one which is generated by meta-arm/meta-arm/classes/wic_nopt.bbclass.
-# The meta-arm/meta-arm/classes/wic_nopt.bbclass removes the partition table from the wic image, but keeps the
-# second bank. This function creates a no-partition image with only the first bank.
-create_nopt_image() {
-    dd conv=notrunc bs=1 if=${DEPLOY_DIR_IMAGE}/bl2_signed.bin of=${B}/${MACHINE}_image.nopt
-    dd conv=notrunc bs=1 if=${DEPLOY_DIR_IMAGE}/tfm_s_signed.bin of=${B}/${MACHINE}_image.nopt seek=${TFM_OFFSET}
-    dd conv=notrunc bs=1 if=${DEPLOY_DIR_IMAGE}/signed_fip-corstone1000.bin of=${B}/${MACHINE}_image.nopt seek=${FIP_OFFSET}
-    dd conv=notrunc bs=1 if=${DEPLOY_DIR_IMAGE}/Image.gz-initramfs-${MACHINE}.bin of=${B}/${MACHINE}_image.nopt seek=${KERNEL_OFFSET}
-}
-create_nopt_image[depends] += "mc:firmware:linux-yocto:do_deploy"
-do_image_uefi_capsule[prefuncs] += "create_nopt_image"
-- 
2.30.2


