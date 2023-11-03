Return-Path: <debbie.martin@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A4CC4167D
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 09:50:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.46666.1699005018203489321
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 02:50:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: debbie.martin@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46D7D2F4
	for <meta-arm@lists.yoctoproject.org>; Fri,  3 Nov 2023 02:51:00 -0700 (PDT)
Received: from e127725.arm.com (unknown [10.57.2.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3E043F64C
	for <meta-arm@lists.yoctoproject.org>; Fri,  3 Nov 2023 02:50:16 -0700 (PDT)
From: Debbie Martin <Debbie.Martin@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/5] arm-bsp/systemready: Bring up the Arm SystemReady IR ACS 2.0 suite on FVP base
Date: Fri,  3 Nov 2023 09:49:37 +0000
Message-Id: <20231103094939.1290558-3-Debbie.Martin@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231103094939.1290558-1-Debbie.Martin@arm.com>
References: <20231103094939.1290558-1-Debbie.Martin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 03 Nov 2023 09:50:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5200

1. Configure FVP base to allow Arm SystemReady IR ACS console access.
2. Configure FVP base Arm SystemReady IR ACS firmware build.
3. Add the machine-specific report.txt for FVP base.
4. Patch the check-sr-results.yaml and format-sr-results.yaml files
   to handle the known differences between FVP base and the
   expected ACS functionality.
5. Add a README with instructions of how to use the meta-arm-systemready
   layer with fvp-base.

Signed-off-by: Debbie Martin <Debbie.Martin@arm.com>
---
 meta-arm-bsp/conf/layer.conf                  |   5 +
 meta-arm-bsp/conf/machine/fvp-base.conf       |   7 +-
 .../arm-systemready-ir-acs-fvp-base.inc       |   2 +
 .../arm-systemready-ir-acs.bbappend           |   1 +
 ...rm-systemready-scripts-native-fvp-base.inc |   5 +
 .../arm-systemready-scripts-native.bbappend   |   1 +
 ...-Change-the-expected-SR-result-confi.patch | 227 ++++++++++++++++++
 .../files/fvp-base/report.txt                 |  34 +++
 meta-arm-systemready/README.md                | 126 ++++++++++
 9 files changed, 406 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-bsp/dynamic-layers/meta-arm-systemready/reci=
pes-test/arm-systemready-acs/arm-systemready-ir-acs-fvp-base.inc
 create mode 100644 meta-arm-bsp/dynamic-layers/meta-arm-systemready/reci=
pes-test/arm-systemready-acs/arm-systemready-ir-acs.bbappend
 create mode 100644 meta-arm-bsp/dynamic-layers/meta-arm-systemready/reci=
pes-test/arm-systemready-acs/arm-systemready-scripts-native-fvp-base.inc
 create mode 100644 meta-arm-bsp/dynamic-layers/meta-arm-systemready/reci=
pes-test/arm-systemready-acs/arm-systemready-scripts-native.bbappend
 create mode 100644 meta-arm-bsp/dynamic-layers/meta-arm-systemready/reci=
pes-test/arm-systemready-acs/files/fvp-base/0001-check-sr-results-Change-=
the-expected-SR-result-confi.patch
 create mode 100644 meta-arm-bsp/dynamic-layers/meta-arm-systemready/reci=
pes-test/arm-systemready-acs/files/fvp-base/report.txt
 create mode 100644 meta-arm-systemready/README.md

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 97d9728c..766b385d 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -19,3 +19,8 @@ LAYERDEPENDS_meta-arm-bsp:append:musca-s1 =3D " meta-py=
thon"

 # Additional license directories.
 LICENSE_PATH +=3D "${LAYERDIR}/custom-licenses"
+
+BBFILES_DYNAMIC +=3D " \
+    meta-arm-systemready:${LAYERDIR}/dynamic-layers/meta-arm-systemready=
/*/*/*.bb \
+    meta-arm-systemready:${LAYERDIR}/dynamic-layers/meta-arm-systemready=
/*/*/*.bbappend \
+"
diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index 4e17a3cc..43f2a8d7 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -8,6 +8,10 @@ require conf/machine/include/arm/arch-armv8a.inc

 TUNE_FEATURES =3D "aarch64"

+ARM_SYSTEMREADY_FIRMWARE =3D "trusted-firmware-a:do_deploy"
+ARM_SYSTEMREADY_ACS_CONSOLE =3D "default"
+EXTRA_IMAGEDEPENDS =3D "${ARM_SYSTEMREADY_FIRMWARE}"
+
 MACHINE_FEATURES =3D "efi"

 IMAGE_NAME_SUFFIX =3D ""
@@ -51,9 +55,8 @@ FVP_CONFIG[bp.virtioblockdevice.image_path] ?=3D "${IMA=
GE_NAME}.wic"
 # Set the baseline to ARMv8.4, as the default is 8.0.
 FVP_CONFIG[cluster0.has_arm_v8-4] =3D "1"
 FVP_CONFIG[cluster1.has_arm_v8-4] =3D "1"
-FVP_CONSOLE ?=3D "terminal_0"
+FVP_CONSOLES[default] =3D "terminal_0"
 FVP_TERMINALS[bp.terminal_0] ?=3D "Console"
 FVP_TERMINALS[bp.terminal_1] ?=3D ""
 FVP_TERMINALS[bp.terminal_2] ?=3D ""
 FVP_TERMINALS[bp.terminal_3] ?=3D ""
-
diff --git a/meta-arm-bsp/dynamic-layers/meta-arm-systemready/recipes-tes=
t/arm-systemready-acs/arm-systemready-ir-acs-fvp-base.inc b/meta-arm-bsp/=
dynamic-layers/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-=
systemready-ir-acs-fvp-base.inc
new file mode 100644
index 00000000..376f623a
--- /dev/null
+++ b/meta-arm-bsp/dynamic-layers/meta-arm-systemready/recipes-test/arm-s=
ystemready-acs/arm-systemready-ir-acs-fvp-base.inc
@@ -0,0 +1,2 @@
+FILESEXTRAPATHS:append :=3D "${THISDIR}/files/${MACHINE}:"
+SRC_URI:append =3D " file://report.txt"
diff --git a/meta-arm-bsp/dynamic-layers/meta-arm-systemready/recipes-tes=
t/arm-systemready-acs/arm-systemready-ir-acs.bbappend b/meta-arm-bsp/dyna=
mic-layers/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-syst=
emready-ir-acs.bbappend
new file mode 100644
index 00000000..397342f4
--- /dev/null
+++ b/meta-arm-bsp/dynamic-layers/meta-arm-systemready/recipes-test/arm-s=
ystemready-acs/arm-systemready-ir-acs.bbappend
@@ -0,0 +1 @@
+include arm-systemready-ir-acs-${MACHINE}.inc
diff --git a/meta-arm-bsp/dynamic-layers/meta-arm-systemready/recipes-tes=
t/arm-systemready-acs/arm-systemready-scripts-native-fvp-base.inc b/meta-=
arm-bsp/dynamic-layers/meta-arm-systemready/recipes-test/arm-systemready-=
acs/arm-systemready-scripts-native-fvp-base.inc
new file mode 100644
index 00000000..dc01d0a2
--- /dev/null
+++ b/meta-arm-bsp/dynamic-layers/meta-arm-systemready/recipes-test/arm-s=
ystemready-acs/arm-systemready-scripts-native-fvp-base.inc
@@ -0,0 +1,5 @@
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/fvp-base:"
+
+SRC_URI:append =3D " \
+    file://0001-check-sr-results-Change-the-expected-SR-result-confi.pat=
ch \
+"
diff --git a/meta-arm-bsp/dynamic-layers/meta-arm-systemready/recipes-tes=
t/arm-systemready-acs/arm-systemready-scripts-native.bbappend b/meta-arm-=
bsp/dynamic-layers/meta-arm-systemready/recipes-test/arm-systemready-acs/=
arm-systemready-scripts-native.bbappend
new file mode 100644
index 00000000..49c01ee9
--- /dev/null
+++ b/meta-arm-bsp/dynamic-layers/meta-arm-systemready/recipes-test/arm-s=
ystemready-acs/arm-systemready-scripts-native.bbappend
@@ -0,0 +1 @@
+include arm-systemready-scripts-native-${MACHINE}.inc
diff --git a/meta-arm-bsp/dynamic-layers/meta-arm-systemready/recipes-tes=
t/arm-systemready-acs/files/fvp-base/0001-check-sr-results-Change-the-exp=
ected-SR-result-confi.patch b/meta-arm-bsp/dynamic-layers/meta-arm-system=
ready/recipes-test/arm-systemready-acs/files/fvp-base/0001-check-sr-resul=
ts-Change-the-expected-SR-result-confi.patch
new file mode 100644
index 00000000..d2226cb1
--- /dev/null
+++ b/meta-arm-bsp/dynamic-layers/meta-arm-systemready/recipes-test/arm-s=
ystemready-acs/files/fvp-base/0001-check-sr-results-Change-the-expected-S=
R-result-confi.patch
@@ -0,0 +1,227 @@
+From e3e0465a25f9b1607b2e5ed42afb7b556aa8b9bc Mon Sep 17 00:00:00 2001
+From: Debbie Martin <Debbie.Martin@arm.com>
+Date: Wed, 4 Oct 2023 18:40:18 +0100
+Subject: [PATCH] [PATCH] check-sr-results: Change the expected SR result
+ config
+
+Update the check-sr-results.yaml and format-sr-results.yaml files for th=
e
+Systemready IR suite. These changes are required because of the
+following known differences of fvp-base outputs to those expected by the
+SystemReady scripts.
+
+Changes to check-sr-results.yaml:
+  1. acs-console.log:
+      a. must-have-esp: EFI partition/variable persistence not supported=
 due to
+         FVP reset.
+      b. warn-once-if-contains "-dirty": BL1, BL2, and BL31 have dirty v=
ersions.
+      c. must-contain "efi: ESRT=3D0x" and "'esrt: Reserving ESRT space =
from 0x'":
+         Capsule updates are not supported.
+      d. error-if-contains: "No EFI system partition" and "Failed to per=
sist
+         EFI variables": EFI partition/variable persistence not supporte=
d due to
+         FVP reset.
+  2. acs_results/result.md:
+      a. must-contain "Failure: |0|": Capsule and EFI partition failures=
 make
+         the total 20.
+  3. acs_results/CapsuleApp_ESRT_table_info.log:
+      a. capsuleapp-esrt: Capsule updates are not supported.
+      b. must-contain "'EFI_SYSTEM_RESOURCE_TABLE:'" and
+         "EFI_SYSTEM_RESOURCE_ENTRY": EFI partition/variable persistence=
 not
+         supported due to FVP reset.
+      c. must-contain "FwClass": Capsule updates are not supported.
+      d. error-if-contains "ESRT - Not Found": Capsule updates are not
+         supported.
+  4. acs_results/CapsuleApp_FMP_protocol_info.log:
+      a. warn-if-contains "Aborted test": Capsule updates are not suppor=
ted.
+         This patch also adds must-contain for the specific totals of th=
e test
+         categories due to allowing the "Aborted test" string.
+  5. acs_results/linux_dump/firmware/efi/esrt:
+      a. Remove whole directory because capsule updates are not supporte=
d.
+  6. acs_results/uefi/temp:
+      a. Set min-entries to 0: this defaults to 1 despite the directory =
being
+         optional, so errors if a directory is empty.
+  7. acs_results/uefi_dump:
+      a. min-entries is 13: change this to 11 due to smbiosview.log bein=
g
+         optional and the change to make map.log optional.
+  8. acs_results/uefi_dump/dh.log:
+      a. must-contain "EFISystemPartition": EFI partition/variable persi=
stence
+         not supported due to FVP reset.
+      b. must-contain "FirmwareManagement": Capsule updates are not supp=
orted.
+  9. acs_results/uefi_dump/map.log:
+      a. Make optional because it isn't populated for IR.
+  10. fw:
+      a. Make optional because capsule updates are not supported.
+  11. os-logs:
+      a. Make optional because distro installation isn't done as part of=
 ACS.
+
+Changes to format-sr-results.yaml:
+  1. Remove the SIE section (not supported on fvp-base and, if present, =
causes
+     format-sr-results.py to error).
+
+Upstream-Status: Inappropriate
+Signed-off-by: Debbie Martin <Debbie.Martin@arm.com>
+---
+ check-sr-results.yaml  | 34 ++++++++++++++--------------------
+ format-sr-results.yaml | 15 ---------------
+ 2 files changed, 14 insertions(+), 35 deletions(-)
+
+diff --git a/check-sr-results.yaml b/check-sr-results.yaml
+index a4235de..555fb71 100644
+--- a/check-sr-results.yaml
++++ b/check-sr-results.yaml
+@@ -10,7 +10,6 @@ check-sr-results-configuration:
+ # The following tree applies to all ACS-IR 2.0 versions.
+ tree:
+   - file: acs-console.log
+-    must-have-esp:
+     must-contain:
+       - Booting `bbr/bsa'
+       - Press any key to stop the EFI SCT running
+@@ -24,8 +23,6 @@ tree:
+       - 'EFI stub: Booting Linux Kernel...'
+       - 'EFI stub: Using DTB from configuration table'
+       - Linux version
+-      - 'efi: ESRT=3D0x'
+-      - 'esrt: Reserving ESRT space from 0x'
+       - systemd
+       - Executing FWTS for EBBR
+       - 'Test: UEFI'
+@@ -36,13 +33,9 @@ tree:
+       - ACS run is completed
+       - Please press <Enter> to continue ...
+     warn-once-if-contains:
+-      - -dirty
+       - 'EFI stub: ERROR:'
+       - 'FIRMWARE BUG:'
+       - OVERLAP DETECTED
+-    error-if-contains:
+-      - No EFI system partition
+-      - Failed to persist EFI variables
+   - dir: acs_results
+     min-entries: 8  # Allow missing result.md
+     max-entries: 9
+@@ -53,7 +46,7 @@ tree:
+         must-contain:
+           - SCT Summary
+           - Dropped:|0|
+-          - Failure:|0|
++          - Failure:|20|
+           - Warning:|0|
+           - Dropped by group
+           - Failure by group
+@@ -64,16 +57,11 @@ tree:
+         max-entries: 2
+         tree:
+           - file: CapsuleApp_ESRT_table_info.log
+-            capsuleapp-esrt:
+             must-contain:
+               - ESRT TABLE
+-              - 'EFI_SYSTEM_RESOURCE_TABLE:'
+-              - EFI_SYSTEM_RESOURCE_ENTRY
+-              - FwClass
+             error-if-contains:
+               - FwResourceCount    - 0x0
+               - FwResourceCountMax - 0x0
+-              - ESRT - Not Found
+           - file: CapsuleApp_FMP_protocol_info.log
+             must-contain:
+               - FMP DATA
+@@ -95,9 +83,14 @@ tree:
+               - 'Medium failures: NONE'
+               - 'Low failures: NONE'
+               - 'Other failures: NONE'
++              - 'dt_base        |    3|     |     |     |     |     |'
++              - 'esrt           |     |     |    2|     |     |     |'
++              - 'uefibootpath   |     |     |     |     |     |     |'
++              - 'uefirtmisc     |    1|     |     |     |    8|     |'
++              - 'uefirttime     |    4|     |     |     |   35|     |'
++              - 'uefirtvariable |    2|     |     |     |   10|     |'
++              - 'uefivarinfo    |     |     |     |     |    1|     |'
+               - 'Total:'
+-            warn-if-contains:
+-              - Aborted test
+             error-if-contains:
+               - FAILED
+               - This is an invalid entry.
+@@ -180,6 +173,7 @@ tree:
+                     tree:
+                       - file: OsIndicationsSupported-*
+                   - dir: esrt
++                    optional:
+                     tree:
+                       - dir: entries
+                         tree:
+@@ -314,8 +308,9 @@ tree:
+               - BSA tests complete. Reset the system.
+           - dir: temp   # This sometimes remains; ignore it
+             optional:
++            min-entries: 0
+       - dir: uefi_dump
+-        min-entries: 13
++        min-entries: 11
+         max-entries: 13
+         tree:
+           - file: bcfg.log
+@@ -331,8 +326,6 @@ tree:
+             must-contain:
+               - Handle dump
+               - DevicePath
+-              - EFISystemPartition
+-              - FirmwareManagement
+               - SimpleTextOut
+           - file: dmem.log
+             must-contain:
+@@ -355,6 +348,7 @@ tree:
+               - DRIVER NAME
+           - file: ifconfig.log
+           - file: map.log
++            optional:
+             must-contain:
+               - Mapping table
+               - /HD(1,GPT,
+@@ -392,7 +386,7 @@ tree:
+   - dir: docs
+     optional:
+   - dir: fw
+-    min-entries: 3
++    optional:
+     tree:
+       - file: u-boot-sniff.log
+         must-contain:
+@@ -500,7 +494,7 @@ tree:
+   - dir: manual-results
+     optional:
+   - dir: os-logs
+-    min-entries: 2
++    optional:
+     tree:
+       - file: 'OS-image-download-links.txt'
+         optional:
+diff --git a/format-sr-results.yaml b/format-sr-results.yaml
+index dd34cd6..20b69de 100644
+--- a/format-sr-results.yaml
++++ b/format-sr-results.yaml
+@@ -47,21 +47,6 @@ subs:
+         extract:
+           filename: "acs_results/linux_dump/firmware/devicetree/base/ps=
ci/\
+             compatible"
+-  - heading: BBSR Compliance
+-    paragraph: TBD
+-    subs:
+-      - heading: SIE SCT
+-        extract:
+-          filename: acs_results/SIE/result.md
+-          find: '# SCT Summary'
+-          first-line: 4
+-          last-line:
+-        paragraph: TBD
+-      - heading: SIE FWTS
+-        extract:
+-          filename: acs_results/SIE/fwts/FWTSResults.log
+-          find: Test Failure Summary
+-        paragraph: TBD
+   - heading: BSA Compliance (informative)
+     paragraph: TBD
+     subs:
+--
+2.25.1
+
diff --git a/meta-arm-bsp/dynamic-layers/meta-arm-systemready/recipes-tes=
t/arm-systemready-acs/files/fvp-base/report.txt b/meta-arm-bsp/dynamic-la=
yers/meta-arm-systemready/recipes-test/arm-systemready-acs/files/fvp-base=
/report.txt
new file mode 100644
index 00000000..f4363b70
--- /dev/null
+++ b/meta-arm-bsp/dynamic-layers/meta-arm-systemready/recipes-test/arm-s=
ystemready-acs/files/fvp-base/report.txt
@@ -0,0 +1,34 @@
+General information
+-------------------
+- Arm SystemReady Band: IR
+- System name: FVP Base A AEM
+- Prepared by:
+- E-mail:
+- Date:
+
+System information
+------------------
+- Company: Arm
+- System: FVP Base A AEM
+- SoC:
+- FW version:
+- Memory:
+- Storage devices / disks:
+- Network controllers:
+- Other Hardware information:
+
+Test Logs and Results
+---------------------
+- ACS version used: 2.0
+- ACS URL (if pre-built binary): https://github.com/ARM-software/arm-sys=
temready/blob/v23.03_IR_2.0.0/IR/prebuilt_images/v23.03_2.0.0/ir-acs-live=
-image-generic-arm64.wic.xz
+- Changes to ACS (if built from source):
+
+- Test Logs collected
+[X] ACS - SCT
+[X] ACS - BSA - UEFI
+[X] ACS - BSA - Linux
+[X] ACS - FWTS
+[X] ACS - Linux boot log
+[X] ACS - Linux dumps
+[X] ACS - UEFI Shell dumps
+[ ] ACS - Capsule Update
diff --git a/meta-arm-systemready/README.md b/meta-arm-systemready/README=
.md
new file mode 100644
index 00000000..ed0da1bf
--- /dev/null
+++ b/meta-arm-systemready/README.md
@@ -0,0 +1,126 @@
+# meta-arm-systemready Yocto Layer
+
+This layer contains classes and recipes for building and running
+[Arm SystemReady][] validation on the supported machines.
+
+Information regarding contributing, reporting bugs, etc can be found in =
the
+top-level meta-arm [README.md](../README.md) file.
+
+## Introduction
+
+This layer provides support for the following on supported machines:
+
+* Building the firmware for the [Arm SystemReady][] certification progra=
m
+* Running [Arm SystemReady ACS][] (Architecture Compliance Suite) tests
+* Running Linux distributions installation tests
+
+This layer is designed to work alongside with a BSP layer. For example, =
the
+[`meta-arm-bsp`][] layer in the top-level meta-arm defines the
+[`fvp-base`][] machine, which can be used with the recipes provided by t=
his
+layer to build the firmware, run the [Arm SystemReady IR][] ACS tests, a=
nd
+run Linux distributions installation. **Note** that users can use this l=
ayer
+with their BSP layer to perform the same build and tests.
+
+### Firmware Build
+
+The `arm-systemready-firmware.bb` recipe is to build the firmware. It re=
quires
+the `ARM_SYSTEMREADY_FIRMWARE` variable set at the MACHINE configuration=
 level
+to list the build dependencies.
+
+### ACS Tests
+
+The recipe to run the ACS tests fetches and deploys the prebuilt ACS tes=
t suite
+disk image, and generates the necessary metadata to support executing th=
e test
+suite using the bitbake `testimage` task. A test case `SystemReadyACSTes=
t` is
+introduced in `lib/oeqa/runtime/cases` to monitor the ACS tests output f=
rom the
+bitbake `testimage` task. The `ARM_SYSTEMREADY_ACS_CONSOLE` variable mus=
t be set
+at the MACHINE configuration level for this test case.
+
+There are two additional recipes for generating the Arm SystemReady ACS =
tests
+report files through the use of the [EDK2 SCT Results Parser][] and the
+[Arm SystemReady scripts][]. These packages are installed in the
+`edk2-test-parser-native.bb` and `arm-systemready-scripts-native.bb` rec=
ipes
+respectively.
+
+The class `arm-systemready-acs.bbclass` implements the common logic to d=
eploy
+the Arm SystemReady ACS prebuilt image and set up the `testimage` enviro=
nment.
+This class also contains a `testimage` `"postfunc"` called `acs_logs_han=
dle`
+which generates report files and analyzes the test results.
+
+The test result analysis is performed by first using the EDK2 SCT Result=
s
+Parser to create a results.md file, then running the Arm SystemReady res=
ult
+check script to check the contents of the result partition as well as th=
e
+console log. The result check will fail if any of the expected files or
+directories are missing, or if any file's contents do not pass its file-=
specific
+checks.
+
+The ACS test results which are checked by the script can be viewed in
+`${TMPDIR}/work/aarch64-oe-linux/arm-systemready-ir-acs/2.0.0-r0/testima=
ge/`. If
+the check fails, the bitbake `testimage` task will fail.
+
+
+### Linux Distributions Installation
+
+Recipes for testing the installation of Linux distributions are provided=
 under
+`recipes-test/arm-systemready-linux-distros`. These recipes help to down=
load the
+installation CD for the Linux distribution and generate an empty disk as=
 the
+target disk for the installation.
+
+## Supported Band and Machine
+
+Arm SystemReady has four bands:
+* [Arm SystemReady SR][]
+* [Arm SystemReady ES][]
+* [Arm SystemReady IR][]
+* [Arm SystemReady LS][]
+
+Currently, this layer only supports
+[Arm SystemReady IR ACS version v23.03_2.0.0][], which is verified on th=
e
+[`fvp-base`][] machine.
+
+## Guidelines for Reusing and Extending
+
+Currently, this layer only supports the Arm SystemReady IR band running =
on the
+`fvp-base` machine defined in the `meta-arm-bsp` layer. The supported Ar=
m
+SystemReady IR implementation can be reused on other machines. Furthermo=
re, the
+current implementation can be further extended to support SR, ES and LS =
bands.
+
+### Reuse
+
+To reuse the supported Arm SystemReady IR on other machines, you will ne=
ed to:
+
+1. Set the `ARM_SYSTEMREADY_FIRMWARE` variable at the MACHINE configurat=
ion
+   level to list the build dependencies. The configuration file of the
+   [`fvp-base`][] machine can be used as a reference.
+2. Set the `ARM_SYSTEMREADY_ACS_CONSOLE` variable at the MACHINE configu=
ration
+   level for running the ACS tests in the bitbake `testimage` task. Also=
 refer
+   to the configuration file of the [`fvp-base`][] machine.
+
+### Extend
+
+To extend support for other bands, you will need to:
+
+1. Add a new recipe to inherit `arm-systemready-acs.bbclass`. You can us=
e
+   [`arm-systemready-ir-acs.bb`][] as a reference.
+2. Add a new `testimage` test case for the newly added band. Refer to
+   [`arm_systemready_ir_acs.py`][].
+3. Set the necessary variables and prepare the ACS baseline files (as li=
sted in
+   the above **Reuse** section) at the MACHINE configuration level from =
the BSP
+   layer for the machine to be supported.
+
+**Note**: When reusing and extending, the current classes and libs may n=
eed to
+be modified or refactored as necessary.
+
+[Arm SystemReady]: https://www.arm.com/architecture/system-architectures=
/systemready-certification-program
+[Arm SystemReady ACS]: https://github.com/ARM-software/arm-systemready
+[Arm SystemReady SR]: https://www.arm.com/architecture/system-architectu=
res/systemready-certification-program/sr
+[Arm SystemReady ES]: https://www.arm.com/architecture/system-architectu=
res/systemready-certification-program/es
+[Arm SystemReady IR]: https://www.arm.com/architecture/system-architectu=
res/systemready-certification-program/ir
+[Arm SystemReady LS]: https://www.arm.com/architecture/system-architectu=
res/systemready-certification-program/ls
+[Arm SystemReady IR ACS version v23.03_2.0.0]: https://github.com/ARM-so=
ftware/arm-systemready/tree/main/IR/prebuilt_images/v23.03_2.0.0
+[Arm SystemReady scripts]: https://gitlab.arm.com/systemready/systemread=
y-scripts
+[EDK2 SCT Results Parser]: https://gitlab.arm.com/systemready/edk2-test-=
parser
+[`arm-systemready-ir-acs.bb`]: recipes-test/arm-systemready-acs/arm-syst=
emready-ir-acs.bb
+[`arm_systemready_ir_acs.py`]: lib/oeqa/runtime/cases/arm_systemready_ir=
_acs.py
+[`meta-arm-bsp`]: ../meta-arm-bsp
+[`fvp-base`]: ../meta-arm-bsp/conf/machine/fvp-base.conf
--
2.25.1


