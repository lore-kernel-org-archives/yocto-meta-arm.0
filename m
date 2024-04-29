Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C14C4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 15:27:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.24440.1714404420396453381
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Apr 2024 08:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B6B52F4;
	Mon, 29 Apr 2024 08:27:26 -0700 (PDT)
Received: from FWLNXWH7M5.arm.com (unknown [10.57.2.218])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 068663F793;
	Mon, 29 Apr 2024 08:26:58 -0700 (PDT)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <gyorgy.szing@arm.com>
Subject: [PATCH 1/5] Add support for the TS Firmware Update service
Date: Mon, 29 Apr 2024 17:26:50 +0200
Message-ID: <20240429152654.94534-1-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Apr 2024 15:27:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5621

Add a recipe to enable building and deploying the FWU service
implemented in the Trusted Services Project. The FWU service can
help vendors to meet PSA certification requirements.

Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
---
 ci/fvp-base-ts.yml                            |  12 ++-
 documentation/trusted-services.md             |   6 +-
 .../trusted-services/ts-sp-fwu_%.bbappend     |   1 +
 .../recipes-security/optee/optee-os-ts.inc    |   6 ++
 ...uring-flash-image-files-compile-time.patch | 100 ++++++++++++++++++
 .../trusted-services/trusted-services-src.inc |   1 +
 .../trusted-services/ts-sp-fwu_git.bb         |  32 ++++++
 .../trusted-services/ts-uuid.inc              |   1 +
 8 files changed, 156 insertions(+), 3 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-sp-=
fwu_%.bbappend
 create mode 100644 meta-arm/recipes-security/trusted-services/files/0001=
-Allow-configuring-flash-image-files-compile-time.patch
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-sp-fwu_=
git.bb

diff --git a/ci/fvp-base-ts.yml b/ci/fvp-base-ts.yml
index e2e7ada2..9a03bc85 100644
--- a/ci/fvp-base-ts.yml
+++ b/ci/fvp-base-ts.yml
@@ -12,7 +12,7 @@ local_conf_header:
     # Include all Secure Partitions into the image
     MACHINE_FEATURES:append =3D " arm-ffa ts-crypto ts-storage ts-its"
     MACHINE_FEATURES:append =3D " ts-attestation ts-smm-gateway optee-sp=
mc-test"
-    MACHINE_FEATURES:append =3D " ts-block-storage"
+    MACHINE_FEATURES:append =3D " ts-block-storage ts-fwu"
     # Include TS demo/test tools into image
     IMAGE_INSTALL:append =3D " packagegroup-ts-tests"
     # Include TS PSA Arch tests into image
@@ -20,3 +20,13 @@ local_conf_header:
     CORE_IMAGE_EXTRA_INSTALL +=3D "optee-test"
     # Set the TS environment
     TS_ENV=3D"sp"
+    # Enable and configure semihosting
+    FVP_CONFIG[cluster0.cpu0.semihosting-cwd] =3D "${DEPLOY_DIR_IMAGE}"
+    FVP_CONFIG[cluster0.cpu1.semihosting-cwd] =3D "${DEPLOY_DIR_IMAGE}"
+    FVP_CONFIG[cluster0.cpu2.semihosting-cwd] =3D "${DEPLOY_DIR_IMAGE}"
+    FVP_CONFIG[cluster0.cpu3.semihosting-cwd] =3D "${DEPLOY_DIR_IMAGE}"
+    FVP_CONFIG[cluster1.cpu0.semihosting-cwd] =3D "${DEPLOY_DIR_IMAGE}"
+    FVP_CONFIG[cluster1.cpu1.semihosting-cwd] =3D "${DEPLOY_DIR_IMAGE}"
+    FVP_CONFIG[cluster1.cpu2.semihosting-cwd] =3D "${DEPLOY_DIR_IMAGE}"
+    FVP_CONFIG[cluster1.cpu3.semihosting-cwd] =3D "${DEPLOY_DIR_IMAGE}"
+    FVP_CONFIG[semihosting-enable] =3D "True"
diff --git a/documentation/trusted-services.md b/documentation/trusted-se=
rvices.md
index 0359b648..c37b10bf 100644
--- a/documentation/trusted-services.md
+++ b/documentation/trusted-services.md
@@ -18,6 +18,7 @@ features for each [Secure Partition][^2] you would like=
 to include:
 | ----------------- | --------------- |
 | Attestation       | ts-attesation   |
 | Crypto            | ts-crypto       |
+| Firmware Update   | ts-fwu
 | Internal Storage  | ts-its          |
 | Protected Storage | ts-storage      |
 | se-proxy          | ts-se-proxy     |
@@ -47,9 +48,10 @@ Other steps depend on your machine/platform definition=
:
 4. Trusted Services supports an SPMC agonistic binary format. To build S=
Ps to this format the `TS_ENV` variable is to be
    set to `sp`. The resulting SP binaries should be able to boot under a=
ny FF-A v1.1 compliant SPMC implementation.
=20
+
 ## Normal World applications
=20
-Optionally for testing purposes you can add `packagegroup-ts-tests` into=
 your image. It includes=20
+Optionally for testing purposes you can add `packagegroup-ts-tests` into=
 your image. It includes
 [Trusted Services test and demo tools][^3] and [xtest][^4] configured to=
 include the `ffa_spmc` tests.
=20
 ## OEQA Trusted Services tests
@@ -65,4 +67,4 @@ See `ci/trusted-services.yml` for an example how to inc=
lude them into an image.
=20
 [^3]: https://trusted-services.readthedocs.io/en/integration/deployments=
/test-executables.html
=20
-[^4]: https://optee.readthedocs.io/en/latest/building/gits/optee_test.ht=
ml
\ No newline at end of file
+[^4]: https://optee.readthedocs.io/en/latest/building/gits/optee_test.ht=
ml
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-fwu_%.b=
bappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-fwu_%.bbap=
pend
new file mode 100644
index 00000000..5c9ef210
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-fwu_%.bbappend
@@ -0,0 +1 @@
+require ts-arm-platforms.inc
diff --git a/meta-arm/recipes-security/optee/optee-os-ts.inc b/meta-arm/r=
ecipes-security/optee/optee-os-ts.inc
index a9071abd..d30e8ea7 100644
--- a/meta-arm/recipes-security/optee/optee-os-ts.inc
+++ b/meta-arm/recipes-security/optee/optee-os-ts.inc
@@ -67,6 +67,12 @@ SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEA=
TURES', 'optee-spmc-test', \
 EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
                                         ' CFG_SPMC_TESTS=3Dy', '' , d)}"
=20
+# Firmware Update SP
+DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-fwu', =
\
+                                        ' ts-sp-fwu', '' , d)}"
+SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-fwu', =
\
+                                        ' ${TS_BIN}/${FWU_UUID}${SP_EXT}=
', '', d)}"
+
 # Block Storage SP
 DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-block-=
storage', \
                                         ' ts-sp-block-storage', '' , d)}=
"
diff --git a/meta-arm/recipes-security/trusted-services/files/0001-Allow-=
configuring-flash-image-files-compile-time.patch b/meta-arm/recipes-secur=
ity/trusted-services/files/0001-Allow-configuring-flash-image-files-compi=
le-time.patch
new file mode 100644
index 00000000..bcffa4b8
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/files/0001-Allow-configu=
ring-flash-image-files-compile-time.patch
@@ -0,0 +1,100 @@
+From 9fbeb9dd8c4f2c842248541b73e4cff9c6f8d26e Mon Sep 17 00:00:00 2001
+From: Gyorgy Szing <gyorgy.szing@arm.com>
+Date: Wed, 27 Mar 2024 21:53:51 +0000
+Subject: [PATCH 1/1] Allow configuring flash image files compile time
+
+Allow configuring image file PATH name for file and semihosted
+block_store using CMake build options.
+
+Upstream-Status: Pending
+
+Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
+---
+ .../block_storage/factory/file/block_store_factory.c        | 6 +++++-
+ .../service/block_storage/factory/file/component.cmake      | 6 +++++-
+ .../block_storage/factory/semihosting/block_store_factory.c | 6 +++++-
+ .../block_storage/factory/semihosting/component.cmake       | 6 +++++-
+ 4 files changed, 20 insertions(+), 4 deletions(-)
+
+diff --git a/components/service/block_storage/factory/file/block_store_f=
actory.c b/components/service/block_storage/factory/file/block_store_fact=
ory.c
+index c6915107b..ef05ee791 100644
+--- a/components/service/block_storage/factory/file/block_store_factory.=
c
++++ b/components/service/block_storage/factory/file/block_store_factory.=
c
+@@ -25,6 +25,10 @@
+ #define FILE_BLOCK_SIZE (512)
+ #endif
+=20
++#ifndef FILE_BLK_FILE_NAME
++#define FILE_BLK_FILE_NAME "secure-flash.img"
++#endif
++
+ static char disk_img_filename[256];
+=20
+ struct block_store_assembly {
+@@ -60,7 +64,7 @@ struct block_store *file_block_store_factory_create(vo=
id)
+=20
+ 		/* Ensure disk image filename is set */
+ 		if (disk_img_filename[0] =3D=3D '\0')
+-			file_block_store_factory_set_filename("secure-flash.img");
++			file_block_store_factory_set_filename(FILE_BLK_FILE_NAME);
+=20
+ 		/* Initialise a file_block_store to provide underlying storage */
+ 		struct block_store *secure_flash =3D file_block_store_init(
+diff --git a/components/service/block_storage/factory/file/component.cma=
ke b/components/service/block_storage/factory/file/component.cmake
+index 644f03972..fa15d1399 100644
+--- a/components/service/block_storage/factory/file/component.cmake
++++ b/components/service/block_storage/factory/file/component.cmake
+@@ -17,4 +17,8 @@ if (NOT DEFINED TS_BLOCK_STORE_FACTORY)
+ 	set(TS_BLOCK_STORE_FACTORY "file_block_store_factory")
+ 	target_compile_definitions(${TGT} PRIVATE
+ 		CONCRETE_BLOCK_STORE_FACTORY=3D${TS_BLOCK_STORE_FACTORY})
+-endif()
+\ No newline at end of file
++endif()
++
++set(FILE_BLK_FILE_NAME "secure-flash.img" CACHE PATH "PATH to block sto=
rage flash image file.")
++set_property(SOURCE "${CMAKE_CURRENT_LIST_DIR}/block_store_factory.c" A=
PPEND PROPERTY COMPILE_DEFINITIONS FILE_BLK_FILE_NAME=3D"${FILE_BLK_FILE_=
NAME}")
++message(status "Block storage image file PATH is ${FILE_BLK_FILE_NAME}"=
)
+diff --git a/components/service/block_storage/factory/semihosting/block_=
store_factory.c b/components/service/block_storage/factory/semihosting/bl=
ock_store_factory.c
+index 8e58e3638..09bdb74eb 100644
+--- a/components/service/block_storage/factory/semihosting/block_store_f=
actory.c
++++ b/components/service/block_storage/factory/semihosting/block_store_f=
actory.c
+@@ -21,6 +21,10 @@
+ /* Most common block size for UEFI volumes */
+ #define SEMIHOSTING_BLOCK_SIZE		(512)
+=20
++#ifndef SEMIHOSTING_BLK_FILE_NAME
++#define SEMIHOSTING_BLK_FILE_NAME "secure-flash.img"
++#endif
++
+ struct block_store_assembly
+ {
+ 	struct semihosting_block_store semihosting_block_store;
+@@ -55,7 +59,7 @@ struct block_store *semihosting_block_store_factory_cr=
eate(void)
+ 		/* Initialise a semihosting_block_store to provide underlying storage=
 */
+ 		struct block_store *secure_flash =3D semihosting_block_store_init(
+ 			&assembly->semihosting_block_store,
+-			"secure-flash.img",
++			SEMIHOSTING_BLK_FILE_NAME,
+ 			SEMIHOSTING_BLOCK_SIZE);
+=20
+ 		if (secure_flash) {
+diff --git a/components/service/block_storage/factory/semihosting/compon=
ent.cmake b/components/service/block_storage/factory/semihosting/componen=
t.cmake
+index 97affaf49..98d6dcdcb 100644
+--- a/components/service/block_storage/factory/semihosting/component.cma=
ke
++++ b/components/service/block_storage/factory/semihosting/component.cma=
ke
+@@ -17,4 +17,8 @@ if (NOT DEFINED TS_BLOCK_STORE_FACTORY)
+ 	set(TS_BLOCK_STORE_FACTORY "semihosting_block_store_factory")
+ 	target_compile_definitions(${TGT} PRIVATE
+ 		CONCRETE_BLOCK_STORE_FACTORY=3D${TS_BLOCK_STORE_FACTORY})
+-endif()
+\ No newline at end of file
++endif()
++
++set(SEMIHOSTING_BLK_FILE_NAME "secure-flash.img" CACHE PATH "PATH to bl=
ock storage flash image file.")
++set_property(SOURCE "${CMAKE_CURRENT_LIST_DIR}/block_store_factory.c" A=
PPEND PROPERTY COMPILE_DEFINITIONS SEMIHOSTING_BLK_FILE_NAME=3D"${SEMIHOS=
TING_BLK_FILE_NAME}")
++message(status "Block storage semihosting image file PATH is ${SEMIHOST=
ING_BLK_FILE_NAME}")
+\ No newline at end of file
+--=20
+2.34.1
+
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-=
src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src=
.inc
index cf301a14..f8cbc862 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
@@ -10,6 +10,7 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
 SRC_URI:append =3D "\
 	file://0001-Upgrade-nanopb-to-v0.4.7.patch \
     file://0001-Add-boot-order-property-to-SP-manifests.patch \
+    file://0001-Allow-configuring-flash-image-files-compile-time.patch \
 "
=20
 # Trusted Services; Tag: v1.0.0
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb =
b/meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb
new file mode 100644
index 00000000..02f58fb4
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb
@@ -0,0 +1,32 @@
+# SPDX-FileCopyrightText: <text>Copyright 2024 Arm Limited and/or its
+# affiliates <open-source-office@arm.com></text>
+#
+# SPDX-License-Identifier: MIT
+
+DESCRIPTION =3D "Trusted Services Firmware Update Service provider"
+
+require ts-sp-common.inc
+inherit deploy
+
+SP_UUID =3D "${FWU_UUID}"
+TS_SP_FWU_CONFIG ?=3D "default"
+
+OECMAKE_SOURCEPATH=3D"${S}/deployments/fwu/config/${TS_SP_FWU_CONFIG}-${=
TS_ENV}"
+
+# The GPT parser component is needed from TF-A
+SRC_URI +=3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;=
name=3Dtfa;protocol=3Dhttps;branch=3Dmaster;destsuffix=3Dgit/tf-a"
+SRCREV_tfa =3D "v2.7.0"
+LIC_FILES_CHKSUM =3D "file://../tf-a/docs/license.rst;md5=3Db2c740efedc1=
59745b9b31f88ff03dde"
+do_apply_local_src_patches:append() {
+    apply_local_src_patches ${S}/external/tf_a ${WORKDIR}/git/tf-a
+}
+
+EXTRA_OECMAKE:append =3D "-DTFA_SOURCE_DIR=3D${WORKDIR}/git/tf-a"
+
+# Deploy the secure flash image.
+do_deploy() {
+    cp -v ${S}/components/media/disk/disk_images/multi_location_fw.img $=
{DEPLOYDIR}/secure-flash.img
+}
+addtask deploy after do_compile
+
+EXTRA_OECMAKE:append:qemuall =3D " -DSEMIHOSTING_BLK_FILE_NAME:STRING=3D=
${@oe.path.relative('${TMPDIR}', '${DEPLOY_DIR_IMAGE}')}/secure-flash.img=
"
diff --git a/meta-arm/recipes-security/trusted-services/ts-uuid.inc b/met=
a-arm/recipes-security/trusted-services/ts-uuid.inc
index 0b2bd85a..810ffa5e 100644
--- a/meta-arm/recipes-security/trusted-services/ts-uuid.inc
+++ b/meta-arm/recipes-security/trusted-services/ts-uuid.inc
@@ -11,4 +11,5 @@ SPM_TEST1_UUID   =3D "5c9edbc3-7b3a-4367-9f83-7c191ae86=
a37"
 SPM_TEST2_UUID   =3D "7817164c-c40c-4d1a-867a-9bb2278cf41a"
 SPM_TEST3_UUID   =3D "23eb0100-e32a-4497-9052-2f11e584afa6"
 SPM_TEST4_UUID   =3D "423762ed-7772-406f-99d8-0c27da0abbf8"
+FWU_UUID         =3D "6823a838-1b06-470e-9774-0cce8bfb53fd"
 BLOCK_STORAGE_UUID =3D "63646e80-eb52-462f-ac4f-8cdf3987519c"
--=20
2.43.1


