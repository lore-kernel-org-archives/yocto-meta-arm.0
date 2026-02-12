Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66085EB491A
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 12:25:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44229.1770899137615286470
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Feb 2026 04:25:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A746A339
	for <meta-arm@lists.yoctoproject.org>; Thu, 12 Feb 2026 04:25:30 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 240CF3F63F
	for <meta-arm@lists.yoctoproject.org>; Thu, 12 Feb 2026 04:25:36 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] Remove meta-arm-systemready
Date: Thu, 12 Feb 2026 12:25:30 +0000
Message-ID: <20260212122530.342854-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 Feb 2026 12:25:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6910

meta-arm-systemready was intended to allow people writing BSPs to run
the SystemReady Architecture Compliance Suite[1] within the Yocto build
environment. However, whilst this seems like a good idea, there are
several problems:

- This layer only supports the IR band and v2 of the ACS. The ACS is now
  at v3 and the bands altered, so there is no value in running obsolete
  tests.

- Execution of the tests takes a long time, we have integration to run
  the tests on a virtual fvp-base machine but execution takes many tens
  of hours (our CI times out after 12, on a high-performance worker).
  Running the tests in CI, and in particular inside BitBake, isn't
  obviously the right thing to do.

- Execution on the tests on real hardware is not trivial, as testimage
  has virtual targets as a primary usecase. It is unclear if anyone has
  managed to use this layer on physical hardware.

Because of these issues, remove the layer. There are better integration
points for automated ACS testing, and this integration is obsolete.

[1] https://github.com/ARM-software/arm-systemready

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml                                |  19 -
 ci/arm-systemready-firmware.yml               |   6 -
 ci/arm-systemready-ir-acs.yml                 |  19 -
 ci/cve.yml                                    |   1 -
 kas/arm-systemready-firmware.yml              |  12 -
 kas/arm-systemready-ir-acs.yml                |  12 -
 kas/arm-systemready-linux-distros-debian.yml  |   8 -
 kas/arm-systemready-linux-distros-fedora.yml  |   8 -
 ...arm-systemready-linux-distros-opensuse.yml |   8 -
 ...-linux-distros-unattended-installation.yml |  11 -
 meta-arm-bsp/conf/layer.conf                  |   5 -
 .../arm-systemready-ir-acs-fvp-base.inc       |   2 -
 .../arm-systemready-ir-acs.bbappend           |   1 -
 ...rm-systemready-scripts-native-fvp-base.inc |   5 -
 .../arm-systemready-scripts-native.bbappend   |   1 -
 ...-Change-the-expected-SR-result-confi.patch | 227 -----
 .../files/fvp-base/report.txt                 |  34 -
 meta-arm-systemready/README.md                | 148 ---
 .../classes/arm-systemready-acs.bbclass       | 162 ---
 .../classes/extra_imagedepends_only.bbclass   |  27 -
 meta-arm-systemready/conf/layer.conf          |  15 -
 .../arm_systemready_debian_unattended.py      |  66 --
 .../arm_systemready_fedora_unattended.py      |  39 -
 .../runtime/cases/arm_systemready_ir_acs.py   |  37 -
 .../arm_systemready_opensuse_unattended.py    |  42 -
 .../arm-systemready-firmware.bb               |  14 -
 .../python3-construct-native_2.10.68.bb       |  13 -
 .../arm-systemready-ir-acs.bb                 |  63 --
 .../arm-systemready-scripts-native.bb         |  30 -
 ...-Return-non-zero-exit-code-on-failur.patch |  37 -
 ...-sr-results-Device-tree-improvements.patch |  77 --
 .../edk2-test-parser-native.bb                |  25 -
 .../arm-systemready-linux-distros-debian.bb   | 132 ---
 .../arm-systemready-linux-distros-fedora.bb   | 122 ---
 .../arm-systemready-linux-distros-opensuse.bb |  92 --
 ...m-systemready-linux-distros-unattended.inc |  45 -
 .../arm-systemready-linux-distros.inc         |  64 --
 .../unattended-boot-conf/Debian/preseed.cfg   |  75 --
 .../files/unattended-boot-conf/Fedora/ks.cfg  |  39 -
 .../openSUSE/autoinst.xml                     | 935 ------------------
 40 files changed, 2678 deletions(-)
 delete mode 100644 ci/arm-systemready-firmware.yml
 delete mode 100644 ci/arm-systemready-ir-acs.yml
 delete mode 100644 kas/arm-systemready-firmware.yml
 delete mode 100644 kas/arm-systemready-ir-acs.yml
 delete mode 100644 kas/arm-systemready-linux-distros-debian.yml
 delete mode 100644 kas/arm-systemready-linux-distros-fedora.yml
 delete mode 100644 kas/arm-systemready-linux-distros-opensuse.yml
 delete mode 100644 kas/arm-systemready-linux-distros-unattended-installa=
tion.yml
 delete mode 100644 meta-arm-bsp/dynamic-layers/meta-arm-systemready/reci=
pes-test/arm-systemready-acs/arm-systemready-ir-acs-fvp-base.inc
 delete mode 100644 meta-arm-bsp/dynamic-layers/meta-arm-systemready/reci=
pes-test/arm-systemready-acs/arm-systemready-ir-acs.bbappend
 delete mode 100644 meta-arm-bsp/dynamic-layers/meta-arm-systemready/reci=
pes-test/arm-systemready-acs/arm-systemready-scripts-native-fvp-base.inc
 delete mode 100644 meta-arm-bsp/dynamic-layers/meta-arm-systemready/reci=
pes-test/arm-systemready-acs/arm-systemready-scripts-native.bbappend
 delete mode 100644 meta-arm-bsp/dynamic-layers/meta-arm-systemready/reci=
pes-test/arm-systemready-acs/files/fvp-base/0001-check-sr-results-Change-=
the-expected-SR-result-confi.patch
 delete mode 100644 meta-arm-bsp/dynamic-layers/meta-arm-systemready/reci=
pes-test/arm-systemready-acs/files/fvp-base/report.txt
 delete mode 100644 meta-arm-systemready/README.md
 delete mode 100644 meta-arm-systemready/classes/arm-systemready-acs.bbcl=
ass
 delete mode 100644 meta-arm-systemready/classes/extra_imagedepends_only.=
bbclass
 delete mode 100644 meta-arm-systemready/conf/layer.conf
 delete mode 100644 meta-arm-systemready/lib/oeqa/runtime/cases/arm_syste=
mready_debian_unattended.py
 delete mode 100644 meta-arm-systemready/lib/oeqa/runtime/cases/arm_syste=
mready_fedora_unattended.py
 delete mode 100644 meta-arm-systemready/lib/oeqa/runtime/cases/arm_syste=
mready_ir_acs.py
 delete mode 100644 meta-arm-systemready/lib/oeqa/runtime/cases/arm_syste=
mready_opensuse_unattended.py
 delete mode 100644 meta-arm-systemready/recipes-bsp/arm-systemready/arm-=
systemready-firmware.bb
 delete mode 100644 meta-arm-systemready/recipes-devtools/python/python3-=
construct-native_2.10.68.bb
 delete mode 100644 meta-arm-systemready/recipes-test/arm-systemready-acs=
/arm-systemready-ir-acs.bb
 delete mode 100644 meta-arm-systemready/recipes-test/arm-systemready-acs=
/arm-systemready-scripts-native.bb
 delete mode 100644 meta-arm-systemready/recipes-test/arm-systemready-acs=
/arm-systemready-scripts/0001-check-sr-results-Return-non-zero-exit-code-=
on-failur.patch
 delete mode 100644 meta-arm-systemready/recipes-test/arm-systemready-acs=
/arm-systemready-scripts/0002-check-sr-results-Device-tree-improvements.p=
atch
 delete mode 100644 meta-arm-systemready/recipes-test/arm-systemready-acs=
/edk2-test-parser-native.bb
 delete mode 100644 meta-arm-systemready/recipes-test/arm-systemready-lin=
ux-distros/arm-systemready-linux-distros-debian.bb
 delete mode 100644 meta-arm-systemready/recipes-test/arm-systemready-lin=
ux-distros/arm-systemready-linux-distros-fedora.bb
 delete mode 100644 meta-arm-systemready/recipes-test/arm-systemready-lin=
ux-distros/arm-systemready-linux-distros-opensuse.bb
 delete mode 100644 meta-arm-systemready/recipes-test/arm-systemready-lin=
ux-distros/arm-systemready-linux-distros-unattended.inc
 delete mode 100644 meta-arm-systemready/recipes-test/arm-systemready-lin=
ux-distros/arm-systemready-linux-distros.inc
 delete mode 100755 meta-arm-systemready/recipes-test/arm-systemready-lin=
ux-distros/files/unattended-boot-conf/Debian/preseed.cfg
 delete mode 100644 meta-arm-systemready/recipes-test/arm-systemready-lin=
ux-distros/files/unattended-boot-conf/Fedora/ks.cfg
 delete mode 100755 meta-arm-systemready/recipes-test/arm-systemready-lin=
ux-distros/files/unattended-boot-conf/openSUSE/autoinst.xml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ef7cf19045..3d2c3e11e5 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -9,14 +9,10 @@ variables:
   CPU_REQUEST: ""
   # The default machine tag for the build jobs
   DEFAULT_TAG: ""
-  # The machine tag for the ACS test jobs
-  ACS_TAG: "$DEFAULT_TAG"
   # The directory to use as the persistent cache (the root for DL_DIR, S=
STATE_DIR, etc)
   CACHE_DIR: $CI_BUILDS_DIR/persist
   # The container mirror to use
   MIRROR_GHCR: ghcr.io
-  # Whether to run the SystemReady ACS tests
-  ACS_TEST: 0
   # The list of extra Kas fragments to be used when building
   EXTRA_KAS_FILES: ""
   # The NVD API key to use when fetching CVEs
@@ -135,19 +131,6 @@ update-repos:
 #  SECUREDEBUG: [none, secure-debug]
 #  VIRT: [none, xen]
=20
-arm-systemready-ir-acs:
-  extends: .build
-  timeout: 12h
-  parallel:
-    matrix:
-      # arm-systemready-ir-acs must be specified after fvp-base for orde=
ring
-      # purposes for the jobs-to-kas output. It is not enough to just ha=
ve it
-      # in the job name because fvp-base.yml overwrites the target.
-      - PLATFORM: [fvp-base, corstone1000-fvp]
-        ARM_SYSTEMREADY_IR_ACS: arm-systemready-ir-acs
-  tags:
-    - ${ACS_TAG}
-
 # Validate layers are Yocto Project Compatible
 check-layers:
   extends: .setup
@@ -166,7 +149,6 @@ corstone1000-fvp:
         TESTING: [testimage, tftf]
       - FIRMWARE: none
         TESTING: testimage
-      - SYSTEMREADY_FIRMWARE: arm-systemready-firmware
=20
 corstone1000-mps3:
   extends: .build
@@ -208,7 +190,6 @@ fvp-base:
         TESTING: testimage
       - FIRMWARE: [u-boot, edk2]
         TESTING: testimage
-      - SYSTEMREADY_FIRMWARE: arm-systemready-firmware
       - KERNEL: linux-yocto-dev
         LATEST: latest-revisions
         TESTING: testimage
diff --git a/ci/arm-systemready-firmware.yml b/ci/arm-systemready-firmwar=
e.yml
deleted file mode 100644
index 4b9753708f..0000000000
--- a/ci/arm-systemready-firmware.yml
+++ /dev/null
@@ -1,6 +0,0 @@
-# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
-
-header:
-  version: 11
-  includes:
-    - kas/arm-systemready-firmware.yml
diff --git a/ci/arm-systemready-ir-acs.yml b/ci/arm-systemready-ir-acs.ym=
l
deleted file mode 100644
index e31a264b37..0000000000
--- a/ci/arm-systemready-ir-acs.yml
+++ /dev/null
@@ -1,19 +0,0 @@
-# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
-
-header:
-  version: 11
-  includes:
-    - kas/arm-systemready-ir-acs.yml
-
-env:
-  ACS_TEST: "0"
-
-local_conf_header:
-  testimage: |
-    TESTIMAGE_AUTO =3D "${ACS_TEST}"
-
-target:
-  - arm-systemready-ir-acs
-  - arm-systemready-linux-distros-debian
-  - arm-systemready-linux-distros-opensuse
-  - arm-systemready-linux-distros-fedora
diff --git a/ci/cve.yml b/ci/cve.yml
index d060d299ea..5ac2e41241 100644
--- a/ci/cve.yml
+++ b/ci/cve.yml
@@ -15,7 +15,6 @@ local_conf_header:
     CVE_CHECK_SHOW_WARNINGS:layer-arm-toolchain =3D "1"
     CVE_CHECK_SHOW_WARNINGS:layer-meta-arm =3D "1"
     CVE_CHECK_SHOW_WARNINGS:layer-meta-arm-bsp =3D "1"
-    CVE_CHECK_SHOW_WARNINGS:layer-meta-arm-systemready =3D "1"
=20
     # Ignore the kernel, we sometime carry kernels in meta-arm
     CVE_CHECK_SHOW_WARNINGS:pn-linux-yocto =3D "0"
diff --git a/kas/arm-systemready-firmware.yml b/kas/arm-systemready-firmw=
are.yml
deleted file mode 100644
index 8b0b9fd597..0000000000
--- a/kas/arm-systemready-firmware.yml
+++ /dev/null
@@ -1,12 +0,0 @@
-header:
-  version: 13
-
-repos:
-  meta-arm:
-    layers:
-      meta-arm-systemready:
-
-distro: nodistro
-
-target:
-  - arm-systemready-firmware
diff --git a/kas/arm-systemready-ir-acs.yml b/kas/arm-systemready-ir-acs.=
yml
deleted file mode 100644
index aef3e71221..0000000000
--- a/kas/arm-systemready-ir-acs.yml
+++ /dev/null
@@ -1,12 +0,0 @@
-header:
-  version: 13
-  includes:
-    - kas/arm-systemready-firmware.yml
-
-env:
-  TESTIMAGE_AUTO: "1"
-  # The full testimage run typically takes around 12-24h on fvp-base.
-  TEST_OVERALL_TIMEOUT: "${@ 24*60*60}"
-
-target:
-  - arm-systemready-ir-acs
diff --git a/kas/arm-systemready-linux-distros-debian.yml b/kas/arm-syste=
mready-linux-distros-debian.yml
deleted file mode 100644
index a876d671a1..0000000000
--- a/kas/arm-systemready-linux-distros-debian.yml
+++ /dev/null
@@ -1,8 +0,0 @@
-header:
-  version: 13
-  includes:
-    - kas/arm-systemready-firmware.yml
-    - kas/arm-systemready-linux-distros-unattended-installation.yml
-
-target:
-  - arm-systemready-linux-distros-debian
diff --git a/kas/arm-systemready-linux-distros-fedora.yml b/kas/arm-syste=
mready-linux-distros-fedora.yml
deleted file mode 100644
index 2faa19cbaa..0000000000
--- a/kas/arm-systemready-linux-distros-fedora.yml
+++ /dev/null
@@ -1,8 +0,0 @@
-header:
-  version: 16
-  includes:
-    - kas/arm-systemready-firmware.yml
-    - kas/arm-systemready-linux-distros-unattended-installation.yml
-
-target:
-  - arm-systemready-linux-distros-fedora
diff --git a/kas/arm-systemready-linux-distros-opensuse.yml b/kas/arm-sys=
temready-linux-distros-opensuse.yml
deleted file mode 100644
index d2d75fa225..0000000000
--- a/kas/arm-systemready-linux-distros-opensuse.yml
+++ /dev/null
@@ -1,8 +0,0 @@
-header:
-  version: 13
-  includes:
-    - kas/arm-systemready-firmware.yml
-    - kas/arm-systemready-linux-distros-unattended-installation.yml
-
-target:
-  - arm-systemready-linux-distros-opensuse
diff --git a/kas/arm-systemready-linux-distros-unattended-installation.ym=
l b/kas/arm-systemready-linux-distros-unattended-installation.yml
deleted file mode 100644
index 7976186f13..0000000000
--- a/kas/arm-systemready-linux-distros-unattended-installation.yml
+++ /dev/null
@@ -1,11 +0,0 @@
-header:
-  version: 16
-
-env:
-  DISTRO_UNATTENDED_INST_TESTS:
-  # The full testimage run typically takes around 12-24h on fvp-base.
-  TEST_OVERALL_TIMEOUT: "${@ 24*60*60}"
- =20
-local_conf_header:
-  systemready-unattended-inst: |
-    TESTIMAGE_AUTO =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TEST=
S", "1", "", d)}"
diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index a06d27d9ae..a4b348df3d 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -21,11 +21,6 @@ LAYERDEPENDS_meta-arm-bsp:append:musca-s1 =3D " meta-p=
ython"
 # Additional license directories.
 LICENSE_PATH +=3D "${LAYERDIR}/custom-licenses"
=20
-BBFILES_DYNAMIC +=3D " \
-    meta-arm-systemready:${LAYERDIR}/dynamic-layers/meta-arm-systemready=
/*/*/*.bb \
-    meta-arm-systemready:${LAYERDIR}/dynamic-layers/meta-arm-systemready=
/*/*/*.bbappend \
-"
-
 WARN_QA:append:layer-meta-arm-bsp =3D " patch-status"
=20
 addpylib ${LAYERDIR}/lib oeqa
diff --git a/meta-arm-bsp/dynamic-layers/meta-arm-systemready/recipes-tes=
t/arm-systemready-acs/arm-systemready-ir-acs-fvp-base.inc b/meta-arm-bsp/=
dynamic-layers/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-=
systemready-ir-acs-fvp-base.inc
deleted file mode 100644
index 83208770ff..0000000000
--- a/meta-arm-bsp/dynamic-layers/meta-arm-systemready/recipes-test/arm-s=
ystemready-acs/arm-systemready-ir-acs-fvp-base.inc
+++ /dev/null
@@ -1,2 +0,0 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/${MACHINE}:"
-SRC_URI:append =3D " file://report.txt"
diff --git a/meta-arm-bsp/dynamic-layers/meta-arm-systemready/recipes-tes=
t/arm-systemready-acs/arm-systemready-ir-acs.bbappend b/meta-arm-bsp/dyna=
mic-layers/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-syst=
emready-ir-acs.bbappend
deleted file mode 100644
index 397342f439..0000000000
--- a/meta-arm-bsp/dynamic-layers/meta-arm-systemready/recipes-test/arm-s=
ystemready-acs/arm-systemready-ir-acs.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-include arm-systemready-ir-acs-${MACHINE}.inc
diff --git a/meta-arm-bsp/dynamic-layers/meta-arm-systemready/recipes-tes=
t/arm-systemready-acs/arm-systemready-scripts-native-fvp-base.inc b/meta-=
arm-bsp/dynamic-layers/meta-arm-systemready/recipes-test/arm-systemready-=
acs/arm-systemready-scripts-native-fvp-base.inc
deleted file mode 100644
index dc01d0a2fc..0000000000
--- a/meta-arm-bsp/dynamic-layers/meta-arm-systemready/recipes-test/arm-s=
ystemready-acs/arm-systemready-scripts-native-fvp-base.inc
+++ /dev/null
@@ -1,5 +0,0 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/fvp-base:"
-
-SRC_URI:append =3D " \
-    file://0001-check-sr-results-Change-the-expected-SR-result-confi.pat=
ch \
-"
diff --git a/meta-arm-bsp/dynamic-layers/meta-arm-systemready/recipes-tes=
t/arm-systemready-acs/arm-systemready-scripts-native.bbappend b/meta-arm-=
bsp/dynamic-layers/meta-arm-systemready/recipes-test/arm-systemready-acs/=
arm-systemready-scripts-native.bbappend
deleted file mode 100644
index 49c01ee96e..0000000000
--- a/meta-arm-bsp/dynamic-layers/meta-arm-systemready/recipes-test/arm-s=
ystemready-acs/arm-systemready-scripts-native.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-include arm-systemready-scripts-native-${MACHINE}.inc
diff --git a/meta-arm-bsp/dynamic-layers/meta-arm-systemready/recipes-tes=
t/arm-systemready-acs/files/fvp-base/0001-check-sr-results-Change-the-exp=
ected-SR-result-confi.patch b/meta-arm-bsp/dynamic-layers/meta-arm-system=
ready/recipes-test/arm-systemready-acs/files/fvp-base/0001-check-sr-resul=
ts-Change-the-expected-SR-result-confi.patch
deleted file mode 100644
index d2226cb133..0000000000
--- a/meta-arm-bsp/dynamic-layers/meta-arm-systemready/recipes-test/arm-s=
ystemready-acs/files/fvp-base/0001-check-sr-results-Change-the-expected-S=
R-result-confi.patch
+++ /dev/null
@@ -1,227 +0,0 @@
-From e3e0465a25f9b1607b2e5ed42afb7b556aa8b9bc Mon Sep 17 00:00:00 2001
-From: Debbie Martin <Debbie.Martin@arm.com>
-Date: Wed, 4 Oct 2023 18:40:18 +0100
-Subject: [PATCH] [PATCH] check-sr-results: Change the expected SR result
- config
-
-Update the check-sr-results.yaml and format-sr-results.yaml files for th=
e
-Systemready IR suite. These changes are required because of the
-following known differences of fvp-base outputs to those expected by the
-SystemReady scripts.
-
-Changes to check-sr-results.yaml:
-  1. acs-console.log:
-      a. must-have-esp: EFI partition/variable persistence not supported=
 due to
-         FVP reset.
-      b. warn-once-if-contains "-dirty": BL1, BL2, and BL31 have dirty v=
ersions.
-      c. must-contain "efi: ESRT=3D0x" and "'esrt: Reserving ESRT space =
from 0x'":
-         Capsule updates are not supported.
-      d. error-if-contains: "No EFI system partition" and "Failed to per=
sist
-         EFI variables": EFI partition/variable persistence not supporte=
d due to
-         FVP reset.
-  2. acs_results/result.md:
-      a. must-contain "Failure: |0|": Capsule and EFI partition failures=
 make
-         the total 20.
-  3. acs_results/CapsuleApp_ESRT_table_info.log:
-      a. capsuleapp-esrt: Capsule updates are not supported.
-      b. must-contain "'EFI_SYSTEM_RESOURCE_TABLE:'" and
-         "EFI_SYSTEM_RESOURCE_ENTRY": EFI partition/variable persistence=
 not
-         supported due to FVP reset.
-      c. must-contain "FwClass": Capsule updates are not supported.
-      d. error-if-contains "ESRT - Not Found": Capsule updates are not
-         supported.
-  4. acs_results/CapsuleApp_FMP_protocol_info.log:
-      a. warn-if-contains "Aborted test": Capsule updates are not suppor=
ted.
-         This patch also adds must-contain for the specific totals of th=
e test
-         categories due to allowing the "Aborted test" string.
-  5. acs_results/linux_dump/firmware/efi/esrt:
-      a. Remove whole directory because capsule updates are not supporte=
d.
-  6. acs_results/uefi/temp:
-      a. Set min-entries to 0: this defaults to 1 despite the directory =
being
-         optional, so errors if a directory is empty.
-  7. acs_results/uefi_dump:
-      a. min-entries is 13: change this to 11 due to smbiosview.log bein=
g
-         optional and the change to make map.log optional.
-  8. acs_results/uefi_dump/dh.log:
-      a. must-contain "EFISystemPartition": EFI partition/variable persi=
stence
-         not supported due to FVP reset.
-      b. must-contain "FirmwareManagement": Capsule updates are not supp=
orted.
-  9. acs_results/uefi_dump/map.log:
-      a. Make optional because it isn't populated for IR.
-  10. fw:
-      a. Make optional because capsule updates are not supported.
-  11. os-logs:
-      a. Make optional because distro installation isn't done as part of=
 ACS.
-
-Changes to format-sr-results.yaml:
-  1. Remove the SIE section (not supported on fvp-base and, if present, =
causes
-     format-sr-results.py to error).
-
-Upstream-Status: Inappropriate
-Signed-off-by: Debbie Martin <Debbie.Martin@arm.com>
----
- check-sr-results.yaml  | 34 ++++++++++++++--------------------
- format-sr-results.yaml | 15 ---------------
- 2 files changed, 14 insertions(+), 35 deletions(-)
-
-diff --git a/check-sr-results.yaml b/check-sr-results.yaml
-index a4235de..555fb71 100644
---- a/check-sr-results.yaml
-+++ b/check-sr-results.yaml
-@@ -10,7 +10,6 @@ check-sr-results-configuration:
- # The following tree applies to all ACS-IR 2.0 versions.
- tree:
-   - file: acs-console.log
--    must-have-esp:
-     must-contain:
-       - Booting `bbr/bsa'
-       - Press any key to stop the EFI SCT running
-@@ -24,8 +23,6 @@ tree:
-       - 'EFI stub: Booting Linux Kernel...'
-       - 'EFI stub: Using DTB from configuration table'
-       - Linux version
--      - 'efi: ESRT=3D0x'
--      - 'esrt: Reserving ESRT space from 0x'
-       - systemd
-       - Executing FWTS for EBBR
-       - 'Test: UEFI'
-@@ -36,13 +33,9 @@ tree:
-       - ACS run is completed
-       - Please press <Enter> to continue ...
-     warn-once-if-contains:
--      - -dirty
-       - 'EFI stub: ERROR:'
-       - 'FIRMWARE BUG:'
-       - OVERLAP DETECTED
--    error-if-contains:
--      - No EFI system partition
--      - Failed to persist EFI variables
-   - dir: acs_results
-     min-entries: 8  # Allow missing result.md
-     max-entries: 9
-@@ -53,7 +46,7 @@ tree:
-         must-contain:
-           - SCT Summary
-           - Dropped:|0|
--          - Failure:|0|
-+          - Failure:|20|
-           - Warning:|0|
-           - Dropped by group
-           - Failure by group
-@@ -64,16 +57,11 @@ tree:
-         max-entries: 2
-         tree:
-           - file: CapsuleApp_ESRT_table_info.log
--            capsuleapp-esrt:
-             must-contain:
-               - ESRT TABLE
--              - 'EFI_SYSTEM_RESOURCE_TABLE:'
--              - EFI_SYSTEM_RESOURCE_ENTRY
--              - FwClass
-             error-if-contains:
-               - FwResourceCount    - 0x0
-               - FwResourceCountMax - 0x0
--              - ESRT - Not Found
-           - file: CapsuleApp_FMP_protocol_info.log
-             must-contain:
-               - FMP DATA
-@@ -95,9 +83,14 @@ tree:
-               - 'Medium failures: NONE'
-               - 'Low failures: NONE'
-               - 'Other failures: NONE'
-+              - 'dt_base        |    3|     |     |     |     |     |'
-+              - 'esrt           |     |     |    2|     |     |     |'
-+              - 'uefibootpath   |     |     |     |     |     |     |'
-+              - 'uefirtmisc     |    1|     |     |     |    8|     |'
-+              - 'uefirttime     |    4|     |     |     |   35|     |'
-+              - 'uefirtvariable |    2|     |     |     |   10|     |'
-+              - 'uefivarinfo    |     |     |     |     |    1|     |'
-               - 'Total:'
--            warn-if-contains:
--              - Aborted test
-             error-if-contains:
-               - FAILED
-               - This is an invalid entry.
-@@ -180,6 +173,7 @@ tree:
-                     tree:
-                       - file: OsIndicationsSupported-*
-                   - dir: esrt
-+                    optional:
-                     tree:
-                       - dir: entries
-                         tree:
-@@ -314,8 +308,9 @@ tree:
-               - BSA tests complete. Reset the system.
-           - dir: temp   # This sometimes remains; ignore it
-             optional:
-+            min-entries: 0
-       - dir: uefi_dump
--        min-entries: 13
-+        min-entries: 11
-         max-entries: 13
-         tree:
-           - file: bcfg.log
-@@ -331,8 +326,6 @@ tree:
-             must-contain:
-               - Handle dump
-               - DevicePath
--              - EFISystemPartition
--              - FirmwareManagement
-               - SimpleTextOut
-           - file: dmem.log
-             must-contain:
-@@ -355,6 +348,7 @@ tree:
-               - DRIVER NAME
-           - file: ifconfig.log
-           - file: map.log
-+            optional:
-             must-contain:
-               - Mapping table
-               - /HD(1,GPT,
-@@ -392,7 +386,7 @@ tree:
-   - dir: docs
-     optional:
-   - dir: fw
--    min-entries: 3
-+    optional:
-     tree:
-       - file: u-boot-sniff.log
-         must-contain:
-@@ -500,7 +494,7 @@ tree:
-   - dir: manual-results
-     optional:
-   - dir: os-logs
--    min-entries: 2
-+    optional:
-     tree:
-       - file: 'OS-image-download-links.txt'
-         optional:
-diff --git a/format-sr-results.yaml b/format-sr-results.yaml
-index dd34cd6..20b69de 100644
---- a/format-sr-results.yaml
-+++ b/format-sr-results.yaml
-@@ -47,21 +47,6 @@ subs:
-         extract:
-           filename: "acs_results/linux_dump/firmware/devicetree/base/ps=
ci/\
-             compatible"
--  - heading: BBSR Compliance
--    paragraph: TBD
--    subs:
--      - heading: SIE SCT
--        extract:
--          filename: acs_results/SIE/result.md
--          find: '# SCT Summary'
--          first-line: 4
--          last-line:
--        paragraph: TBD
--      - heading: SIE FWTS
--        extract:
--          filename: acs_results/SIE/fwts/FWTSResults.log
--          find: Test Failure Summary
--        paragraph: TBD
-   - heading: BSA Compliance (informative)
-     paragraph: TBD
-     subs:
---
-2.25.1
-
diff --git a/meta-arm-bsp/dynamic-layers/meta-arm-systemready/recipes-tes=
t/arm-systemready-acs/files/fvp-base/report.txt b/meta-arm-bsp/dynamic-la=
yers/meta-arm-systemready/recipes-test/arm-systemready-acs/files/fvp-base=
/report.txt
deleted file mode 100644
index f4363b7092..0000000000
--- a/meta-arm-bsp/dynamic-layers/meta-arm-systemready/recipes-test/arm-s=
ystemready-acs/files/fvp-base/report.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-General information
--------------------
-- Arm SystemReady Band: IR
-- System name: FVP Base A AEM
-- Prepared by:
-- E-mail:
-- Date:
-
-System information
-------------------
-- Company: Arm
-- System: FVP Base A AEM
-- SoC:
-- FW version:
-- Memory:
-- Storage devices / disks:
-- Network controllers:
-- Other Hardware information:
-
-Test Logs and Results
----------------------
-- ACS version used: 2.0
-- ACS URL (if pre-built binary): https://github.com/ARM-software/arm-sys=
temready/blob/v23.03_IR_2.0.0/IR/prebuilt_images/v23.03_2.0.0/ir-acs-live=
-image-generic-arm64.wic.xz
-- Changes to ACS (if built from source):
-
-- Test Logs collected
-[X] ACS - SCT
-[X] ACS - BSA - UEFI
-[X] ACS - BSA - Linux
-[X] ACS - FWTS
-[X] ACS - Linux boot log
-[X] ACS - Linux dumps
-[X] ACS - UEFI Shell dumps
-[ ] ACS - Capsule Update
diff --git a/meta-arm-systemready/README.md b/meta-arm-systemready/README=
.md
deleted file mode 100644
index 73cd188dd6..0000000000
--- a/meta-arm-systemready/README.md
+++ /dev/null
@@ -1,148 +0,0 @@
-# meta-arm-systemready Yocto Layer
-
-This layer contains classes and recipes for building and running
-[Arm SystemReady][] validation on the supported machines.
-
-Information regarding contributing, reporting bugs, etc can be found in =
the
-top-level meta-arm [README.md](../README.md) file.
-
-## Introduction
-
-This layer provides support for the following on supported machines:
-
-* Building the firmware for the [Arm SystemReady][] certification progra=
m
-* Running [Arm SystemReady ACS][] (Architecture Compliance Suite) tests
-* Running Linux distributions installation tests
-
-This layer is designed to work alongside with a BSP layer. For example, =
the
-[`meta-arm-bsp`][] layer in the top-level meta-arm defines the
-[`fvp-base`][] machine, which can be used with the recipes provided by t=
his
-layer to build the firmware, run the [Arm SystemReady IR][] ACS tests, a=
nd
-run Linux distributions installation. **Note** that users can use this l=
ayer
-with their BSP layer to perform the same build and tests.
-
-### Firmware Build
-
-The `arm-systemready-firmware.bb` recipe is to build the firmware. It re=
quires
-the `ARM_SYSTEMREADY_FIRMWARE` variable set at the MACHINE configuration=
 level
-to list the build dependencies.
-
-### ACS Tests
-
-The recipe to run the ACS tests fetches and deploys the prebuilt ACS tes=
t suite
-disk image, and generates the necessary metadata to support executing th=
e test
-suite using the bitbake `testimage` task. A test case `SystemReadyACSTes=
t` is
-introduced in `lib/oeqa/runtime/cases` to monitor the ACS tests output f=
rom the
-bitbake `testimage` task. The `ARM_SYSTEMREADY_ACS_CONSOLE` variable mus=
t be set
-at the MACHINE configuration level for this test case.
-
-There are two additional recipes for generating the Arm SystemReady ACS =
tests
-report files through the use of the [EDK2 SCT Results Parser][] and the
-[Arm SystemReady scripts][]. These packages are installed in the
-`edk2-test-parser-native.bb` and `arm-systemready-scripts-native.bb` rec=
ipes
-respectively.
-
-The class `arm-systemready-acs.bbclass` implements the common logic to d=
eploy
-the Arm SystemReady ACS prebuilt image and set up the `testimage` enviro=
nment.
-This class also contains a `testimage` `"postfunc"` called `acs_logs_han=
dle`
-which generates report files and analyzes the test results.
-
-The test result analysis is performed by first using the EDK2 SCT Result=
s
-Parser to create a results.md file, then running the Arm SystemReady res=
ult
-check script to check the contents of the result partition as well as th=
e
-console log. The result check will fail if any of the expected files or
-directories are missing, or if any file's contents do not pass its file-=
specific
-checks.
-
-The ACS test results which are checked by the script can be viewed in
-`${TMPDIR}/work/aarch64-oe-linux/arm-systemready-ir-acs/2.0.0-r0/testima=
ge/`. If
-the check fails, the bitbake `testimage` task will fail.
-
-
-### Linux Distributions Installation
-
-Recipes for testing the installation of Linux distributions are provided=
 under
-`recipes-test/arm-systemready-linux-distros`. These recipes help to down=
load the
-installation CD for the Linux distribution and generate an empty disk as=
 the
-target disk for the installation.
-
-## Supported Band and Machine
-
-Arm SystemReady has four bands:
-* [Arm SystemReady SR][]
-* [Arm SystemReady ES][]
-* [Arm SystemReady IR][]
-* [Arm SystemReady LS][]
-
-Currently, this layer only supports
-[Arm SystemReady IR ACS version v23.03_2.0.0][], which is verified on th=
e
-[`fvp-base`][] machine.
-
-## Build and Run
-
-To build the firmware for Arm SystemReady on the supported machines (tak=
e the
-`fvp-base` machine as an example):
-
-    ARM_FVP_EULA_ACCEPT=3D1 kas build kas/fvp-base.yml:kas/arm-systemrea=
dy-firmware.yml
-
-
-To run the Arm SystemReady ACS tests on the supported machines (take run=
ning
-Arm SystemReady IR on the `fvp-base` machine as an example):
-
-    ARM_FVP_EULA_ACCEPT=3D1 kas build kas/fvp-base.yml:kas/arm-systemrea=
dy-ir-acs.yml
-
-To run the Linux distributions installation on the supported machines (t=
ake
-installing openSUSE on the `fvp-base` machine as an example):
-
-    ARM_FVP_EULA_ACCEPT=3D1 kas build kas/fvp-base.yml:kas/arm-systemrea=
dy-linux-distros-opensuse.yml
-
-    kas shell \
-        kas/fvp-base.yml:kas/arm-systemready-linux-distros-opensuse.yml =
\
-        -c "../scripts/runfvp --verbose --console"
-
-## Guidelines for Reusing and Extending
-
-Currently, this layer only supports the Arm SystemReady IR band running =
on the
-`fvp-base` machine defined in the `meta-arm-bsp` layer. The supported Ar=
m
-SystemReady IR implementation can be reused on other machines. Furthermo=
re, the
-current implementation can be further extended to support SR, ES and LS =
bands.
-
-### Reuse
-
-To reuse the supported Arm SystemReady IR on other machines, you will ne=
ed to:
-
-1. Set the `ARM_SYSTEMREADY_FIRMWARE` variable at the MACHINE configurat=
ion
-   level to list the build dependencies. The configuration file of the
-   [`fvp-base`][] machine can be used as a reference.
-2. Set the `ARM_SYSTEMREADY_ACS_CONSOLE` variable at the MACHINE configu=
ration
-   level for running the ACS tests in the bitbake `testimage` task. Also=
 refer
-   to the configuration file of the [`fvp-base`][] machine.
-
-### Extend
-
-To extend support for other bands, you will need to:
-
-1. Add a new recipe to inherit `arm-systemready-acs.bbclass`. You can us=
e
-   [`arm-systemready-ir-acs.bb`][] as a reference.
-2. Add a new `testimage` test case for the newly added band. Refer to
-   [`arm_systemready_ir_acs.py`][].
-3. Set the necessary variables and prepare the ACS baseline files (as li=
sted in
-   the above **Reuse** section) at the MACHINE configuration level from =
the BSP
-   layer for the machine to be supported.
-
-**Note**: When reusing and extending, the current classes and libs may n=
eed to
-be modified or refactored as necessary.
-
-[Arm SystemReady]: https://www.arm.com/architecture/system-architectures=
/systemready-certification-program
-[Arm SystemReady ACS]: https://github.com/ARM-software/arm-systemready
-[Arm SystemReady SR]: https://www.arm.com/architecture/system-architectu=
res/systemready-certification-program/sr
-[Arm SystemReady ES]: https://www.arm.com/architecture/system-architectu=
res/systemready-certification-program/es
-[Arm SystemReady IR]: https://www.arm.com/architecture/system-architectu=
res/systemready-certification-program/ir
-[Arm SystemReady LS]: https://www.arm.com/architecture/system-architectu=
res/systemready-certification-program/ls
-[Arm SystemReady IR ACS version v23.03_2.0.0]: https://github.com/ARM-so=
ftware/arm-systemready/tree/main/IR/prebuilt_images/v23.03_2.0.0
-[Arm SystemReady scripts]: https://gitlab.arm.com/systemready/systemread=
y-scripts
-[EDK2 SCT Results Parser]: https://gitlab.arm.com/systemready/edk2-test-=
parser
-[`arm-systemready-ir-acs.bb`]: recipes-test/arm-systemready-acs/arm-syst=
emready-ir-acs.bb
-[`arm_systemready_ir_acs.py`]: lib/oeqa/runtime/cases/arm_systemready_ir=
_acs.py
-[`meta-arm-bsp`]: ../meta-arm-bsp
-[`fvp-base`]: ../meta-arm-bsp/conf/machine/fvp-base.conf
diff --git a/meta-arm-systemready/classes/arm-systemready-acs.bbclass b/m=
eta-arm-systemready/classes/arm-systemready-acs.bbclass
deleted file mode 100644
index d817b69321..0000000000
--- a/meta-arm-systemready/classes/arm-systemready-acs.bbclass
+++ /dev/null
@@ -1,162 +0,0 @@
-# This class contains the common logic to deploy the SystemReady ACS pre=
-built
-# image and set up the testimage environment. It is to be inherited by r=
ecipes
-# which contains the URI to download the SystemReady ACS image.
-# This class also contains a testimage "postfunc" called acs_logs_handle=
 which
-# performs the following functions after the tests have completed:
-#   * Extract the acs_results directory from the Wic image to
-#     ${WORKDIR}/testimage
-#   * Create a symlink to the acs_results in ${TMPDIR}/log/oeqa for ease=
 of
-#     access
-#   * Run the test parser, format results, and check results routines
-
-INHIBIT_DEFAULT_DEPS =3D "1"
-COMPATIBLE_HOST =3D "aarch64-*"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-inherit nopackages deploy rootfs-postcommands ${IMAGE_CLASSES} python3na=
tive testimage
-
-do_configure[noexec] =3D "1"
-do_compile[noexec] =3D "1"
-do_install[noexec] =3D "1"
-
-# Deploy with this suffix so it is picked up in the machine configuratio=
n
-IMAGE_DEPLOY_SUFFIX ?=3D ".wic"
-
-# Post-process commands may write to IMGDEPLOYDIR
-IMGDEPLOYDIR =3D "${DEPLOYDIR}"
-# Write the test data in IMAGE_POSTPROCESS_COMMAND
-IMAGE_POSTPROCESS_COMMAND +=3D "write_image_test_data; "
-
-python do_deploy() {
-    deploydir =3D d.getVar('DEPLOYDIR')
-    suffix =3D d.getVar('IMAGE_DEPLOY_SUFFIX')
-    imgfile =3D os.path.join(d.getVar('UNPACKDIR'), d.getVar('IMAGE_FILE=
NAME'))
-    deployfile =3D os.path.join(deploydir, d.getVar('IMAGE_NAME') + suff=
ix)
-    linkfile =3D os.path.join(deploydir, d.getVar('IMAGE_LINK_NAME') + s=
uffix)
-
-    # Install the image file in the deploy directory
-    import shutil
-    shutil.copyfile(imgfile, deployfile)
-    if os.path.lexists(linkfile):
-        os.remove(manifest_link)
-    os.symlink(os.path.basename(deployfile), linkfile)
-
-    # Run the image post-process commands
-    from oe.utils import execute_pre_post_process
-    post_process_cmds =3D d.getVar("IMAGE_POSTPROCESS_COMMAND")
-    execute_pre_post_process(d, post_process_cmds)
-
-    # Copy the report.txt to DEPLOYDIR
-    # The machine-specific implementation can optionally put the report =
file in
-    # ${UNPACKDIR}/report.txt. If there is no such file present, use the=
 template.
-    unpackdir =3D d.getVar('UNPACKDIR')
-    report_file =3D os.path.join(unpackdir, "report.txt")
-    report_file_dest =3D os.path.join(deploydir, "report.txt")
-    if os.path.exists(report_file):
-        report_file_to_copy =3D report_file
-    else:
-        report_file_to_copy =3D os.path.join(unpackdir, "systemready-ir-=
template",
-                                            "report.txt")
-    shutil.copyfile(report_file_to_copy, report_file_dest)
-
-    # Ensure an empty rootfs manifest exists (required by testimage)
-    fname =3D os.path.join(deploydir, d.getVar('IMAGE_LINK_NAME') + ".ma=
nifest")
-    open(fname, 'w').close()
-}
-addtask deploy after do_install before do_image_complete
-
-do_image_complete() {
-    true
-}
-addtask image_complete after do_deploy before do_build
-do_image_complete[depends] +=3D "arm-systemready-firmware:do_image_compl=
ete"
-
-ACS_LOG_NAME =3D "acs_results_${DATETIME}"
-ACS_LOG_NAME[vardepsexclude] +=3D "DATETIME"
-ACS_LOG_DIR =3D "${TEST_LOG_DIR}/${ACS_LOG_NAME}"
-ACS_LOG_LINK =3D "${TEST_LOG_DIR}/acs_results"
-TEST_LOG_DIR =3D "${WORKDIR}/testimage"
-RM_WORK_EXCLUDE_ITEMS +=3D "${@ os.path.basename(d.getVar('TEST_LOG_DIR'=
)) }"
-
-do_testimage[postfuncs] +=3D "acs_logs_handle"
-do_testimage[depends] +=3D "edk2-test-parser-native:do_populate_sysroot =
\
-                          arm-systemready-scripts-native:do_populate_sys=
root \
-                          mtools-native:do_populate_sysroot \
-                          parted-native:do_populate_sysroot"
-
-# Process the logs
-python acs_logs_handle() {
-    import logging
-    from oeqa.utils import make_logger_bitbake_compatible, get_json_resu=
lt_dir
-    import shutil
-
-    deploy_dir_image =3D d.getVar('DEPLOY_DIR_IMAGE')
-    systemready_scripts_dir =3D os.path.join(d.getVar('STAGING_LIBDIR_NA=
TIVE'),
-                                           "systemready_scripts")
-    edk2_test_parser_dir =3D os.path.join(d.getVar('STAGING_LIBDIR_NATIV=
E'),
-                                        "edk2_test_parser")
-    deployfile =3D os.path.join(deploy_dir_image, d.getVar('IMAGE_LINK_N=
AME')
-                              + d.getVar('IMAGE_DEPLOY_SUFFIX'))
-
-    testimage_dir =3D d.getVar('TEST_LOG_DIR')
-    logdir =3D d.getVar('ACS_LOG_DIR')
-    loglink =3D d.getVar('ACS_LOG_LINK')
-
-    # Copy the report.txt file from DEPLOY_DIR_IMAGE
-    report_file =3D os.path.join(deploy_dir_image, "report.txt")
-    report_file_dest =3D os.path.join(testimage_dir, "report.txt")
-    shutil.copyfile(report_file, report_file_dest)
-
-    # Extract the log files from the Wic image to the testimage logs dir=
ectory
-    resultspath =3D deployfile + ':3/acs_results'
-    import subprocess
-    subprocess.run(['wic', 'cp', resultspath, logdir], check=3DTrue)
-
-    # Create a symlink to the acs_results directory
-    if os.path.lexists(loglink):
-        os.remove(loglink)
-    os.symlink(os.path.basename(logdir), loglink)
-
-    # Create a top-level symlink to the acs_results directory
-    top_logdir =3D os.path.join(get_json_result_dir(d), d.getVar("PN"))
-    log_name =3D d.getVar('ACS_LOG_NAME')
-    top_link =3D os.path.join(top_logdir, log_name)
-    log_target =3D os.path.relpath(logdir, top_logdir)
-    os.symlink(log_target, top_link)
-
-    # Parse the logs and generate results file
-    logger =3D make_logger_bitbake_compatible(logging.getLogger("BitBake=
"))
-
-    sct_log =3D os.path.join(logdir, 'sct_results', 'Overall', 'Summary.=
ekl')
-    sct_seq =3D os.path.join(logdir, 'sct_results', 'Sequence', 'EBBR.se=
q')
-
-    parser_path =3D os.path.join(edk2_test_parser_dir, "parser.py")
-    # format-sr-results.py needs the output file to be called "result.md=
"
-    subprocess.run([parser_path, sct_log, sct_seq, "--md",
-                   os.path.join(logdir, "result.md")], check=3DTrue)
-
-    scripts_path =3D os.path.join(systemready_scripts_dir,
-                                "format-sr-results.py")
-    summary_path =3D os.path.join(testimage_dir, "summary.md")
-    subprocess.run([scripts_path, "--dir", testimage_dir, "--md", summar=
y_path],
-                   check=3DTrue)
-
-    # Symlink acs-console.log to default_log
-    subprocess.run(["ln", "-sf", os.path.join(testimage_dir, "default_lo=
g"),
-                    os.path.join(testimage_dir, "acs-console.log")], che=
ck=3DTrue)
-
-    # Run the check-sr-results.py systemready script to check the result=
s
-    check_sr_results_log_path =3D os.path.join(testimage_dir,
-                                             "check_sr_results.log")
-    with open(check_sr_results_log_path, "w") as f:
-        check_sr_results_path =3D os.path.join(systemready_scripts_dir,
-                                            "check-sr-results.py")
-        try:
-            subprocess.run([check_sr_results_path, "--dir", testimage_di=
r,
-                            "--print-meta", "--debug"],
-                           stdout=3Df, stderr=3Df, text=3DTrue, check=3D=
True)
-        except subprocess.CalledProcessError:
-            logger.error(f"ACS run failed the check SystemReady results.=
 See "
-                         f"{summary_path} and {check_sr_results_log_path=
} for "
-                         f"details of the error.")
-            raise bb.BBHandledException()
-}
diff --git a/meta-arm-systemready/classes/extra_imagedepends_only.bbclass=
 b/meta-arm-systemready/classes/extra_imagedepends_only.bbclass
deleted file mode 100644
index 224b724e72..0000000000
--- a/meta-arm-systemready/classes/extra_imagedepends_only.bbclass
+++ /dev/null
@@ -1,27 +0,0 @@
-# This class is to be inherited by recipes interested in only deploying =
what is
-# listed in the EXTRA_IMAGEDEPENDS.
-# It is inheriting the image.bbclass to make sure that the
-# image_license.manifest is generated.
-
-IMAGE_FSTYPES =3D ""
-
-inherit image
-
-IMAGE_FEATURES =3D ""
-EXTRA_IMAGE_FEATURES =3D ""
-
-INHIBIT_DEFAULT_DEPS =3D "1"
-DEPENDS =3D ""
-RDEPENDS =3D ""
-RRECOMMENDS =3D ""
-
-deltask do_prepare_recipe_sysroot
-deltask do_flush_pseudodb
-deltask do_image_qa
-do_rootfs[depends] =3D ""
-do_rootfs[noexec] =3D "1"
-do_image[noexec] =3D "1"
-do_image_complete[noexec] =3D "1"
-do_build[depends] =3D ""
-
-IMAGE_CLASSES:remove =3D "create-spdx-image-3.0"
diff --git a/meta-arm-systemready/conf/layer.conf b/meta-arm-systemready/=
conf/layer.conf
deleted file mode 100644
index 5616a3aaf7..0000000000
--- a/meta-arm-systemready/conf/layer.conf
+++ /dev/null
@@ -1,15 +0,0 @@
-# We have a conf and classes directory, add to BBPATH
-BBPATH .=3D ":${LAYERDIR}"
-
-# We have recipes-* directories, add to BBFILES
-BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb \
-            ${LAYERDIR}/recipes-*/*/*.bbappend"
-
-BBFILE_COLLECTIONS +=3D "meta-arm-systemready"
-BBFILE_PATTERN_meta-arm-systemready =3D "^${LAYERDIR}/"
-
-LAYERSERIES_COMPAT_meta-arm-systemready =3D "walnascar whinlatter"
-
-LAYERDEPENDS_meta-arm-systemready =3D "core"
-
-addpylib ${LAYERDIR}/lib oeqa
diff --git a/meta-arm-systemready/lib/oeqa/runtime/cases/arm_systemready_=
debian_unattended.py b/meta-arm-systemready/lib/oeqa/runtime/cases/arm_sy=
stemready_debian_unattended.py
deleted file mode 100644
index 3c3a2a48db..0000000000
--- a/meta-arm-systemready/lib/oeqa/runtime/cases/arm_systemready_debian_=
unattended.py
+++ /dev/null
@@ -1,66 +0,0 @@
-from oeqa.runtime.case import OERuntimeTestCase
-
-
-class SystemReadyDebianUnattendedTest(OERuntimeTestCase):
-    def setUp(self):
-        super().setUp()
-        self.console =3D self.target.DEFAULT_CONSOLE
-
-    def test_debian_unattended(self):
-        # Turn on the FVP.
-        self.target.transition('on')
-
-        # Timeout value =3D elapsed time * 2; where elapsed time was col=
lected
-        # from the elapsed time in the log.do_testimage for each functio=
n after
-        # the build is finished on the development machine.
-        self.target.expect(self.console,
-                           r'.*Scanning installation',
-                           timeout=3D(20 * 60))
-        bb.plain('Installation status: Scanning installation media...')
-
-        self.target.expect(self.console,
-                           r'.*Detecting network hardware',
-                           timeout=3D(35 * 60))
-        bb.plain('Installation status: Detecting network hardware...')
-
-        self.target.expect(self.console,
-                           r'.*Installing the base system',
-                           timeout=3D(35 * 60))
-        bb.plain('Installation status: Installing the base system...')
-
-        self.target.expect(self.console,
-                           r'.*Installing GRUB',
-                           timeout=3D(7 * 60 * 60))
-        bb.plain('Installation status: Installing GRUB...')
-
-        # Waiting to respond to the boot loader prompt error message.
-        self.target.expect(self.console,
-                           r'.*Press enter to continue',
-                           timeout=3D(15 * 60))
-        self.target.sendline(self.console, '')
-
-        self.target.expect(self.console,
-                           r'.*Press enter to continue',
-                           timeout=3D(60))
-        self.target.sendline(self.console, '')
-
-        # Waiting to respond continue without bootloader to install
-        # bootloader with the late script in preseed.cfg at the end.
-        self.target.expect(self.console,
-                           r'.*Continue without boot loader',
-                           timeout=3D(2 * 60))
-        self.target.sendline(self.console, '14')
-
-        self.target.expect(self.console,
-                           r'.*Press enter to continue',
-                           timeout=3D(60))
-        self.target.sendline(self.console, '')
-
-        self.target.expect(self.console,
-                           r'.*Finishing the installation',
-                           timeout=3D(2 * 60))
-        bb.plain('Installation status: Finishing the installation...')
-
-        # Waiting till the installation is finished.
-        self.target.expect(self.console, r'.*login:', timeout=3D(40 * 60=
))
-        bb.plain('Installation status: Debian installation finished succ=
essfully.')
diff --git a/meta-arm-systemready/lib/oeqa/runtime/cases/arm_systemready_=
fedora_unattended.py b/meta-arm-systemready/lib/oeqa/runtime/cases/arm_sy=
stemready_fedora_unattended.py
deleted file mode 100644
index f607fb1271..0000000000
--- a/meta-arm-systemready/lib/oeqa/runtime/cases/arm_systemready_fedora_=
unattended.py
+++ /dev/null
@@ -1,39 +0,0 @@
-from oeqa.runtime.case import OERuntimeTestCase
-
-
-class SystemReadyFedoraUnattendedTest(OERuntimeTestCase):
-    def setUp(self):
-        super().setUp()
-        self.console =3D self.target.DEFAULT_CONSOLE
-
-    def test_fedora_unattended(self):
-        # Turn on the FVP.
-        self.target.transition('on')
-
-        # Timeout value =3D elapsed time * 2; where elapsed time was col=
lected
-        # from the elapsed time in the log.do_testimage for each functio=
n after
-        # the build is finished on the development machine.
-        self.target.expect(self.console,
-                           '  Booting `Install Fedora 39\'',
-                           timeout=3D(2 * 60))
-        bb.plain('Installation status: Loading the installer, kernel and=
 initrd...')
-
-        self.target.expect(self.console,
-                           'Setting up the installation environment',
-                           timeout=3D(2 * 60 * 60))
-        bb.plain('Installation status: Setting up the installation envir=
onment...')
-
-        self.target.expect(self.console,
-                           'Installing the software',
-                           timeout=3D(30 * 60))
-        bb.plain('Installation status: Installing the software packages.=
..')
-
-        # Waiting to respond to the boot loader prompt error message.
-        self.target.expect(self.console,
-                           'Please respond \'yes\' or \'no\': ',
-                           timeout=3D(16 * 60 * 60))
-        self.target.sendline(self.console, 'yes')
-
-        # Waiting till the installation is finished.
-        self.target.expect(self.console, r'.*login: ', timeout=3D(5 * 60=
 * 60))
-        bb.plain('Installation status: Fedora installation finished succ=
essfully.')
diff --git a/meta-arm-systemready/lib/oeqa/runtime/cases/arm_systemready_=
ir_acs.py b/meta-arm-systemready/lib/oeqa/runtime/cases/arm_systemready_i=
r_acs.py
deleted file mode 100644
index 518d1aa269..0000000000
--- a/meta-arm-systemready/lib/oeqa/runtime/cases/arm_systemready_ir_acs.=
py
+++ /dev/null
@@ -1,37 +0,0 @@
-from oeqa.runtime.case import OERuntimeTestCase
-
-
-class SystemReadyACSTest(OERuntimeTestCase):
-    def setUp(self):
-        self.console =3D self.td.get('ARM_SYSTEMREADY_ACS_CONSOLE')
-        self.assertNotEqual(self.console, '',
-                            msg=3D'ARM_SYSTEMREADY_ACS_CONSOLE is not se=
t')
-
-    def test_acs(self):
-        """
-        The purpose of this test case is to detect any issues with the A=
CS
-        tests themselves. The intention is to fail only if there is an i=
ssue
-        running the tests, not if an ACS test fails
-        """
-        self.target.transition('on')
-        # The tests finish on a root shell
-        test_patterns =3D [r'([a-zA-Z0-9_ ]+): \[([a-zA-Z_ ]+)\]',
-                         'ACS run is completed'] # Signifies successful =
completion
-
-        while True:
-            match_id =3D self.target.expect(self.console, test_patterns,
-                                          timeout=3D10*60*60)
-            if match_id =3D=3D 0:
-                # A test group's result has been printed
-                matches =3D self.target.match(self.console)
-                group_name =3D matches[1].decode().strip()
-                status =3D matches[2].decode().strip()
-                self.logger.info(f'Test Group ({group_name}): {status}')
-            elif match_id =3D=3D 1:
-                break
-
-        # Workaround to ensure the model syncs the log files to disk
-        self.target.sendline(self.console, r'sync /mnt')
-        self.target.expect(self.console, r'root@generic-arm64:~#')
-
-        self.logger.info('Linux tests complete')
diff --git a/meta-arm-systemready/lib/oeqa/runtime/cases/arm_systemready_=
opensuse_unattended.py b/meta-arm-systemready/lib/oeqa/runtime/cases/arm_=
systemready_opensuse_unattended.py
deleted file mode 100644
index aea8df3e10..0000000000
--- a/meta-arm-systemready/lib/oeqa/runtime/cases/arm_systemready_opensus=
e_unattended.py
+++ /dev/null
@@ -1,42 +0,0 @@
-from oeqa.runtime.case import OERuntimeTestCase
-
-class SystemReadyOpenSUSEUnattendedTest(OERuntimeTestCase):
-    def setUp(self):
-        super().setUp()
-        self.console =3D self.target.DEFAULT_CONSOLE
-
-    def test_opensuse_unattended(self):
-        # Turn on the FVP.
-        self.target.transition('on')
-
-        # Timeout value =3D elapsed time * 2; where elapsed time was col=
lected
-        # from the elapsed time in the log.do_testimage for each functio=
n after
-        # the build is finished on the development machine.
-        self.target.expect(self.console,
-                           'Booting `Installation\'',
-                           timeout=3D(2 * 60))
-        bb.plain('Installation status: Loading the kernel, initrd and ba=
sic drivers...')
-
-        self.target.expect(self.console,
-                           'Starting hardware detection...',
-                           timeout=3D(40 * 60))
-        bb.plain('Installation status: Starting hardware detection...')
-
-        self.target.expect(self.console,
-                           'Loading Installation System',
-                           timeout=3D(60 * 60))
-        bb.plain('Installation status: Loading Installation System...')
-
-        self.target.expect(self.console,
-                           'Starting Installer',
-                           timeout=3D(40 * 60))
-        bb.plain('Installation status: Performing Installation...')
-
-        self.target.expect(self.console,
-                           'Finishing Configuration',
-                           timeout=3D(15 * 60 * 60))
-        bb.plain('Installation status: Finishing Configuration...')
-
-        # Waiting till the installation is finished.
-        self.target.expect(self.console, r'.*login: ', timeout=3D(6 * 60=
 * 60))
-        bb.plain('Installation status: openSUSE installation finished su=
ccessfully.')
diff --git a/meta-arm-systemready/recipes-bsp/arm-systemready/arm-systemr=
eady-firmware.bb b/meta-arm-systemready/recipes-bsp/arm-systemready/arm-s=
ystemready-firmware.bb
deleted file mode 100644
index 54ffc85936..0000000000
--- a/meta-arm-systemready/recipes-bsp/arm-systemready/arm-systemready-fi=
rmware.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY =3D "Arm SystemReady Firmware Image"
-DESCRIPTION =3D "This recipe ensures that all packages listed in \
-ARM_SYSTEMREADY_FIRMWARE variable (set at machine conf) are deployed."
-
-EXTRA_IMAGEDEPENDS =3D "${ARM_SYSTEMREADY_FIRMWARE}"
-
-inherit extra_imagedepends_only
-
-python() {
-    if not d.getVar("ARM_SYSTEMREADY_FIRMWARE"):
-        raise bb.parse.SkipRecipe("ARM_SYSTEMREADY_FIRMWARE needs to be =
set")
-}
-
-do_testimage[noexec] =3D "1"
diff --git a/meta-arm-systemready/recipes-devtools/python/python3-constru=
ct-native_2.10.68.bb b/meta-arm-systemready/recipes-devtools/python/pytho=
n3-construct-native_2.10.68.bb
deleted file mode 100644
index 5e39ae72ed..0000000000
--- a/meta-arm-systemready/recipes-devtools/python/python3-construct-nati=
ve_2.10.68.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY =3D "A powerful declarative symmetric parser/builder for binary =
data"
-HOMEPAGE =3D "https://github.com/construct/construct"
-
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D202b39559c1c79fe4715ce81e9e0a=
c02"
-
-PYPI_PACKAGE =3D "construct"
-
-SRC_URI[sha256sum] =3D "7b2a3fd8e5f597a5aa1d614c3bd516fa065db01704c72a1e=
faaeec6ef23d8b45"
-
-inherit pypi
-inherit setuptools3
-inherit native
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-sy=
stemready-ir-acs.bb b/meta-arm-systemready/recipes-test/arm-systemready-a=
cs/arm-systemready-ir-acs.bb
deleted file mode 100644
index 7d6fd6ae71..0000000000
--- a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-systemrea=
dy-ir-acs.bb
+++ /dev/null
@@ -1,63 +0,0 @@
-SUMMARY =3D "Arm SystemReady IR ACS"
-DESCRIPTION =3D "Arm SystemReady IR Architecture Compliance Suite prebui=
lt image"
-
-LICENSE =3D "AFL-2.1 & Apache-2.0 & BSD-2-Clause & BSD-2-Clause-Patent \
-           & BSD-3-Clause & BSD-4-Clause & bzip2-1.0.4 & bzip2-1.0.6 & C=
C-BY-SA-4.0 \
-           & curl & GPL-2.0-only & GPL-2.0-or-later & GPL-3.0-only \
-           & GPL-3.0-or-later & GPL-3.0-with-GCC-exception & ISC \
-           & LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2.1-only \
-           & LGPL-2.1-or-later & LGPL-3.0-only & MIT & MPL-2.0 & PD & PS=
F-2.0 \
-           & Python-2.0 & Unicode-DFS-2016 & Unicode-TOU & Zlib"
-LIC_FILES_CHKSUM =3D "\
-file://${COMMON_LICENSE_DIR}/AFL-2.1;md5=3De40039b90e182a056bcd9ad3e47dd=
d71 \
-file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4e17d99a7cacdbeed46a0=
096b10 \
-file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=3Dcb641bc04cda31daea161b1b=
c15da69f \
-file://${COMMON_LICENSE_DIR}/BSD-2-Clause-Patent;md5=3D0518d409dae93098c=
ca8dfa932f3ab1b \
-file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D550794465ba0ec5312d6919e=
203a55f9 \
-file://${COMMON_LICENSE_DIR}/BSD-4-Clause;md5=3D624d9e67e8ac41a78f6b6c2c=
55a83a2b \
-file://${COMMON_LICENSE_DIR}/bzip2-1.0.4;md5=3D452e1b423688222dcfc3cb946=
2c92902 \
-file://${COMMON_LICENSE_DIR}/bzip2-1.0.6;md5=3D841c5495611ae95b13e80fa4a=
0627333 \
-file://${COMMON_LICENSE_DIR}/CC-BY-SA-4.0;md5=3D4084714af41157e38872e798=
eb3fe1b1 \
-file://${COMMON_LICENSE_DIR}/curl;md5=3Df7adb1397db248527ffed14d947e445c=
 \
-file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=3D801f80980d171dd642561083=
3a22dbe6 \
-file://${COMMON_LICENSE_DIR}/GPL-2.0-or-later;md5=3Dfed54355545ffd980b81=
4dab4a3b312c \
-file://${COMMON_LICENSE_DIR}/GPL-3.0-only;md5=3Dc79ff39f19dfec6d293b95de=
a7b07891 \
-file://${COMMON_LICENSE_DIR}/GPL-3.0-or-later;md5=3D1c76c4cc354acaac30ed=
4d5eefea7245 \
-file://${COMMON_LICENSE_DIR}/GPL-3.0-with-GCC-exception;md5=3Daef5f35c92=
72f508be848cd99e0151df \
-file://${COMMON_LICENSE_DIR}/ISC;md5=3Df3b90e78ea0cffb20bf5cca7947a896d =
\
-file://${COMMON_LICENSE_DIR}/LGPL-2.0-only;md5=3D9427b8ccf5cf3df47c29110=
424c9641a \
-file://${COMMON_LICENSE_DIR}/LGPL-2.0-or-later;md5=3D6d2d9952d88b50a51a5=
c73dc431d06c7 \
-file://${COMMON_LICENSE_DIR}/LGPL-2.1-only;md5=3D1a6d268fd218675ffea8be5=
56788b780 \
-file://${COMMON_LICENSE_DIR}/LGPL-2.1-or-later;md5=3D2a4f4fd2128ea2f6504=
7ee63fbca9f68 \
-file://${COMMON_LICENSE_DIR}/LGPL-3.0-only;md5=3Dbfccfe952269fff2b407dd1=
1f2f3083b \
-file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f302 =
\
-file://${COMMON_LICENSE_DIR}/MPL-2.0;md5=3D815ca599c9df247a0c7f619bab123=
dad \
-file://${COMMON_LICENSE_DIR}/PD;md5=3Db3597d12946881e13cb3b548d1173851 \
-file://${COMMON_LICENSE_DIR}/PSF-2.0;md5=3D76c1502273262a5ebefb50dfb20d7=
c4f \
-file://${COMMON_LICENSE_DIR}/Python-2.0;md5=3Da5c8025e305fb49e6d40576935=
8851f6 \
-file://${COMMON_LICENSE_DIR}/Unicode-DFS-2016;md5=3D907371994d651afe53e9=
8adc27824669 \
-file://${COMMON_LICENSE_DIR}/Unicode-TOU;md5=3D666362dc5dba74f477af0f44f=
b85bd22 \
-file://${COMMON_LICENSE_DIR}/Zlib;md5=3D87f239f408daca8a157858e192597633=
 \
-"
-IMAGE_CLASSES:remove =3D "license_image create-spdx-image-3.0"
-
-COMPATIBLE_MACHINE =3D "(fvp-.+|.+-fvp)"
-
-TEST_SUITES =3D "arm_systemready_ir_acs"
-
-PV =3D "2.0.0"
-PV_DATE =3D "23.03"
-FULL_PV =3D "v${PV_DATE}_${PV}"
-ARM_SYSTEMREADY_IR_ACS_BRANCH ?=3D "legacy_systemready"
-IMAGE_FILENAME =3D "ir-acs-live-image-generic-arm64-${PV}.wic"
-SRC_URI =3D " \
-    https://github.com/ARM-software/arm-systemready/raw/${ARM_SYSTEMREAD=
Y_IR_ACS_BRANCH}/IR/prebuilt_images/${FULL_PV}/ir-acs-live-image-generic-=
arm64.wic.xz;name=3Dacs-img;downloadfilename=3D${IMAGE_FILENAME}.xz \
-    git://git.gitlab.arm.com/systemready/systemready-ir-template.git;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3Dsystemready-ir-template;name=3Dsr=
-ir-template \
-"
-SRC_URI[acs-img.sha256sum] =3D "ea52f84dab44bde97de3e2d2224d883acaae3572=
4dd8e2bdfb125de49040f9b3"
-# Revision pointing to v2023.04 tag
-SRCREV_sr-ir-template =3D "c714db178ddf72e5ae5017f15421095297d5bf0e"
-
-S =3D "${UNPACKDIR}"
-
-inherit arm-systemready-acs
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-sy=
stemready-scripts-native.bb b/meta-arm-systemready/recipes-test/arm-syste=
mready-acs/arm-systemready-scripts-native.bb
deleted file mode 100644
index 42f2508f4c..0000000000
--- a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-systemrea=
dy-scripts-native.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY =3D "System Ready Scripts"
-DESCRIPTION =3D "A collection of scripts to help with SystemReady compli=
ance."
-HOMEPAGE =3D "https://gitlab.arm.com/systemready/systemready-scripts"
-
-inherit native
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D85b7d439a311c22626c2e3f05daf6=
28e"
-
-RDEPENDS:${PN} =3D "python3-packaging-native python3-pyyaml-native \
-python3-chardet-native python3-requests-native python3-construct-native =
\
-dtc-native python3-dtschema-wrapper-native"
-
-PV =3D "v2023.04"
-SRC_URI =3D "\
-        git://git.gitlab.arm.com/systemready/systemready-scripts.git;pro=
tocol=3Dhttps;nobranch=3D1 \
-        file://0001-check-sr-results-Return-non-zero-exit-code-on-failur=
.patch \
-        file://0002-check-sr-results-Device-tree-improvements.patch \
-"
-
-# The SRCREV is at the v2023.04 tag
-SRCREV  =3D "f8244ab8da09f9e6005ceff81ebb234f35a2a698"
-
-do_install() {
-    install -d ${D}/${libdir}/systemready_scripts
-    cp -r ${S}/* ${D}/${libdir}/systemready_scripts
-}
-
-do_configure[noexec] =3D "1"
-do_compile[noexec] =3D "1"
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-sy=
stemready-scripts/0001-check-sr-results-Return-non-zero-exit-code-on-fail=
ur.patch b/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-syst=
emready-scripts/0001-check-sr-results-Return-non-zero-exit-code-on-failur=
.patch
deleted file mode 100644
index 6a95881d93..0000000000
--- a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-systemrea=
dy-scripts/0001-check-sr-results-Return-non-zero-exit-code-on-failur.patc=
h
+++ /dev/null
@@ -1,37 +0,0 @@
-From ad8f2826f6e2cefb630f7fc2c7c99857f224e109 Mon Sep 17 00:00:00 2001
-From: Debbie Martin <Debbie.Martin@arm.com>
-Date: Tue, 5 Sep 2023 21:37:46 +0100
-Subject: [PATCH] check-sr-results: Return non-zero exit code on failure
-
-Return a non-zero exit code if there are any warnings or errors found.
-
-Upstream-Status: Pending
-Signed-off-by: Debbie Martin <Debbie.Martin@arm.com>
----
- check-sr-results.py | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/check-sr-results.py b/check-sr-results.py
-index 12b89cd..48658f0 100755
---- a/check-sr-results.py
-+++ b/check-sr-results.py
-@@ -185,6 +185,9 @@ class Stats:
-     def inc_error(self):
-         self._inc('error')
-=20
-+    def has_warnings_or_errors(self):
-+        return self.data['warning'] or self.data['error']
-+
-=20
- # Download (possibly large) file from URL.
- # We raise an exception in case of issue.
-@@ -1519,3 +1522,6 @@ if __name__ =3D=3D '__main__':
-     if args.print_meta:
-         print()
-         print_meta()
-+
-+    if stats.has_warnings_or_errors():
-+        exit(1)
---=20
-2.25.1
-
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-sy=
stemready-scripts/0002-check-sr-results-Device-tree-improvements.patch b/=
meta-arm-systemready/recipes-test/arm-systemready-acs/arm-systemready-scr=
ipts/0002-check-sr-results-Device-tree-improvements.patch
deleted file mode 100644
index f76a03ade8..0000000000
--- a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-systemrea=
dy-scripts/0002-check-sr-results-Device-tree-improvements.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 53ceb2d4167b05374678b966031b3d52fc5080a2 Mon Sep 17 00:00:00 2001
-From: Debbie Martin <Debbie.Martin@arm.com>
-Date: Fri, 29 Sep 2023 15:22:17 +0100
-Subject: [PATCH] check-sr-results: Device tree improvements
-
-Make check-sr-results.py accept 'extra_compat' configuration for
-devicetree files, and pass these in the compat list given to
-dt-parser.py.
-
-Update dt-parser.py to parse the GCC version line in the dtb log.
-
-Upstream-Status: Pending
-Signed-off-by: Debbie Martin <Debbie.Martin@arm.com>
----
- check-sr-results.py | 12 ++++++++++--
- dt-parser.py        |  8 ++++++++
- 2 files changed, 18 insertions(+), 2 deletions(-)
-
-diff --git a/check-sr-results.py b/check-sr-results.py
-index 48658f0..a207a39 100755
---- a/check-sr-results.py
-+++ b/check-sr-results.py
-@@ -598,7 +598,7 @@ def need_regen(filename, deps, margin=3D0):
- # We run dtc and dt-validate to produce the log when needed.
- # We add markers to the log, which will be ignored by dt-parser.py.
- # We return a Stats object.
--def check_devicetree(filename):
-+def check_devicetree(filename, extra_compat=3DNone):
-     logging.debug(f"Check Devicetree `{filename}'")
-     stats =3D Stats()
-     log =3D f"{filename}.log"
-@@ -644,6 +644,9 @@ def check_devicetree(filename):
-     # We use the compatible strings extracted from Linux bindings to fi=
lter out
-     # more false positive.
-     compat =3D get_compat()
-+    if extra_compat:
-+        with open(compat, "a") as compat_file:
-+            compat_file.write("\n".join(extra_compat))
-     cp =3D run(f"{dt_parser} --compatibles '{compat}' '{log}'")
-
-     if cp.returncode:
-@@ -930,7 +933,12 @@ def check_file(conffile, filename):
-                 stats.add(check_uefi_capsule(filename))
-
-             if 'devicetree' in conffile:
--                stats.add(check_devicetree(filename))
-+                stats.add(
-+                    check_devicetree(
-+                        filename,
-+                        extra_compat=3Dconffile.get("extra_compat")
-+                    )
-+                )
-
-             if 'uefi-sniff' in conffile:
-                 stats.add(check_uefi_sniff(filename))
-diff --git a/dt-parser.py b/dt-parser.py
-index 3eccd74..c1c0031 100755
---- a/dt-parser.py
-+++ b/dt-parser.py
-@@ -181,6 +181,14 @@ def parse(filename):
-                 }
-                 continue
-
-+            # line [GCC <version>]
-+            m =3D re.match(r'\[GCC [0-9\.]+\]', line)
-+            if m:
-+                logging.debug(
-+                    f"line {i}: GCC version (`{line}')"
-+                )
-+                continue
-+
-             # If we could not parse the line we arrive here and complai=
n.
-             logging.warning(f"Unparsed line {i}: `{line}'")
-
---
-2.25.1
-
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-acs/edk2-t=
est-parser-native.bb b/meta-arm-systemready/recipes-test/arm-systemready-=
acs/edk2-test-parser-native.bb
deleted file mode 100644
index ea7c070c26..0000000000
--- a/meta-arm-systemready/recipes-test/arm-systemready-acs/edk2-test-par=
ser-native.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY =3D "EDK2 Test Parser"
-DESCRIPTION =3D "EDK2 Test Parser for parsing the results of UEFI SCT te=
sts"
-HOMEPAGE =3D "https://gitlab.arm.com/systemready/edk2-test-parser"
-
-inherit native
-
-LICENSE =3D "BSD-2-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc0550be4b3b9c0223efd0eaa70dc9=
085"
-
-RDEPENDS:${PN} =3D "python3-packaging-native python3-pyyaml-native \
-                  python3-jsonschema-native"
-
-PV =3D "v2023.04"
-SRC_URI =3D "git://git.gitlab.arm.com/systemready/edk2-test-parser.git;p=
rotocol=3Dhttps;nobranch=3D1"
-
-# The SRCREV is at the v2023.04 tag
-SRCREV  =3D "e8cdb692592d2a152cb87cf4d9fbd7ba2ae8b405"
-
-do_install() {
-    install -d ${D}/${libdir}/edk2_test_parser
-    cp -r ${S}/* ${D}/${libdir}/edk2_test_parser
-}
-
-do_configure[noexec] =3D "1"
-do_compile[noexec] =3D "1"
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/arm-systemready-linux-distros-debian.bb b/meta-arm-systemready/recipe=
s-test/arm-systemready-linux-distros/arm-systemready-linux-distros-debian=
.bb
deleted file mode 100644
index cb23388f49..0000000000
--- a/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-debian.bb
+++ /dev/null
@@ -1,132 +0,0 @@
-require arm-systemready-linux-distros.inc
-
-# The Debian project does not provide a license manifest for the distrib=
uted ISO images.
-# The following list only contains the SPDX license identifiers found on=
 the deb
-# packages from the ISO image and is not exhaustive.
-# For more information about Debian licenses, including the non-free one=
s, refer to
-# https://www.debian.org/legal/licenses/.
-LICENSE =3D "AFL-2.0 & AFL-2.1 \
-           & GPL-1.0-only & GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or=
-later & GPL-2.0-with-autoconf-exception \
-           & GPL-2.0-with-OpenSSL-exception & GPL-3.0-only & GPL-3.0-or-=
later & GPL-3.0-with-autoconf-exception \
-           & GPL-3-with-bison-exception & SMAIL-GPL & LGPL-2.0-only & LG=
PL-2.0-or-later & LGPL-2.1-only \
-           & LGPL-2.1-or-later & LGPL-3.0-only & LGPL-3.0-or-later & BSD=
-2-Clause & BSD-3-Clause \
-           & BSD-3-Clause-Clear & BSD-4-Clause & BSD-4-Clause-UC & TCP-w=
rappers & OLDAP-2.8 & PSF-2.0 & BSL-1.0 \
-           & bzip2-1.0.6 & CC0-1.0 & Libpng & Latex2e & Unicode-TOU & Un=
icode-DFS-2016 & CC-BY-3.0 & CC-BY-SA-3.0 \
-           & CC-BY-SA-4.0 & curl & MS-PL & NTP & FSFAP & FSFUL & FSFULLR=
 & FSF-Unlimited & EDL-1.0 & Vim & FTL \
-           & TCL & MPL-1.1 & MPL-2.0 & GFDL-1.1-or-later & GFDL-1.2-or-l=
ater & GFDL-1.3-no-invariants-or-later \
-           & GFDL-1.3-no-invariants-only & Artistic-1.0 & Artistic-2.0 &=
 Artistic-1.0-Perl & Apache-2.0 \
-           & Apache-2.0-with-LLVM-exception & Zlib & Python-2.0 & OpenSS=
L & Sleepycat & Spencer-86 & MIT & MIT-CMU \
-           & MIT-advertising & Beerware & Intel & X11 & ISC & IPL-1.0 & =
SSH-OpenSSH & SSH-short & RSA-MD & OPL-1.0 & PD"
-
-LIC_FILES_CHKSUM =3D "\
-file://${COMMON_LICENSE_DIR}/AFL-2.0;md5=3Df01c02e5eac69cff6b8c2cc474b8d=
468 \
-file://${COMMON_LICENSE_DIR}/AFL-2.1;md5=3De40039b90e182a056bcd9ad3e47dd=
d71 \
-file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=3De9e36a9de734199567a4d769=
498f743d \
-file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=3D30c0b8a5048cc2f4be5f=
f15ef0d8cf61 \
-file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=3D801f80980d171dd642561083=
3a22dbe6 \
-file://${COMMON_LICENSE_DIR}/GPL-2.0-or-later;md5=3Dfed54355545ffd980b81=
4dab4a3b312c \
-file://${COMMON_LICENSE_DIR}/GPL-2.0-with-autoconf-exception;md5=3D966c0=
2a95037a9c7ad75a7597aea9c5f \
-file://${COMMON_LICENSE_DIR}/GPL-2.0-with-OpenSSL-exception;md5=3Dd9e441=
2f125e3e6f14efba8ce7b4604f \
-file://${COMMON_LICENSE_DIR}/GPL-3.0-only;md5=3Dc79ff39f19dfec6d293b95de=
a7b07891 \
-file://${COMMON_LICENSE_DIR}/GPL-3.0-or-later;md5=3D1c76c4cc354acaac30ed=
4d5eefea7245 \
-file://${COMMON_LICENSE_DIR}/GPL-3.0-with-autoconf-exception;md5=3Dda26b=
415cb0faf9bfe6829f0ffa409ec \
-file://${COMMON_LICENSE_DIR}/GPL-3-with-bison-exception;md5=3D6e1bac3dc2=
1fcc4fa049cf5c407eb7a2 \
-file://${COMMON_LICENSE_DIR}/SMAIL-GPL;md5=3D785f3688caca0adb413cd39878d=
0411f \
-file://${COMMON_LICENSE_DIR}/LGPL-2.0-only;md5=3D9427b8ccf5cf3df47c29110=
424c9641a \
-file://${COMMON_LICENSE_DIR}/LGPL-2.0-or-later;md5=3D6d2d9952d88b50a51a5=
c73dc431d06c7 \
-file://${COMMON_LICENSE_DIR}/LGPL-2.1-only;md5=3D1a6d268fd218675ffea8be5=
56788b780 \
-file://${COMMON_LICENSE_DIR}/LGPL-2.1-or-later;md5=3D2a4f4fd2128ea2f6504=
7ee63fbca9f68 \
-file://${COMMON_LICENSE_DIR}/LGPL-3.0-only;md5=3Dbfccfe952269fff2b407dd1=
1f2f3083b \
-file://${COMMON_LICENSE_DIR}/LGPL-3.0-or-later;md5=3Dc51d3eef3be114124d1=
1349ca0d7e117 \
-file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=3Dcb641bc04cda31daea161b1b=
c15da69f \
-file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D550794465ba0ec5312d6919e=
203a55f9 \
-file://${COMMON_LICENSE_DIR}/BSD-3-Clause-Clear;md5=3D7a434440b651f4a472=
ca93716d01033a \
-file://${COMMON_LICENSE_DIR}/BSD-4-Clause;md5=3D624d9e67e8ac41a78f6b6c2c=
55a83a2b \
-file://${COMMON_LICENSE_DIR}/BSD-4-Clause-UC;md5=3D1da3cf8ad50cd8d5d1de3=
cfc53196d01 \
-file://${COMMON_LICENSE_DIR}/TCP-wrappers;md5=3D83b1f59c3c52689f5652193e=
0cd5b1cf \
-file://${COMMON_LICENSE_DIR}/OLDAP-2.8;md5=3Dbb28ada4fbb5c3f52c233899b2e=
410a5 \
-file://${COMMON_LICENSE_DIR}/PSF-2.0;md5=3D76c1502273262a5ebefb50dfb20d7=
c4f \
-file://${COMMON_LICENSE_DIR}/BSL-1.0;md5=3D65a7df9ad57aacf825fd252c4c332=
88c \
-file://${COMMON_LICENSE_DIR}/bzip2-1.0.6;md5=3D841c5495611ae95b13e80fa4a=
0627333 \
-file://${COMMON_LICENSE_DIR}/CC0-1.0;md5=3D0ceb3372c9595f0a8067e55da801e=
4a1 \
-file://${COMMON_LICENSE_DIR}/Libpng;md5=3D12b4ec50384c800bc568f519671b12=
0c \
-file://${COMMON_LICENSE_DIR}/Latex2e;md5=3Def91d258f6a8d4d7f4db4d30adf38=
598 \
-file://${COMMON_LICENSE_DIR}/Unicode-TOU;md5=3D666362dc5dba74f477af0f44f=
b85bd22 \
-file://${COMMON_LICENSE_DIR}/Unicode-DFS-2016;md5=3D907371994d651afe53e9=
8adc27824669 \
-file://${COMMON_LICENSE_DIR}/CC-BY-3.0;md5=3Ddfa02b5755629022e267f10b9c0=
a2ab7 \
-file://${COMMON_LICENSE_DIR}/CC-BY-SA-3.0;md5=3D3248afbd148270ac7337a6f3=
e2558be5 \
-file://${COMMON_LICENSE_DIR}/CC-BY-SA-4.0;md5=3D4084714af41157e38872e798=
eb3fe1b1 \
-file://${COMMON_LICENSE_DIR}/curl;md5=3Df7adb1397db248527ffed14d947e445c=
 \
-file://${COMMON_LICENSE_DIR}/MS-PL;md5=3Db9cbca4f1a399b0c17b3521736e6784=
8 \
-file://${COMMON_LICENSE_DIR}/NTP;md5=3D0926fd147301b2a65e45e21adb3a6f14 =
\
-file://${COMMON_LICENSE_DIR}/FSFAP;md5=3D232368338ef6dc99de71c2e05ff1217=
6 \
-file://${COMMON_LICENSE_DIR}/FSFUL;md5=3Ddc74327e8d4dca295527a090d2af4ba=
4 \
-file://${COMMON_LICENSE_DIR}/FSFULLR;md5=3Df0aa4b452548cc5d53a7772a9a90b=
3c0 \
-file://${COMMON_LICENSE_DIR}/FSF-Unlimited;md5=3D06fadd9ae6adbcd5d8d545d=
ac90b15f6 \
-file://${COMMON_LICENSE_DIR}/EDL-1.0;md5=3De06be17b8577bf6e2277a5c3c71b2=
d05 \
-file://${COMMON_LICENSE_DIR}/Vim;md5=3D676d28582e2dca824e7e309a9865eeb1 =
\
-file://${COMMON_LICENSE_DIR}/FTL;md5=3Df0bf6b09ee8b02121ed10709d9e49d8b =
\
-file://${COMMON_LICENSE_DIR}/TCL;md5=3D5f7b23ac10d8f7cde16737bc896bb6fb =
\
-file://${COMMON_LICENSE_DIR}/MPL-1.1;md5=3D1d38e87ed8d522c49f04e1efe0fab=
3ab \
-file://${COMMON_LICENSE_DIR}/MPL-2.0;md5=3D815ca599c9df247a0c7f619bab123=
dad \
-file://${COMMON_LICENSE_DIR}/GFDL-1.1-or-later;md5=3D03322744a1a73f36ebf=
29f98cced39a4 \
-file://${COMMON_LICENSE_DIR}/GFDL-1.2-or-later;md5=3D9f58808219e9a42ff12=
28309d6f83dc6 \
-file://${COMMON_LICENSE_DIR}/GFDL-1.3-no-invariants-or-later;md5=3De0771=
ae6a62dc8a2e50b1d450fea66b7 \
-file://${COMMON_LICENSE_DIR}/GFDL-1.3-no-invariants-only;md5=3De0771ae6a=
62dc8a2e50b1d450fea66b7 \
-file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=3Dcda03bbdc3c1951996392b87=
2397b798 \
-file://${COMMON_LICENSE_DIR}/Artistic-2.0;md5=3D8bbc66f0ba93cec26ef52611=
7e280266 \
-file://${COMMON_LICENSE_DIR}/Artistic-1.0-Perl;md5=3D8feedd169dbd5738981=
843bd7d931f9f \
-file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4e17d99a7cacdbeed46a0=
096b10 \
-file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;md5=3D0bcd48=
c3bdfef0c9d9fd17726e4b7dab \
-file://${COMMON_LICENSE_DIR}/Zlib;md5=3D87f239f408daca8a157858e192597633=
 \
-file://${COMMON_LICENSE_DIR}/Python-2.0;md5=3Da5c8025e305fb49e6d40576935=
8851f6 \
-file://${COMMON_LICENSE_DIR}/OpenSSL;md5=3D4eb1764f3e65fafa1a25057f9082f=
2ae \
-file://${COMMON_LICENSE_DIR}/Sleepycat;md5=3D1cbb64231c94198653282f3ccab=
88ffb \
-file://${COMMON_LICENSE_DIR}/Spencer-86;md5=3D97ba797de74f88a17676473fab=
224843 \
-file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f302 =
\
-file://${COMMON_LICENSE_DIR}/MIT-CMU;md5=3D91b70218e0db8e063ed88cd532cb8=
01d \
-file://${COMMON_LICENSE_DIR}/MIT-advertising;md5=3D0f358dd6677661d482934=
070c7eeaeec \
-file://${COMMON_LICENSE_DIR}/Beerware;md5=3D8db32780d0d8bbbdce0fa415e514=
cb89 \
-file://${COMMON_LICENSE_DIR}/Intel;md5=3Dced5efc26449ecac834b4b71625a341=
0 \
-file://${COMMON_LICENSE_DIR}/X11;md5=3D87f08485cf6ba3c63a00eda8ecba7f1d =
\
-file://${COMMON_LICENSE_DIR}/ISC;md5=3Df3b90e78ea0cffb20bf5cca7947a896d =
\
-file://${COMMON_LICENSE_DIR}/IPL-1.0;md5=3Dbe739b8845e6e98f99e206221fe92=
93b \
-file://${COMMON_LICENSE_DIR}/SSH-OpenSSH;md5=3D3af632aae8cf01feb6ce2ed44=
bb7ed2e \
-file://${COMMON_LICENSE_DIR}/SSH-short;md5=3Db73783010a430cadaabdc8ec0c0=
748f8 \
-file://${COMMON_LICENSE_DIR}/RSA-MD;md5=3D9342e66a3fb8ddeebe449a85366f4a=
cc \
-file://${COMMON_LICENSE_DIR}/OPL-1.0;md5=3Dacdf1e4398bd93dc137e271c50316=
324 \
-file://${COMMON_LICENSE_DIR}/PD;md5=3Db3597d12946881e13cb3b548d1173851 \
-"
-
-PV =3D "12.8.0"
-SRC_URI =3D "\
-    https://cdimage.debian.org/mirror/cdimage/archive/12.8.0/arm64/iso-d=
vd/debian-12.8.0-arm64-DVD-1.iso;unpack=3D0;downloadfilename=3D${ISO_IMAG=
E_NAME}.iso;name=3Ddebian_iso_image \
-    file://unattended-boot-conf/Debian/preseed.cfg \
-    "
-SRC_URI[debian_iso_image.sha256sum] =3D "8891fe48bb5a58ae54176eaa6440059=
bf852044d6b9ae77219e78f9ef8d65149"
-
-TEST_SUITES =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "ar=
m_systemready_debian_unattended", "", d)}"
-
-ISO_LABEL =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "debi=
an-12.8.0-arm64-1", "", d)}"
-BOOT_CATALOG =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "b=
oot.catalog", "", d)}"
-BOOT_IMAGE =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "EFI=
/boot/bootaa64.efi", "", d)}"
-EFI_IMAGE =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "boot=
/grub/efi.img", "", d)}"
-
-modifyiso() {
-    UNATTENDED_CONF_DIR=3D"${UNPACKDIR}/unattended-boot-conf/Debian"
-
-    # Append the preseed.cfg file to the initrd
-    gunzip ${EXTRACTED_ISO_TEMP_DIR}/install.a64/initrd.gz
-    (cd ${UNATTENDED_CONF_DIR} && echo preseed.cfg | cpio -H newc -o -A =
-F ${EXTRACTED_ISO_TEMP_DIR}/install.a64/initrd)
-    gzip ${EXTRACTED_ISO_TEMP_DIR}/install.a64/initrd
-
-    #GRUB
-    # Disable timeout
-    sed -i '/^insmod gzio/ a set timeout=3D0' ${EXTRACTED_ISO_TEMP_DIR}/=
boot/grub/grub.cfg
-
-    # Update default menu entry to select automated install
-    sed -i '/^set timeout/ a set default=3D"2>5"' ${EXTRACTED_ISO_TEMP_D=
IR}/boot/grub/grub.cfg
-
-    # Update kernel boot parameters to enable more text based console ou=
tput
-    sed -i 's|linux    /install.a64/vmlinuz  auto=3Dtrue priority=3Dcrit=
ical --- quiet|linux    /install.a64/vmlinuz auto=3Dtrue priority=3Dcriti=
cal DEBIAN_FRONTEND=3Dtext --- nomodeset|g' ${EXTRACTED_ISO_TEMP_DIR}/boo=
t/grub/grub.cfg
-}
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/arm-systemready-linux-distros-fedora.bb b/meta-arm-systemready/recipe=
s-test/arm-systemready-linux-distros/arm-systemready-linux-distros-fedora=
.bb
deleted file mode 100644
index df2043b59f..0000000000
--- a/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-fedora.bb
+++ /dev/null
@@ -1,122 +0,0 @@
-require arm-systemready-linux-distros.inc
-
-# The Fedora project does not provide a license manifest for the distrib=
uted ISO images.
-# The following list only contains the SPDX license identifiers found on=
 the rpm
-# packages from the ISO image and is not exhaustive.
-# For more information about Fedora licenses, including the non-free one=
s, refer to
-# https://docs.fedoraproject.org/en-US/legal/fedora-linux-license/.
-LICENSE =3D "GPL-1.0-only & GPL-1.0-or-later & GPL-2.0-only &  GPL-2.0-o=
r-later & GPL-2.0-with-font-exception \
-           & GPL-2.0-with-GCC-exception & GPL-3.0-only & GPL-3.0-or-late=
r & GPL-3-with-bison-exception \
-           & LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2.1-only & LGPL-2.=
1-or-later & LGPL-3.0-only & LGPL-3.0-or-later \
-           & 0BSD & BSD-2-Clause & BSD-3-Clause & BSD-3-Clause-Modificat=
ion & BSD-4-Clause & BSD-4-Clause-UC \
-           & ClArtistic & Artistic-2.0 & Artistic-1.0-Perl & Apache-2.0 =
& Apache-2.0-with-LLVM-exception & Zlib \
-           & zlib-acknowledgement & Sleepycat & MIT & MIT-open-group & M=
IT-Modern-Variant & Unlicense & ISC \
-           & AFL-2.1 & AGPL-3.0-only & AGPL-3.0-or-later & FSFAP & MPL-1=
.1 & MPL-2.0 & CC-BY-3.0 & CC-BY-4.0 \=20
-           & CC-BY-SA-4.0 & CC0-1.0 & NCSA & APSL-2.0 & IJG & psutils & =
Sendmail & blessing & NTP & BSL-1.0 \
-           & GFDL-1.1-or-later & GFDL-1.2-or-later & GFDL-1.3 & GFDL-1.3=
-or-later & GFDL-1.3-no-invariants-or-later \
-           & NPL-1.1 & libtiff & Vim & curl & EUPL-1.1 & OFL-1.1 & OFL-1=
.1-RFN & FTL & Info-ZIP & Interbase-1.0 \
-           & Unicode-DFS-2016 & SISSL & LPPL-1.3a & SGI-B-2.0 & PSF-2.0 =
& X11 & OLDAP-2.8 & PostgreSQL & OPUBL-1.0"
-
-LIC_FILES_CHKSUM =3D "\
-file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=3De9e36a9de734199567a4d769=
498f743d \
-file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=3D30c0b8a5048cc2f4be5f=
f15ef0d8cf61 \
-file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=3D801f80980d171dd642561083=
3a22dbe6 \
-file://${COMMON_LICENSE_DIR}/GPL-2.0-or-later;md5=3Dfed54355545ffd980b81=
4dab4a3b312c \
-file://${COMMON_LICENSE_DIR}/GPL-2.0-with-font-exception;md5=3Dbf93e21a5=
13f6f923474e62fb920434d \
-file://${COMMON_LICENSE_DIR}/GPL-2.0-with-GCC-exception;md5=3D14c4291113=
2e8c9008911385aede6449 \
-file://${COMMON_LICENSE_DIR}/GPL-3.0-only;md5=3Dc79ff39f19dfec6d293b95de=
a7b07891 \
-file://${COMMON_LICENSE_DIR}/GPL-3.0-or-later;md5=3D1c76c4cc354acaac30ed=
4d5eefea7245 \
-file://${COMMON_LICENSE_DIR}/GPL-3-with-bison-exception;md5=3D6e1bac3dc2=
1fcc4fa049cf5c407eb7a2 \
-file://${COMMON_LICENSE_DIR}/LGPL-2.0-only;md5=3D9427b8ccf5cf3df47c29110=
424c9641a \
-file://${COMMON_LICENSE_DIR}/LGPL-2.0-or-later;md5=3D6d2d9952d88b50a51a5=
c73dc431d06c7 \
-file://${COMMON_LICENSE_DIR}/LGPL-2.1-only;md5=3D1a6d268fd218675ffea8be5=
56788b780 \
-file://${COMMON_LICENSE_DIR}/LGPL-2.1-or-later;md5=3D2a4f4fd2128ea2f6504=
7ee63fbca9f68 \
-file://${COMMON_LICENSE_DIR}/LGPL-3.0-only;md5=3Dbfccfe952269fff2b407dd1=
1f2f3083b \
-file://${COMMON_LICENSE_DIR}/LGPL-3.0-or-later;md5=3Dc51d3eef3be114124d1=
1349ca0d7e117 \
-file://${COMMON_LICENSE_DIR}/0BSD;md5=3Df667a3c3830a55a17ec3067709f4526c=
 \
-file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=3Dcb641bc04cda31daea161b1b=
c15da69f \
-file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D550794465ba0ec5312d6919e=
203a55f9 \
-file://${COMMON_LICENSE_DIR}/BSD-3-Clause-Modification;md5=3D27b46022df7=
bdef61a1e404fc3573f83 \
-file://${COMMON_LICENSE_DIR}/BSD-4-Clause;md5=3D624d9e67e8ac41a78f6b6c2c=
55a83a2b \
-file://${COMMON_LICENSE_DIR}/BSD-4-Clause-UC;md5=3D1da3cf8ad50cd8d5d1de3=
cfc53196d01 \
-file://${COMMON_LICENSE_DIR}/ClArtistic;md5=3Df633bbf0697ec33066b83adfa9=
ebe51d \
-file://${COMMON_LICENSE_DIR}/Artistic-2.0;md5=3D8bbc66f0ba93cec26ef52611=
7e280266 \
-file://${COMMON_LICENSE_DIR}/Artistic-1.0-Perl;md5=3D8feedd169dbd5738981=
843bd7d931f9f \
-file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4e17d99a7cacdbeed46a0=
096b10 \
-file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;md5=3D0bcd48=
c3bdfef0c9d9fd17726e4b7dab \
-file://${COMMON_LICENSE_DIR}/Zlib;md5=3D87f239f408daca8a157858e192597633=
 \
-file://${COMMON_LICENSE_DIR}/zlib-acknowledgement;md5=3Dc76c64e2cf99efcf=
b5e2b26aa86b12e6 \
-file://${COMMON_LICENSE_DIR}/Sleepycat;md5=3D1cbb64231c94198653282f3ccab=
88ffb \
-file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f302 =
\
-file://${COMMON_LICENSE_DIR}/MIT-open-group;md5=3Da7c50bba311e4b09d48a52=
6eedcef837 \
-file://${COMMON_LICENSE_DIR}/MIT-Modern-Variant;md5=3D272dea2b6758600297=
8254bc04648ab2 \
-file://${COMMON_LICENSE_DIR}/Unlicense;md5=3D7246f848faa4e9c9fc0ea91122d=
6e680 \
-file://${COMMON_LICENSE_DIR}/ISC;md5=3Df3b90e78ea0cffb20bf5cca7947a896d =
\
-file://${COMMON_LICENSE_DIR}/AFL-2.1;md5=3De40039b90e182a056bcd9ad3e47dd=
d71 \
-file://${COMMON_LICENSE_DIR}/AGPL-3.0-only;md5=3D73f1eb20517c55bf9493b7d=
d6e480788 \
-file://${COMMON_LICENSE_DIR}/AGPL-3.0-or-later;md5=3Da4af3f9f0c0fc9de318=
e4df46665906e \
-file://${COMMON_LICENSE_DIR}/FSFAP;md5=3D232368338ef6dc99de71c2e05ff1217=
6 \
-file://${COMMON_LICENSE_DIR}/MPL-1.1;md5=3D1d38e87ed8d522c49f04e1efe0fab=
3ab \
-file://${COMMON_LICENSE_DIR}/MPL-2.0;md5=3D815ca599c9df247a0c7f619bab123=
dad \
-file://${COMMON_LICENSE_DIR}/CC-BY-3.0;md5=3Ddfa02b5755629022e267f10b9c0=
a2ab7 \
-file://${COMMON_LICENSE_DIR}/CC-BY-4.0;md5=3D9b33bbd06fb58995fb0e299cd38=
d1838 \
-file://${COMMON_LICENSE_DIR}/CC-BY-SA-4.0;md5=3D4084714af41157e38872e798=
eb3fe1b1 \
-file://${COMMON_LICENSE_DIR}/CC0-1.0;md5=3D0ceb3372c9595f0a8067e55da801e=
4a1 \
-file://${COMMON_LICENSE_DIR}/NCSA;md5=3D1b5fdec70ee13ad8a91667f16c1959d7=
 \
-file://${COMMON_LICENSE_DIR}/APSL-2.0;md5=3Df9e4701d9a216a87ba145bbe25f5=
4c58 \
-file://${COMMON_LICENSE_DIR}/IJG;md5=3Dd9fc5ebaa95c14466091d25e0d34e688 =
\
-file://${COMMON_LICENSE_DIR}/psutils;md5=3D29046009c1f269661e7b74196fb8f=
6a0 \
-file://${COMMON_LICENSE_DIR}/Sendmail;md5=3D8037c42e05a5d4bfce06a44729fb=
6f1a \
-file://${COMMON_LICENSE_DIR}/blessing;md5=3Dd5407b61870d6dc19d0bdc04ae4c=
c654 \
-file://${COMMON_LICENSE_DIR}/NTP;md5=3D0926fd147301b2a65e45e21adb3a6f14 =
\
-file://${COMMON_LICENSE_DIR}/BSL-1.0;md5=3D65a7df9ad57aacf825fd252c4c332=
88c \
-file://${COMMON_LICENSE_DIR}/GFDL-1.1-or-later;md5=3D03322744a1a73f36ebf=
29f98cced39a4 \
-file://${COMMON_LICENSE_DIR}/GFDL-1.2-or-later;md5=3D9f58808219e9a42ff12=
28309d6f83dc6 \
-file://${COMMON_LICENSE_DIR}/GFDL-1.3;md5=3D1083add59b39991c748ea70a9216=
6959 \
-file://${COMMON_LICENSE_DIR}/GFDL-1.3-or-later;md5=3De0771ae6a62dc8a2e50=
b1d450fea66b7 \
-file://${COMMON_LICENSE_DIR}/GFDL-1.3-no-invariants-or-later;md5=3De0771=
ae6a62dc8a2e50b1d450fea66b7 \
-file://${COMMON_LICENSE_DIR}/NPL-1.1;md5=3Df9c017c062c1b02462efb915d9f2c=
b63 \
-file://${COMMON_LICENSE_DIR}/libtiff;md5=3Db99383975855adc28712577c9cd56=
485 \
-file://${COMMON_LICENSE_DIR}/Vim;md5=3D676d28582e2dca824e7e309a9865eeb1 =
\
-file://${COMMON_LICENSE_DIR}/curl;md5=3Df7adb1397db248527ffed14d947e445c=
 \
-file://${COMMON_LICENSE_DIR}/EUPL-1.1;md5=3D3f12b8134016fd7ba5a010afd690=
abaa \
-file://${COMMON_LICENSE_DIR}/OFL-1.1;md5=3Dfac3a519e5e9eb96316656e0ca4f2=
b90 \
-file://${COMMON_LICENSE_DIR}/OFL-1.1-RFN;md5=3D2680fce30f17e5fed9bcebd93=
36e5b78 \
-file://${COMMON_LICENSE_DIR}/FTL;md5=3Df0bf6b09ee8b02121ed10709d9e49d8b =
\
-file://${COMMON_LICENSE_DIR}/Info-ZIP;md5=3D83a1c8ea099b3b58beb6e55dcbe4=
c15f \
-file://${COMMON_LICENSE_DIR}/Interbase-1.0;md5=3Df65304bc0e87e6700fe1e4a=
b5affdc6f \
-file://${COMMON_LICENSE_DIR}/Unicode-DFS-2016;md5=3D907371994d651afe53e9=
8adc27824669 \
-file://${COMMON_LICENSE_DIR}/SISSL;md5=3Dfded06bff75eb4a2899bd051e2e128f=
5 \
-file://${COMMON_LICENSE_DIR}/LPPL-1.3a;md5=3D8e2e8e1428b39cd78927c2ad287=
34ff7 \
-file://${COMMON_LICENSE_DIR}/SGI-B-2.0;md5=3D5f5dd7bd973dff1594131b1e9c7=
981f1 \
-file://${COMMON_LICENSE_DIR}/PSF-2.0;md5=3D76c1502273262a5ebefb50dfb20d7=
c4f \
-file://${COMMON_LICENSE_DIR}/X11;md5=3D87f08485cf6ba3c63a00eda8ecba7f1d =
\
-file://${COMMON_LICENSE_DIR}/OLDAP-2.8;md5=3Dbb28ada4fbb5c3f52c233899b2e=
410a5 \
-file://${COMMON_LICENSE_DIR}/PostgreSQL;md5=3Da9c78964f52e27f4c01140a1a1=
6da8e2 \
-file://${COMMON_LICENSE_DIR}/OPUBL-1.0;md5=3D99367d4750dbf0ae6cc74209ddd=
52f6d \
-"
-
-ARM_SYSTEMREADY_LINUX_DISTRO_INSTALL_SIZE =3D "6144"
-
-TEST_SUITES =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "ar=
m_systemready_fedora_unattended", "", d)}"
-
-ISO_LABEL =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "Fedo=
ra-S-dvd-aarch64-39", "", d)}"
-BOOT_CATALOG =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "b=
oot.catalog", "", d)}"
-BOOT_IMAGE =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "EFI=
/BOOT/BOOTAA64.EFI", "", d)}"
-EFI_IMAGE =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "imag=
es/efiboot.img", "", d)}"
-
-PV =3D "39.1.5"
-SRC_URI =3D "\
-    https://download.fedoraproject.org/pub/archive/fedora/linux/releases=
/39/Server/aarch64/iso/Fedora-Server-dvd-aarch64-39-1.5.iso;unpack=3D0;do=
wnloadfilename=3D${ISO_IMAGE_NAME}.iso;name=3Dfedora_iso_image \
-    file://unattended-boot-conf/Fedora/ks.cfg\
-    "
-SRC_URI[fedora_iso_image.sha256sum] =3D "d19dc2a39758155fa53e6fd555d0d17=
3ccc8175b55dea48002d499f39cb30ce0"
-
-modifyiso() {
-    UNATTENDED_CONF_DIR=3D"${UNPACKDIR}/unattended-boot-conf/Fedora"
-   =20
-    cp "${UNATTENDED_CONF_DIR}/ks.cfg" ${EXTRACTED_ISO_TEMP_DIR}
-    sed -i 's/set default=3D"1"/set default=3D"0"/g' "${EXTRACTED_ISO_TE=
MP_DIR}/EFI/BOOT/grub.cfg"
-    sed -i 's/set timeout=3D60/set timeout=3D0/g' "${EXTRACTED_ISO_TEMP_=
DIR}/EFI/BOOT/grub.cfg"
-    sed -i '0,/vmlinuz/s/vmlinuz/& inst.ks=3Dhd:LABEL=3DFedora-S-dvd-aar=
ch64-39:\/ks.cfg/' "${EXTRACTED_ISO_TEMP_DIR}/EFI/BOOT/grub.cfg"
-}
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/arm-systemready-linux-distros-opensuse.bb b/meta-arm-systemready/reci=
pes-test/arm-systemready-linux-distros/arm-systemready-linux-distros-open=
suse.bb
deleted file mode 100644
index ad69c779c5..0000000000
--- a/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-opensuse.bb
+++ /dev/null
@@ -1,92 +0,0 @@
-require arm-systemready-linux-distros.inc
-
-LICENSE =3D "AGPL-3.0-only & Apache-1.1 & Apache-2.0 & Artistic-1.0 & Ar=
tistic-2.0 \
-           & BSD-2-Clause-Patent & BSD-2-Clause & BSD-3-Clause & BSD-4-C=
lause \
-           & BSL-1.0 & CC-BY-3.0 & CC-BY-4.0 & CC-BY-SA-1.0 & CC-BY-SA-3=
.0 \
-           & CC-BY-SA-4.0 & CC0-1.0 & CDDL-1.0 & GFDL-1.1-only \
-           & GFDL-1.2-only & GFDL-1.3-only & GFDL-1.3-or-later \
-           & GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or-later \
-           & GPL-3.0-only & GPL-3.0-or-later & HPND & ICU & IPL-1.0 & IP=
A \
-           & ISC & LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2.1-only \
-           & LGPL-2.1-or-later & LGPL-3.0-only & LGPL-3.0-or-later \
-           & LPPL-1.3c & MIT & MPL-1.1 & MPL-2.0 & OFL-1.1 & OLDAP-2.8 \
-           & OpenSSL & Python-2.0 & Sleepycat & Vim & W3C & Zlib"
-
-LIC_FILES_CHKSUM =3D "\
-file://${COMMON_LICENSE_DIR}/AGPL-3.0-only;md5=3D73f1eb20517c55bf9493b7d=
d6e480788 \
-file://${COMMON_LICENSE_DIR}/Apache-1.1;md5=3D61cc638ff95ff4f38f243855bc=
ec4317 \
-file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4e17d99a7cacdbeed46a0=
096b10 \
-file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=3Dcda03bbdc3c1951996392b87=
2397b798 \
-file://${COMMON_LICENSE_DIR}/Artistic-2.0;md5=3D8bbc66f0ba93cec26ef52611=
7e280266 \
-file://${COMMON_LICENSE_DIR}/BSD-2-Clause-Patent;md5=3D0518d409dae93098c=
ca8dfa932f3ab1b \
-file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=3Dcb641bc04cda31daea161b1b=
c15da69f \
-file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D550794465ba0ec5312d6919e=
203a55f9 \
-file://${COMMON_LICENSE_DIR}/BSD-4-Clause;md5=3D624d9e67e8ac41a78f6b6c2c=
55a83a2b \
-file://${COMMON_LICENSE_DIR}/BSL-1.0;md5=3D65a7df9ad57aacf825fd252c4c332=
88c \
-file://${COMMON_LICENSE_DIR}/CC-BY-3.0;md5=3Ddfa02b5755629022e267f10b9c0=
a2ab7 \
-file://${COMMON_LICENSE_DIR}/CC-BY-4.0;md5=3D9b33bbd06fb58995fb0e299cd38=
d1838 \
-file://${COMMON_LICENSE_DIR}/CC-BY-SA-1.0;md5=3D681ffad43a0addd90f1bebf4=
5675104e \
-file://${COMMON_LICENSE_DIR}/CC-BY-SA-3.0;md5=3D3248afbd148270ac7337a6f3=
e2558be5 \
-file://${COMMON_LICENSE_DIR}/CC-BY-SA-4.0;md5=3D4084714af41157e38872e798=
eb3fe1b1 \
-file://${COMMON_LICENSE_DIR}/CC0-1.0;md5=3D0ceb3372c9595f0a8067e55da801e=
4a1 \
-file://${COMMON_LICENSE_DIR}/CDDL-1.0;md5=3Dd63dcc9297f2efd6c18d1e560b80=
7bc6 \
-file://${COMMON_LICENSE_DIR}/GFDL-1.1-only;md5=3D03322744a1a73f36ebf29f9=
8cced39a4 \
-file://${COMMON_LICENSE_DIR}/GFDL-1.2-only;md5=3D9f58808219e9a42ff122830=
9d6f83dc6 \
-file://${COMMON_LICENSE_DIR}/GFDL-1.3-only;md5=3De0771ae6a62dc8a2e50b1d4=
50fea66b7 \
-file://${COMMON_LICENSE_DIR}/GFDL-1.3-or-later;md5=3De0771ae6a62dc8a2e50=
b1d450fea66b7 \
-file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=3D30c0b8a5048cc2f4be5f=
f15ef0d8cf61 \
-file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=3D801f80980d171dd642561083=
3a22dbe6 \
-file://${COMMON_LICENSE_DIR}/GPL-2.0-or-later;md5=3Dfed54355545ffd980b81=
4dab4a3b312c \
-file://${COMMON_LICENSE_DIR}/GPL-3.0-only;md5=3Dc79ff39f19dfec6d293b95de=
a7b07891 \
-file://${COMMON_LICENSE_DIR}/GPL-3.0-or-later;md5=3D1c76c4cc354acaac30ed=
4d5eefea7245 \
-file://${COMMON_LICENSE_DIR}/HPND;md5=3Dfaa364b3e3c6db0f74cc0e704ddf6b9c=
 \
-file://${COMMON_LICENSE_DIR}/ICU;md5=3D4d85ad1f393add71dc66bcf78e3ee584 =
\
-file://${COMMON_LICENSE_DIR}/IPA;md5=3D17b18da2d8b2c43c598aa7583229ef1b =
\
-file://${COMMON_LICENSE_DIR}/IPL-1.0;md5=3Dbe739b8845e6e98f99e206221fe92=
93b \
-file://${COMMON_LICENSE_DIR}/ISC;md5=3Df3b90e78ea0cffb20bf5cca7947a896d =
\
-file://${COMMON_LICENSE_DIR}/LGPL-2.0-only;md5=3D9427b8ccf5cf3df47c29110=
424c9641a \
-file://${COMMON_LICENSE_DIR}/LGPL-2.0-or-later;md5=3D6d2d9952d88b50a51a5=
c73dc431d06c7 \
-file://${COMMON_LICENSE_DIR}/LGPL-2.1-only;md5=3D1a6d268fd218675ffea8be5=
56788b780 \
-file://${COMMON_LICENSE_DIR}/LGPL-2.1-or-later;md5=3D2a4f4fd2128ea2f6504=
7ee63fbca9f68 \
-file://${COMMON_LICENSE_DIR}/LGPL-3.0-only;md5=3Dbfccfe952269fff2b407dd1=
1f2f3083b \
-file://${COMMON_LICENSE_DIR}/LGPL-3.0-or-later;md5=3Dc51d3eef3be114124d1=
1349ca0d7e117 \
-file://${COMMON_LICENSE_DIR}/LPPL-1.3c;md5=3Dba2fa6fe055623756de43a298d8=
8a8b3 \
-file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f302 =
\
-file://${COMMON_LICENSE_DIR}/MPL-1.1;md5=3D1d38e87ed8d522c49f04e1efe0fab=
3ab \
-file://${COMMON_LICENSE_DIR}/MPL-2.0;md5=3D815ca599c9df247a0c7f619bab123=
dad \
-file://${COMMON_LICENSE_DIR}/OFL-1.1;md5=3Dfac3a519e5e9eb96316656e0ca4f2=
b90 \
-file://${COMMON_LICENSE_DIR}/OLDAP-2.8;md5=3Dbb28ada4fbb5c3f52c233899b2e=
410a5 \
-file://${COMMON_LICENSE_DIR}/OpenSSL;md5=3D4eb1764f3e65fafa1a25057f9082f=
2ae \
-file://${COMMON_LICENSE_DIR}/Python-2.0;md5=3Da5c8025e305fb49e6d40576935=
8851f6 \
-file://${COMMON_LICENSE_DIR}/Sleepycat;md5=3D1cbb64231c94198653282f3ccab=
88ffb \
-file://${COMMON_LICENSE_DIR}/Vim;md5=3D676d28582e2dca824e7e309a9865eeb1 =
\
-file://${COMMON_LICENSE_DIR}/W3C;md5=3D4b1d0384b406508a63e51f7c69687700 =
\
-file://${COMMON_LICENSE_DIR}/Zlib;md5=3D87f239f408daca8a157858e192597633=
 \
-"
-
-ARM_SYSTEMREADY_LINUX_DISTRO_INSTALL_SIZE =3D "6144"
-
-PV =3D "15.5"
-# possible value of ISO_TYPE: NET, DVD
-ISO_TYPE =3D "DVD"
-BUILD_NO =3D "491.1"
-SRC_URI =3D "\
-    https://download.opensuse.org/distribution/leap/${PV}/iso/openSUSE-L=
eap-${PV}-${ISO_TYPE}-aarch64-Build${BUILD_NO}-Media.iso;unpack=3D0;downl=
oadfilename=3D${ISO_IMAGE_NAME}.iso;name=3Dopensuse_iso_image \
-    file://unattended-boot-conf/openSUSE/autoinst.xml \
-    "
-SRC_URI[opensuse_iso_image.sha256sum] =3D "456cc4f99b044429d8a89bd302c06=
e9e382d6ac4dc590139a7096ebb54f5357b"
-
-TEST_SUITES =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "ar=
m_systemready_opensuse_unattended", "", d)}"
-
-ISO_LABEL =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "OEMD=
RV", "", d)}"
-BOOT_CATALOG =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "b=
oot.catalog", "", d)}"
-BOOT_IMAGE =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "EFI=
/BOOT/bootaa64.efi", "", d)}"
-EFI_IMAGE =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "boot=
/aarch64/efi", "", d)}"
-
-modifyiso() {
-    UNATTENDED_CONF_DIR=3D"${UNPACKDIR}/unattended-boot-conf/openSUSE"
-
-    #create installation configuration files, remove grub timeout, setup=
 network
-    cp "${UNATTENDED_CONF_DIR}/autoinst.xml" ${EXTRACTED_ISO_TEMP_DIR}
-    sed -i 's/timeout=3D60/timeout=3D0/g' "${EXTRACTED_ISO_TEMP_DIR}/EFI=
/BOOT/grub.cfg"
-}
\ No newline at end of file
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/arm-systemready-linux-distros-unattended.inc b/meta-arm-systemready/r=
ecipes-test/arm-systemready-linux-distros/arm-systemready-linux-distros-u=
nattended.inc
deleted file mode 100644
index 75951b0e84..0000000000
--- a/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-unattended.inc
+++ /dev/null
@@ -1,45 +0,0 @@
-SUMMARY =3D "Arm SystemReady Linux distros unattended requirements"
-DESCRIPTION =3D "Arm SystemReady Linux distro unattended configurations =
\
-               and ISO image modification"
-
-EXTRACTED_ISO_TEMP_DIR =3D "${WORKDIR}/extracted_iso_temp_dir"
-NEW_ISO_TEMP_DIR =3D "${WORKDIR}/new_iso_temp_dir"
-
-# oeqa test case must be added to TEST_SUITES to acknowledge that the un=
attended
-# installation was successful.
-inherit testimage
-
-python () {
-    unattended_required_vars =3D ['ISO_LABEL', 'BOOT_CATALOG', 'BOOT_IMA=
GE', 'EFI_IMAGE']
-
-    for var in unattended_required_vars:
-        if not d.getVar(var):
-            raise bb.parse.SkipRecipe(f'{var} variable is not set')
-}
-
-unpackiso() {
-    # Unpack the ISO image
-    bsdtar -xf ${UNPACKDIR}/${ISO_IMAGE_NAME}.iso -C ${EXTRACTED_ISO_TEM=
P_DIR}
-    chmod -R u+rw ${EXTRACTED_ISO_TEMP_DIR}
-}
-
-modifyiso() {
-
-}
-
-repackiso() {
-    # Repack the ISO image
-    mkisofs -o ${NEW_ISO_TEMP_DIR}/${ISO_IMAGE_NAME}.iso -U -r -v -T -J =
-joliet-long -V ${ISO_LABEL} \
-            -volset ${ISO_LABEL} -A ${ISO_LABEL} -b ${BOOT_IMAGE} -c ${B=
OOT_CATALOG} -no-emul-boot \
-            -boot-load-size 4 -boot-info-table -J -R -V ${ISO_LABEL} -el=
torito-alt-boot \
-            -eltorito-boot ${EFI_IMAGE} -no-emul-boot ${EXTRACTED_ISO_TE=
MP_DIR}
-
-    mv -f ${NEW_ISO_TEMP_DIR}/${ISO_IMAGE_NAME}.iso ${UNPACKDIR}
-}
-
-# Write the test data in IMAGE_POSTPROCESS_COMMAND
-IMAGE_POSTPROCESS_COMMAND +=3D "write_image_test_data; "
-
-do_unpack[depends] +=3D "cdrtools-native:do_populate_sysroot libarchive-=
native:do_populate_sysroot"
-do_unpack[postfuncs] +=3D "unpackiso modifyiso repackiso"
-do_unpack[cleandirs] +=3D "${EXTRACTED_ISO_TEMP_DIR} ${NEW_ISO_TEMP_DIR}=
"
\ No newline at end of file
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/arm-systemready-linux-distros.inc b/meta-arm-systemready/recipes-test=
/arm-systemready-linux-distros/arm-systemready-linux-distros.inc
deleted file mode 100644
index 74aa937e2f..0000000000
--- a/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros.inc
+++ /dev/null
@@ -1,64 +0,0 @@
-SUMMARY =3D "Arm SystemReady Linux distros installation"
-DESCRIPTION =3D "Arm SystemReady Linux distro CD/DVD images and installa=
tion \
-               target disk image"
-
-DISTRO_UNATTENDED_INST_TESTS ?=3D "0"
-
-require ${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "arm-systemr=
eady-linux-distros-unattended.inc", "", d)}
-
-IMAGE_CLASSES:remove =3D "license_image create-spdx-image-3.0"
-IMAGE_CLASSES:remove =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TE=
STS", "", "testimage", d)}"
-BUILDHISTORY_FEATURES:remove =3D "image"
-
-INHIBIT_DEFAULT_DEPS =3D "1"
-COMPATIBLE_HOST =3D "aarch64-*"
-PACKAGE_ARCH =3D "${TARGET_ARCH}"
-
-inherit nopackages deploy rootfs-postcommands ${IMAGE_CLASSES}
-
-do_configure[noexec] =3D "1"
-do_compile[noexec] =3D "1"
-
-ISO_IMAGE_NAME =3D "${PN}-${PV}"
-IMAGE_LINK_NAME =3D "${PN}-${MACHINE}"
-
-ARM_SYSTEMREADY_LINUX_DISTRO_ISO_IMAGE =3D \
-    "${DEPLOY_DIR_IMAGE}/${ISO_IMAGE_NAME}.iso"
-# Size of installation disk in MB
-ARM_SYSTEMREADY_LINUX_DISTRO_INSTALL_SIZE ?=3D "4096"
-
-S =3D "${UNPACKDIR}"
-
-do_image() {
-    dd if=3D/dev/zero of=3D${WORKDIR}/${IMAGE_LINK_NAME}.wic \
-        bs=3D1M count=3D${ARM_SYSTEMREADY_LINUX_DISTRO_INSTALL_SIZE} sta=
tus=3Dnone
-}
-
-do_deploy() {
-    # Deploy the iso and installation target disk image to the deploy fo=
lder
-    install -m 644 ${UNPACKDIR}/${ISO_IMAGE_NAME}.iso ${DEPLOYDIR}
-    install -m 644 ${WORKDIR}/${IMAGE_LINK_NAME}.wic ${DEPLOYDIR}
-}
-
-addtask image before do_install
-addtask deploy after do_install before do_image_complete
-
-# Post-process commands may write to IMGDEPLOYDIR
-IMGDEPLOYDIR =3D "${DEPLOY_DIR_IMAGE}"
-
-python do_image_complete() {
-    # Run the image post-process commands
-    from oe.utils import execute_pre_post_process
-    post_process_cmds =3D d.getVar("IMAGE_POSTPROCESS_COMMAND")
-    execute_pre_post_process(d, post_process_cmds)
-
-    if d.getVar('DISTRO_UNATTENDED_INST_TESTS') =3D=3D "1":
-        # Ensure an empty rootfs manifest exists (required by testimage)
-        fname =3D os.path.join(d.getVar('IMGDEPLOYDIR'), d.getVar('IMAGE=
_LINK_NAME') + ".manifest")
-        open(fname, 'w').close()
-}
-
-do_image_complete[nostamp] =3D "1"
-addtask image_complete after do_deploy before do_build
-
-do_install[depends] +=3D "arm-systemready-firmware:do_image_complete"
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/files/unattended-boot-conf/Debian/preseed.cfg b/meta-arm-systemready/=
recipes-test/arm-systemready-linux-distros/files/unattended-boot-conf/Deb=
ian/preseed.cfg
deleted file mode 100755
index 47a38c2bb3..0000000000
--- a/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/fil=
es/unattended-boot-conf/Debian/preseed.cfg
+++ /dev/null
@@ -1,75 +0,0 @@
-# Preconfiguration file for Debian unattended installation
-
-# Enable auto mode
-d-i auto-install/enable boolean true
-d-i debconf/priority select critical
-
-# Set language, country and locale
-d-i debian-installer/language string en
-d-i debian-installer/country string GB
-d-i debian-installer/locale string en_GB.UTF-8
-d-i keyboard-configuration/xkb-keymap select us
-
-# Set clock and timezone
-d-i clock-setup/utc boolean true
-d-i time/zone select Europe/London
-
-# Skip installing recommended packages
-d-i base-installer/install-recommends boolean false
-
-# Set user and password
-d-i passwd/root-login boolean false
-d-i passwd/user-fullname string user
-d-i passwd/username string user
-d-i passwd/user-password password unsafe
-d-i passwd/user-password-again password unsafe
-
-# Disable CD-ROM and set mirror
-d-i apt-setup/cdrom/set-first boolean false
-d-i mirror/country string manual NO
-d-i mirror/http/proxy string
-
-# Disable mirror selection
-d-i apt-setup/no_mirror boolean true
-d-i popularity-contest/participate boolean false
-
-# Skip package selection and upgrades
-d-i pkgsel/run_tasksel boolean false
-d-i pkgsel/upgrade select none
-
-# Ensure the 'dbus' package is installed
-d-i pkgsel/include string dbus
-
-# Set host and domain names
-d-i netcfg/get_hostname string debtest
-d-i netcfg/get_domain string unassigned-domain
-
-# Partitioning
-d-i partman-auto/disk string /dev/vda
-d-i partman-auto/init_automatically_partition select Guided - use entire=
 disk
-d-i partman-auto/choose_recipe select All files in one partition (recomm=
ended for new users)
-d-i partman-auto/method string regular
-d-i partman/confirm_write_new_label boolean true
-d-i partman/choose_partition select finish
-d-i partman/confirm boolean true
-d-i partman/confirm_nooverwrite boolean true
-
-# Install GRUB bootloader
-d-i grub-installer/only_debian boolean true
-d-i grub-installer/bootdev string /dev/vda
-d-i grub-installer/bootloader-id string debian
-d-i grub-installer/efi-directory string /boot/efi
-
-# Handle errors automatically
-d-i debian-installer/exit-on-error boolean true
-
-# Late command to install GRUB and finalize boot setup
-d-i preseed/late_command string \
-    mount /dev/vda1 /target/boot/efi || true; \
-    in-target mkdir -p /boot/efi/EFI/boot || true; \
-    in-target grub-install --target=3Darm64-efi --efi-directory=3D/boot/=
efi --bootloader-id=3Ddebian --removable || true; \
-    in-target update-grub || true; \
-    umount /target/boot/efi || true
-
-# Reboot after installation
-d-i finish-install/reboot_in_progress note
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/files/unattended-boot-conf/Fedora/ks.cfg b/meta-arm-systemready/recip=
es-test/arm-systemready-linux-distros/files/unattended-boot-conf/Fedora/k=
s.cfg
deleted file mode 100644
index f8ea3bc678..0000000000
--- a/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/fil=
es/unattended-boot-conf/Fedora/ks.cfg
+++ /dev/null
@@ -1,39 +0,0 @@
-# Generated by Anaconda 39.32.6                                         =
                                                                         =
                                           =20
-# Generated by pykickstart v3.48                                        =
                                                                         =
                                           =20
-#version=3DDEVEL                                                        =
                                                                         =
                                             =20
-# Use text mode install
-text
-
-# Keyboard layouts
-keyboard --vckeymap=3Dus --xlayouts=3D'us'
-# System language
-lang en_GB.UTF-8
-
-# Use CDROM installation media
-cdrom
-
-%packages --excludedocs --ignoremissing
-@core --nodefaults
-=20
-%end
-
-# Run the Setup Agent on first boot
-firstboot --enable
-# Do not configure the X Window System
-skipx
-
-# System bootloader configuration
-bootloader --location=3Dmbr --boot-drive=3Dvda
-autopart
-# Partition clearing information
-clearpart --all --initlabel --drives=3Dvda
-
-# System timezone
-timezone Europe/London --utc
-
-# Root password
-rootpw --lock
-user --groups=3Dwheel --name=3Duser --password=3Dunsafe --gecos=3D"usr1"=
=20
-
-# Reboot after installation with an attempt to eject the installation me=
dia
-reboot --eject
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/files/unattended-boot-conf/openSUSE/autoinst.xml b/meta-arm-systemrea=
dy/recipes-test/arm-systemready-linux-distros/files/unattended-boot-conf/=
openSUSE/autoinst.xml
deleted file mode 100755
index 8da6e1cbad..0000000000
--- a/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/fil=
es/unattended-boot-conf/openSUSE/autoinst.xml
+++ /dev/null
@@ -1,935 +0,0 @@
-<?xml version=3D"1.0"?>
-<!DOCTYPE profile>
-<profile xmlns=3D"http://www.suse.com/1.0/yast2ns" xmlns:config=3D"http:=
//www.suse.com/1.0/configns">
-  <bootloader t=3D"map">
-    <global t=3D"map">
-      <append>splash=3Dsilent preempt=3Dfull mitigations=3Dauto quiet se=
curity=3Dapparmor</append>
-      <cpu_mitigations>auto</cpu_mitigations>
-      <gfxmode>auto</gfxmode>
-      <hiddenmenu>false</hiddenmenu>
-      <os_prober>true</os_prober>
-      <secure_boot>true</secure_boot>
-      <terminal>gfxterm</terminal>
-      <timeout t=3D"integer">8</timeout>
-      <update_nvram>true</update_nvram>
-    </global>
-    <loader_type>grub2-efi</loader_type>
-  </bootloader>
-  <firewall t=3D"map">
-    <default_zone>public</default_zone>
-    <enable_firewall t=3D"boolean">true</enable_firewall>
-    <log_denied_packets>off</log_denied_packets>
-    <start_firewall t=3D"boolean">true</start_firewall>
-    <zones t=3D"list">
-      <zone t=3D"map">
-        <description>Unsolicited incoming network packets are rejected. =
Incoming packets that are related to outgoing network connections are acc=
epted. Outgoing network connections are allowed.</description>
-        <interfaces t=3D"list"/>
-        <masquerade t=3D"boolean">false</masquerade>
-        <name>block</name>
-        <ports t=3D"list"/>
-        <protocols t=3D"list"/>
-        <services t=3D"list"/>
-        <short>Block</short>
-        <target>%%REJECT%%</target>
-      </zone>
-      <zone t=3D"map">
-        <description>For computers in your demilitarized zone that are p=
ublicly-accessible with limited access to your internal network. Only sel=
ected incoming connections are accepted.</description>
-        <interfaces t=3D"list"/>
-        <masquerade t=3D"boolean">false</masquerade>
-        <name>dmz</name>
-        <ports t=3D"list"/>
-        <protocols t=3D"list"/>
-        <services t=3D"list">
-          <service>ssh</service>
-        </services>
-        <short>DMZ</short>
-        <target>default</target>
-      </zone>
-      <zone t=3D"map">
-        <description>All network connections are accepted.</description>
-        <interfaces t=3D"list">
-          <interface>docker0</interface>
-        </interfaces>
-        <masquerade t=3D"boolean">false</masquerade>
-        <name>docker</name>
-        <ports t=3D"list"/>
-        <protocols t=3D"list"/>
-        <services t=3D"list"/>
-        <short>docker</short>
-        <target>ACCEPT</target>
-      </zone>
-      <zone t=3D"map">
-        <description>Unsolicited incoming network packets are dropped. I=
ncoming packets that are related to outgoing network connections are acce=
pted. Outgoing network connections are allowed.</description>
-        <interfaces t=3D"list"/>
-        <masquerade t=3D"boolean">false</masquerade>
-        <name>drop</name>
-        <ports t=3D"list"/>
-        <protocols t=3D"list"/>
-        <services t=3D"list"/>
-        <short>Drop</short>
-        <target>DROP</target>
-      </zone>
-      <zone t=3D"map">
-        <description>For use on external networks. You do not trust the =
other computers on networks to not harm your computer. Only selected inco=
ming connections are accepted.</description>
-        <interfaces t=3D"list"/>
-        <masquerade t=3D"boolean">true</masquerade>
-        <name>external</name>
-        <ports t=3D"list"/>
-        <protocols t=3D"list"/>
-        <services t=3D"list">
-          <service>ssh</service>
-        </services>
-        <short>External</short>
-        <target>default</target>
-      </zone>
-      <zone t=3D"map">
-        <description>For use in home areas. You mostly trust the other c=
omputers on networks to not harm your computer. Only selected incoming co=
nnections are accepted.</description>
-        <interfaces t=3D"list"/>
-        <masquerade t=3D"boolean">false</masquerade>
-        <name>home</name>
-        <ports t=3D"list"/>
-        <protocols t=3D"list"/>
-        <services t=3D"list">
-          <service>dhcpv6-client</service>
-          <service>mdns</service>
-          <service>samba-client</service>
-          <service>ssh</service>
-        </services>
-        <short>Home</short>
-        <target>default</target>
-      </zone>
-      <zone t=3D"map">
-        <description>For use on internal networks. You mostly trust the =
other computers on the networks to not harm your computer. Only selected =
incoming connections are accepted.</description>
-        <interfaces t=3D"list"/>
-        <masquerade t=3D"boolean">false</masquerade>
-        <name>internal</name>
-        <ports t=3D"list"/>
-        <protocols t=3D"list"/>
-        <services t=3D"list">
-          <service>dhcpv6-client</service>
-          <service>mdns</service>
-          <service>samba-client</service>
-          <service>ssh</service>
-        </services>
-        <short>Internal</short>
-        <target>default</target>
-      </zone>
-      <zone t=3D"map">
-        <description>For use in public areas. You do not trust the other=
 computers on networks to not harm your computer. Only selected incoming =
connections are accepted.</description>
-        <interfaces t=3D"list">
-          <interface>eth0</interface>
-        </interfaces>
-        <masquerade t=3D"boolean">false</masquerade>
-        <name>public</name>
-        <ports t=3D"list"/>
-        <protocols t=3D"list"/>
-        <services t=3D"list">
-          <service>dhcpv6-client</service>
-          <service>ssh</service>
-        </services>
-        <short>Public</short>
-        <target>default</target>
-      </zone>
-      <zone t=3D"map">
-        <description>All network connections are accepted.</description>
-        <interfaces t=3D"list"/>
-        <masquerade t=3D"boolean">false</masquerade>
-        <name>trusted</name>
-        <ports t=3D"list"/>
-        <protocols t=3D"list"/>
-        <services t=3D"list"/>
-        <short>Trusted</short>
-        <target>ACCEPT</target>
-      </zone>
-      <zone t=3D"map">
-        <description>For use in work areas. You mostly trust the other c=
omputers on networks to not harm your computer. Only selected incoming co=
nnections are accepted.</description>
-        <interfaces t=3D"list"/>
-        <masquerade t=3D"boolean">false</masquerade>
-        <name>work</name>
-        <ports t=3D"list"/>
-        <protocols t=3D"list"/>
-        <services t=3D"list">
-          <service>dhcpv6-client</service>
-          <service>ssh</service>
-        </services>
-        <short>Work</short>
-        <target>default</target>
-      </zone>
-    </zones>
-  </firewall>
-  <general t=3D"map">
-    <mode t=3D"map">
-      <confirm t=3D"boolean">false</confirm>
-    </mode>
-  </general>
-  <groups t=3D"list">
-    <group t=3D"map">
-      <gid>100</gid>
-      <groupname>users</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>499</gid>
-      <groupname>messagebus</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>1</gid>
-      <groupname>bin</groupname>
-      <userlist>daemon</userlist>
-    </group>
-    <group t=3D"map">
-      <gid>488</gid>
-      <groupname>input</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>495</gid>
-      <groupname>kmem</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>493</gid>
-      <groupname>utmp</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>62</gid>
-      <groupname>man</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>477</gid>
-      <groupname>polkitd</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>479</gid>
-      <groupname>systemd-timesync</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>2</gid>
-      <groupname>daemon</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>480</gid>
-      <groupname>systemd-network</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>71</gid>
-      <groupname>ntadmin</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>490</gid>
-      <groupname>dialout</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>59</gid>
-      <groupname>maildrop</groupname>
-      <userlist>postfix</userlist>
-    </group>
-    <group t=3D"map">
-      <gid>478</gid>
-      <groupname>nscd</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>51</gid>
-      <groupname>postfix</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>485</gid>
-      <groupname>tape</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>487</gid>
-      <groupname>render</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>476</gid>
-      <groupname>sshd</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>491</gid>
-      <groupname>cdrom</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>486</gid>
-      <groupname>sgx</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>0</gid>
-      <groupname>root</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>489</gid>
-      <groupname>disk</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>15</gid>
-      <groupname>shadow</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>484</gid>
-      <groupname>video</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>496</gid>
-      <groupname>wheel</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>483</gid>
-      <groupname>audit</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>498</gid>
-      <groupname>mail</groupname>
-      <userlist>postfix</userlist>
-    </group>
-    <group t=3D"map">
-      <gid>5</gid>
-      <groupname>tty</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>65533</gid>
-      <groupname>nogroup</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>65534</gid>
-      <groupname>nobody</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>497</gid>
-      <groupname>lp</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>482</gid>
-      <groupname>chrony</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>492</gid>
-      <groupname>audio</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>494</gid>
-      <groupname>lock</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>36</gid>
-      <groupname>kvm</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>42</gid>
-      <groupname>trusted</groupname>
-      <userlist/>
-    </group>
-    <group t=3D"map">
-      <gid>481</gid>
-      <groupname>systemd-journal</groupname>
-      <userlist/>
-    </group>
-  </groups>
-  <host t=3D"map">
-    <hosts t=3D"list">
-      <hosts_entry t=3D"map">
-        <host_address>127.0.0.1</host_address>
-        <names t=3D"list">
-          <name>localhost</name>
-        </names>
-      </hosts_entry>
-      <hosts_entry t=3D"map">
-        <host_address>::1</host_address>
-        <names t=3D"list">
-          <name>localhost ipv6-localhost ipv6-loopback</name>
-        </names>
-      </hosts_entry>
-      <hosts_entry t=3D"map">
-        <host_address>fe00::0</host_address>
-        <names t=3D"list">
-          <name>ipv6-localnet</name>
-        </names>
-      </hosts_entry>
-      <hosts_entry t=3D"map">
-        <host_address>ff00::0</host_address>
-        <names t=3D"list">
-          <name>ipv6-mcastprefix</name>
-        </names>
-      </hosts_entry>
-      <hosts_entry t=3D"map">
-        <host_address>ff02::1</host_address>
-        <names t=3D"list">
-          <name>ipv6-allnodes</name>
-        </names>
-      </hosts_entry>
-      <hosts_entry t=3D"map">
-        <host_address>ff02::2</host_address>
-        <names t=3D"list">
-          <name>ipv6-allrouters</name>
-        </names>
-      </hosts_entry>
-      <hosts_entry t=3D"map">
-        <host_address>ff02::3</host_address>
-        <names t=3D"list">
-          <name>ipv6-allhosts</name>
-        </names>
-      </hosts_entry>
-    </hosts>
-  </host>
-  <language t=3D"map">
-    <language>en_GB</language>
-    <languages>en_GB</languages>
-  </language>
-  <networking t=3D"map">
-    <dhcp_options t=3D"map">
-      <dhclient_client_id/>
-      <dhclient_hostname_option>AUTO</dhclient_hostname_option>
-    </dhcp_options>
-    <dns t=3D"map">
-      <dhcp_hostname t=3D"boolean">true</dhcp_hostname>
-      <hostname>localhost</hostname>
-      <resolv_conf_policy>auto</resolv_conf_policy>
-    </dns>
-    <interfaces t=3D"list">
-      <interface t=3D"map">
-        <bootproto>dhcp</bootproto>
-        <name>eth0</name>
-        <startmode>auto</startmode>
-        <zone>public</zone>
-      </interface>
-    </interfaces>
-    <ipv6 t=3D"boolean">true</ipv6>
-    <keep_install_network t=3D"boolean">true</keep_install_network>
-    <managed t=3D"boolean">false</managed>
-    <routing t=3D"map">
-      <ipv4_forward t=3D"boolean">false</ipv4_forward>
-      <ipv6_forward t=3D"boolean">false</ipv6_forward>
-    </routing>
-  </networking>
-  <ntp-client t=3D"map">
-    <ntp_policy>auto</ntp_policy>
-    <ntp_servers t=3D"list"/>
-    <ntp_sync>systemd</ntp_sync>
-  </ntp-client>
-  <partitioning t=3D"list">
-    <drive t=3D"map">
-      <device>/dev/vda</device>
-      <disklabel>gpt</disklabel>
-      <enable_snapshots t=3D"boolean">false</enable_snapshots>
-      <partitions t=3D"list">
-        <partition t=3D"map">
-          <create t=3D"boolean">true</create>
-          <filesystem t=3D"symbol">vfat</filesystem>
-          <format t=3D"boolean">true</format>
-          <fstopt>utf8</fstopt>
-          <mount>/boot/efi</mount>
-          <mountby t=3D"symbol">uuid</mountby>
-          <partition_id t=3D"integer">259</partition_id>
-          <partition_nr t=3D"integer">1</partition_nr>
-          <resize t=3D"boolean">false</resize>
-          <size>134217728</size>
-        </partition>
-        <partition t=3D"map">
-          <create t=3D"boolean">true</create>
-          <create_subvolumes t=3D"boolean">true</create_subvolumes>
-          <filesystem t=3D"symbol">btrfs</filesystem>
-          <format t=3D"boolean">true</format>
-          <mount>/</mount>
-          <mountby t=3D"symbol">uuid</mountby>
-          <partition_id t=3D"integer">131</partition_id>
-          <partition_nr t=3D"integer">2</partition_nr>
-          <quotas t=3D"boolean">false</quotas>
-          <resize t=3D"boolean">false</resize>
-          <size>6307167744</size>
-          <subvolumes t=3D"list">
-            <subvolume t=3D"map">
-              <copy_on_write t=3D"boolean">false</copy_on_write>
-              <path>var</path>
-            </subvolume>
-            <subvolume t=3D"map">
-              <copy_on_write t=3D"boolean">true</copy_on_write>
-              <path>usr/local</path>
-            </subvolume>
-            <subvolume t=3D"map">
-              <copy_on_write t=3D"boolean">true</copy_on_write>
-              <path>tmp</path>
-            </subvolume>
-            <subvolume t=3D"map">
-              <copy_on_write t=3D"boolean">true</copy_on_write>
-              <path>srv</path>
-            </subvolume>
-            <subvolume t=3D"map">
-              <copy_on_write t=3D"boolean">true</copy_on_write>
-              <path>root</path>
-            </subvolume>
-            <subvolume t=3D"map">
-              <copy_on_write t=3D"boolean">true</copy_on_write>
-              <path>opt</path>
-            </subvolume>
-            <subvolume t=3D"map">
-              <copy_on_write t=3D"boolean">true</copy_on_write>
-              <path>home</path>
-            </subvolume>
-            <subvolume t=3D"map">
-              <copy_on_write t=3D"boolean">true</copy_on_write>
-              <path>boot/grub2/arm64-efi</path>
-            </subvolume>
-          </subvolumes>
-          <subvolumes_prefix>@</subvolumes_prefix>
-        </partition>
-      </partitions>
-      <type t=3D"symbol">CT_DISK</type>
-      <use>all</use>
-    </drive>
-  </partitioning>
-  <proxy t=3D"map">
-    <enabled t=3D"boolean">false</enabled>
-  </proxy>
-  <services-manager t=3D"map">
-    <default_target>multi-user</default_target>
-    <services t=3D"map">
-      <enable t=3D"list">
-        <service>YaST2-Firstboot</service>
-        <service>YaST2-Second-Stage</service>
-        <service>apparmor</service>
-        <service>auditd</service>
-        <service>klog</service>
-        <service>chronyd</service>
-        <service>cron</service>
-        <service>cups</service>
-        <service>firewalld</service>
-        <service>wickedd-auto4</service>
-        <service>wickedd-dhcp4</service>
-        <service>wickedd-dhcp6</service>
-        <service>wickedd-nanny</service>
-        <service>irqbalance</service>
-        <service>issue-generator</service>
-        <service>kbdsettings</service>
-        <service>wicked</service>
-        <service>nscd</service>
-        <service>postfix</service>
-        <service>purge-kernels</service>
-        <service>rsyslog</service>
-        <service>smartd</service>
-        <service>sshd</service>
-        <service>systemd-pstore</service>
-        <service>systemd-remount-fs</service>
-      </enable>
-    </services>
-  </services-manager>
-  <software t=3D"map">
-    <install_recommended t=3D"boolean">true</install_recommended>
-    <instsource/>
-    <packages t=3D"list">
-      <package>wicked</package>
-      <package>shim</package>
-      <package>os-prober</package>
-      <package>openssh</package>
-      <package>openSUSE-release</package>
-      <package>mokutil</package>
-      <package>kexec-tools</package>
-      <package>grub2-arm64-efi</package>
-      <package>glibc</package>
-      <package>firewalld</package>
-      <package>e2fsprogs</package>
-      <package>dosfstools</package>
-      <package>chrony</package>
-      <package>btrfsprogs</package>
-      <package>autoyast2</package>
-    </packages>
-    <patterns t=3D"list">
-      <pattern>apparmor</pattern>
-      <pattern>base</pattern>
-      <pattern>documentation</pattern>
-      <pattern>enhanced_base</pattern>
-      <pattern>minimal_base</pattern>
-      <pattern>sw_management</pattern>
-      <pattern>yast2_basis</pattern>
-    </patterns>
-    <products t=3D"list">
-      <product>Leap</product>
-    </products>
-  </software>
-  <ssh_import t=3D"map">
-    <copy_config t=3D"boolean">false</copy_config>
-    <import t=3D"boolean">false</import>
-  </ssh_import>
-  <user_defaults t=3D"map">
-    <expire/>
-    <group>100</group>
-    <home>/home</home>
-    <inactive>-1</inactive>
-    <shell>/bin/bash</shell>
-    <umask>022</umask>
-  </user_defaults>
-  <users t=3D"list">
-    <user t=3D"map">
-      <authorized_keys t=3D"list"/>
-      <encrypted t=3D"boolean">true</encrypted>
-      <fullname>user</fullname>
-      <gid>100</gid>
-      <home>/home/user</home>
-      <home_btrfs_subvolume t=3D"boolean">false</home_btrfs_subvolume>
-      <password_settings t=3D"map">
-        <expire/>
-        <flag/>
-        <inact/>
-        <max>99999</max>
-        <min>0</min>
-        <warn>7</warn>
-      </password_settings>
-      <shell>/bin/bash</shell>
-      <uid>1000</uid>
-      <user_password>$6$WV8CB/c6j0zhAi5S$4euhbt4alH7WNfaatS9IJgPiiKDJ48d=
5Ru1zCZCA0N9GiyOPuefN2PAUWlyYeTgqAInpyvPh1frdp4fFVjvEn0</user_password>
-      <username>user</username>
-    </user>
-    <user t=3D"map">
-      <encrypted t=3D"boolean">true</encrypted>
-      <fullname>User for nscd</fullname>
-      <gid>478</gid>
-      <home>/run/nscd</home>
-      <home_btrfs_subvolume t=3D"boolean">false</home_btrfs_subvolume>
-      <password_settings t=3D"map">
-        <expire/>
-        <flag/>
-        <inact/>
-        <max/>
-        <min/>
-        <warn/>
-      </password_settings>
-      <shell>/sbin/nologin</shell>
-      <uid>478</uid>
-      <user_password>!</user_password>
-      <username>nscd</username>
-    </user>
-    <user t=3D"map">
-      <encrypted t=3D"boolean">true</encrypted>
-      <fullname>systemd Network Management</fullname>
-      <gid>480</gid>
-      <home>/</home>
-      <home_btrfs_subvolume t=3D"boolean">false</home_btrfs_subvolume>
-      <password_settings t=3D"map">
-        <expire/>
-        <flag/>
-        <inact/>
-        <max/>
-        <min/>
-        <warn/>
-      </password_settings>
-      <shell>/usr/sbin/nologin</shell>
-      <uid>480</uid>
-      <user_password>!*</user_password>
-      <username>systemd-network</username>
-    </user>
-    <user t=3D"map">
-      <encrypted t=3D"boolean">true</encrypted>
-      <fullname>Daemon</fullname>
-      <gid>2</gid>
-      <home>/sbin</home>
-      <home_btrfs_subvolume t=3D"boolean">false</home_btrfs_subvolume>
-      <password_settings t=3D"map">
-        <expire/>
-        <flag/>
-        <inact/>
-        <max/>
-        <min/>
-        <warn/>
-      </password_settings>
-      <shell>/usr/sbin/nologin</shell>
-      <uid>2</uid>
-      <user_password>!</user_password>
-      <username>daemon</username>
-    </user>
-    <user t=3D"map">
-      <encrypted t=3D"boolean">true</encrypted>
-      <fullname>systemd Time Synchronization</fullname>
-      <gid>479</gid>
-      <home>/</home>
-      <home_btrfs_subvolume t=3D"boolean">false</home_btrfs_subvolume>
-      <password_settings t=3D"map">
-        <expire/>
-        <flag/>
-        <inact/>
-        <max/>
-        <min/>
-        <warn/>
-      </password_settings>
-      <shell>/usr/sbin/nologin</shell>
-      <uid>479</uid>
-      <user_password>!*</user_password>
-      <username>systemd-timesync</username>
-    </user>
-    <user t=3D"map">
-      <encrypted t=3D"boolean">true</encrypted>
-      <fullname>user for rpcbind</fullname>
-      <gid>65534</gid>
-      <home>/var/lib/empty</home>
-      <home_btrfs_subvolume t=3D"boolean">false</home_btrfs_subvolume>
-      <password_settings t=3D"map">
-        <expire/>
-        <flag/>
-        <inact/>
-        <max/>
-        <min/>
-        <warn/>
-      </password_settings>
-      <shell>/sbin/nologin</shell>
-      <uid>475</uid>
-      <user_password>!</user_password>
-      <username>rpc</username>
-    </user>
-    <user t=3D"map">
-      <encrypted t=3D"boolean">true</encrypted>
-      <fullname>SSH daemon</fullname>
-      <gid>476</gid>
-      <home>/var/lib/sshd</home>
-      <home_btrfs_subvolume t=3D"boolean">false</home_btrfs_subvolume>
-      <password_settings t=3D"map">
-        <expire/>
-        <flag/>
-        <inact/>
-        <max/>
-        <min/>
-        <warn/>
-      </password_settings>
-      <shell>/usr/sbin/nologin</shell>
-      <uid>476</uid>
-      <user_password>!</user_password>
-      <username>sshd</username>
-    </user>
-    <user t=3D"map">
-      <encrypted t=3D"boolean">true</encrypted>
-      <fullname>Postfix Daemon</fullname>
-      <gid>51</gid>
-      <home>/var/spool/postfix</home>
-      <home_btrfs_subvolume t=3D"boolean">false</home_btrfs_subvolume>
-      <password_settings t=3D"map">
-        <expire/>
-        <flag/>
-        <inact/>
-        <max/>
-        <min/>
-        <warn/>
-      </password_settings>
-      <shell>/usr/sbin/nologin</shell>
-      <uid>51</uid>
-      <user_password>!</user_password>
-      <username>postfix</username>
-    </user>
-    <user t=3D"map">
-      <encrypted t=3D"boolean">true</encrypted>
-      <fullname>NFS statd daemon</fullname>
-      <gid>65533</gid>
-      <home>/var/lib/nfs</home>
-      <home_btrfs_subvolume t=3D"boolean">false</home_btrfs_subvolume>
-      <password_settings t=3D"map">
-        <expire/>
-        <flag/>
-        <inact/>
-        <max/>
-        <min/>
-        <warn/>
-      </password_settings>
-      <shell>/sbin/nologin</shell>
-      <uid>474</uid>
-      <user_password>!</user_password>
-      <username>statd</username>
-    </user>
-    <user t=3D"map">
-      <encrypted t=3D"boolean">true</encrypted>
-      <fullname>bin</fullname>
-      <gid>1</gid>
-      <home>/bin</home>
-      <home_btrfs_subvolume t=3D"boolean">false</home_btrfs_subvolume>
-      <password_settings t=3D"map">
-        <expire/>
-        <flag/>
-        <inact/>
-        <max/>
-        <min/>
-        <warn/>
-      </password_settings>
-      <shell>/usr/sbin/nologin</shell>
-      <uid>1</uid>
-      <user_password>!</user_password>
-      <username>bin</username>
-    </user>
-    <user t=3D"map">
-      <authorized_keys t=3D"list"/>
-      <encrypted t=3D"boolean">true</encrypted>
-      <fullname>root</fullname>
-      <gid>0</gid>
-      <home>/root</home>
-      <home_btrfs_subvolume t=3D"boolean">false</home_btrfs_subvolume>
-      <password_settings t=3D"map">
-        <expire/>
-        <flag/>
-        <inact/>
-        <max/>
-        <min/>
-        <warn/>
-      </password_settings>
-      <shell>/bin/bash</shell>
-      <uid>0</uid>
-      <user_password>$6$zAe5W7gw/kja9aKy$mM.BWtNyjalXrDNig4CUfN3bgfmehUI=
s8.zvBwWn1XroK104G.rY3lyup3OH8TujieUmgO4J74Df.LktV4A1K1</user_password>
-      <username>root</username>
-    </user>
-    <user t=3D"map">
-      <encrypted t=3D"boolean">true</encrypted>
-      <fullname>User for D-Bus</fullname>
-      <gid>499</gid>
-      <home>/run/dbus</home>
-      <home_btrfs_subvolume t=3D"boolean">false</home_btrfs_subvolume>
-      <password_settings t=3D"map">
-        <expire/>
-        <flag/>
-        <inact/>
-        <max/>
-        <min/>
-        <warn/>
-      </password_settings>
-      <shell>/usr/bin/false</shell>
-      <uid>499</uid>
-      <user_password>!</user_password>
-      <username>messagebus</username>
-    </user>
-    <user t=3D"map">
-      <encrypted t=3D"boolean">true</encrypted>
-      <fullname>Manual pages viewer</fullname>
-      <gid>62</gid>
-      <home>/var/lib/empty</home>
-      <home_btrfs_subvolume t=3D"boolean">false</home_btrfs_subvolume>
-      <password_settings t=3D"map">
-        <expire/>
-        <flag/>
-        <inact/>
-        <max/>
-        <min/>
-        <warn/>
-      </password_settings>
-      <shell>/usr/sbin/nologin</shell>
-      <uid>13</uid>
-      <user_password>!</user_password>
-      <username>man</username>
-    </user>
-    <user t=3D"map">
-      <encrypted t=3D"boolean">true</encrypted>
-      <fullname>Printing daemon</fullname>
-      <gid>497</gid>
-      <home>/var/spool/lpd</home>
-      <home_btrfs_subvolume t=3D"boolean">false</home_btrfs_subvolume>
-      <password_settings t=3D"map">
-        <expire/>
-        <flag/>
-        <inact/>
-        <max/>
-        <min/>
-        <warn/>
-      </password_settings>
-      <shell>/usr/sbin/nologin</shell>
-      <uid>497</uid>
-      <user_password>!</user_password>
-      <username>lp</username>
-    </user>
-    <user t=3D"map">
-      <encrypted t=3D"boolean">true</encrypted>
-      <fullname>User for polkitd</fullname>
-      <gid>477</gid>
-      <home>/var/lib/polkit</home>
-      <home_btrfs_subvolume t=3D"boolean">false</home_btrfs_subvolume>
-      <password_settings t=3D"map">
-        <expire/>
-        <flag/>
-        <inact/>
-        <max/>
-        <min/>
-        <warn/>
-      </password_settings>
-      <shell>/usr/sbin/nologin</shell>
-      <uid>477</uid>
-      <user_password>!</user_password>
-      <username>polkitd</username>
-    </user>
-    <user t=3D"map">
-      <encrypted t=3D"boolean">true</encrypted>
-      <fullname>Chrony Daemon</fullname>
-      <gid>482</gid>
-      <home>/var/lib/chrony</home>
-      <home_btrfs_subvolume t=3D"boolean">false</home_btrfs_subvolume>
-      <password_settings t=3D"map">
-        <expire/>
-        <flag/>
-        <inact/>
-        <max/>
-        <min/>
-        <warn/>
-      </password_settings>
-      <shell>/usr/sbin/nologin</shell>
-      <uid>496</uid>
-      <user_password>!</user_password>
-      <username>chrony</username>
-    </user>
-    <user t=3D"map">
-      <encrypted t=3D"boolean">true</encrypted>
-      <fullname>nobody</fullname>
-      <gid>65534</gid>
-      <home>/var/lib/nobody</home>
-      <home_btrfs_subvolume t=3D"boolean">false</home_btrfs_subvolume>
-      <password_settings t=3D"map">
-        <expire/>
-        <flag/>
-        <inact/>
-        <max/>
-        <min/>
-        <warn/>
-      </password_settings>
-      <shell>/bin/bash</shell>
-      <uid>65534</uid>
-      <user_password>!</user_password>
-      <username>nobody</username>
-    </user>
-    <user t=3D"map">
-      <encrypted t=3D"boolean">true</encrypted>
-      <fullname>Mailer daemon</fullname>
-      <gid>498</gid>
-      <home>/var/spool/clientmqueue</home>
-      <home_btrfs_subvolume t=3D"boolean">false</home_btrfs_subvolume>
-      <password_settings t=3D"map">
-        <expire/>
-        <flag/>
-        <inact/>
-        <max/>
-        <min/>
-        <warn/>
-      </password_settings>
-      <shell>/usr/sbin/nologin</shell>
-      <uid>498</uid>
-      <user_password>!</user_password>
-      <username>mail</username>
-    </user>
-  </users>
-</profile>
--=20
2.43.0


