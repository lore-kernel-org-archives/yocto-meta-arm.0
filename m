Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web12.7684.1590886783438275747
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 30 May 2020 17:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LjPh3XOX;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id x11so2795936plv.9
        for <meta-arm@lists.yoctoproject.org>; Sat, 30 May 2020 17:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tglkySqm4Vn0kxN71/H25KubSOn4DPlp0dA4bY++DG4=;
        b=LjPh3XOXBCJOywPObxVQlkeERQNk7wX9rcynsmS9c/t9Or4xThQeZ6O4bKJsTo2ab1
         K1DWoinz7Wo4akhiSxY+1EO0B1wn83lop1Lhn+AZKhmkCJ9AqaJp33SjIMR9w9qp0xa/
         nYO/fjPyD4z5n1nHFra1WW3Ka2jN7qcuf9nN5YJGZInQ5kO9/QXG+UvmfZWDyrdxPYX0
         nhJaM8T2lAi9eK/owXNHUxY2hoKWu73b0LvG0pn26YylBIbznFgb+5TTQjl4/+r+M+bM
         xPNAaBGu4uT2PJb0nfMHRzqY6DzAX4hBycSLIMO6KURkyaoCniqKswV7mfH5fIR6WxuX
         cMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tglkySqm4Vn0kxN71/H25KubSOn4DPlp0dA4bY++DG4=;
        b=cZ7mJ6XyN9ZPz+bgp1vxtxd4/o4JYWABrwLhVq72bclReH/NzDw0w9gBiNFHJ3Qvju
         EQbo7/AfasONBqzvoqybFr8NGgQxt4tTpWSGkfZvKMj3RZuWSt+7CR4luZtkI8KnlpSC
         1kx9ZTntA2VRdDSFT6/CclbTI3wqRcYzQidylGRXyU8NAEI/MkGS7l4y+Mq0G/JSNdQ/
         nEx5UhpxtuZBgxzQo62cV4u6bwofxZCeIYiq6quh0f7YFZ2QiXpvo+1BDoemtss2CZrI
         Exun2DSx32Z9LakQ5s4SLc7LUhsn136krX2ZdV20RFZrMx2GlYM4pfYb7U5LxNitnTfF
         p7cQ==
X-Gm-Message-State: AOAM530HipuWyDA75bBTjDOCaU9tkMsXLkAF2oMutCnS7/lEoTBYkmNz
	tF84ECrCQK6AoV1P46PbvPYHiFc6vM0=
X-Google-Smtp-Source: ABdhPJyfLexKreTnSL4oJHgEj+XtYBml4v52xRuh9/Dyx7IH9ju8IeRDa3B2JOyH2S6XP+uFkaKZvA==
X-Received: by 2002:a17:90a:2305:: with SMTP id f5mr16612569pje.57.1590886782499;
        Sat, 30 May 2020 17:59:42 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::86f0])
        by smtp.gmail.com with ESMTPSA id u20sm10720169pfn.144.2020.05.30.17.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2020 17:59:41 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org,
	jon.mason@arm.com
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] optee-test: Fix build with musl
Date: Sat, 30 May 2020 17:59:40 -0700
Message-Id: <20200531005940.1032825-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Adjust-order-of-including-compiler.h.patch | 64 +++++++++++++++++++
 .../recipes-security/optee/optee-test_git.bb  |  4 +-
 2 files changed, 67 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-security/optee/optee-test/0001-host-xtest-Adjust-order-of-including-compiler.h.patch

diff --git a/meta-arm/recipes-security/optee/optee-test/0001-host-xtest-Adjust-order-of-including-compiler.h.patch b/meta-arm/recipes-security/optee/optee-test/0001-host-xtest-Adjust-order-of-including-compiler.h.patch
new file mode 100644
index 0000000..3066b66
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test/0001-host-xtest-Adjust-order-of-including-compiler.h.patch
@@ -0,0 +1,64 @@
+From fc95b3ccbbfd336797ae2cfd6dd4dc58644e146f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 May 2020 17:52:18 -0700
+Subject: [PATCH] host/xtest: Adjust order of including compiler.h
+
+compiler.h defines some defines which violate libc namespace e.g.
+__unused, this works ok with glibc but fails in awkward ways with musl
+the reason is musl uses __unused in its internal structures and this
+define in compiler.h conflicts with system headers causing errors like
+
+recipe-sysroot/usr/include/bits/stat.h:17:19: error: expected identifier or '(' before '[' token unsigned __unused[2];
+                   ^
+including compiler.h afer sys/stat.h fixes the problem.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ host/xtest/install_ta.c | 2 +-
+ host/xtest/stats.c      | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/host/xtest/install_ta.c b/host/xtest/install_ta.c
+index 09a4c6d..6f7bb5c 100644
+--- a/host/xtest/install_ta.c
++++ b/host/xtest/install_ta.c
+@@ -4,7 +4,6 @@
+  * SPDX-License-Identifier: BSD-2-Clause
+  */
+ 
+-#include <compiler.h>
+ #include <dirent.h>
+ #include <err.h>
+ #include <errno.h>
+@@ -20,6 +19,7 @@
+ #include <sys/types.h>
+ #include <tee_client_api.h>
+ #include <unistd.h>
++#include <compiler.h>
+ 
+ #include "install_ta.h"
+ #include "xtest_helpers.h"
+diff --git a/host/xtest/stats.c b/host/xtest/stats.c
+index 96b0b5f..db9bf25 100644
+--- a/host/xtest/stats.c
++++ b/host/xtest/stats.c
+@@ -3,7 +3,6 @@
+  * Copyright (c) 2019, Linaro Limited
+  */
+ 
+-#include <compiler.h>
+ #include <dirent.h>
+ #include <err.h>
+ #include <errno.h>
+@@ -18,6 +17,7 @@
+ #include <sys/types.h>
+ #include <tee_client_api.h>
+ #include <unistd.h>
++#include <compiler.h>
+ #include "xtest_test.h"
+ #include "stats.h"
+ 
+-- 
+2.26.2
+
diff --git a/meta-arm/recipes-security/optee/optee-test_git.bb b/meta-arm/recipes-security/optee/optee-test_git.bb
index f699972..957286c 100644
--- a/meta-arm/recipes-security/optee/optee-test_git.bb
+++ b/meta-arm/recipes-security/optee/optee-test_git.bb
@@ -13,7 +13,9 @@ DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
 PV = "3.8.0+git${SRCPV}"
 
 SRCREV = "30481e381cb4285706e7516853495a7699c93b2c"
-SRC_URI = "git://github.com/OP-TEE/optee_test.git"
+SRC_URI = "git://github.com/OP-TEE/optee_test.git \
+           file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
+          "
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
-- 
2.26.2

