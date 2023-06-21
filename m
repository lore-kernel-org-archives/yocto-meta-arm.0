Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1729EEB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 06:12:55 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.4859.1687327968689500303
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Jun 2023 23:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hQO9iGZL;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6682909acadso2055602b3a.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 20 Jun 2023 23:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687327968; x=1689919968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lG5hVUeCxhVwQHRb4Nhur48H1NNxBLE5HEr+Q7eAU/4=;
        b=hQO9iGZLTEQV4xLbvABzT/8wCkp9MiN1UmN11icltaZM2abcO1wpSz9LUvc4thSDT7
         ae+D0Uq4rMYwQqhevfyJHugrsGpvXu45QKl1wPSh0zQImXzxKCd85v3A7eGSzLsy/eU7
         INmhQhtmT85mFBSi8Yg5pScfPtKeBVf1VuALdwuf7Fmk1Q5QxP/pQ1uLNXmkSWs+MFq2
         2xygdyq7O0wGgUOFhgxSn77ioEWP8IWWBL6kY/k5NEN1AluuXXXL0oSXPToORRH+oiN+
         NXVFuKmj5edcDTUD+S/2cEHrgro6mSMvS5aof8Tc59SkTWp9Q7bGVk3e736PtA/BaZgJ
         eUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687327968; x=1689919968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lG5hVUeCxhVwQHRb4Nhur48H1NNxBLE5HEr+Q7eAU/4=;
        b=ek3Q+RCHRtBf5ddpVnjyhaTlcYOUGivCWR1rjsjOXz1cZ0o6Hr1ddysxMym2FlUdkO
         5WEpFTp5i5NXEmeuyfYTnwfuQfgY8sqxFsgusAxFm0Xiw783rzuMyIyvA2depPaQmzXb
         l3niz96BVgBtvprMx/J7eLADtKrq1gSfG1hiBTyCpUneRPIKLSThZvDeAScqGHk4cy7Q
         WpkXcCu0K1tKUVZqCXVd0woswHbJTYohQSDeW8RHNdeEqXGSoBCCwE7WIWvFXvcZEN9q
         UfWtXpkFcaGOqaeQYWagZ/prNtVpD+PolXUusSkFKwhUp31f7gitbshn+GsZLi7KRSaU
         XgiQ==
X-Gm-Message-State: AC+VfDwZl3QWG78oBot8k2IWKrCyUR+2xEaw2hFmXLJi1+7litbHk1Gh
	6tiHMqo2dzJavl2HP2F6vI63YjK/N7U=
X-Google-Smtp-Source: ACHHUZ67BdFiTMkBkwQsulDNXtgkW63oSBxJp/3QydJTXSXblzC4WCZs/sBB+A2k8A0pAn6/OX0Ztg==
X-Received: by 2002:a05:6a00:896:b0:664:aff0:240 with SMTP id q22-20020a056a00089600b00664aff00240mr12634801pfj.33.1687327967684;
        Tue, 20 Jun 2023 23:12:47 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id v26-20020aa7809a000000b006636c4f57a6sm2208998pff.27.2023.06.20.23.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 23:12:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gn: Disable warning as error instead of patching NVRO
Date: Tue, 20 Jun 2023 23:12:45 -0700
Message-ID: <20230621061245.2165826-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Jun 2023 06:12:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4813

This makes all compilers happy

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Remove-redundant-move-in-return-stat.patch | 43 -------------------
 meta-arm/recipes-devtools/gn/gn_git.bb        |  4 +-
 2 files changed, 3 insertions(+), 44 deletions(-)
 delete mode 100644 meta-arm/recipes-devtools/gn/gn/0001-desc_builder.cc-Remove-redundant-move-in-return-stat.patch

diff --git a/meta-arm/recipes-devtools/gn/gn/0001-desc_builder.cc-Remove-redundant-move-in-return-stat.patch b/meta-arm/recipes-devtools/gn/gn/0001-desc_builder.cc-Remove-redundant-move-in-return-stat.patch
deleted file mode 100644
index f712037a..00000000
--- a/meta-arm/recipes-devtools/gn/gn/0001-desc_builder.cc-Remove-redundant-move-in-return-stat.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 45673f4f62eb063d6d5aa0ad68a6171936ad9347 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 24 Jan 2023 00:13:57 -0800
-Subject: [PATCH] desc_builder.cc: Remove redundant move in return statement
-
-Fixes build with gcc13
-
-../git/src/gn/desc_builder.cc: In member function 'base::Value {anonymous}::BaseDescBuilder::ToBaseValue(const Scope*)':
-../git/src/gn/desc_builder.cc:179:21: error: redundant move in return statement [-Werror=redundant-move]
-  179 |     return std::move(res);
-      |            ~~~~~~~~~^~~~~
-
-Upstream-Status: Submitted [https://gn-review.googlesource.com/c/gn/+/15000]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/gn/desc_builder.cc | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/gn/desc_builder.cc b/src/gn/desc_builder.cc
-index 444a5e02..3ef170c3 100644
---- a/src/gn/desc_builder.cc
-+++ b/src/gn/desc_builder.cc
-@@ -167,7 +167,7 @@ class BaseDescBuilder {
-     base::ListValue res;
-     for (const auto& v : vector)
-       res.GetList().emplace_back(ToBaseValue(v));
--    return std::move(res);
-+    return res;
-   }
- 
-   base::Value ToBaseValue(const Scope* scope) {
-@@ -176,7 +176,7 @@ class BaseDescBuilder {
-     scope->GetCurrentScopeValues(&map);
-     for (const auto& v : map)
-       res.SetKey(v.first, ToBaseValue(v.second));
--    return std::move(res);
-+    return res;
-   }
- 
-   base::Value ToBaseValue(const Value& val) {
--- 
-2.39.1
-
diff --git a/meta-arm/recipes-devtools/gn/gn_git.bb b/meta-arm/recipes-devtools/gn/gn_git.bb
index 44a7f3a6..dbdb1ce2 100644
--- a/meta-arm/recipes-devtools/gn/gn_git.bb
+++ b/meta-arm/recipes-devtools/gn/gn_git.bb
@@ -5,7 +5,6 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main \
-           file://0001-desc_builder.cc-Remove-redundant-move-in-return-stat.patch \
            file://0001-Replace-lstat64-stat64-functions-on-linux.patch"
 SRCREV = "4bd1a77e67958fb7f6739bd4542641646f264e5d"
 PV = "0+git${SRCPV}"
@@ -23,6 +22,9 @@ def gn_platform(variable, d):
     else:
         return os
 
+# Make gcc13 happy
+CXXFLAGS += "-Wno-error=redundant-move"
+
 do_configure[cleandirs] += "${B}"
 do_configure() {
     python3 ${S}/build/gen.py \
-- 
2.41.0


