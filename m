Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 936F5C433EF
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 15:43:12 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.9787.1652456582739525092
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 May 2022 08:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q0yr5z4u;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id iq10so8437775pjb.0
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 May 2022 08:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cg4oEIUHg09cH5ytfUXEYCpGmFbEw45/cyy3mEccrTA=;
        b=Q0yr5z4ujhkmGkxslCrAmvNGVmx3nAFtmkszMpQrPPobZ8/DISlzxhO8V5Rr2aAsPZ
         2aCt+2Ao8vxRizYgAlpaTbLPbWmQ7zM9CA4O92A0RsAw10MmUd2VKSr7HnOLI2ou4PJu
         u9uWzO3114pcw6qoGO4guEp1wb5iRSh1g4y1VydAybIbvt4IyScZaXrZCIRsGq6Qs7Ey
         7X+W1xIuKYWxbADWfNhBv/S5lgmIeObvQ7B37DkHGCRxvS4Qv1bTW/2ATaqrIq6I5MLp
         abNEmAshW0DwZgU8l9+SkoQ2gnz5BZlseYsGgkdIqZpsAWM1WanXH49PAhps4WizOSIf
         UyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cg4oEIUHg09cH5ytfUXEYCpGmFbEw45/cyy3mEccrTA=;
        b=T/Ol2/MDYLtz7sLblIPg12RkzhV2DQrW2KhEcAzp9qsqIFjRSiH3NybZn8q1k4RHF8
         Gh3fhzydNhmyhzC9y5fvCSeToTtsrEdUdbZlUZoJwZRLan7VJliwDnMoo9vijlP0U81r
         53ZDXqK9X/zABz6TeM41z+fGhGcReQcF6I8G1V++e03a896X3bYjCK3vJAjwwaOxDuxh
         giYKKxHcpNAo3oV1/cFGKOe/ds/hBQr+t5QPIc6AoIYt0rshDfb6+69iAGj0v9w7/D7R
         3I8z5j8D7VpTzDrn7WGxl45UNWZq8ib4l8Z5FV7xxx8IqXvqjxrgk953YhdqzM2HM58T
         z+vQ==
X-Gm-Message-State: AOAM53342mQv5Nwesi46yNLbF9Nejs4fhFDJptseey/xKSmRF0hdzHOV
	W41kRWZ3NuoPhg02I/QyMtUOu12hJuRd/g==
X-Google-Smtp-Source: 
 ABdhPJz5pMjGNH/zwmC/TOJyZSrYI7cyBfEQCC7CZuoLdZX4PK8CdUY8EiZvf0tVv5yAcZTPccKyTA==
X-Received: by 2002:a17:903:264f:b0:161:39ef:57ee with SMTP id
 je15-20020a170903264f00b0016139ef57eemr2325740plb.60.1652456581603;
        Fri, 13 May 2022 08:43:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 v1-20020a056a00148100b0050dc76281b5sm2052645pfu.143.2022.05.13.08.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 08:43:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] optee-spdevkit: Disable for 32bit arm
Date: Fri, 13 May 2022 08:42:58 -0700
Message-Id: <20220513154258.560854-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220513154258.560854-1-raj.khem@gmail.com>
References: <20220513154258.560854-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 May 2022 15:43:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3400

FFA secure partitions aren't supported on 32-bit Arm currently

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm/recipes-security/optee/optee-spdevkit_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-security/optee/optee-spdevkit_git.bb b/meta-arm/recipes-security/optee/optee-spdevkit_git.bb
index 931eb64..def2d8d 100644
--- a/meta-arm/recipes-security/optee/optee-spdevkit_git.bb
+++ b/meta-arm/recipes-security/optee/optee-spdevkit_git.bb
@@ -297,5 +297,7 @@ EOF
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+COMPATIBLE_HOST = "aarch64.*-linux"
+
 # optee-spdevkit static library is part of optee-os image. No need to package this library in a staticdev package
 INSANE_SKIP:${PN}-dev = "staticdev"
-- 
2.36.1


