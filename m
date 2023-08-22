Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C9EBEE49AB
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 20:17:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6554.1692735456618265183
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 22 Aug 2023 13:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EE8711FB
	for <meta-arm@lists.yoctoproject.org>; Tue, 22 Aug 2023 13:18:16 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8F03B3F740
	for <meta-arm@lists.yoctoproject.org>; Tue, 22 Aug 2023 13:17:35 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/aarch64: update kernel patches
Date: Tue, 22 Aug 2023 15:17:28 -0500
Message-Id: <20230822201728.3648424-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 22 Aug 2023 20:17:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4988

With 6.1.46, the gimple patch has been backported as part of the
release, and is no longer needed as a patch applied here.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...eorganize-gimple-includes-for-GCC-13.patch | 47 -------------------
 .../linux/linux-yocto-rt_6.1%.bbappend        |  1 -
 .../linux/linux-yocto_6.1%.bbappend           |  2 -
 3 files changed, 50 deletions(-)
 delete mode 100644 meta-arm/recipes-kernel/linux/files/aarch64/0001-gcc-=
plugins-Reorganize-gimple-includes-for-GCC-13.patch

diff --git a/meta-arm/recipes-kernel/linux/files/aarch64/0001-gcc-plugins=
-Reorganize-gimple-includes-for-GCC-13.patch b/meta-arm/recipes-kernel/li=
nux/files/aarch64/0001-gcc-plugins-Reorganize-gimple-includes-for-GCC-13.=
patch
deleted file mode 100644
index e4d8936f..00000000
--- a/meta-arm/recipes-kernel/linux/files/aarch64/0001-gcc-plugins-Reorga=
nize-gimple-includes-for-GCC-13.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From e6a71160cc145e18ab45195abf89884112e02dfb Mon Sep 17 00:00:00 2001
-From: Kees Cook <keescook@chromium.org>
-Date: Wed, 18 Jan 2023 12:21:35 -0800
-Subject: [PATCH] gcc-plugins: Reorganize gimple includes for GCC 13
-
-The gimple-iterator.h header must be included before gimple-fold.h
-starting with GCC 13. Reorganize gimple headers to work for all GCC
-versions.
-
-Reported-by: Palmer Dabbelt <palmer@rivosinc.com>
-Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
-Link: https://lore.kernel.org/all/20230113173033.4380-1-palmer@rivosinc.=
com/
-Cc: linux-hardening@vger.kernel.org
-Signed-off-by: Kees Cook <keescook@chromium.org>
-
-Upstream-Status: Backport
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-
----
- scripts/gcc-plugins/gcc-common.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/scripts/gcc-plugins/gcc-common.h b/scripts/gcc-plugins/gcc-=
common.h
-index 9a1895747b15..84c730da36dd 100644
---- a/scripts/gcc-plugins/gcc-common.h
-+++ b/scripts/gcc-plugins/gcc-common.h
-@@ -71,7 +71,9 @@
- #include "varasm.h"
- #include "stor-layout.h"
- #include "internal-fn.h"
-+#include "gimple.h"
- #include "gimple-expr.h"
-+#include "gimple-iterator.h"
- #include "gimple-fold.h"
- #include "context.h"
- #include "tree-ssa-alias.h"
-@@ -85,10 +87,8 @@
- #include "tree-eh.h"
- #include "stmt.h"
- #include "gimplify.h"
--#include "gimple.h"
- #include "tree-phinodes.h"
- #include "tree-cfg.h"
--#include "gimple-iterator.h"
- #include "gimple-ssa.h"
- #include "ssa-iterators.h"
-=20
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto-rt_6.1%.bbappend b=
/meta-arm/recipes-kernel/linux/linux-yocto-rt_6.1%.bbappend
index 4d3beb1d..94d3398c 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto-rt_6.1%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto-rt_6.1%.bbappend
@@ -2,5 +2,4 @@
 FILESEXTRAPATHS:prepend:aarch64 =3D "${ARMFILESPATHS}"
 SRC_URI:append:aarch64 =3D " \
     file://0001-Revert-arm64-defconfig-Enable-Tegra-MGBE-driver.patch \
-    file://0001-gcc-plugins-Reorganize-gimple-includes-for-GCC-13.patch =
\
     "
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappend b/me=
ta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappend
index 4d3beb1d..bb958171 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappend
@@ -1,6 +1,4 @@
-
 FILESEXTRAPATHS:prepend:aarch64 =3D "${ARMFILESPATHS}"
 SRC_URI:append:aarch64 =3D " \
     file://0001-Revert-arm64-defconfig-Enable-Tegra-MGBE-driver.patch \
-    file://0001-gcc-plugins-Reorganize-gimple-includes-for-GCC-13.patch =
\
     "
--=20
2.30.2


