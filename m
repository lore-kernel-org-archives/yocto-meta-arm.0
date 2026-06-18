Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA09FCD98F3
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 12:59:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19001.1781787563199463868
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jun 2026 05:59:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=pxcWnwkU;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27D082936
	for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jun 2026 05:59:18 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 576DF3F915
	for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jun 2026 05:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781787562; bh=+583qO433SsCrIYLN9H2wZltokqrJ+vED87BMrKEY0w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pxcWnwkUVHVnS3xEF+KMmFFG6AmDxEJ8z4jiccYu/28Qu9gTBbvs4FijBU33QUMD8
	 BjHh7QCIofrHslZc3GZYdvL4Qem8vQYurdE7glZWNdJ1V/2resAg2Y0TZ6Yo8G+uBx
	 nioNbr8nmpN0V9Emp/wsUL1VrEfbNxp70vkaamjk=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 7/7] arm/optee: update to 4.10.0
Date: Thu, 18 Jun 2026 08:59:18 -0400
Message-ID: <20260618125918.62619-7-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260618125918.62619-1-jon.mason@arm.com>
References: <20260618125918.62619-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Jun 2026 12:59:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7091

Update the recipes to 4.10.0 and update the git recipes to 4.10.0
Since corstone1000 is still using 4.9.0, move that to meta-arm-bsp

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../optee/optee-client_4.9.0.bb               |  0
 .../optee/optee-examples_4.9.0.bb             |  0
 .../optee/optee-os-tadevkit_4.9.0.bb          |  0
 .../recipes-security/optee/optee-os_4.9.0.bb  |  0
 .../optee/optee-test_4.9.0.bb                 |  0
 .../optee/optee-client_4.10.0.bb              |  4 +++
 .../optee/optee-client_git.bb                 |  2 +-
 .../optee/optee-examples_4.10.0.bb            |  4 +++
 .../optee/optee-examples_git.bb               |  4 +--
 .../optee/optee-os-tadevkit_4.10.0.bb         | 30 +++++++++++++++++++
 .../recipes-security/optee/optee-os_4.10.0.bb |  6 ++++
 .../recipes-security/optee/optee-os_git.bb    |  4 +--
 .../optee/optee-test_4.10.0.bb                | 17 +++++++++++
 .../recipes-security/optee/optee-test_git.bb  |  4 +--
 14 files changed, 68 insertions(+), 7 deletions(-)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-client_=
4.9.0.bb (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-example=
s_4.9.0.bb (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os-tade=
vkit_4.9.0.bb (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os_4.9.=
0.bb (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-test_4.=
9.0.bb (100%)
 create mode 100644 meta-arm/recipes-security/optee/optee-client_4.10.0.b=
b
 create mode 100644 meta-arm/recipes-security/optee/optee-examples_4.10.0=
.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_4.1=
0.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-os_4.10.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-test_4.10.0.bb

diff --git a/meta-arm/recipes-security/optee/optee-client_4.9.0.bb b/meta=
-arm-bsp/recipes-security/optee/optee-client_4.9.0.bb
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-client_4.9.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-client_4.9.0.bb
diff --git a/meta-arm/recipes-security/optee/optee-examples_4.9.0.bb b/me=
ta-arm-bsp/recipes-security/optee/optee-examples_4.9.0.bb
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-examples_4.9.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-examples_4.9.0.bb
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.9.0.bb b=
/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.9.0.bb
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-tadevkit_4.9.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.9.0.bb
diff --git a/meta-arm/recipes-security/optee/optee-os_4.9.0.bb b/meta-arm=
-bsp/recipes-security/optee/optee-os_4.9.0.bb
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os_4.9.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-os_4.9.0.bb
diff --git a/meta-arm/recipes-security/optee/optee-test_4.9.0.bb b/meta-a=
rm-bsp/recipes-security/optee/optee-test_4.9.0.bb
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-test_4.9.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-test_4.9.0.bb
diff --git a/meta-arm/recipes-security/optee/optee-client_4.10.0.bb b/met=
a-arm/recipes-security/optee/optee-client_4.10.0.bb
new file mode 100644
index 000000000000..8897529ed004
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-client_4.10.0.bb
@@ -0,0 +1,4 @@
+require recipes-security/optee/optee-client.inc
+
+# 4.9.0 and 4.10.0 share the same tag
+SRCREV =3D "9f5e90918093c1d1cd264d8149081b64ab7ba672"
diff --git a/meta-arm/recipes-security/optee/optee-client_git.bb b/meta-a=
rm/recipes-security/optee/optee-client_git.bb
index 24e2d1941299..884f3b5934c5 100644
--- a/meta-arm/recipes-security/optee/optee-client_git.bb
+++ b/meta-arm/recipes-security/optee/optee-client_git.bb
@@ -1,6 +1,6 @@
 require recipes-security/optee/optee-client.inc
=20
-# v4.9.0
+# v4.10.0
 SRCREV =3D "9f5e90918093c1d1cd264d8149081b64ab7ba672"
 PV .=3D "+git"
 UPSTREAM_CHECK_COMMITS =3D "1"
diff --git a/meta-arm/recipes-security/optee/optee-examples_4.10.0.bb b/m=
eta-arm/recipes-security/optee/optee-examples_4.10.0.bb
new file mode 100644
index 000000000000..15fddb79206d
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-examples_4.10.0.bb
@@ -0,0 +1,4 @@
+require recipes-security/optee/optee-examples.inc
+
+# v4.10.0
+SRCREV =3D "934c7edb74a26e90f68024cf441073528444177f"
diff --git a/meta-arm/recipes-security/optee/optee-examples_git.bb b/meta=
-arm/recipes-security/optee/optee-examples_git.bb
index 4fda635b72eb..d8d6d04308f1 100644
--- a/meta-arm/recipes-security/optee/optee-examples_git.bb
+++ b/meta-arm/recipes-security/optee/optee-examples_git.bb
@@ -1,7 +1,7 @@
 require recipes-security/optee/optee-examples.inc
=20
-# v4.8.0
-SRCREV =3D "3ef17eb1f309def91113637f95f67613b1d89119"
+# v4.10.0
+SRCREV =3D "934c7edb74a26e90f68024cf441073528444177f"
 PV .=3D "+git"
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.10.0.bb =
b/meta-arm/recipes-security/optee/optee-os-tadevkit_4.10.0.bb
new file mode 100644
index 000000000000..cca9f62abccf
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_4.10.0.bb
@@ -0,0 +1,30 @@
+require recipes-security/optee/optee-os_${PV}.bb
+
+SUMMARY =3D "OP-TEE Trusted OS TA devkit"
+DESCRIPTION =3D "OP-TEE TA devkit for build TAs"
+HOMEPAGE =3D "https://www.op-tee.org/"
+
+DEPENDS +=3D "python3-pycryptodome-native"
+DEPENDS:append:toolchain-clang =3D " lld-native"
+
+do_install() {
+    #install TA devkit
+    install -d ${D}${includedir}/optee/export-user_ta/
+    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
+        cp -aR $f ${D}${includedir}/optee/export-user_ta/
+    done
+}
+
+do_deploy() {
+	echo "Do not inherit do_deploy from optee-os."
+}
+
+FILES:${PN} =3D "${includedir}/optee/"
+
+# Build paths are currently embedded
+INSANE_SKIP:${PN}-dev +=3D "buildpaths"
+
+# Include extra headers needed by SPMC tests to TA DEVKIT.
+# Supported after op-tee v3.20
+EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
+                                        ' CFG_SPMC_TESTS=3Dy', '' , d)}"
diff --git a/meta-arm/recipes-security/optee/optee-os_4.10.0.bb b/meta-ar=
m/recipes-security/optee/optee-os_4.10.0.bb
new file mode 100644
index 000000000000..b4c6cccaa210
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os_4.10.0.bb
@@ -0,0 +1,6 @@
+require recipes-security/optee/optee-os.inc
+
+DEPENDS +=3D "dtc-native"
+
+# 4.10.0
+SRCREV =3D "753afbbee1682f5d16fd30e87b31058a4fd4f4b8"
diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/r=
ecipes-security/optee/optee-os_git.bb
index 03b0f1cc74fd..f2ae0d46d4dd 100644
--- a/meta-arm/recipes-security/optee/optee-os_git.bb
+++ b/meta-arm/recipes-security/optee/optee-os_git.bb
@@ -2,8 +2,8 @@ require recipes-security/optee/optee-os.inc
=20
 DEPENDS +=3D "dtc-native"
=20
-# v4.8.0
-SRCREV =3D "86660925433a8d4d1b19cfa5fe940081d77b34b4"
+# v4.10.0
+SRCREV =3D "753afbbee1682f5d16fd30e87b31058a4fd4f4b8"
 PV .=3D "+git"
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
diff --git a/meta-arm/recipes-security/optee/optee-test_4.10.0.bb b/meta-=
arm/recipes-security/optee/optee-test_4.10.0.bb
new file mode 100644
index 000000000000..f392a43e475c
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test_4.10.0.bb
@@ -0,0 +1,17 @@
+require recipes-security/optee/optee-test.inc
+
+# v4.10.0
+SRCREV =3D "88c93e87a5c172363ee986ded036a25cafcc9d2c"
+
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Da8fa504109e4cd7ea575bc49ea=
4be560 \
+                    file://LICENSE-BSD;md5=3Ddca16d6efa93b55d0fd662ae5cd=
6feeb \
+                    file://LICENSE-GPL;md5=3D10e86b5d2a6cb0e2b9dcfdd26a9=
ac58d \
+                   "
+
+# Include ffa_spmc test group if the SPMC test is enabled.
+# Supported after op-tee v3.20
+EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
+                                        ' CFG_SPMC_TESTS=3Dy CFG_SECURE_=
PARTITION=3Dy', '' , d)}"
+
+RDEPENDS:${PN} +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee-spm=
c-test', \
+                                              ' arm-ffa-user', '' , d)}"
diff --git a/meta-arm/recipes-security/optee/optee-test_git.bb b/meta-arm=
/recipes-security/optee/optee-test_git.bb
index 1d4ee44ea77d..a06c76c159e1 100644
--- a/meta-arm/recipes-security/optee/optee-test_git.bb
+++ b/meta-arm/recipes-security/optee/optee-test_git.bb
@@ -1,7 +1,7 @@
 require recipes-security/optee/optee-test.inc
=20
-# v4.8.0
-SRCREV =3D "6569cd7b13e1b37b37069e090d592adca7d3926d"
+# v4.10.0
+SRCREV =3D "88c93e87a5c172363ee986ded036a25cafcc9d2c"
 PV .=3D "+git"
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
--=20
2.50.1 (Apple Git-155)


