Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web10.36770.1590765273592450147
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 May 2020 08:14:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=omgORqRZ;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id r2so2740786ioo.4
        for <meta-arm@lists.yoctoproject.org>; Fri, 29 May 2020 08:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=cCFFq54/NqASs4BhRm/+d/2cLZhcCJiHZ6rUOoEKRdo=;
        b=omgORqRZ59v4X5vTrd9GHwW4+WuEw95nCYmYh9w92u7J6ImFB2Y798ezw3tk4TDuvs
         ab+aqfh4wVrnMsFb7Slaumdrae3SGMAtgMIhwSudOA+QA7NeH/XnBSp72Fz+H2Vi1D2g
         +lVOer95AVR1JKy4WbcewUsDUZ1AIBRJXDB2ylX0xYtgIszeY+rmkBCOsa2ZWEdermpO
         gPYC2jfbTtEXHQKGUTq4ux744JUAEWsw8ITOHc5Phz9ueVEYDnbAFtHqTD6mNn9Voi22
         KfL3cEBb3oEMsHfC/i+c5UOqySrCxV6io1lGQX5jitQeGwLhmXcmPKlCFrwtRnSMFf2l
         XjmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cCFFq54/NqASs4BhRm/+d/2cLZhcCJiHZ6rUOoEKRdo=;
        b=MqpFKL3io4St1uCGYppnn9m0ErHrfFP7SovcavvDmI4K/4bkBvL+dpHRZbEfBYuS6U
         N1OglwBTWXb030WG9eJZMHp5BafgIrAyK/YN2at2tgoYvadnPTDSh5qDH6dHIiEwM7aa
         09UVcZhzh4J3AIT2HYkM8MRawlEyRrIJR7MkyE/0vKYwlwwC2XrENROPIgS9y3DO+vud
         J5ZLepc9Z8rxpOweXaN3TPt6kvyaNz+Sz+NVEzmq0OjoXW1AG22CulCq/N1mHSkz/HQj
         LBadhuuys6FuK0b4t9icSuuMAa3fEBrbcgswADkaBci5LcJO/44FlyOqcoulE+AL6n43
         H58A==
X-Gm-Message-State: AOAM532O2pSnAGcxyQWlVmxmUmi65iQOPJcfoLtGSj4Dird+pangKYuh
	eBjqpi36SUceGvoalCpJD62AGtDqBT8=
X-Google-Smtp-Source: ABdhPJxtdeADSRQbgabJY2fGn4ync7S3NZiiBPuT7cjO7EPI9q9SHopqh1f5COy92/KJC4cP5i9+tg==
X-Received: by 2002:a5e:a70b:: with SMTP id b11mr6950844iod.63.1590765272749;
        Fri, 29 May 2020 08:14:32 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:2495:669d:5b93:9222])
        by smtp.gmail.com with ESMTPSA id c23sm3165378ioc.28.2020.05.29.08.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 08:14:32 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-arm][PATCH] meta-arm: Remove meta-python dependency
Date: Fri, 29 May 2020 10:14:27 -0500
Message-Id: <20200529151427.20272-1-JPEWhacker@gmail.com>
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

