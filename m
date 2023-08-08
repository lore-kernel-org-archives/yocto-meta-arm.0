Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 846C6C04A6A
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 17:35:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.68292.1691516138062013893
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Aug 2023 10:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FD0314BF
	for <meta-arm@lists.yoctoproject.org>; Tue,  8 Aug 2023 10:36:20 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7FBB73F59C
	for <meta-arm@lists.yoctoproject.org>; Tue,  8 Aug 2023 10:35:37 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2 4/6] arm/optee-test: update musl workaround patch
Date: Tue,  8 Aug 2023 12:35:26 -0500
Message-Id: <20230808173528.3606903-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230808173528.3606903-1-jon.mason@arm.com>
References: <20230808173528.3606903-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Aug 2023 17:35:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4944

Patch was accepted upstream (see
https://github.com/OP-TEE/optee_test/pull/688).  Use the commit that was
backported and specify it as so.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...on_1000-remove-unneeded-stat.h-include.patch} | 16 +++++++++++++---
 .../recipes-security/optee/optee-test_3.22.0.bb  |  2 +-
 2 files changed, 14 insertions(+), 4 deletions(-)
 rename meta-arm/recipes-security/optee/optee-test/{musl-workaround.patch=
 =3D> 0001-xtest-regression_1000-remove-unneeded-stat.h-include.patch} (6=
0%)

diff --git a/meta-arm/recipes-security/optee/optee-test/musl-workaround.p=
atch b/meta-arm/recipes-security/optee/optee-test/0001-xtest-regression_1=
000-remove-unneeded-stat.h-include.patch
similarity index 60%
rename from meta-arm/recipes-security/optee/optee-test/musl-workaround.pa=
tch
rename to meta-arm/recipes-security/optee/optee-test/0001-xtest-regressio=
n_1000-remove-unneeded-stat.h-include.patch
index eed1bd4b..5e075d6f 100644
--- a/meta-arm/recipes-security/optee/optee-test/musl-workaround.patch
+++ b/meta-arm/recipes-security/optee/optee-test/0001-xtest-regression_10=
00-remove-unneeded-stat.h-include.patch
@@ -1,3 +1,8 @@
+From ddd5ad19732c9a2a9fe236662a8d264c6b2b1a0a Mon Sep 17 00:00:00 2001
+From: Jon Mason <jon.mason@arm.com>
+Date: Sat, 15 Jul 2023 15:08:43 -0400
+Subject: [PATCH] xtest: regression_1000: remove unneeded stat.h include
+
 Hack to work around musl compile error:
  In file included from optee-test/3.17.0-r0/recipe-sysroot/usr/include/s=
ys/stat.h:23,
                   from optee-test/3.17.0-r0/git/host/xtest/regression_10=
00.c:25:
@@ -7,14 +12,19 @@ Hack to work around musl compile error:
=20
 stat.h is not needed, since it is not being used in this file.  So remov=
ing it.
=20
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Backport [https://github.com/OP-TEE/optee_test/pull/688=
]
 Signed-off-by: Jon Mason <jon.mason@arm.com>
+Reviewed-by: Jerome Forissier <jerome.forissier@linaro.org>
+Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
+---
+ host/xtest/regression_1000.c | 1 -
+ 1 file changed, 1 deletion(-)
=20
 diff --git a/host/xtest/regression_1000.c b/host/xtest/regression_1000.c
-index 4264884..7f1baca 100644
+index cd11f933ce43..8e338e59da21 100644
 --- a/host/xtest/regression_1000.c
 +++ b/host/xtest/regression_1000.c
-@@ -22,7 +22,6 @@
+@@ -24,7 +24,6 @@
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
diff --git a/meta-arm/recipes-security/optee/optee-test_3.22.0.bb b/meta-=
arm/recipes-security/optee/optee-test_3.22.0.bb
index 3b9632fa..5d3f5a8a 100644
--- a/meta-arm/recipes-security/optee/optee-test_3.22.0.bb
+++ b/meta-arm/recipes-security/optee/optee-test_3.22.0.bb
@@ -1,7 +1,7 @@
 require optee-test.inc
=20
 SRC_URI +=3D " \
-    file://musl-workaround.patch \
+    file://0001-xtest-regression_1000-remove-unneeded-stat.h-include.pat=
ch \
    "
 SRCREV =3D "a286b57f1721af215ace318d5807e63f40186df6"
=20
--=20
2.30.2


