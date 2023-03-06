Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AACF4C742A7
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 13:20:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14902.1678195196547137002
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Mar 2023 05:19:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EDFE11FB
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 Mar 2023 05:20:39 -0800 (PST)
Received: from jdm-VirtualBox.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B24333F71A
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 Mar 2023 05:19:55 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] CI: add support for dev kernel, rt kernel, and poky-tiny
Date: Mon,  6 Mar 2023 15:50:46 -0500
Message-Id: <20230306205046.472156-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230306205046.472156-1-jon.mason@arm.com>
References: <20230306205046.472156-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 Mar 2023 13:20:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4475

Add the various kernels available in oe-core, as well as the poky-tiny
minimal distribution (which has a minimal kernel config).  This
necessitated combining some kernel bbappends to have patching coverage
for all the variants.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                                | 29 +++++++++++++++----
 ci/corstone1000-common.yml                    |  3 +-
 ci/corstone500.yml                            |  9 +-----
 ci/linux-yocto-dev.yml                        |  6 ++++
 ci/linux-yocto-rt.yml                         |  6 ++++
 ci/linux-yocto.yml                            |  7 +++++
 ci/poky-tiny.yml                              | 14 +++++++++
 ci/poky.yml                                   |  4 +++
 .../recipes-kernel/linux/files/no-ipvs.cfg    |  1 +
 .../linux/files/qemuarm-phys-virt.cfg         |  1 +
 ...yocto_%.bbappend =3D> linux-yocto%.bbappend} | 12 +++++++-
 .../linux/linux-yocto_6.1%.bbappend           |  7 -----
 12 files changed, 75 insertions(+), 24 deletions(-)
 create mode 100644 ci/linux-yocto-dev.yml
 create mode 100644 ci/linux-yocto-rt.yml
 create mode 100644 ci/linux-yocto.yml
 create mode 100644 ci/poky-tiny.yml
 create mode 100644 ci/poky.yml
 create mode 100644 meta-arm/recipes-kernel/linux/files/no-ipvs.cfg
 create mode 100644 meta-arm/recipes-kernel/linux/files/qemuarm-phys-virt=
.cfg
 rename meta-arm/recipes-kernel/linux/{linux-yocto_%.bbappend =3D> linux-=
yocto%.bbappend} (74%)
 delete mode 100644 meta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappe=
nd

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d5c82dd1..0bc9a8e1 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -70,6 +70,8 @@ update-repos:
 # Build stage, the actual build jobs
 #
 # Available options for building are
+#  DISTRO: [poky, poky-tiny]
+#  KERNEL: [linux-yocto, linux-yocto-dev, linux-yocto-rt]
 #  TOOLCHAINS: [gcc, clang, armgcc, external-gccarm]
 #  TCLIBC: [glibc, musl]
 #  FIRMWARE: [u-boot, edk2]
@@ -147,14 +149,16 @@ qemu-generic-arm64:
   extends: .build
   parallel:
     matrix:
-      - TOOLCHAINS: [gcc, clang]
+      - KERNEL: [linux-yocto, linux-yocto-dev, linux-yocto-rt]
+        TOOLCHAINS: [gcc, clang]
         TESTING: testimage
=20
 qemuarm64-secureboot:
   extends: .build
   parallel:
     matrix:
-      - TOOLCHAINS: [gcc, clang]
+      - KERNEL: [linux-yocto, linux-yocto-dev, linux-yocto-rt]
+        TOOLCHAINS: [gcc, clang]
         TCLIBC: [glibc, musl]
         TS: [none, trusted-services]
         TESTING: testimage
@@ -163,32 +167,45 @@ qemuarm64:
   extends: .build
   parallel:
     matrix:
-      - TOOLCHAINS: [gcc, clang]
+      - DISTRO: poky
+        KERNEL: [linux-yocto, linux-yocto-dev, linux-yocto-rt]
+        TOOLCHAINS: [gcc, clang]
         FIRMWARE: [u-boot, edk2]
         TESTING: testimage
+      - DISTRO: poky-tiny
+        TESTING: testimage
       - VIRT: xen
=20
 qemuarm-secureboot:
   extends: .build
   parallel:
     matrix:
-      - TOOLCHAINS: [gcc, clang]
+      - KERNEL: [linux-yocto, linux-yocto-dev, linux-yocto-rt]
+        TOOLCHAINS: [gcc, clang]
         TESTING: testimage
=20
 qemuarm:
   extends: .build
   parallel:
     matrix:
-      - TOOLCHAINS: [gcc, clang]
+      - DISTRO: poky
+        KERNEL: [linux-yocto, linux-yocto-dev, linux-yocto-rt]
+        TOOLCHAINS: [gcc, clang]
         FIRMWARE: [u-boot, edk2]
         TESTING: testimage
+      - DISTRO: poky-tiny
+        TESTING: testimage
       - VIRT: xen
=20
 qemuarmv5:
   extends: .build
   parallel:
     matrix:
-      - TESTING: testimage
+      - DISTRO: poky
+        KERNEL: [linux-yocto, linux-yocto-dev, linux-yocto-rt]
+        TESTING: testimage
+      - DISTRO: poky-tiny
+        TESTING: testimage
=20
 sgi575:
   extends: .build
diff --git a/ci/corstone1000-common.yml b/ci/corstone1000-common.yml
index 65ff9d38..d856cfe7 100644
--- a/ci/corstone1000-common.yml
+++ b/ci/corstone1000-common.yml
@@ -3,13 +3,12 @@ header:
   includes:
     - ci/base.yml
     - ci/meta-openembedded.yml
+    - ci/poky-tiny.yml
=20
 local_conf_header:
     extrapackages: |
     # Intentionally blank to prevent perf from being added to the image =
in base.yml
=20
-distro: poky-tiny
-
 target:
   - corstone1000-image
   - perf
diff --git a/ci/corstone500.yml b/ci/corstone500.yml
index 437c97c5..0f9592e3 100644
--- a/ci/corstone500.yml
+++ b/ci/corstone500.yml
@@ -3,17 +3,10 @@ header:
   includes:
     - ci/base.yml
     - ci/fvp.yml
+    - ci/poky-tiny.yml
=20
 local_conf_header:
   fvp-config: |
     IMAGE_FEATURES:remove =3D " ssh-server-dropbear"
-  extrapackages: |
-    # Intentionally blank to prevent perf from being added to the image =
in base.yml
=20
 machine: corstone500
-
-distro: poky-tiny
-
-target:
-  - core-image-minimal
-  - perf
diff --git a/ci/linux-yocto-dev.yml b/ci/linux-yocto-dev.yml
new file mode 100644
index 00000000..a6fadce1
--- /dev/null
+++ b/ci/linux-yocto-dev.yml
@@ -0,0 +1,6 @@
+header:
+  version: 9
+
+local_conf_header:
+  kernel: |
+    PREFERRED_PROVIDER_virtual/kernel =3D "linux-yocto-dev"
diff --git a/ci/linux-yocto-rt.yml b/ci/linux-yocto-rt.yml
new file mode 100644
index 00000000..69d768c5
--- /dev/null
+++ b/ci/linux-yocto-rt.yml
@@ -0,0 +1,6 @@
+header:
+  version: 9
+
+local_conf_header:
+  kernel: |
+    PREFERRED_PROVIDER_virtual/kernel =3D "linux-yocto-rt"
diff --git a/ci/linux-yocto.yml b/ci/linux-yocto.yml
new file mode 100644
index 00000000..359fea5a
--- /dev/null
+++ b/ci/linux-yocto.yml
@@ -0,0 +1,7 @@
+header:
+  version: 9
+
+#NOTE: This is the default for poky.  This is only being added for compl=
eteness/clarity
+local_conf_header:
+  kernel: |
+    PREFERRED_PROVIDER_virtual/kernel =3D "linux-yocto"
diff --git a/ci/poky-tiny.yml b/ci/poky-tiny.yml
new file mode 100644
index 00000000..cf252a0e
--- /dev/null
+++ b/ci/poky-tiny.yml
@@ -0,0 +1,14 @@
+header:
+  version: 9
+
+distro: poky-tiny
+
+local_conf_header:
+  hacking: |
+    TEST_SUITES =3D "ping"
+  extrapackages: |
+    # Intentionally blank to prevent perf from being added to the image =
in base.yml
+
+target:
+  - core-image-minimal
+  - perf
diff --git a/ci/poky.yml b/ci/poky.yml
new file mode 100644
index 00000000..d4bcfebf
--- /dev/null
+++ b/ci/poky.yml
@@ -0,0 +1,4 @@
+header:
+  version: 9
+
+distro: poky
diff --git a/meta-arm/recipes-kernel/linux/files/no-ipvs.cfg b/meta-arm/r=
ecipes-kernel/linux/files/no-ipvs.cfg
new file mode 100644
index 00000000..fcfd2b21
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/files/no-ipvs.cfg
@@ -0,0 +1 @@
+CONFIG_IP_VS=3Dn
diff --git a/meta-arm/recipes-kernel/linux/files/qemuarm-phys-virt.cfg b/=
meta-arm/recipes-kernel/linux/files/qemuarm-phys-virt.cfg
new file mode 100644
index 00000000..b014e7f6
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/files/qemuarm-phys-virt.cfg
@@ -0,0 +1 @@
+CONFIG_ARM_PATCH_PHYS_VIRT=3Dy
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend b/meta-=
arm/recipes-kernel/linux/linux-yocto%.bbappend
similarity index 74%
rename from meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
rename to meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
index 91dc000e..cab7f47e 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
@@ -1,9 +1,16 @@
 ARMFILESPATHS :=3D "${THISDIR}/files:"
=20
+FILESEXTRAPATHS:prepend:aarch64 =3D "${ARMFILESPATHS}"
+SRC_URI:append:aarch64 =3D " \
+    file://0001-Revert-arm64-defconfig-Enable-Tegra-MGBE-driver.patch \
+    file://0002-Revert-arm64-defconfig-Add-Nuvoton-NPCM-family-suppo.pat=
ch \
+    "
+
 COMPATIBLE_MACHINE:generic-arm64 =3D "generic-arm64"
 FILESEXTRAPATHS:prepend:generic-arm64 =3D "${ARMFILESPATHS}"
 SRC_URI:append:generic-arm64 =3D " \
     file://generic-arm64-kmeta;type=3Dkmeta;destsuffix=3Dgeneric-arm64-k=
meta \
+    file://no-ipvs.cfg \
     "
=20
 FILESEXTRAPATHS:prepend:qemuarm64-secureboot =3D "${ARMFILESPATHS}"
@@ -25,7 +32,10 @@ FILESEXTRAPATHS:prepend:qemuarm64 =3D "${ARMFILESPATHS=
}"
 SRC_URI:append:qemuarm64 =3D " file://efi.cfg"
=20
 FILESEXTRAPATHS:prepend:qemuarm =3D "${ARMFILESPATHS}"
-SRC_URI:append:qemuarm =3D " file://efi.cfg"
+SRC_URI:append:qemuarm =3D " \
+    file://efi.cfg \
+    file://qemuarm-phys-virt.cfg \
+    "
=20
 FFA_TRANSPORT_INCLUDE =3D "${@bb.utils.contains('MACHINE_FEATURES', 'arm=
-ffa', 'arm-ffa-transport.inc', '' , d)}"
 require ${FFA_TRANSPORT_INCLUDE}
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappend b/me=
ta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappend
deleted file mode 100644
index 754e5c2d..00000000
--- a/meta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappend
+++ /dev/null
@@ -1,7 +0,0 @@
-ARMFILESPATHS :=3D "${THISDIR}/files:"
-
-FILESEXTRAPATHS:prepend:aarch64 =3D "${ARMFILESPATHS}"
-SRC_URI:append:aarch64 =3D " \
-    file://0001-Revert-arm64-defconfig-Enable-Tegra-MGBE-driver.patch \
-    file://0002-Revert-arm64-defconfig-Add-Nuvoton-NPCM-family-suppo.pat=
ch \
-    "
--=20
2.25.1


