Return-Path: <rfairfax@microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B386C433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 19:09:16 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.11870.1642187355280200563
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 14 Jan 2022 11:09:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 spf-a.hotmail.com}: limit exceeded (domain:
 microsoft.com, ip: 13.77.154.182, mailfrom: rfairfax@microsoft.com)
Received: from localhost.localdomain (c-71-227-177-100.hsd1.wa.comcast.net
 [71.227.177.100])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6DF6120B802B
	for <meta-arm@lists.yoctoproject.org>; Fri, 14 Jan 2022 11:09:14 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6DF6120B802B
From: Ryan Fairfax <rfairfax@microsoft.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2 RESEND] arm/optee-os: Fix build race condition when
 building fTPM
Date: Fri, 14 Jan 2022 11:09:05 -0800
Message-Id: <20220114190905.7412-1-rfairfax@microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 14 Jan 2022 19:09:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2831

Change ftpm to install embeddable (stripped) version to sysroot.  When bu=
ilding optee-os pick up from sysroot instead of DEPLOY_DIR_IMAGE.  This f=
ixes a build race condition where DEPENDS was only waiting for optee-ftpm=
:do_populate_sysroot instead of do_deploy.

Signed-off-by: Ryan Fairfax <rfairfax@microsoft.com>
---
 meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb   | 6 +++++-
 meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb b/met=
a-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
index e30e13a..f2a74da 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
@@ -60,6 +60,7 @@ do_compile() {
 do_install () {
     mkdir -p ${D}/lib/optee_armtz
     install -D -p -m 0644 ${S}/TAs/optee_ta/out/fTPM/${FTPM_UUID}.ta ${D=
}/lib/optee_armtz/
+    install -D -p -m 0644 ${S}/TAs/optee_ta/out/fTPM/${FTPM_UUID}.stripp=
ed.elf ${D}/lib/optee_armtz/
 }
=20
 do_deploy () {
@@ -69,7 +70,10 @@ do_deploy () {
=20
 addtask deploy before do_build after do_install
=20
-FILES:${PN} +=3D "${nonarch_base_libdir}/optee_armtz/${FTPM_UUID}.ta"
+FILES:${PN} +=3D " \
+               ${nonarch_base_libdir}/optee_armtz/${FTPM_UUID}.ta \
+               ${nonarch_base_libdir}/optee_armtz/${FTPM_UUID}.stripped.=
elf \
+               "
=20
 # Imports machine specific configs from staging to build
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
diff --git a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend b/m=
eta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
index 0cfa949..acea750 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
+++ b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
@@ -9,6 +9,6 @@ DEPENDS:append =3D "\
=20
 EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', \
                       'optee-ftpm', \
-                      'CFG_EARLY_TA=3Dy EARLY_TA_PATHS=3D"${DEPLOY_DIR_I=
MAGE}/optee/${FTPM_UUID}.stripped.elf"', \
+                      'CFG_EARLY_TA=3Dy EARLY_TA_PATHS=3D"${STAGING_DIR_=
TARGET}/lib/optee_armtz/${FTPM_UUID}.stripped.elf"', \
                       '', \
                       d)} "
--=20
2.25.1


