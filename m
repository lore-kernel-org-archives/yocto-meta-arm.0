Return-Path: <drew.reed@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AAADC48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 11:19:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20912.1709810339417541053
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Mar 2024 03:18:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: drew.reed@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16BEDC15;
	Thu,  7 Mar 2024 03:19:36 -0800 (PST)
Received: from C02DP1BVML7H.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79AA33F762;
	Thu,  7 Mar 2024 03:18:58 -0800 (PST)
From: drew.reed@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Drew Reed <Drew.Reed@arm.com>
Subject: [PATCH 1/2] kas: Corstone-1000 kas files updated
Date: Thu,  7 Mar 2024 11:18:35 +0000
Message-ID: <20240307111836.59383-2-drew.reed@arm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240307111836.59383-1-drew.reed@arm.com>
References: <20240307111836.59383-1-drew.reed@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 07 Mar 2024 11:19:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5417

From: Drew Reed <Drew.Reed@arm.com>

The 2 Corstone-1000 kas files files are updated following the
multiconfig changes. The pinned commits have been commented out and
the default branch changed to master to allow the file to build valid
images.

Signed-off-by: Drew Reed <Drew.Reed@arm.com>
---
 ci/corstone1000-common.yml               | 39 +----------------------
 ci/corstone1000-firmware-only.yml        | 20 ++----------
 kas/corstone1000-base.yml                | 19 ++++++-----
 kas/corstone1000-firmware-only.yml       | 21 +++++++++++++
 kas/corstone1000-fvp.yml                 | 21 ++++++++-----
 kas/corstone1000-image-configuration.yml | 40 ++++++++++++++++++++++++
 kas/corstone1000-mps3.yml                |  2 ++
 7 files changed, 89 insertions(+), 73 deletions(-)
 create mode 100644 kas/corstone1000-firmware-only.yml
 create mode 100644 kas/corstone1000-image-configuration.yml

diff --git a/ci/corstone1000-common.yml b/ci/corstone1000-common.yml
index 4c715176..7fe9e879 100644
--- a/ci/corstone1000-common.yml
+++ b/ci/corstone1000-common.yml
@@ -4,44 +4,7 @@ header:
     - ci/base.yml
     - ci/meta-openembedded.yml
     - ci/meta-secure-core.yml
-
-local_conf_header:
-  extrapackages: |
-    # Intentionally blank to prevent perf from being added to the image =
in base.yml
-
-  firmwarebuild: |
-    # Only needed as kas doesn't add it automatically unless you have 2 =
targets in seperate configs
-    BBMULTICONFIG ?=3D "firmware"
-
-  distrosetup: |
-    DISTRO_FEATURES =3D "usbhost ipv4"
-
-  initramfsetup: |
-    # Telling the build system which image is responsible of the generat=
ion of the initramfs rootfs
-    INITRAMFS_IMAGE_BUNDLE:firmware =3D "1"
-    INITRAMFS_IMAGE:firmware ?=3D "core-image-minimal"
-    IMAGE_FSTYPES:firmware:pn-core-image-minimal =3D "${INITRAMFS_FSTYPE=
S}"
-    IMAGE_NAME_SUFFIX:firmware =3D ""
-
-    # enable mdev/busybox for init
-    INIT_MANAGER:firmware =3D "mdev-busybox"
-    VIRTUAL-RUNTIME_init_manager:firmware =3D "busybox"
-
-    # prevent the kernel image from being included in the intramfs rootf=
s
-    PACKAGE_EXCLUDE:firmware +=3D "kernel-image-*"
-
-    # Disable openssl in kmod to shrink the initramfs size
-    PACKAGECONFIG:remove:firmware:pn-kmod =3D "openssl"
-
-  imageextras: |
-    # Don't include kernel binary in rootfs /boot path
-    RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base =3D ""
-
-    # all optee packages
-    CORE_IMAGE_EXTRA_INSTALL +=3D "optee-client"
-
-    # TS PSA API tests commands for crypto, its, ps and iat
-    CORE_IMAGE_EXTRA_INSTALL +=3D "packagegroup-ts-tests-psa"
+    - kas/corstone1000-image-configuration.yml
=20
 target:
   - core-image-minimal
diff --git a/ci/corstone1000-firmware-only.yml b/ci/corstone1000-firmware=
-only.yml
index 9cc4299a..8af0146a 100644
--- a/ci/corstone1000-firmware-only.yml
+++ b/ci/corstone1000-firmware-only.yml
@@ -1,24 +1,8 @@
 ---
 header:
   version: 14
-
-local_conf_header:
-  rescuebuild: |
-    # Need to ensure the rescue linux options are selected
-    OVERRIDES .=3D ":firmware"
-
-    # Need to ensure we build with a small libc
-    TCLIBC=3D"musl"
-
-  mass-storage: |
-    # Ensure the Mass Storage device is absent
-    FVP_CONFIG[board.msd_mmc.p_mmc_file] =3D "invalid.dat"
-
-  test-configuration: |
-    TEST_SUITES =3D "_qemutiny ping"
-    # Remove Dropbear SSH as it will not fit into the corstone1000 image=
.
-    IMAGE_FEATURES:remove =3D "ssh-server-dropbear"
-    CORE_IMAGE_EXTRA_INSTALL:remove =3D "ssh-pregen-hostkeys"
+  includes:
+    - kas/corstone1000-firmware-only.yml
=20
 target:
   - corstone1000-flash-firmware-image
diff --git a/kas/corstone1000-base.yml b/kas/corstone1000-base.yml
index 1ab65455..a8b98603 100644
--- a/kas/corstone1000-base.yml
+++ b/kas/corstone1000-base.yml
@@ -1,14 +1,11 @@
 header:
   version: 14
=20
-env:
-  DISPLAY: ""
-
-distro: poky-tiny
+distro: poky
=20
 defaults:
   repos:
-    branch: nanbield
+    branch: master
=20
 repos:
   meta-arm:
@@ -19,14 +16,14 @@ repos:
=20
   poky:
     url: https://git.yoctoproject.org/git/poky
-    commit: 2e9c2a2381105f1306bcbcb54816cbc5d8110eff
+    # commit: 2e9c2a2381105f1306bcbcb54816cbc5d8110eff
     layers:
       meta:
       meta-poky:
=20
   meta-openembedded:
     url: https://git.openembedded.org/meta-openembedded
-    commit: 1750c66ae8e4268c472c0b2b94748a59d6ef866d
+    # commit: 1750c66ae8e4268c472c0b2b94748a59d6ef866d
     layers:
       meta-oe:
       meta-python:
@@ -34,15 +31,17 @@ repos:
=20
   meta-secure-core:
     url: https://github.com/wind-river/meta-secure-core.git
-    commit: e29165a1031dcf601edbed1733cedd64826672a5
+    # commit: e29165a1031dcf601edbed1733cedd64826672a5
     layers:
-      meta:
+      meta-secure-core-common:
       meta-signing-key:
       meta-efi-secure-boot:
=20
 local_conf_header:
   base: |
     CONF_VERSION =3D "2"
+
+  setup: |
     PACKAGE_CLASSES =3D "package_ipk"
     BB_NUMBER_THREADS ?=3D "16"
     PARALLEL_MAKE ?=3D "-j16"
@@ -51,4 +50,4 @@ local_conf_header:
 machine: unset
=20
 target:
-  - corstone1000-image
+  - corstone1000-flash-firmware-image
diff --git a/kas/corstone1000-firmware-only.yml b/kas/corstone1000-firmwa=
re-only.yml
new file mode 100644
index 00000000..f1640367
--- /dev/null
+++ b/kas/corstone1000-firmware-only.yml
@@ -0,0 +1,21 @@
+---
+header:
+  version: 14
+
+local_conf_header:
+  firmwarebuild: |
+    # Need to ensure the rescue linux options are selected
+    OVERRIDES .=3D ":firmware"
+
+    # Need to ensure we build with a small libc
+    TCLIBC=3D"musl"
+
+  mass-storage: |
+    # Ensure the Mass Storage device is absent
+    FVP_CONFIG[board.msd_mmc.p_mmc_file] =3D "invalid.dat"
+
+  test-configuration: |
+    TEST_SUITES =3D "_qemutiny ping"
+    # Remove Dropbear SSH as it will not fit into the corstone1000 image=
.
+    IMAGE_FEATURES:remove =3D "ssh-server-dropbear"
+    CORE_IMAGE_EXTRA_INSTALL:remove =3D "ssh-pregen-hostkeys"
diff --git a/kas/corstone1000-fvp.yml b/kas/corstone1000-fvp.yml
index abf40703..0d6d5fee 100644
--- a/kas/corstone1000-fvp.yml
+++ b/kas/corstone1000-fvp.yml
@@ -2,15 +2,22 @@ header:
   version: 14
   includes:
     - kas/corstone1000-base.yml
+    - kas/corstone1000-image-configuration.yml
+    - kas/corstone1000-firmware-only.yml
     - kas/fvp-eula.yml
=20
-machine: corstone1000-fvp
+env:
+  DISPLAY:
+  WAYLAND_DISPLAY:
+  XAUTHORITY:
=20
 local_conf_header:
-    fvp-config: |
-        # Remove Dropbear SSH as it will not fit into the corstone1000 i=
mage.
-        IMAGE_FEATURES:remove =3D " ssh-server-dropbear"
-        INHERIT +=3D "fvpboot"
+  testimagefvp: |
+    LICENSE_FLAGS_ACCEPTED +=3D "Arm-FVP-EULA"
+    IMAGE_CLASSES +=3D "fvpboot"
+
+  mass-storage: |
+    # Ensure the Mass Storage device is absent
+    FVP_CONFIG[board.msd_mmc.p_mmc_file] =3D "invalid.dat"
=20
-target:
-  - corstone1000-image
+machine: corstone1000-fvp
diff --git a/kas/corstone1000-image-configuration.yml b/kas/corstone1000-=
image-configuration.yml
new file mode 100644
index 00000000..2b285223
--- /dev/null
+++ b/kas/corstone1000-image-configuration.yml
@@ -0,0 +1,40 @@
+header:
+  version: 14
+
+local_conf_header:
+  extrapackages: |
+    # Intentionally blank to prevent perf from being added to the image =
in base.yml
+
+  firmwarebuild: |
+    # Only needed as kas doesn't add it automatically unless you have 2 =
targets in seperate configs
+    BBMULTICONFIG ?=3D "firmware"
+
+  distrosetup: |
+    DISTRO_FEATURES =3D "usbhost ipv4"
+
+  initramfsetup: |
+    # Telling the build system which image is responsible of the generat=
ion of the initramfs rootfs
+    INITRAMFS_IMAGE_BUNDLE:firmware =3D "1"
+    INITRAMFS_IMAGE:firmware ?=3D "core-image-minimal"
+    IMAGE_FSTYPES:firmware:pn-core-image-minimal =3D "${INITRAMFS_FSTYPE=
S}"
+    IMAGE_NAME_SUFFIX:firmware =3D ""
+
+    # enable mdev/busybox for init
+    INIT_MANAGER:firmware =3D "mdev-busybox"
+    VIRTUAL-RUNTIME_init_manager:firmware =3D "busybox"
+
+    # prevent the kernel image from being included in the intramfs rootf=
s
+    PACKAGE_EXCLUDE:firmware +=3D "kernel-image-*"
+
+    # Disable openssl in kmod to shrink the initramfs size
+    PACKAGECONFIG:remove:firmware:pn-kmod =3D "openssl"
+
+  imageextras: |
+    # Don't include kernel binary in rootfs /boot path
+    RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base =3D ""
+
+    # all optee packages
+    CORE_IMAGE_EXTRA_INSTALL +=3D "optee-client"
+
+    # TS PSA API tests commands for crypto, its, ps and iat
+    CORE_IMAGE_EXTRA_INSTALL +=3D "packagegroup-ts-tests-psa"
diff --git a/kas/corstone1000-mps3.yml b/kas/corstone1000-mps3.yml
index 7d63a185..30f465a2 100644
--- a/kas/corstone1000-mps3.yml
+++ b/kas/corstone1000-mps3.yml
@@ -2,5 +2,7 @@ header:
   version: 14
   includes:
     - kas/corstone1000-base.yml
+    - kas/corstone1000-image-configuration.yml
+    - kas/corstone1000-firmware-only.yml
=20
 machine: corstone1000-mps3
--=20
2.44.0


