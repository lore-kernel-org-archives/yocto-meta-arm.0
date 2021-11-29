Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68616C433EF
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 14:24:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.61399.1638195878713636629
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Nov 2021 06:24:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D77A1042
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 06:24:38 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED43B3F766
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 06:24:37 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm/hafnium: upgrade to 2.6
Date: Mon, 29 Nov 2021 14:24:31 +0000
Message-Id: <20211129142433.4019092-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 14:24:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2475

hashbang.patch isn't needed anymore, and rebase the other patches.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../hafnium/hafnium/hashbang.patch            | 34 ------------------
 .../recipes-bsp/hafnium/hafnium/host-ld.patch |  8 ++---
 .../hafnium/hafnium/pkg-config-native.patch   | 35 +++++++------------
 .../{hafnium_2.5.bb =3D> hafnium_2.6.bb}        |  3 +-
 4 files changed, 18 insertions(+), 62 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/hafnium/hafnium/hashbang.patch
 rename meta-arm/recipes-bsp/hafnium/{hafnium_2.5.bb =3D> hafnium_2.6.bb}=
 (95%)

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/hashbang.patch b/meta-a=
rm/recipes-bsp/hafnium/hafnium/hashbang.patch
deleted file mode 100644
index af77e7c7..00000000
--- a/meta-arm/recipes-bsp/hafnium/hafnium/hashbang.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Update Clang hashbangs to call python3 instead of python, as that doesn'=
t exist
-in our hosttools.
-
-Upstream-Status: Backport [partial, fixed upstream]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/linux-x64/clang/bin/clang b/prebuilts/linux-x64/clang/bin/c=
lang
-index 081cb20a..ce9cc267 100755
---- a/prebuilts/linux-x64/clang/bin/clang
-+++ b/prebuilts/linux-x64/clang/bin/clang
-@@ -1 +1 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
-diff --git a/prebuilts/linux-x64/clang/bin/clang++ b/prebuilts/linux-x64=
/clang/bin/clang++
-index 081cb20a..ce9cc267 100755
---- a/prebuilts/linux-x64/clang/bin/clang++
-+++ b/prebuilts/linux-x64/clang/bin/clang++
-@@ -1 +1 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
-diff --git a/prebuilts/linux-x64/clang/bin/clang-tidy b/prebuilts/linux-=
x64/clang/bin/clang-tidy
-index 081cb20a..ce9cc267 100755
---- a/prebuilts/linux-x64/clang/bin/clang-tidy
-+++ b/prebuilts/linux-x64/clang/bin/clang-tidy
-@@ -1 +1 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
-diff --git a/prebuilts/linux-x64/clang/bin/scan-view b/prebuilts/linux-x=
64/clang/bin/scan-view
-index 6165432e..07effbca 100755
---- a/prebuilts/linux-x64/clang/bin/scan-view
-+++ b/prebuilts/linux-x64/clang/bin/scan-view
-@@ -1 +1 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/host-ld.patch b/meta-ar=
m/recipes-bsp/hafnium/hafnium/host-ld.patch
index 8e7fee25..040d61b2 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium/host-ld.patch
+++ b/meta-arm/recipes-bsp/hafnium/hafnium/host-ld.patch
@@ -11,11 +11,11 @@ diff --git a/build/linux/linux.gni b/build/linux/linu=
x.gni
 index 65cc9df..19adbfb 100644
 --- a/build/linux/linux.gni
 +++ b/build/linux/linux.gni
-@@ -69,6 +70,7 @@ template("linux_kernel") {
-     "GCC_TOOLCHAIN_DIR=3D" + rebase_path("//prebuilts/linux-x64/gcc/bin=
"),
-     "ARCH=3Darm64",
+@@ -60,6 +60,7 @@ template("linux_kernel") {
+     "LLVM=3D1",
+     "LLVM_IAS=3D1",
      "CROSS_COMPILE=3Daarch64-linux-gnu-",
 +    "HOSTLDFLAGS=3D" + getenv("BUILD_LDFLAGS"),
-=20
+
      # Build out-of-tree in `target_out_dir`.
      "O=3D" + rebase_path(target_out_dir),
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/pkg-config-native.patch=
 b/meta-arm/recipes-bsp/hafnium/hafnium/pkg-config-native.patch
index 2dcf35aa..bc031956 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium/pkg-config-native.patch
+++ b/meta-arm/recipes-bsp/hafnium/hafnium/pkg-config-native.patch
@@ -1,29 +1,20 @@
-Use pkg-config-native to find the libssl headers. The bulk of this patch=
 is
-actually a backport from mainline Linux, but pkg-config changed to
-pkg-config-native.
+Use pkg-config-native to find the libssl headers.
=20
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
=20
 diff --git a/scripts/Makefile b/scripts/Makefile
-index 9adb6d247818..5fe371c7d7f5 100644
+index b4b7d8b58..26a5160ee 100644
 --- a/third_party/linux/scripts/Makefile
 +++ b/third_party/linux/scripts/Makefile
-@@ -21,10 +21,15 @@ hostprogs-$(CONFIG_MODULE_SIG_FORMAT) +=3D sign-file
- hostprogs-$(CONFIG_SYSTEM_TRUSTED_KEYRING) +=3D extract-cert
- hostprogs-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE) +=3D insert-sys-cert
-=20
-+CRYPTO_CFLAGS =3D $(shell pkg-config-native --cflags libcrypto)
-+CRYPTO_LIBS =3D $(shell pkg-config-native --libs libcrypto)
-+
- HOSTCFLAGS_sortextable.o =3D -I$(srctree)/tools/include
- HOSTCFLAGS_asn1_compiler.o =3D -I$(srctree)/include
--HOSTLDLIBS_sign-file =3D -lcrypto
--HOSTLDLIBS_extract-cert =3D -lcrypto
-+HOSTCFLAGS_sign-file.o =3D $(CRYPTO_CFLAGS)
-+HOSTLDLIBS_sign-file =3D $(CRYPTO_LIBS)
-+HOSTCFLAGS_extract-cert.o =3D $(CRYPTO_CFLAGS)
-+HOSTLDLIBS_extract-cert =3D $(CRYPTO_LIBS)
-=20
- always		:=3D $(hostprogs-y) $(hostprogs-m)
-=20
+@@ -10,8 +10,8 @@
+
+ HOST_EXTRACFLAGS +=3D -I$(srctree)/tools/include
+
+-CRYPTO_LIBS =3D $(shell pkg-config --libs libcrypto 2> /dev/null || ech=
o -lcrypto)
+-CRYPTO_CFLAGS =3D $(shell pkg-config --cflags libcrypto 2> /dev/null)
++CRYPTO_LIBS =3D $(shell pkg-config-native --libs libcrypto 2> /dev/null=
 || echo -lcrypto)
++CRYPTO_CFLAGS =3D $(shell pkg-config-native --cflags libcrypto 2> /dev/=
null)
+
+ hostprogs-$(CONFIG_BUILD_BIN2C)  +=3D bin2c
+ hostprogs-$(CONFIG_KALLSYMS)     +=3D kallsyms
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb b/meta-arm/recip=
es-bsp/hafnium/hafnium_2.6.bb
similarity index 95%
rename from meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
rename to meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb
index ad00f290..b9dc63bc 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb
@@ -10,11 +10,10 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 inherit deploy python3native pkgconfig
=20
 SRC_URI =3D "gitsm://git.trustedfirmware.org/hafnium/hafnium.git;protoco=
l=3Dhttps;branch=3Dmaster \
-           file://hashbang.patch \
            file://host-ld.patch \
            file://pkg-config-native.patch \
            file://native-dtc.patch"
-SRCREV =3D "3a149eb219467c0d9336467ea1fb9d3fb65da94b"
+SRCREV =3D "55b74f893948dd08d2782dd8fa9e903c143a6704"
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
--=20
2.25.1


