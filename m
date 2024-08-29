Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1067DC83F36
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 16:32:16 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.24027.1724949134998796790
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Aug 2024 09:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=pZzsTaMA;
 spf=pass (domain: linaro.org, ip: 209.85.219.171, mailfrom: javier.tia@linaro.org)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e16518785c2so676811276.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 09:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724949134; x=1725553934; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMpNLFad0fnZ9COQxAZrqTq/H7kJW6ncrx+ZFcBS9P4=;
        b=pZzsTaMAaUp0NnFT4zZ595RJtYuhBEZv3RhSpplV/gC7YY4AV+tUo4TRH92O3uBuxC
         bBuluuT0cNXtp1sdG5kh6ZPlQtua59Q29bR2XYSypEacqPwj3uzSzoCtoOgMFcEFnbQx
         EZdyRdg+Kp222BYdF9Sr4IiBFxnSFnPjdr7H8wKTkI0EeeOwkunKiTtrxVuL+O6H7LuN
         229tE3MLo+KltwE8R8H+qCUva+m/UoW8dYPuZp3wQVI8apUnofpTKawPNKvz9MTvDnl/
         P/CZtDjuUacJrWO/LXiMVOfMGhNU1c3u/mt2u/1Wvg9AO4SgbZEnozO6KCLmzBe34agm
         fM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724949134; x=1725553934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMpNLFad0fnZ9COQxAZrqTq/H7kJW6ncrx+ZFcBS9P4=;
        b=q+SsQErujJgOyb+yllXyzGgZjs4mlW5/zxBprN7zEBv6FR7ZKo8u3DjylJmaXN9taG
         PAed/4HAvI3Y+UXIFKpaX5OyAjCJLGU6+nG4nARRMqqcE9S3kdrZgLx8NwCVD0pWOdQs
         6QcplxSlPhiVqDropBlNLe0ulUh/lKfpEHu9/+6iuF9PvOQ7CtusGcG7SSuAWEIlcDJ0
         kHbkCWJdqraPIsYEVKjef9jIx3ffafPB+9Oz79YclkfcpiI2KE6JtuvzVZUW98Vwc2W6
         4MRDESWsgapYPUc994UxjIuinlZZH1dOX5UT4g0aGiH3G/k5wMzaXXii/dsH8uE71CJb
         h7Gw==
X-Gm-Message-State: AOJu0YypRSrKthn4hYx7bArZUSTxTIE2JrCynQHaSsE+HTsn1wqCjl4P
	ZDiQVEsOBFKSOk9ulDmRvRakxwBcTDWqAJLrhMSwu5eQY5xX6VJGBqeNlV/I0pDk40vYJZ4k8Kl
	A
X-Google-Smtp-Source: AGHT+IHnGGMDC1IjMk3ouG0VfZTvx+GBSXYh67kdO6mmrh6C6utQX9+6VVl9vIOQ56LX44etMu03Fw==
X-Received: by 2002:a05:690c:6705:b0:6b0:488a:5056 with SMTP id 00721157ae682-6d2765f5628mr39120267b3.22.1724949133841;
        Thu, 29 Aug 2024 09:32:13 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d438e18asm2993517b3.60.2024.08.29.09.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 09:32:13 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v4 01/13] qemuarm64-secureboot: Introduce uefi-secureboot machine feature
Date: Thu, 29 Aug 2024 10:31:57 -0600
Message-ID: <20240829163209.47945-2-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240829163209.47945-1-javier.tia@linaro.org>
References: <20240829163209.47945-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 16:32:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6011

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 meta-arm/conf/machine/qemuarm64-secureboot.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
index 78a39c03..2483c4ac 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -22,3 +22,4 @@ WKS_FILE_DEPENDS = "trusted-firmware-a"
 IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
 
 MACHINE_FEATURES += "optee-ftpm"
+MACHINE_FEATURES += "uefi-secureboot"
-- 
2.46.0


