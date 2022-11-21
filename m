Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E955C4321E
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 15:44:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.41980.1669045438655544494
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Nov 2022 07:43:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3436923A;
	Mon, 21 Nov 2022 07:44:04 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8B8273F73B;
	Mon, 21 Nov 2022 07:43:57 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Adrian Herrera <adrian.herrera@arm.com>
Subject: [PATCH 2/7] atp: decouple m5readfile from m5ops
Date: Mon, 21 Nov 2022 10:43:47 -0500
Message-Id: <20221121154352.5061-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221121154352.5061-1-jon.mason@arm.com>
References: <20221121154352.5061-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Nov 2022 15:44:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4145

From: Adrian Herrera <adrian.herrera@arm.com>

By making m5readfile into its own recipe, we avoid modifications to the
m5ops recipe when using the meta-atp layer, which break the Yocto
compatibility of the layer.

Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
---
 meta-atp/conf/machine/gem5-atp-arm64.conf       |  4 ++--
 .../gem5/gem5-m5ops_20.bbappend                 | 14 --------------
 .../recipes-devtools/gem5/gem5-m5readfile.bb    | 17 +++++++++++++++++
 .../m5-readfile.sh                              |  2 +-
 4 files changed, 20 insertions(+), 17 deletions(-)
 delete mode 100644 meta-atp/recipes-devtools/gem5/gem5-m5ops_20.bbappend
 create mode 100644 meta-atp/recipes-devtools/gem5/gem5-m5readfile.bb
 rename meta-atp/recipes-devtools/gem5/{gem5-m5ops =3D> gem5-m5readfile}/=
m5-readfile.sh (65%)

diff --git a/meta-atp/conf/machine/gem5-atp-arm64.conf b/meta-atp/conf/ma=
chine/gem5-atp-arm64.conf
index d5fe22a7..4d0adac8 100644
--- a/meta-atp/conf/machine/gem5-atp-arm64.conf
+++ b/meta-atp/conf/machine/gem5-atp-arm64.conf
@@ -5,7 +5,7 @@ MACHINEOVERRIDES =3D. "gem5-arm64:"
 GEM5_RUN_PROFILE =3D "configs/baremetal_atp.py"
 # Require m5term
 EXTRA_IMAGEDEPENDS +=3D "gem5-m5term-native"
-# Require ATP kernel modules, user API and gem5 m5ops
-MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-module-atp atp-uapi gem5-m=
5ops"
+# Require ATP kernel modules, user API and gem5 m5readfile
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-module-atp atp-uapi gem5-m=
5readfile"
 # Optionally provide ATP kernel tests
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "atp-test"
diff --git a/meta-atp/recipes-devtools/gem5/gem5-m5ops_20.bbappend b/meta=
-atp/recipes-devtools/gem5/gem5-m5ops_20.bbappend
deleted file mode 100644
index 3ba0c3ca..00000000
--- a/meta-atp/recipes-devtools/gem5/gem5-m5ops_20.bbappend
+++ /dev/null
@@ -1,14 +0,0 @@
-inherit update-rc.d
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${BPN}:"
-
-# Add startup script calling m5 readfile for automatic checkpoint and re=
store
-SRC_URI +=3D "file://m5-readfile.sh"
-
-INITSCRIPT_NAME =3D "m5-readfile.sh"
-INITSCRIPT_PARAMS =3D "defaults 99"
-
-do_install:append() {
-    install -d ${D}/${INIT_D_DIR}
-    install -m 755 ${WORKDIR}/m5-readfile.sh ${D}/${INIT_D_DIR}
-}
diff --git a/meta-atp/recipes-devtools/gem5/gem5-m5readfile.bb b/meta-atp=
/recipes-devtools/gem5/gem5-m5readfile.bb
new file mode 100644
index 00000000..9cddc270
--- /dev/null
+++ b/meta-atp/recipes-devtools/gem5/gem5-m5readfile.bb
@@ -0,0 +1,17 @@
+inherit update-rc.d
+
+SUMMARY =3D "Enables reading any script at simulation launch time"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D55=
0794465ba0ec5312d6919e203a55f9"
+
+SRC_URI =3D "file://m5-readfile.sh"
+
+INITSCRIPT_NAME =3D "m5-readfile.sh"
+INITSCRIPT_PARAMS =3D "defaults 99"
+
+do_install() {
+    install -d ${D}/${INIT_D_DIR}
+    install -m 755 ${WORKDIR}/m5-readfile.sh ${D}/${INIT_D_DIR}
+}
+
+RDEPENDS:${PN} =3D "gem5-m5ops"
diff --git a/meta-atp/recipes-devtools/gem5/gem5-m5ops/m5-readfile.sh b/m=
eta-atp/recipes-devtools/gem5/gem5-m5readfile/m5-readfile.sh
similarity index 65%
rename from meta-atp/recipes-devtools/gem5/gem5-m5ops/m5-readfile.sh
rename to meta-atp/recipes-devtools/gem5/gem5-m5readfile/m5-readfile.sh
index 44477e96..edf79b84 100755
--- a/meta-atp/recipes-devtools/gem5/gem5-m5ops/m5-readfile.sh
+++ b/meta-atp/recipes-devtools/gem5/gem5-m5readfile/m5-readfile.sh
@@ -3,7 +3,7 @@
 # Provides:         m5-readfile
 # Required-Start:   $all
 # Default-Start:    5
-#=C2=A0Description:      Enables reading any script at simulation launch=
 time.
+# Description:      Enables reading any script at simulation launch time=
.
 ### END INIT INFO
=20
 m5 readfile | sh
--=20
2.17.1


