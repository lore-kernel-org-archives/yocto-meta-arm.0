Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
 by mx.groups.io with SMTP id smtpd.web10.9623.1583938568246714854
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Mar 2020 07:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=XDD2WeNt;
 spf=pass (domain: linaro.org, ip: 209.85.210.67, mailfrom: daniel.diaz@linaro.org)
Received: by mail-ot1-f67.google.com with SMTP id a6so2219018otb.10
        for <meta-arm@lists.yoctoproject.org>; Wed, 11 Mar 2020 07:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2DtJmHGffnRbek3Gug6wy52uubjN2xAe1Z2gyBzdb+0=;
        b=XDD2WeNtcsF/f4hFMBS++QRwbhqoB9bJ1hZiik/aeFdhQxtrBf2+hmwbhUCR9uKg8x
         PwLkXjTXhS11/VTFzxuuxfLbEVF6MalQK0ezuS6BlMCzh5fXjHeyvAi2ugnFHZFtKN21
         ee/FQ2tV++qPvuo4NFYLQe52pi/7518aDN9kWV+e6a6ju3xjp5jCHZV5d4HDDlNKqQMj
         aPll/4Sv2FN0x2Jnag7bmDBNF/dsVGuXj7UbO3gIta1ZgoNysTee8gIQ6luRWhvFh5z2
         MEOp2HrSaflVo1lL/DQh7uGkA3mfi5LYUUxYBmUWOtH3C50G7UAZC8yFMzI/lzto6zbV
         XwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2DtJmHGffnRbek3Gug6wy52uubjN2xAe1Z2gyBzdb+0=;
        b=JTEORiob83xMEs1FrmY5pGZmDk+8DgDxW3QjWZNHEpNpqNt2e5D69sL6wqidrdn7XT
         p2bv49+n49H7A0EzMuwbGm3p0xAJzhJU4BzdCgpBJs2ewkE7kzgHjvZffTqgu/o6OXe+
         hNuvBxE8uMp71pK5gtvf4RG2HacxzfEVXzLK2HCugNwqxOFQEcJB1Ij9PyBd6CS2N/WU
         3+kD0ElMEmSWR5+OH2hYRKwn4EHfkA9wJWepWU2Jfe2DLg+QzSZQlBtcU1kGk33TS7E1
         0MljSa4179eq8wMliP7HcaRa0b0A89dOFjdaTIgEnUuRt+sgEbjwcc0A5mcoQKh0nIv/
         GcOA==
X-Gm-Message-State: ANhLgQ0AuyXABP3szGLSni3kWhUnwRsU4AH/+3d2c9Q4zeWsXGLusxEp
	XPrRoTP/nZn6fq6l9CNMOvJ1FfRxizc=
X-Google-Smtp-Source: ADFU+vvQu5FIycz2QcMolpWlXHoQyRzfXQOWB+Rt04/HAHC9hp52GOsaza2E/SwgN8gvSCThFzMV0A==
X-Received: by 2002:a9d:12cc:: with SMTP id g70mr2520857otg.115.1583938566865;
        Wed, 11 Mar 2020 07:56:06 -0700 (PDT)
Return-Path: <daniel.diaz@linaro.org>
Received: from alago.cortijodelrio.net (CableLink-189-219-74-147.Hosts.InterCable.net. [189.219.74.147])
        by smtp.googlemail.com with ESMTPSA id t21sm14262617otk.13.2020.03.11.07.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 07:56:05 -0700 (PDT)
From: "Daniel D?az" <daniel.diaz@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
Subject: [PATCH] conf/machine: Make preferred virtual/kernel overridable
Date: Wed, 11 Mar 2020 08:55:24 -0600
Message-Id: <20200311145524.7665-1-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A user of the BSP layer may decide to use the machine
configuration but a different kernel.

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 meta-arm-bsp/conf/machine/gem5-arm64.conf | 2 +-
 meta-arm-bsp/conf/machine/juno.conf       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/gem5-arm64.conf b/meta-arm-bsp/conf/machine/gem5-arm64.conf
index 4775940..e2f58ad 100644
--- a/meta-arm-bsp/conf/machine/gem5-arm64.conf
+++ b/meta-arm-bsp/conf/machine/gem5-arm64.conf
@@ -19,7 +19,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 
 EXTRA_IMAGEDEPENDS += "virtual/gem5-bootloader"
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?= "4.19%"
 
 
diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/machine/juno.conf
index a728d0a..3b16e6f 100644
--- a/meta-arm-bsp/conf/machine/juno.conf
+++ b/meta-arm-bsp/conf/machine/juno.conf
@@ -18,7 +18,7 @@ IMAGE_FSTYPES += "tar.bz2 ext4"
 SERIAL_CONSOLES = "115200;ttyAMA0"
 
 # Use kernel provided by linaro (Contains support for SCMi or HDMI)
-PREFERRED_PROVIDER_virtual/kernel = "linux-linaro-arm"
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-linaro-arm"
 PREFERRED_VERSION_linux-linaro-arm ?= "4.19%"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
-- 
2.20.1

