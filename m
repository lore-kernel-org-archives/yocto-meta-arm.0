Return-Path: <maxim.uvarov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1EF1C433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 12:55:23 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web08.9328.1637067313150856408
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 04:55:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=oxPPgkUC;
 spf=pass (domain: linaro.org, ip: 209.85.208.170,
 mailfrom: maxim.uvarov@linaro.org)
Received: by mail-lj1-f170.google.com with SMTP id z8so43025006ljz.9
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 04:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YnIcng55NGOcGOmLvnzuGaaa3Iu3rFoShQlhZq5Ucq0=;
        b=oxPPgkUCe69TC8HvyL7uz+Wf5SzeeVlT3vlO3JHDsgOhrBoXdYgbqUQMPdfxyBjl5I
         eWrFl721Wx7ZYMkVxC1RfqpAHmaHPLt4QkGcgGLjvpReKNYPuGhvTF73c+uq5EDylg3G
         iHkDLq06Sf+yK8mjHJJZeZKcaQFLe+EAXRHqvt+N/qgNy7VS1+CmFIPIifpFTZGZTB7/
         l4EIsjA5fmfpfghS50BdVSfq3hO4fSqeMlGGlPYIpGv1hW+ggiPwLV9pvjJp93XrgPGm
         eYSdVdDr9CBUomVOcc52tW1skTHShcJkTKqH2rUSopfzkMUMw/5JeU0o117LepntOwaF
         fjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YnIcng55NGOcGOmLvnzuGaaa3Iu3rFoShQlhZq5Ucq0=;
        b=rmtn0UcoSN5pobQes2SyQV+CUrl1FlL7yKEiDVDQgseFCcBPw6J3tzIzp0KhcTv2Aa
         cNKS0eIzE3TPmDmHnb8aSlCjFUOFePYACol674eDg5Iid6K3t91BP7y4UIEWpseiAdao
         2UIPlhZ3esiZLe653oP4cmsQ9ekAVTIYV5xtLq8hoi+/e0wawPWJYFUM6B8dEqblcZJT
         1GNriBoKL634eSb6Wy/7heNsLzsgQKaUOpkoVf1VFzO6TwKVgHgiUM1Z6TgALUFTvvcx
         9qwJAo8neOri/tnQwJTlRKPykOFHoj4Ehb41uhG/gVMC8rtK8Hrb0AVkaLFgatHgLx4I
         G7hA==
X-Gm-Message-State: AOAM532zWIj8aeq1ZbzYyiLFaTn0uPy1Sq4ZVPU4WSFQDlJlXoC2XLjG
	eGyUqOSu4EeMlqHNr2C18LLJQcrSOHRaFg==
X-Google-Smtp-Source: 
 ABdhPJyr6OCsVA/S0f1AeXY2iETuUYaMKD0USxK4qHiTXmOU2DsUYfjBTVVCghZ5Aldm9IG2CwK/OQ==
X-Received: by 2002:a2e:8895:: with SMTP id k21mr6936698lji.331.1637067311119;
        Tue, 16 Nov 2021 04:55:11 -0800 (PST)
Received: from maximlap.d-systems.local ([45.87.143.160])
        by smtp.gmail.com with ESMTPSA id
 r25sm1753053lfi.166.2021.11.16.04.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 04:55:10 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	Maxim Uvarov <maxim.uvarov@linaro.org>
Subject: [PATCHv4 3/3] machine/qemuarm64-secureboot.conf: add optee-ftpm
Date: Tue, 16 Nov 2021 15:55:05 +0300
Message-Id: <20211116125505.32716-3-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211116125505.32716-1-maxim.uvarov@linaro.org>
References: <20211116125505.32716-1-maxim.uvarov@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Nov 2021 12:55:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2408

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


