Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A97C001B0
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 18:42:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.50555.1691779342838352203
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Aug 2023 11:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47AF7113E
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Aug 2023 11:43:04 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B33BC3F64C
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Aug 2023 11:42:21 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/trusted-firmware-a: update to 2.9.0
Date: Fri, 11 Aug 2023 13:42:17 -0500
Message-Id: <20230811184217.3627478-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Aug 2023 18:42:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4952

Update the trusted-firmware-a recipes to 2.9.0
Moving legacy recipes (2.8) for tc1 and corestone1000 to meta-arm-bsp

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |  2 +
 meta-arm-bsp/conf/machine/include/tc.inc      |  1 +
 .../files/add-spmc_manifest-for-qemu.patch    |  0
 ...01-Fix-FF-A-version-in-SPMC-manifest.patch | 11 +---
 ...1000-bl2-loads-fip-based-on-metadata.patch | 24 +++----
 ...emu-update-abi-between-spmd-and-spmc.patch |  0
 .../files/rwx-segments.patch                  |  0
 .../tf-a-tests-no-warn-rwx-segments.patch     |  0
 .../fiptool-native_2.8.6.bb                   |  0
 ...s_2.8.0.bbappend =3D> tf-a-tests_%.bbappend} |  0
 .../trusted-firmware-a/tf-a-tests_2.8.0.bb    |  0
 .../trusted-firmware-a-corstone1000.inc       |  9 ++-
 ...bbappend =3D> trusted-firmware-a_%.bbappend} |  0
 .../trusted-firmware-a_2.8.6.bb               |  2 +-
 .../0001-Add-spmc_manifest-for-qemu.patch     | 64 +++++++++++++++++++
 .../fiptool-native_2.9.0.bb                   | 33 ++++++++++
 .../trusted-firmware-a/tf-a-tests_2.9.0.bb    | 54 ++++++++++++++++
 .../trusted-firmware-a_2.9.0.bb               | 17 +++++
 18 files changed, 189 insertions(+), 28 deletions(-)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-bsp/trusted-firmware-a/files=
/add-spmc_manifest-for-qemu.patch (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-bsp/trusted-firmware-a/files=
/feat-qemu-update-abi-between-spmd-and-spmc.patch (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-bsp/trusted-firmware-a/files=
/rwx-segments.patch (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-bsp/trusted-firmware-a/files=
/tf-a-tests-no-warn-rwx-segments.patch (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-bsp/trusted-firmware-a/fipto=
ol-native_2.8.6.bb (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/{tf-a-tests_2.8.0.bba=
ppend =3D> tf-a-tests_%.bbappend} (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-bsp/trusted-firmware-a/tf-a-=
tests_2.8.0.bb (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2=
.8.%.bbappend =3D> trusted-firmware-a_%.bbappend} (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-bsp/trusted-firmware-a/trust=
ed-firmware-a_2.8.6.bb (92%)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0001-Ad=
d-spmc_manifest-for-qemu.patch
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/fiptool-nativ=
e_2.9.0.bb
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.=
9.0.bb
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_2.9.0.bb

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index aeb1411a..697d81fe 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -5,6 +5,8 @@ MACHINEOVERRIDES =3D. "corstone1000:"
 # TF-A
 TFA_PLATFORM =3D "corstone1000"
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.8.%"
+PREFERRED_VERSION_tf-a-tests ?=3D "2.8.%"
=20
 TFA_BL2_BINARY =3D "bl2-corstone1000.bin"
 TFA_FIP_BINARY =3D "fip-corstone1000.bin"
diff --git a/meta-arm-bsp/conf/machine/include/tc.inc b/meta-arm-bsp/conf=
/machine/include/tc.inc
index f6674ba4..b5e54606 100644
--- a/meta-arm-bsp/conf/machine/include/tc.inc
+++ b/meta-arm-bsp/conf/machine/include/tc.inc
@@ -30,6 +30,7 @@ IMAGE_NAME_SUFFIX =3D ""
 SERIAL_CONSOLES =3D "115200;ttyAMA0"
=20
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a optee-os"
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.8.%"
 # FIXME - there is signed image dependency/race with testimage.
 # This should be fixed in oe-core
 TESTIMAGEDEPENDS:append =3D " virtual/kernel:do_deploy"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/add-spmc_manif=
est-for-qemu.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/ad=
d-spmc_manifest-for-qemu.patch
similarity index 100%
rename from meta-arm/recipes-bsp/trusted-firmware-a/files/add-spmc_manife=
st-for-qemu.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/add-spmc_mani=
fest-for-qemu.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0001-Fix-FF-A-version-in-SPMC-manifest.patch b/meta-arm-bsp/recipes-bs=
p/trusted-firmware-a/files/corstone1000/0001-Fix-FF-A-version-in-SPMC-man=
ifest.patch
index 016de8d3..6d5114e1 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0001=
-Fix-FF-A-version-in-SPMC-manifest.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0001=
-Fix-FF-A-version-in-SPMC-manifest.patch
@@ -1,7 +1,4 @@
-Upstream-Status: Inappropriate
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-From a31aee0988ef64724ec5866f10709f51f8cb3237 Mon Sep 17 00:00:00 2001
+From adaa22bc2f529bb34e9d4fe89ff5c65f0c83ca0c Mon Sep 17 00:00:00 2001
 From: emeara01 <emekcan.aras@arm.com>
 Date: Wed, 11 May 2022 14:37:06 +0100
 Subject: [PATCH] Fix FF-A version in SPMC manifest
@@ -11,13 +8,14 @@ This commit corrects the FF-A version in corstone1000_=
spmc_manifest.dts.
 This patch will not be upstreamed and will be dropped once
 OPTEE version is updated for Corstone1000.
=20
+Upstream-Status: Inappropriate
 Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
 ---
  .../corstone1000/common/fdts/corstone1000_spmc_manifest.dts     | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/plat/arm/board/corstone1000/common/fdts/corstone1000_spmc_m=
anifest.dts b/plat/arm/board/corstone1000/common/fdts/corstone1000_spmc_m=
anifest.dts
-index 8e49ab83f..5baa1b115 100644
+index 8e49ab83f76a..5baa1b115b2e 100644
 --- a/plat/arm/board/corstone1000/common/fdts/corstone1000_spmc_manifest=
.dts
 +++ b/plat/arm/board/corstone1000/common/fdts/corstone1000_spmc_manifest=
.dts
 @@ -20,7 +20,7 @@
@@ -29,6 +27,3 @@ index 8e49ab83f..5baa1b115 100644
  		exec_state =3D <0x0>;
  		load_address =3D <0x0 0x2002000>;
  		entrypoint =3D <0x0 0x2002000>;
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0002-feat-corstone1000-bl2-loads-fip-based-on-metadata.patch b/meta-ar=
m-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002-feat-corston=
e1000-bl2-loads-fip-based-on-metadata.patch
index d834e95b..e26fd34e 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002=
-feat-corstone1000-bl2-loads-fip-based-on-metadata.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002=
-feat-corstone1000-bl2-loads-fip-based-on-metadata.patch
@@ -1,4 +1,4 @@
-From 360aa32846a97e775750e06865d462c6258179fa Mon Sep 17 00:00:00 2001
+From fa7ab9b40babee29d2aadb267dfce7a96f8989d4 Mon Sep 17 00:00:00 2001
 From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
 Date: Mon, 9 Jan 2023 13:59:06 +0000
 Subject: [PATCH] feat(corstone1000): bl2 loads fip based on metadata
@@ -15,7 +15,6 @@ image starts at fip partition + fip signature area size=
.
=20
 Upstream-Status: Pending
 Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-
 ---
  bl2/bl2_main.c                                |  4 +++
  .../corstone1000/common/corstone1000_plat.c   | 32 ++++++-------------
@@ -25,10 +24,10 @@ Signed-off-by: Mohamed Omar Asaker <mohamed.omarasake=
r@arm.com>
  5 files changed, 24 insertions(+), 32 deletions(-)
=20
 diff --git a/bl2/bl2_main.c b/bl2/bl2_main.c
-index 5da803795..f25dc3029 100644
+index ce83692e0ebc..1a9febc007b2 100644
 --- a/bl2/bl2_main.c
 +++ b/bl2/bl2_main.c
-@@ -86,6 +86,10 @@ void bl2_main(void)
+@@ -87,6 +87,10 @@ void bl2_main(void)
  	/* Perform remaining generic architectural setup in S-EL1 */
  	bl2_arch_setup();
 =20
@@ -40,7 +39,7 @@ index 5da803795..f25dc3029 100644
  	fwu_init();
  #endif /* PSA_FWU_SUPPORT */
 diff --git a/plat/arm/board/corstone1000/common/corstone1000_plat.c b/pl=
at/arm/board/corstone1000/common/corstone1000_plat.c
-index 0235f8b84..7f9708a82 100644
+index 0235f8b8474c..7f9708a82489 100644
 --- a/plat/arm/board/corstone1000/common/corstone1000_plat.c
 +++ b/plat/arm/board/corstone1000/common/corstone1000_plat.c
 @@ -33,36 +33,17 @@ const mmap_region_t plat_arm_mmap[] =3D {
@@ -98,7 +97,7 @@ index 0235f8b84..7f9708a82 100644
   * is no power control present
   */
 diff --git a/plat/arm/board/corstone1000/common/include/platform_def.h b=
/plat/arm/board/corstone1000/common/include/platform_def.h
-index 584d485f3..0bfab05a4 100644
+index 584d485f3ea7..0bfab05a482b 100644
 --- a/plat/arm/board/corstone1000/common/include/platform_def.h
 +++ b/plat/arm/board/corstone1000/common/include/platform_def.h
 @@ -173,16 +173,16 @@
@@ -125,10 +124,10 @@ index 584d485f3..0bfab05a4 100644
  /*
   * Some data must be aligned on the biggest cache line size in the plat=
form.
 diff --git a/tools/cert_create/Makefile b/tools/cert_create/Makefile
-index ca548b836..32b5486a0 100644
+index 042e844626bd..45b76a022f91 100644
 --- a/tools/cert_create/Makefile
 +++ b/tools/cert_create/Makefile
-@@ -69,8 +69,8 @@ INC_DIR +=3D -I ./include -I ${PLAT_INCLUDE} -I ${OPEN=
SSL_DIR}/include
+@@ -78,8 +78,8 @@ INC_DIR +=3D -I ./include -I ${PLAT_INCLUDE} -I ${OPEN=
SSL_DIR}/include
  # directory. However, for a local build of OpenSSL, the built binaries =
are
  # located under the main project directory (i.e.: ${OPENSSL_DIR}, not
  # ${OPENSSL_DIR}/lib/).
@@ -140,10 +139,10 @@ index ca548b836..32b5486a0 100644
  HOSTCC ?=3D gcc
 =20
 diff --git a/tools/fiptool/Makefile b/tools/fiptool/Makefile
-index e6aeba95b..7c047479e 100644
+index 2ebee33931ba..dcfd314bee89 100644
 --- a/tools/fiptool/Makefile
 +++ b/tools/fiptool/Makefile
-@@ -29,7 +29,7 @@ endif
+@@ -39,7 +39,7 @@ HOSTCCFLAGS +=3D -DUSING_OPENSSL3=3D$(USING_OPENSSL3)
  # directory. However, for a local build of OpenSSL, the built binaries =
are
  # located under the main project directory (i.e.: ${OPENSSL_DIR}, not
  # ${OPENSSL_DIR}/lib/).
@@ -152,7 +151,7 @@ index e6aeba95b..7c047479e 100644
 =20
  ifeq (${V},0)
    Q :=3D @
-@@ -37,7 +37,7 @@ else
+@@ -47,7 +47,7 @@ else
    Q :=3D
  endif
 =20
@@ -161,6 +160,3 @@ index e6aeba95b..7c047479e 100644
 =20
  HOSTCC ?=3D gcc
 =20
---=20
-2.25.1
-
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/feat-qemu-upda=
te-abi-between-spmd-and-spmc.patch b/meta-arm-bsp/recipes-bsp/trusted-fir=
mware-a/files/feat-qemu-update-abi-between-spmd-and-spmc.patch
similarity index 100%
rename from meta-arm/recipes-bsp/trusted-firmware-a/files/feat-qemu-updat=
e-abi-between-spmd-and-spmc.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/feat-qemu-upd=
ate-abi-between-spmd-and-spmc.patch
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/rwx-segments.p=
atch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segments.pat=
ch
similarity index 100%
rename from meta-arm/recipes-bsp/trusted-firmware-a/files/rwx-segments.pa=
tch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segments.=
patch
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/tf-a-tests-no-=
warn-rwx-segments.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/fil=
es/tf-a-tests-no-warn-rwx-segments.patch
similarity index 100%
rename from meta-arm/recipes-bsp/trusted-firmware-a/files/tf-a-tests-no-w=
arn-rwx-segments.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tf-a-tests-no=
-warn-rwx-segments.patch
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.8.6=
.bb b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/fiptool-native_2.8.6.bb
similarity index 100%
rename from meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.8.6.=
bb
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/fiptool-native_2.8.=
6.bb
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.8.0=
.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbap=
pend
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.8.0.=
bbappend
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappe=
nd
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.8.0.bb =
b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.8.0.bb
similarity index 100%
rename from meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.8.0.bb
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.8.0.bb
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index 06be28ee..145b5d3a 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -3,12 +3,11 @@
 COMPATIBLE_MACHINE =3D "(corstone1000)"
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/corstone1000:"
-
-SRC_URI:append =3D " \=20
+SRC_URI:append =3D " \
 	file://0001-Fix-FF-A-version-in-SPMC-manifest.patch \
-    file://0002-feat-corstone1000-bl2-loads-fip-based-on-metadata.patch =
\
-    file://0003-psci-SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES=
.patch \
-    "
+	file://0002-feat-corstone1000-bl2-loads-fip-based-on-metadata.patch \
+	file://0003-psci-SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES.pa=
tch \
+       "
=20
 #Sets TF-A version to 2.8.0
 SRCREV_tfa =3D "9881bb93a3bc0a3ea37e9f093e09ab4b360a9e48"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.8.%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a_%.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a_2.8.%.bbappend
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_=
%.bbappend
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.8.6.bb b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_=
2.8.6.bb
similarity index 92%
rename from meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.=
8.6.bb
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_=
2.8.6.bb
index 140faf53..a96df3c0 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.8.6.bb
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.8.=
6.bb
@@ -1,4 +1,4 @@
-require trusted-firmware-a.inc
+require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
=20
 # TF-A v2.8.6
 SRCREV_tfa =3D "ff0bd5f9bb2ba2f31fb9cec96df917747af9e92d"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-Add-spmc_=
manifest-for-qemu.patch b/meta-arm/recipes-bsp/trusted-firmware-a/files/0=
001-Add-spmc_manifest-for-qemu.patch
new file mode 100644
index 00000000..8ddf353b
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-Add-spmc_manifes=
t-for-qemu.patch
@@ -0,0 +1,64 @@
+From 56874ab381b0f0beade2d200147245e157b4aff6 Mon Sep 17 00:00:00 2001
+From: Gyorgy Szing <Gyorgy.Szing@arm.com>
+Date: Mon, 13 Mar 2023 21:15:59 +0100
+Subject: [PATCH] Add spmc_manifest for qemu
+
+This version only supports embedded packaging.
+
+Upstream-Status: Inappropriate [other]
+  - The SPMC manifest is integration specific and should live at an
+    integration spcific place. The manifest file is processed by TF-A
+    and I am adding the patch to TF-A to keep things simple.
+
+Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
+---
+ plat/qemu/fdts/optee_spmc_manifest.dts | 40 ++++++++++++++++++++++++++
+ 1 file changed, 40 insertions(+)
+ create mode 100644 plat/qemu/fdts/optee_spmc_manifest.dts
+
+diff --git a/plat/qemu/fdts/optee_spmc_manifest.dts b/plat/qemu/fdts/opt=
ee_spmc_manifest.dts
+new file mode 100644
+index 000000000000..ae2ae3d951de
+--- /dev/null
++++ b/plat/qemu/fdts/optee_spmc_manifest.dts
+@@ -0,0 +1,40 @@
++/* SPDX-License-Identifier: BSD-3-Clause */
++/*
++ * Copyright (c) 2023, Arm Limited. All rights reserved.
++ */
++
++/dts-v1/;
++
++/ {
++	compatible =3D "arm,ffa-core-manifest-1.0";
++	#address-cells =3D <2>;
++	#size-cells =3D <1>;
++
++	attribute {
++		spmc_id =3D <0x8000>;
++		maj_ver =3D <0x1>;
++		min_ver =3D <0x0>;
++		exec_state =3D <0x0>;
++		load_address =3D <0x0 0x0e100000>;
++		entrypoint =3D <0x0 0x0e100000>;
++		binary_size =3D <0x80000>;
++	};
++
++/*
++ * This file will be preprocessed by TF-A's build system. If Measured B=
oot is
++ * enabled in TF-A's config, the build system will add the MEASURED_BOO=
T=3D1 macro
++ * to the preprocessor arguments.
++ */
++#if MEASURED_BOOT
++	tpm_event_log {
++		compatible =3D "arm,tpm_event_log";
++		tpm_event_log_addr =3D <0x0 0x0>;
++		tpm_event_log_size =3D <0x0>;
++	};
++#endif
++
++/* If the ARM_BL2_SP_LIST_DTS is defined, SPs should be loaded from FIP=
 */
++#ifdef ARM_BL2_SP_LIST_DTS
++	#error "FIP SP load addresses configuration is missing.
++#endif
++};
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.9.0=
.bb b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.9.0.bb
new file mode 100644
index 00000000..58ee1dca
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.9.0.bb
@@ -0,0 +1,33 @@
+# Firmware Image Package (FIP)
+# It is a packaging format used by TF-A to package the
+# firmware images in a single binary.
+
+DESCRIPTION =3D "fiptool - Trusted Firmware tool for packaging"
+LICENSE =3D "BSD-3-Clause"
+
+SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://git.trustedfirmware.org/TF-A/trus=
ted-firmware-a.git;protocol=3Dhttps"
+SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};destsuffix=3Dfiptool-${PV};br=
anch=3D${SRCBRANCH}"
+LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3Db2c740efedc159745b9b=
31f88ff03dde"
+
+# Use fiptool from TF-A v2.9.0
+SRCREV =3D "d3e71ead6ea5bc3555ac90a446efec84ef6c6122"
+SRCBRANCH =3D "master"
+
+DEPENDS +=3D "openssl-native"
+
+inherit native
+
+EXTRA_OEMAKE =3D "V=3D1 HOSTCC=3D'${BUILD_CC}' OPENSSL_DIR=3D${STAGING_D=
IR_NATIVE}/${prefix_native}"
+
+do_compile () {
+    # This is still needed to have the native fiptool executing properly=
 by
+    # setting the RPATH
+    sed -i '/^LDLIBS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makef=
ile
+    sed -i '/^INCLUDE_PATHS/ s,$, \$\{BUILD_CFLAGS},' ${S}/tools/fiptool=
/Makefile
+
+    oe_runmake fiptool
+}
+
+do_install () {
+    install -D -p -m 0755 tools/fiptool/fiptool ${D}${bindir}/fiptool
+}
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.9.0.bb =
b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.9.0.bb
new file mode 100644
index 00000000..72a3e791
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.9.0.bb
@@ -0,0 +1,54 @@
+DESCRIPTION =3D "Trusted Firmware-A tests(aka TFTF)"
+LICENSE =3D "BSD-3-Clause & NCSA"
+
+LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D6175cc0aa2e63b6d21a=
32aa0ee7d1b4a"
+
+inherit deploy
+
+COMPATIBLE_MACHINE ?=3D "invalid"
+
+SRC_URI_TRUSTED_FIRMWARE_A_TESTS ?=3D "git://git.trustedfirmware.org/TF-=
A/tf-a-tests.git;protocol=3Dhttps"
+SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A_TESTS};branch=3D${SRCBRANCH} \
+          "
+SRCBRANCH =3D "master"
+SRCREV =3D "df6783437cdc98dabf4f49568312b86460f72efa"
+
+DEPENDS +=3D "optee-os"
+
+EXTRA_OEMAKE +=3D "USE_NVM=3D0"
+EXTRA_OEMAKE +=3D "SHELL_COLOR=3D1"
+EXTRA_OEMAKE +=3D "DEBUG=3D1"
+
+# Platform must be set for each machine
+TFA_PLATFORM ?=3D "invalid"
+
+EXTRA_OEMAKE +=3D "ARCH=3Daarch64"
+EXTRA_OEMAKE +=3D "LOG_LEVEL=3D50"
+
+S =3D "${WORKDIR}/git"
+B =3D "${WORKDIR}/build"
+
+# Add platform parameter
+EXTRA_OEMAKE +=3D "BUILD_BASE=3D${B} PLAT=3D${TFA_PLATFORM}"
+
+# Requires CROSS_COMPILE set by hand as there is no configure script
+export CROSS_COMPILE=3D"${TARGET_PREFIX}"
+
+do_compile() {
+    oe_runmake -C ${S} tftf
+}
+
+do_compile[cleandirs] =3D "${B}"
+
+FILES:${PN} =3D "/firmware/tftf.bin"
+SYSROOT_DIRS +=3D "/firmware"
+
+do_install() {
+    install -d -m 755 ${D}/firmware
+    install -m 0644 ${B}/${TFA_PLATFORM}/debug/tftf.bin ${D}/firmware/tf=
tf.bin
+}
+
+do_deploy() {
+    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
+}
+addtask deploy after do_install
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.9.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.9.=
0.bb
new file mode 100644
index 00000000..8f78b5e7
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.9.0.bb
@@ -0,0 +1,17 @@
+require trusted-firmware-a.inc
+
+# TF-A v2.9.0
+SRCREV_tfa =3D "d3e71ead6ea5bc3555ac90a446efec84ef6c6122"
+
+# Enable passing TOS_FW_CONFIG from FIP package to Trusted OS.
+SRC_URI:append:qemuarm64-secureboot =3D " \
+            file://0001-Add-spmc_manifest-for-qemu.patch \
+        "
+
+LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3Db2c740efedc159745b9=
b31f88ff03dde"
+
+# mbed TLS v2.28.4
+SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmbedtls-2.28"
+SRCREV_mbedtls =3D "aeb97a18913a86f051afab11b2c92c6be0c2eb83"
+
+LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D3b83ef96387f1=
4655fc854ddc3c6bd57"
--=20
2.30.2


