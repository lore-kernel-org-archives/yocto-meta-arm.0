Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56239C48260
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 15:12:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.575.1706281958784407496
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Jan 2024 07:12:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EBACFEC
	for <meta-arm@lists.yoctoproject.org>; Fri, 26 Jan 2024 07:13:22 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B71DF3F73F
	for <meta-arm@lists.yoctoproject.org>; Fri, 26 Jan 2024 07:12:37 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/optee: update to 4.1
Date: Fri, 26 Jan 2024 10:12:35 -0500
Message-Id: <20240126151236.59981-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20240126151236.59981-1-jon.mason@arm.com>
References: <20240126151236.59981-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 26 Jan 2024 15:12:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5363

Add 4.1.0 recipes and move 4.0.0 to meta-arm-bsp for n1sdp

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |  3 +-
 meta-arm-bsp/conf/machine/n1sdp.conf          |  3 ++
 .../optee/optee-client_4.0.0.bb               |  0
 .../optee/optee-examples_4.0.0.bb             |  0
 ...bappend =3D> optee-os-tadevkit_4.%.bbappend} |  0
 .../optee/optee-os-tadevkit_4.0.0.bb          |  0
 .../0003-optee-enable-clang-support.patch     | 30 ++++++++++++++++
 ...s_4.0.0.bbappend =3D> optee-os_4.%.bbappend} |  0
 .../recipes-security/optee/optee-os_4.0.0.bb  |  0
 ...4.0.0.bbappend =3D> optee-test_4.%.bbappend} |  0
 .../optee/optee-test_4.0.0.bb                 |  0
 .../optee/optee-client_4.1.0.bb               |  7 ++++
 .../optee/optee-examples_4.1.0.bb             |  3 ++
 .../optee/optee-os-tadevkit_4.1.0.bb          | 29 ++++++++++++++++
 .../recipes-security/optee/optee-os_4.1.0.bb  | 10 ++++++
 ...stats-remove-unneeded-stat.h-include.patch | 34 +++++++++++++++++++
 .../optee/optee-test_4.1.0.bb                 | 12 +++++++
 17 files changed, 129 insertions(+), 2 deletions(-)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-client_=
4.0.0.bb (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-example=
s_4.0.0.bb (100%)
 rename meta-arm-bsp/recipes-security/optee/{optee-os-tadevkit_4.0.0.bbap=
pend =3D> optee-os-tadevkit_4.%.bbappend} (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os-tade=
vkit_4.0.0.bb (100%)
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os/0003-opt=
ee-enable-clang-support.patch
 rename meta-arm-bsp/recipes-security/optee/{optee-os_4.0.0.bbappend =3D>=
 optee-os_4.%.bbappend} (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os_4.0.=
0.bb (100%)
 rename meta-arm-bsp/recipes-security/optee/{optee-test_4.0.0.bbappend =3D=
> optee-test_4.%.bbappend} (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-test_4.=
0.0.bb (100%)
 create mode 100644 meta-arm/recipes-security/optee/optee-client_4.1.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-examples_4.1.0.=
bb
 create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_4.1=
.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-os_4.1.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-test/0001-xtest=
-stats-remove-unneeded-stat.h-include.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-test_4.1.0.bb

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index d03c23c09c7c..06b630a55cc9 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -37,8 +37,7 @@ UBOOT_ARCH =3D "arm"
 UBOOT_EXTLINUX =3D "0"
=20
 #optee
-PREFERRED_VERSION_optee-os ?=3D "4.0.%"
-PREFERRED_VERSION_optee-client ?=3D "3.22%"
+PREFERRED_VERSION_optee-os ?=3D "4.1.%"
 EXTRA_IMAGEDEPENDS +=3D "optee-os"
 OPTEE_ARCH =3D "arm64"
 OPTEE_BINARY =3D "tee-pager_v2.bin"
diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/mac=
hine/n1sdp.conf
index 79604cee9989..7e39e2f4ee53 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -38,6 +38,9 @@ PREFERRED_VERSION_edk2-firmware ?=3D "202305"
=20
 #optee
 PREFERRED_VERSION_optee-os ?=3D "4.0.%"
+PREFERRED_VERSION_optee-os-tadevkit ?=3D "4.0.%"
+PREFERRED_VERSION_optee-test ?=3D "4.0.%"
+PREFERRED_VERSION_optee-client ?=3D "4.0.%"
=20
 #grub-efi
 EFI_PROVIDER ?=3D "grub-efi"
diff --git a/meta-arm/recipes-security/optee/optee-client_4.0.0.bb b/meta=
-arm-bsp/recipes-security/optee/optee-client_4.0.0.bb
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-client_4.0.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-client_4.0.0.bb
diff --git a/meta-arm/recipes-security/optee/optee-examples_4.0.0.bb b/me=
ta-arm-bsp/recipes-security/optee/optee-examples_4.0.0.bb
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-examples_4.0.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-examples_4.0.0.bb
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.0.0.=
bbappend b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.%.bbap=
pend
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.0.0.b=
bappend
rename to meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.%.bbapp=
end
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.0.0.bb b=
/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.0.0.bb
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-tadevkit_4.0.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.0.0.bb
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os/0003-optee-enab=
le-clang-support.patch b/meta-arm-bsp/recipes-security/optee/optee-os/000=
3-optee-enable-clang-support.patch
new file mode 100644
index 000000000000..3c13ce3f028c
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-os/0003-optee-enable-clan=
g-support.patch
@@ -0,0 +1,30 @@
+From 59d4c190eae11c93b26cca5a7b005a17dadc8248 Mon Sep 17 00:00:00 2001
+From: Brett Warren <brett.warren@arm.com>
+Date: Wed, 23 Sep 2020 09:27:34 +0100
+Subject: [PATCH] optee: enable clang support
+
+When compiling with clang, the LIBGCC_LOCATE_CFLAG variable used
+to provide a sysroot wasn't included, which results in not locating
+compiler-rt. This is mitigated by including the variable as ammended.
+
+Upstream-Status: Pending
+ChangeId: 8ba69a4b2eb8ebaa047cb266c9aa6c2c3da45701
+Signed-off-by: Brett Warren <brett.warren@arm.com>
+
+---
+ mk/clang.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mk/clang.mk b/mk/clang.mk
+index a045beee8..1ebe2f702 100644
+--- a/mk/clang.mk
++++ b/mk/clang.mk
+@@ -30,7 +30,7 @@ comp-cflags-warns-clang :=3D -Wno-language-extension-t=
oken \
+=20
+ # Note, use the compiler runtime library (libclang_rt.builtins.*.a) ins=
tead of
+ # libgcc for clang
+-libgcc$(sm)	:=3D $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
++libgcc$(sm)	:=3D $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(a=
rch-bits-$(sm))) \
+ 			-rtlib=3Dcompiler-rt -print-libgcc-file-name 2> /dev/null)
+=20
+ # Core ASLR relies on the executable being ready to run from its prefer=
red load
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_4.0.0.bbappend =
b/meta-arm-bsp/recipes-security/optee/optee-os_4.%.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/optee-os_4.0.0.bbappend
rename to meta-arm-bsp/recipes-security/optee/optee-os_4.%.bbappend
diff --git a/meta-arm/recipes-security/optee/optee-os_4.0.0.bb b/meta-arm=
-bsp/recipes-security/optee/optee-os_4.0.0.bb
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os_4.0.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-os_4.0.0.bb
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_4.0.0.bbappen=
d b/meta-arm-bsp/recipes-security/optee/optee-test_4.%.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/optee-test_4.0.0.bbappend
rename to meta-arm-bsp/recipes-security/optee/optee-test_4.%.bbappend
diff --git a/meta-arm/recipes-security/optee/optee-test_4.0.0.bb b/meta-a=
rm-bsp/recipes-security/optee/optee-test_4.0.0.bb
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-test_4.0.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-test_4.0.0.bb
diff --git a/meta-arm/recipes-security/optee/optee-client_4.1.0.bb b/meta=
-arm/recipes-security/optee/optee-client_4.1.0.bb
new file mode 100644
index 000000000000..2f9567658262
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-client_4.1.0.bb
@@ -0,0 +1,7 @@
+require recipes-security/optee/optee-client.inc
+
+SRCREV =3D "f7e4ced15d1fefd073bbfc484fe0e1f74afe96c2"
+
+inherit pkgconfig
+DEPENDS +=3D "util-linux"
+EXTRA_OEMAKE +=3D "PKG_CONFIG=3Dpkg-config"
diff --git a/meta-arm/recipes-security/optee/optee-examples_4.1.0.bb b/me=
ta-arm/recipes-security/optee/optee-examples_4.1.0.bb
new file mode 100644
index 000000000000..f082a25d05c7
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-examples_4.1.0.bb
@@ -0,0 +1,3 @@
+require recipes-security/optee/optee-examples.inc
+
+SRCREV =3D "378dc0db2d5dd279f58a3b6cb3f78ffd6b165035"
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.1.0.bb b=
/meta-arm/recipes-security/optee/optee-os-tadevkit_4.1.0.bb
new file mode 100644
index 000000000000..961d52517929
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_4.1.0.bb
@@ -0,0 +1,29 @@
+require recipes-security/optee/optee-os_${PV}.bb
+
+SUMMARY =3D "OP-TEE Trusted OS TA devkit"
+DESCRIPTION =3D "OP-TEE TA devkit for build TAs"
+HOMEPAGE =3D "https://www.op-tee.org/"
+
+DEPENDS +=3D "python3-pycryptodome-native"
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
diff --git a/meta-arm/recipes-security/optee/optee-os_4.1.0.bb b/meta-arm=
/recipes-security/optee/optee-os_4.1.0.bb
new file mode 100644
index 000000000000..bfb61eb28b6e
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os_4.1.0.bb
@@ -0,0 +1,10 @@
+require recipes-security/optee/optee-os.inc
+
+DEPENDS +=3D "dtc-native"
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
+
+SRCREV =3D "18b424c23aa5a798dfe2e4d20b4bde3919dc4e99"
+SRC_URI +=3D " \
+    file://0003-optee-enable-clang-support.patch \
+   "
diff --git a/meta-arm/recipes-security/optee/optee-test/0001-xtest-stats-=
remove-unneeded-stat.h-include.patch b/meta-arm/recipes-security/optee/op=
tee-test/0001-xtest-stats-remove-unneeded-stat.h-include.patch
new file mode 100644
index 000000000000..581c6db3cc82
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test/0001-xtest-stats-remove-=
unneeded-stat.h-include.patch
@@ -0,0 +1,34 @@
+From 236ebb968a298fa5d461e734559ad8a13b667eb6 Mon Sep 17 00:00:00 2001
+From: Jon Mason <jon.mason@arm.com>
+Date: Wed, 24 Jan 2024 11:35:50 -0500
+Subject: [PATCH] xtest: stats: remove unneeded stat.h include
+
+Hack to work around musl compile error:
+
+| In file included from optee-test/4.1.0/recipe-sysroot/usr/include/sys/=
stat.h:23,
+|                  from optee-test/4.1.0/git/host/xtest/stats.c:17:
+| optee-test/4.1.0/recipe-sysroot/usr/include/bits/stat.h:17:26: error: =
expected identifier or '(' before '[' token
+|    17 |         unsigned __unused[2];
+|       |                          ^
+
+stat.h is not needed, since it is not being used in this file.  So
+removing it.
+
+Upstream-Status: Inappropriate [https://github.com/OP-TEE/optee_test/iss=
ues/722]
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+---
+ host/xtest/stats.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/host/xtest/stats.c b/host/xtest/stats.c
+index fb16d55586da..05aa3adac611 100644
+--- a/host/xtest/stats.c
++++ b/host/xtest/stats.c
+@@ -14,7 +14,6 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <sys/stat.h>
+ #include <sys/types.h>
+ #include <tee_client_api.h>
+ #include <unistd.h>
diff --git a/meta-arm/recipes-security/optee/optee-test_4.1.0.bb b/meta-a=
rm/recipes-security/optee/optee-test_4.1.0.bb
new file mode 100644
index 000000000000..1b124550b9d2
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test_4.1.0.bb
@@ -0,0 +1,12 @@
+require recipes-security/optee/optee-test.inc
+
+SRCREV =3D "2e1e7a9c9d659585566a75fc8802f4758c42bcb2"
+SRC_URI +=3D "file://0001-xtest-stats-remove-unneeded-stat.h-include.pat=
ch"
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
--=20
2.39.3 (Apple Git-145)


