Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D314ECAAA1
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 07:54:58 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.4939.1662969291679517008
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 00:54:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bBf5Luzp;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id s18so1859446plr.4
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 00:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=eU4tKQfS4lRKYCQVTkkm4jBkUPHc5gqz87iO2DVW08o=;
        b=bBf5Luzp2MCFS/4Oef/Tlwte2wLb0nVINRFqVoZf6kqB1jRiPfMKLqeKdIW0yeM9DG
         5S911zoyPjee2GdAeVsISWml6mt4KooNkM62yRRArkGIl4WK5PwyNDxInbLkccndRdyd
         fKYLEyIyLeazTLB9q6nCV9jh1CZ3+1YOtvTlc1SZ3Wzw62NVnDHqCLaGF4y6TurVH2UK
         YsJ+wldViMtXRAWI9IKhCVY/HFrL8MhNr556tAy3vDwjVdz8mQFh1E3OA9IWRugGYfum
         9z4q6TGPdTlNDqBoa3ektD472CLcHTgZCE7hd/u59vc9gCk0/6+gMb6PHUTpv3JLvhOA
         DLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=eU4tKQfS4lRKYCQVTkkm4jBkUPHc5gqz87iO2DVW08o=;
        b=npg3k16qcbFFcJvMF85BcL0ctc0KzcouWZEQSQjXis2Krs29GOWMlhH8XlwvfMQRah
         +uQTUM3w7N9Lr8eORC5hY51q1GxM9xi3LTk+WOmIzJOSKame8+CWsfyO3J8vkzHHyOZE
         +bc4EJ/yzTrtIyRh7f6sv61omS5jRGuSxecAa0VVjxP7RlENjuioy3UTGPTUTPBWJOD2
         eZnaEFORlyrxkTZXb3iwrm49gQlv/sofPRpyFcCUUAEgGGcHlQKQnY//6++kiJ05Z2LF
         FX/QBHM15FZP3CrBd/zHHZqEnYpdsJANkjXnH1OVh/zhaRwVaewsJ8GnxwH8g19hENIL
         dKnA==
X-Gm-Message-State: ACgBeo0NIko5nXblPmA7f4a7R3/3RTcPomaaP97evl/AUAAmEcSnt9it
	V0+KhZjiBd32iHUjlanyFW1AygQFCDRW6Q==
X-Google-Smtp-Source: 
 AA6agR5ENX2r+yjgy/m+P1v95Bfel/l/361amRQ9p8i73IH5KYw6GXFra305tvLo/J/n/JEC3trVJQ==
X-Received: by 2002:a17:90b:33c4:b0:200:bd1b:c92d with SMTP id
 lk4-20020a17090b33c400b00200bd1bc92dmr22453054pjb.186.1662969290737;
        Mon, 12 Sep 2022 00:54:50 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8fc7])
        by smtp.gmail.com with ESMTPSA id
 v15-20020aa799cf000000b005379c1368e4sm4814714pfi.179.2022.09.12.00.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 00:54:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] linux-yocto: Add bbappend for 5.19
Date: Mon, 12 Sep 2022 00:54:47 -0700
Message-Id: <20220912075447.3554798-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 12 Sep 2022 07:54:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3768

Enable tee and arm-ffa driver on qemuarm/qemuarm64 by default

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Enable arm-ffa-transport.cfg directly for arm/arm64 qemu only

 meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend
new file mode 100644
index 0000000..7dec2f5
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend
@@ -0,0 +1,9 @@
+# enable arm_ffa regardless on 5.19
+SRC_URI:append:qemuarm = " \
+    file://tee.cfg \
+    file://arm-ffa-transport.cfg \
+"
+SRC_URI:append:qemuarm64 = " \
+    file://tee.cfg \
+    file://arm-ffa-transport.cfg \
+"
-- 
2.37.3


