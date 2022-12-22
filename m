Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02172C4332F
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 08:49:00 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.41700.1671698934488362967
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Dec 2022 00:48:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ic5k7ztO;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d7so1381217pll.9
        for <meta-arm@lists.yoctoproject.org>; Thu, 22 Dec 2022 00:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ijSQ+ZKGP/eVtdUd4j0j13Y+8i2qSK9lgphMAOtBbhw=;
        b=ic5k7ztOCrL7YsdWsz3VXk0pUdisqaUkPHet/2VKvcO62oECm6CXqk9eoOEFdRSvIN
         avgde46KBTMpq0O+aegzJ0n81ZgqvuaXB9L7P/DGOdEMz1YvKqO+XEYOZPuhpHPiDOUk
         8QMEuxKFhcB9IvF+zoPa2iyby6cmZZpfVRqQCTNbhfu4WO+UgR8nn2C/4lZcvo6dG3cz
         E/mio1k03jDG7MTBz8HJqqQ8pYb6BvY81pIYO9blEGM1Q4hhql8+64/xmqRp6QHyg4MI
         +VsE/T571UgfXM55ZsdArEH2mtC4g61x+FUQTd4TiIP3dWngTfFxJTbo4kt692e9s1oW
         rdnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ijSQ+ZKGP/eVtdUd4j0j13Y+8i2qSK9lgphMAOtBbhw=;
        b=s3oIBHWw38ZxaAuF6xdETVw1wVxT0Py9F/nzqX0DrINjxqqr/JZz4RvjchKLkEpkPJ
         Yw2dCacf01QC82OQyhaYt02MCBnebo/g1w+z1HWPpFKcXYQHqwSVPHrFkH3uxC+fYS/y
         nbYcOiIxbN7THP2JEijBmkY39ysIW34RZYIhT3vKpSYpR9A+xAXIJt6kOInbElkxx8OC
         u0+mc5naws5xP/z2dl2FEIuFcYeYTJMS8IV6Su1SKwOa1XvhnQrXkwaCYEdBr7bLwqBm
         GVgjc7K6cDMwqSA3pNkCmeONO9Xg5DmPc8NjAx8xf3bW87SwwFejuMDqruEldm73oP19
         YbOQ==
X-Gm-Message-State: AFqh2kqPP3DRvWeF1iPYas3G4GACdEuI4XccBoHMQpdEfYrk/3hUH7m2
	D8aaJYbLqjej+zI0DmoBkjcz/xs6MLU=
X-Google-Smtp-Source: AMrXdXvv2T23Gx4+HiRNfDCrjh5BbpR329/gXEZGfZHzpAsqBuAPpZWCM9ajU/kUhWru4/ZNPav3+g==
X-Received: by 2002:a05:6a21:394b:b0:9d:efbf:48e3 with SMTP id ac11-20020a056a21394b00b0009defbf48e3mr6223480pzc.39.1671698933576;
        Thu, 22 Dec 2022 00:48:53 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::41f2])
        by smtp.gmail.com with ESMTPSA id b67-20020a621b46000000b0053e38ac0ff4sm134056pfb.115.2022.12.22.00.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 00:48:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gn: Replace lfs64 functions with original counterparts
Date: Thu, 22 Dec 2022 00:48:50 -0800
Message-Id: <20221222084850.158641-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Dec 2022 08:48:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4225

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ce-lstat64-stat64-functions-on-linux.patch | 60 +++++++++++++++++++
 meta-arm/recipes-devtools/gn/gn_git.bb        |  3 +-
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-devtools/gn/gn/0001-Replace-lstat64-stat64-functions-on-linux.patch

diff --git a/meta-arm/recipes-devtools/gn/gn/0001-Replace-lstat64-stat64-functions-on-linux.patch b/meta-arm/recipes-devtools/gn/gn/0001-Replace-lstat64-stat64-functions-on-linux.patch
new file mode 100644
index 0000000..159fbaa
--- /dev/null
+++ b/meta-arm/recipes-devtools/gn/gn/0001-Replace-lstat64-stat64-functions-on-linux.patch
@@ -0,0 +1,60 @@
+From 25786d356ac391124489f2e55690281c03fa83db Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 22 Dec 2022 00:30:55 -0800
+Subject: [PATCH] Replace lstat64/stat64 functions on linux
+
+we define -D_FILE_OFFSET_BITS=64 which means lstat is operating on 64bit
+off_t and is same as lstat64, same for stat and stat64 case.
+
+This fixes build with musl where off_t has always been 64bit
+
+Upstream-Status: Submitted [https://gn-review.googlesource.com/c/gn/+/14960]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/base/files/file.h             | 2 +-
+ src/base/files/file_posix.cc      | 2 +-
+ src/base/files/file_util_posix.cc | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/base/files/file.h b/src/base/files/file.h
+index 2c94eb4e..99e87ed9 100644
+--- a/src/base/files/file.h
++++ b/src/base/files/file.h
+@@ -23,7 +23,7 @@ namespace base {
+ 
+ #if defined(OS_BSD) || defined(OS_MACOSX) || defined(OS_NACL) || \
+     defined(OS_HAIKU) || defined(OS_MSYS) || defined(OS_ZOS) ||  \
+-    defined(OS_ANDROID) && __ANDROID_API__ < 21
++    defined(OS_LINUX) || defined(OS_ANDROID) && __ANDROID_API__ < 21
+ typedef struct stat stat_wrapper_t;
+ #elif defined(OS_POSIX) || defined(OS_FUCHSIA)
+ typedef struct stat64 stat_wrapper_t;
+diff --git a/src/base/files/file_posix.cc b/src/base/files/file_posix.cc
+index b1f9f5e8..049568f0 100644
+--- a/src/base/files/file_posix.cc
++++ b/src/base/files/file_posix.cc
+@@ -26,7 +26,7 @@ namespace {
+ 
+ #if defined(OS_BSD) || defined(OS_MACOSX) || defined(OS_NACL) || \
+     defined(OS_HAIKU) || defined(OS_MSYS) || defined(OS_ZOS) || \
+-    defined(OS_ANDROID) && __ANDROID_API__ < 21
++    defined(OS_LINUX) || defined(OS_ANDROID) && __ANDROID_API__ < 21
+ int CallFstat(int fd, stat_wrapper_t* sb) {
+   return fstat(fd, sb);
+ }
+diff --git a/src/base/files/file_util_posix.cc b/src/base/files/file_util_posix.cc
+index aa54731d..53be3d3b 100644
+--- a/src/base/files/file_util_posix.cc
++++ b/src/base/files/file_util_posix.cc
+@@ -61,7 +61,7 @@ namespace {
+ 
+ #if defined(OS_BSD) || defined(OS_MACOSX) || defined(OS_NACL) || \
+     defined(OS_HAIKU) || defined(OS_MSYS) || defined(OS_ZOS) ||  \
+-    defined(OS_ANDROID) && __ANDROID_API__ < 21
++    defined(OS_LINUX) || defined(OS_ANDROID) && __ANDROID_API__ < 21
+ int CallStat(const char* path, stat_wrapper_t* sb) {
+   return stat(path, sb);
+ }
+-- 
+2.39.0
+
diff --git a/meta-arm/recipes-devtools/gn/gn_git.bb b/meta-arm/recipes-devtools/gn/gn_git.bb
index 8d1efb6..521e33e 100644
--- a/meta-arm/recipes-devtools/gn/gn_git.bb
+++ b/meta-arm/recipes-devtools/gn/gn_git.bb
@@ -4,7 +4,8 @@ DEPENDS += "ninja-native"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
 
-SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main"
+SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main \
+           file://0001-Replace-lstat64-stat64-functions-on-linux.patch"
 SRCREV = "bf4e17dc67b2a2007475415e3f9e1d1cf32f6e35"
 PV = "0+git${SRCPV}"
 
-- 
2.39.0


