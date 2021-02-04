Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.986.1612462453418246474
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Feb 2021 10:14:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6206143B
	for <meta-arm@lists.yoctoproject.org>; Thu,  4 Feb 2021 10:14:12 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 542D83F73B
	for <meta-arm@lists.yoctoproject.org>; Thu,  4 Feb 2021 10:14:12 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/6] gem5/gem5-aarch64-native: backport a patch to reduce warnings
Date: Thu,  4 Feb 2021 13:14:02 -0500
Message-Id: <20210204181405.20275-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204181405.20275-1-jon.mason@arm.com>
References: <20210204181405.20275-1-jon.mason@arm.com>

From: Ross Burton <ross.burton@arm.com>

With Python 3.9 the build produces a huge number of warnings, resulting in a
do_compile log that is 17M long.

Backport a patch from pybind11 upstream to silence this warning.

Change-Id: Ie4c71f8e5dd6c07c8be0a563778029a9859e1726
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../gem5/files/pyinit-threads.patch           | 32 +++++++++++++++++++
 .../recipes-devtools/gem5/gem5-source_20.inc  |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-gem5/recipes-devtools/gem5/files/pyinit-threads.patch

diff --git a/meta-gem5/recipes-devtools/gem5/files/pyinit-threads.patch b/meta-gem5/recipes-devtools/gem5/files/pyinit-threads.patch
new file mode 100644
index 0000000..ac0c841
--- /dev/null
+++ b/meta-gem5/recipes-devtools/gem5/files/pyinit-threads.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From ae2ee2a4a51914cf78deb5c253a3b03cbb53ce72 Mon Sep 17 00:00:00 2001
+From: Boris Staletic <boris.staletic@gmail.com>
+Date: Mon, 15 Jun 2020 19:36:43 +0200
+Subject: [PATCH] Avoid using deprecated API in python 3.9
+
+The PyEval_InitThreads() and PyEval_ThreadsInitialized() functions are
+now deprecated and will be removed in Python 3.11. Calling
+PyEval_InitThreads() now does nothing. The GIL is initialized by
+Py_Initialize() since Python 3.7.
+---
+ include/pybind11/detail/internals.h | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/include/pybind11/detail/internals.h b/include/pybind11/detail/internals.h
+index 6224dfb22..166a18a32 100644
+--- a/ext/pybind11/include/pybind11/detail/internals.h
++++ b/ext/pybind11/include/pybind11/detail/internals.h
+@@ -273,7 +273,10 @@ PYBIND11_NOINLINE inline internals &get_internals() {
+         auto *&internals_ptr = *internals_pp;
+         internals_ptr = new internals();
+ #if defined(WITH_THREAD)
+-        PyEval_InitThreads();
++
++        #if PY_VERSION_HEX < 0x03090000
++                PyEval_InitThreads();
++        #endif
+         PyThreadState *tstate = PyThreadState_Get();
+         #if PY_VERSION_HEX >= 0x03070000
+             internals_ptr->tstate = PyThread_tss_alloc();
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-source_20.inc b/meta-gem5/recipes-devtools/gem5/gem5-source_20.inc
index c441a1a..c586308 100644
--- a/meta-gem5/recipes-devtools/gem5/gem5-source_20.inc
+++ b/meta-gem5/recipes-devtools/gem5/gem5-source_20.inc
@@ -3,7 +3,8 @@
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d9514d69d8abf88b6e9125e759bf0ab \
                     file://LICENSE;md5=a585e2893cee63d16a1d8bc16c6297ec"
 
-SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https;nobranch=1"
+SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https;nobranch=1 \
+           file://pyinit-threads.patch"
 RELEASE_TAG = "v20.1.0.3"
 SRCREV = "cd21b5a5519940a0fa9b9a2dde68f30403d17f7e"
 
-- 
2.17.1

