Return-Path: <daniel.diaz@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F87C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 19:33:35 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.83648.1674761605458720439
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Jan 2023 11:33:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=m0sbzoBo;
 spf=pass (domain: linaro.org, ip: 209.85.160.51, mailfrom: daniel.diaz@linaro.org)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1633e6f83d4so3768934fac.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 26 Jan 2023 11:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QS7Kg1IorHw5BYmhZCUW87EC8xj7ljc3x+h3mwGXQJo=;
        b=m0sbzoBoMN0A00kmBjdfmGyZ7bxQnrlgKebS/MqgaNUN6wSRpdULFC3XeOeI9I1MW5
         4MKmz3fMQQ9YwJhQxh7G8b0+tNqwAx6rE6vixDD3c6EC+Q/567RBkWzLGmhgHsILDJ5M
         5ZxUIFA73czN+S3gw3as50Y02YjVEkyW6pAT1Q6aB4fVczH9cnjLcpOyxB5ltnIBhxd8
         Tm6lYwtObVX+HfpgM2EKopO/phf0GsqsLHUFXDsN0fgEikCrfdAu8vgFLQSZKTK6I9qK
         O4Agoj1L1KqYFy/0nTtS2f8byABtiJcEAQ0kHxE0qhODczI01kBsBMknb+xdirwaPsLk
         ztzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QS7Kg1IorHw5BYmhZCUW87EC8xj7ljc3x+h3mwGXQJo=;
        b=WBiUMx85KR4OGV8oRF4mpW6QHOFWIL6Y3+ik5kDxKbXP87fx9iPo5o2K6JD8qECJBo
         idribdQS1txkmezaGIvR2CwwkI8r5yzRijpoAnrh8Y6lkIeMiOlp3BufWAeaBl2jZ9Gk
         qY5i6ImhDfxYLNYp578kt5VL+ICu5ryArFKzxhRx5ZtJbjTX1Ik8UF1MQju4v6elaqqo
         mqLbREDjHRuwp3QlcCKhq6tpWcw+mw8Yx0sUDd0QuJH6uABnBiafkPGIMpO1yRmqP9te
         4e0JSpuWo1x04Vj6AW7Y83TDaBSjOhgnGIIDHyQdFsE2T61B7RogFy/nY4PiHXFsHQmB
         5jxA==
X-Gm-Message-State: AFqh2kqAD+hFxWpcGrnYLztZ/3vkPPhDj/6V4BtWYgr7slTSOZDRWUhn
	/ppcnrKsmQaCYjakW/18RwB9OvJb+n7caWVNwUs=
X-Google-Smtp-Source: AMrXdXtCT1iqh/CI/M+oQd4ysgFgaJ+S1D+/iqK8GQXL6fvjA7vWN5fZkmLv+s3h+0m2HzryNuxTfg==
X-Received: by 2002:a05:6870:cd0f:b0:144:c95f:a305 with SMTP id qk15-20020a056870cd0f00b00144c95fa305mr21051765oab.29.1674761604422;
        Thu, 26 Jan 2023 11:33:24 -0800 (PST)
Received: from alago.cortijodelrio.net ([189.219.72.83])
        by smtp.googlemail.com with ESMTPSA id g22-20020a9d6496000000b00684bede5359sm865445otl.42.2023.01.26.11.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 11:33:23 -0800 (PST)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
Subject: [PATCH] arm-bsp/firmware-image-juno: Fix deployment of compressed Image
Date: Thu, 26 Jan 2023 13:33:07 -0600
Message-Id: <20230126193307.154631-1-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Jan 2023 19:33:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4322

A recent commit compressed the kernel image (to Image.gz) and
by default enabled an initramfs image. In the case for when
such that (initramfs) is not desirable, the deploy step of the
Juno firmware will still try to install the Image file, (not
Image.gz), so this fails:

  ERROR: firmware-image-juno-1.0-r0 do_deploy: ExecutionError('/oe/build/tmp-glibc/work/juno-oe-linux/firmware-image-juno/1.0-r0/temp/run.do_deploy.360477', 1, None, None)
  ERROR: Logfile of failure stored in: /oe/build/tmp-glibc/work/juno-oe-linux/firmware-image-juno/1.0-r0/temp/log.do_deploy.360477
  Log data follows:
  | DEBUG: Executing python function sstate_task_prefunc
  | DEBUG: Python function sstate_task_prefunc finished
  | DEBUG: Executing shell function do_deploy
  | cp: cannot stat '/oe/build/tmp-glibc/deploy/images/juno/Image': No such file or directory
  | WARNING: /oe/build/tmp-glibc/work/juno-oe-linux/firmware-image-juno/1.0-r0/temp/run.do_deploy.360477:152 exit 1 from 'cp -L -f /oe/build/tmp-glibc/deploy/images/juno/Image /oe/build/tmp-glibc/work/juno-oe-linux/firmware-image-juno/1.0-r0/image/juno-firmware-19.06/SOFTWARE/'
  | WARNING: Backtrace (BB generated script):
  | 	#1: do_deploy, /oe/build/tmp-glibc/work/juno-oe-linux/firmware-image-juno/1.0-r0/temp/run.do_deploy.360477, line 152
  | 	#2: main, /oe/build/tmp-glibc/work/juno-oe-linux/firmware-image-juno/1.0-r0/temp/run.do_deploy.360477, line 163
  NOTE: recipe firmware-image-juno-1.0-r0: task do_deploy: Failed
  ERROR: Task (../meta-arm/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb:do_deploy) failed with exit code '1'

This updates the else case for when an initramfs image is not
in use so that the right kernel image is deployed, by using
the KERNEL_IMAGETYPE variable, to use either version of the
kernel image.

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
Please backport to Kirkstone.

 meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
index 473d28cc..45f2ec72 100644
--- a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
+++ b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
@@ -66,7 +66,7 @@ do_deploy() {
         cp -L -f ${DEPLOY_DIR_IMAGE}/Image.gz-initramfs-juno.bin \
             ${D}/${UNPACK_DIR}/SOFTWARE/Image
     else
-        cp -L -f ${DEPLOY_DIR_IMAGE}/Image ${D}/${UNPACK_DIR}/SOFTWARE/
+        cp -L -f ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} ${D}/${UNPACK_DIR}/SOFTWARE/
     fi
 
     # Compress the files
-- 
2.34.1


