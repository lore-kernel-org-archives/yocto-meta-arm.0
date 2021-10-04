Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05728C4321E
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 19:56:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.15407.1633377378265485511
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 04 Oct 2021 12:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 877511FB
	for <meta-arm@lists.yoctoproject.org>; Mon,  4 Oct 2021 12:56:18 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30A5A3F70D
	for <meta-arm@lists.yoctoproject.org>; Mon,  4 Oct 2021 12:56:18 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 7/8] arm/hafnium: use our gn/ninja/dtc
Date: Mon,  4 Oct 2021 20:56:11 +0100
Message-Id: <20211004195612.188487-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004195612.188487-1-ross.burton@arm.com>
References: <20211004195612.188487-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 04 Oct 2021 19:56:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2247

Instead of relying on the prebuilt GN/Ninja/dtc binaries that come with
Hafnium via the hafnium-prebuilts repository, use the recipes that we
build.

We still need to use the prebuilt compilers, but that is being worked
on upstream.

Change-Id: Ife4172d74f7877eaee3c4c414d7afda61332f220
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/hafnium/hafnium/native-dtc.patch   | 14 ++++++++++++++
 meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb        | 10 +++++++---
 2 files changed, 21 insertions(+), 3 deletions(-)
 create mode 100644 meta-arm/recipes-bsp/hafnium/hafnium/native-dtc.patch

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/native-dtc.patch b/meta=
-arm/recipes-bsp/hafnium/hafnium/native-dtc.patch
new file mode 100644
index 00000000..8cdb0601
--- /dev/null
+++ b/meta-arm/recipes-bsp/hafnium/hafnium/native-dtc.patch
@@ -0,0 +1,14 @@
+diff --git a/build/image/dtc.py b/build/image/dtc.py
+index d0778186..a5d831be 100755
+--- a/build/image/dtc.py
++++ b/build/image/dtc.py
+@@ -18,6 +18,9 @@ DTC_ROOT =3D os.path.join(HF_ROOT, "prebuilts", "linux=
-x64", "dtc")
+ DTC =3D os.path.join(DTC_ROOT, "dtc")
+ FDTOVERLAY =3D os.path.join(DTC_ROOT, "fdtoverlay")
+=20
++DTC =3D  "dtc"
++FDTOVERLAY =3D "fdtoverlay"
++
+ def cmd_compile(args):
+     exec_args =3D [
+             DTC,
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb b/meta-arm/recip=
es-bsp/hafnium/hafnium_2.5.bb
index 39aa14f9..dc248e48 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
@@ -1,5 +1,7 @@
 SUMMARY =3D "Hafnium"
 DESCRIPTION =3D "A reference Secure Partition Manager (SPM) for systems =
that implement the Armv8.4-A Secure-EL2 extension"
+DEPENDS =3D "gn-native ninja-native bison-native bc-native dtc-native op=
enssl-native"
+
 LICENSE =3D "BSD-3-Clause & GPLv2"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D782b40c14bad5294672c500501edc=
103"
=20
@@ -9,7 +11,8 @@ inherit deploy python3native pkgconfig
=20
 SRC_URI =3D "gitsm://git.trustedfirmware.org/hafnium/hafnium.git;protoco=
l=3Dhttps \
            file://hashbang.patch \
-           file://pkg-config-native.patch"
+           file://pkg-config-native.patch \
+           file://native-dtc.patch"
 SRCREV =3D "3a149eb219467c0d9336467ea1fb9d3fb65da94b"
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
@@ -26,13 +29,14 @@ HAFNIUM_PLATFORM ?=3D "invalid"
 # default to hafnium
 HAFNIUM_INSTALL_TARGET ?=3D "hafnium"
=20
-DEPENDS =3D "bison-native bc-native openssl-native"
-
 # set project to build
 EXTRA_OEMAKE +=3D "PROJECT=3D${HAFNIUM_PROJECT}"
=20
 EXTRA_OEMAKE +=3D "OUT_DIR=3D${B}"
=20
+# Don't use prebuilt binaries for gn and ninja
+EXTRA_OEMAKE +=3D "GN=3D${STAGING_BINDIR_NATIVE}/gn NINJA=3D${STAGING_BI=
NDIR_NATIVE}/ninja"
+
 do_configure[cleandirs] +=3D "${B}"
=20
 do_compile() {
--=20
2.25.1


