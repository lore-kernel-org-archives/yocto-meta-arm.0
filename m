Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A649C4167E
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 15:44:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.41818.1669045438853851818
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Nov 2022 07:43:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E476814BF;
	Mon, 21 Nov 2022 07:44:04 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 51B6C3F73B;
	Mon, 21 Nov 2022 07:43:58 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Adri=C3=A1n=20Herrera=20Arcila?= <adrian.herrera@arm.com>
Subject: [PATCH 5/7] atp: separate recipe for gem5 models
Date: Mon, 21 Nov 2022 10:43:50 -0500
Message-Id: <20221121154352.5061-5-jon.mason@arm.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4147

From: Adri=C3=A1n Herrera Arcila <adrian.herrera@arm.com>

Previously, meta-atp extended the original gem5 recipe to add the ATP
Engine models; the .bbappend was complex, because it pulled from two
sources, and it was not possible to make machine-based overrides, as it
is a native recipe.

To solve this, we use the recent EXTRAS feature to add the gem5 models
from a different recipe.

Signed-off-by: Adri=C3=A1n Herrera Arcila <adrian.herrera@arm.com>
---
 meta-atp/conf/machine/gem5-atp-arm64.conf     |  4 ++++
 meta-atp/documentation/gem5-atp-arm64.md      |  2 +-
 .../atp/atp-gem5-native_3.1.bb                | 24 +++++++++++++++++++
 .../atp-gem5}/start-gem5-atp.sh               |  0
 .../gem5/gem5-aarch64-native_20.bbappend      | 24 -------------------
 5 files changed, 29 insertions(+), 25 deletions(-)
 create mode 100644 meta-atp/recipes-devtools/atp/atp-gem5-native_3.1.bb
 rename meta-atp/recipes-devtools/{gem5/gem5-aarch64-native =3D> atp/atp-=
gem5}/start-gem5-atp.sh (100%)
 delete mode 100644 meta-atp/recipes-devtools/gem5/gem5-aarch64-native_20=
.bbappend

diff --git a/meta-atp/conf/machine/gem5-atp-arm64.conf b/meta-atp/conf/ma=
chine/gem5-atp-arm64.conf
index 4d0adac8..6e6d49a9 100644
--- a/meta-atp/conf/machine/gem5-atp-arm64.conf
+++ b/meta-atp/conf/machine/gem5-atp-arm64.conf
@@ -9,3 +9,7 @@ EXTRA_IMAGEDEPENDS +=3D "gem5-m5term-native"
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-module-atp atp-uapi gem5-m=
5readfile"
 # Optionally provide ATP kernel tests
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "atp-test"
+
+# Use ATP Engine gem5 models in gem5 build
+DEPENDS:append:pn-gem5-aarch64-native =3D " atp-gem5-native"
+GEM5_EXTRAS:pn-gem5-aarch64-native =3D "${STAGING_DATADIR_NATIVE}/atp"
diff --git a/meta-atp/documentation/gem5-atp-arm64.md b/meta-atp/document=
ation/gem5-atp-arm64.md
index 39f2f3b0..018f374c 100644
--- a/meta-atp/documentation/gem5-atp-arm64.md
+++ b/meta-atp/documentation/gem5-atp-arm64.md
@@ -13,7 +13,7 @@ The resulting gem5 native executable contains the AMBA =
ATP Engine. The resulting
 Users should run the environment as follows:
=20
 ```bash
-./tmp/deploy/tools/start-gem5-atp.sh
+oe-run-native atp-gem5-native start-gem5-atp.sh
 ```
=20
 This script launches a fast simulation to fast-forward Linux boot. Once =
Linux boot is completed, the fast simulation switches into a detailed sim=
ulation for the final usable environment. Users can connect and interact =
with the environment as follows:
diff --git a/meta-atp/recipes-devtools/atp/atp-gem5-native_3.1.bb b/meta-=
atp/recipes-devtools/atp/atp-gem5-native_3.1.bb
new file mode 100644
index 00000000..634c9b11
--- /dev/null
+++ b/meta-atp/recipes-devtools/atp/atp-gem5-native_3.1.bb
@@ -0,0 +1,24 @@
+require atp-source_3.1.inc
+inherit native
+
+SUMMARY =3D "AMBA ATP Engine gem5 models"
+
+S =3D "${WORKDIR}/git"
+SRC_URI =3D "${ATP_SRC} file://start-gem5-atp.sh"
+
+do_configure[noexec] =3D "1"
+do_compile[noexec] =3D "1"
+
+do_install() {
+    install -d ${D}${datadir}/gem5/configs ${D}${datadir}/atp ${D}${bind=
ir}
+
+    # baremetal_atp.py machine configuration and sample stream.atp file
+    install ${S}/gem5/baremetal_atp.py ${S}/configs/stream.atp ${D}${dat=
adir}/gem5/configs
+    #=C2=A0ATP Engine sources for gem5 to use
+    install ${S}/SConscript ${S}/*.hh ${S}/*.cc ${D}${datadir}/atp
+    cp -RL ${S}/gem5 ${S}/proto ${D}${datadir}/atp
+
+    install ${WORKDIR}/start-gem5-atp.sh ${D}${bindir}
+}
+
+addtask addto_recipe_sysroot after do_populate_sysroot before do_build
diff --git a/meta-atp/recipes-devtools/gem5/gem5-aarch64-native/start-gem=
5-atp.sh b/meta-atp/recipes-devtools/atp/atp-gem5/start-gem5-atp.sh
similarity index 100%
rename from meta-atp/recipes-devtools/gem5/gem5-aarch64-native/start-gem5=
-atp.sh
rename to meta-atp/recipes-devtools/atp/atp-gem5/start-gem5-atp.sh
diff --git a/meta-atp/recipes-devtools/gem5/gem5-aarch64-native_20.bbappe=
nd b/meta-atp/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend
deleted file mode 100644
index 6607f0f8..00000000
--- a/meta-atp/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend
+++ /dev/null
@@ -1,24 +0,0 @@
-require recipes-devtools/atp/atp-source_3.1.inc
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${BPN}:"
-
-SRC_URI +=3D "${ATP_SRC};destsuffix=3Dgit/atp;name=3Datp \
-            file://start-gem5-atp.sh"
-SRCREV_FORMAT =3D "gem5_atp"
-SRCREV_atp =3D "${ATP_REV}"
-LICENSE +=3D "& ${ATP_LIC}"
-LIC_FILES_CHKSUM +=3D "file://atp/LICENSE;md5=3D${ATP_LIC_MD5}"
-
-EXTRA_OESCONS +=3D "EXTRAS=3D${S}/atp"
-
-do_install:append() {
-    # baremetal_atp.py machine configuration and sample stream.atp file
-    install -m 644 ${B}/atp/gem5/baremetal_atp.py \
-                   ${B}/atp/configs/stream.atp \
-                   ${D}${datadir}/gem5/configs
-}
-
-do_deploy:append() {
-    # start-gem5-atp.sh launch script
-    install -m 755 ${WORKDIR}/start-gem5-atp.sh ${DEPLOYDIR}
-}
--=20
2.17.1


