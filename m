Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B8CEB64D7
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 18:17:20 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.5828.1686939436930364261
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 16 Jun 2023 11:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=OImjWsyo;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-53fbb3a013dso813445a12.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 16 Jun 2023 11:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686939436; x=1689531436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0RRG0OOFo0lbK7d1RflcACmw6FD1ErHEIjZ83nsB2E=;
        b=OImjWsyo0A3iqPEsqmflNG+/At2u5bTLw0Qv6Dy0nGP1y81ARs0t0gRJfSWOGUnYHE
         8hDDNf3OsTsg14t8JDA41bMNS01g+GnVtPPqaCvAgBIBk65AEJn3PfHN5hxxUk046hFh
         Q65AMlshYDcHFXggbJGybLqiBEgEzYFxsfdZd/Pc2ajhxybefWXSxHk5ILeSERo94bGA
         RH1YHIeo7Xy0OtsybyPhPisNG5oBo2mbcTYcGQPoWa8t+8BXbfWLlYOizz8ggL+1bwrI
         W8QQQ2Oc0D4wAV1aYlBbYLFcFAYZwUwOd/9PD01YPnDPIY/Zf6wm90Ok00BI76zJWhrY
         KX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686939436; x=1689531436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0RRG0OOFo0lbK7d1RflcACmw6FD1ErHEIjZ83nsB2E=;
        b=H7rusDtFNDBM9eh6vYFdt9Jp3/ZKKmcOqVuCxylt7EQ+lwLIkmApPuBmD+bfWaJy4E
         A69aESswiVDod19nbcblwOHMbGLXasYpH5od/F7noLTquPmOQPc1gDWD57L7aCjyNcs7
         qdzOEeVaLYEb91UpDbKpqY8f55UbFMZL/GfUccoHwaOU+hdY41+T7oqK0REtZxF2s0Jf
         oiHkAdv2tdkX9ezOGCcXtr3plRzCHEzf+4xlFPzyESGtl6qV6t/2HEJvK2nYLoLBCYWi
         M0kTFD/hLvIHegjdCRiw0KHROuZRx51PYlKYDcOXcgrMw45APCu5A+iLEcvvPN26ZDue
         uKqA==
X-Gm-Message-State: AC+VfDzaJAlCsG51PIJoIssTHniGbonHDYHgvuGpPws6zC48VBNkMzoI
	+uBe1Mob21yT7a8zH2UWFVxU9+h7tGI=
X-Google-Smtp-Source: ACHHUZ6tH3XDKAZn6qT483OSgAAx7ZatK0PbQWs4To39nN74LtxspPRzZgL+sANaqi8rHp13SrlM0w==
X-Received: by 2002:a17:90a:1ce:b0:25e:af28:ae99 with SMTP id 14-20020a17090a01ce00b0025eaf28ae99mr2625712pjd.11.1686939435802;
        Fri, 16 Jun 2023 11:17:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id t15-20020a17090ad50f00b0024e05b7ba8bsm1697777pju.25.2023.06.16.11.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 11:17:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] gn: Fix build with gcc13
Date: Fri, 16 Jun 2023 11:17:12 -0700
Message-ID: <20230616181712.4168591-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230616181712.4168591-1-raj.khem@gmail.com>
References: <20230616181712.4168591-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 16 Jun 2023 18:17:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4803

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Remove-redundant-move-in-return-stat.patch | 43 +++++++++++++++++++
 meta-arm/recipes-devtools/gn/gn_git.bb        |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-arm/recipes-devtools/gn/gn/0001-desc_builder.cc-Remove-redundant-move-in-return-stat.patch

diff --git a/meta-arm/recipes-devtools/gn/gn/0001-desc_builder.cc-Remove-redundant-move-in-return-stat.patch b/meta-arm/recipes-devtools/gn/gn/0001-desc_builder.cc-Remove-redundant-move-in-return-stat.patch
new file mode 100644
index 00000000..f712037a
--- /dev/null
+++ b/meta-arm/recipes-devtools/gn/gn/0001-desc_builder.cc-Remove-redundant-move-in-return-stat.patch
@@ -0,0 +1,43 @@
+From 45673f4f62eb063d6d5aa0ad68a6171936ad9347 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 24 Jan 2023 00:13:57 -0800
+Subject: [PATCH] desc_builder.cc: Remove redundant move in return statement
+
+Fixes build with gcc13
+
+../git/src/gn/desc_builder.cc: In member function 'base::Value {anonymous}::BaseDescBuilder::ToBaseValue(const Scope*)':
+../git/src/gn/desc_builder.cc:179:21: error: redundant move in return statement [-Werror=redundant-move]
+  179 |     return std::move(res);
+      |            ~~~~~~~~~^~~~~
+
+Upstream-Status: Submitted [https://gn-review.googlesource.com/c/gn/+/15000]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/gn/desc_builder.cc | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/gn/desc_builder.cc b/src/gn/desc_builder.cc
+index 444a5e02..3ef170c3 100644
+--- a/src/gn/desc_builder.cc
++++ b/src/gn/desc_builder.cc
+@@ -167,7 +167,7 @@ class BaseDescBuilder {
+     base::ListValue res;
+     for (const auto& v : vector)
+       res.GetList().emplace_back(ToBaseValue(v));
+-    return std::move(res);
++    return res;
+   }
+ 
+   base::Value ToBaseValue(const Scope* scope) {
+@@ -176,7 +176,7 @@ class BaseDescBuilder {
+     scope->GetCurrentScopeValues(&map);
+     for (const auto& v : map)
+       res.SetKey(v.first, ToBaseValue(v.second));
+-    return std::move(res);
++    return res;
+   }
+ 
+   base::Value ToBaseValue(const Value& val) {
+-- 
+2.39.1
+
diff --git a/meta-arm/recipes-devtools/gn/gn_git.bb b/meta-arm/recipes-devtools/gn/gn_git.bb
index 4e7fa9f7..44a7f3a6 100644
--- a/meta-arm/recipes-devtools/gn/gn_git.bb
+++ b/meta-arm/recipes-devtools/gn/gn_git.bb
@@ -5,6 +5,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main \
+           file://0001-desc_builder.cc-Remove-redundant-move-in-return-stat.patch \
            file://0001-Replace-lstat64-stat64-functions-on-linux.patch"
 SRCREV = "4bd1a77e67958fb7f6739bd4542641646f264e5d"
 PV = "0+git${SRCPV}"
-- 
2.41.0


