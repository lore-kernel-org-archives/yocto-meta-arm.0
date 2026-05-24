Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A708CD5BB1
	for <webhook@archiver.kernel.org>; Sun, 24 May 2026 10:39:34 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6043.1779619172048435598
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 24 May 2026 03:39:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pk0wwdru;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d734223e4so5598633f8f.0
        for <meta-arm@lists.yoctoproject.org>; Sun, 24 May 2026 03:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779619170; x=1780223970; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=m7BCe93NlxerXKNVkv8vC94m/EwwrKIIiRGnZlpG1XU=;
        b=pk0wwdrupxFEEGdpupKnwV7ColoJmuysBEtrA3uh6+HgFIczfFmLwZFL+K+XYCfRVi
         g1aCllCb/3PrLGkSC0FSJuQuCZ8bQvQkPNWuv1ZqRFkGnlgDSSzl+wOXfE8xDclCtwMU
         P/x8zGDXobQPdkioBHTGGDf1yS+V5htMI0vSqDKUDXds70V6E7evoKii0p96HR6zoHFt
         DGCCWNo1DVTNgOW1TA23CRcddLPKmUCSOAtqKjznRCWBsFXMuLrAr5rFoRNBfKj/a6iF
         wVBKmTmXJcdyO+RkcWWDK4uUR3DeDFcu6HFSX7dgFytomOR+hiTOiPMJtFSiZYhK9j1G
         M2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779619170; x=1780223970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m7BCe93NlxerXKNVkv8vC94m/EwwrKIIiRGnZlpG1XU=;
        b=hAqB3z1XPZW01twGGTZ7dNVJBr8TGPBlw9zThb8eXgfgG9NbDl27h2CZ2PIk3YhMl9
         V+TviLizOec4rydMpIbz9vij4DyoQXIQUhnzRPL41vpnloiD6ix4xKPaV5rgltum0YIw
         TR3YQWNAGf+FgVVlDwZVXHeu4oo9gGLsywIM4cFxojqysvdLCDChm/HQ5U6Dl6LHrf43
         nL/S67RHLYd1ETxemjFplqftImQQ+WZAFyUeHqStRD8cuGXgDalZR9u8jYYT+cj7469G
         GsWzzpbGjzz+ttRdkGojC9la5LePe1+fjzH2+LrX7A8Ud6OsWtT9qoMLMzi+8DDIa6OF
         h+sw==
X-Gm-Message-State: AOJu0YywZn+aWPTDeyr1c7xBVTBu30EIc/oE+0Caa5ha+lEv7tFzhAzp
	iBPbKs3+mXIgXPcyUQa68+XstQd+mA9Z8zY3htTGTR9YF9Kj6bTYvqxKX84y5dVp
X-Gm-Gg: Acq92OGG2c6Xna5fc623w5gtUabWqgSXpQ9NvBLL1kUDsQ9dpDiMrRKuu9cSzNi5gFO
	a0O//OiQr6saBx9lGM6RbaK0Db33L0H0IQlHv50NHYUgDZD78eHN26q4supg78DlFaJ4sDdDXXm
	GEDsJkZ1/3AYEJZES3YwkGqYT0Ndx+jQkwa9fL41KGN0MK0XAF4SQAjXdVzhJFp1AgyRnt+F/Mj
	peSrkAPfGF1ZRu721+WMG75qwSqEK7qeRxyIc7AJqBpz+9WhXDwGVPbafDS25tHe0MRZgxEHH+H
	5LwCCaXZs4hKYaqG1nn/tRrlH8uGGmkth0pEs+R0pOYUVxJWRL4R9gz/LqNNAF8APKaQZwQAHLf
	jEpqWCwY+htgIg5OMojDSxWWdaJR/RrSJbmI+G2wSLvH0XenrD4yFP1xdvF9XEedxo0DH99Gla3
	dQYf+1UhVURz613eEJo9jpSD9hfX5CcMg=
X-Received: by 2002:a05:6000:2798:b0:45e:733a:a0ff with SMTP id ffacd0b85a97d-45ea31290bcmr15199218f8f.3.1779619169843;
        Sun, 24 May 2026 03:39:29 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9ba2esm19290072f8f.8.2026.05.24.03.39.29
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 03:39:29 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/trusted-firmware-a: don't set LD if LTO is enabled
Date: Sun, 24 May 2026 12:39:28 +0200
Message-ID: <20260524103928.3104830-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 24 May 2026 10:39:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7060

Some platforms (like Allwinner A64/sun50i_a64) have LTO enabled
in the Makefiles, which causes a linking error when using ld:

| [...]/aarch64-oe-linux/aarch64-oe-linux-ld: -f may not be used without -shared

Add an option to be able to indicate in the recipe if the plaform has LTO enabled,
and only pass LD to make in case LTO is disabled, otherwise let it use $CC (as set by the Makefile).

The option is disabled by default to keep the existing behavior.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>

---

I ran into this while working on a PinePhone project. If it would be better to
use CC explicitly instead of leaving LD empty (or anything else), let me know.
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc    | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 6a2c0da9..62204042 100644
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
+EXTRA_OEMAKE += "${@'' if d.getVar('TFA_LTO') else "'LD=" + remove_options_tail(d.getVar('LD')) + "'"}"
 
 EXTRA_OEMAKE += "CC='${@remove_options_tail(d.getVar('CC'))}'"
 

