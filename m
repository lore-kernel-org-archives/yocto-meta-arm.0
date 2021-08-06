Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web08.2969.1628285790140589010
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 06 Aug 2021 14:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=g4yxHvBf;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id k13so7540804qth.10
        for <meta-arm@lists.yoctoproject.org>; Fri, 06 Aug 2021 14:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Hox/izsIL66elHqfvo2d8jU15U//hhtJz8TGxVxhzxs=;
        b=g4yxHvBf3wRjn3ndUktfpAJXV0DFrVkFmeQ0gtjgoHSwfqZ0nG+a6YQO4nwpv09IvL
         FWSrISMfhyhK9d/RvK5NHum/CWj2q4E8/2LGziqW+pjrhZp2DuEpWp7+kTaOsEqwiZze
         NdaTzIBbQnof05TDzAX6jzvNLR1cXNMZNAFnAD0Yiy4n/R25Joya4YC20/aeHiyhj0nn
         AMQIqCK+4hvNtaSGYRIBriKX5wR3dWenAv4kOUAgLb6UUSuSa0TZdTegffWYoyohC4WI
         ozZSp3YNc/Fe8dROZ0py0gXoRzktZup8ytxmYKa5zZFuw5ODnTAsMvxgg8eeWcbj4eHt
         2aMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hox/izsIL66elHqfvo2d8jU15U//hhtJz8TGxVxhzxs=;
        b=f4FtY+9bVfhcgMW+8lmbfU3WDkeHGzsjLX+cAaeu7msGP+IqTj5zR5U3FGU3SX4V0R
         7zTQYMyUpogOdb+IHNQxbX1P4Cw6OyloRGBKJFB/26ExdoXhvBvs3cC3Hf6Mzbazdbnl
         oR61g1laom9p5yyksZwWBXPNsfqSz0nbIRkzpcXwkCOb54mrAtGrYzjpPa9Cxu5uUKT6
         p+8Ocp1Hh6JVoo9i18Elllwz5w+m9ncpeRJeM3UnuWOQuQUms1I4kib/PnOWNMdM0+hP
         7kDM4VEQwXVhJcIifP+c/sbLrTMxIynRbRmqtrqY74RMd8zNZZXnGDq05f4xAIKscS6y
         4j2A==
X-Gm-Message-State: AOAM532+RvVDTpIk3skDF2vZ3Kwu2mf5A//QlD1vr7QOVg5umVKcHLPr
	EIGVeTVZ+hKbc3Q6wjS0ayxFd6DcUgxTgA==
X-Google-Smtp-Source: ABdhPJxFHy9BBZpha0eiFMEcJvo+z128A04c+MHG9+NCqSLtMcqxFaKOVPXdFEeMo2psHnyaTojcCA==
X-Received: by 2002:aed:206a:: with SMTP id 97mr10752966qta.180.1628285789215;
        Fri, 06 Aug 2021 14:36:29 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a632:4e00:59e3:c3e7:7bac:fd79])
        by smtp.gmail.com with ESMTPSA id g4sm4968634qkk.104.2021.08.06.14.36.28
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 14:36:29 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/7] CI: rename meta-python to meta-openembedded
Date: Fri,  6 Aug 2021 17:36:23 -0400
Message-Id: <20210806213624.22981-7-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210806213624.22981-1-jon.mason@arm.com>
References: <20210806213624.22981-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the meta-python.yml file to be meta-openembedded.  This allows
for more usage of the layers present there (as meta-python is housed
under meta-openembedded).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                                |  2 +-
 ci/gem5-arm64-xen.yml                         |  8 +-------
 ci/gem5-arm64.yml                             |  6 +-----
 ci/meta-arm-autonomy.yml                      | 10 ++--------
 ci/{meta-python.yml => meta-openembedded.yml} |  2 ++
 ci/meta-zephyr.yml                            |  2 +-
 ci/musca-s1.yml                               |  2 +-
 7 files changed, 9 insertions(+), 23 deletions(-)
 rename ci/{meta-python.yml => meta-openembedded.yml} (76%)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a85d2cd79e5c..98a790878d39 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -85,7 +85,7 @@ check-layers:
   extends: .setup
   coverage: '/Coverage: \d+/'
   script:
-  - kas shell --update --force-checkout ci/base.yml:ci/meta-arm-autonomy.yml:ci/meta-python.yml --command \
+  - kas shell --update --force-checkout ci/base.yml:ci/meta-arm-autonomy.yml:ci/meta-openembedded.yml --command \
     "$CI_PROJECT_DIR/ci/check-layers.py $CI_PROJECT_DIR/ci/check-layers.yml $CI_PROJECT_DIR $KAS_WORK_DIR"
 
 corstone500:
diff --git a/ci/gem5-arm64-xen.yml b/ci/gem5-arm64-xen.yml
index 4a6fb3b1dec0..f71ffca33ffe 100644
--- a/ci/gem5-arm64-xen.yml
+++ b/ci/gem5-arm64-xen.yml
@@ -3,18 +3,12 @@ header:
   version: 9
   includes:
     - base.yml
-    - meta-python.yml
+    - meta-openembedded.yml
 
 repos:
   meta-arm:
     layers:
       meta-gem5:
-  meta-openembedded:
-    url: https://git.openembedded.org/meta-openembedded
-    layers:
-      meta-oe:
-      meta-filesystems:
-      meta-networking:
   meta-virtualization:
     url: git://git.yoctoproject.org/meta-virtualization
     #FIXME - remove after master branch has overrides syntax conversion patch
diff --git a/ci/gem5-arm64.yml b/ci/gem5-arm64.yml
index fc1b5c91f09b..6d348fc73909 100644
--- a/ci/gem5-arm64.yml
+++ b/ci/gem5-arm64.yml
@@ -2,17 +2,13 @@ header:
   version: 9
   includes:
     - base.yml
+    - meta-openembedded.yml
 
 repos:
   meta-arm:
     layers:
       meta-gem5:
 
-  meta-openembedded:
-    url: https://git.openembedded.org/meta-openembedded
-    layers:
-      meta-oe:
-
 machine: gem5-arm64
 
 target:
diff --git a/ci/meta-arm-autonomy.yml b/ci/meta-arm-autonomy.yml
index f95642c7ef9d..4402b968a383 100644
--- a/ci/meta-arm-autonomy.yml
+++ b/ci/meta-arm-autonomy.yml
@@ -1,15 +1,9 @@
 header:
   version: 9
+  includes:
+    - meta-openembedded.yml
 
 repos:
-  meta-openembedded:
-    url: https://git.openembedded.org/meta-openembedded
-    layers:
-      meta-oe:
-      meta-networking:
-      meta-python:
-      meta-filesystem:
-
   meta-virtualization:
     url: https://git.yoctoproject.org/git/meta-virtualization
 
diff --git a/ci/meta-python.yml b/ci/meta-openembedded.yml
similarity index 76%
rename from ci/meta-python.yml
rename to ci/meta-openembedded.yml
index 0b4b958e16d3..4b95217bdec2 100644
--- a/ci/meta-python.yml
+++ b/ci/meta-openembedded.yml
@@ -5,5 +5,7 @@ repos:
   meta-openembedded:
     url: https://git.openembedded.org/meta-openembedded
     layers:
+      meta-filesystems:
+      meta-networking:
       meta-oe:
       meta-python:
diff --git a/ci/meta-zephyr.yml b/ci/meta-zephyr.yml
index aa3f97c1ca13..2b9d19e51b07 100644
--- a/ci/meta-zephyr.yml
+++ b/ci/meta-zephyr.yml
@@ -1,7 +1,7 @@
 header:
   version: 9
   includes:
-    - meta-python.yml
+    - meta-openembedded.yml
 
 repos:
   meta-zephyr:
diff --git a/ci/musca-s1.yml b/ci/musca-s1.yml
index 30a12d53459f..4d31a68244eb 100644
--- a/ci/musca-s1.yml
+++ b/ci/musca-s1.yml
@@ -2,7 +2,7 @@ header:
   version: 9
   includes:
     - base.yml
-    - meta-python.yml
+    - meta-openembedded.yml
 
 machine: musca-s1
 
-- 
2.20.1

