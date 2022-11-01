Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05881C43217
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:25:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.749.1667348741618747424
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Nov 2022 17:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 610E823A
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Nov 2022 17:25:47 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 006433F534
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Nov 2022 17:25:40 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/gator-daemon: update to v7.8.0
Date: Tue,  1 Nov 2022 09:15:36 -0400
Message-Id: <20221101131536.29976-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221101131536.29976-1-jon.mason@arm.com>
References: <20221101131536.29976-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Nov 2022 00:25:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4071

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...e-xml-PmuXMLParser.h-header-from-GAT.patch | 32 -------------------
 ...-daemon_7.7.0.bb => gator-daemon_7.8.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 34 deletions(-)
 delete mode 100644 meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch
 rename meta-arm/recipes-devtools/gator-daemon/{gator-daemon_7.7.0.bb => gator-daemon_7.8.0.bb} (90%)

diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch b/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch
deleted file mode 100644
index 8ac2bdc4..00000000
--- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 6f62c77f0a51de17b7f81f225ef483ed8214640e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 26 Jun 2021 14:19:10 -0700
-Subject: [PATCH] Sources.mk: Remove xml/PmuXMLParser.h header from
- GATORD_CXX_SRC_FILES
-
-This otherwise appears in final linker cmdline and clang is not happy
-since it sees this as an output file along with the real output file
-specified with -o and bails out
-
-| clang-13: error: cannot specify -o when generating multiple output files
-
-Upstream-Status: Backport [https://github.com/ARM-software/gator/commit/6ef311882a56e14c189d70c4d72945dd95e9b88e]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- daemon/Sources.mk | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/daemon/Sources.mk b/daemon/Sources.mk
-index 60d15ef..3e679f5 100644
---- a/daemon/Sources.mk
-+++ b/daemon/Sources.mk
-@@ -147,5 +147,4 @@ GATORD_CXX_SRC_FILES := \
-     xml/EventsXMLProcessor.cpp \
-     xml/MxmlUtils.cpp \
-     xml/PmuXML.cpp \
--    xml/PmuXMLParser.cpp \
--    xml/PmuXMLParser.h
-+    xml/PmuXMLParser.cpp
--- 
-2.32.0
-
diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
similarity index 90%
rename from meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
rename to meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
index 07b8abbf..0daebfde 100644
--- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
+++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
@@ -15,9 +15,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://k/perf_event.h;endline=14;md5=e548bf30a60b2ed11ef2dcf7bfdac230 \
                    "
 
-SRCREV = "9d8d75fa08352470c51abc23fe3b314879bd8b78"
+SRCREV = "6a944e7ee1f1c3ab9b2a57efd24c58503122db02"
 SRC_URI = "git://github.com/ARM-software/gator.git;protocol=http;branch=main;protocol=https \
-           file://0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch;striplevel=2 \
            file://0001-daemon-mxml-Define-_GNU_SOURCE.patch;striplevel=2 \
           "
 
-- 
2.17.1


