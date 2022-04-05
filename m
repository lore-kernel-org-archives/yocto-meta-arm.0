Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E3BC46467
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.6550.1649166493848027379
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 Apr 2022 06:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7A8E1474
	for <meta-arm@lists.yoctoproject.org>; Tue,  5 Apr 2022 06:48:12 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 577413F5A1
	for <meta-arm@lists.yoctoproject.org>; Tue,  5 Apr 2022 06:48:12 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-toolchain/external-arm-toolchain: install to
 libexecdir not datadir
Date: Tue,  5 Apr 2022 14:48:09 +0100
Message-Id: <20220405134810.1999000-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 05 Apr 2022 17:24:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3239

$datadir is for architecture-independent files, and a compiler is not
that.

Install to $libexecdir, and clean up the installation commands whilst
there.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../external-arm-toolchain/arm-binary-toolchain.inc      | 9 ++++-----
 .../external-arm-toolchain/armcompiler_6.17.bb           | 7 +++----
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/a=
rm-binary-toolchain.inc b/meta-arm-toolchain/recipes-devtools/external-ar=
m-toolchain/arm-binary-toolchain.inc
index da12a778..1fa4cd3e 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-bina=
ry-toolchain.inc
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-bina=
ry-toolchain.inc
@@ -1,16 +1,15 @@
 INHIBIT_DEFAULT_DEPS =3D "1"
=20
-FILES:${PN} =3D "${datadir} ${bindir}"
+FILES:${PN} =3D "${libexecdir} ${bindir}"
=20
 BINNAME =3D "${@d.getVar("BPN").strip("gcc-")}"
=20
 do_install() {
-    install -d ${D}${datadir}/${BINNAME}/
-    cp -r ${S}/. ${D}${datadir}/
+    install -d ${D}${bindir} ${D}${libexecdir}/${BPN}/
+    cp -r ${S}/. ${D}${libexecdir}/${BPN}
=20
-    install -d ${D}${bindir}
     # Symlink all executables into bindir
-    for f in ${D}${datadir}/bin/${BINNAME}-*; do
+    for f in ${D}${libexecdir}/${BPN}/bin/*; do
         ln -rs $f ${D}${bindir}/$(basename $f)
     done
 }
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/a=
rmcompiler_6.17.bb b/meta-arm-toolchain/recipes-devtools/external-arm-too=
lchain/armcompiler_6.17.bb
index 65a1f3a5..938dbc2c 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompi=
ler_6.17.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompi=
ler_6.17.bb
@@ -44,13 +44,12 @@ UPSTREAM_CHECK_REGEX =3D "Download Arm Compiler.*,(?P=
<pver>[\d\.]+)"
 S =3D "${WORKDIR}/${ARMCLANG_VERSION}"
=20
 do_install() {
-    install -d ${D}${datadir}/armclang/
+    install -d ${D}${bindir} ${D}${libexecdir}/${BPN}/
     # Commercial license flag set, so recipe will only install when expl=
icitly agreed to it already
-    ${S}/install_x86_64.sh --i-agree-to-the-contained-eula -d ${D}${data=
dir}/armclang/ --no-interactive
+    ${S}/install_x86_64.sh --i-agree-to-the-contained-eula -d ${D}${libe=
xecdir}/${BPN}/ --no-interactive
=20
-    install -d ${D}${bindir}
     # Symlink all executables into bindir
-    for f in ${D}${datadir}/armclang/bin/*; do
+    for f in ${D}${libexecdir}/${BPN}/bin/*; do
         ln -rs $f ${D}${bindir}/$(basename $f)
     done
 }
--=20
2.25.1


