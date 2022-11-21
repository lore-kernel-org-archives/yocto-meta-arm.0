Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FA2C4332F
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 14:24:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.39597.1669040638012692219
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Nov 2022 06:23:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E24701FB;
	Mon, 21 Nov 2022 06:24:03 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.86.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A8593F73B;
	Mon, 21 Nov 2022 06:23:56 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Diego.Sueiro@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 1/2] arm/classes: Introduce apply_local_src_patches bbclass
Date: Mon, 21 Nov 2022 14:23:45 +0000
Message-Id: <20221121142346.1502347-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Nov 2022 14:24:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4140

From: Diego Sueiro <diego.sueiro@arm.com>

This class is to be inherited by recipes where there are patches located =
inside
the fetched source code which need to be applied.

The following variables need to be set:
LOCAL_SRC_PATCHES_INPUT_DIR is the directory from where the patches are l=
ocated
LOCAL_SRC_PATCHES_DEST_DIR is the directory where the patches will be app=
lied

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I8f9c16a5fbc9d5569cba60136560f1951408bd60
---
 .../classes/apply_local_src_patches.bbclass   | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 meta-arm/classes/apply_local_src_patches.bbclass

diff --git a/meta-arm/classes/apply_local_src_patches.bbclass b/meta-arm/=
classes/apply_local_src_patches.bbclass
new file mode 100644
index 00000000..daa85f4c
--- /dev/null
+++ b/meta-arm/classes/apply_local_src_patches.bbclass
@@ -0,0 +1,48 @@
+# This class is to be inherited by recipes where there are patches locat=
ed inside
+# the fetched source code which need to be applied.
+
+# The following variables need to be set:
+# LOCAL_SRC_PATCHES_INPUT_DIR is the directory from where the patches ar=
e located
+# LOCAL_SRC_PATCHES_DEST_DIR is the directory where the patches will be =
applied
+
+do_patch[depends] +=3D "quilt-native:do_populate_sysroot"
+
+LOCAL_SRC_PATCHES_INPUT_DIR ??=3D ""
+LOCAL_SRC_PATCHES_DEST_DIR ??=3D "${LOCAL_SRC_PATCHES_INPUT_DIR}"
+
+python() {
+    if not d.getVar('LOCAL_SRC_PATCHES_INPUT_DIR'):
+        bb.warn("LOCAL_SRC_PATCHES_INPUT_DIR variable needs to be set.")
+}
+
+apply_local_src_patches() {
+
+    input_dir=3D"${LOCAL_SRC_PATCHES_INPUT_DIR}"
+    dest_dir=3D"${LOCAL_SRC_PATCHES_DEST_DIR}"
+
+    if [ ! -d "$input_dir" ] ; then
+        bbfatal "LOCAL_SRC_PATCHES_INPUT_DIR=3D$input_dir not found."
+    fi
+
+    if [ ! -d "$dest_dir" ] ; then
+        bbfatal "LOCAL_SRC_PATCHES_DEST_DIR=3D$dest_dir not found."
+    fi
+
+    cd $dest_dir
+    export QUILT_PATCHES=3D./patches-extra
+    mkdir -p patches-extra
+
+    for patch in $(find $input_dir -type f -name *.patch -or -name *.dif=
f)
+    do
+        patch_basename=3D`basename $patch`
+        if ! quilt applied $patch_basename >/dev/null ; then
+            bbdebug 1 "Applying $patch_basename in $dest_dir."
+            echo $patch_basename >> patches-extra/series
+            cp $patch patches-extra
+            quilt push $patch_basename
+        else
+            bbdebug 1 "$patch_basename already applied."
+        fi
+    done
+}
+do_patch[postfuncs] +=3D "apply_local_src_patches"
--=20
2.25.1


