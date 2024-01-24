Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 535F6C47DDC
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 14:57:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.24621.1706108268230019262
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 Jan 2024 06:57:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00C531FB;
	Wed, 24 Jan 2024 06:58:32 -0800 (PST)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.31.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C05223F5A1;
	Wed, 24 Jan 2024 06:57:45 -0800 (PST)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 1/1] n1sdp:arm-bsp/optee: Update optee to v4.0
Date: Wed, 24 Jan 2024 14:57:34 +0000
Message-Id: <20240124145734.1694665-2-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240124145734.1694665-1-harsimransingh.tungal@arm.com>
References: <20240124145734.1694665-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 24 Jan 2024 14:57:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5357

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

This change updates the optee version to v4.0

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf          |  2 +-
 ...DR-affinity-shift-and-mask-for-32-bi.patch | 29 -------------------
 ...at-n1sdp-add-N1SDP-platform-support.patch} |  0
 ...atch =3D> 0002-Handle-logging-syscall.patch} |  0
 ...at-n1sdp-register-DRAM1-to-optee-os.patch} |  0
 ...-external-device-tree-base-and-size.patch} |  0
 .../recipes-security/optee/optee-os-n1sdp.inc |  9 +++---
 .../optee/optee-os-tadevkit_4.0.0.bbappend    |  6 ++++
 .../optee/optee-os_4.0.0.bbappend             |  1 +
 .../optee/optee-test_4.0.0.bbappend           |  6 ++++
 10 files changed, 18 insertions(+), 35 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/n1=
sdp/0001-core-arm-add-MPIDR-affinity-shift-and-mask-for-32-bi.patch
 rename meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/{0002-pl=
at-n1sdp-add-N1SDP-platform-support.patch =3D> 0001-plat-n1sdp-add-N1SDP-=
platform-support.patch} (100%)
 rename meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/{0003-Ha=
ndle-logging-syscall.patch =3D> 0002-Handle-logging-syscall.patch} (100%)
 rename meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/{0004-pl=
at-n1sdp-register-DRAM1-to-optee-os.patch =3D> 0003-plat-n1sdp-register-D=
RAM1-to-optee-os.patch} (100%)
 rename meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/{0005-pl=
at-n1sdp-add-external-device-tree-base-and-size.patch =3D> 0004-plat-n1sd=
p-add-external-device-tree-base-and-size.patch} (100%)
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-tadevkit=
_4.0.0.bbappend
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-test_4.0.0.=
bbappend

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/mac=
hine/n1sdp.conf
index 51b6d56f..79604cee 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -37,7 +37,7 @@ EXTRA_IMAGEDEPENDS +=3D "edk2-firmware"
 PREFERRED_VERSION_edk2-firmware ?=3D "202305"
=20
 #optee
-PREFERRED_VERSION_optee-os ?=3D "3.22.%"
+PREFERRED_VERSION_optee-os ?=3D "4.0.%"
=20
 #grub-efi
 EFI_PROVIDER ?=3D "grub-efi"
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/000=
1-core-arm-add-MPIDR-affinity-shift-and-mask-for-32-bi.patch b/meta-arm-b=
sp/recipes-security/optee/files/optee-os/n1sdp/0001-core-arm-add-MPIDR-af=
finity-shift-and-mask-for-32-bi.patch
deleted file mode 100644
index f249e526..00000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0001-core-=
arm-add-MPIDR-affinity-shift-and-mask-for-32-bi.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-From cf84c933bb7b8a95742d1e723950cb2cde2d5320 Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Wed, 20 Jul 2022 16:37:10 +0100
-Subject: [PATCH] core: arm: add MPIDR affinity shift and mask for 32-bit
-
-This change is to add MPIDR affinity shift and mask for
-32-bit
-
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-diff --git a/core/arch/arm/include/arm.h b/core/arch/arm/include/arm.h
-index f59478af..2f6f82e7 100644
---- a/core/arch/arm/include/arm.h
-+++ b/core/arch/arm/include/arm.h
-@@ -63,6 +63,8 @@
- #define MPIDR_AFF1_MASK		(MPIDR_AFFLVL_MASK << MPIDR_AFF1_SHIFT)
- #define MPIDR_AFF2_SHIFT	U(16)
- #define MPIDR_AFF2_MASK		(MPIDR_AFFLVL_MASK << MPIDR_AFF2_SHIFT)
-+#define MPIDR_AFF3_SHIFT	U(32)
-+#define MPIDR_AFF3_MASK		(MPIDR_AFFLVL_MASK << MPIDR_AFF3_SHIFT)
-=20
- #define MPIDR_MT_SHIFT		U(24)
- #define MPIDR_MT_MASK		BIT(MPIDR_MT_SHIFT)
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/000=
2-plat-n1sdp-add-N1SDP-platform-support.patch b/meta-arm-bsp/recipes-secu=
rity/optee/files/optee-os/n1sdp/0001-plat-n1sdp-add-N1SDP-platform-suppor=
t.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0002=
-plat-n1sdp-add-N1SDP-platform-support.patch
rename to meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0001-p=
lat-n1sdp-add-N1SDP-platform-support.patch
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/000=
3-Handle-logging-syscall.patch b/meta-arm-bsp/recipes-security/optee/file=
s/optee-os/n1sdp/0002-Handle-logging-syscall.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0003=
-Handle-logging-syscall.patch
rename to meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0002-H=
andle-logging-syscall.patch
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/000=
4-plat-n1sdp-register-DRAM1-to-optee-os.patch b/meta-arm-bsp/recipes-secu=
rity/optee/files/optee-os/n1sdp/0003-plat-n1sdp-register-DRAM1-to-optee-o=
s.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0004=
-plat-n1sdp-register-DRAM1-to-optee-os.patch
rename to meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0003-p=
lat-n1sdp-register-DRAM1-to-optee-os.patch
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/000=
5-plat-n1sdp-add-external-device-tree-base-and-size.patch b/meta-arm-bsp/=
recipes-security/optee/files/optee-os/n1sdp/0004-plat-n1sdp-add-external-=
device-tree-base-and-size.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0005=
-plat-n1sdp-add-external-device-tree-base-and-size.patch
rename to meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0004-p=
lat-n1sdp-add-external-device-tree-base-and-size.patch
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc b/met=
a-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc
index 1b66cd5d..c261ce16 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc
@@ -6,11 +6,10 @@ TS_INSTALL_PREFIX_PATH =3D "${RECIPE_SYSROOT}/firmware/=
sp/opteesp"
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/optee-os/n1sdp:"
 SRC_URI:append =3D " \
-    file://0001-core-arm-add-MPIDR-affinity-shift-and-mask-for-32-bi.pat=
ch \
-    file://0002-plat-n1sdp-add-N1SDP-platform-support.patch \
-    file://0003-Handle-logging-syscall.patch \
-    file://0004-plat-n1sdp-register-DRAM1-to-optee-os.patch \
-    file://0005-plat-n1sdp-add-external-device-tree-base-and-size.patch =
\
+    file://0001-plat-n1sdp-add-N1SDP-platform-support.patch \
+    file://0002-Handle-logging-syscall.patch \
+    file://0003-plat-n1sdp-register-DRAM1-to-optee-os.patch \
+    file://0004-plat-n1sdp-add-external-device-tree-base-and-size.patch =
\
     "
=20
 EXTRA_OEMAKE +=3D " CFG_TEE_CORE_LOG_LEVEL=3D4"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.0.0.=
bbappend b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.0.0.bb=
append
new file mode 100644
index 00000000..e09c4a5e
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.0.0.bbappen=
d
@@ -0,0 +1,6 @@
+# Machine specific configurations
+
+MACHINE_OPTEE_OS_TADEVKIT_REQUIRE ?=3D ""
+MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:n1sdp =3D "optee-os-n1sdp.inc"
+
+require ${MACHINE_OPTEE_OS_TADEVKIT_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_4.0.0.bbappend =
b/meta-arm-bsp/recipes-security/optee/optee-os_4.0.0.bbappend
index 6c94303a..788a23ef 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_4.0.0.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_4.0.0.bbappend
@@ -2,5 +2,6 @@
 # Machine specific configurations
 MACHINE_OPTEE_OS_REQUIRE ?=3D ""
 MACHINE_OPTEE_OS_REQUIRE:corstone1000 =3D "optee-os-corstone1000-common.=
inc"
+MACHINE_OPTEE_OS_REQUIRE:n1sdp =3D "optee-os-n1sdp.inc"
=20
 require ${MACHINE_OPTEE_OS_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_4.0.0.bbappen=
d b/meta-arm-bsp/recipes-security/optee/optee-test_4.0.0.bbappend
new file mode 100644
index 00000000..05e2abca
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-test_4.0.0.bbappend
@@ -0,0 +1,6 @@
+# Machine specific configurations
+
+MACHINE_OPTEE_TEST_REQUIRE ?=3D ""
+MACHINE_OPTEE_TEST_REQUIRE:n1sdp =3D "optee-os-generic-n1sdp.inc"
+
+require ${MACHINE_OPTEE_TEST_REQUIRE}
--=20
2.25.1


