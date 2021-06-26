Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.11944.1624742890218597739
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 26 Jun 2021 14:28:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NrD0wn/0;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id z3-20020a17090a3983b029016bc232e40bso7686979pjb.4
        for <meta-arm@lists.yoctoproject.org>; Sat, 26 Jun 2021 14:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Akae/BOqSWGHgs6qN/T/XY2SK38pW/RUpUrhZT67GyE=;
        b=NrD0wn/03dT9HhhwoKdRHeZJEoWr2RQDS9i2DpenUUMfEJZvMNwh0R7q3Pb00o3zwR
         nJrRqnCkiKkTkLdBzbpTVnSfx+V2I000vum92bgprXfkQHiD5D6XcW98KkMxyrqcCzqW
         er+kL6nctKP8K7jlViRkKOUnQDXj6iO6IShu3AgLpvnfYRCBtDu15L1KJ4EUl1PTCY8D
         ByPeUJrUYUZxNJB6+lrl5mHQ+EysLsxWy3a5+NxDGKnBBS9LTAmLlaUVjGI3cDtYk2zl
         /3GaM9+v4AKdcGQ3HNR9FfqiXoIrdFzNXxayKGg6VXVHyqUq2cQQZJpBU3YRy9GnG9ei
         jf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Akae/BOqSWGHgs6qN/T/XY2SK38pW/RUpUrhZT67GyE=;
        b=cJldZtqmfkPUCs7CLwWJTzRuDknSuzphLZczI2F3/n2frSNihr7xeuqdJeuLtKayB9
         0imqfjSxKi2PqqdGj4/I212bRSWDJAvJ+d2e37MQk6VjaOw4RAgF0AWT4RQJIdWLxbI4
         AlUEZjrBZoPy233ofshKWIQhiRM42Y1lhTpTP1eTzEc2GzRI13wrC6FRMiL2CQkMK7Yi
         HMWIhDctDIVt4lH1D8++2CA2xl8jCjfTe0Hjyd6L9I1bx2eyE2AaxT8IEX8wYONOGJ6l
         /ONCqhdRQa8nECbrxMCcsOZlQ0/qNfeBQBat0xo8jzkoL18xBR4WPFcxSu9Pw5zxTgYt
         nZLw==
X-Gm-Message-State: AOAM530fElrz3X3oh8ikJpR2esRbM5tHa7ir6TZWOELiCRFKJ6Nu89tg
	q6OUMZiWpjeZY4OC+IXGKLNDYQeVBS3Pig==
X-Google-Smtp-Source: ABdhPJyL7qoqfe5G5etphQW5gxx/QEvcahsIemSgpaqOzP1ZSJLkLymDP6z0OrjDS0AJivJ0JKHpIA==
X-Received: by 2002:a17:90b:300c:: with SMTP id hg12mr28399980pjb.46.1624742889516;
        Sat, 26 Jun 2021 14:28:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::5cd3])
        by smtp.gmail.com with ESMTPSA id d3sm5741111pjo.31.2021.06.26.14.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jun 2021 14:28:09 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Jon Mason <jon.mason@arm.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH] gator-daemon: Do not specify header files in GATORD_CXX_SRC_FILES
Date: Sat, 26 Jun 2021 14:28:06 -0700
Message-Id: <20210626212806.1956740-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jon Mason <jon.mason@arm.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 ...e-xml-PmuXMLParser.h-header-from-GAT.patch | 31 +++++++++++++++++++
 .../gator-daemon/gator-daemon_7.7.0.bb        |  4 ++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch

diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch b/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch
new file mode 100644
index 0000000..fc39f4e
--- /dev/null
+++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch
@@ -0,0 +1,31 @@
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

