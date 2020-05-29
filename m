Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web12.36915.1590765527203808256
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 May 2020 08:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lXKDOW1X;
 spf=pass (domain: gmail.com, ip: 209.85.166.196, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f196.google.com with SMTP id d1so2805456ila.8
        for <meta-arm@lists.yoctoproject.org>; Fri, 29 May 2020 08:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=cCFFq54/NqASs4BhRm/+d/2cLZhcCJiHZ6rUOoEKRdo=;
        b=lXKDOW1XChGxaWj8ai+CEnEv1wTmtAbVdICocjTuq1VhSBJ2521eH8I1tLYR56mq3C
         tAuSQOlUI0utcKSoNv1bUB0e602PeTvDY6M582CgnfETNn7gOoOlC/c08grbDjF055/Q
         k265m5a4hclXvtQSseVdD+iQQmi1SnBh96/B5a73KLjgt7LYPQ4D4RW6cjgZ+n+Dce6u
         fArXrxjmIM1GX1ym2A2+BHvGlWQk+M3hwdsuaYzrR3tVvwH7eDiVzsA+9derU6UtRFL/
         LePzDL/KHm5lQDDuFHE8UMfHUW8cPhRuEWVJp5LebP/DRDQtVUv1LzH6541cRAMU+Tnb
         sNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cCFFq54/NqASs4BhRm/+d/2cLZhcCJiHZ6rUOoEKRdo=;
        b=FH1kYc04/s4uTvfIioJDSiKLSKRMQ1EFs1swrRuukQ1PrWPL3mI4EOs5xM5WNHHWEW
         TizHkQK7FtJHAnTrqYAdFmRHGuxdnItw+rSSi4DUDYdrz5JfM5n28UdTqOdujUmTiGmJ
         7pu7L1TeV2CgsakKvbLMP3vJnkRu2zJN8YU4l63NW0kjt4EFvgHeCIERTeoRt0NkmVYt
         63r4yKVC6cz8ck2Yspbis8KZcQvOTabHYqJeQI5yxzj1r63+wN4uJ04LGD5k1jP8eD2Y
         k6roKwyc13zsi+C4aAqpUHuvhTwhACdMCk6/USiy/5m4hcTnazzLxMkU8Tn4qYKo4DVw
         x9eg==
X-Gm-Message-State: AOAM533kVF1iB6XqLTyLlrzbb45WPOf6iaZCERUG5wJpjliREz8X8osE
	DoxejF57hSsmLDQJ0f/i0wzQm7WESCI=
X-Google-Smtp-Source: ABdhPJyAdDoSy4cTxB8WZoLF+1nHCm9FEEW7f81bm0ZS6CrKNF+Gzed5GaErKMX62Qeqc5QGouwniw==
X-Received: by 2002:a92:af15:: with SMTP id n21mr2129084ili.64.1590765526358;
        Fri, 29 May 2020 08:18:46 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:2495:669d:5b93:9222])
        by smtp.gmail.com with ESMTPSA id t18sm5154046ili.24.2020.05.29.08.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 08:18:45 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-arm][PATCH] meta-arm: Remove meta-python dependency
Date: Fri, 29 May 2020 10:18:41 -0500
Message-Id: <20200529151841.36120-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1

Removes the dependency on meta-arm, now that the required python modules
recipes are in oe-core. Ensure that a sufficiently new enough version of
oe-core is present for the recipes to be provided.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-arm/conf/layer.conf | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index d96e9f1..1c241d4 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -11,6 +11,5 @@ BBFILE_PRIORITY_meta-arm = "6"
 
 LAYERDEPENDS_meta-arm = " \
     core \
-    meta-python \
 "
-LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
+LAYERSERIES_COMPAT_meta-arm = "gatesgarth"
-- 
2.17.1

