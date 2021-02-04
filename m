Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.994.1612462459197890286
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Feb 2021 10:14:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAC26D6E
	for <meta-arm@lists.yoctoproject.org>; Thu,  4 Feb 2021 10:14:13 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5D7B83F73B
	for <meta-arm@lists.yoctoproject.org>; Thu,  4 Feb 2021 10:14:13 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/6] gem5/gem5-m5ops: initial recipe
Date: Thu,  4 Feb 2021 13:14:04 -0500
Message-Id: <20210204181405.20275-5-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204181405.20275-1-jon.mason@arm.com>
References: <20210204181405.20275-1-jon.mason@arm.com>

From: Adrian Herrera <adrian.herrera@arm.com>

m5ops provide pseudo-instructions to trigger gem5 functionality.
m5 utility provides a CLI for m5ops.
libm5.a provides a C library for m5ops.

Change-Id: Ib06dcb539648407522e31aeb1ed392fb5232675e
Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...til-m5ops-optional-extra-build-flags.patch | 59 +++++++++++++++++++
 .../recipes-devtools/gem5/gem5-m5ops_20.bb    | 26 ++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 meta-gem5/recipes-devtools/gem5/gem5-m5ops/0001-util-m5ops-optional-extra-build-flags.patch
 create mode 100644 meta-gem5/recipes-devtools/gem5/gem5-m5ops_20.bb

diff --git a/meta-gem5/recipes-devtools/gem5/gem5-m5ops/0001-util-m5ops-optional-extra-build-flags.patch b/meta-gem5/recipes-devtools/gem5/gem5-m5ops/0001-util-m5ops-optional-extra-build-flags.patch
new file mode 100644
index 0000000..b446a2f
--- /dev/null
+++ b/meta-gem5/recipes-devtools/gem5/gem5-m5ops/0001-util-m5ops-optional-extra-build-flags.patch
@@ -0,0 +1,59 @@
+From 32e35a2f179d1b036d2eb699d77f869f7787f36b Mon Sep 17 00:00:00 2001
+From: Adrian Herrera <adrian.herrera@arm.com>
+Date: Tue, 8 Dec 2020 20:12:55 +0000
+Subject: [PATCH] util: m5ops, optional extra build flags
+
+This increases compilation control for users. Main use case is building
+m5ops as part of an image distribution. Specifying a different sysroot
+or dynamic linker may be required when the cross toolchain is built as
+part of the process.
+
+Change-Id: Icbd3faa92ea6e084fc4a9b2db83129bce73faf21
+Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
+Reviewed-on: https://gem5-review.googlesource.com/c/public/gem5/+/38416
+Reviewed-by: Jason Lowe-Power <power.jg@gmail.com>
+Reviewed-by: Gabe Black <gabe.black@gmail.com>
+Maintainer: Jason Lowe-Power <power.jg@gmail.com>
+Tested-by: kokoro <noreply+kokoro@google.com>
+
+Upstream-Status: Accepted [https://gem5-review.googlesource.com/c/public/gem5/+/38416]
+Expected version: v20.2
+---
+ util/m5/SConstruct | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/util/m5/SConstruct b/util/m5/SConstruct
+index bbae8d9bbf..a37573d763 100644
+--- a/util/m5/SConstruct
++++ b/util/m5/SConstruct
+@@ -136,16 +136,24 @@ for root, dirs, files in os.walk(abspath(src_dir)):
+         #
+         # This also considers scons command line settings which may look like
+         # environment variables, but are set after "scons" on the command line.
+-        def get_abi_opt(name, default):
++        def _extract_abi_opt_val(name, default):
+             var_name = env.subst('${ABI}.%s' % name)
+-            env[name] = os.environ.get(
+-                    var_name, ARGUMENTS.get(var_name, default))
++            return os.environ.get(var_name, ARGUMENTS.get(var_name, default))
++        def get_abi_opt(name, default):
++            env[name] = _extract_abi_opt_val(name, default)
++        def append_abi_opt(name):
++            env.Append(**{ name: _extract_abi_opt_val(name, '') })
+ 
+         # Process the ABI's settings in the SConsopts file, storing them
+         # in a copy of the primary environment.
+         env.SConscript(Dir(root).File('SConsopts'),
+                        exports=[ 'env', 'get_abi_opt' ])
+ 
++        # The user can pass extra build flags for each ABI
++        append_abi_opt('CCFLAGS')
++        append_abi_opt('CXXFLAGS')
++        append_abi_opt('LINKFLAGS')
++
+         # Once all the options have been configured, set up build targets for
+         # this abi.
+         abi_dir = build_dir.Dir(env.subst('${ABI}'))
+-- 
+2.17.1
+
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-m5ops_20.bb b/meta-gem5/recipes-devtools/gem5/gem5-m5ops_20.bb
new file mode 100644
index 0000000..7b48344
--- /dev/null
+++ b/meta-gem5/recipes-devtools/gem5/gem5-m5ops_20.bb
@@ -0,0 +1,26 @@
+require gem5-source_20.inc
+inherit scons package
+
+HOMEPAGE = "https://www.gem5.org/documentation/general_docs/m5ops"
+SUMMARY = "m5ops provide pseudo-instructions to trigger gem5 functionality"
+LICENSE = "BSD"
+
+M5OPS_DIR = "util/m5"
+
+SRC_URI += "file://0001-util-m5ops-optional-extra-build-flags.patch"
+
+OUT_DIR = "build/${TARGET_ARCH}/out"
+
+EXTRA_OESCONS += "${TARGET_ARCH}.CROSS_COMPILE=${TARGET_PREFIX} \
+                  ${TARGET_ARCH}.CCFLAGS=--sysroot=${STAGING_DIR_TARGET} \
+                  ${TARGET_ARCH}.LINKFLAGS=--sysroot=${STAGING_DIR_TARGET} \
+                  -C ${S}/${M5OPS_DIR} ${OUT_DIR}/m5"
+
+# The SConstruct file for m5ops does not provide a "install" target
+# We do the install process within the recipe
+do_install() {
+    install -d ${D}${bindir} ${D}${libdir} ${D}${includedir}
+    install -m 755 ${B}/${M5OPS_DIR}/${OUT_DIR}/m5 ${D}${bindir}
+    install -m 644 ${B}/${M5OPS_DIR}/${OUT_DIR}/libm5.a ${D}${libdir}
+    install -m 644 ${B}/include/gem5/m5ops.h ${D}${includedir}
+}
-- 
2.17.1

