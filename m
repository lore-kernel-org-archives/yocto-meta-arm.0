Return-Path: <debbie.martin@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA9CAC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 05:47:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.936.1704692817188991406
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 07 Jan 2024 21:46:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: debbie.martin@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A17FCC15
	for <meta-arm@lists.yoctoproject.org>; Sun,  7 Jan 2024 21:47:42 -0800 (PST)
Received: from e127725.arm.com (unknown [10.57.74.190])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C99F3F64C
	for <meta-arm@lists.yoctoproject.org>; Sun,  7 Jan 2024 21:46:55 -0800 (PST)
From: Debbie Martin <Debbie.Martin@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-systemready: Add parted dependency and inherit testimage
Date: Mon,  8 Jan 2024 05:46:32 +0000
Message-Id: <20240108054633.1425680-1-Debbie.Martin@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 08 Jan 2024 05:47:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5318

Add the parted-native dependency explicitly which is needed to
use wic commands.

Also explicitly inherit testimage. This means that the kas config
is no longer required to include it in IMAGE_CLASSES.

Signed-off-by: Debbie Martin <Debbie.Martin@arm.com>
---
 kas/arm-systemready-ir-acs.yml                           | 5 -----
 meta-arm-systemready/classes/arm-systemready-acs.bbclass | 7 ++++---
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/kas/arm-systemready-ir-acs.yml b/kas/arm-systemready-ir-acs.=
yml
index 38604d7f..aef3e712 100644
--- a/kas/arm-systemready-ir-acs.yml
+++ b/kas/arm-systemready-ir-acs.yml
@@ -8,10 +8,5 @@ env:
   # The full testimage run typically takes around 12-24h on fvp-base.
   TEST_OVERALL_TIMEOUT: "${@ 24*60*60}"
=20
-local_conf_header:
-  systemready-ir-acs: |
-    IMAGE_CLASSES:append =3D " testimage"
-
-
 target:
   - arm-systemready-ir-acs
diff --git a/meta-arm-systemready/classes/arm-systemready-acs.bbclass b/m=
eta-arm-systemready/classes/arm-systemready-acs.bbclass
index e9888023..28e800c8 100644
--- a/meta-arm-systemready/classes/arm-systemready-acs.bbclass
+++ b/meta-arm-systemready/classes/arm-systemready-acs.bbclass
@@ -12,12 +12,11 @@
 INHIBIT_DEFAULT_DEPS =3D "1"
 COMPATIBLE_HOST =3D "aarch64-*"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-inherit nopackages deploy rootfs-postcommands ${IMAGE_CLASSES} python3na=
tive
+inherit nopackages deploy rootfs-postcommands ${IMAGE_CLASSES} python3na=
tive testimage
=20
 do_configure[noexec] =3D "1"
 do_compile[noexec] =3D "1"
 do_install[noexec] =3D "1"
-do_testimage[depends] +=3D "mtools-native:do_populate_sysroot"
=20
 # Deploy with this suffix so it is picked up in the machine configuratio=
n
 IMAGE_DEPLOY_SUFFIX ?=3D ".wic"
@@ -80,7 +79,9 @@ RM_WORK_EXCLUDE_ITEMS +=3D "${@ os.path.basename(d.getV=
ar('TEST_LOG_DIR')) }"
=20
 do_testimage[postfuncs] +=3D "acs_logs_handle"
 do_testimage[depends] +=3D "edk2-test-parser-native:do_populate_sysroot =
\
-                          arm-systemready-scripts-native:do_populate_sys=
root"
+                          arm-systemready-scripts-native:do_populate_sys=
root \
+                          mtools-native:do_populate_sysroot \
+                          parted-native:do_populate_sysroot"
=20
 # Process the logs
 python acs_logs_handle() {
--=20
2.25.1


