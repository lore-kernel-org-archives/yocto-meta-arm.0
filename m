Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7236C433EF
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 14:00:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.12301.1636552820372400719
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Nov 2021 06:00:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AA94D6E
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Nov 2021 06:00:19 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B92F43F70D
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Nov 2021 06:00:18 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/hafnium: fix kernel tool linking
Date: Wed, 10 Nov 2021 14:00:15 +0000
Message-Id: <20211110140015.2370813-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Nov 2021 14:00:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2356

We need to be sure that the host linker flags are passed to the kernel
build, as otherwise it is possible that binaries are incorrectly linked.
For example:

HOSTCC scripts/extract-cert
ld: .../recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libcrypt=
o.so: undefined reference to `pthread_once@GLIBC_2.34'

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/hafnium/hafnium/host-ld.patch | 21 +++++++++++++++++++
 meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb   |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/hafnium/hafnium/host-ld.patch

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/host-ld.patch b/meta-ar=
m/recipes-bsp/hafnium/hafnium/host-ld.patch
new file mode 100644
index 00000000..8e7fee25
--- /dev/null
+++ b/meta-arm/recipes-bsp/hafnium/hafnium/host-ld.patch
@@ -0,0 +1,21 @@
+We need to be sure that the host linker flags are passed to the kernel b=
uild,
+as otherwise it is possible that binaries are incorrectly linked. For ex=
ample:
+
+HOSTCC scripts/extract-cert
+ld: .../recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libcryp=
to.so: undefined reference to `pthread_once@GLIBC_2.34'
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/build/linux/linux.gni b/build/linux/linux.gni
+index 65cc9df..19adbfb 100644
+--- a/build/linux/linux.gni
++++ b/build/linux/linux.gni
+@@ -69,6 +70,7 @@ template("linux_kernel") {
+     "GCC_TOOLCHAIN_DIR=3D" + rebase_path("//prebuilts/linux-x64/gcc/bin=
"),
+     "ARCH=3Darm64",
+     "CROSS_COMPILE=3Daarch64-linux-gnu-",
++    "HOSTLDFLAGS=3D" + getenv("BUILD_LDFLAGS"),
+=20
+     # Build out-of-tree in `target_out_dir`.
+     "O=3D" + rebase_path(target_out_dir),
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb b/meta-arm/recip=
es-bsp/hafnium/hafnium_2.5.bb
index dc248e48..fe24a904 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
@@ -11,6 +11,7 @@ inherit deploy python3native pkgconfig
=20
 SRC_URI =3D "gitsm://git.trustedfirmware.org/hafnium/hafnium.git;protoco=
l=3Dhttps \
            file://hashbang.patch \
+           file://host-ld.patch \
            file://pkg-config-native.patch \
            file://native-dtc.patch"
 SRCREV =3D "3a149eb219467c0d9336467ea1fb9d3fb65da94b"
--=20
2.25.1


