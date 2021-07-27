Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.3276.1627401650686665918
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 27 Jul 2021 09:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FDB131B
	for <meta-arm@lists.yoctoproject.org>; Tue, 27 Jul 2021 09:00:49 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F6DC3F70D
	for <meta-arm@lists.yoctoproject.org>; Tue, 27 Jul 2021 09:00:48 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/hafnium: use sysroot libcrypto
Date: Tue, 27 Jul 2021 17:00:46 +0100
Message-Id: <20210727160046.2566234-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hafnium's build of the kernel needs libssl-dev to be installed on the hos=
t.

Instead, DEPEND on openssl-native and patch the lookup to use pkg-config-=
native.

Change-Id: Id184865183cde487cacd73740a916166c2900a66
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../hafnium/hafnium/pkg-config-native.patch   | 29 +++++++++++++++++++
 meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb   |  5 ++--
 2 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm/recipes-bsp/hafnium/hafnium/pkg-config-nativ=
e.patch

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/pkg-config-native.patch=
 b/meta-arm/recipes-bsp/hafnium/hafnium/pkg-config-native.patch
new file mode 100644
index 0000000..2dcf35a
--- /dev/null
+++ b/meta-arm/recipes-bsp/hafnium/hafnium/pkg-config-native.patch
@@ -0,0 +1,29 @@
+Use pkg-config-native to find the libssl headers. The bulk of this patch=
 is
+actually a backport from mainline Linux, but pkg-config changed to
+pkg-config-native.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/scripts/Makefile b/scripts/Makefile
+index 9adb6d247818..5fe371c7d7f5 100644
+--- a/third_party/linux/scripts/Makefile
++++ b/third_party/linux/scripts/Makefile
+@@ -21,10 +21,15 @@ hostprogs-$(CONFIG_MODULE_SIG_FORMAT) +=3D sign-file
+ hostprogs-$(CONFIG_SYSTEM_TRUSTED_KEYRING) +=3D extract-cert
+ hostprogs-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE) +=3D insert-sys-cert
+=20
++CRYPTO_CFLAGS =3D $(shell pkg-config-native --cflags libcrypto)
++CRYPTO_LIBS =3D $(shell pkg-config-native --libs libcrypto)
++
+ HOSTCFLAGS_sortextable.o =3D -I$(srctree)/tools/include
+ HOSTCFLAGS_asn1_compiler.o =3D -I$(srctree)/include
+-HOSTLDLIBS_sign-file =3D -lcrypto
+-HOSTLDLIBS_extract-cert =3D -lcrypto
++HOSTCFLAGS_sign-file.o =3D $(CRYPTO_CFLAGS)
++HOSTLDLIBS_sign-file =3D $(CRYPTO_LIBS)
++HOSTCFLAGS_extract-cert.o =3D $(CRYPTO_CFLAGS)
++HOSTLDLIBS_extract-cert =3D $(CRYPTO_LIBS)
+=20
+ always		:=3D $(hostprogs-y) $(hostprogs-m)
+=20
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb b/meta-arm/recip=
es-bsp/hafnium/hafnium_2.5.bb
index 97e31e8..6d8bb3f 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
@@ -7,7 +7,8 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit deploy python3native
=20
-SRC_URI =3D "gitsm://git.trustedfirmware.org/hafnium/hafnium.git;protoco=
l=3Dhttps"
+SRC_URI =3D "gitsm://git.trustedfirmware.org/hafnium/hafnium.git;protoco=
l=3Dhttps \
+           file://pkg-config-native.patch"
 SRCREV =3D "3a149eb219467c0d9336467ea1fb9d3fb65da94b"
 S =3D "${WORKDIR}/git"
=20
@@ -27,7 +28,7 @@ HAFNIUM_BUILD_DIR_PLAT =3D "out/${HAFNIUM_PROJECT}/${HA=
FNIUM_PLATFORM}_clang"
 # default to hafnium
 HAFNIUM_INSTALL_TARGET ?=3D "hafnium"
=20
-DEPENDS =3D "bison-native bc-native"
+DEPENDS =3D "bison-native bc-native openssl-native"
=20
 # set project to build
 EXTRA_OEMAKE +=3D "PROJECT=3D${HAFNIUM_PROJECT}"
--=20
2.25.1

