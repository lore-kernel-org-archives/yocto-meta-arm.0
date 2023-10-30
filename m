Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC92C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 15:48:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.152760.1698680879308631479
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Oct 2023 08:47:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FF0A1007
	for <meta-arm@lists.yoctoproject.org>; Mon, 30 Oct 2023 08:48:40 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 91C983F738
	for <meta-arm@lists.yoctoproject.org>; Mon, 30 Oct 2023 08:47:58 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/optee: update to 4.0.0
Date: Mon, 30 Oct 2023 09:20:53 -0500
Message-Id: <20231030142053.3961926-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Oct 2023 15:48:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5188

Update the recipes and patches for OP-TEE 4.0.0.  Migrate the 3.22.0
recipe to meta-arm-bsp for corstone1000 and n1sdp.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../optee/optee-client_3.22.0.bb              |   2 +-
 .../optee/optee-examples_3.22.0.bb            |   2 +-
 ...ow-setting-sysroot-for-libgcc-lookup.patch |   0
 ...-Define-section-attributes-for-clang.patch |   0
 .../0003-optee-enable-clang-support.patch     |   0
 ...4-core-link-add-no-warn-rwx-segments.patch |   0
 .../optee/optee-os-tadevkit_3.22.0.bb         |   5 +
 .../recipes-security/optee/optee-os_3.22.0.bb |   2 +-
 .../optee/optee-os_3.22.0.bbappend            |   4 +-
 .../optee/optee-test_3.22.0.bb                |  18 ++
 .../optee/optee-client_4.0.0.bb               |   7 +
 .../optee/optee-examples_4.0.0.bb             |   3 +
 .../optee/optee-os-tadevkit_3.2%.bbappend     |   4 -
 .../optee/optee-os-tadevkit_4.0.0.bb          |  29 +++
 ...ow-setting-sysroot-for-libgcc-lookup.patch |  35 +++
 ...-Define-section-attributes-for-clang.patch | 241 ++++++++++++++++++
 .../0003-optee-enable-clang-support.patch     |  30 +++
 ...4-core-link-add-no-warn-rwx-segments.patch |  63 +++++
 ...os_3.2%.bbappend =3D> optee-os_4.%.bbappend} |   2 +-
 .../recipes-security/optee/optee-os_4.0.0.bb  |  13 +
 ..._1000-remove-unneeded-stat.h-include.patch |  34 ---
 .../optee/optee-test_3.22.0.bb                |  10 -
 .../optee/optee-test_4.%.bbappend             |   0
 ...test_3.2%.bbappend =3D> optee-test_4.0.0.bb} |   8 +
 24 files changed, 459 insertions(+), 53 deletions(-)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-client_=
3.22.0.bb (73%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-example=
s_3.22.0.bb (51%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os-3.22=
.0/0001-allow-setting-sysroot-for-libgcc-lookup.patch (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os-3.22=
.0/0002-core-Define-section-attributes-for-clang.patch (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os-3.22=
.0/0003-optee-enable-clang-support.patch (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os-3.22=
.0/0004-core-link-add-no-warn-rwx-segments.patch (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os-tade=
vkit_3.22.0.bb (70%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os_3.22=
.0.bb (89%)
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-test_3.22.0=
.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-client_4.0.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-examples_4.0.0.=
bb
 delete mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_3.2=
%.bbappend
 create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_4.0=
.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-os/0001-allow-s=
etting-sysroot-for-libgcc-lookup.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os/0002-core-De=
fine-section-attributes-for-clang.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os/0003-optee-e=
nable-clang-support.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os/0004-core-li=
nk-add-no-warn-rwx-segments.patch
 rename meta-arm/recipes-security/optee/{optee-os_3.2%.bbappend =3D> opte=
e-os_4.%.bbappend} (87%)
 create mode 100644 meta-arm/recipes-security/optee/optee-os_4.0.0.bb
 delete mode 100644 meta-arm/recipes-security/optee/optee-test/0001-xtest=
-regression_1000-remove-unneeded-stat.h-include.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-test_3.22.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-test_4.%.bbappe=
nd
 rename meta-arm/recipes-security/optee/{optee-test_3.2%.bbappend =3D> op=
tee-test_4.0.0.bb} (63%)

diff --git a/meta-arm/recipes-security/optee/optee-client_3.22.0.bb b/met=
a-arm-bsp/recipes-security/optee/optee-client_3.22.0.bb
similarity index 73%
rename from meta-arm/recipes-security/optee/optee-client_3.22.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-client_3.22.0.bb
index d0c75d0c..904c2565 100644
--- a/meta-arm/recipes-security/optee/optee-client_3.22.0.bb
+++ b/meta-arm-bsp/recipes-security/optee/optee-client_3.22.0.bb
@@ -1,4 +1,4 @@
-require optee-client.inc
+require recipes-security/optee/optee-client.inc
=20
 SRCREV =3D "8533e0e6329840ee96cf81b6453f257204227e6c"
=20
diff --git a/meta-arm/recipes-security/optee/optee-examples_3.22.0.bb b/m=
eta-arm-bsp/recipes-security/optee/optee-examples_3.22.0.bb
similarity index 51%
rename from meta-arm/recipes-security/optee/optee-examples_3.22.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-examples_3.22.0.bb
index 8322c513..f082a25d 100644
--- a/meta-arm/recipes-security/optee/optee-examples_3.22.0.bb
+++ b/meta-arm-bsp/recipes-security/optee/optee-examples_3.22.0.bb
@@ -1,3 +1,3 @@
-require optee-examples.inc
+require recipes-security/optee/optee-examples.inc
=20
 SRCREV =3D "378dc0db2d5dd279f58a3b6cb3f78ffd6b165035"
diff --git a/meta-arm/recipes-security/optee/optee-os-3.22.0/0001-allow-s=
etting-sysroot-for-libgcc-lookup.patch b/meta-arm-bsp/recipes-security/op=
tee/optee-os-3.22.0/0001-allow-setting-sysroot-for-libgcc-lookup.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-3.22.0/0001-allow-se=
tting-sysroot-for-libgcc-lookup.patch
rename to meta-arm-bsp/recipes-security/optee/optee-os-3.22.0/0001-allow-=
setting-sysroot-for-libgcc-lookup.patch
diff --git a/meta-arm/recipes-security/optee/optee-os-3.22.0/0002-core-De=
fine-section-attributes-for-clang.patch b/meta-arm-bsp/recipes-security/o=
ptee/optee-os-3.22.0/0002-core-Define-section-attributes-for-clang.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-3.22.0/0002-core-Def=
ine-section-attributes-for-clang.patch
rename to meta-arm-bsp/recipes-security/optee/optee-os-3.22.0/0002-core-D=
efine-section-attributes-for-clang.patch
diff --git a/meta-arm/recipes-security/optee/optee-os-3.22.0/0003-optee-e=
nable-clang-support.patch b/meta-arm-bsp/recipes-security/optee/optee-os-=
3.22.0/0003-optee-enable-clang-support.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-3.22.0/0003-optee-en=
able-clang-support.patch
rename to meta-arm-bsp/recipes-security/optee/optee-os-3.22.0/0003-optee-=
enable-clang-support.patch
diff --git a/meta-arm/recipes-security/optee/optee-os-3.22.0/0004-core-li=
nk-add-no-warn-rwx-segments.patch b/meta-arm-bsp/recipes-security/optee/o=
ptee-os-3.22.0/0004-core-link-add-no-warn-rwx-segments.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-3.22.0/0004-core-lin=
k-add-no-warn-rwx-segments.patch
rename to meta-arm-bsp/recipes-security/optee/optee-os-3.22.0/0004-core-l=
ink-add-no-warn-rwx-segments.patch
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.22.0.bb =
b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.22.0.bb
similarity index 70%
rename from meta-arm/recipes-security/optee/optee-os-tadevkit_3.22.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.22.0.bb
index 3d958168..44496164 100644
--- a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.22.0.bb
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.22.0.bb
@@ -22,3 +22,8 @@ FILES:${PN} =3D "${includedir}/optee/"
=20
 # Build paths are currently embedded
 INSANE_SKIP:${PN}-dev +=3D "buildpaths"
+
+# Include extra headers needed by SPMC tests to TA DEVKIT.
+# Supported after op-tee v3.20
+EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
+                                        ' CFG_SPMC_TESTS=3Dy', '' , d)}"
diff --git a/meta-arm/recipes-security/optee/optee-os_3.22.0.bb b/meta-ar=
m-bsp/recipes-security/optee/optee-os_3.22.0.bb
similarity index 89%
rename from meta-arm/recipes-security/optee/optee-os_3.22.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-os_3.22.0.bb
index eba2c037..e1220192 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.22.0.bb
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.22.0.bb
@@ -1,4 +1,4 @@
-require optee-os.inc
+require recipes-security/optee/optee-os.inc
=20
 DEPENDS +=3D "dtc-native"
=20
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.22.0.bbappend=
 b/meta-arm-bsp/recipes-security/optee/optee-os_3.22.0.bbappend
index b5493e5e..ee4ca17f 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_3.22.0.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.22.0.bbappend
@@ -1,5 +1,7 @@
-# Machine specific configurations
+# Include Trusted Services Secure Partitions
+require recipes-security/optee/optee-os-ts.inc
=20
+# Machine specific configurations
 MACHINE_OPTEE_OS_REQUIRE ?=3D ""
 MACHINE_OPTEE_OS_REQUIRE:corstone1000 =3D "optee-os-corstone1000-common.=
inc"
 MACHINE_OPTEE_OS_REQUIRE:n1sdp =3D "optee-os-n1sdp.inc"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_3.22.0.bb b/m=
eta-arm-bsp/recipes-security/optee/optee-test_3.22.0.bb
new file mode 100644
index 00000000..f1444a1d
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-test_3.22.0.bb
@@ -0,0 +1,18 @@
+require recipes-security/optee/optee-test.inc
+
+SRC_URI +=3D " \
+    file://0001-xtest-regression_1000-remove-unneeded-stat.h-include.pat=
ch \
+   "
+SRCREV =3D "a286b57f1721af215ace318d5807e63f40186df6"
+
+EXTRA_OEMAKE:append =3D " OPTEE_OPENSSL_EXPORT=3D${STAGING_INCDIR}"
+DEPENDS:append =3D " openssl"
+CFLAGS:append =3D " -Wno-error=3Ddeprecated-declarations"
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
diff --git a/meta-arm/recipes-security/optee/optee-client_4.0.0.bb b/meta=
-arm/recipes-security/optee/optee-client_4.0.0.bb
new file mode 100644
index 00000000..dc9577c2
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-client_4.0.0.bb
@@ -0,0 +1,7 @@
+require recipes-security/optee/optee-client.inc
+
+SRCREV =3D "acb0885c117e73cb6c5c9b1dd9054cb3f93507ee"
+
+inherit pkgconfig
+DEPENDS +=3D "util-linux"
+EXTRA_OEMAKE +=3D "PKG_CONFIG=3Dpkg-config"
diff --git a/meta-arm/recipes-security/optee/optee-examples_4.0.0.bb b/me=
ta-arm/recipes-security/optee/optee-examples_4.0.0.bb
new file mode 100644
index 00000000..f082a25d
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-examples_4.0.0.bb
@@ -0,0 +1,3 @@
+require recipes-security/optee/optee-examples.inc
+
+SRCREV =3D "378dc0db2d5dd279f58a3b6cb3f78ffd6b165035"
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.2%.bbapp=
end b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.2%.bbappend
deleted file mode 100644
index a9732e4c..00000000
--- a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.2%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-# Include extra headers needed by SPMC tests to TA DEVKIT.
-# Supported after op-tee v3.20
-EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
-                                        ' CFG_SPMC_TESTS=3Dy', '' , d)}"
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.0.0.bb b=
/meta-arm/recipes-security/optee/optee-os-tadevkit_4.0.0.bb
new file mode 100644
index 00000000..9fe2697e
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_4.0.0.bb
@@ -0,0 +1,29 @@
+require optee-os_4.0.0.bb
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
diff --git a/meta-arm/recipes-security/optee/optee-os/0001-allow-setting-=
sysroot-for-libgcc-lookup.patch b/meta-arm/recipes-security/optee/optee-o=
s/0001-allow-setting-sysroot-for-libgcc-lookup.patch
new file mode 100644
index 00000000..b060952c
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/0001-allow-setting-sysroot=
-for-libgcc-lookup.patch
@@ -0,0 +1,35 @@
+From d94ad6c6efb71f683b183e84919122bb6f3ac65d Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 26 May 2020 14:38:02 -0500
+Subject: [PATCH] allow setting sysroot for libgcc lookup
+
+Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS variable when sear=
ching
+for the compiler libraries as there's no easy way to reliably pass --sys=
root
+otherwise.
+
+Upstream-Status: Pending [https://github.com/OP-TEE/optee_os/issues/4188=
]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+---
+ mk/gcc.mk | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/mk/gcc.mk b/mk/gcc.mk
+index adc77a24f..81bfa78ad 100644
+--- a/mk/gcc.mk
++++ b/mk/gcc.mk
+@@ -13,11 +13,11 @@ nostdinc$(sm)	:=3D -nostdinc -isystem $(shell $(CC$(=
sm)) \
+ 			-print-file-name=3Dinclude 2> /dev/null)
+=20
+ # Get location of libgcc from gcc
+-libgcc$(sm)  	:=3D $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
++libgcc$(sm)  	:=3D $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$=
(arch-bits-$(sm))) \
+ 			-print-libgcc-file-name 2> /dev/null)
+-libstdc++$(sm)	:=3D $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $=
(comp-cxxflags$(sm)) \
++libstdc++$(sm)	:=3D $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFL=
AGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
+ 			-print-file-name=3Dlibstdc++.a 2> /dev/null)
+-libgcc_eh$(sm)	:=3D $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $=
(comp-cxxflags$(sm)) \
++libgcc_eh$(sm)	:=3D $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFL=
AGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
+ 			-print-file-name=3Dlibgcc_eh.a 2> /dev/null)
+=20
+ # Define these to something to discover accidental use
diff --git a/meta-arm/recipes-security/optee/optee-os/0002-core-Define-se=
ction-attributes-for-clang.patch b/meta-arm/recipes-security/optee/optee-=
os/0002-core-Define-section-attributes-for-clang.patch
new file mode 100644
index 00000000..64fa9e45
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/0002-core-Define-section-a=
ttributes-for-clang.patch
@@ -0,0 +1,241 @@
+From fc930e468045dda9eab4ebe6927cc322bb294f3b Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Wed, 21 Dec 2022 10:55:58 +0000
+Subject: [PATCH] core: Define section attributes for clang
+
+Clang's attribute section is not same as gcc, here we need to add flags
+to sections so they can be eventually collected by linker into final
+output segments. Only way to do so with clang is to use
+
+pragma clang section ...
+
+The behavious is described here [1], this allows us to define names bss
+sections. This was not an issue until clang-15 where LLD linker starts
+to detect the section flags before merging them and throws the following
+errors
+
+| ld.lld: error: section type mismatch for .nozi.kdata_page
+| >>> /mnt/b/yoe/master/build/tmp/work/qemuarm64-yoe-linux/optee-os-tade=
vkit/3.17.0-r0/build/core/arch/arm/kernel/thread.o:(.nozi.kdata_page): SH=
T_PROGBITS
+| >>> output section .nozi: SHT_NOBITS
+|
+| ld.lld: error: section type mismatch for .nozi.mmu.l2
+| >>> /mnt/b/yoe/master/build/tmp/work/qemuarm64-yoe-linux/optee-os-tade=
vkit/3.17.0-r0/build/core/arch/arm/mm/core_mmu_lpae.o:(.nozi.mmu.l2): SHT=
_PROGBITS
+| >>> output section .nozi: SHT_NOBITS
+
+These sections should be carrying SHT_NOBITS but so far it was not
+possible to do so, this patch tries to use clangs pragma to get this
+going and match the functionality with gcc.
+
+[1] https://intel.github.io/llvm-docs/clang/LanguageExtensions.html#spec=
ifying-section-names-for-global-objects-pragma-clang-section
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ core/arch/arm/kernel/thread.c    | 19 +++++++++++++++--
+ core/arch/arm/mm/core_mmu_lpae.c | 35 +++++++++++++++++++++++++++----
+ core/arch/arm/mm/core_mmu_v7.c   | 36 +++++++++++++++++++++++++++++---
+ core/kernel/thread.c             | 13 +++++++++++-
+ core/mm/pgt_cache.c              | 12 ++++++++++-
+ 5 files changed, 104 insertions(+), 11 deletions(-)
+
+diff --git a/core/arch/arm/kernel/thread.c b/core/arch/arm/kernel/thread=
.c
+index 66833b3a0..b3eb9cf9a 100644
+--- a/core/arch/arm/kernel/thread.c
++++ b/core/arch/arm/kernel/thread.c
+@@ -45,15 +45,30 @@ static size_t thread_user_kcode_size __nex_bss;
+ #if defined(CFG_CORE_UNMAP_CORE_AT_EL0) && \
+ 	defined(CFG_CORE_WORKAROUND_SPECTRE_BP_SEC) && defined(ARM64)
+ long thread_user_kdata_sp_offset __nex_bss;
++#ifdef __clang__
++#ifndef CFG_VIRTUALIZATION
++#pragma clang section bss=3D".nozi.kdata_page"
++#else
++#pragma clang section bss=3D".nex_nozi.kdata_page"
++#endif
++#endif
+ static uint8_t thread_user_kdata_page[
+ 	ROUNDUP(sizeof(struct thread_core_local) * CFG_TEE_CORE_NB_CORE,
+ 		SMALL_PAGE_SIZE)]
+ 	__aligned(SMALL_PAGE_SIZE)
++#ifndef __clang__
+ #ifndef CFG_NS_VIRTUALIZATION
+-	__section(".nozi.kdata_page");
++	__section(".nozi.kdata_page")
+ #else
+-	__section(".nex_nozi.kdata_page");
++	__section(".nex_nozi.kdata_page")
+ #endif
++#endif
++    ;
++#endif
++
++/* reset BSS section to default ( .bss ) */
++#ifdef __clang__
++#pragma clang section bss=3D""
+ #endif
+=20
+ #ifdef ARM32
+diff --git a/core/arch/arm/mm/core_mmu_lpae.c b/core/arch/arm/mm/core_mm=
u_lpae.c
+index 7e79f780a..ec4db9dc9 100644
+--- a/core/arch/arm/mm/core_mmu_lpae.c
++++ b/core/arch/arm/mm/core_mmu_lpae.c
+@@ -233,19 +233,46 @@ typedef uint16_t l1_idx_t;
+ typedef uint64_t base_xlat_tbls_t[CFG_TEE_CORE_NB_CORE][NUM_BASE_LEVEL_=
ENTRIES];
+ typedef uint64_t xlat_tbl_t[XLAT_TABLE_ENTRIES];
+=20
++#ifdef __clang__
++#pragma clang section bss=3D".nozi.mmu.base_table"
++#endif
+ static base_xlat_tbls_t base_xlation_table[NUM_BASE_TABLES]
+ 	__aligned(NUM_BASE_LEVEL_ENTRIES * XLAT_ENTRY_SIZE)
+-	__section(".nozi.mmu.base_table");
++#ifndef __clang__
++	__section(".nozi.mmu.base_table")
++#endif
++;
++#ifdef __clang__
++#pragma clang section bss=3D""
++#endif
+=20
++#ifdef __clang__
++#pragma clang section bss=3D".nozi.mmu.l2"
++#endif
+ static xlat_tbl_t xlat_tables[MAX_XLAT_TABLES]
+-	__aligned(XLAT_TABLE_SIZE) __section(".nozi.mmu.l2");
++	__aligned(XLAT_TABLE_SIZE)
++#ifndef __clang__
++	__section(".nozi.mmu.l2")
++#endif
++;
++#ifdef __clang__
++#pragma clang section bss=3D""
++#endif
+=20
+ #define XLAT_TABLES_SIZE	(sizeof(xlat_tbl_t) * MAX_XLAT_TABLES)
+=20
++#ifdef __clang__
++#pragma clang section bss=3D".nozi.mmu.l2"
++#endif
+ /* MMU L2 table for TAs, one for each thread */
+ static xlat_tbl_t xlat_tables_ul1[CFG_NUM_THREADS]
+-	__aligned(XLAT_TABLE_SIZE) __section(".nozi.mmu.l2");
+-
++#ifndef __clang__
++	__aligned(XLAT_TABLE_SIZE) __section(".nozi.mmu.l2")
++#endif
++;
++#ifdef __clang__
++#pragma clang section bss=3D""
++#endif
+ /*
+  * TAs page table entry inside a level 1 page table.
+  *
+diff --git a/core/arch/arm/mm/core_mmu_v7.c b/core/arch/arm/mm/core_mmu_=
v7.c
+index 61e703da8..1960c08ca 100644
+--- a/core/arch/arm/mm/core_mmu_v7.c
++++ b/core/arch/arm/mm/core_mmu_v7.c
+@@ -204,16 +204,46 @@ typedef uint32_t l1_xlat_tbl_t[NUM_L1_ENTRIES];
+ typedef uint32_t l2_xlat_tbl_t[NUM_L2_ENTRIES];
+ typedef uint32_t ul1_xlat_tbl_t[NUM_UL1_ENTRIES];
+=20
++#ifdef __clang__
++#pragma clang section bss=3D".nozi.mmu.l1"
++#endif
+ static l1_xlat_tbl_t main_mmu_l1_ttb
+-		__aligned(L1_ALIGNMENT) __section(".nozi.mmu.l1");
++		__aligned(L1_ALIGNMENT)
++#ifndef __clang__
++       __section(".nozi.mmu.l1")
++#endif
++;
++#ifdef __clang__
++#pragma clang section bss=3D""
++#endif
+=20
+ /* L2 MMU tables */
++#ifdef __clang__
++#pragma clang section bss=3D".nozi.mmu.l2"
++#endif
+ static l2_xlat_tbl_t main_mmu_l2_ttb[MAX_XLAT_TABLES]
+-		__aligned(L2_ALIGNMENT) __section(".nozi.mmu.l2");
++		__aligned(L2_ALIGNMENT)
++#ifndef __clang__
++       __section(".nozi.mmu.l2")
++#endif
++;
++#ifdef __clang__
++#pragma clang section bss=3D""
++#endif
+=20
+ /* MMU L1 table for TAs, one for each thread */
++#ifdef __clang__
++#pragma clang section bss=3D".nozi.mmu.ul1"
++#endif
+ static ul1_xlat_tbl_t main_mmu_ul1_ttb[CFG_NUM_THREADS]
+-		__aligned(UL1_ALIGNMENT) __section(".nozi.mmu.ul1");
++		__aligned(UL1_ALIGNMENT)
++#ifndef __clang__
++       __section(".nozi.mmu.ul1")
++#endif
++;
++#ifdef __clang__
++#pragma clang section bss=3D""
++#endif
+=20
+ struct mmu_partition {
+ 	l1_xlat_tbl_t *l1_table;
+diff --git a/core/kernel/thread.c b/core/kernel/thread.c
+index 2a1f22dce..5516b6771 100644
+--- a/core/kernel/thread.c
++++ b/core/kernel/thread.c
+@@ -39,13 +39,24 @@ static uint32_t end_canary_value =3D 0xababab00;
+ 	name[stack_num][sizeof(name[stack_num]) / sizeof(uint32_t) - 1]
+ #endif
+=20
++#define DO_PRAGMA(x) _Pragma (#x)
++
++#ifdef __clang__
++#define DECLARE_STACK(name, num_stacks, stack_size, linkage) \
++DO_PRAGMA (clang section bss=3D".nozi_stack." #name) \
++linkage uint32_t name[num_stacks] \
++		[ROUNDUP(stack_size + STACK_CANARY_SIZE + STACK_CHECK_EXTRA, \
++			 STACK_ALIGNMENT) / sizeof(uint32_t)] \
++		__attribute__((aligned(STACK_ALIGNMENT))); \
++DO_PRAGMA(clang section bss=3D"")
++#else
+ #define DECLARE_STACK(name, num_stacks, stack_size, linkage) \
+ linkage uint32_t name[num_stacks] \
+ 		[ROUNDUP(stack_size + STACK_CANARY_SIZE + STACK_CHECK_EXTRA, \
+ 			 STACK_ALIGNMENT) / sizeof(uint32_t)] \
+ 		__attribute__((section(".nozi_stack." # name), \
+ 			       aligned(STACK_ALIGNMENT)))
+-
++#endif
+ #define GET_STACK(stack) ((vaddr_t)(stack) + STACK_SIZE(stack))
+=20
+ DECLARE_STACK(stack_tmp, CFG_TEE_CORE_NB_CORE, STACK_TMP_SIZE,
+diff --git a/core/mm/pgt_cache.c b/core/mm/pgt_cache.c
+index 79553c6d2..b9efdf427 100644
+--- a/core/mm/pgt_cache.c
++++ b/core/mm/pgt_cache.c
+@@ -410,8 +410,18 @@ void pgt_init(void)
+ 	 * has a large alignment, while .bss has a small alignment. The curren=
t
+ 	 * link script is optimized for small alignment in .bss
+ 	 */
++#ifdef __clang__
++#pragma clang section bss=3D".nozi.mmu.l2"
++#endif
+ 	static uint8_t pgt_tables[PGT_CACHE_SIZE][PGT_SIZE]
+-			__aligned(PGT_SIZE) __section(".nozi.pgt_cache");
++			__aligned(PGT_SIZE)
++#ifndef __clang__
++			__section(".nozi.pgt_cache")
++#endif
++			;
++#ifdef __clang__
++#pragma clang section bss=3D""
++#endif
+ 	size_t n;
+=20
+ 	for (n =3D 0; n < ARRAY_SIZE(pgt_tables); n++) {
diff --git a/meta-arm/recipes-security/optee/optee-os/0003-optee-enable-c=
lang-support.patch b/meta-arm/recipes-security/optee/optee-os/0003-optee-=
enable-clang-support.patch
new file mode 100644
index 00000000..299a24ea
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/0003-optee-enable-clang-su=
pport.patch
@@ -0,0 +1,30 @@
+From b33de2f059f1394028a94ee9da081fa6644b50a2 Mon Sep 17 00:00:00 2001
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
diff --git a/meta-arm/recipes-security/optee/optee-os/0004-core-link-add-=
no-warn-rwx-segments.patch b/meta-arm/recipes-security/optee/optee-os/000=
4-core-link-add-no-warn-rwx-segments.patch
new file mode 100644
index 00000000..54b19efa
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/0004-core-link-add-no-warn=
-rwx-segments.patch
@@ -0,0 +1,63 @@
+From 024314135e8dfe40f26f63da55d0a1426f0a8691 Mon Sep 17 00:00:00 2001
+From: Jerome Forissier <jerome.forissier@linaro.org>
+Date: Fri, 5 Aug 2022 09:48:03 +0200
+Subject: [PATCH] core: link: add --no-warn-rwx-segments
+
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/5474]
+
+binutils ld.bfd generates one RWX LOAD segment by merging several sectio=
ns
+with mixed R/W/X attributes (.text, .rodata, .data). After version 2.38 =
it
+also warns by default when that happens [1], which breaks the build due =
to
+--fatal-warnings. The RWX segment is not a problem for the TEE core, sin=
ce
+that information is not used to set memory permissions. Therefore, silen=
ce
+the warning.
+
+Link: [1] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D=
ba951afb99912da01a6e8434126b8fac7aa75107
+Link: https://sourceware.org/bugzilla/show_bug.cgi?id=3D29448
+Reported-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
+Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
+Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
+
+---
+ core/arch/arm/kernel/link.mk | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
+index 49e9f4fa1..9e1cc172f 100644
+--- a/core/arch/arm/kernel/link.mk
++++ b/core/arch/arm/kernel/link.mk
+@@ -37,6 +37,7 @@ link-ldflags +=3D --sort-section=3Dalignment
+ link-ldflags +=3D --fatal-warnings
+ link-ldflags +=3D --gc-sections
+ link-ldflags +=3D $(link-ldflags-common)
++link-ldflags +=3D $(call ld-option,--no-warn-rwx-segments)
+=20
+ link-ldadd  =3D $(LDADD)
+ link-ldadd +=3D $(ldflags-external)
+@@ -61,6 +62,7 @@ link-script-cppflags :=3D \
+ 		$(cppflagscore))
+=20
+ ldargs-all_objs :=3D -T $(link-script-dummy) --no-check-sections \
++		   $(call ld-option,--no-warn-rwx-segments) \
+ 		   $(link-ldflags-common) \
+ 		   $(link-objs) $(link-ldadd) $(libgcccore)
+ cleanfiles +=3D $(link-out-dir)/all_objs.o
+@@ -75,7 +77,7 @@ $(link-out-dir)/unpaged_entries.txt: $(link-out-dir)/a=
ll_objs.o
+ 		$(AWK) '/ ____keep_pager/ { printf "-u%s ", $$3 }' > $@
+=20
+ unpaged-ldargs :=3D -T $(link-script-dummy) --no-check-sections --gc-se=
ctions \
+-		 $(link-ldflags-common)
++		 $(link-ldflags-common) $(call ld-option,--no-warn-rwx-segments)
+ unpaged-ldadd :=3D $(objs) $(link-ldadd) $(libgcccore)
+ cleanfiles +=3D $(link-out-dir)/unpaged.o
+ $(link-out-dir)/unpaged.o: $(link-out-dir)/unpaged_entries.txt
+@@ -104,7 +106,7 @@ $(link-out-dir)/init_entries.txt: $(link-out-dir)/al=
l_objs.o
+ 		$(AWK) '/ ____keep_init/ { printf "-u%s ", $$3 }' > $@
+=20
+ init-ldargs :=3D -T $(link-script-dummy) --no-check-sections --gc-secti=
ons \
+-	       $(link-ldflags-common)
++	       $(link-ldflags-common) $(call ld-option,--no-warn-rwx-segments)
+ init-ldadd :=3D $(link-objs-init) $(link-out-dir)/version.o  $(link-lda=
dd) \
+ 	      $(libgcccore)
+ cleanfiles +=3D $(link-out-dir)/init.o
diff --git a/meta-arm/recipes-security/optee/optee-os_3.2%.bbappend b/met=
a-arm/recipes-security/optee/optee-os_4.%.bbappend
similarity index 87%
rename from meta-arm/recipes-security/optee/optee-os_3.2%.bbappend
rename to meta-arm/recipes-security/optee/optee-os_4.%.bbappend
index 09650b9a..4f4a0006 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.2%.bbappend
+++ b/meta-arm/recipes-security/optee/optee-os_4.%.bbappend
@@ -1,5 +1,5 @@
 # Include Trusted Services Secure Partitions
-require optee-os-ts.inc
+require recipes-security/optee/optee-os-ts.inc
=20
 # Conditionally include platform specific Trusted Services related OPTEE=
 build parameters
 EXTRA_OEMAKE:append:qemuarm64-secureboot =3D "${@oe.utils.conditional('S=
P_PATHS', '', '', ' CFG_CORE_HEAP_SIZE=3D131072 CFG_TEE_BENCHMARK=3Dn CFG=
_TEE_CORE_LOG_LEVEL=3D4 CFG_CORE_SEL1_SPMC=3Dy ', d)}"
diff --git a/meta-arm/recipes-security/optee/optee-os_4.0.0.bb b/meta-arm=
/recipes-security/optee/optee-os_4.0.0.bb
new file mode 100644
index 00000000..10b16aa0
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os_4.0.0.bb
@@ -0,0 +1,13 @@
+require recipes-security/optee/optee-os.inc
+
+DEPENDS +=3D "dtc-native"
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
+
+SRCREV =3D "2a5b1d1232f582056184367fb58a425ac7478ec6"
+SRC_URI +=3D " \
+    file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
+    file://0002-core-Define-section-attributes-for-clang.patch \
+    file://0003-optee-enable-clang-support.patch \
+    file://0004-core-link-add-no-warn-rwx-segments.patch \
+   "
diff --git a/meta-arm/recipes-security/optee/optee-test/0001-xtest-regres=
sion_1000-remove-unneeded-stat.h-include.patch b/meta-arm/recipes-securit=
y/optee/optee-test/0001-xtest-regression_1000-remove-unneeded-stat.h-incl=
ude.patch
deleted file mode 100644
index 5e075d6f..00000000
--- a/meta-arm/recipes-security/optee/optee-test/0001-xtest-regression_10=
00-remove-unneeded-stat.h-include.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From ddd5ad19732c9a2a9fe236662a8d264c6b2b1a0a Mon Sep 17 00:00:00 2001
-From: Jon Mason <jon.mason@arm.com>
-Date: Sat, 15 Jul 2023 15:08:43 -0400
-Subject: [PATCH] xtest: regression_1000: remove unneeded stat.h include
-
-Hack to work around musl compile error:
- In file included from optee-test/3.17.0-r0/recipe-sysroot/usr/include/s=
ys/stat.h:23,
-                  from optee-test/3.17.0-r0/git/host/xtest/regression_10=
00.c:25:
- optee-test/3.17.0-r0/recipe-sysroot/usr/include/bits/stat.h:17:26: erro=
r: expected identifier or '(' before '[' token
-    17 |         unsigned __unused[2];
-       |                          ^
-
-stat.h is not needed, since it is not being used in this file.  So remov=
ing it.
-
-Upstream-Status: Backport [https://github.com/OP-TEE/optee_test/pull/688=
]
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-Reviewed-by: Jerome Forissier <jerome.forissier@linaro.org>
-Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
----
- host/xtest/regression_1000.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/host/xtest/regression_1000.c b/host/xtest/regression_1000.c
-index cd11f933ce43..8e338e59da21 100644
---- a/host/xtest/regression_1000.c
-+++ b/host/xtest/regression_1000.c
-@@ -24,7 +24,6 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
--#include <sys/stat.h>
- #include <sys/types.h>
- #include <ta_arm_bti.h>
- #include <ta_concurrent.h>
diff --git a/meta-arm/recipes-security/optee/optee-test_3.22.0.bb b/meta-=
arm/recipes-security/optee/optee-test_3.22.0.bb
deleted file mode 100644
index 5d3f5a8a..00000000
--- a/meta-arm/recipes-security/optee/optee-test_3.22.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require optee-test.inc
-
-SRC_URI +=3D " \
-    file://0001-xtest-regression_1000-remove-unneeded-stat.h-include.pat=
ch \
-   "
-SRCREV =3D "a286b57f1721af215ace318d5807e63f40186df6"
-
-EXTRA_OEMAKE:append =3D " OPTEE_OPENSSL_EXPORT=3D${STAGING_INCDIR}"
-DEPENDS:append =3D " openssl"
-CFLAGS:append =3D " -Wno-error=3Ddeprecated-declarations"
diff --git a/meta-arm/recipes-security/optee/optee-test_4.%.bbappend b/me=
ta-arm/recipes-security/optee/optee-test_4.%.bbappend
new file mode 100644
index 00000000..e69de29b
diff --git a/meta-arm/recipes-security/optee/optee-test_3.2%.bbappend b/m=
eta-arm/recipes-security/optee/optee-test_4.0.0.bb
similarity index 63%
rename from meta-arm/recipes-security/optee/optee-test_3.2%.bbappend
rename to meta-arm/recipes-security/optee/optee-test_4.0.0.bb
index c052774c..c5a473be 100644
--- a/meta-arm/recipes-security/optee/optee-test_3.2%.bbappend
+++ b/meta-arm/recipes-security/optee/optee-test_4.0.0.bb
@@ -1,3 +1,11 @@
+require recipes-security/optee/optee-test.inc
+
+SRCREV =3D "1c3d6be5eaa6174e3dbabf60928d15628e39b994"
+
+EXTRA_OEMAKE:append =3D " OPTEE_OPENSSL_EXPORT=3D${STAGING_INCDIR}"
+DEPENDS:append =3D " openssl"
+CFLAGS:append =3D " -Wno-error=3Ddeprecated-declarations"
+
 # Include ffa_spmc test group if the SPMC test is enabled.
 # Supported after op-tee v3.20
 EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
--=20
2.30.2


