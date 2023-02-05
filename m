Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F8FC636CC
	for <webhook@archiver.kernel.org>; Sun,  5 Feb 2023 17:59:09 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.33933.1675619941730997692
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 05 Feb 2023 09:59:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=q1boLhGN;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id g13so5198569ple.10
        for <meta-arm@lists.yoctoproject.org>; Sun, 05 Feb 2023 09:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QVznHZygAG/EFojxsZtQk/s74hMCo4+CC9Sw43jrIZg=;
        b=q1boLhGNKoVxX1OxljNFitqiSfmR3KeJV8kjFG3+F8Bstfn1hcPhSz7V/tpRSLL1Hi
         3MJDDUDno8mfGs7XQwpTMUF2PcoYXiyKlFBMDoTjX9160oxNRcrt8FVPV9gFcgaJmsPW
         S31G3xjYvhegt3NrX2wVTLKN/qegNrJwiG52QWAwcqItpkQcOGVIS5nftBuRdVEeoEpl
         4Ay57u7xXSUQ2S7r4mqZcxYdRus22mDrAjZnnhbNol4crrDdaDms2TQRXEALYJddZks2
         WletzBfa1fbnlMrn/Bcz81/Yd3+q4BXXhpfLv2jNsSQcXfrltd4wj0SogJ9c3wNhIstV
         BaNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVznHZygAG/EFojxsZtQk/s74hMCo4+CC9Sw43jrIZg=;
        b=Uf8R7kOgZjSal1xQMmsnsrONhYb1mdwYZmThW5ddBQC+39XRkh3YnzIEdCtsyCQwbS
         LXGn2LjX38CdxzsuDAx0Hs/7UrO15WuLq+H8DJeNaRwu91gKlqI5ZJsp1eSF0J/h2V3m
         daSOpwZgNZhyYoGKJ/yXE4Z0vXYaKE0qdq0N9oY26xLVjl4AsbZRNVm93ithkcpY7Y6s
         FBdwhqKjg8vj4rLV086Wtzkm1hCK6P6jE9N9LMjCZSrb70pOdQhz1DHX2DXgo8CWy/q0
         xX8j1rowaeZeICZTdCq69z0+fvF/Fo20buOf/zexnx/jUAfq1GquX9VMhZA4iPTdwfj0
         vS/g==
X-Gm-Message-State: AO0yUKURc0FilOLO5UGOHDK6Z/OE8Gwfg3spHziMgAcK9CgLuYu8Yj21
	gbCRiSQoLdKzAFBrS26LHuggG7sHh8I=
X-Google-Smtp-Source: AK7set/hFLBf3s0JPrhtsqadSpmLOW5EiwFiTC5TDX7pKBskfybNzyVoxLW7rWqi1Dg9QKJ//z4Cbg==
X-Received: by 2002:a17:902:dac8:b0:194:645a:fa9a with SMTP id q8-20020a170902dac800b00194645afa9amr20688741plx.8.1675619940671;
        Sun, 05 Feb 2023 09:59:00 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::868f])
        by smtp.gmail.com with ESMTPSA id jw6-20020a170903278600b0019608291564sm5191727plb.134.2023.02.05.09.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 09:59:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gn: Fix build with gcc13
Date: Sun,  5 Feb 2023 09:58:58 -0800
Message-Id: <20230205175858.1485064-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 05 Feb 2023 17:59:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4366

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
index 521e33e9..2e58d28b 100644
--- a/meta-arm/recipes-devtools/gn/gn_git.bb
+++ b/meta-arm/recipes-devtools/gn/gn_git.bb
@@ -5,6 +5,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main \
+           file://0001-desc_builder.cc-Remove-redundant-move-in-return-stat.patch \
            file://0001-Replace-lstat64-stat64-functions-on-linux.patch"
 SRCREV = "bf4e17dc67b2a2007475415e3f9e1d1cf32f6e35"
 PV = "0+git${SRCPV}"
-- 
2.39.1


