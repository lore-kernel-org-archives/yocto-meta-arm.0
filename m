Return-Path: <maxim.uvarov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D024C43217
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 14:01:13 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.22492.1636984871584276804
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 06:01:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FCgT9n78;
 spf=pass (domain: linaro.org, ip: 209.85.208.170,
 mailfrom: maxim.uvarov@linaro.org)
Received: by mail-lj1-f170.google.com with SMTP id e9so35742173ljl.5
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 06:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YnIcng55NGOcGOmLvnzuGaaa3Iu3rFoShQlhZq5Ucq0=;
        b=FCgT9n78+a3EELeIYixWr13HeWnLHoFKLPz8sO5uxOemAhaR3HXqZmiY1vsZ1/kcik
         7sjVBALO8WsU0fOeTgwenZAyoW1TBhQKsIkmFWaxS0cuHWGWJ2u5752UhddgEKzjnxNl
         WOqCRv5dupOk6IHuys0GnkbStTx/E7xp7YoybF3usaUyrc9pxKWaN3TctlBcG3Nk7ONe
         4SfcxfSwgYayU9T+Xyucc6yZRngp0VlhkUs7aI9hCJftfHwwavTHdAjngTyt73Unm9l5
         azv+HZDF7lMSApMmL5gXbnjiGtbguztIVenDJXZtCELp92cIu1Sfx0f+OoSLLvUydtoO
         KvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YnIcng55NGOcGOmLvnzuGaaa3Iu3rFoShQlhZq5Ucq0=;
        b=DdZ0h5RI2p1I0TO6FFvqUN8s6yJr8o8EDmhH6fucAwKdnb6pi/IzApXIWPfPT+VtnJ
         SHlOoolDlnGHDfsS6f+rU+NpcZy7YV0NMRPlo7GozWqGIGuie+X4Rt6CGE5QH6OR5sbE
         51xNiKJHfgocnHMFyWuMsEM3niUwWW2Orf/TtumXhm3nStxIGDsTzKu06J9j6ZT1C0jR
         pHJCDnVi4V4KhxCp+0DI+/m+plOOf2I04YDWPmvHY2dBYUnPuXKSnGoIBBQxgxxcI+kp
         h08yyNy+navQAIaJ1/FVInabc6gdDv3lZKtwK6eG+TfZ9eUZzPm8sxTko74mG8e7+RhE
         s+XA==
X-Gm-Message-State: AOAM530vFveF/EgY82WlSrrnCNaSxShynxjq61NGKutT1z9h4KIzCw70
	yeL20U/RmrixfTWHbqAickgapUGvld7M1w==
X-Google-Smtp-Source: 
 ABdhPJw8WXa44V8wyYQMZvr92GMs1q8vBxJ+V2z+cCLEVfiGC+BccPVEH3KWbtZObOtqrOrnv3b2pA==
X-Received: by 2002:a2e:a588:: with SMTP id m8mr40110535ljp.23.1636984867912;
        Mon, 15 Nov 2021 06:01:07 -0800 (PST)
Received: from maximlap.d-systems.local ([45.87.143.160])
        by smtp.gmail.com with ESMTPSA id
 d3sm1513699ljl.93.2021.11.15.06.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 06:01:07 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	Maxim Uvarov <maxim.uvarov@linaro.org>
Subject: [PATCHv3 4/5] machine/qemuarm64-secureboot.conf: add optee-ftpm
Date: Mon, 15 Nov 2021 17:00:59 +0300
Message-Id: <20211115140100.24634-4-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211115140100.24634-1-maxim.uvarov@linaro.org>
References: <20211115140100.24634-1-maxim.uvarov@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Nov 2021 14:01:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2388

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 meta-arm/conf/machine/qemuarm64-secureboot.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
index c45924a..b664dac 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -20,4 +20,6 @@ WKS_FILE ?= "qemuarm64.wks"
 WKS_FILE_DEPENDS = "trusted-firmware-a"
 IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
 
+MACHINE_FEATURES += "optee-ftpm"
+
 PREFERRED_VERSION_linux-yocto ?= "5.10%"
-- 
2.17.1


