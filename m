Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.13867.1624898393646699626
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 28 Jun 2021 09:39:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KaAe7Irw;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id j24so563707pfi.12
        for <meta-arm@lists.yoctoproject.org>; Mon, 28 Jun 2021 09:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=phuqmRzORzclvBLLyYyGKE7fYyn8wb44IeL+Tvh1PXs=;
        b=KaAe7Irw+nSmJXVWvZhHR2CL4gfTeCIejqzY7SxaUlDd4RrxO3Ehuvz4ByvC55Pi5b
         rndRrTJu1XmFbH7DUK+MVyOrF99yKbREzxEQ6MlheB5AORwiy/5NR14r6rqRxADs6eJd
         t8aszXcl0NAqeLAa05diPj67jyu5UvnmLCJnPZROLaXarCU6k6n2m4Jbip3wahdtJXH3
         R0uwacgQhWi9EQHEXpJ/q72FYIFFXOrSmLnuyRopImM6wBqEIMOdTkDC4xE8m8i082jw
         M5AvqPbMqXTDsQ7Zlc4/8p0EBpOBbttULYeiAaWHyEljW3VyTMAqgNRxuys+k91is2XJ
         xkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=phuqmRzORzclvBLLyYyGKE7fYyn8wb44IeL+Tvh1PXs=;
        b=PVliexD/kaTC6wjFxRqQntYYH3mv7muPruq1cuEHVAtfcTDO7eR8m6R5+7lVOsuxbx
         gebMOCtGINYznWZcWppEPAMcXnkxshrWpa9LypYko/ukh4F0UYlrgk8AbkMKHfmeNdzx
         cjZHLNQWvq14He+8u3kNNSjOwCGoxSCgtCDaJxLqVBhrN5j7f4BX9Mrj9GgDhI7nbE1B
         +uEKFRq/ipIDqwWBd1ZJKOv/Cko0CTsNUSShF8cnt+ZDulxhIB3zeISNFZNnnwtd4c7U
         cQkHyUEjV0PuQWwVOwAwL1JQturaYK1jAjAAZCuJspRxoWgfTzUJfJgNU9EEZ5FcV2lT
         x65Q==
X-Gm-Message-State: AOAM530ZbDUHaTJejPjrBi+nIWiPGgSkOSLJlW3OeU7gaTbU2SAxSQRw
	OymGSRzmyP7QqeZjlCa7s5utian1DpJlGg==
X-Google-Smtp-Source: ABdhPJwrTpLVjwGLanNsi+5tto/hGf3F532+nMSHuZfPQv67rPbr+LLV9mvWoy12e38fXe7w+TyrBA==
X-Received: by 2002:a63:6642:: with SMTP id a63mr23963622pgc.241.1624898392971;
        Mon, 28 Jun 2021 09:39:52 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b522])
        by smtp.gmail.com with ESMTPSA id k25sm14646159pfa.213.2021.06.28.09.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 09:39:52 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Jon Mason <jon.mason@arm.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH v2] gator-daemon: Do not specify header files in GATORD_CXX_SRC_FILES
Date: Mon, 28 Jun 2021 09:39:50 -0700
Message-Id: <20210628163950.3337168-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jon Mason <jon.mason@arm.com>
Cc: Ross Burton <ross.burton@arm.com>
---
v2: Add upstream status

 ...e-xml-PmuXMLParser.h-header-from-GAT.patch | 32 +++++++++++++++++++
 .../gator-daemon/gator-daemon_7.7.0.bb        |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch

diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch b/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch
new file mode 100644
index 0000000..8ac2bdc
--- /dev/null
+++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch
@@ -0,0 +1,32 @@
+From 6f62c77f0a51de17b7f81f225ef483ed8214640e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 26 Jun 2021 14:19:10 -0700
+Subject: [PATCH] Sources.mk: Remove xml/PmuXMLParser.h header from
+ GATORD_CXX_SRC_FILES
+
+This otherwise appears in final linker cmdline and clang is not happy
+since it sees this as an output file along with the real output file
+specified with -o and bails out
+
+| clang-13: error: cannot specify -o when generating multiple output files
+
+Upstream-Status: Backport [https://github.com/ARM-software/gator/commit/6ef311882a56e14c189d70c4d72945dd95e9b88e]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ daemon/Sources.mk | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/daemon/Sources.mk b/daemon/Sources.mk
+index 60d15ef..3e679f5 100644
+--- a/daemon/Sources.mk
++++ b/daemon/Sources.mk
+@@ -147,5 +147,4 @@ GATORD_CXX_SRC_FILES := \
+     xml/EventsXMLProcessor.cpp \
+     xml/MxmlUtils.cpp \
+     xml/PmuXML.cpp \
+-    xml/PmuXMLParser.cpp \
+-    xml/PmuXMLParser.h
++    xml/PmuXMLParser.cpp
+-- 
+2.32.0
+
diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
index 61b1731..b3ba437 100644
--- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
+++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
@@ -16,7 +16,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                    "
 
 SRCREV = "9d8d75fa08352470c51abc23fe3b314879bd8b78"
-SRC_URI = "git://github.com/ARM-software/gator.git;protocol=http;branch=main"
+SRC_URI = "git://github.com/ARM-software/gator.git;protocol=http;branch=main \
+           file://0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch;striplevel=2 \
+          "
 
 S = "${WORKDIR}/git/daemon"
 
-- 
2.32.0

