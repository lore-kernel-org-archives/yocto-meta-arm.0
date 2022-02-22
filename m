Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B81C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 12:35:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12067.1645533336669269543
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 22 Feb 2022 04:35:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A86AA1063
	for <meta-arm@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:35:35 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 511D53F5A1
	for <meta-arm@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:35:35 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] Update for LICENSE_FLAGS_WHITELIST rename to _ACCEPTED.
Date: Tue, 22 Feb 2022 12:35:33 +0000
Message-Id: <20220222123533.276299-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 22 Feb 2022 12:35:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3038

LICENSE_FLAGS_WHITELIST has been renamed to LICENSE_FLAGS_ACCEPTED in
oe-core master.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml                                                     | 2 +-
 kas/corstone1000-base.yml                                       | 2 +-
 kas/fvp-baser-aemv8r64-bsp.yml                                  | 2 +-
 .../recipes-devtools/external-arm-toolchain/armcompiler_6.17.bb | 2 +-
 meta-arm/recipes-devtools/fvp/fvp-common.inc                    | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/ci/base.yml b/ci/base.yml
index 6c2f8df1..9a59de79 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -29,7 +29,7 @@ local_conf_header:
     BB_SERVER_TIMEOUT =3D "60"
     CONF_VERSION =3D "2"
     PACKAGE_CLASSES =3D "package_ipk"
-    LICENSE_FLAGS_WHITELIST +=3D "armcompiler Arm-FVP-EULA"
+    LICENSE_FLAGS_ACCEPTED +=3D "armcompiler Arm-FVP-EULA"
     PACKAGECONFIG:remove:pn-qemu-system-native =3D "gtk+ sdl"
     EXTRA_IMAGE_FEATURES:append =3D " debug-tweaks"
     BB_NUMBER_THREADS =3D "16"
diff --git a/kas/corstone1000-base.yml b/kas/corstone1000-base.yml
index 5febd3d9..f6ba3e7b 100644
--- a/kas/corstone1000-base.yml
+++ b/kas/corstone1000-base.yml
@@ -37,7 +37,7 @@ local_conf_header:
   base: |
     CONF_VERSION =3D "2"
     PACKAGE_CLASSES =3D "package_ipk"
-    LICENSE_FLAGS_WHITELIST +=3D "armcompiler"
+    LICENSE_FLAGS_ACCEPTED +=3D "armcompiler"
     BB_NUMBER_THREADS ?=3D "16"
     PARALLEL_MAKE ?=3D "-j16"
     PACKAGECONFIG:append:pn-perf =3D " coresight"
diff --git a/kas/fvp-baser-aemv8r64-bsp.yml b/kas/fvp-baser-aemv8r64-bsp.=
yml
index 5a455750..dfd68916 100644
--- a/kas/fvp-baser-aemv8r64-bsp.yml
+++ b/kas/fvp-baser-aemv8r64-bsp.yml
@@ -35,7 +35,7 @@ local_conf_header:
     PACKAGECONFIG:remove:pn-qemu-system-native =3D "gtk+ sdl"
     EXTRA_IMAGE_FEATURES:append =3D " debug-tweaks"
     IMAGE_CLASSES:append =3D " ${@oe.utils.ifelse(d.getVar('FVP_BASE_R_A=
EM_TARBALL_URI'), 'fvpboot', '')}"
-    LICENSE_FLAGS_WHITELIST:append =3D " ${@oe.utils.vartrue('FVP_BASE_R=
_ARM_EULA_ACCEPT', 'Arm-FVP-EULA', '', d)}"
+    LICENSE_FLAGS_ACCEPTED:append =3D " ${@oe.utils.vartrue('FVP_BASE_R_=
ARM_EULA_ACCEPT', 'Arm-FVP-EULA', '', d)}"
=20
 target:
   - core-image-minimal
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/a=
rmcompiler_6.17.bb b/meta-arm-toolchain/recipes-devtools/external-arm-too=
lchain/armcompiler_6.17.bb
index 630b33d3..65a1f3a5 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompi=
ler_6.17.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompi=
ler_6.17.bb
@@ -22,7 +22,7 @@ NO_GENERIC_LICENSE[Armcompiler-Supplementary-terms] =3D=
 "license_terms/supplementa
 NO_GENERIC_LICENSE[Armcompiler-Third-party-licenses] =3D "license_terms/=
third_party_licenses.txt"
=20
 # The Arm Compiler is under a EULA, read this at the homepage above and =
if you
-# agree add 'armcompiler' to your LICENSE_FLAGS_WHITELIST.
+# agree add 'armcompiler' to your LICENSE_FLAGS_ACCEPTED.
 LICENSE_FLAGS =3D "armcompiler"
=20
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
9faf912b534478d28f60dfa24659c17 \
diff --git a/meta-arm/recipes-devtools/fvp/fvp-common.inc b/meta-arm/reci=
pes-devtools/fvp/fvp-common.inc
index 43c1b46f..3070c73f 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-common.inc
+++ b/meta-arm/recipes-devtools/fvp/fvp-common.inc
@@ -1,7 +1,7 @@
 HOMEPAGE =3D "https://developer.arm.com/tools-and-software/simulation-mo=
dels/fixed-virtual-platforms"
=20
 # FVP has an End User License Agreement. Add Arm-FVP-EULA to your
-# LICENSE_FLAGS_WHITELIST if you agree to these terms.
+# LICENSE_FLAGS_ACCEPTED if you agree to these terms.
 LICENSE_FLAGS =3D "Arm-FVP-EULA"
=20
 LICENSE =3D "Proprietary & Apache-2.0 & Python-2.0 & GPL-3.0-with-GCC-ex=
ception & Zlib & NCSA & LGPLv2+ & MIT & BSD-3-Clause"
--=20
2.25.1


