Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D29DC3601E
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 14:17:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9650.1743603425631481904
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Apr 2025 07:17:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BA881007;
	Wed,  2 Apr 2025 07:17:08 -0700 (PDT)
Received: from gyoszi01-yocto.budapest.arm.com (ubul2.budapest.arm.com [10.45.25.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4584B3F63F;
	Wed,  2 Apr 2025 07:17:04 -0700 (PDT)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <gyorgy.szing@arm.com>,
	Bence Balogh <bence.balogh@arm.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH 2/6] optee-os: add v4.4
Date: Wed,  2 Apr 2025 16:16:48 +0200
Message-ID: <20250402141652.380180-2-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402141652.380180-1-gyorgy.szing@arm.com>
References: <20250402141652.380180-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Apr 2025 14:17:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6436

Add recipes to allow building OP-TEE v4.4. This is the first version
carrying an SPMC implementation which supports branch protection.

Update corstone1000:
  - to use the new op-tee version
  - `CFG_TZDRAM_SIZE` is increased further from `0x340000` to `0x360000`
     as version 4.4.0 of OP-TEE OS requires more memory

Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
Signed-off-by: Bence Balogh <bence.balogh@arm.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>

optee-os: corestone1000: udpate to op-tee v4.4

Update OP-TEE version and add a patch to increase TZDRAM size to add
more memory to OP-TEE.

Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |  3 +-
 .../0002-increase-tzdram-size.patch           | 28 -----------------
 ...orstone1000-increase-CFG_TZDRAM_SIZE.patch | 30 +++++++++++++++++++
 .../optee/optee-os-corstone1000-common.inc    |  2 +-
 .../optee/optee-client_4.4.0.bb               |  8 +++++
 .../optee/optee-examples_4.4.0.bb             |  4 +++
 .../optee/optee-os-tadevkit_4.4.0.bb          | 29 ++++++++++++++++++
 .../recipes-security/optee/optee-os_4.4.0.bb  | 11 +++++++
 .../recipes-security/optee/optee-test.inc     |  1 -
 .../optee/optee-test_4.4.0.bb                 | 15 ++++++++++
 10 files changed, 100 insertions(+), 31 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/co=
rstone1000/0002-increase-tzdram-size.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/co=
rstone1000/0002-plat-corstone1000-increase-CFG_TZDRAM_SIZE.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-client_4.4.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-examples_4.4.0.=
bb
 create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_4.4=
.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-os_4.4.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-test_4.4.0.bb

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index df2a6044..57207499 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -14,7 +14,8 @@ TFA_BL2_BINARY =3D "bl2-corstone1000.bin"
 TFA_FIP_BINARY =3D "fip-corstone1000.bin"
=20
 # optee
-PREFERRED_VERSION_optee-os ?=3D "4.3.%"
+PREFERRED_VERSION_optee-os ?=3D "4.4.%"
+PREFERRED_VERSION_optee-client ?=3D "4.4.%"
=20
 # Trusted Services
 TS_PLATFORM =3D "arm/corstone1000"
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1=
000/0002-increase-tzdram-size.patch b/meta-arm-bsp/recipes-security/optee=
/files/optee-os/corstone1000/0002-increase-tzdram-size.patch
deleted file mode 100644
index 0c89bd0e..00000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/000=
2-increase-tzdram-size.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 1410d9e9c3e73b1319b98be67ad00c7630c4cb2e Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <Emekcan.Aras@arm.com>
-Date: Wed, 3 Apr 2024 16:05:07 +0100
-Subject: [PATCH] increase tzdram size
-
-Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/commit/258=
b72d242cd1a8ae56c87f9572a0624084785c7]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
----
- core/arch/arm/plat-corstone1000/conf.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/core/arch/arm/plat-corstone1000/conf.mk b/core/arch/arm/pla=
t-corstone1000/conf.mk
-index 98347b143..c2dd71f05 100644
---- a/core/arch/arm/plat-corstone1000/conf.mk
-+++ b/core/arch/arm/plat-corstone1000/conf.mk
-@@ -34,7 +34,7 @@ CFG_TEE_CORE_NB_CORE ?=3D 1
- CFG_TZDRAM_START ?=3D 0x02002000
-=20
- # TEE_RAM (OPTEE kernel + DATA) + TA_RAM =3D 3MB
--CFG_TZDRAM_SIZE  ?=3D 0x300000
-+CFG_TZDRAM_SIZE  ?=3D 0x340000
- CFG_SHMEM_START  ?=3D 0x86000000
- CFG_SHMEM_SIZE   ?=3D 0x00200000
-=20
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1=
000/0002-plat-corstone1000-increase-CFG_TZDRAM_SIZE.patch b/meta-arm-bsp/=
recipes-security/optee/files/optee-os/corstone1000/0002-plat-corstone1000=
-increase-CFG_TZDRAM_SIZE.patch
new file mode 100644
index 00000000..851e2cd2
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/000=
2-plat-corstone1000-increase-CFG_TZDRAM_SIZE.patch
@@ -0,0 +1,30 @@
+From ce58e4d78dc7a4f3c3b08ee425461eb190d70543 Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Fri, 1 Nov 2024 00:45:53 +0100
+Subject: [PATCH] plat-corstone1000: increase CFG_TZDRAM_SIZE
+
+TZDRAM is a 4MB SRAM in Corstone-1000. Its start address is `0x0200_0000=
`
+but the first 0x2000 bytes are reserved for future use. `CFG_TZDRAM_SIZE=
`
+can be increased to `0x360000` so OP-TEE has more RAM.
+
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Pending
+---
+ core/arch/arm/plat-corstone1000/conf.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/core/arch/arm/plat-corstone1000/conf.mk b/core/arch/arm/pla=
t-corstone1000/conf.mk
+index 9fa0729d5..745dc958a 100644
+--- a/core/arch/arm/plat-corstone1000/conf.mk
++++ b/core/arch/arm/plat-corstone1000/conf.mk
+@@ -34,7 +34,7 @@ CFG_TEE_CORE_NB_CORE ?=3D 1
+ CFG_TZDRAM_START ?=3D 0x02002000
+=20
+ # TEE_RAM (OP-TEE kernel + DATA) + TA_RAM
+-CFG_TZDRAM_SIZE  ?=3D 0x340000
++CFG_TZDRAM_SIZE  ?=3D 0x360000
+ CFG_SHMEM_START  ?=3D 0x86000000
+ CFG_SHMEM_SIZE   ?=3D 0x00200000
+=20
+--=20
+2.25.1
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-co=
mmon.inc b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-comm=
on.inc
index 482aab77..3f6452dc 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.in=
c
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.in=
c
@@ -1,7 +1,7 @@
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/optee-os/corstone1000:"
 SRC_URI:append =3D " \
                   file://0001-Handle-logging-syscall.patch \
-                  file://0002-increase-tzdram-size.patch \
+                  file://0002-plat-corstone1000-increase-CFG_TZDRAM_SIZE=
.patch \
 		  "
=20
 COMPATIBLE_MACHINE =3D "corstone1000"
diff --git a/meta-arm/recipes-security/optee/optee-client_4.4.0.bb b/meta=
-arm/recipes-security/optee/optee-client_4.4.0.bb
new file mode 100644
index 00000000..fa7b9564
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-client_4.4.0.bb
@@ -0,0 +1,8 @@
+require recipes-security/optee/optee-client.inc
+
+# v4.4.0
+SRCREV =3D "d221676a58b305bddbf97db00395205b3038de8e"
+
+inherit pkgconfig
+DEPENDS +=3D "util-linux"
+EXTRA_OEMAKE +=3D "PKG_CONFIG=3Dpkg-config"
diff --git a/meta-arm/recipes-security/optee/optee-examples_4.4.0.bb b/me=
ta-arm/recipes-security/optee/optee-examples_4.4.0.bb
new file mode 100644
index 00000000..46f08384
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-examples_4.4.0.bb
@@ -0,0 +1,4 @@
+require recipes-security/optee/optee-examples.inc
+
+# v4.4.0
+SRCREV =3D "378dc0db2d5dd279f58a3b6cb3f78ffd6b165035"
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.4.0.bb b=
/meta-arm/recipes-security/optee/optee-os-tadevkit_4.4.0.bb
new file mode 100644
index 00000000..961d5251
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_4.4.0.bb
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
diff --git a/meta-arm/recipes-security/optee/optee-os_4.4.0.bb b/meta-arm=
/recipes-security/optee/optee-os_4.4.0.bb
new file mode 100644
index 00000000..bd031ef7
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os_4.4.0.bb
@@ -0,0 +1,11 @@
+require recipes-security/optee/optee-os.inc
+
+DEPENDS +=3D "dtc-native"
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
+
+# v4.4.0
+SRCREV =3D "8f645256efc0dc66bd5c118778b0b50c44469ae1"
+SRC_URI +=3D " \
+    file://0003-optee-enable-clang-support.patch \
+   "
diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/re=
cipes-security/optee/optee-test.inc
index 58f10139..5f35ad9e 100644
--- a/meta-arm/recipes-security/optee/optee-test.inc
+++ b/meta-arm/recipes-security/optee/optee-test.inc
@@ -3,7 +3,6 @@ DESCRIPTION =3D "Open Portable Trusted Execution Environm=
ent - Test suite"
 HOMEPAGE =3D "https://www.op-tee.org/"
=20
 LICENSE =3D "BSD-2-Clause & GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Ddaa2bcccc666345ab8940aab13=
15a4fa"
=20
 inherit python3native ptest
 inherit deploy
diff --git a/meta-arm/recipes-security/optee/optee-test_4.4.0.bb b/meta-a=
rm/recipes-security/optee/optee-test_4.4.0.bb
new file mode 100644
index 00000000..d514c82c
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test_4.4.0.bb
@@ -0,0 +1,15 @@
+require recipes-security/optee/optee-test.inc
+
+# v4.4.0
+SRCREV =3D "695231ef8987866663a9ed5afd8f77d1bae3dc08"
+
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Da8fa504109e4cd7ea575bc49ea=
4be560"
+
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
2.43.0


