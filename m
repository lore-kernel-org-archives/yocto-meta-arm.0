Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A0BD3EE9C
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 17:18:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42407.1769102290214378266
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 09:18:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFD141596
	for <meta-arm@lists.yoctoproject.org>; Thu, 22 Jan 2026 09:18:02 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0B5973F632
	for <meta-arm@lists.yoctoproject.org>; Thu, 22 Jan 2026 09:18:08 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/trusted-firmware-a: ensure native tools respect BUILD_LDFLAGS
Date: Thu, 22 Jan 2026 17:18:05 +0000
Message-ID: <20260122171805.2119993-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Jan 2026 17:18:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6865

TF-A has a number for variables to control how host binaries are built:

- Our BUILD_CC is HOSTCC; this is set in the recipes
- Our BUILD_CFLAGS is HOSTCCFLAGS; this is not set
- Our BUILD_LDFLAGS has no corresponding variable

However when uninative is enabled we really need to pass BUILD_LDFLAGS
as otherwise there can be link problems:

  ld: libcrypto.so: undefined reference to `__isoc23_strtol@GLIBC_2.38'

Patch into the TF-A makefiles support for HOSTLDFLAGS and ensure that we
set all three of the relevant BUILD_ variables.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...OSTLDFLAGS-to-pass-flags-to-host-lin.patch | 31 +++++++++++++++++++
 .../trusted-firmware-a/trusted-firmware-a.inc |  2 +-
 .../trusted-firmware-a_2.14.0.bb              |  2 ++
 3 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0001-fe=
at-build-add-HOSTLDFLAGS-to-pass-flags-to-host-lin.patch

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-feat-buil=
d-add-HOSTLDFLAGS-to-pass-flags-to-host-lin.patch b/meta-arm/recipes-bsp/=
trusted-firmware-a/files/0001-feat-build-add-HOSTLDFLAGS-to-pass-flags-to=
-host-lin.patch
new file mode 100644
index 0000000000..c0820f65fb
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-feat-build-add-H=
OSTLDFLAGS-to-pass-flags-to-host-lin.patch
@@ -0,0 +1,31 @@
+From a55ee6bd2eb7e0aff6f17b933b78cb3f73ea3634 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 22 Jan 2026 16:16:27 +0000
+Subject: [PATCH] feat(build): add HOSTLDFLAGS to pass flags to host link=
s
+
+There is a HOSTCCFLAGS variable to pass flags to all host compilations,
+but no corresponding HOSTLDFLAGS to pass flags to host links.
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-A/tr=
usted-firmware-a/+/47531]
+Change-Id: I17441fc61e45d2ee41f9ab55a5d745bd0d2156d7
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ make_helpers/build_macros.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/make_helpers/build_macros.mk b/make_helpers/build_macros.mk
+index 25b4fa498..a20c1ed2d 100644
+--- a/make_helpers/build_macros.mk
++++ b/make_helpers/build_macros.mk
+@@ -356,7 +356,7 @@ $(eval $(foreach src,$(SRCS),$(call MAKE_TOOL_C,$(1)=
,$(src),$(2),$(3))))
+=20
+ $(DST): $(OBJS) $(filter-out %.d,$(MAKEFILE_LIST)) | $(1)
+ 	$$(s)echo "  HOSTLD  $$@"
+-	$$(q)$(host-cc) $${OBJS} -o $$@ $($(3)_LDFLAGS)
++	$$(q)$(host-cc) $${HOSTLDFLAGS} $${OBJS} -o $$@ $($(3)_LDFLAGS)
+ 	$$(s)echo
+ 	$$(s)echo "Built $$@ successfully"
+ 	$$(s)echo
+--=20
+2.43.0
+
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 28e415e24f..6a2c0da9ca 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -159,7 +159,7 @@ EXTRA_OEMAKE +=3D "${@bb.utils.contains('SEL2_SPMC', =
'1', 'ARM_SPMC_MANIFEST_DTS=3D$
 # Tell the tools where the native OpenSSL is located
 EXTRA_OEMAKE +=3D "OPENSSL_DIR=3D${STAGING_DIR_NATIVE}/${prefix_native}"
 # Use the correct native compiler
-EXTRA_OEMAKE +=3D "HOSTCC=3D'${BUILD_CC}'"
+EXTRA_OEMAKE +=3D "HOSTCC=3D'${BUILD_CC}' HOSTCCFLAGS=3D'${BUILD_CFLAGS}=
' HOSTLDFLAGS=3D'${BUILD_LDFLAGS}'"
=20
 # Runtime variables
 EXTRA_OEMAKE +=3D "RUNTIME_SYSROOT=3D${STAGING_DIR_HOST}"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.14.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
4.0.bb
index b84b6ad0cf..31ad86805a 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.14.0.b=
b
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.14.0.b=
b
@@ -14,3 +14,5 @@ SRC_URI_MBEDTLS =3D "gitsm://github.com/Mbed-TLS/mbedtl=
s;name=3Dmbedtls;protocol=3Dhtt
 SRCREV_mbedtls =3D "e185d7fd85499c8ce5ca2a54f5cf8fe7dbe3f8df"
=20
 LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
+
+SRC_URI +=3D "file://0001-feat-build-add-HOSTLDFLAGS-to-pass-flags-to-ho=
st-lin.patch"
--=20
2.43.0


