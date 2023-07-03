Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55BCEB64DC
	for <webhook@archiver.kernel.org>; Mon,  3 Jul 2023 04:35:19 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.20645.1688358915284204793
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 02 Jul 2023 21:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=oQ35DwYI;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-55bac17b442so344132a12.3
        for <meta-arm@lists.yoctoproject.org>; Sun, 02 Jul 2023 21:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688358914; x=1690950914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aJj6OVHjN1nBCbJQ6vCJiht2iRxUbT348fnwxZMVEyw=;
        b=oQ35DwYITwHFkGKw4iKh2C7tFwLEd+YM99pj3AJYQp/yCpkxUXbI1iWA1N3fID3QsP
         b48J3CbmciYPMPA2/ACCVi6jC/b1Hqjj4P2rCHSe9Dqel8oeBkvR4H1cbJ4PMdXoQdD7
         rtLafPVe8PxZZQf/ITVeRV69mMsi1/8vjenRCVnXvBTk2sWZvh1GB73/Kmf0lhIfLYvV
         tS3C6dYTn6jPHavnETdcOG828McqNgwzpKNQAphvdmu0b4zf/X/cD30uA1tG5u/WqHE3
         1wQr02i/7owKNLCaxX5BSe2AM1+oGw3enIN4w708CmwJGs/OTAnDAUDFdZNAsYMku3wZ
         tj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688358914; x=1690950914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJj6OVHjN1nBCbJQ6vCJiht2iRxUbT348fnwxZMVEyw=;
        b=Va8d+EKRqhQGFsBkL/iZO60Z79M/QpE18qkx3k8cqng/iMstSUlPIJbqnrMPeuGB/3
         vj7rd4kcooCH7uMOnfF/OOuMJnDa86TzgxFjfMJw/0P2TwsRDD4W/xSh04xsN154pEQ7
         hpuhZpjRrWsEtS14IdV5ozdilXQe2WVEaSnsDeDixhV4s4rtI0Usk+KX7kvV1wJ0eB3H
         idQ0St5eTonfy7WseDkU3k+kbsVtmrRQH04XrE2D/aRAIU6sKW4b1nAo+RpDl2WgrRFl
         KW/OyMfVsRR80gOhFu2AYu3OXndcTM1kRAuBL2okCQ9fVEJJDOw969dE5j71ardkMI8t
         flEw==
X-Gm-Message-State: ABy/qLY/u8xAaKmNyxCaW1ocrYX2O1QoSgpGF3yoJcYgzU9dXS3+/g/5
	Q3a2Vb6JJKMpeGnpjGwA+pHaOo51BBI=
X-Google-Smtp-Source: APBJJlHElNr55BiFHx/5fOCRBuc2qugV9uegLBEaYcLNg0ohd2fbwtUDXBgI4yQm7kyzWBBtpEB/cg==
X-Received: by 2002:a05:6a21:6d8d:b0:12e:3394:e2bb with SMTP id wl13-20020a056a216d8d00b0012e3394e2bbmr5850488pzb.43.1688358914372;
        Sun, 02 Jul 2023 21:35:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::fcf3])
        by smtp.gmail.com with ESMTPSA id o5-20020a656145000000b0052858b41008sm12460949pgv.87.2023.07.02.21.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 21:35:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gn: Disable warning as error but not disable completely
Date: Sun,  2 Jul 2023 21:35:11 -0700
Message-ID: <20230703043511.123460-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Jul 2023 04:35:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4848

This will still emit the diagnostic but it wont break the build,
additionally pass it to CXXFLAGS since thats the right subset to
disable it for.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-devtools/gn/gn_git.bb b/meta-arm/recipes-devtools/gn/gn_git.bb
index 3713787a..4b021bbe 100644
--- a/meta-arm/recipes-devtools/gn/gn_git.bb
+++ b/meta-arm/recipes-devtools/gn/gn_git.bb
@@ -16,7 +16,7 @@ B = "${WORKDIR}/build"
 # ../git/src/gn/desc_builder.cc: In member function 'base::Value {anonymous}::BaseDescBuilder::ToBaseValue(const Scope*)':
 # ../git/src/gn/desc_builder.cc:179:21: error: redundant move in return statement [-Werror=redundant-move]
 #   179 |     return std::move(res);
-CFLAGS:append = " -Wno-redundant-move"
+CXXFLAGS += "-Wno-error=redundant-move"
 
 # Map from our _OS strings to the GN's platform values.
 def gn_platform(variable, d):
-- 
2.41.0


