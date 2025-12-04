Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 309B9D21696
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 15:25:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46097.1764861914255241626
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 07:25:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CE841575;
	Thu,  4 Dec 2025 07:25:06 -0800 (PST)
Received: from LXKV206JHX.arm.com (unknown [10.57.43.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07EE33F59E;
	Thu,  4 Dec 2025 07:25:12 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>,
	Michael Safwat <michael.safwat@arm.com>,
	Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH 1/6] =?UTF-8?q?machine/corstone1000:=20Add=20Cortex?= =?UTF-8?q?=E2=80=91A320=20support?=
Date: Thu,  4 Dec 2025 15:19:48 +0000
Message-ID: <20251204152500.78818-2-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251204152500.78818-1-hugues.kambampiana@arm.com>
References: <20251204152500.78818-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 Dec 2025 15:25:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6780

Enable the Corstone=E2=80=911000 Cortex=E2=80=91A320 variant by:

- Introduce `machine/include/corstone1000-a320.inc` to configure the
  default Ethos=E2=80=91U MAC count when `cortexa320` is in MACHINE_FEATU=
RES,
  and allow override via `ETHOSU_NUM_MACS`.
- Add a KAS profile at `kas/corstone1000-a320.yml` for Cortex=E2=80=91A32=
0
  FVP-based builds.
- Extend corstone1000.inc to detect MACHINE_FEATURES (cortexa320) and
  pull in the matching tune-<core>.inc (default still Cortex-A35).
- Add the `meta-ethos` layer as a dependency of `meta-arm-bsp` for
  Cortex=E2=80=91A320 builds and define a new KMachine override to pull i=
n
  the Ethos=E2=80=91U driver recipe.
- In `conf/machine/corstone1000-fvp.conf`, inspect `MACHINE_FEATURES`
  and set `FVP_EXE` to `FVP_Corstone-1000_with_Cortex-A320` when
  `cortexa320` is enabled, otherwise fall back to `FVP_Corstone-1000`.
- In `recipes-devtools/fvp/fvp-corstone1000.bb`, add a
  `SRC_URI:cortexa320` entry (with checksums) for the Cortex=E2=80=91A320=
 FVP
  build archive.
- Disable the rootfs CPIO file compression so it is not compressed
  twice when bundled with the kernel

Signed-off-by: Michael Safwat <michael.safwat@arm.com>
Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
---
 kas/corstone1000-a320.yml                     | 17 +++++++++++++
 meta-arm-bsp/conf/layer.conf                  |  1 +
 .../conf/machine/corstone1000-fvp.conf        |  4 ++++
 .../machine/include/corstone1000-a320.inc     |  5 ++++
 .../conf/machine/include/corstone1000.inc     |  4 +++-
 .../linux/files/corstone1000/defconfig        |  1 +
 .../linux/linux-arm-platforms.inc             | 22 +++++++++++++++--
 .../recipes-devtools/fvp/fvp-corstone1000.bb  | 24 +++++++++++++++----
 8 files changed, 70 insertions(+), 8 deletions(-)
 create mode 100644 kas/corstone1000-a320.yml
 create mode 100644 meta-arm-bsp/conf/machine/include/corstone1000-a320.i=
nc

diff --git a/kas/corstone1000-a320.yml b/kas/corstone1000-a320.yml
new file mode 100644
index 00000000..8a7739af
--- /dev/null
+++ b/kas/corstone1000-a320.yml
@@ -0,0 +1,17 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
+header:
+  version: 14
+
+local_conf_header:
+  a320: |
+    MACHINE_FEATURES +=3D "cortexa320"
+    OVERRIDES .=3D ":cortexa320"
+
+repos:
+  meta-ethos:
+    url: https://gitlab.arm.com/iot/meta-ethos.git
+    branch: whinlatter
+  meta-sca:
+    url: https://github.com/priv-kweihmann/meta-sca.git
+    branch: master
diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 655a8c96..a06d27d9 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -14,6 +14,7 @@ LAYERSERIES_COMPAT_meta-arm-bsp =3D "walnascar whinlatt=
er"
 LAYERDEPENDS_meta-arm-bsp =3D "core meta-arm"
 # This won't be used by layerindex-fetch, but works everywhere else
 LAYERDEPENDS_meta-arm-bsp:append:corstone1000 =3D " meta-python openembe=
dded-layer efi-secure-boot"
+LAYERDEPENDS_meta-arm-bsp:append:corstone1000:cortexa320 =3D " meta-etho=
s"
 LAYERDEPENDS_meta-arm-bsp:append:musca-b1 =3D " meta-python"
 LAYERDEPENDS_meta-arm-bsp:append:musca-s1 =3D " meta-python"
=20
diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-b=
sp/conf/machine/corstone1000-fvp.conf
index c951de68..9fa2a63d 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -6,6 +6,9 @@ require conf/machine/include/corstone1000.inc
 require ${@bb.utils.contains('MACHINE_FEATURES', 'corstone1000-extsys', =
\
     'conf/machine/include/corstone1000-extsys.inc', '', d)}
=20
+require ${@bb.utils.contains('MACHINE_FEATURES', 'cortexa320', \
+    'conf/machine/include/corstone1000-a320.inc', '', d)}
+
 TFA_TARGET_PLATFORM =3D "fvp"
=20
 TFM_PLATFORM_IS_FVP =3D "TRUE"
@@ -20,6 +23,7 @@ DEFAULT_TEST_SUITES:append =3D " fvp_boot fvp_devices"
 # FVP Config
 FVP_PROVIDER ?=3D "fvp-corstone1000-native"
 FVP_EXE ?=3D "FVP_Corstone-1000"
+FVP_EXE:cortexa320 =3D "FVP_Corstone-1000-A320"
 FVP_CONSOLES[default] =3D "host_terminal_0"
 FVP_CONSOLES[tf-a] =3D "host_terminal_1"
 FVP_CONSOLES[se] =3D "secenc_terminal"
diff --git a/meta-arm-bsp/conf/machine/include/corstone1000-a320.inc b/me=
ta-arm-bsp/conf/machine/include/corstone1000-a320.inc
new file mode 100644
index 00000000..c7ff2df7
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/corstone1000-a320.inc
@@ -0,0 +1,5 @@
+ETHOSU_NUM_MACS ?=3D "256"
+
+FVP_CONFIG[host.ethosu.num_macs] =3D "${ETHOSU_NUM_MACS}"
+
+IMAGE_INSTALL:append =3D " arm-npu-ethosu"
diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 6027b633..09468c7c 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -1,4 +1,6 @@
-require conf/machine/include/arm/armv8a/tune-cortexa35.inc
+TUNE_FILE =3D "conf/machine/include/arm/armv8a/tune-cortexa35.inc"
+TUNE_FILE:cortexa320 =3D "conf/machine/include/arm/arch-armv9-2a.inc"
+require ${TUNE_FILE}
=20
 MACHINEOVERRIDES =3D. "corstone1000:"
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconf=
ig b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
index d67e9484..bf4be697 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
@@ -122,3 +122,4 @@ CONFIG_EXT4_FS=3Dy
 # CONFIG_EXT4_FS_POSIX_ACL is not set
 # CONFIG_EXT4_FS_SECURITY is not set
 # CONFIG_EXT4_DEBUG is not set
+CONFIG_INITRAMFS_COMPRESSION_NONE=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 8e964e17..ff19169e 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -24,8 +24,6 @@ COMPATIBLE_MACHINE:corstone1000 =3D "${MACHINE}"
 KCONFIG_MODE:corstone1000 =3D "--alldefconfig"
 KMACHINE:corstone1000 =3D "corstone1000"
 LINUX_KERNEL_TYPE:corstone1000 =3D "standard"
-#disabling the rootfs cpio file compression so it is not compressed twic=
e when bundled with the kernel
-KERNEL_EXTRA_ARGS:corstone1000 +=3D "CONFIG_INITRAMFS_COMPRESSION_NONE=3D=
y"
 SRC_URI:append:corstone1000 =3D " \
            file://defconfig  \
         "
@@ -57,6 +55,26 @@ SRC_URI:append:corstone1000 =3D " \
 KERNEL_EXTRA_FEATURES:corstone1000 =3D ""
 KERNEL_FEATURES:corstone1000 =3D ""
=20
+#
+# Corstone1000 with CORTEX-A320 KMACHINE
+#
+FILESEXTRAPATHS:prepend:cortexa320 :=3D "${ARMBSPFILESPATHS}"
+COMPATIBLE_MACHINE:corstone1000:cortexa320 =3D "${MACHINE}"
+KCONFIG_MODE:corstone1000:cortexa320 =3D "--alldefconfig"
+KMACHINE:corstone1000:cortexa320 =3D "corstone1000-a320"
+LINUX_KERNEL_TYPE:corstone1000:cortexa320 =3D "standard"
+SRC_URI:append:corstone1000:cortexa320 =3D " \
+    file://defconfig  \
+"
+
+# Default kernel features not needed for Corstone-1000 with
+# Cortex-A320; otherwise the extra kernel modules will
+# increase the rootfs size but the board has limited flash
+# memory constraints
+KERNEL_EXTRA_FEATURES:corstone1000:cortexa320 =3D ""
+KERNEL_FEATURES:corstone1000:cortexa320 =3D ""
+
+
 #
 # FVP BASE KMACHINE
 #
diff --git a/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb b/meta-arm=
/recipes-devtools/fvp/fvp-corstone1000.bb
index e200d94c..1cf8a457 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb
@@ -1,17 +1,31 @@
 require fvp-ecosystem.inc
=20
 MODEL =3D "Corstone-1000"
+MODEL:cortexa320 =3D "Corstone-1000-with-Cortex-A320"
 MODEL_CODE =3D "FVP_Corstone_1000"
+MODEL_CODE:cortexa320 =3D "FVP_Corstone_1000-A320"
 PV =3D "11.23.25"
+PV:cortexa320 =3D "11.30.27"
+
+FVP_AARCH64_SHA256SUM =3D "e299e81d5fa8b3d2afee0850fd03be31c1a1c3fad07f7=
9849c63e46ee5e36acc"
+FVP_AARCH64_SHA256SUM:cortexa320 =3D "a45898fead5549779153263c3544fa1032=
c285d532275eb678f58cae3317b01f"
+FVP_X86_64_SHA256SUM =3D "ec34c9564ccb5b1eb62fc2757673343a353db1d116a7cb=
1b5f82f9d985d99cdf"
+FVP_X86_64_SHA256SUM:cortexa320 =3D "d57b248a1c1bc5a6040605d50af94a5151a=
dc4da26ec9acc456ec86b819ffb76"
+
+SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Co=
rstone-IoT/${MODEL}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;subdir=3D${BP=
};name=3Dfvp-${HOST_ARCH}"
+SRC_URI[fvp-aarch64.sha256sum] =3D "${FVP_AARCH64_SHA256SUM}"
+SRC_URI[fvp-x86_64.sha256sum] =3D "${FVP_X86_64_SHA256SUM}"
=20
-SRC_URI =3D "https://developer.arm.com/-/media/Arm%20Developer%20Communi=
ty/Downloads/OSS/FVP/${MODEL}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;sub=
dir=3D${BP};name=3Dfvp-${HOST_ARCH}"
-SRC_URI[fvp-aarch64.sha256sum] =3D "e299e81d5fa8b3d2afee0850fd03be31c1a1=
c3fad07f79849c63e46ee5e36acc"
-SRC_URI[fvp-x86_64.sha256sum] =3D "ec34c9564ccb5b1eb62fc2757673343a353db=
1d116a7cb1b5f82f9d985d99cdf"
=20
 # The CSS used in the FVP homepage make it too difficult to query with t=
he tooling currently in Yocto
 UPSTREAM_VERSION_UNKNOWN =3D "1"
=20
-LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
-                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D0c32ac6f58ebff83065105042ab98211"
+LIC_FILES_CHKSUM_MD5 =3D "0c32ac6f58ebff83065105042ab98211"
+LIC_FILES_CHKSUM_MD5:cortexa320 =3D "a5ce56e117d0ab63791fbb7c35ec2211"
+
+LIC_FILES_CHKSUM =3D "\
+    file://license_terms/license_agreement.txt;md5=3D1a33828e132ba71861c=
11688dbb0bd16 \
+    file://license_terms/third_party_licenses/third_party_licenses.txt;m=
d5=3D${LIC_FILES_CHKSUM_MD5} \
+"
=20
 COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux"

