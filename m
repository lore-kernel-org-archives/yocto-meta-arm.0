Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.650.1580319706558496693
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Jan 2020 09:41:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QQ4U1Fz3;
 spf=pass (domain: linaro.org, ip: 209.85.221.50, mailfrom: peter.griffin@linaro.org)
Received: by mail-wr1-f50.google.com with SMTP id t2so446832wrr.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 29 Jan 2020 09:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/io/RG3JIPW6rtZUQZbPiBq7j/bT436LBlnSyADBb3A=;
        b=QQ4U1Fz3Xe5qHfVa7Xnpqs/LI6XPxm0Fjr0iTCBlmwg+2bR2dr5X8Sdap43Tn8RNMp
         Rd/SwWQyDfBfJwTmkBzk/cgbeTxp3RYlNMomuYFKjCbaCuxjzWXULl9MpqAMdf3ynB0C
         sVcZQhN2gzbL9dcH4v3nsG+ORXzHErXMg4fvlt7svl7hkZ3qYLGhSWKyg3010qxSi9zt
         ByouZD/cqfympfeHb0qEth73fIxMWreyql23D7mT3fjD2lGXRg7ilIsCC51iSumoue1w
         xPsOVcRNT+5Xl/ke2tQ27yFqTCDuqmxm7nuuQJxAo4/EEmhsBmY4hCigAYIyy8p78Izv
         nfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/io/RG3JIPW6rtZUQZbPiBq7j/bT436LBlnSyADBb3A=;
        b=XKsv88Vz3frCt7HQgBryFEVIcMK/tJbA5kcBpN4Xo5hpg1xNIuGGpmWxVWaEUg9xZX
         bY35Zx39na3xpQA/1Uc1byaZ3qR3lkR359uQoEXgNoMej9M1q+Mmf/i8jwChsKVYNBnG
         D7oIbn+UQYCa9xC0HCIrvH4mdJpojSLZNsvYYd1YW2/uo+YM3rseokPho60JWhv4bm6/
         8H4AjCua7vDf3x9KyyHEQqYZZMalZCeUrdffEYgkcOOAZO2a4/Smxev+yGxkn7qvClCJ
         V5oZCXybCnpWgtODQYdu3Kc53AdtI5SbQE4W0Ddc/R7J8ea+LTuIuKv89JHJS9EzhrEI
         7mpQ==
X-Gm-Message-State: APjAAAXKJQbzOTCsyYKw0r+PTC5wWZB2AYx7Rh87yPlQ/id3ROp2FnZu
	1RsLzgCoZQWSqlMYrqwun3nJFCIiUuM=
X-Google-Smtp-Source: APXvYqymruyIbVPclt+It/5G4XUKRGz4oNDxbLslA0jDy4/LsHDLRlRlgYVLMPRaDCkPH1u+0CcQLw==
X-Received: by 2002:adf:dfc2:: with SMTP id q2mr38583496wrn.251.1580319704728;
        Wed, 29 Jan 2020 09:41:44 -0800 (PST)
Return-Path: <peter.griffin@linaro.org>
Received: from localhost.localdomain (cpc89244-aztw30-2-0-cust4998.18-1.cable.virginm.net. [86.31.179.135])
        by smtp.gmail.com with ESMTPSA id y185sm3231525wmg.2.2020.01.29.09.41.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 29 Jan 2020 09:41:44 -0800 (PST)
From: "Peter Griffin" <peter.griffin@linaro.org>
To: meta-arm@lists.yoctoproject.org,
	denis@denix.org,
	jon.mason@arm.com,
	raj.khem@gmail.com,
	nicolas.dechesne@linaro.org
Cc: joakim.bech@linaro.org,
	moorthy.baskaravenkatraman-sambamoorthy@linaro.org,
	alexandre.jutras@linaro.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 4/5] optee-test_git.bb: add optee-test recipe & patches
Date: Wed, 29 Jan 2020 17:38:44 +0000
Message-Id: <1580319525-32054-5-git-send-email-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580319525-32054-1-git-send-email-peter.griffin@linaro.org>
References: <1580319525-32054-1-git-send-email-peter.griffin@linaro.org>

This has moved from meta-linaro to meta-arm as this
is the new place for general recipes for Arm arch
and has a mailing list for external contributors.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../0001-use-python3-instead-of-python.patch       | 48 +++++++++++++++++++++
 meta-arm/recipes-security/optee/optee-test_git.bb  | 49 ++++++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee/optee-test/0001-use-python3-instead-of-python.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-test_git.bb

diff --git a/meta-arm/recipes-security/optee/optee-test/0001-use-python3-instead-of-python.patch b/meta-arm/recipes-security/optee/optee-test/0001-use-python3-instead-of-python.patch
new file mode 100644
index 0000000..20f190a
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test/0001-use-python3-instead-of-python.patch
@@ -0,0 +1,48 @@
+From 6271160639002a2580d80b75b5397a96d56329f2 Mon Sep 17 00:00:00 2001
+From: Scott Branden <scott.branden@broadcom.com>
+Date: Fri, 27 Dec 2019 12:54:28 -0800
+Subject: [PATCH] use python3 instead of python
+
+use python3 instead of python as python2 is EOL January 2020.
+
+Signed-off-by: Scott Branden <scott.branden@broadcom.com>
+Reviewed-by: Jerome Forissier <jerome@forissier.org>
+Tested-by: Jerome Forissier <jerome@forissier.org> (QEMU, CFG_GCM_NIST_VECTORS=y)
+Upstream-Status: Backport from v3.8.0
+---
+ scripts/file_to_c.py       | 4 ++--
+ scripts/rsp_to_gcm_test.py | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/scripts/file_to_c.py b/scripts/file_to_c.py
+index ae16f52..b4ce2a2 100755
+--- a/scripts/file_to_c.py
++++ b/scripts/file_to_c.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # SPDX-License-Identifier: BSD-2-Clause
+ #
+ # Copyright (c) 2018, Linaro Limited
+@@ -29,7 +29,7 @@ def main():
+ 
+     f.write("const uint8_t " + args.name + "[] = {\n")
+     i = 0
+-    for x in array.array("B", inf.read()):
++    for x in array.array("B", map(ord, (inf.read()))):
+         f.write("0x" + '{0:02x}'.format(x) + ",")
+         i = i + 1
+         if i % 8 == 0:
+diff --git a/scripts/rsp_to_gcm_test.py b/scripts/rsp_to_gcm_test.py
+index 0543541..e4418be 100755
+--- a/scripts/rsp_to_gcm_test.py
++++ b/scripts/rsp_to_gcm_test.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ 
+ modes = {'encrypt': 0, 'decrypt': 1}
+ 
+-- 
+2.7.4
+
diff --git a/meta-arm/recipes-security/optee/optee-test_git.bb b/meta-arm/recipes-security/optee/optee-test_git.bb
new file mode 100644
index 0000000..a6fae9d
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test_git.bb
@@ -0,0 +1,49 @@
+SUMMARY = "OP-TEE sanity testsuite"
+HOMEPAGE = "https://github.com/OP-TEE/optee_test"
+
+LICENSE = "BSD & GPLv2"
+LIC_FILES_CHKSUM = "file://${S}/LICENSE.md;md5=daa2bcccc666345ab8940aab1315a4fa"
+
+inherit python3native
+
+DEPENDS = "optee-client optee-os python3-pycrypto-native"
+
+PV = "3.7.0+git${SRCPV}"
+
+SRC_URI = "git://github.com/OP-TEE/optee_test.git \
+          "
+S = "${WORKDIR}/git"
+
+SRCREV = "227d6f4c40eaa6f84fe049b9e48c7b27ad7fab08"
+
+OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
+TEEC_EXPORT         = "${STAGING_DIR_HOST}${prefix}"
+TA_DEV_KIT_DIR      = "${STAGING_INCDIR}/optee/export-user_ta"
+
+EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
+                 OPTEE_CLIENT_EXPORT=${OPTEE_CLIENT_EXPORT} \
+                 TEEC_EXPORT=${TEEC_EXPORT} \
+                 CROSS_COMPILE_HOST=${TARGET_PREFIX} \
+                 CROSS_COMPILE_TA=${TARGET_PREFIX} \
+                 V=1 \
+               "
+
+do_compile() {
+    # Top level makefile doesn't seem to handle parallel make gracefully
+    oe_runmake xtest
+    oe_runmake ta
+}
+
+do_install () {
+    install -D -p -m0755 ${S}/out/xtest/xtest ${D}${bindir}/xtest
+
+    # install path should match the value set in optee-client/tee-supplicant
+    # default TEEC_LOAD_PATH is /lib
+    mkdir -p ${D}${nonarch_base_libdir}/optee_armtz/
+    install -D -p -m0444 ${S}/out/ta/*/*.ta ${D}${nonarch_base_libdir}/optee_armtz/
+}
+
+FILES_${PN} += "${nonarch_base_libdir}/optee_armtz/"
+
+# Imports machine specific configs from staging to build
+PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.7.4

