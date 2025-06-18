Return-Path: <clement.faure@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB5EBC71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 08:11:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2043.1750234260414248729
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 01:11:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: clement.faure@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CB3614BF;
	Wed, 18 Jun 2025 01:10:39 -0700 (PDT)
Received: from MGC575JXM4.arm.com (unknown [10.57.83.236])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 612073F66E;
	Wed, 18 Jun 2025 01:10:59 -0700 (PDT)
From: Clement Faure <clement.faure@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20Faure?= <clement.faure@arm.com>
Subject: [PATCH 3/3] arm/optee: remove 4.4.0
Date: Wed, 18 Jun 2025 10:10:47 +0200
Message-Id: <20250618081047.34990-4-clement.faure@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250618081047.34990-1-clement.faure@arm.com>
References: <20250618081047.34990-1-clement.faure@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Jun 2025 08:11:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6567

From: Cl=C3=A9ment Faure <clement.faure@arm.com>

Remove optee 4.4.0 recipes.

Signed-off-by: Cl=C3=A9ment Faure <clement.faure@arm.com>
---
 .../optee/optee-client_4.4.0.bb               |  9 ------
 .../optee/optee-examples_4.4.0.bb             |  4 ---
 .../optee/optee-os-tadevkit_4.4.0.bb          | 29 -------------------
 .../recipes-security/optee/optee-os_4.4.0.bb  | 11 -------
 .../optee/optee-test_4.4.0.bb                 | 16 ----------
 5 files changed, 69 deletions(-)
 delete mode 100644 meta-arm/recipes-security/optee/optee-client_4.4.0.bb
 delete mode 100644 meta-arm/recipes-security/optee/optee-examples_4.4.0.=
bb
 delete mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_4.4=
.0.bb
 delete mode 100644 meta-arm/recipes-security/optee/optee-os_4.4.0.bb
 delete mode 100644 meta-arm/recipes-security/optee/optee-test_4.4.0.bb

diff --git a/meta-arm/recipes-security/optee/optee-client_4.4.0.bb b/meta=
-arm/recipes-security/optee/optee-client_4.4.0.bb
deleted file mode 100644
index 8bd03868..00000000
--- a/meta-arm/recipes-security/optee/optee-client_4.4.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require recipes-security/optee/optee-client.inc
-
-# v4.4.0
-SRCREV =3D "d221676a58b305bddbf97db00395205b3038de8e"
-SRC_URI +=3D "file://0001-tee-supplicant-update-udev-systemd-install-cod=
e.patch"
-
-inherit pkgconfig
-DEPENDS +=3D "util-linux"
-EXTRA_OEMAKE +=3D "PKG_CONFIG=3Dpkg-config"
diff --git a/meta-arm/recipes-security/optee/optee-examples_4.4.0.bb b/me=
ta-arm/recipes-security/optee/optee-examples_4.4.0.bb
deleted file mode 100644
index 46f08384..00000000
--- a/meta-arm/recipes-security/optee/optee-examples_4.4.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require recipes-security/optee/optee-examples.inc
-
-# v4.4.0
-SRCREV =3D "378dc0db2d5dd279f58a3b6cb3f78ffd6b165035"
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.4.0.bb b=
/meta-arm/recipes-security/optee/optee-os-tadevkit_4.4.0.bb
deleted file mode 100644
index 961d5251..00000000
--- a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.4.0.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-require recipes-security/optee/optee-os_${PV}.bb
-
-SUMMARY =3D "OP-TEE Trusted OS TA devkit"
-DESCRIPTION =3D "OP-TEE TA devkit for build TAs"
-HOMEPAGE =3D "https://www.op-tee.org/"
-
-DEPENDS +=3D "python3-pycryptodome-native"
-
-do_install() {
-    #install TA devkit
-    install -d ${D}${includedir}/optee/export-user_ta/
-    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
-        cp -aR $f ${D}${includedir}/optee/export-user_ta/
-    done
-}
-
-do_deploy() {
-	echo "Do not inherit do_deploy from optee-os."
-}
-
-FILES:${PN} =3D "${includedir}/optee/"
-
-# Build paths are currently embedded
-INSANE_SKIP:${PN}-dev +=3D "buildpaths"
-
-# Include extra headers needed by SPMC tests to TA DEVKIT.
-# Supported after op-tee v3.20
-EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
-                                        ' CFG_SPMC_TESTS=3Dy', '' , d)}"
diff --git a/meta-arm/recipes-security/optee/optee-os_4.4.0.bb b/meta-arm=
/recipes-security/optee/optee-os_4.4.0.bb
deleted file mode 100644
index bd031ef7..00000000
--- a/meta-arm/recipes-security/optee/optee-os_4.4.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require recipes-security/optee/optee-os.inc
-
-DEPENDS +=3D "dtc-native"
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
-
-# v4.4.0
-SRCREV =3D "8f645256efc0dc66bd5c118778b0b50c44469ae1"
-SRC_URI +=3D " \
-    file://0003-optee-enable-clang-support.patch \
-   "
diff --git a/meta-arm/recipes-security/optee/optee-test_4.4.0.bb b/meta-a=
rm/recipes-security/optee/optee-test_4.4.0.bb
deleted file mode 100644
index 8b88865b..00000000
--- a/meta-arm/recipes-security/optee/optee-test_4.4.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require recipes-security/optee/optee-test.inc
-
-# v4.4.0
-SRCREV =3D "695231ef8987866663a9ed5afd8f77d1bae3dc08"
-
-LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Da8fa504109e4cd7ea575bc49ea=
4be560"
-
-SRC_URI +=3D "file://0001-build-make-cmake-add-Werror-based-on-CFG_WERRO=
R.patch"
-
-# Include ffa_spmc test group if the SPMC test is enabled.
-# Supported after op-tee v3.20
-EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
-                                        ' CFG_SPMC_TESTS=3Dy CFG_SECURE_=
PARTITION=3Dy', '' , d)}"
-
-RDEPENDS:${PN} +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee-spm=
c-test', \
-                                              ' arm-ffa-user', '' , d)}"

