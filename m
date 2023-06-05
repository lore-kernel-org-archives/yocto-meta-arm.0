Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F2DC7EE23
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 13:02:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6907.1685970122603343162
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 05 Jun 2023 06:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CD6815A1
	for <meta-arm@lists.yoctoproject.org>; Mon,  5 Jun 2023 06:02:47 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DE3BC3F663
	for <meta-arm@lists.yoctoproject.org>; Mon,  5 Jun 2023 06:02:01 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] arm/linux-yocto: add gcc 13 gimple backport patch
Date: Mon,  5 Jun 2023 08:01:56 -0500
Message-Id: <20230605130156.3309199-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230605130156.3309199-1-jon.mason@arm.com>
References: <20230605130156.3309199-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 05 Jun 2023 13:02:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4724

Issue when building the kernel on FVP (and probably all aarch64
platforms) with GCC 13 on the 6.1 kernel (and possibly others).
Backport the upstream fix.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...eorganize-gimple-includes-for-GCC-13.patch | 47 +++++++++++++++++++
 .../linux/linux-yocto%.bbappend               |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-arm/recipes-kernel/linux/files/aarch64/0001-gcc-=
plugins-Reorganize-gimple-includes-for-GCC-13.patch

diff --git a/meta-arm/recipes-kernel/linux/files/aarch64/0001-gcc-plugins=
-Reorganize-gimple-includes-for-GCC-13.patch b/meta-arm/recipes-kernel/li=
nux/files/aarch64/0001-gcc-plugins-Reorganize-gimple-includes-for-GCC-13.=
patch
new file mode 100644
index 00000000..e4d8936f
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/files/aarch64/0001-gcc-plugins-Reorga=
nize-gimple-includes-for-GCC-13.patch
@@ -0,0 +1,47 @@
+From e6a71160cc145e18ab45195abf89884112e02dfb Mon Sep 17 00:00:00 2001
+From: Kees Cook <keescook@chromium.org>
+Date: Wed, 18 Jan 2023 12:21:35 -0800
+Subject: [PATCH] gcc-plugins: Reorganize gimple includes for GCC 13
+
+The gimple-iterator.h header must be included before gimple-fold.h
+starting with GCC 13. Reorganize gimple headers to work for all GCC
+versions.
+
+Reported-by: Palmer Dabbelt <palmer@rivosinc.com>
+Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
+Link: https://lore.kernel.org/all/20230113173033.4380-1-palmer@rivosinc.=
com/
+Cc: linux-hardening@vger.kernel.org
+Signed-off-by: Kees Cook <keescook@chromium.org>
+
+Upstream-Status: Backport
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+
+---
+ scripts/gcc-plugins/gcc-common.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/scripts/gcc-plugins/gcc-common.h b/scripts/gcc-plugins/gcc-=
common.h
+index 9a1895747b15..84c730da36dd 100644
+--- a/scripts/gcc-plugins/gcc-common.h
++++ b/scripts/gcc-plugins/gcc-common.h
+@@ -71,7 +71,9 @@
+ #include "varasm.h"
+ #include "stor-layout.h"
+ #include "internal-fn.h"
++#include "gimple.h"
+ #include "gimple-expr.h"
++#include "gimple-iterator.h"
+ #include "gimple-fold.h"
+ #include "context.h"
+ #include "tree-ssa-alias.h"
+@@ -85,10 +87,8 @@
+ #include "tree-eh.h"
+ #include "stmt.h"
+ #include "gimplify.h"
+-#include "gimple.h"
+ #include "tree-phinodes.h"
+ #include "tree-cfg.h"
+-#include "gimple-iterator.h"
+ #include "gimple-ssa.h"
+ #include "ssa-iterators.h"
+=20
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend b/meta-a=
rm/recipes-kernel/linux/linux-yocto%.bbappend
index 883ed2ca..3f2c83fd 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
@@ -4,6 +4,7 @@ FILESEXTRAPATHS:prepend:aarch64 =3D "${ARMFILESPATHS}"
 SRC_URI:append:aarch64 =3D " \
     file://0001-Revert-arm64-defconfig-Enable-Tegra-MGBE-driver.patch \
     file://0002-Revert-arm64-defconfig-Add-Nuvoton-NPCM-family-suppo.pat=
ch \
+    file://0001-gcc-plugins-Reorganize-gimple-includes-for-GCC-13.patch =
\
     "
=20
 COMPATIBLE_MACHINE:generic-arm64 =3D "generic-arm64"
--=20
2.30.2


