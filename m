Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F3A9C47079
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 16:32:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.21313.1704817931167776158
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Jan 2024 08:32:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC0EAFEC
	for <meta-arm@lists.yoctoproject.org>; Tue,  9 Jan 2024 08:32:55 -0800 (PST)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2FADD3F5A1
	for <meta-arm@lists.yoctoproject.org>; Tue,  9 Jan 2024 08:32:10 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/optee-os: use sysroot in CFLAGS
Date: Mon,  8 Jan 2024 15:18:45 -0600
Message-Id: <20240108211846.29349-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240108211846.29349-1-jon.mason@arm.com>
References: <20240108211846.29349-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Jan 2024 16:32:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5324

Per the comment in https://github.com/OP-TEE/optee_os/issues/4188
use sysroot in CFLAGS instead of the patch

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-security/optee/optee-os.inc  |  1 -
 ...ow-setting-sysroot-for-libgcc-lookup.patch | 35 -------------------
 .../recipes-security/optee/optee-os_4.0.0.bb  |  1 -
 meta-arm/recipes-security/optee/optee.inc     |  2 ++
 4 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta-arm/recipes-security/optee/optee-os/0001-allow-s=
etting-sysroot-for-libgcc-lookup.patch

diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/reci=
pes-security/optee/optee-os.inc
index 8e25d361..80ac0097 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -31,7 +31,6 @@ EXTRA_OEMAKE +=3D " \
 EXTRA_OEMAKE +=3D " HOST_PREFIX=3D${HOST_PREFIX}"
 EXTRA_OEMAKE +=3D " CROSS_COMPILE64=3D${HOST_PREFIX}"
=20
-CFLAGS[unexport] =3D "1"
 LDFLAGS[unexport] =3D "1"
 CPPFLAGS[unexport] =3D "1"
 AS[unexport] =3D "1"
diff --git a/meta-arm/recipes-security/optee/optee-os/0001-allow-setting-=
sysroot-for-libgcc-lookup.patch b/meta-arm/recipes-security/optee/optee-o=
s/0001-allow-setting-sysroot-for-libgcc-lookup.patch
deleted file mode 100644
index b060952c..00000000
--- a/meta-arm/recipes-security/optee/optee-os/0001-allow-setting-sysroot=
-for-libgcc-lookup.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From d94ad6c6efb71f683b183e84919122bb6f3ac65d Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Tue, 26 May 2020 14:38:02 -0500
-Subject: [PATCH] allow setting sysroot for libgcc lookup
-
-Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS variable when sear=
ching
-for the compiler libraries as there's no easy way to reliably pass --sys=
root
-otherwise.
-
-Upstream-Status: Pending [https://github.com/OP-TEE/optee_os/issues/4188=
]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
----
- mk/gcc.mk | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/mk/gcc.mk b/mk/gcc.mk
-index adc77a24f..81bfa78ad 100644
---- a/mk/gcc.mk
-+++ b/mk/gcc.mk
-@@ -13,11 +13,11 @@ nostdinc$(sm)	:=3D -nostdinc -isystem $(shell $(CC$(=
sm)) \
- 			-print-file-name=3Dinclude 2> /dev/null)
-=20
- # Get location of libgcc from gcc
--libgcc$(sm)  	:=3D $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
-+libgcc$(sm)  	:=3D $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$=
(arch-bits-$(sm))) \
- 			-print-libgcc-file-name 2> /dev/null)
--libstdc++$(sm)	:=3D $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $=
(comp-cxxflags$(sm)) \
-+libstdc++$(sm)	:=3D $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFL=
AGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
- 			-print-file-name=3Dlibstdc++.a 2> /dev/null)
--libgcc_eh$(sm)	:=3D $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $=
(comp-cxxflags$(sm)) \
-+libgcc_eh$(sm)	:=3D $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFL=
AGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
- 			-print-file-name=3Dlibgcc_eh.a 2> /dev/null)
-=20
- # Define these to something to discover accidental use
diff --git a/meta-arm/recipes-security/optee/optee-os_4.0.0.bb b/meta-arm=
/recipes-security/optee/optee-os_4.0.0.bb
index 10b16aa0..a5a594fb 100644
--- a/meta-arm/recipes-security/optee/optee-os_4.0.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_4.0.0.bb
@@ -6,7 +6,6 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
 SRCREV =3D "2a5b1d1232f582056184367fb58a425ac7478ec6"
 SRC_URI +=3D " \
-    file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
     file://0002-core-Define-section-attributes-for-clang.patch \
     file://0003-optee-enable-clang-support.patch \
     file://0004-core-link-add-no-warn-rwx-segments.patch \
diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes=
-security/optee/optee.inc
index 650f8d0b..af391f39 100644
--- a/meta-arm/recipes-security/optee/optee.inc
+++ b/meta-arm/recipes-security/optee/optee.inc
@@ -32,5 +32,7 @@ EXTRA_OEMAKE +=3D "V=3D1 \
 # right path until this is relocated automatically.
 export OPENSSL_MODULES=3D"${STAGING_LIBDIR_NATIVE}/ossl-modules"
=20
+CFLAGS +=3D "--sysroot=3D${STAGING_DIR_HOST}"
+
 # See the rationale in https://github.com/f-secure-foundry/advisories/bl=
ob/master/Security_Advisory-Ref_FSC-HWSEC-VR2021-0001-OP-TEE_TrustZone_by=
pass.txt.
 CVE_STATUS[CVE-2021-36133] =3D "disputed: devices shipped open for devel=
opment purposes"
--=20
2.30.2


