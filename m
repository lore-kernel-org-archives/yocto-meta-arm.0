Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45AC5ECAAA1
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 07:46:58 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.4900.1662968811022526202
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 00:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YCsJJtnT;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 z9-20020a17090a468900b001ffff693b27so7355098pjf.2
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 00:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=e2FksnNAHwV33lcY2ZpbY7eyiYwPnAPSXxFrENpU+qQ=;
        b=YCsJJtnTp8lZKWvkVI13vdjE7tDi2zDDMae0E9L1imNoLlLTjvNiBwMY4MoYs22qN6
         HU2be/uAAFNo3etSVpj/3dzJkWAGqNyOKWMe8TEzhP+oQutjZGCgSGgZ6Nx2KMBUqQiy
         oHB8/yvIWSv76+5BFtK8AzMzxn/VtL31LkMOE/ipt0FylThEtuMC2JkkLfWl2MoSr9SM
         c5tpHbQRa+bq73NKnC3v7WnBYV4m1LCFXsT86PeXl1RClM8Vtd7cpF860BxaWP8dG1Jz
         w+7erUa2iNppyPn5TEyWJ3cQMIA/MDs0UN6LC/VH6gfNPs84AidV1ubJtDO2si0jCA7A
         7o8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=e2FksnNAHwV33lcY2ZpbY7eyiYwPnAPSXxFrENpU+qQ=;
        b=VebQSyoewkN9hqwtJkPk81zdBiuzbo8JBpgRm3EA2i9j4WCNFoHBcgFj6YPB7raVgB
         4Wp9Ii5F4PWm08dF3Om9TjNT7eJU5usEjiZjwkpHO83rSSE3rtWZEDXXsdtLg0nw67fq
         XmJNzzLNgOxGLxf7lapSRQnE1lWn2bjUKgT7tN4b8eUxqYVWfj4U9P9iQfrCtJc6sR/u
         6RTMeYNONzpwWurHEs0mMrKjMPuuh86TUlH2n/IDlXgQqEKJlClmG6epWAuiTNeAlvur
         sUXNnjTKYZ527Gnvi/t2OMPFLmZa+WY+xtqCCbuwtUbEImMgipbU3tlk2I1QzLdjuuu9
         69Qg==
X-Gm-Message-State: ACgBeo2DBurG47Y7WrK++mV/HnjI5ddA//bqkA8GAFGPH/mfrDNAZfr6
	48gfq+44L8T9mQMXw3/6nRVe9jJKBBb71w==
X-Google-Smtp-Source: 
 AA6agR4mQQfCFcbgdKIpZWdzSiTwGLXN5Lwx/t8jFfczic5YorbA2pg6Q1uREwaXSVJKKDukX5ZgJA==
X-Received: by 2002:a17:902:7446:b0:176:85f5:e767 with SMTP id
 e6-20020a170902744600b0017685f5e767mr25951662plt.60.1662968810008;
        Mon, 12 Sep 2022 00:46:50 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8fc7])
        by smtp.gmail.com with ESMTPSA id
 k5-20020aa79985000000b00535d3caa66fsm4607618pfh.197.2022.09.12.00.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 00:46:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] linux-yocto: Add bbappend for 5.19
Date: Mon, 12 Sep 2022 00:46:47 -0700
Message-Id: <20220912074647.3445905-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 12 Sep 2022 07:46:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3767

Enable tee and arm-ffa driver on qemuarm/qemuarm64 by default

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend
new file mode 100644
index 0000000..29c6a08
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend
@@ -0,0 +1,9 @@
+# enable arm_ffa regardless on 5.19
+SRC_URI:append:qemuarm = " \
+    file://tee.cfg \
+"
+SRC_URI:append:qemuarm64 = " \
+    file://tee.cfg \
+"
+require arm-ffa-transport.inc
+
-- 
2.37.3


