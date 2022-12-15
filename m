Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB0E5C46467
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 16:16:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.137395.1671120973277982693
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Dec 2022 08:16:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E1741063;
	Thu, 15 Dec 2022 08:16:53 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72A6C3F73B;
	Thu, 15 Dec 2022 08:16:12 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH][kirkstone 7/8] arm-toolchain/armcompiler: remove recipe
Date: Thu, 15 Dec 2022 16:16:05 +0000
Message-Id: <20221215161606.1194188-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221215161606.1194188-1-ross.burton@arm.com>
References: <20221215161606.1194188-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 15 Dec 2022 16:16:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4191

As far as we know nobody is actually using the Arm Compiler recipe: 6.17
does a network operation on every call to check the license and this
fails with the network isolation that do_compile has in kirkstone, and
6.18 is behind a loginwall so we cannot download it in a recipe.

Unless we have actual users asking for a recipe, remove it from the layer
to avoid confusion.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-toolchain/conf/layer.conf            |  3 -
 .../armcompiler/no-uname.patch                | 14 -----
 .../armcompiler_6.17.bb                       | 55 -------------------
 3 files changed, 72 deletions(-)
 delete mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-tool=
chain/armcompiler/no-uname.patch
 delete mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-tool=
chain/armcompiler_6.17.bb

diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf=
/layer.conf
index dd54db82..3cb8b064 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -10,6 +10,3 @@ BBFILE_PRIORITY_arm-toolchain =3D "5"
=20
 LAYERDEPENDS_arm-toolchain =3D "core"
 LAYERSERIES_COMPAT_arm-toolchain =3D "kirkstone"
-
-# These variables are used for armcompiler license
-BB_BASEHASH_IGNORE_VARS:append =3D " ARM_TOOL_VARIANT ARMLMD_LICENSE_FIL=
E LM_LICENSE_FILE"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/a=
rmcompiler/no-uname.patch b/meta-arm-toolchain/recipes-devtools/external-=
arm-toolchain/armcompiler/no-uname.patch
deleted file mode 100644
index 7c958079..00000000
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompi=
ler/no-uname.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-The install script has an explicit check that the current host is x86-64=
, which
-means we can't build armcompiler for x86-64 targets on arm64. Pad the
-replacement host with whitespace so that the installer offset doesn't ch=
ange.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
---- a/install_x86_64.sh.orig	2021-07-06 14:11:47.632155370 +0100
-+++ b/install_x86_64.sh	2021-07-06 14:11:58.393163350 +0100
-@@ -470,3 +470,3 @@
- fi
--host=3D`/bin/uname -m`
-+host=3Dx86_64        =20
- echo --- Host target check...[${host}]
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/a=
rmcompiler_6.17.bb b/meta-arm-toolchain/recipes-devtools/external-arm-too=
lchain/armcompiler_6.17.bb
deleted file mode 100644
index 938dbc2c..00000000
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompi=
ler_6.17.bb
+++ /dev/null
@@ -1,55 +0,0 @@
-# SPDX-License-Identifier: MIT
-#
-# Copyright (c) 2020 Arm Limited
-#
-
-require arm-binary-toolchain.inc
-
-SUMMARY =3D "Baremetal Armcompiler for Cortex-A, Cortex-R and Cortex-M p=
rocessors"
-HOMEPAGE =3D "https://developer.arm.com/tools-and-software/embedded/arm-=
compiler/downloads/version-6"
-
-# Certain features of armcompiler requires a license. For more informati=
on, please refer to the armcompiler user guide:
-# https://developer.arm.com/tools-and-software/software-development-tool=
s/license-management/resources/product-and-toolkit-configuration
-# Usually set and export of these variables are required:
-# ARM_TOOL_VARIANT, ARMLMD_LICENSE_FILE, LM_LICENSE_FILE
-
-LICENSE =3D "Armcompiler-License-agreement & Armcompiler-Redistributable=
s & \
-           Armcompiler-Supplementary-terms & Armcompiler-Third-party-lic=
enses"
-
-NO_GENERIC_LICENSE[Armcompiler-License-agreement] =3D "license_terms/lic=
ense_agreement.txt"
-NO_GENERIC_LICENSE[Armcompiler-Redistributables] =3D "license_terms/redi=
stributables.txt"
-NO_GENERIC_LICENSE[Armcompiler-Supplementary-terms] =3D "license_terms/s=
upplementary_terms.txt"
-NO_GENERIC_LICENSE[Armcompiler-Third-party-licenses] =3D "license_terms/=
third_party_licenses.txt"
-
-# The Arm Compiler is under a EULA, read this at the homepage above and =
if you
-# agree add 'armcompiler' to your LICENSE_FLAGS_ACCEPTED.
-LICENSE_FLAGS =3D "armcompiler"
-
-LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
9faf912b534478d28f60dfa24659c17 \
-                    file://license_terms/redistributables.txt;md5=3Dc22d=
8d2388d8e592f4b135f87bb243da \
-                    file://license_terms/supplementary_terms.txt;md5=3De=
2443a4a7c520e79ebb603c8ba509076 \
-                    file://license_terms/third_party_licenses.txt;md5=3D=
53b42e7d31259bdc174b9c03651ed1b7 "
-
-ARMCLANG_VERSION =3D "DS500-BN-00026-r5p0-19rel0"
-
-COMPATIBLE_HOST =3D "x86_64.*-linux"
-
-SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/compiler/=
${ARMCLANG_VERSION}.tgz;subdir=3D${ARMCLANG_VERSION} \
-           file://no-uname.patch"
-SRC_URI[sha256sum] =3D "0ed2c3a2e416f07b892250fcbcca4b27353b046a030a433b=
f6dddc0db802885c"
-
-UPSTREAM_CHECK_URI =3D "https://developer.arm.com/tools-and-software/emb=
edded/arm-compiler/downloads/"
-UPSTREAM_CHECK_REGEX =3D "Download Arm Compiler.*,(?P<pver>[\d\.]+)"
-
-S =3D "${WORKDIR}/${ARMCLANG_VERSION}"
-
-do_install() {
-    install -d ${D}${bindir} ${D}${libexecdir}/${BPN}/
-    # Commercial license flag set, so recipe will only install when expl=
icitly agreed to it already
-    ${S}/install_x86_64.sh --i-agree-to-the-contained-eula -d ${D}${libe=
xecdir}/${BPN}/ --no-interactive
-
-    # Symlink all executables into bindir
-    for f in ${D}${libexecdir}/${BPN}/bin/*; do
-        ln -rs $f ${D}${bindir}/$(basename $f)
-    done
-}
--=20
2.34.1


