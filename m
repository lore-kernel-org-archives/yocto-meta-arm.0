Return-Path: <rui.silva@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D7F6C433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 14:41:40 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.11651.1648824099696327374
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 Apr 2022 07:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=oswFaFAK;
 spf=pass (domain: linaro.org, ip: 209.85.221.47,
 mailfrom: rui.silva@linaro.org)
Received: by mail-wr1-f47.google.com with SMTP id m30so4613199wrb.1
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 Apr 2022 07:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S/QgDZq3iCEzZT0qPr/hIxilVTEfN4fUV1JxOKIWQws=;
        b=oswFaFAK6w0GtUsfpfuvVP1JWqvGgpLpti4k8R6KACtyGpi79Yz8lPitqBgfuO1SZB
         wl8cKuglz/MFosY7srF8E790QI9WaRgMNL/mFisXM7JZfIimo+bDgXEMFvyGuHcp5p4o
         7qTV5MKZPJh6yEY0ZdiI9X1g580E0VqCmdH+XjYJZBBlKkl5nnEGL4Zi5HLuDFY0PqBJ
         KX7/UUWduVmD4votexPEs1yw6x/0ec/m6/9+mAT/SlxcPhgm+33JoIbSXorxpuy0lZNy
         X3uM07n7rQ7tuApp0JaliGR26AzxktfZGAmJX5tEhIeoHqIl7HaS5wSL7KfrufD4P9YS
         TCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S/QgDZq3iCEzZT0qPr/hIxilVTEfN4fUV1JxOKIWQws=;
        b=oinxOg4x+JaZku28xLkZTq2z+1fOxAClMhuATtKaJ9mP7jzlR9fAP8shNHfNPDcE1G
         49K5MXLs+P/zPAG63UvQ3NdDESUI8pKsr67X9CuSROeg3PcRFiT0bfVVP+R7wm6+DS3U
         cKoI4p0or91oz3FHpI4ExTyQqJps8Yl6PJ8t1ioOGQ+MoljomlsfeMJ1vKUwNVIkXM4M
         IyEuiiiAIPkNxxsQyXcm/98g2j0frGlGd1+ocwzqNHarBJoRYjwrglWQQLivPUlXWlbj
         5r6zG1N3evZZ69b9EmDGX+5DsCJ37UnUFwR70pNobdyZVTXiulLxJaMAtH7R9bLXy+gc
         B1TA==
X-Gm-Message-State: AOAM530BM8zQ7Qoj0fte9EdH/ULBVw3qfqvkRg59Zt3G8TeuV51q+M+G
	4uuMYEcqUTsf3WybKrbxkJwbpZVDCaZytQ==
X-Google-Smtp-Source: 
 ABdhPJykNq6cweT+c78/Gcc4PJvymqY6Ro5GsShcefzO/ulQ2sz6nYVwlThvX61lKo5mhWJX5dIYNQ==
X-Received: by 2002:a5d:5981:0:b0:204:1da7:93d7 with SMTP id
 n1-20020a5d5981000000b002041da793d7mr8253254wri.621.1648824098119;
        Fri, 01 Apr 2022 07:41:38 -0700 (PDT)
Received: from arch-thunder.local (a109-49-33-111.cpe.netcabo.pt.
 [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b00203ff46f802sm3144144wrn.36.2022.04.01.07.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 07:41:37 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 2/4] arm-bsp/corstone500: add wks container for image
Date: Fri,  1 Apr 2022 15:41:26 +0100
Message-Id: <20220401144128.3517236-3-rui.silva@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401144128.3517236-1-rui.silva@linaro.org>
References: <20220401144128.3517236-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 01 Apr 2022 14:41:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3227

Add final wic image that is provider by corstone500-image
target. As at it, remove unnecessary specific filesystem
types.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 meta-arm-bsp/conf/machine/corstone500.conf | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/conf/machine/corstone500.conf
index ca0ca7b55b6f..2d939d19cfad 100644
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -16,12 +16,19 @@ PREFERRED_VERSION_linux-yocto ?= "5.15%"
 
 EXTRA_IMAGEDEPENDS += "trusted-firmware-a u-boot"
 
-SERIAL_CONSOLES = "115200;ttyAMA0"
+IMAGE_CLASSES += "wic_nopt"
+IMAGE_FEATURES += "debug-tweaks"
+IMAGE_FSTYPES:forcevariable = "cpio.gz squashfs wic wic.nopt"
 
-IMAGE_FSTYPES += "tar.bz2 cpio.gz"
+SERIAL_CONSOLES = "115200;ttyAMA0"
 
 # Corstone-500 u-boot configuration
 UBOOT_MACHINE = "corstone500_defconfig"
 UBOOT_IMAGE_ENTRYPOINT = "0x84000000"
 UBOOT_IMAGE_LOADADDRESS = "0x84000000"
 PREFERRED_VERSION_u-boot ?= "2022.01"
+
+# making sure EXTRA_IMAGEDEPENDS will be used while creating the image
+WKS_FILE_DEPENDS:append = " ${EXTRA_IMAGEDEPENDS}"
+
+WKS_FILE ?= "core-image-minimal.corstone500.wks"
-- 
2.35.1


