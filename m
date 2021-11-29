Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41850C433FE
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 12:49:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.60522.1638190173975488920
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Nov 2021 04:49:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9288D113E;
	Mon, 29 Nov 2021 04:49:33 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.2.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6001D3F766;
	Mon, 29 Nov 2021 04:49:32 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH][HONISTER 3/5] arm/optee-spdevkit: introducing the recipe
Date: Mon, 29 Nov 2021 12:49:13 +0000
Message-Id: <20211129124915.23058-4-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211129124915.23058-1-abdellatif.elkhlifi@arm.com>
References: <20211129124915.23058-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 12:49:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2468

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Adding optee-spdevkit recipe.

Change-Id: Ib31d7f0a9fa2f72b71c2057f2752b1c52be6f890
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../optee/optee-spdevkit_git.bb               | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee/optee-spdevkit_git.bb

diff --git a/meta-arm/recipes-security/optee/optee-spdevkit_git.bb b/meta-arm/recipes-security/optee/optee-spdevkit_git.bb
new file mode 100644
index 0000000..a9c696d
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-spdevkit_git.bb
@@ -0,0 +1,111 @@
+SUMMARY = "OP-TEE Secure Partion Development Kit"
+DESCRIPTION = "Open Portable Trusted Execution Environment - Development Kit to run secure partitions"
+HOMEPAGE = "https://www.op-tee.org/"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
+
+inherit deploy python3native
+require optee.inc
+
+CVE_PRODUCT = "linaro:op-tee op-tee:op-tee_os"
+
+DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native python3-pyelftools-native"
+
+DEPENDS:append:toolchain-clang = " compiler-rt"
+
+SRC_URI = "git://github.com/OP-TEE/optee_os.git;branch=master;protocol=https"
+
+S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
+
+EXTRA_OEMAKE += " \
+    PLATFORM=${OPTEEMACHINE} \
+    CFG_${OPTEE_CORE}_core=y \
+    CROSS_COMPILE_core=${HOST_PREFIX} \
+    CROSS_COMPILE_sp_${OPTEE_ARCH}=${HOST_PREFIX} \
+    CFG_CORE_FFA=y \
+    CFG_WITH_SP=y \
+    O=${B} \
+"
+
+CFLAGS[unexport] = "1"
+LDFLAGS[unexport] = "1"
+CPPFLAGS[unexport] = "1"
+AS[unexport] = "1"
+LD[unexport] = "1"
+
+do_configure[noexec] = "1"
+
+do_compile() {
+    oe_runmake -C ${S} sp_dev_kit
+}
+do_compile[cleandirs] = "${B}"
+
+do_install() {
+    #install SP devkit
+    install -d ${D}${includedir}/optee/export-user_sp/
+    for f in ${B}/export-sp_${OPTEE_ARCH}/* ; do
+        cp -aR $f ${D}${includedir}/optee/export-user_sp/
+    done
+    cat > ${D}${includedir}/optee/export-user_sp/include/stddef.h <<'EOF'
+#ifndef STDDEF_H
+#define STDDEF_H
+
+#include <stddef_.h>
+
+#ifndef _PTRDIFF_T
+typedef long ptrdiff_t;
+#define _PTRDIFF_T
+#endif
+
+#ifndef NULL
+#define NULL ((void *) 0)
+#endif
+
+#define offsetof(st, m) __builtin_offsetof(st, m)
+
+#endif /* STDDEF_H */
+EOF
+    cat > ${D}${includedir}/optee/export-user_sp/include/stddef_.h <<'EOF'
+#ifndef STDDEF__H
+#define STDDEF__H
+
+#ifndef SIZET_
+typedef unsigned long size_t;
+#define SIZET_
+#endif
+
+#endif /* STDDEF__H */
+EOF
+    cat > ${D}${includedir}/optee/export-user_sp/include/stdarg.h <<'EOF'
+#ifndef STDARG_H
+#define STDARG_H
+
+#define va_list __builtin_va_list
+#define va_start(ap, last) __builtin_va_start(ap, last)
+#define va_end(ap) __builtin_va_end(ap)
+#define va_copy(to, from) __builtin_va_copy(to, from)
+#define va_arg(to, type) __builtin_va_arg(to, type)
+
+#endif /* STDARG_H */
+EOF
+    cat > ${D}${includedir}/optee/export-user_sp/include/stdbool.h <<'EOF'
+#ifndef STDBOOL_H
+#define STDBOOL_H
+
+#define bool	_Bool
+
+#define true	1
+#define false	0
+
+#define __bool_true_false_are_defined	1
+
+#endif /* STDBOOL_H */
+EOF
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+# optee-spdevkit static library is part of optee-os image. No need to package this library in a staticdev package
+INSANE_SKIP:${PN}-dev = "staticdev"
-- 
2.17.1


