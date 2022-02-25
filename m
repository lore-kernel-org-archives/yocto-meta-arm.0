Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECF4C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 05:08:09 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web08.3522.1645765689262066218
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 21:08:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=iQZs1tO9;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.48,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f48.google.com with SMTP id w7so5948055qvr.3
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 21:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jI69rkV1ppSnYgLq2INCBk5yRRxVCyMDMZ4733yNUZo=;
        b=iQZs1tO9kEqCjjIr+L7Fjixc1RAL/iqUcMowt/N8Y9mLnXurmpQ6yTLf/VZR3Ief7q
         EVxhqdWvWvXFr7wWVdhkMYZxI5ZmUsT+z5xAW9OZ0qvAPKm03ezeYC6d8QN0WC8Zik6+
         I7Kpgb69JD7W+xhnvIMBEMgSXrBK4a8byUeBiDwc6l1AJ0+yWSXQ+zR1NxBAiIURMvTO
         XHSLno1r2f1w1T7b34yfVtDpcZfaGKnz0Ddm+eqPXZMhu5/jplxdH4y+bjdil8ww5IDo
         bKblc5yctcRjYLjT4iMCIApkzgUCAU8SJsTsBTywlv89fvRXJgRYFWbd9ShAQvMJZT8G
         Tm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jI69rkV1ppSnYgLq2INCBk5yRRxVCyMDMZ4733yNUZo=;
        b=eC/xusGhD4UvcjVSxO7hKMnsb43WfInqo0w8elvPE/fMP6pOwcHl4Gw4XsmijEk4UP
         UhcApfSv1xh9DqVJnmRbGBGbMR9OL3FubNSd6WZRvHi2y3eXxRYmH5Cta3DTMLtwWSsv
         8HhcJ0/7dPRzUSxpqfAuM+hgbOZJ+bkuaRUAq5LfsI1FNEEqSnxP+1M9hBZOYmaPbrVu
         P2bCIqRZKrnuNdkRH8Zf0dIW6dP0V1MFdXLJdjnilneqYGbrJsyrDowCtAsbqHmohg6B
         tmQnZZT5JC1bcRusqpKpRnudvIFePLmJwp5IDntPFNplesVRnvQ8jxDp/o0jIM5LzsqU
         w9RQ==
X-Gm-Message-State: AOAM533ExqzZ1pMzdGB8DtQRzvRcslJv7zF+yZSTmQE9W2rYVP28Diwn
	eOzkFn9HcWke8EtZ25o2pZ3A5Bl3mrIKfQ==
X-Google-Smtp-Source: 
 ABdhPJwIst4c3A1cY333RPlTqrjh9Yv5LqXCbQ1fzWQzfMMNk4BspA+Md0pGZHKqm0KgIrcMZR0ZuA==
X-Received: by 2002:a0c:f443:0:b0:432:75f1:163 with SMTP id
 h3-20020a0cf443000000b0043275f10163mr4726963qvm.120.1645765688255;
        Thu, 24 Feb 2022 21:08:08 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:97ee:8b84:aa35:fed0])
        by smtp.gmail.com with ESMTPSA id
 q12-20020a05622a04cc00b002de06a6604asm905096qtx.16.2022.02.24.21.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 21:08:08 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 7/8] CI: run utility jobs last
Date: Fri, 25 Feb 2022 00:08:02 -0500
Message-Id: <20220225050803.2517279-7-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225050803.2517279-1-jon.mason@arm.com>
References: <20220225050803.2517279-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Feb 2022 05:08:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3064

From: Ross Burton <ross.burton@arm.com>

Run check-layer and coverage jobs after the building tasks, as we want
to start compiling sooner and not wait for check-layer to finish before
compiling.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 83 +++++++++++++++++++++++++-------------------------
 1 file changed, 41 insertions(+), 42 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 66d213f575ab..2a450ea3b4f7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -56,15 +56,6 @@ update-repos:
   script:
     - flock --verbose --timeout 60 $KAS_REPO_REF_DIR ./ci/update-repos
 
-
-# What percentage of machines in the layer do we build
-machine-coverage:
-  stage: build
-  interruptible: true
-  script:
-    - ./ci/check-machine-coverage
-  coverage: '/Coverage: \d+/'
-
 #
 # Build stage, the actual build jobs
 #
@@ -74,39 +65,6 @@ machine-coverage:
 #  VIRT: [none, xen]
 #  TESTING: testimage
 
-# Validate layers are Yocto Project Compatible
-check-layers:
-  extends: .setup
-  script:
-    - kas shell --update --force-checkout ci/base.yml:ci/meta-openembedded.yml --command \
-      "yocto-check-layer-wrapper $CI_PROJECT_DIR/$LAYER --dependency $CI_PROJECT_DIR/meta-* $KAS_WORK_DIR/meta-openembedded/meta-oe --no-auto-dependency"
-  parallel:
-    matrix:
-      - LAYER: [meta-arm, meta-arm-bsp, meta-arm-toolchain, meta-gem5]
-
-pending-updates:
-  extends: .setup
-  artifacts:
-    paths:
-      - update-report
-  script:
-    - rm -fr update-report
-    # This configuration has all of the layers we need enabled
-    - kas shell ci/gem5-arm64.yml --command \
-      "$CI_PROJECT_DIR/scripts/machine-summary.py -t report -o $CI_PROJECT_DIR/update-report $($CI_PROJECT_DIR/ci/listmachines.py meta-arm meta-arm-bsp meta-gem5)"
-  # Do this on x86 whilst the compilers are x86-only
-  tags:
-    - x86_64
-
-metrics:
-  extends: .setup
-  artifacts:
-    reports:
-      metrics: metrics.txt
-  script:
-    - kas shell --update --force-checkout ci/base.yml --command \
-      "$CI_PROJECT_DIR/ci/patchreview $CI_PROJECT_DIR/meta-* --verbose --metrics $CI_PROJECT_DIR/metrics.txt"
-
 corstone500:
   extends: .build
 
@@ -234,3 +192,44 @@ tc1:
 
 toolchains:
   extends: .build
+
+# Validate layers are Yocto Project Compatible
+check-layers:
+  extends: .setup
+  script:
+    - kas shell --update --force-checkout ci/base.yml:ci/meta-openembedded.yml --command \
+      "yocto-check-layer-wrapper $CI_PROJECT_DIR/$LAYER --dependency $CI_PROJECT_DIR/meta-* $KAS_WORK_DIR/meta-openembedded/meta-oe --no-auto-dependency"
+  parallel:
+    matrix:
+      - LAYER: [meta-arm, meta-arm-bsp, meta-arm-toolchain, meta-gem5]
+
+pending-updates:
+  extends: .setup
+  artifacts:
+    paths:
+      - update-report
+  script:
+    - rm -fr update-report
+    # This configuration has all of the layers we need enabled
+    - kas shell ci/gem5-arm64.yml --command \
+      "$CI_PROJECT_DIR/scripts/machine-summary.py -t report -o $CI_PROJECT_DIR/update-report $($CI_PROJECT_DIR/ci/listmachines.py meta-arm meta-arm-bsp meta-gem5)"
+  # Do this on x86 whilst the compilers are x86-only
+  tags:
+    - x86_64
+
+# What percentage of machines in the layer do we build
+machine-coverage:
+  stage: build
+  interruptible: true
+  script:
+    - ./ci/check-machine-coverage
+  coverage: '/Coverage: \d+/'
+
+metrics:
+  extends: .setup
+  artifacts:
+    reports:
+      metrics: metrics.txt
+  script:
+    - kas shell --update --force-checkout ci/base.yml --command \
+      "$CI_PROJECT_DIR/ci/patchreview $CI_PROJECT_DIR/meta-* --verbose --metrics $CI_PROJECT_DIR/metrics.txt"
-- 
2.30.2


