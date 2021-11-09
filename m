Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C1D2C433FE
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 14:44:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12840.1636469086217660333
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Nov 2021 06:44:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C53AA113E
	for <meta-arm@lists.yoctoproject.org>; Tue,  9 Nov 2021 06:44:45 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 513863F800
	for <meta-arm@lists.yoctoproject.org>; Tue,  9 Nov 2021 06:44:45 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] CI: apply a patch to fix python3-cryptography with
 OpenSSL 3
Date: Tue,  9 Nov 2021 14:44:40 +0000
Message-Id: <20211109144441.24512-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211109144441.24512-1-ross.burton@arm.com>
References: <20211109144441.24512-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Nov 2021 14:44:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2348

python3-cryptography doesn't even start with OpenSSL 3, because symbols
that it tries to use have been removed.  Backport enough of the OpenSSL
3 port that it will start up.

This patch has been submitted to meta-openembedded and will be removed
when it is merged.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/crypto-ssl3.patch     | 105 +++++++++++++++++++++++++++++++++++++++
 ci/meta-openembedded.yml |   4 ++
 2 files changed, 109 insertions(+)
 create mode 100644 ci/crypto-ssl3.patch

diff --git a/ci/crypto-ssl3.patch b/ci/crypto-ssl3.patch
new file mode 100644
index 00000000..bacb1f24
--- /dev/null
+++ b/ci/crypto-ssl3.patch
@@ -0,0 +1,105 @@
+Upstream-Status: Submitted [posted to oe-devel]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 71bec4794626f8a2a46377ef284cc3261bdc0c4e Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Mon, 8 Nov 2021 16:58:11 +0000
+Subject: [PATCH] python3-cryptography: backport patches to make this wor=
k
+ against OpenSSL 3
+
+Backport just enough changes that python3-cryptography doesn't crash on
+startup when linked against OpenSSL 3.
+
+This is very much not complete, and the upgrade to the latest version of
+python3-crytography has to happen soon.
+
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ .../python3-cryptography/openssl3.patch       | 62 +++++++++++++++++++
+ .../python/python3-cryptography_3.3.2.bb      |  1 +
+ 2 files changed, 63 insertions(+)
+ create mode 100644 meta-python/recipes-devtools/python/python3-cryptogr=
aphy/openssl3.patch
+
+diff --git a/meta-python/recipes-devtools/python/python3-cryptography/op=
enssl3.patch b/meta-python/recipes-devtools/python/python3-cryptography/o=
penssl3.patch
+new file mode 100644
+index 0000000000..25baa42cc9
+--- /dev/null
++++ b/meta-python/recipes-devtools/python/python3-cryptography/openssl3.=
patch
+@@ -0,0 +1,62 @@
++Encourage our old python3-cryptography to at least start to work with O=
penSSL 3.
++
++- Backport one patch to err.py to remove a symbol which has been remove=
d in
++  OpenSSL 3, and isn't used in python3-cryptography.
++  (50ec692749b7e2e62685b443f5e629627b03987e)
++
++- Backport the detection of OpenSSL 3 and don't link to FIPS_mode/FIPS_=
mode_set
++  (parts of f08a7de651f9e6475c8c0a67d2a61ed8b669ddf6)
++
++This is *not* a complete backport of the 3.0 support, but is enough tha=
t packages
++such as imgtool can import python3-cryptography and operate until the u=
pgrade is
++ready.
++
++Upstream-Status: Inappropriate
++Signed-off-by: Ross Burton <ross.burton@arm.com>
++
++diff --git a/src/_cffi_src/openssl/cryptography.py b/src/_cffi_src/open=
ssl/cryptography.py
++index f24bee5a..920a86de 100644
++--- a/src/_cffi_src/openssl/cryptography.py
+++++ b/src/_cffi_src/openssl/cryptography.py
++@@ -35,6 +35,8 @@ INCLUDES =3D """
++=20
++ #define CRYPTOGRAPHY_OPENSSL_110F_OR_GREATER \
++     (OPENSSL_VERSION_NUMBER >=3D 0x1010006f && !CRYPTOGRAPHY_IS_LIBRES=
SL)
+++#define CRYPTOGRAPHY_OPENSSL_300_OR_GREATER \
+++    (OPENSSL_VERSION_NUMBER >=3D 0x30000000 && !CRYPTOGRAPHY_IS_LIBRES=
SL)
++=20
++ #define CRYPTOGRAPHY_OPENSSL_LESS_THAN_110J \
++     (OPENSSL_VERSION_NUMBER < 0x101000af || CRYPTOGRAPHY_IS_LIBRESSL)
++@@ -54,6 +56,7 @@ INCLUDES =3D """
++=20
++ TYPES =3D """
++ static const int CRYPTOGRAPHY_OPENSSL_110F_OR_GREATER;
+++static const int CRYPTOGRAPHY_OPENSSL_300_OR_GREATER;
++=20
++ static const int CRYPTOGRAPHY_OPENSSL_LESS_THAN_111;
++ static const int CRYPTOGRAPHY_OPENSSL_LESS_THAN_111B;
++diff --git a/src/_cffi_src/openssl/err.py b/src/_cffi_src/openssl/err.p=
y
++index 0dd74146..42bab4d9 100644
++--- a/src/_cffi_src/openssl/err.py
+++++ b/src/_cffi_src/openssl/err.py
++@@ -40,7 +40,6 @@ void ERR_clear_error(void);
++ void ERR_put_error(int, int, int, const char *, int);
++=20
++ int ERR_GET_LIB(unsigned long);
++-int ERR_GET_FUNC(unsigned long);
++ int ERR_GET_REASON(unsigned long);
++=20
++ """
++diff --git a/src/_cffi_src/openssl/fips.py b/src/_cffi_src/openssl/fips=
.py
++index c92bca49..38bfa231 100644
++--- a/src/_cffi_src/openssl/fips.py
+++++ b/src/_cffi_src/openssl/fips.py
++@@ -18,7 +18,7 @@ int FIPS_mode(void);
++ """
++=20
++ CUSTOMIZATIONS =3D """
++-#if CRYPTOGRAPHY_IS_LIBRESSL
+++#if CRYPTOGRAPHY_IS_LIBRESSL || CRYPTOGRAPHY_OPENSSL_300_OR_GREATER
++ static const long Cryptography_HAS_FIPS =3D 0;
++ int (*FIPS_mode_set)(int) =3D NULL;
++ int (*FIPS_mode)(void) =3D NULL;
+diff --git a/meta-python/recipes-devtools/python/python3-cryptography_3.=
3.2.bb b/meta-python/recipes-devtools/python/python3-cryptography_3.3.2.b=
b
+index baec105a3e..8808b81625 100644
+--- a/meta-python/recipes-devtools/python/python3-cryptography_3.3.2.bb
++++ b/meta-python/recipes-devtools/python/python3-cryptography_3.3.2.bb
+@@ -11,6 +11,7 @@ SRC_URI[sha256sum] =3D "5a60d3780149e13b7a6ff7ad6526b3=
8846354d11a15e21068e57073e29
+ SRC_URI +=3D " \
+     file://run-ptest \
+     file://h-test.patch \
++    file://openssl3.patch \
+ "
+=20
+ inherit pypi setuptools3
+--=20
+2.25.1
+
diff --git a/ci/meta-openembedded.yml b/ci/meta-openembedded.yml
index 4b95217b..cc5ff46f 100644
--- a/ci/meta-openembedded.yml
+++ b/ci/meta-openembedded.yml
@@ -9,3 +9,7 @@ repos:
       meta-networking:
       meta-oe:
       meta-python:
+    patches:
+      crypto-ssl3:
+        repo: meta-arm
+        path: ci/crypto-ssl3.patch
--=20
2.25.1


