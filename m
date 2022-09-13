Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA92C54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 06:37:37 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.1795.1663051050834905329
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 23:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lcEbUh3e;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id fs14so10286934pjb.5
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 23:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=cJxYez3848TxDEdeYxsO8a8sNpQ7gD7riFKhNIS3fpo=;
        b=lcEbUh3ed+3ljnTvt3kXbSOHW3rseap8oErm995bWq97hRwlEfgDX6XhxEWkPE7188
         f0Nqb6fuLika2lEvG5Aa5Gcq8KlgTYzzVL8zoBeP10x+LTBPi2CRSxF0ZiV5uCP8qX4F
         3zPIp6eAh1qXafW4ZDGwKfiKZ4TBRNe9QB78/BFMTtXDr7wRjfCxwAerY1b/TlH1MMKI
         1NN2Srgm0Dcu5xdS23DmANKKLQMlzLxwEKOTkfl0y2a+Fnu4H3pjbh94Il+H/cxdFOXw
         uhcPiHW9sfhy0CVBYNrkwoGFl4MQcpujv2niytnDG5vnDdqvgP5wm7LbXgLXOg5+fvAw
         ybBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=cJxYez3848TxDEdeYxsO8a8sNpQ7gD7riFKhNIS3fpo=;
        b=kL8zo1mpnzsb2XrgNot19WgO6Jt1MrfintXF6CvQi5V+PTQhIEJZty+Mv9rGc+BtNf
         Lf8gWHhacoaW3uOKm+A36Gp5p5PZb1xHKp+vQXp1d0kArNC3bVyqo4SP2GDsKzEL0ZXI
         hTpHRlj8DeprvuiVWa4w4eMkTe00l5xp6uSeNAc2GYXRJ/KR4PcbFKbOSKZzS0FkZsdZ
         pez+nXcSlZkiM62x+f76iGZEa1TpGYcvcJkwgJVj5Sd+TEC5NCHCKn8w+DmemFnaecm8
         epx/x8SUqS0fRFTL8f48sI98mWtZ/FFyDf8f/NemCGR1q1YzR/fv6zav+cKHJ3azQ/SA
         fLaQ==
X-Gm-Message-State: ACgBeo2fb99L8raDj2KIuIGEpOJtqNn3Hi53Ha9+CgZ6RdykcnK/N/TY
	V5HZ76lNFjyHtiEDmMfM00hFsM3Pw/XI/Q==
X-Google-Smtp-Source: 
 AA6agR6S44gTYVgEEoZbVa8XMnQ4fb3h4Kgt2f1OR3xDYtI6sfkrw/AW9YdVCKCnyzRlGVlcfuoY4w==
X-Received: by 2002:a17:90b:3808:b0:202:c5ba:d71b with SMTP id
 mq8-20020a17090b380800b00202c5bad71bmr2352924pjb.18.1663051049976;
        Mon, 12 Sep 2022 23:37:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8fc7])
        by smtp.gmail.com with ESMTPSA id
 o3-20020a634e43000000b00438675d9826sm6642581pgl.62.2022.09.12.23.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 23:37:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ffa-debugfs-mod: Exclude from world builds
Date: Mon, 12 Sep 2022 23:37:27 -0700
Message-Id: <20220913063727.2748504-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 13 Sep 2022 06:37:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3771

It installs arm_ffa_user.h and so does arm-ffa-user recipe, lets not
build ffa-debugfs-mod in world builds since it does not appear as much
in other package dependencies as arm-ffa-user

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
index 1b265a5..2b5dd64 100644
--- a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
+++ b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
@@ -37,3 +37,5 @@ python remove_kernel_dependency() {
   key = "RDEPENDS:kernel-module-arm-ffa-user-" + d.getVar("KERNEL_VERSION")
   d.delVar(key)
 }
+# Conflicts installing arm_ffa_user.h with arm-ffa-user recipe, lets build only one during world builds
+EXCLUDE_FROM_WORLD = "1"
-- 
2.37.3


