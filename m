Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E62C38A06
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.4513.1650433359690585160
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 22:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZynfiW1Q;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 n11-20020a17090a73cb00b001d1d3a7116bso3105230pjk.0
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 22:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TtPW9Snw+WPND2NhCGy9R6aBRy/q5Axzxzd1FFdv9iE=;
        b=ZynfiW1Q24Fa6XnlJWjrYX4NHimDHyTd0mny376XowxHDW+8HysbH1FnA3TG4pe/i4
         b2nb2RyjJnwe/lcNutcDI8WBc5EWL2qxpsEW1xM+8+XGyluZAA+cxxoiC13/MTHOfLi0
         nZwDNq2qE2PmPFBvpbsSfkeQ9s9tTke4MRwLEc167eABFCdmujv324NXrFm8YGaldq0e
         ShtvIMzlgV2bXVpLA3boV8s075XEsW+1jjqIoCUNm2Noa+gwt50cLkDHyxdkVBh9OhcK
         /wV43Inyvlq2vPKgUWR8Zwpv+972cyN0t5Xi3EUOnStp3wGzBQyUcDqrQGGB4tfMVWmt
         F8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TtPW9Snw+WPND2NhCGy9R6aBRy/q5Axzxzd1FFdv9iE=;
        b=5+Zr+6in/7RIjlhpjBDPW7bWmR0vHepu3JKVd5Og4YgkqJHa9QHHZx7ER5zR3JW125
         v0KpJZ7CBKnOZxYcb2m5N8mhPI36VQxIjmUaTPJE7i1PAXBNMvy+ohYoxDjGMSMp2sUy
         rMOD5ZvQ0YM/0M66uF5JoVnTCo1OdJGQQXUl6SYL09Gb1m/p3jO9GIesW5bN5nBcztYB
         +J4Oucj+88L5vm6LlQm/2NeHdO0c4mRhGPvgSqatyV7DXcWnsJswOOl52ImMXyp8FqjU
         lb1V5H5gke0RHonVDAxgcqsIxIKLRepPFHXzKWoOWU+RDMCaUUFMAyyTPX2GLbKV0U6k
         wqKQ==
X-Gm-Message-State: AOAM533UewrOe5etGyF0jilYNx8FxCAbLe1IWWLTYtX0pqJrXXrttHbF
	h7pIca3NZJVmpL7jEdhubkVqcfIMcMsOSg==
X-Google-Smtp-Source: 
 ABdhPJxziAF042Yzq3VpnwPSvm+sZ1MFlVS01t5RAMrJAtPevRTiJYbYOqyGnQhbFUy0hi3fQPih6w==
X-Received: by 2002:a17:90b:4a05:b0:1d2:bdc9:df39 with SMTP id
 kk5-20020a17090b4a0500b001d2bdc9df39mr2478630pjb.51.1650433358977;
        Tue, 19 Apr 2022 22:42:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3ee6])
        by smtp.gmail.com with ESMTPSA id
 h18-20020a056a001a5200b0050a43bb7ae6sm17470549pfv.161.2022.04.19.22.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 22:42:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Jon Mason <jon.mason@arm.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH] hafnium: Fix build when _Noreturn is not available
Date: Tue, 19 Apr 2022 22:42:35 -0700
Message-Id: <20220420054235.3727707-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3278

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jon Mason <jon.mason@arm.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 .../0001-define-_Noreturn-if-needed.patch     | 33 +++++++++++++++++++
 meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb   |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/hafnium/hafnium/0001-define-_Noreturn-if-needed.patch

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/0001-define-_Noreturn-if-needed.patch b/meta-arm/recipes-bsp/hafnium/hafnium/0001-define-_Noreturn-if-needed.patch
new file mode 100644
index 0000000..b73c533
--- /dev/null
+++ b/meta-arm/recipes-bsp/hafnium/hafnium/0001-define-_Noreturn-if-needed.patch
@@ -0,0 +1,33 @@
+From 0d941ba32a082023575fd0d14d52a12b7547b367 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 19 Apr 2022 22:32:56 -0700
+Subject: [PATCH] define _Noreturn if needed
+
+The new _Noreturn function specifier is not recognized by the parser and shows as a syntax error:
+
+Fixes
+../git/inc/hf/panic.h:13:1: error: '_Noreturn' is a C11 extension [-Werror,-Wc11-extensions]
+noreturn void panic(const char *fmt, ...);
+^
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ inc/hf/panic.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/inc/hf/panic.h b/inc/hf/panic.h
+index ec864e4f..588f1193 100644
+--- a/inc/hf/panic.h
++++ b/inc/hf/panic.h
+@@ -10,4 +10,8 @@
+ 
+ #include <stdnoreturn.h>
+ 
++#ifndef _Noreturn
++#define _Noreturn __attribute__ ((noreturn))
++#endif
++
+ noreturn void panic(const char *fmt, ...);
+-- 
+2.36.0
+
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb b/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb
index 96e455f..a9f41b9 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb
@@ -10,6 +10,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit deploy python3native pkgconfig
 
 SRC_URI = "gitsm://git.trustedfirmware.org/hafnium/hafnium.git;protocol=https;branch=master \
+           file://0001-define-_Noreturn-if-needed.patch \
            file://host-ld.patch \
            file://pkg-config-native.patch \
            file://native-dtc.patch"
-- 
2.36.0


