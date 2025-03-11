Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05A4C28B30
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 10:30:09 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.5470.1741689005459861685
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 03:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WNoo3Bkv;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-549946c5346so4023518e87.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 11 Mar 2025 03:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741689003; x=1742293803; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TeEe43acjHcuvL9e4S8VpqXgcd4eamh8e9PcUKdtmRc=;
        b=WNoo3BkvwUTkTNudzm88ZVF13axgrT/LamAFDQ2rCeN7zp9b9An9CBystzGvSTDT2C
         9zL+jjjw5PsmUar66rtLce77Eajkzenyt7WkMTGJAHqiAuV5MuU/abSMkottjRT7TYel
         SyEbzJm8+HYmbvqmdX8Yn0Wt3JNhNCCofXM5yPU2kuZUJdD/R9bPUSpmHqHTjnRQODiF
         gZPnm6olD29FsLDzwYz4gq5iNIft/oeIjga1qxiV458TJI9ktsK3Dv2VnOnJ4E7oRe3b
         3QM0E/loDGW/Aur/yJ8K9x1Ovi0f68QpXdRACjF9Tr/ZIQmg4gybttzD9ArdFT0hvShP
         DnEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741689003; x=1742293803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TeEe43acjHcuvL9e4S8VpqXgcd4eamh8e9PcUKdtmRc=;
        b=F8dsfL/Tq6KeQ7ftvBYjiG80LNS4D1IFqD6ZRys1RkfBmWGWUPHGxsD7rSSG7VPtXI
         dKTl7LxDlgn/XnVgQ+w1LghvA6leRYwb6qPxyxX2o3hI3jW4aH/BUN5l3uDma9uTQ6aU
         Z67yPnem1srdc8DWe28nVYmfpCZQ0AuRJH0ROMA6rBtco2rfQzUW+1UmhIgnnrgPVZZ6
         LTiaktX7oCv7rbXjPzRfOv5+YaxAyfzPrngNqZS0Gdo1TFNPWhEOao7fbGPqSn/b8zYY
         kaeCQiSO7jJ8Q+gyhpigko1YiSRr+0WMsoj42QwkUaF9gx26jC/7rAHFgOX6JDwY2cav
         nVvw==
X-Gm-Message-State: AOJu0YwN8l4V2ebDIY0iEEY121xYR0yzInX+S1tT0e2GuGv8d9PDfDg5
	76FGkwEenndOTTsoEOrn/RlkWjqzDVlKe/Kh9kmFHgp4VUPkwzjqrRO4ydHEuNGcepCCZdnmtcf
	qKbA=
X-Gm-Gg: ASbGnctLOGoEnASaJ2YWHAtB4TdiR493qBxTUGFHZE3hWCmxciTo6BsYPiP3+x7rELw
	LKZStR0db5RC2JcBmQ967KrhkdO6ALkNKfGBt04kEH/C8szQzLDIaOjZZ9TYHZ8Nm8Vg6bOvDmD
	9C1vQWzc3GVEo2sYAn8XGsYEfZDKQjZ3ECUfaffxRby7zcROm8bPBuzO/BrKBNn4CdUuE2d2u8c
	5E63xpyvT98kO7vzrOD1t/xQTEECyJwwa36KyAvR2+EJkUqC9rm9mEAmVS2vclBAeXYf9Cg6V9Z
	pBQ6icfOQoNFJa1UPsEpAfRyl3VN1msJ3bRDr69Q2rhu372bjgVb8Em980qznzFKqCz5LQGtIHc
	7LD1LAwk+Bgokjg==
X-Google-Smtp-Source: AGHT+IE4NwepX+7yY88RVYJfRweIs4ge29vfap2bRVJVFMcbnriWGjgWwxXNo/rXAEvqKx0jlglNVw==
X-Received: by 2002:a05:6512:39d4:b0:549:39d8:51ef with SMTP id 2adb3069b0e04-54990e29b80mr6153657e87.6.1741689003400;
        Tue, 11 Mar 2025 03:30:03 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b0bd5b5sm1734685e87.158.2025.03.11.03.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 03:30:02 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: ilias.apalodimas@linaro.org,
	javier.tia@linaro.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/2] optee: support genericarm64
Date: Tue, 11 Mar 2025 12:29:33 +0200
Message-ID: <20250311102934.63753-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Mar 2025 10:30:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6401

optee-client/tee-supplicant, optee-os-tadevkit and optee-test can be
compiled for genericarm64 and these detect firmware optee support at
runtime. Using qemuarm64 compatible config for them.
optee-os itself may need HW specific config for different boards
and SoCs but these components work with same config on multiple boards.
Tested on qemu and AMD kv260 with Linaro Trusted Substrate firmware
(https://gitlab.com/Linaro/trustedsubstrate/meta-ts).

Note: optee-test version in userspace and optee-os version in firmware
must match for tests to pass.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-arm/recipes-security/optee/optee.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-security/optee/optee.inc
index c5514f56..cd25d0e5 100644
--- a/meta-arm/recipes-security/optee/optee.inc
+++ b/meta-arm/recipes-security/optee/optee.inc
@@ -1,11 +1,13 @@
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 
 COMPATIBLE_MACHINE ?= "invalid"
+COMPATIBLE_MACHINE:genericarm64 ?= "genericarm64"
 COMPATIBLE_MACHINE:qemuarm64 ?= "qemuarm64"
 COMPATIBLE_MACHINE:qemuarm ?= "qemuarm"
 # Please add supported machines below or set it in .bbappend or .conf
 
 OPTEEMACHINE ?= "${MACHINE}"
+OPTEEMACHINE:genericarm64 ?= "vexpress-qemu_armv8a"
 OPTEEMACHINE:aarch64:qemuall ?= "vexpress-qemu_armv8a"
 OPTEEMACHINE:arm:qemuall ?= "vexpress-qemu_virt"
 
-- 
2.43.0


