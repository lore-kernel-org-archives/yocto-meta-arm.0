Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1A5C433FE
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 16:54:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.418.1643302462972608969
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Jan 2022 08:54:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8927D11D4
	for <meta-arm@lists.yoctoproject.org>; Thu, 27 Jan 2022 08:54:22 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 352073F766
	for <meta-arm@lists.yoctoproject.org>; Thu, 27 Jan 2022 08:54:22 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] Revert "meta-arm: add old version of
 python3-cryptography"
Date: Thu, 27 Jan 2022 16:54:19 +0000
Message-Id: <20220127165419.952245-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127165419.952245-1-ross.burton@arm.com>
References: <20220127165419.952245-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Jan 2022 16:54:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2921

This reverts commit a15c16068ab011e2ba91a6c4ca6e1251de0d8058.
---
 meta-arm-bsp/conf/layer.conf                  |  3 -
 .../python/python3-cryptography/h-test.patch  | 10 ---
 .../python3-cryptography/openssl3.patch       | 62 -----------------
 .../python/python3-cryptography/run-ptest     |  2 -
 .../python/python3-cryptography_3.3.2.bb      | 68 -------------------
 5 files changed, 145 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-devtools/python/python3-cryptogr=
aphy/h-test.patch
 delete mode 100644 meta-arm-bsp/recipes-devtools/python/python3-cryptogr=
aphy/openssl3.patch
 delete mode 100644 meta-arm-bsp/recipes-devtools/python/python3-cryptogr=
aphy/run-ptest
 delete mode 100644 meta-arm-bsp/recipes-devtools/python/python3-cryptogr=
aphy_3.3.2.bb

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 45767866..7af156e8 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -19,6 +19,3 @@ LAYERDEPENDS_meta-arm-bsp:append:musca-s1 =3D " meta-py=
thon"
=20
 # Additional license directories.
 LICENSE_PATH +=3D "${LAYERDIR}/custom-licenses"
-
-# Delete this when our downgrade of python3-cryptography is removed
-BBMASK +=3D "meta-arm-bsp/recipes-devtools/python/python3-cryptography_3=
.3.2.bb"
diff --git a/meta-arm-bsp/recipes-devtools/python/python3-cryptography/h-=
test.patch b/meta-arm-bsp/recipes-devtools/python/python3-cryptography/h-=
test.patch
deleted file mode 100644
index 9f07c738..00000000
--- a/meta-arm-bsp/recipes-devtools/python/python3-cryptography/h-test.pa=
tch
+++ /dev/null
@@ -1,10 +0,0 @@
---- a/tests/hypothesis/__init__.py
-+++ b/tests/hypothesis/__init__.py
-@@ -3,3 +3,7 @@
- # for complete details.
-=20
- from __future__ import absolute_import, division, print_function
-+
-+import pytest
-+hypothesis =3D pytest.importorskip("hypothesis")
-+
diff --git a/meta-arm-bsp/recipes-devtools/python/python3-cryptography/op=
enssl3.patch b/meta-arm-bsp/recipes-devtools/python/python3-cryptography/=
openssl3.patch
deleted file mode 100644
index 25baa42c..00000000
--- a/meta-arm-bsp/recipes-devtools/python/python3-cryptography/openssl3.=
patch
+++ /dev/null
@@ -1,62 +0,0 @@
-Encourage our old python3-cryptography to at least start to work with Op=
enSSL 3.
-
-- Backport one patch to err.py to remove a symbol which has been removed=
 in
-  OpenSSL 3, and isn't used in python3-cryptography.
-  (50ec692749b7e2e62685b443f5e629627b03987e)
-
-- Backport the detection of OpenSSL 3 and don't link to FIPS_mode/FIPS_m=
ode_set
-  (parts of f08a7de651f9e6475c8c0a67d2a61ed8b669ddf6)
-
-This is *not* a complete backport of the 3.0 support, but is enough that=
 packages
-such as imgtool can import python3-cryptography and operate until the up=
grade is
-ready.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/src/_cffi_src/openssl/cryptography.py b/src/_cffi_src/opens=
sl/cryptography.py
-index f24bee5a..920a86de 100644
---- a/src/_cffi_src/openssl/cryptography.py
-+++ b/src/_cffi_src/openssl/cryptography.py
-@@ -35,6 +35,8 @@ INCLUDES =3D """
-=20
- #define CRYPTOGRAPHY_OPENSSL_110F_OR_GREATER \
-     (OPENSSL_VERSION_NUMBER >=3D 0x1010006f && !CRYPTOGRAPHY_IS_LIBRESS=
L)
-+#define CRYPTOGRAPHY_OPENSSL_300_OR_GREATER \
-+    (OPENSSL_VERSION_NUMBER >=3D 0x30000000 && !CRYPTOGRAPHY_IS_LIBRESS=
L)
-=20
- #define CRYPTOGRAPHY_OPENSSL_LESS_THAN_110J \
-     (OPENSSL_VERSION_NUMBER < 0x101000af || CRYPTOGRAPHY_IS_LIBRESSL)
-@@ -54,6 +56,7 @@ INCLUDES =3D """
-=20
- TYPES =3D """
- static const int CRYPTOGRAPHY_OPENSSL_110F_OR_GREATER;
-+static const int CRYPTOGRAPHY_OPENSSL_300_OR_GREATER;
-=20
- static const int CRYPTOGRAPHY_OPENSSL_LESS_THAN_111;
- static const int CRYPTOGRAPHY_OPENSSL_LESS_THAN_111B;
-diff --git a/src/_cffi_src/openssl/err.py b/src/_cffi_src/openssl/err.py
-index 0dd74146..42bab4d9 100644
---- a/src/_cffi_src/openssl/err.py
-+++ b/src/_cffi_src/openssl/err.py
-@@ -40,7 +40,6 @@ void ERR_clear_error(void);
- void ERR_put_error(int, int, int, const char *, int);
-=20
- int ERR_GET_LIB(unsigned long);
--int ERR_GET_FUNC(unsigned long);
- int ERR_GET_REASON(unsigned long);
-=20
- """
-diff --git a/src/_cffi_src/openssl/fips.py b/src/_cffi_src/openssl/fips.=
py
-index c92bca49..38bfa231 100644
---- a/src/_cffi_src/openssl/fips.py
-+++ b/src/_cffi_src/openssl/fips.py
-@@ -18,7 +18,7 @@ int FIPS_mode(void);
- """
-=20
- CUSTOMIZATIONS =3D """
--#if CRYPTOGRAPHY_IS_LIBRESSL
-+#if CRYPTOGRAPHY_IS_LIBRESSL || CRYPTOGRAPHY_OPENSSL_300_OR_GREATER
- static const long Cryptography_HAS_FIPS =3D 0;
- int (*FIPS_mode_set)(int) =3D NULL;
- int (*FIPS_mode)(void) =3D NULL;
diff --git a/meta-arm-bsp/recipes-devtools/python/python3-cryptography/ru=
n-ptest b/meta-arm-bsp/recipes-devtools/python/python3-cryptography/run-p=
test
deleted file mode 100644
index 0ba239c2..00000000
--- a/meta-arm-bsp/recipes-devtools/python/python3-cryptography/run-ptest
+++ /dev/null
@@ -1,2 +0,0 @@
-#!/bin/sh
-py.test
diff --git a/meta-arm-bsp/recipes-devtools/python/python3-cryptography_3.=
3.2.bb b/meta-arm-bsp/recipes-devtools/python/python3-cryptography_3.3.2.=
bb
deleted file mode 100644
index a4c33442..00000000
--- a/meta-arm-bsp/recipes-devtools/python/python3-cryptography_3.3.2.bb
+++ /dev/null
@@ -1,68 +0,0 @@
-SUMMARY =3D "Provides cryptographic recipes and primitives to python dev=
elopers"
-HOMEPAGE =3D "https://cryptography.io/"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0 | BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbf405a8056a6647e7d077b0e7bc36=
aba \
-                    file://LICENSE.APACHE;md5=3D4e168cce331e5c827d4c2b68=
a6200e1b \
-                    file://LICENSE.BSD;md5=3D5ae30ba4123bc4f2fa49aa0b0dc=
e887b"
-
-LDSHARED +=3D "-pthread"
-
-SRC_URI[sha256sum] =3D "5a60d3780149e13b7a6ff7ad6526b38846354d11a15e2106=
8e57073e29e19bed"
-
-SRC_URI +=3D " \
-    file://run-ptest \
-    file://h-test.patch \
-    file://openssl3.patch \
-"
-
-inherit pypi setuptools3
-
-DEPENDS +=3D " \
-    ${PYTHON_PN}-cffi \
-    ${PYTHON_PN}-cffi-native \
-    ${PYTHON_PN}-asn1crypto \
-    ${PYTHON_PN}-six \
-"
-
-RDEPENDS:${PN} +=3D " \
-    ${PYTHON_PN}-cffi \
-    ${PYTHON_PN}-idna \
-    ${PYTHON_PN}-asn1crypto \
-    ${PYTHON_PN}-setuptools \
-    ${PYTHON_PN}-six \
-"
-
-RDEPENDS:${PN}:class-target +=3D " \
-    ${PYTHON_PN}-cffi \
-    ${PYTHON_PN}-idna \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-asn1crypto \
-    ${PYTHON_PN}-setuptools \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-threading \
-"
-
-RDEPENDS:${PN}-ptest +=3D " \
-    ${PN} \
-    ${PYTHON_PN}-cryptography-vectors \
-    ${PYTHON_PN}-iso8601 \
-    ${PYTHON_PN}-pretend \
-    ${PYTHON_PN}-pytest \
-    ${PYTHON_PN}-pytz \
-"
-
-inherit ptest
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-    install -d ${D}${PTEST_PATH}/tests/hazmat
-    cp -rf ${S}/tests/hazmat/* ${D}${PTEST_PATH}/tests/hazmat/
-}
-
-FILES:${PN}-dbg +=3D " \
-    ${libdir}/${PYTHON_PN}2.7/site-packages/${SRCNAME}/hazmat/bindings/.=
debug \
-"
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


