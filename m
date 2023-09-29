Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B71E71D54
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 15:21:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20398.1696000892479104868
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Sep 2023 08:21:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EF401FB;
	Fri, 29 Sep 2023 08:22:10 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A93153F5A1;
	Fri, 29 Sep 2023 08:21:31 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 01/10] arm/apply_local_src_patches: allow use in multiple directories
Date: Fri, 29 Sep 2023 16:21:19 +0100
Message-Id: <20230929152128.3401009-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Sep 2023 15:21:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5081

From: Ross Burton <ross.burton@arm.com>

Pull out the patch application logic so the postfunc by default scans
for patches in LOCAL_SRC_PATCHES_INPUT_DIR and applies them to
LOCAL_SRC_PATCHES_DEST_DIR as before.

This allows recipes to inherit the class and directly call
apply_local_src_patches as needed to process patches in multiple
directories.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/classes/apply_local_src_patches.bbclass | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-arm/classes/apply_local_src_patches.bbclass b/meta-arm/=
classes/apply_local_src_patches.bbclass
index e1939353..0897b51b 100644
--- a/meta-arm/classes/apply_local_src_patches.bbclass
+++ b/meta-arm/classes/apply_local_src_patches.bbclass
@@ -17,8 +17,8 @@ python() {
=20
 apply_local_src_patches() {
=20
-    input_dir=3D"${LOCAL_SRC_PATCHES_INPUT_DIR}"
-    dest_dir=3D"${LOCAL_SRC_PATCHES_DEST_DIR}"
+    input_dir=3D"$1"
+    dest_dir=3D"$2"
=20
     if [ ! -d "$input_dir" ] ; then
         bbfatal "LOCAL_SRC_PATCHES_INPUT_DIR=3D$input_dir not found."
@@ -32,6 +32,7 @@ apply_local_src_patches() {
     export QUILT_PATCHES=3D./patches-extra
     mkdir -p patches-extra
=20
+    bbdebug 1 "Looking for patches in $input_dir"
     for patch in $(find $input_dir -type f -name *.patch -or -name *.dif=
f | sort)
     do
         patch_basename=3D`basename $patch`
@@ -45,4 +46,8 @@ apply_local_src_patches() {
         fi
     done
 }
-do_patch[postfuncs] +=3D "apply_local_src_patches"
+
+do_apply_local_src_patches() {
+    apply_local_src_patches "${LOCAL_SRC_PATCHES_INPUT_DIR}" "${LOCAL_SR=
C_PATCHES_DEST_DIR}"
+}
+do_patch[postfuncs] +=3D "do_apply_local_src_patches"
--=20
2.34.1


