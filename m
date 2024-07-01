Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7FF2C2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 13:11:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19299.1719839514495532054
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Jul 2024 06:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95655339
	for <meta-arm@lists.yoctoproject.org>; Mon,  1 Jul 2024 06:12:18 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 721553F766
	for <meta-arm@lists.yoctoproject.org>; Mon,  1 Jul 2024 06:11:53 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-systemready: WORKDIR to UNPACKDIR changes
Date: Mon,  1 Jul 2024 09:11:52 -0400
Message-Id: <20240701131152.5620-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 01 Jul 2024 13:11:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5855

Recent upstream changes to what is acceptable use of WORKDIR have broken
where the meta-arm-systemready recipes are expecting things to be.  Fix
them to point to the correct location.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../classes/arm-systemready-acs.bbclass                | 10 +++++-----
 .../arm-systemready-acs/arm-systemready-ir-acs.bb      |  2 ++
 .../arm-systemready-linux-distros.inc                  |  4 +++-
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta-arm-systemready/classes/arm-systemready-acs.bbclass b/m=
eta-arm-systemready/classes/arm-systemready-acs.bbclass
index 9dc3635dcdf4..d817b693215b 100644
--- a/meta-arm-systemready/classes/arm-systemready-acs.bbclass
+++ b/meta-arm-systemready/classes/arm-systemready-acs.bbclass
@@ -29,7 +29,7 @@ IMAGE_POSTPROCESS_COMMAND +=3D "write_image_test_data; =
"
 python do_deploy() {
     deploydir =3D d.getVar('DEPLOYDIR')
     suffix =3D d.getVar('IMAGE_DEPLOY_SUFFIX')
-    imgfile =3D os.path.join(d.getVar('WORKDIR'), d.getVar('IMAGE_FILENA=
ME'))
+    imgfile =3D os.path.join(d.getVar('UNPACKDIR'), d.getVar('IMAGE_FILE=
NAME'))
     deployfile =3D os.path.join(deploydir, d.getVar('IMAGE_NAME') + suff=
ix)
     linkfile =3D os.path.join(deploydir, d.getVar('IMAGE_LINK_NAME') + s=
uffix)
=20
@@ -47,14 +47,14 @@ python do_deploy() {
=20
     # Copy the report.txt to DEPLOYDIR
     # The machine-specific implementation can optionally put the report =
file in
-    # ${WORKDIR}/report.txt. If there is no such file present, use the t=
emplate.
-    workdir =3D d.getVar('WORKDIR')
-    report_file =3D os.path.join(workdir, "report.txt")
+    # ${UNPACKDIR}/report.txt. If there is no such file present, use the=
 template.
+    unpackdir =3D d.getVar('UNPACKDIR')
+    report_file =3D os.path.join(unpackdir, "report.txt")
     report_file_dest =3D os.path.join(deploydir, "report.txt")
     if os.path.exists(report_file):
         report_file_to_copy =3D report_file
     else:
-        report_file_to_copy =3D os.path.join(workdir, "systemready-ir-te=
mplate",
+        report_file_to_copy =3D os.path.join(unpackdir, "systemready-ir-=
template",
                                             "report.txt")
     shutil.copyfile(report_file_to_copy, report_file_dest)
=20
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-sy=
stemready-ir-acs.bb b/meta-arm-systemready/recipes-test/arm-systemready-a=
cs/arm-systemready-ir-acs.bb
index 41ac2f77598b..7a709af5e267 100644
--- a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-systemrea=
dy-ir-acs.bb
+++ b/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-systemrea=
dy-ir-acs.bb
@@ -58,4 +58,6 @@ SRC_URI[acs-img.sha256sum] =3D "ea52f84dab44bde97de3e2d=
2224d883acaae35724dd8e2bdfb
 # Revision pointing to v2023.04 tag
 SRCREV_sr-ir-template =3D "c714db178ddf72e5ae5017f15421095297d5bf0e"
=20
+S =3D "${WORKDIR}/sources-unpack"
+
 inherit arm-systemready-acs
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/arm-systemready-linux-distros.inc b/meta-arm-systemready/recipes-test=
/arm-systemready-linux-distros/arm-systemready-linux-distros.inc
index d80cf2373ec6..24dfc50a9b24 100644
--- a/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros.inc
+++ b/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros.inc
@@ -22,6 +22,8 @@ ARM_SYSTEMREADY_LINUX_DISTRO_ISO_IMAGE =3D \
 # Size of installation disk in MB
 ARM_SYSTEMREADY_LINUX_DISTRO_INSTALL_SIZE ?=3D "4096"
=20
+S =3D "${WORKDIR}/sources-unpack"
+
 do_image() {
     dd if=3D/dev/zero of=3D${WORKDIR}/${IMAGE_LINK_NAME}.wic \
         bs=3D1M count=3D${ARM_SYSTEMREADY_LINUX_DISTRO_INSTALL_SIZE} sta=
tus=3Dnone
@@ -29,7 +31,7 @@ do_image() {
=20
 do_deploy() {
     # Deploy the iso and installation target disk image to the deploy fo=
lder
-    install -m 644 ${WORKDIR}/${ISO_IMAGE_NAME}.iso ${DEPLOYDIR}
+    install -m 644 ${UNPACKDIR}/${ISO_IMAGE_NAME}.iso ${DEPLOYDIR}
     install -m 644 ${WORKDIR}/${IMAGE_LINK_NAME}.wic ${DEPLOYDIR}
 }
=20
--=20
2.39.3 (Apple Git-146)


