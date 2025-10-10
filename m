Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC148CCA476
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 07:17:44 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.3638.1760080664077054704
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Oct 2025 00:17:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jv9tc/wc;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e2c3b6d4cso12035375e9.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 10 Oct 2025 00:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760080662; x=1760685462; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OEcE9EpEwlFGz/IjEgVn1x5M9+dlbh/6q1eQxvAfngU=;
        b=Jv9tc/wcGK0Iwu1IHi6rrW3Q2sovgMuTKVx4CIKZ5Z6XMifigjkrGotBi7hLP0KT1h
         wS08kZeAmfJKeywFoaUs+sM8O0UjSJi7og7fTnxBM873jPcW1cCnM906nlwdaONGpy4r
         /CS3afU+gjzrmqeYK1UfkbZVbOgbf81SwGKy3DWoIzQTodRSjzWWsO+i3Bb7VwDEExa6
         hTYUFVs6oQIhUnd+JTjnfB1y1oICsdgGF/tPZxY3HTUJmBfmAhQSCy1YZ9GG1aUlP8rs
         AEtM/viSQnXp2K69ZLgszBqKKvR5LYMHxJWg+639upcXIILS7TiPhDIUy0kt5qwbBWHQ
         sexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760080662; x=1760685462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OEcE9EpEwlFGz/IjEgVn1x5M9+dlbh/6q1eQxvAfngU=;
        b=wau8D1WKv5j84WQn67K413+INSz2bCByGjHarGdUmEXd9SMQkSkQOtAU3/KkB+yZSK
         0UT85hwwH/mDbJv27yd8o4uwdhiuv3jBElqOm48Ntlqcgf3nOm9xATRoYTEZ/OYmCO67
         h6XOUD2ORVtUZTgtuGvcSmeKLwWT9HluKxB1pgWmG596Zy3h+ftk3LWtDM0um8+SOvqz
         /GpgqE/dZ0VzX/CZSTdmzZhbEeDgY/ETWNvhlGmH3wF2vp5Cr2HBN0KUYe+5MgFb9mPc
         kMQ0a4gZtRYukHlpyAVkEsL9VcU5OT3hzHe3jIXuNuAbswARrC0T/u9H7hYTgitopRmR
         BrAg==
X-Gm-Message-State: AOJu0YyiapB3rhi5cTgNKrAAOIykeKFxIL4B6s0oYa7H/2ABrwQ5KcKV
	SXn9bGzlt3Ge6ApV8G7kkjChtAUMerhwpni2WzWYSpeFC8JFeX0V8WoL7TLaxZCE
X-Gm-Gg: ASbGncteFgYbE6twmSbV/3a02Nw2+b6pLXKNHzQxLoQVGYq6VFCG0x+k/PchB+OjS6n
	Qtyx1oDpaE5+QXpofkWfhliOPi4VE/Yh37vbGZJFX9aaEcQpjWVZ6pa89FuLiH3tBauGSsVNZd4
	14ShycG68X+udzOF9OAqQt4P00+iCP4ulPZs9UTxZgx9YvQlbYr4Jzqv3KFOluqkopUIYKEKTrQ
	rhZeUTxwUtIUDwiacmlkJYTZKcG3uYQx+FOuCte6m64Ot8L69qdYte3yLZXN7768b5l/8QmUX17
	odF9+Sx/k9yGr4tsMSceM1a4HRAND/GsriaO2PAYztuBPaL7zj0l4P1GAcvqdJ+9/qLs5MoW174
	LgVdHdWeMz0okg4vmOC1igZP2YGXWuv2m7GrCGFvvJVHBO/7EUkTvVA==
X-Google-Smtp-Source: AGHT+IFgT76OTX6oiCQrUIPQ+at1ci2dT96DnVHm4uke5kDdahLuOpSXg2DULOeOq0mjDAIfhfcArA==
X-Received: by 2002:a05:600c:3b1f:b0:46e:42cb:d93f with SMTP id 5b1f17b1804b1-46fa9a98ef7mr78121785e9.15.1760080661805;
        Fri, 10 Oct 2025 00:17:41 -0700 (PDT)
Received: from Ubuntu-2204-jammy-amd64-base.. ([2a01:4f8:272:3f67::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb4891958sm33719075e9.11.2025.10.10.00.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 00:17:40 -0700 (PDT)
From: uvv.mail@gmail.com
To: meta-arm@lists.yoctoproject.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH] arm/optee: Simplify examples recipe
Date: Fri, 10 Oct 2025 07:17:17 +0000
Message-ID: <20251010071717.1090445-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 10 Oct 2025 07:17:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6729

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 .../recipes-security/optee/optee-examples.inc |  6 ++--
 ...001-Makefile-Avoid-variable-override.patch | 32 +++++++++++++++++++
 2 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 meta-arm/recipes-security/optee/optee-examples/0001-Makefile-Avoid-variable-override.patch

diff --git a/meta-arm/recipes-security/optee/optee-examples.inc b/meta-arm/recipes-security/optee/optee-examples.inc
index 648e8c2e..f274f6fa 100644
--- a/meta-arm/recipes-security/optee/optee-examples.inc
+++ b/meta-arm/recipes-security/optee/optee-examples.inc
@@ -12,11 +12,11 @@ inherit python3native
 require optee.inc
 
 SRC_URI = "git://github.com/linaro-swg/optee_examples.git;branch=master;protocol=https \
+           file://0001-Makefile-Avoid-variable-override.patch \
            "
 
-EXTRA_OEMAKE += "TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
-                 HOST_CROSS_COMPILE=${HOST_PREFIX} \
-                 TA_CROSS_COMPILE=${HOST_PREFIX} \
+EXTRA_OEMAKE = "TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
+                 CROSS_COMPILE=${HOST_PREFIX} \
                  OUTPUT_DIR=${B} \
                "
 
diff --git a/meta-arm/recipes-security/optee/optee-examples/0001-Makefile-Avoid-variable-override.patch b/meta-arm/recipes-security/optee/optee-examples/0001-Makefile-Avoid-variable-override.patch
new file mode 100644
index 00000000..170fe461
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-examples/0001-Makefile-Avoid-variable-override.patch
@@ -0,0 +1,32 @@
+From ad981dad843712c21a01f61461fd5cd34f147b4a Mon Sep 17 00:00:00 2001
+From: Vyacheslav Yurkov <uvv.mail@gmail.com>
+Date: Thu, 9 Oct 2025 08:30:52 +0000
+Subject: [PATCH] Makefile: Avoid variable override
+
+When CROSS_COMPILE is set in the environment / command line, we should
+not directly pass it to the subshell, otherwise it's evaluated to an
+empty string.
+
+Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
+Acked-by: Jerome Forissier <jerome.forissier@linaro.org>
+Acked-by: Mikko Rapeli mikko.rapeli@linaro.org
+
+Upstream-Status: Backport
+[https://github.com/linaro-swg/optee_examples/commit/bbaca7ef34c82c052c6e1470cf379561952fc995]
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 9359d95..4256139 100644
+--- a/Makefile
++++ b/Makefile
+@@ -12,7 +12,7 @@ clean: examples-clean prepare-for-rootfs-clean
+ 
+ examples:
+ 	@for example in $(EXAMPLE_LIST); do \
+-		$(MAKE) -C $$example CROSS_COMPILE="$(HOST_CROSS_COMPILE)" || exit 1; \
++		$(MAKE) -C $$example || exit 1; \
+ 	done
+ 
+ examples-clean:

