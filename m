Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A87C19F2D
	for <webhook@archiver.kernel.org>; Sun, 14 Aug 2022 02:51:32 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.1490.1660445488804188908
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 13 Aug 2022 19:51:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KrX6HHdV;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id d71so3907084pgc.13
        for <meta-arm@lists.yoctoproject.org>;
 Sat, 13 Aug 2022 19:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=Y43J7BhH7B9FbKiRjJxcJIkRMgnhPDUYJP1JbgeMhy0=;
        b=KrX6HHdVvYoXmK/oK+An7Tmd2NjPP6fY8fpR/2gwayqFPEAt273R3EkO6NrvLLxOSi
         pcerVdwi/7Woh1+3oXpzjzklbtNpsZKulH7PIO4vTwiXEsdyDvxrRwCb/7s4oAQK49Ws
         0sBhZQwFmlmKACHaqUahwTLdTv+CzqJcqZ3mioq+efpsVW2BOL+vVHVghj+y7kjlLwAj
         OZhTgqgWqYCwLiVE92MZhDYZp/BnJ1vnrj1cqXPLJojyuElQA+urtx8Ys4a7WxBrotwY
         2BjvinP97NuIPN8vEe2OuqYDSzoTeDu6hIPBzlXcHyD3qBbk3w86UfUQcuVULrWFvCuS
         xxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=Y43J7BhH7B9FbKiRjJxcJIkRMgnhPDUYJP1JbgeMhy0=;
        b=oidnj2YQyTG1oMTkHXd2t7xVSdiiABirJAcRPYYcTgraQCq9JGeHt8sEJueJHXakP4
         Hm9orRSyiqcBmm7QbaP17KL9Dwgrb+0cwooaQlnENplJgguPS2QKeZcYhd+vmUXv+Kwo
         tLqmFZAXl536OygS1XRunvJjeCXOVrvZXiv0NjFTKqeKaDInhz9jU3Fsad6kZCfFnXkq
         P0HIVptVCgJOhl64n01tiGZhskk3UvRYgNRizw7cJXOs7/xyj7Lg7lv7UzLbCrjaw7ZQ
         nlIr4+XqQhUVCGL5tOfppgR6l1749z4VAnGVz1WUnzpQ9W+NbaXeA4xl1PHX4C9wKrzq
         L40w==
X-Gm-Message-State: ACgBeo2i5hkSXGxyFthE+DCOmr1LPrwubJTCIAYt14hUef0PCAEea1M+
	dNwql924jnycPg7w1SEUTzN6jdmdXKcgJg==
X-Google-Smtp-Source: 
 AA6agR6KCzG8D82zukR3kZupvlcl4x6zZHsH2C3jsw93cdq91jScikt1EcCJN+4TJgLDnT1OrBlyQg==
X-Received: by 2002:a63:d16:0:b0:41d:fe52:1d2f with SMTP id
 c22-20020a630d16000000b0041dfe521d2fmr8912925pgl.416.1660445487228;
        Sat, 13 Aug 2022 19:51:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 om3-20020a17090b3a8300b001f21646d1a4sm6670990pjb.1.2022.08.13.19.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Aug 2022 19:51:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] gator-daemon: Define _GNU_SOURCE feature test macro
Date: Sat, 13 Aug 2022 19:51:23 -0700
Message-Id: <20220814025124.229339-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 14 Aug 2022 02:51:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3678

Needed for getting vasprintf API from libc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-daemon-mxml-Define-_GNU_SOURCE.patch | 31 +++++++++++++++++++
 .../gator-daemon/gator-daemon_7.7.0.bb        |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-daemon-mxml-Define-_GNU_SOURCE.patch

diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-daemon-mxml-Define-_GNU_SOURCE.patch b/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-daemon-mxml-Define-_GNU_SOURCE.patch
new file mode 100644
index 0000000..d246043
--- /dev/null
+++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-daemon-mxml-Define-_GNU_SOURCE.patch
@@ -0,0 +1,31 @@
+From 04e2e924c3ab8da41343277746804dbcd7bf520d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 13 Aug 2022 16:49:52 -0700
+Subject: [PATCH] daemon/mxml: Define _GNU_SOURCE
+
+This file uses vasprintf() which is defined only with _GNU_SOURCE
+feature macro is on.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ daemon/mxml/mxml-string.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/daemon/mxml/mxml-string.c b/daemon/mxml/mxml-string.c
+index 678aeb9..c9cd153 100644
+--- a/daemon/mxml/mxml-string.c
++++ b/daemon/mxml/mxml-string.c
+@@ -13,6 +13,8 @@
+  * Include necessary headers...
+  */
+ 
++#define _GNU_SOURCE
++
+ #include "config.h"
+ 
+ 
+-- 
+2.37.2
+
diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
index 492d321..07b8abb 100644
--- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
+++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
@@ -18,6 +18,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRCREV = "9d8d75fa08352470c51abc23fe3b314879bd8b78"
 SRC_URI = "git://github.com/ARM-software/gator.git;protocol=http;branch=main;protocol=https \
            file://0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch;striplevel=2 \
+           file://0001-daemon-mxml-Define-_GNU_SOURCE.patch;striplevel=2 \
           "
 
 S = "${WORKDIR}/git/daemon"
-- 
2.37.2


