Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.2434.1585782800127406091
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Apr 2020 16:13:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 87C4940C11;
	Wed,  1 Apr 2020 23:13:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id toNvfdGY-9aQ; Wed,  1 Apr 2020 23:13:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6866040BFE;
	Wed,  1 Apr 2020 23:13:18 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D087E171900;
	Wed,  1 Apr 2020 19:13:16 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 4/5] optee-test: upgrade 3.7.0 -> 3.8.0, cleanup
Date: Wed,  1 Apr 2020 19:13:05 -0400
Message-Id: <1585782786-34477-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585782786-34477-1-git-send-email-denis@denix.org>
References: <1585782786-34477-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

* Drop previously backported patch for Python3 support
* Add DESCRIPTION
* Use common HOMEPAGE
* Depend on PyCryptodomex instead of old PyCrypto

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../0001-use-python3-instead-of-python.patch       | 48 ----------------------
 meta-arm/recipes-security/optee/optee-test_git.bb  | 15 ++++---
 2 files changed, 7 insertions(+), 56 deletions(-)
 delete mode 100644 meta-arm/recipes-security/optee/optee-test/0001-use-python3-instead-of-python.patch

diff --git a/meta-arm/recipes-security/optee/optee-test/0001-use-python3-instead-of-python.patch b/meta-arm/recipes-security/optee/optee-test/0001-use-python3-instead-of-python.patch
deleted file mode 100644
index 20f190a..0000000
--- a/meta-arm/recipes-security/optee/optee-test/0001-use-python3-instead-of-python.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 6271160639002a2580d80b75b5397a96d56329f2 Mon Sep 17 00:00:00 2001
-From: Scott Branden <scott.branden@broadcom.com>
-Date: Fri, 27 Dec 2019 12:54:28 -0800
-Subject: [PATCH] use python3 instead of python
-
-use python3 instead of python as python2 is EOL January 2020.
-
-Signed-off-by: Scott Branden <scott.branden@broadcom.com>
-Reviewed-by: Jerome Forissier <jerome@forissier.org>
-Tested-by: Jerome Forissier <jerome@forissier.org> (QEMU, CFG_GCM_NIST_VECTORS=y)
-Upstream-Status: Backport from v3.8.0
----
- scripts/file_to_c.py       | 4 ++--
- scripts/rsp_to_gcm_test.py | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/scripts/file_to_c.py b/scripts/file_to_c.py
-index ae16f52..b4ce2a2 100755
---- a/scripts/file_to_c.py
-+++ b/scripts/file_to_c.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- # SPDX-License-Identifier: BSD-2-Clause
- #
- # Copyright (c) 2018, Linaro Limited
-@@ -29,7 +29,7 @@ def main():
- 
-     f.write("const uint8_t " + args.name + "[] = {\n")
-     i = 0
--    for x in array.array("B", inf.read()):
-+    for x in array.array("B", map(ord, (inf.read()))):
-         f.write("0x" + '{0:02x}'.format(x) + ",")
-         i = i + 1
-         if i % 8 == 0:
-diff --git a/scripts/rsp_to_gcm_test.py b/scripts/rsp_to_gcm_test.py
-index 0543541..e4418be 100755
---- a/scripts/rsp_to_gcm_test.py
-+++ b/scripts/rsp_to_gcm_test.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- 
- modes = {'encrypt': 0, 'decrypt': 1}
- 
--- 
-2.7.4
-
diff --git a/meta-arm/recipes-security/optee/optee-test_git.bb b/meta-arm/recipes-security/optee/optee-test_git.bb
index 3f431c3..752d75d 100644
--- a/meta-arm/recipes-security/optee/optee-test_git.bb
+++ b/meta-arm/recipes-security/optee/optee-test_git.bb
@@ -1,21 +1,20 @@
 SUMMARY = "OP-TEE sanity testsuite"
-HOMEPAGE = "https://github.com/OP-TEE/optee_test"
+DESCRIPTION = "Open Portable Trusted Execution Environment - Test suite"
+HOMEPAGE = "https://www.op-tee.org/"
 
 LICENSE = "BSD & GPLv2"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE.md;md5=daa2bcccc666345ab8940aab1315a4fa"
 
 inherit python3native
 
-DEPENDS = "optee-client optee-os python3-pycrypto-native"
+DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
 
-PV = "3.7.0+git${SRCPV}"
+PV = "3.8.0+git${SRCPV}"
 
-SRC_URI = "git://github.com/OP-TEE/optee_test.git \
-          file://0001-use-python3-instead-of-python.patch \
-          "
-S = "${WORKDIR}/git"
+SRCREV = "30481e381cb4285706e7516853495a7699c93b2c"
+SRC_URI = "git://github.com/OP-TEE/optee_test.git"
 
-SRCREV = "227d6f4c40eaa6f84fe049b9e48c7b27ad7fab08"
+S = "${WORKDIR}/git"
 
 OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
 TEEC_EXPORT         = "${STAGING_DIR_HOST}${prefix}"
-- 
2.7.4

