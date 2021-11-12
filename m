Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F3DCC433EF
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 14:14:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16233.1636726457684593162
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 06:14:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 486BD1063
	for <meta-arm@lists.yoctoproject.org>; Fri, 12 Nov 2021 06:14:17 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFFA53F70D
	for <meta-arm@lists.yoctoproject.org>; Fri, 12 Nov 2021 06:14:16 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] Remove use of deprecated `lnr` command
Date: Fri, 12 Nov 2021 14:14:14 +0000
Message-Id: <20211112141414.575974-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 12 Nov 2021 14:14:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2381

lnr is deprecated and will be removed soon, so replace it with `ln -rs`

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../external-arm-toolchain/arm-binary-toolchain.inc             | 2 +-
 .../recipes-devtools/external-arm-toolchain/armcompiler_6.16.bb | 2 +-
 meta-arm/recipes-devtools/fvp/fvp-common.inc                    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/a=
rm-binary-toolchain.inc b/meta-arm-toolchain/recipes-devtools/external-ar=
m-toolchain/arm-binary-toolchain.inc
index f237454c..da12a778 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-bina=
ry-toolchain.inc
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-bina=
ry-toolchain.inc
@@ -11,7 +11,7 @@ do_install() {
     install -d ${D}${bindir}
     # Symlink all executables into bindir
     for f in ${D}${datadir}/bin/${BINNAME}-*; do
-        lnr $f ${D}${bindir}/$(basename $f)
+        ln -rs $f ${D}${bindir}/$(basename $f)
     done
 }
=20
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/a=
rmcompiler_6.16.bb b/meta-arm-toolchain/recipes-devtools/external-arm-too=
lchain/armcompiler_6.16.bb
index b630ebfe..e1d5cc38 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompi=
ler_6.16.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompi=
ler_6.16.bb
@@ -46,6 +46,6 @@ do_install() {
     install -d ${D}${bindir}
     # Symlink all executables into bindir
     for f in ${D}${datadir}/armclang/bin/*; do
-        lnr $f ${D}${bindir}/$(basename $f)
+        ln -rs $f ${D}${bindir}/$(basename $f)
     done
 }
diff --git a/meta-arm/recipes-devtools/fvp/fvp-common.inc b/meta-arm/reci=
pes-devtools/fvp/fvp-common.inc
index 83e03131..43c1b46f 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-common.inc
+++ b/meta-arm/recipes-devtools/fvp/fvp-common.inc
@@ -21,7 +21,7 @@ FVPDIR =3D "${libdir}/fvp/${BPN}"
 # Used in do_install to create symlinks in $bindir to $FVPDIR
 fvp_link_binaries() {
     for FVP in ${D}${FVPDIR}/models/${FVP_ARCH}/FVP_*; do
-        lnr $FVP ${D}${bindir}/$(basename $FVP)
+        ln -rs $FVP ${D}${bindir}/$(basename $FVP)
     done
     # But not the .so files too
     rm -f ${D}${bindir}/*.so
--=20
2.25.1


