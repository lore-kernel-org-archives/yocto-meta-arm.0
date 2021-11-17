Return-Path: <maxim.uvarov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0558CC4332F
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 10:02:18 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.5175.1637143337277342598
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Nov 2021 02:02:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=syWtrFtA;
 spf=pass (domain: linaro.org, ip: 209.85.167.54,
 mailfrom: maxim.uvarov@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id b40so5806260lfv.10
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Nov 2021 02:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BLChPXbdKN3YdTqmv6laQ7kL7yJYsF5R5kS1NT/rC2E=;
        b=syWtrFtAeGD2cgoqb84QKtDO5MLidPtn1JfVTXeAV5OYm0jfihJbv2I9QJom+WVOJN
         JJ8UAf8NxZ2O2dh64NC0nuLWL2Q2cXmX0gUhrfJTiLJn7jFilWyI8JuCVtQvlamHsz78
         ZayOitYZtMpbg4Or/Y9p2Yo6PVN8xLeR1ex17YIS/FemGBGKq9A8ibY5V3Dx1PbF+hrQ
         77m7zD0f6sNxXUf+sSWiT9xTsyNTH50pJA6ZX0d2Jstq8MmvylBTn2qAB5/Q88bbaR9S
         PsMFxh6Z9Nh+W1AappaLV9UsSd00QnMdSgtbMuHxjbf+ouASllZrdOq8xzKQiznrSjr2
         heJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BLChPXbdKN3YdTqmv6laQ7kL7yJYsF5R5kS1NT/rC2E=;
        b=qTYyA9ByjPx9IlXoIghlIvC9RGZMfkgncDoWoMjcbQnQNpWSjzz2Qr1hJQBw5rbxuU
         /ICGozErqzy01Pbd1tJxTSDWtDNRwLJXPbUSX1g++l1qfdkCxJisudyXBUKQnee3NW+m
         XBSP1DoyTp9Av3JuzFRpo649tfOcYF/nBuFMOd80EayK8ASFQlC+bT3KyngIf1/vX/KD
         Ob9v6g2bXa15atb5df6C4Ll9hY8+xfGFzO1usr9REpTCvE7gxkW8Eht9fhAqWFENxK/m
         9ZgeMbvFJebE2ZNfHHZ7qzMm9py9Zx3Fnjhl/ih9ynqEQBIY46mb6i3bvK9SSb51CiIP
         oj7A==
X-Gm-Message-State: AOAM53086l8G3Qia4i42f4iw3ro7SmkCNkYANo/X6y7i40Eu7BYnoiTd
	10w1UTtk8UDE8r2AkAHANFak9pzBNk2imA==
X-Google-Smtp-Source: 
 ABdhPJz9gl2o8cOSH7mOoovmfHZ5ilGHwZtLtkOu4aC/MHJHloDBBQHJtsYgZiiyJ+O4aesDc+ml9g==
X-Received: by 2002:ac2:5fe1:: with SMTP id s1mr14193496lfg.346.1637143335335;
        Wed, 17 Nov 2021 02:02:15 -0800 (PST)
Received: from maximlap.d-systems.local ([45.87.143.160])
        by smtp.gmail.com with ESMTPSA id
 j1sm2068126lfg.154.2021.11.17.02.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 02:02:14 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	Maxim Uvarov <maxim.uvarov@linaro.org>
Subject: [PATCHv5 3/3] machine/qemuarm64-secureboot.conf: add optee-ftpm
Date: Wed, 17 Nov 2021 13:02:10 +0300
Message-Id: <20211117100210.1401-3-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211117100210.1401-1-maxim.uvarov@linaro.org>
References: <20211117100210.1401-1-maxim.uvarov@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 Nov 2021 10:02:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2416

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 - no change from v4

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


