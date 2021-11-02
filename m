Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C852C433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 01:00:42 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web12.3318.1635814841224396517
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Nov 2021 18:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=x6MEJVlc;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.45,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f45.google.com with SMTP id s9so9704139qvk.12
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Nov 2021 18:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Uogsjt4+PChipIPccW1wf0vcjmqcAJih8WbK6XJSJWM=;
        b=x6MEJVlcQxCKD1GsJCErNPI/00KhhWwMET6ZUPbt8lLDfLUgQruFqZZi4Q5eqtbavC
         HAPy2vX9YL2A6oJy87i/auWfQ6hMDZ152ULfE3ur36sRcOSz6qkPPWVAOdwVCi2E1qVR
         f7dAgwqsHU545NGG/P+moc5GxDvadtztpyIVpZqZwM3wg1EnJSrhI12L7F68Bs5LGL1T
         JxGyAy5EhKOnqkfYH90oUZhQRba3os+MHdCpzAxAMWg7unZZ7HvlkXuhJtM99Y9JMjiZ
         E1CvBF5Oox1Vy+2PY6JIz3pcAFxJtuUQEv4+o7qsG+PQKdG3BtY4GFTsO4IOkAzcbnFQ
         AUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Uogsjt4+PChipIPccW1wf0vcjmqcAJih8WbK6XJSJWM=;
        b=DpQaE9dzfZg1dH0nCdTPIRYQWL6OejkXy57MtjCRt6obXR64NTKoYnEBu1TSMy17WX
         4EUuFbFRrVE7B1QmEwQ8n//XG9GTtg9dTCp2ru9ilEt5WFs+N1EizBEZ5RrL6uLYCNbZ
         VENRhWbrMbuCgW5cHIoByLmCVzsyHHY4b8n5B9ucTZVRpxCCKiSw91i5WjJ59UhyUpIS
         DR1X+AyvFLRExkdZe8ih7g3i3W6Al794hw9d5KJQNQYTWf9gh19JbfKzdS9+VuBc69ln
         alSZvrdKpzkF7hOtQDJ1e8oLtC5gP88xux0dQDKV6iFoS6Njaeveh3JW8nkBC38WP1Ps
         GQNQ==
X-Gm-Message-State: AOAM531DxfwNJJbri5lkI3M7O6JffJ6yg9bFeHya549eIDcC6L5SPDLF
	v3bfqjGcGpOOVHjE3fXZn4v/GBdUF+UKbA==
X-Google-Smtp-Source: 
 ABdhPJxhyaCHd/6q8Zx1sQfh+c/ULodVULiP+9rNTyhaNDFm3cM18Nbcu+Sd3ZabK+nBsIGdredAVg==
X-Received: by 2002:a05:6214:411d:: with SMTP id
 kc29mr3321725qvb.22.1635814840113;
        Mon, 01 Nov 2021 18:00:40 -0700 (PDT)
Received: from localhost ([2605:a601:a618:1500:e909:8c96:f147:8c9c])
        by smtp.gmail.com with ESMTPSA id
 84sm11045178qkf.68.2021.11.01.18.00.39
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 18:00:39 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] CI: use master branch again
Date: Mon,  1 Nov 2021 21:00:38 -0400
Message-Id: <20211102010039.27084-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 02 Nov 2021 01:00:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2329

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/base.yml  | 2 +-
 ci/clang.yml | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/ci/base.yml b/ci/base.yml
index 2c41232e5a55..d2ea867adb52 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -5,7 +5,7 @@ distro: poky
 
 defaults:
   repos:
-    refspec: honister
+    refspec: master
 
 repos:
   meta-arm:
diff --git a/ci/clang.yml b/ci/clang.yml
index f4573fa74b0c..f35244739e4d 100644
--- a/ci/clang.yml
+++ b/ci/clang.yml
@@ -4,7 +4,6 @@ header:
 repos:
   meta-clang:
     url: https://github.com/kraj/meta-clang
-    refspec: honister
 
 local_conf_header:
   clang: |
-- 
2.20.1


