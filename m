Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32ABECD5BB1
	for <webhook@archiver.kernel.org>; Sun, 24 May 2026 11:08:14 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6295.1779620892279259415
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 24 May 2026 04:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WrvXPD40;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4904fd4f6aeso11517485e9.2
        for <meta-arm@lists.yoctoproject.org>; Sun, 24 May 2026 04:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779620890; x=1780225690; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2jLFtV7m1VuDeFdisqYo33jTQVdqF5CCcON7peVbV9g=;
        b=WrvXPD40ZTa6JZiCCO3fHLY5LtvoBjZCmB9utd3drsLbxGFIymgeF5mzn+7V18A9ZL
         qvoIxxumWSdLs+f5Smg75W/h+oSTrcecvaxA6FsbskNyZbAo9fmD7ABVvR+mvcif6Nkk
         2vbkJBlVKYV3msV8EWiZM18WPI7ci5kWPc+CjkAAFyk7OiGIhysSTklGEqiLheM3GUQb
         DhOm7+ybBnqkcLiAXG12MjnPOxe36Y6lENKlergP+JHKPZxNYDzvE9pjtUBwzFFHOFnb
         xoKdOzopk6WgkXF+JzKagX9DcOaSQQuI7lBXNbKGGYYtBP55FIOWkAFx3pTVl2XJzQNz
         KJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779620890; x=1780225690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2jLFtV7m1VuDeFdisqYo33jTQVdqF5CCcON7peVbV9g=;
        b=rVQQUDEmu2ixaM0IVr1p9S8rK0ATc5jxXeyxqH3N9R/WDduW3FR4XXXN9ThuyYeMrX
         kXC/o5yt6EEYlftPKLl9CmDRtzPVNN7cbzVduq0mHa8dnBn9iyU005gA9I+dhZD0PsbO
         D+bYShF6rjoo25JJALmhob90GEzMKfkYlCstwLawANvdnbpswT4UtzliHzFOC/mUYddw
         Y3/XaL6HCxBnaxrweEMHS8/eHFm8q50F8feQ0KlAwnrZ2okvt2mfkRhDoN2gWyBemQBO
         kS2gmYDMDBmsdhJpuQtNWWz5hE57n53PyYiXq2/M/jPVMwoH8FG5w1ZdJYdn70Q1Mhpo
         NlGw==
X-Gm-Message-State: AOJu0YyVFd9OfxmTSTXNZjO2Sm8fBlkxbNMGyCsRtJFrsfOTvPCW8bd5
	EKrWarxEDMyS7UOiGAa/kuGhf6Sk7si/IOtr2Rq/oLteOFM0mBhqjtWkUWydbPZf
X-Gm-Gg: Acq92OHKM4qX6NVYy0pxst3I5BGC3L4kljldtCjo1IJE6c2QOpEmbm6dxyJYbi02aje
	B5MAkvI4CQf71Jqh2gBm1gG2MWGMoWh/qmDHK6R0fA2x0wjeELJJSq4FHeCvwDE0lhJmA/ZTXEO
	jOcMV63O0HPRp+Cd3XFeMSygDA50cq0RU04RmzKCNXRLvlGSxcAk2iai/d8ME5cWDdNz6rVGyDF
	gbYMPDYLxF3P3EwIc8331anSSnY5xmNEV+bidYGCFo1yz0mDViTpJdspu9lFQe6TOhV3W1VyHh1
	y+z5xL/uDTWZV8tMkCyym5gbkD4UopXJi9oaJbhuFPhIoySPHgL5WVV2x9azBzRJOJ4IR7UcEFY
	k8nTgpfTegLiiJzOjlR/cwESXsIF80c9TadmHMQXVDsSVDi0PVKyz/2ToPICgs+9MhirgmrSrcg
	7sR3gj8KOHyyTw6UYvARTh
X-Received: by 2002:a05:600c:310c:b0:490:53d3:4753 with SMTP id 5b1f17b1804b1-49053d34968mr85395755e9.31.1779620890231;
        Sun, 24 May 2026 04:08:10 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454ac6a6sm178043755e9.12.2026.05.24.04.08.08
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 04:08:08 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2] arm-bsp/trusted-firmware-a: don't set LD if LTO is enabled
Date: Sun, 24 May 2026 13:08:07 +0200
Message-ID: <20260524110807.3219388-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 24 May 2026 11:08:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7061

Some platforms (like Allwinner A64/sun50i_a64) have LTO enabled
in the Makefiles, which causes a linking error when using ld:

| [...]/aarch64-oe-linux/aarch64-oe-linux-ld: -f may not be used without -shared

Add an option to be able to indicate in the recipe if the plaform has LTO enabled,
and only pass LD to make in case LTO is disabled, otherwise let it use $CC.

The option is disabled by default to keep the existing behavior.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

I ran into this while working on a PinePhone project. If it would be better to
use CC explicitly instead of leaving LD empty (or anything else), let me know.

v2: The opening quote was placed at a wrong position - should be fixed.

 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc    | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 6a2c0da9..3819a6de 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -38,6 +38,9 @@ TFA_ARM_SPMC_MANIFEST_DTS ?= ""
 # Build for debug (set TFA_DEBUG to 1 to activate)
 TFA_DEBUG ?= "${FIRMWARE_DEBUG_BUILD}"
 
+# Set to 1 if the platform has LTO enabled
+TFA_LTO ?= ""
+
 B = "${WORKDIR}/build"
 
 # mbed TLS support (set TFA_MBEDTLS to 1 to activate)
@@ -106,7 +109,7 @@ def remove_options_tail (in_string):
     from itertools import takewhile
     return ' '.join(takewhile(lambda x: not x.startswith('-'), in_string.split(' ')))
 
-EXTRA_OEMAKE += "LD='${@remove_options_tail(d.getVar('LD'))}'"
+EXTRA_OEMAKE += "${@'' if d.getVar('TFA_LTO') else "LD='" + remove_options_tail(d.getVar('LD')) + "'"}"
 
 EXTRA_OEMAKE += "CC='${@remove_options_tail(d.getVar('CC'))}'"
 

