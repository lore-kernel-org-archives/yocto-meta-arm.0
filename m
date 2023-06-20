Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED9BEB64D8
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 13:16:56 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.9985.1687267008744242370
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Jun 2023 06:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=w3zuJECk;
 spf=pass (domain: linaro.org, ip: 209.85.210.48, mailfrom: sumit.garg@linaro.org)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6b587d2593aso1410679a34.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 20 Jun 2023 06:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687267008; x=1689859008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RRjkEz+itflLN5H9J7Sru/HUSrfCltu3XYXJW6mED/c=;
        b=w3zuJECkkhAoEKL4ZdzQbSIh2YC1hrGr7/g0htdLzejufHD2lZ2w00tdi3rJNT2B9t
         LSBmzT08LHrjnCAclBAUGz+1+J3vSI1GOVQjBlIwmWok0E+FG4d/GVy/Ue/2KKQF0kMy
         00MuzzNYaFv98Bk1jJHhgXRppZ1wo65ZyEGucaiS6SEC9Xa3hySeYZBaK/tmesn9uFpR
         RDAri9h4RfXahLHSyFVMatUdz/sIsiTGGMQL0WfWAT0nlL1dnKnPdMoejIPiaG/aPyG7
         EesnQBz4rMpX1BOWT5TKdGGJIaf6vBsEVA7hjfeaSxomKImYeUPPkN6PO+5eDffByzRd
         SmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687267008; x=1689859008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RRjkEz+itflLN5H9J7Sru/HUSrfCltu3XYXJW6mED/c=;
        b=dTWMezgCEN/UfyvMCmadVliXC2YpgwkTFA+iJgLybRynQs2zUHhmYH6EJK3xqEloux
         Kb67H+JjkKI/eX79/7K8Wqfz39F3BpuwdIInCXhU81FKg+kl3N9wwffjmcqbaUHzH7JZ
         CidRaFSTsm9Tbi4qOoJ7ta7x8AEcVxUdn7BMaLeb6qInxxW4C+Jydydnnqjem6veAZMO
         9BlCuTFp2fQdqz/1nIk+WzjWPJPnYKkF42uhClM7KbLaotN2rMuDT40YztDiPxGq7mcM
         sNxhVsVD1nyH0UUUHtVkV+99Z+sfCh05m/rIoxPyhlo10Gk/b6QagF9GSEvhJinV1Av6
         fWPA==
X-Gm-Message-State: AC+VfDxhfUqUXfS9AHh+2r5EGIDBHIifN0kLnqbvlnkJwWc+mu0ud20z
	iBKOXE02wmEXwXyjoWTK8Ya5hOrCfjVfsXCRe4Y=
X-Google-Smtp-Source: ACHHUZ5eUDhq4YvfBZJeAT+ZL9FTz14CVdbWg79MiP2wKkjDTIkT4K5y6WQtjDtcKMPb8ghS00rYPA==
X-Received: by 2002:a05:6830:11c6:b0:6b5:a796:64ef with SMTP id v6-20020a05683011c600b006b5a79664efmr244117otq.8.1687267007874;
        Tue, 20 Jun 2023 06:16:47 -0700 (PDT)
Received: from sumit-X1.. ([223.178.210.177])
        by smtp.gmail.com with ESMTPSA id u12-20020a65670c000000b00476d1385265sm1298753pgf.25.2023.06.20.06.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 06:16:47 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Ross.Burton@arm.com,
	Jesus.JimenezSanchez@verifone.com,
	denis@denix.org,
	jon.mason@arm.com,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH] external-arm-toolchain: Enforce absolute path check
Date: Tue, 20 Jun 2023 18:46:39 +0530
Message-Id: <20230620131639.40137-1-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 Jun 2023 13:16:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4809

EXTERNAL_TOOLCHAIN variable should provide absolute path to external Arm
toolchain install directory. So make that absolute path check explicit.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
index 71fac597..88b694f8 100644
--- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
+++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
@@ -79,6 +79,9 @@ python toolchain_metadata_setup () {
     if not external_toolchain or external_toolchain == 'UNDEFINED':
         bb.fatal("Error: EXTERNAL_TOOLCHAIN must be set to the path to your arm toolchain")
 
+    if not os.path.isabs(external_toolchain):
+        bb.fatal("Error: EXTERNAL_TOOLCHAIN path '%s' must be absolute path" % external_toolchain)
+
     if not os.path.exists(external_toolchain):
         bb.fatal("Error: EXTERNAL_TOOLCHAIN path '%s' does not exist" % external_toolchain)
 
-- 
2.34.1


