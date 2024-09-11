Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB061EE49A5
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 13:14:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.21400.1726060450007358920
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Sep 2024 06:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F9071063
	for <meta-arm@lists.yoctoproject.org>; Wed, 11 Sep 2024 06:14:38 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D36CF3F66E
	for <meta-arm@lists.yoctoproject.org>; Wed, 11 Sep 2024 06:14:08 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/musl: work around trusted services error
Date: Wed, 11 Sep 2024 09:14:07 -0400
Message-Id: <20240911131407.48515-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 11 Sep 2024 13:14:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6071

CI test for Trusted Services is failing with the recent musl update.
The issue was bisected to an update in musl modifying the behavior of
PAGE_SIZE.  Revert this change in musl while using trusted-services
until a proper solution can be found.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...non-functional-fix-to-early-dynamic-.patch | 42 +++++++++++++++++++
 meta-arm/recipes-core/musl/musl_%.bbappend    |  2 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-arm/recipes-core/musl/files/0001-Revert-ldso-fix=
-non-functional-fix-to-early-dynamic-.patch
 create mode 100644 meta-arm/recipes-core/musl/musl_%.bbappend

diff --git a/meta-arm/recipes-core/musl/files/0001-Revert-ldso-fix-non-fu=
nctional-fix-to-early-dynamic-.patch b/meta-arm/recipes-core/musl/files/0=
001-Revert-ldso-fix-non-functional-fix-to-early-dynamic-.patch
new file mode 100644
index 000000000000..65d19da58989
--- /dev/null
+++ b/meta-arm/recipes-core/musl/files/0001-Revert-ldso-fix-non-functiona=
l-fix-to-early-dynamic-.patch
@@ -0,0 +1,42 @@
+From b91e2227575744a70f05b8b12d2c78b0c651fb86 Mon Sep 17 00:00:00 2001
+From: Jon Mason <jdmason@kudzu.us>
+Date: Wed, 4 Sep 2024 16:20:45 -0400
+Subject: [PATCH] Revert "ldso: fix non-functional fix to early dynamic
+ PAGE_SIZE access"
+
+This reverts commit 6f666231bf51703fadbef10460d462fb573548a1.
+
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+Upstream-Status: Inappropriate
+---
+ ldso/dynlink.c | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/ldso/dynlink.c b/ldso/dynlink.c
+index 3b57c07fabcb..cc90efbd30bf 100644
+--- a/ldso/dynlink.c
++++ b/ldso/dynlink.c
+@@ -21,17 +21,15 @@
+ #include <sys/membarrier.h>
+ #include "pthread_impl.h"
+ #include "fork_impl.h"
+-#include "libc.h"
+ #include "dynlink.h"
+=20
+ static size_t ldso_page_size;
+-/* libc.h may have defined a macro for dynamic PAGE_SIZE already, but
+- * PAGESIZE is only defined if it's constant for the arch. */
+-#ifndef PAGESIZE
+-#undef PAGE_SIZE
++#ifndef PAGE_SIZE
+ #define PAGE_SIZE ldso_page_size
+ #endif
+=20
++#include "libc.h"
++
+ #define malloc __libc_malloc
+ #define calloc __libc_calloc
+ #define realloc __libc_realloc
+--=20
+2.39.2
+
diff --git a/meta-arm/recipes-core/musl/musl_%.bbappend b/meta-arm/recipe=
s-core/musl/musl_%.bbappend
new file mode 100644
index 000000000000..3d1cc88b0bc2
--- /dev/null
+++ b/meta-arm/recipes-core/musl/musl_%.bbappend
@@ -0,0 +1,2 @@
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
+SRC_URI +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-crypto', 'fil=
e://0001-Revert-ldso-fix-non-functional-fix-to-early-dynamic-.patch', '',=
 d)}"
--=20
2.39.3 (Apple Git-146)


