Return-Path: <floss@jetm.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A245C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 22:03:45 +0000 (UTC)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7162.1788386615402330219
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Sep 2026 15:03:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@peridio.com header.s=google header.b=YQ3ab8zA;
 spf=pass (domain: peridio.com, ip: 209.85.221.176, mailfrom: javier@peridio.com)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c7d1fc8f9dso59885e0c.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 02 Sep 2026 15:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=peridio.com; s=google; t=1788386614; x=1788991414; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaO2sFW8GaGjB7L3+vGllkurxt6XnA74dI0qHmQVnTE=;
        b=YQ3ab8zArs/RFoEd+3D3/bCRBmkY5ekODzjpBX1mtmbbserPrrqNqEgVTijau1hBNl
         yY7bZjT88Tqui2EFI9K+FJx0s2go7QukBGKj9/KFuXPRVWDuKc4uqgRamxpEIGGz+RGz
         72TXDWS8czNmm5gPRKzOybakDDCE2pfE+/dgY41ZApeYKZdBVGeF3jlMFrVUmhRYNlY3
         0hKQSfDCoawVRdsU/L0/hgYpoF6YGXRwE5IraCsNH9q9iIAc8HyL+CxHhjz9wwnAiuHo
         Nv9FPXpIUvt7zCQRnl5uU8CNSpJnvQ66dJkIqoxQm+Jb5b2ts75zW/y3LTsJJ6xWR4cb
         DXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788386614; x=1788991414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yaO2sFW8GaGjB7L3+vGllkurxt6XnA74dI0qHmQVnTE=;
        b=CZyBuzYg83nwcnKIZrAXf08/GboQiVPD1Mwl1K/xikOeZfiYARBOVgF0G+4Ztomv5k
         S4KNUuH3pl+NLPag7Pgr9/U3nkYyoy9YA9ie9M5LLTKtSM26+IiLKESjemNy1B+y3VCX
         tXsYh3POxgNvioXp/3k1ZguxOiUIuDyKE1HOPD2/ubN0Rs0p4p83ZLrCjjm4EOpBBI1w
         Jxf0sJSYsgF3CEwW0f20pB5tgLe2ZAChUsiNaDbSoVml+F7k66qEClncCU1V1lLjrG/p
         Tr7F64tdcN4vTActHp6aQuvV6xjkBrgvCrlSuqQhtNtamn+To0bUNwBi5HJWNFqaI+YJ
         t8fw==
X-Gm-Message-State: AFuF++lPWLpc5z04ld65eVGUOzfFDkiZWf4Swz0rObQGolrBH9Bc9nQK
	tKdz1qr75ryaH79DYHvTEEiRGOGQs26MLhQX6UBENgYaINpZpT80BLQYj6n6ZA7am4jIB3DjJ4f
	BDhcffoc=
X-Gm-Gg: AYBFou2MAR1O6H6eyfmEm3K9PbGofzKl41DVsJ47oakf+xL4+Mxe90Icv3OUezFiaR5
	N7ZFF8+hSLTAi1IJ11uSosulTxTPUh7OhvadZ14EQvPNq/A5aq6RWfZLJxe4Yk9l8I79rFEtjmD
	K2lXBlnwSZoArYk6gN2/Dp1CoxY4YUhQqhaY+5/BIKS7xHJBx9Ad0vV3YomrH1b8vbQYP2K8jbF
	XfSnd+rYRj1cfWArRWfC4hmgViCtn2rmuoA+O6hPPbw0hg1HlMHYknGu9NntzeSoo0Jepehfc17
	XXzG+94mrffKggsjDkWVQI5gDIcmf1ED8msw2tPeNB88W0t5MfmOo3BgZ1wbV8HwgpOrjBvMGnB
	94jUFJyB6kHAhuw8bG09J68AIqfIYevHVOmni5Zer77J0peaDcgsnkNOGGMdM7MC4mYEl5FprKg
	LGVQWfondspoDJvCKj8UJxBc/N5Icm4SoVr6P3hS4yb7CSho7gdV2fo+k=
X-Received: by 2002:a05:6102:292c:b0:78a:135e:feb8 with SMTP id ada2fe7eead31-78a1f241009mr1260356137.0.1788386614207;
        Wed, 02 Sep 2026 15:03:34 -0700 (PDT)
Received: from localhost ([190.113.101.40])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a1a4b733asm3335533137.9.2026.09.02.15.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:03:33 -0700 (PDT)
From: Javier Tia <javier@peridio.com>
To: meta-arm@lists.yoctoproject.org
Cc: Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier@peridio.com>
Subject: [scarthgap PATCH 3/3] arm/trusted-firmware-m: add CVE_PRODUCT
Date: Wed,  2 Sep 2026 16:03:26 -0600
Message-ID: <20260902220326.2780674-4-javier@peridio.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902220326.2780674-1-javier@peridio.com>
References: <20260902220326.2780674-1-javier@peridio.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Sep 2026 22:03:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7149

From: Jon Mason <jon.mason@arm.com>

Per https://nvd.nist.gov/products/cpe/detail/C0F7CF14-9ACD-42C5-A1F8-839937F8C4DC
add CVE_PRODUCT entry.  Since there wasn't one existing, there is no
need to remove anything.

Signed-off-by: Jon Mason <jon.mason@arm.com>
(cherry picked from commit d0b93e582c7beb57e2d446311a93f5ab8b94fce1)
Signed-off-by: Javier Tia <javier@peridio.com>
---
 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
index 772366d9..ffd5a081 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
@@ -123,3 +123,5 @@ INSANE_SKIP:${PN}-dbg += "buildpaths"
 # Target binaries will be 32-bit Arm
 INSANE_SKIP:${PN} += "arch"
 INSANE_SKIP:${PN}-dbg += "arch"
+
+CVE_PRODUCT = "trustedfirmware:trusted_firmware-m"
-- 
Javier Tia


