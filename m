Return-Path: <adam.johnston@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7D9E7717F
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 14:10:43 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.16224.1734099034619685459
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Dec 2024 06:10:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=G+mWWg1n;
 spf=pass (domain: linaro.org, ip: 209.85.221.48, mailfrom: adam.johnston@linaro.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3862ca8e0bbso1558601f8f.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 13 Dec 2024 06:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734099033; x=1734703833; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFPhwLQ/7arkGYoIPC+YVm/4rkRwait7rB3L0ePlR2E=;
        b=G+mWWg1npJMm89kKkEH/d8SOGmpgzotGWLjTVmdrxT+WTOmIu98ZY/bv60ViG9ohlJ
         MLs7lJGXoCrJsHyy+zANoJefS8SUtJUhk51Yni/0Vfp1cB2vEIr1ZtBwVTcW7UWBjcnL
         QF4aAV9gXjszLEg1CvBsVafBi2iNnF1CvmD1ha7tcuA056yQvp3r7XY9+TNJrIjJ/Ah7
         DJ7V4KIJJF6UV0/okYQy3DGO0O4nYPQ50EQp8bko27y3zTwnyQiB7axjMeD0E+Q4ncRt
         v1msWUWFE5QtGispzq4Ee/1v3JCMUe0zkP9S4lfsXXoCe6l1pjkIK+fuN3t/xvk3Z8Dk
         1Hpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734099033; x=1734703833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFPhwLQ/7arkGYoIPC+YVm/4rkRwait7rB3L0ePlR2E=;
        b=bvLTndyj9Eckn3cnptjv3JuTuwAjhyA6DYekCQHw20L6oXUCzPUaT000uJTSKYq6nB
         2OJnhWpqwa6mxcCVDeQH4JrSHMxDWcoWcOA7xwSILyrkEjG2mWvNSJe1O3Ks9XqpNJ7e
         aPLLF4kxWvcce+o9ZZn2AHu4dqngAflQRNE8mGedbSSYvD5wwAjHlkR0V6ItkXQFsSa1
         En+/WPoeg5rJ7/4rcahLKAwc03QlxjzMio7ru7awplDaKBmzIR9YGdzBs1enf2FHqTkZ
         X/aqhmqvUIXL1+Wq2YccQCkIPAS7tGLLghgItIhGOnr96qplrUSpkIadlX46zR/ArQH2
         2rXQ==
X-Gm-Message-State: AOJu0Yw1Dmd5+n9zwpKNR1qoDVfwEGR3MCAPaS35BgqJiyZKgAvGm7+O
	or1l2TNAeZKoCOD0utQLxMjk7E61bK+aVcv9zqL9ZiqBRJhvCk6YGVQaOz+CyXQTf4A/qj2SHfP
	/NhQ=
X-Gm-Gg: ASbGncu3YqVNCpYQX7aJ+laQsyLI3OXeFnNXr3/HxHBqqw+u5oq8Wt4a7sow9r39lsX
	GCotKCKkJpBeNvTkQwXT9gy5423y8wGK4BeS/kNtvUcxPTiJ7U2S7jIzohzhwuvYknOwc4rfJui
	nDkKMzgd9m2c98fbniRGrtq8WEMhzxJt0wg/nzLndKIjTIQxQHYcjPU3TXs+bvxESXpdEe829Kn
	6ziTP9g0+BeAAYK8DzbfQNsSPL1AyPtv5WW1NykValxk00+dgXYmBfLzRv28ng7qf9b3zjvU5Tj
	HYTVxTBENxAVUG9feS/Qjbr8ipM=
X-Google-Smtp-Source: AGHT+IED6zUoUPF/HaInXNG5UpI2uxe+W+iQYbyPRU43rH/WV1KmGjf7jVxl6vPGvLH+H9WEB11cuA==
X-Received: by 2002:a5d:47c9:0:b0:385:ef8e:a652 with SMTP id ffacd0b85a97d-3888e0bf8f5mr2539773f8f.56.1734099032410;
        Fri, 13 Dec 2024 06:10:32 -0800 (PST)
Received: from ip-10-252-32-24.eu-west-1.compute.internal ([217.140.109.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4d19sm7196218f8f.32.2024.12.13.06.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 06:10:32 -0800 (PST)
From: adam.johnston@linaro.org
To: meta-arm@lists.yoctoproject.org
Cc: Adam Johnston <adam.johnston@linaro.org>
Subject: [PATCH 1/1] arm-bsp/corstone-1000: IMAGE_ROOTFS_EXTRA_SPACE workaround
Date: Fri, 13 Dec 2024 14:10:27 +0000
Message-Id: <20241213141027.486517-2-adam.johnston@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241213141027.486517-1-adam.johnston@linaro.org>
References: <20241213141027.486517-1-adam.johnston@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Dec 2024 14:10:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6287

From: Adam Johnston <adam.johnston@linaro.org>

When images are repacked IMAGE_ROOTFS_EXTRA_SPACE is ignored.
This is not necessarily a bug but an undocumented quirk of how wic
works.

Evaluate IMAGE_ROOTFS_EXTRA_SPACE and use the value with the
 --extra-space option. Note that, since IMAGE_ROOTFS_EXTRA_SPACE is in
Kb, the value for `--extra-space` requires the explicit 'K' suffix (the
default is 'M')

Signed-off-by: Adam Johnston <adam.johnston@linaro.org>
---
 meta-arm-bsp/conf/layer.conf                       | 2 ++
 meta-arm-bsp/conf/machine/include/corstone1000.inc | 3 +++
 meta-arm-bsp/wic/efi-disk-no-swap.wks.in           | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index bbe28be2..a1f0730d 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -28,3 +28,5 @@ BBFILES_DYNAMIC += " \
 WARN_QA:append:layer-meta-arm-bsp = " patch-status"
 
 addpylib ${LAYERDIR}/lib oeqa
+
+IMAGE_ROOTFS_EXTRA_ARGS ?= ""
diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
index 132d425a..791b17de 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -63,3 +63,6 @@ ARM_SYSTEMREADY_FIRMWARE = "${FIRMWARE_DEPLOYMENT}:do_deploy \
                             corstone1000-esp-image:do_image_complete \
                            "
 ARM_SYSTEMREADY_ACS_CONSOLE ?= "default"
+
+# Workaround IMAGE_ROOTFS_EXTRA_SPACE being ignored when images are repacked
+IMAGE_ROOTFS_EXTRA_ARGS += "--extra-space ${@${IMAGE_ROOTFS_EXTRA_SPACE}}K"
diff --git a/meta-arm-bsp/wic/efi-disk-no-swap.wks.in b/meta-arm-bsp/wic/efi-disk-no-swap.wks.in
index 6ae7ad9d..7b73f5b0 100644
--- a/meta-arm-bsp/wic/efi-disk-no-swap.wks.in
+++ b/meta-arm-bsp/wic/efi-disk-no-swap.wks.in
@@ -5,6 +5,6 @@
 
 part /boot --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}" --label boot --active --align 1024 --use-uuid --part-name="ESP" --part-type=C12A7328-F81F-11D2-BA4B-00A0C93EC93B --fixed-size 256M
 
-part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid --exclude-path boot/
+part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid --exclude-path boot/ ${IMAGE_ROOTFS_EXTRA_ARGS}
 
 bootloader --ptable gpt --timeout=1 --append="${GRUB_LINUX_APPEND}"

