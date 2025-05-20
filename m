Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9EC3C3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 17:28:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.27021.1747762088805431859
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 May 2025 10:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDC08152B;
	Tue, 20 May 2025 10:27:54 -0700 (PDT)
Received: from gyoszi01-yocto.budapest.arm.com (ubul2.budapest.arm.com [10.45.25.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D8D123F5A1;
	Tue, 20 May 2025 10:28:07 -0700 (PDT)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <gyorgy.szing@arm.com>
Subject: [PATCH 3/9] arm/trusted-services: add libpsats recipe
Date: Tue, 20 May 2025 19:27:41 +0200
Message-ID: <20250520172748.3439803-3-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520172748.3439803-1-gyorgy.szing@arm.com>
References: <20250520172748.3439803-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 May 2025 17:28:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6510

TS upstream introduced a new library which carries PSA clients. This
library is to be used by linux user-space applications interfacing to
PSA providers running in the SWd.

Modify dependee to use the new library.

Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
---
 .../trusted-services/libpsats_%.bbappend      |  1 +
 .../trusted-services/libpsats_git.bb          | 29 +++++++++++++++++++
 .../trusted-services/trusted-services.inc     |  2 +-
 .../trusted-services/ts-demo_git.bb           |  4 +--
 .../ts-psa-api-test-common_git.inc            |  4 +--
 5 files changed, 35 insertions(+), 5 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/libpsa=
ts_%.bbappend
 create mode 100644 meta-arm/recipes-security/trusted-services/libpsats_g=
it.bb

diff --git a/meta-arm-bsp/recipes-security/trusted-services/libpsats_%.bb=
append b/meta-arm-bsp/recipes-security/trusted-services/libpsats_%.bbappe=
nd
new file mode 100644
index 00000000..5c9ef210
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/libpsats_%.bbappend
@@ -0,0 +1 @@
+require ts-arm-platforms.inc
diff --git a/meta-arm/recipes-security/trusted-services/libpsats_git.bb b=
/meta-arm/recipes-security/trusted-services/libpsats_git.bb
new file mode 100644
index 00000000..06799e61
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/libpsats_git.bb
@@ -0,0 +1,29 @@
+DESCRIPTION =3D "Trusted Services libpsats library for the arm-linux env=
iroment. \
+               Libpsats carries psa client implementations to be used by=
 linux user-space applications."
+
+TS_ENV =3D "arm-linux"
+
+require trusted-services.inc
+
+OECMAKE_SOURCEPATH=3D"${S}/deployments/libpsats/${TS_ENV}"
+
+DEPENDS           +=3D "libts"
+
+do_install:append () {
+    # Move the dynamic libraries into the standard place.
+    install -d ${D}${libdir}
+    mv ${D}${TS_INSTALL}/lib/libpsats* ${D}${libdir}
+
+    # Update generated cmake file to use correct paths.
+    target_cmake=3D$(find ${D}${TS_INSTALL}/lib/cmake/libpsats -type f -=
iname "libpsatsTargets-*.cmake")
+    if [ ! -z "$target_cmake" ]; then
+        sed -i -e "s#/${TS_ENV}##g" $target_cmake
+    fi
+
+    # Remove files installed by libts too.=20
+    rm ${D}${TS_INSTALL}/include/util.h
+    rm ${D}${TS_INSTALL}/include/compiler.h
+}
+
+FILES:${PN} =3D "${libdir}/libpsats*.so.* ${nonarch_base_libdir}/udev/ru=
les.d/"
+FILES:${PN}-dev =3D "${TS_INSTALL}/lib/cmake ${TS_INSTALL}/include ${lib=
dir}/libpsats*.so"
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services.=
inc b/meta-arm/recipes-security/trusted-services/trusted-services.inc
index a35f93c0..2ba64af8 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services.inc
@@ -54,5 +54,5 @@ EXTRA_OECMAKE +=3D "${@get_ts_toolchain_option(d)}"
=20
 # Paths to pre-built dependencies required by some TS SPs/tools
 EXTRA_OECMAKE +=3D "-Dlibts_ROOT=3D${STAGING_DIR_HOST}${TS_INSTALL}/lib/=
cmake/libts/ \
-
+                  -Dlibpsats_ROOT=3D${STAGING_DIR_HOST}${TS_INSTALL}/lib=
/cmake/libpsats/ \
                  "
diff --git a/meta-arm/recipes-security/trusted-services/ts-demo_git.bb b/=
meta-arm/recipes-security/trusted-services/ts-demo_git.bb
index ddd3764e..2f6b9f45 100644
--- a/meta-arm/recipes-security/trusted-services/ts-demo_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-demo_git.bb
@@ -7,8 +7,8 @@ TS_ENV =3D "arm-linux"
 require trusted-services.inc
=20
 DEPENDS        +=3D "python3-jsonschema-native python3-jinja2-native"
-DEPENDS        +=3D "libts"
-RDEPENDS:${PN} +=3D "libts"
+DEPENDS        +=3D "libpsats"
+RDEPENDS:${PN} +=3D "libpsats"
=20
 OECMAKE_SOURCEPATH =3D "${S}/deployments/ts-demo/${TS_ENV}"
=20
diff --git a/meta-arm/recipes-security/trusted-services/ts-psa-api-test-c=
ommon_git.inc b/meta-arm/recipes-security/trusted-services/ts-psa-api-tes=
t-common_git.inc
index 93051bf3..e2f61feb 100644
--- a/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_g=
it.inc
+++ b/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_g=
it.inc
@@ -6,8 +6,8 @@ require trusted-services.inc
=20
 DEPENDS        +=3D "python3-jsonschema-native python3-jinja2-native"
=20
-DEPENDS        +=3D "libts"
-RDEPENDS:${PN} +=3D "libts"
+DEPENDS        +=3D "libpsats"
+RDEPENDS:${PN} +=3D "libpsats"
=20
 SRC_URI +=3D "git://github.com/ARM-software/psa-arch-tests.git;name=3Dps=
atest;protocol=3Dhttps;branch=3Dmain;destsuffix=3Dgit/psatest \
             file://0001-Pass-Yocto-build-settings-to-psa-arch-tests-nati=
ve.patch;patchdir=3D../psatest \
--=20
2.43.0


