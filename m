Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B3FD1D48A
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 19:57:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15458.1767902242754290631
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 08 Jan 2026 11:57:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F123497;
	Thu,  8 Jan 2026 11:57:15 -0800 (PST)
Received: from LXKV206JHX.arm.com (unknown [10.57.48.86])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A68E93F5A1;
	Thu,  8 Jan 2026 11:57:21 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH] docs:corstone1000: Update user guide
Date: Thu,  8 Jan 2026 19:57:13 +0000
Message-ID: <20260108195713.35744-1-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 08 Jan 2026 19:57:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6823

- Replace openSUSE Tumbleweed with openSUSE Leap.
- Ensure correct component versions are listed.
- Update changelog and release notes for C25Q4 release.
- Add Positive partial capsule update test.
- Improve user guide for consistency and clarity.

Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
---
 .../documentation/corstone1000/change-log.rst |  73 ++-
 .../corstone1000/release-notes.rst            |  14 +-
 .../documentation/corstone1000/user-guide.rst | 433 ++++++++++++------
 3 files changed, 367 insertions(+), 153 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/change-log.rst b/met=
a-arm-bsp/documentation/corstone1000/change-log.rst
index 103b7bae..52c860b2 100644
--- a/meta-arm-bsp/documentation/corstone1000/change-log.rst
+++ b/meta-arm-bsp/documentation/corstone1000/change-log.rst
@@ -1,5 +1,5 @@
 ..
- # Copyright (c) 2022-2025, Arm Limited.
+ # Copyright (c) 2022-2026, Arm Limited.
  #
  # SPDX-License-Identifier: MIT
=20
@@ -10,6 +10,77 @@ Change Log
 This document contains a summary of the new features, changes and
 fixes in each release of Corstone-1000 software stack.
=20
+***************
+Version 2025.12
+***************
+
+Changes
+=3D=3D=3D=3D=3D=3D=3D
+
+- Delivered end-to-end Cortex-A320 enablement across U-Boot, TF-A, TF-M,=
 OP-TEE, Yocto machine layers, and documentation, including device-tree u=
pdates, MPIDR handling, and FVP model renaming.
+- Rolled out the PSA Firmware Update (DEN0118) pipeline: U-Boot capsule =
parsing, Bootloader Abstraction Layer in TF-M, ESRT exposure, and Trusted=
 Services IPC bridges replacing legacy capsule code.
+- Hardened the new firmware update flow with EFI self-tests, metadata re=
structuring for partial and multi-image acceptance, and RSE-COMMS gating =
refinements.
+- Upgraded key firmware components (TF-A 2.13.0, TF-M 2.2.1, Trusted Ser=
vices 1.2.0, OP-TEE OS 4.7.0) and introduced targeted test skips plus int=
eger-only build modes to keep validation green.
+- Cleaned and renumbered downstream patch series across Trusted Services=
 and TF-M while removing obsolete integrations to align with upstream bas=
elines.
+- Refreshed release material and architecture guides to describe the A32=
0 profile, PSA FWU behavior, and updated software stack.
+- Added KAS profiles, machine includes, and automated FVP selection logi=
c to streamline developer workflows for the refreshed platform configurat=
ion.
+
+Corstone-1000 components versions
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
++-------------------------------------------+-------------------+
+| linux-yocto                               | 6.12.60           |
++-------------------------------------------+-------------------+
+| u-boot                                    | 2025.04           |
++-------------------------------------------+-------------------+
+| external-system                           | 0.1.0             |
++-------------------------------------------+-------------------+
+| optee-client                              | 4.7.0             |
++-------------------------------------------+-------------------+
+| optee-os                                  | 4.7.0             |
++-------------------------------------------+-------------------+
+| trusted-firmware-a                        | 2.13.0            |
++-------------------------------------------+-------------------+
+| trusted-firmware-m                        | 2.2.1             |
++-------------------------------------------+-------------------+
+| libts                                     | v1.2.0            |
++-------------------------------------------+-------------------+
+| ts-sp-{se-proxy, smm-gateway}             | v1.2.0            |
++-------------------------------------------+-------------------+
+| ts-psa-{crypto, iat, its. ps}-api-test    | 74dc6646ff        |
++-------------------------------------------+-------------------+
+
+Yocto distribution components versions
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
++-------------------------------------------+----------------+
+| meta-arm                                  | whinlatter     |
++-------------------------------------------+----------------+
+| bitbake                                   | 0dde1a3ff8     |
++-------------------------------------------+----------------+
+| meta-openembedded                         | fc0152e434     |
++-------------------------------------------+----------------+
+| openembedded-core                         | 4bd920ad7d     |
++-------------------------------------------+----------------+
+| meta-yocto                                | b3b6592635     |
++-------------------------------------------+----------------+
+| meta-secure-core                          | 63209fb150     |
++-------------------------------------------+----------------+
+| meta-ethos                                | aa2504a32f     |
++-------------------------------------------+----------------+
+| meta-sca                                  | e68f1a9d17     |
++-------------------------------------------+----------------+
+| busybox                                   | 1.37.0         |
++-------------------------------------------+----------------+
+| musl                                      | 1.2.5          |
++-------------------------------------------+----------------+
+| gcc-arm-none-eabi                         | 13.3.rel1      |
++-------------------------------------------+----------------+
+| gcc-cross-aarch64                         | 15.2.0         |
++-------------------------------------------+----------------+
+| openssl                                   | 3.5.4          |
++-------------------------------------------+----------------+
+
 ***************
 Version 2025.05
 ***************
diff --git a/meta-arm-bsp/documentation/corstone1000/release-notes.rst b/=
meta-arm-bsp/documentation/corstone1000/release-notes.rst
index ed7e4c59..6ddc138f 100644
--- a/meta-arm-bsp/documentation/corstone1000/release-notes.rst
+++ b/meta-arm-bsp/documentation/corstone1000/release-notes.rst
@@ -1,5 +1,5 @@
 ..
- # Copyright (c) 2022-2025, Arm Limited.
+ # Copyright (c) 2022-2026, Arm Limited.
  #
  # SPDX-License-Identifier: MIT
=20
@@ -19,6 +19,18 @@ intended for safety-critical applications. Should Your=
 Software or Your Hardware
 prove defective, you assume the entire cost of all necessary servicing, =
repair
 or correction.
=20
+***********************
+Release notes - 2025.12
+***********************
+
+The same notes as the 2025.05 release still apply.
+
+Known Issues or Limitations
+---------------------------
+
+- Corstone-1000 with Cortex-A320 FVP does not currently support Symmetri=
c Multiprocessing
+- Corstone-1000 with Cortex-A320 FVP becomes unresponsive when the Linux=
 kernel driver for the Ethos-U85 NPU loads automatically after a software=
 reboot.
+
 ***********************
 Release notes - 2025.05
 ***********************
diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index e22406a0..5f807f39 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -1,5 +1,5 @@
 ..
- # Copyright (c) 2022-2025, Arm Limited.
+ # Copyright (c) 2022-2026, Arm Limited.
  #
  # SPDX-License-Identifier: MIT
=20
@@ -133,7 +133,7 @@ Host Processor Components
 +----------+------------------------------------------------------------=
------------------------------+
 | bbappend | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-security/optee=
/optee-os_4.%.bbappend``      |
 +----------+------------------------------------------------------------=
------------------------------+
-| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm/recipes-security/optee/opt=
ee-os_4.4.0.bb``              |
+| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm/recipes-security/optee/opt=
ee-os_4.7.0.bb``              |
 +----------+------------------------------------------------------------=
------------------------------+
=20
 `U-Boot <https://github.com/u-boot/u-boot.git>`__
@@ -144,7 +144,7 @@ Host Processor Components
 +----------+------------------------------------------------------------=
----------------------+
 | bbappend | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot_%.bbappend``      |
 +----------+------------------------------------------------------------=
----------------------+
-| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot_2023.07.02.bb``   |
+| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot_2025.04.bb``      |
 +----------+------------------------------------------------------------=
----------------------+
=20
 Linux
@@ -157,7 +157,7 @@ The provided distribution is based on `BusyBox <https=
://www.busybox.net/>`__ and
 +-----------+-----------------------------------------------------------=
-------------------------------------+
 | bbappend  | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-kernel/linux/=
linux-yocto_%.bbappend``             |
 +-----------+-----------------------------------------------------------=
-------------------------------------+
-| Recipe    | ``${WORKSPACE}/poky/meta/recipes-kernel/linux/linux-yocto_=
6.12.bb``                            |
+| Recipe    | ``${WORKSPACE}/core/meta/recipes-kernel/linux/linux-yocto_=
6.12.bb``                            |
 +-----------+-----------------------------------------------------------=
-------------------------------------+
 | defconfig | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-kernel/linux/=
files/corstone1000/defconfig``       |
 +-----------+-----------------------------------------------------------=
-------------------------------------+
@@ -172,7 +172,7 @@ Secure Enclave Components
 +----------+------------------------------------------------------------=
-------------------------------------------+
 | bbappend | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/trusted-fi=
rmware-m/trusted-firmware-m_%.bbappend``   |
 +----------+------------------------------------------------------------=
-------------------------------------------+
-| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm/recipes-bsp/trusted-firmwa=
re-m/trusted-firmware-m_2.1.1.bb``         |
+| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm/recipes-bsp/trusted-firmwa=
re-m/trusted-firmware-m_2.2.1.bb``         |
 +----------+------------------------------------------------------------=
-------------------------------------------+
=20
 ************************************
@@ -245,7 +245,7 @@ Build
=20
         **The External System Processor is not available on the Corstone=
-1000 with Cortex-A320 FVP.**
=20
-        Access to the External System Processor is disabled by default.
+        Access to the External System Processor is disabled by default o=
n **Corstone-1000 with Cortex-A35**.
=20
         To build the Corstone-1000 image with External System Processor =
enabled, run:
=20
@@ -276,7 +276,7 @@ Everything apart from the Secure Enclave ROM firmware=
 and External System firmwa
 ``corstone1000-flash-firmware-image-corstone1000-${TARGET}.wic`` file.
=20
 The output binaries run in the Corstone-1000 platform are the following:
- - The Secure Enclave ROM firmware: ``${WORKSPACE}/build/tmp/deploy/imag=
es/corstone1000-${TARGET}/bl1.bin``
+ - The Secure Enclave ROM firmware: ``${WORKSPACE}/build/tmp/deploy/imag=
es/corstone1000-${TARGET}/trusted-firmware-m/bl1.bin``
  - The External System Processor firmware: ``${WORKSPACE}/build/tmp/depl=
oy/images/corstone1000-${TARGET}/es_flashfw.bin``
  - The internal firmware flash image: ``${WORKSPACE}/build/tmp/deploy/im=
ages/corstone1000-${TARGET}/corstone1000-flash-firmware-image-corstone100=
0-${TARGET}.wic``
=20
@@ -370,7 +370,7 @@ Flash
         IMAGE2FILE: \SOFTWARE\es0.bin
=20
=20
-#. Copy ``bl1.bin`` from ``${WORKSPACE}/build/tmp/deploy/images/corstone=
1000-mps3`` to the ``SOFTWARE`` directory of the FPGA bundle.
+#. Copy ``bl1.bin`` from ``${WORKSPACE}/build/tmp/deploy/images/corstone=
1000-mps3/trusted-firmware-m/`` to the ``SOFTWARE`` directory of the FPGA=
 bundle.
 #. Copy ``es_flashfw.bin`` from ``${WORKSPACE}/build/tmp/deploy/images/c=
orstone1000-mps3`` to the ``SOFTWARE`` directory of the FPGA bundle
    and rename the binary to ``es0.bin``.
 #. Copy ``corstone1000-flash-firmware-image-corstone1000-mps3.wic`` from=
 ``${WORKSPACE}/build/tmp/deploy/images/corstone1000-mps3`` to the ``SOFT=
WARE``
@@ -477,11 +477,16 @@ The FVP can also be manually downloaded from `Arm D=
eveloper <arm-developer-fvp_>
 the Corstone-1000 platform FVP installer.
 Follow the instructions of the installer to setup the FVP.
=20
-#. Run the FVP
+#. Run ``tmux``:
+
+    .. code-block:: console
+
+        cd ${WORKSPACE} && tmux
+
+#. Run the FVP within ``tmux``:
=20
     .. code-block:: console
=20
-        tmux
         kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l \
         -c "../meta-arm/scripts/runfvp --terminals=3Dtmux"
=20
@@ -560,7 +565,7 @@ Clean Secure Flash
         bitbake -c cleansstate trusted-firmware-m corstone1000-flash-fir=
mware-image
         bitbake -c build corstone1000-flash-firmware-image
=20
-#. Replace the ``bl1.bin`` file on the SD card with ``${WORKSPACE}/build=
/tmp/deploy/images/corstone1000-mps3/bl1.bin``.
+#. Replace the ``bl1.bin`` file on the SD card with ``${WORKSPACE}/build=
/tmp/deploy/images/corstone1000-mps3/trusted-firmware-m/bl1.bin``.
=20
 #. Reboot the board to completely erase the secure flash.
=20
@@ -741,9 +746,7 @@ This sections below describe how to build and run ACS=
 tests on Corstone-1000.
     .. note::
=20
         This prebuilt ACS image includes v5.13 kernel, which does not pr=
ovide
-        USB driver support for Corstone-1000. The ACS image with a newer=
 kernel version
-        and full USB support for Corstone-1000 will be available in the =
repository with the next
-        SystemReady release.
+        USB driver support for Corstone-1000.
=20
 #. Decompress the pre-built ACS live image.
=20
@@ -809,16 +812,20 @@ FVP
 =3D=3D=3D
=20
=20
-Run the commands below to run the ACS test on FVP using the built firmwa=
re image and the pre-built ACS image identified above:
+#. Run ``tmux``:
=20
-.. code-block:: console
+    .. code-block:: console
=20
-    cd ${WORKSPACE}
-    tmux
-    ./meta-arm/scripts/runfvp \
-    --terminals=3Dtmux \
-    ./build/tmp/deploy/images/corstone1000-fvp/corstone1000-flash-firmwa=
re-image-corstone1000-fvp.fvpconf \
-    -- -C board.msd_mmc.p_mmc_file=3D${WORKSPACE}/arm-systemready/IR/pre=
built_images/v23.09_2.1.0/ir-acs-live-image-generic-arm64.wic
+        cd ${WORKSPACE} && tmux
+
+#. Run the commands below within ``tmux`` to run the ACS test on FVP usi=
ng the built firmware image and the pre-built ACS image identified above:
+
+    .. code-block:: console
+
+        ./meta-arm/scripts/runfvp \
+        --terminals=3Dtmux \
+        ./build/tmp/deploy/images/corstone1000-fvp/corstone1000-flash-fi=
rmware-image-corstone1000-fvp.fvpconf \
+        -- -C board.msd_mmc.p_mmc_file=3D${WORKSPACE}/arm-systemready/IR=
/prebuilt_images/v23.09_2.1.0/ir-acs-live-image-generic-arm64.wic
=20
=20
 .. note::
@@ -884,20 +891,42 @@ Capsule Update
             systemready-patch/embedded-a/corstone1000/disable_module_aut=
oloading/disable_module_autoloading.yml
=20
=20
+.. important::
+
+    Payload GUIDs (``${BL2_GUID}``, ``${TFM_S_GUID}``, ``${FIP_GUID}``, =
and ``${INITRAMFS_GUID}``)
+    are different depending on whether the capsule is built for the ``fv=
p`` or ``mps3`` ``${TARGET}``.
+
+    +------------+----------------------------------------+-------------=
---------------------------+
+    | Payloads   | FVP                                    | MPS3        =
                           |
+    +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
+    | BL2        | f1d883f9-dfeb-5363-98d8-686ee3b69f4f   | fbfbefaa-0a5=
6-50d5-b651-74091d3d62cf   |
+    +------------+----------------------------------------+-------------=
---------------------------+
+    | TFM_S      | 7fad470e-5ec5-5c03-a2c1-4756b495de61   | af4cc7ad-ee2=
e-5a39-aad5-fac8a1e6173c   |
+    +------------+----------------------------------------+-------------=
---------------------------+
+    | FIP        | f1933675-5a8c-5b6d-9ef4-846739e89bc8   | 55302f96-c4f=
0-5cf9-8624-e7cc388f2b68   |
+    +------------+----------------------------------------+-------------=
---------------------------+
+    | INITRAMFS  | f771aff9-c7e9-5f99-9eda-2369dd694f61   | 3e8ac972-c33=
c-5cc9-90a0-cdd3159683ea   |
+    +------------+----------------------------------------+-------------=
---------------------------+
=20
 The following section describes the steps to update the firmware using C=
apsule Update
 as the Corstone-1000 supports UEFI.
=20
-The firmware update process is tested with an invalid capsule (rollback =
protection capsule update test)
-and with a valid capsule (positive capsule update test) to validate the =
robustness and
+The firmware update process is tested with an invalid capsule and with v=
alid capsules to validate the robustness and
 error-handling capabilities of the firmware update mechanism.
=20
-During the positive capsule update test, the Corstone-1000 is given a va=
lid capsule, which it successfully applies, boots up and then reaches the=
 Linux command prompt.
+**Positive full capsule update test:**
+The Corstone-1000 is provided with a valid full capsule, which it applie=
s successfully.
+The system then boots normally and reaches the Linux command prompt.
+
+**Positive partial capsule update test:**
+The Corstone-1000 is provided with a valid partial capsule that specifie=
s an update for a single component only.
+The capsule is applied successfully, after which the system boots normal=
ly and reaches the Linux command prompt.
=20
-During the rollback protection capsule update test, the Corstone-1000 is=
 given an outdated capsule with a lower version number for all payloads,
-which is expected to be rejected due to its outdated status, thereby ret=
aining the previous firmware.
+**Rollback protection capsule update test:**
+The Corstone-1000 is provided with an outdated capsule containing lower =
version numbers for all payloads.
+The capsule is correctly rejected due to rollback protection, and the pr=
eviously installed firmware is retained.
=20
-Two different capsules (one for each test) are therefore needed to perfo=
rm the tests.
+Three different capsules are therefore needed to perform the tests.
=20
 The following payloads can be individually updated:
=20
@@ -922,15 +951,75 @@ This JSON file is required by EDK II's ``GenerateCa=
psule`` tool to generate the
 The capsule's default metadata passed can be found in the ``${WORKSPACE}=
/meta-arm/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-ima=
ge.bb``
 and ``${WORKSPACE}/meta-arm/kas/corstone1000-image-configuration.yml`` f=
iles.
=20
-Valid Capsule
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Valid Full Capsule
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-An automatically generated capsule can be found at ``${WORKSPACE}/build/=
tmp/deploy/images/corstone1000-${TARGET}-v6.uefi.capsule`` after running =
a firmware build.
+An automatically generated capsule can be found at ``${WORKSPACE}/build/=
tmp/deploy/images/corstone1000-${TARGET}/corstone1000-${TARGET}-v6.uefi.c=
apsule`` after running a firmware build.
=20
 The default metadata values are assumed to be correct to generate a vali=
d capsule.
=20
 This capsule will be used for the positive capsule update test.
=20
+Valid Partial Capsule
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+To generate a capsule that updates only a single component, explicitly s=
et the firmware version for that component and mark it as the only payloa=
d to be updated.
+
+The **partial capsule** is also valid, but sets the firmware version to =
**7** **only** for the **BL2** component, indicating that no other compon=
ents should be updated.
+
+Use the following commands to generate the `capsule_config.json` file, w=
hich is required by the EDK2 tool for capsule creation:
+
+.. code-block:: console
+
+    cd ${WORKSPACE}
+
+    python3 meta-arm/meta-arm/scripts/generate_capsule_json_multiple.py =
\
+    --selected_components DUMMY_START  BL2  DUMMY_END \
+    --components DUMMY_START  BL2  TFM_S  FIP  INITRAMFS  DUMMY_END \
+    --fw_versions 0 7 0 0 0 0 \
+    --guids \
+    6f784cbf-7938-5c23-8d6e-24d2f1410fa9  \
+    ${BL2_GUID} ${TFM_S_GUID}  ${FIP_GUID}  ${INITRAMFS_GUID} \
+    b57e432b-a250-5c73-93e3-90205e64baba \
+    --hardware_instances 1  1  1  1  1  1 \
+    --lowest_supported_versions 5 5 5 5 5 5 \
+    --monotonic_counts 1  1  1  1  1  1 \
+    --payloads \
+    build/tmp/work/corstone1000_${TARGET}-poky-linux-musl/corstone1000-f=
lash-firmware-image/1.0/sources/corstone1000-flash-firmware-image-1.0/dum=
my.bin \
+    build/tmp/deploy/images/corstone1000-${TARGET}/trusted-firmware-m/bl=
2_signed.bin \
+    build/tmp/deploy/images/corstone1000-${TARGET}/trusted-firmware-m/tf=
m_s_signed.bin \
+    build/tmp/deploy/images/corstone1000-${TARGET}/signed_fip-corstone10=
00.bin \
+    build/tmp/deploy/images/corstone1000-${TARGET}/Image.gz-initramfs-co=
rstone1000-${TARGET}.bin \
+    build/tmp/work/corstone1000_${TARGET}-poky-linux-musl/corstone1000-f=
lash-firmware-image/1.0/sources/corstone1000-flash-firmware-image-1.0/dum=
my.bin \
+    --update_image_indexes 5  1  2  3  4  6 \
+    --private_keys \
+    build/tmp/deploy/images/corstone1000-${TARGET}/corstone1000_capsule_=
key.key \
+    build/tmp/deploy/images/corstone1000-${TARGET}/corstone1000_capsule_=
key.key \
+    build/tmp/deploy/images/corstone1000-${TARGET}/corstone1000_capsule_=
key.key \
+    build/tmp/deploy/images/corstone1000-${TARGET}/corstone1000_capsule_=
key.key \
+    build/tmp/deploy/images/corstone1000-${TARGET}/corstone1000_capsule_=
key.key \
+    build/tmp/deploy/images/corstone1000-${TARGET}/corstone1000_capsule_=
key.key \
+    --certificates \
+    build/tmp/deploy/images/corstone1000-${TARGET}/corstone1000_capsule_=
cert.crt \
+    build/tmp/deploy/images/corstone1000-${TARGET}/corstone1000_capsule_=
cert.crt \
+    build/tmp/deploy/images/corstone1000-${TARGET}/corstone1000_capsule_=
cert.crt \
+    build/tmp/deploy/images/corstone1000-${TARGET}/corstone1000_capsule_=
cert.crt \
+    build/tmp/deploy/images/corstone1000-${TARGET}/corstone1000_capsule_=
cert.crt \
+    build/tmp/deploy/images/corstone1000-${TARGET}/corstone1000_capsule_=
cert.crt \
+    --output capsule_config.json
+
+Run the command below to generate the partial capsule:
+
+.. code-block:: console
+
+    ./build/tmp/sysroots-components/aarch64/edk2-basetools-native/usr/bi=
n/edk2-BaseTools/BinWrappers/PosixLike/GenerateCapsule \
+    -e \
+    -j capsule_config.json \
+    --capflag PersistAcrossReset \
+    -o corstone1000-${TARGET}-partial-v7.uefi.capsule
+
+The partial capsule will be located in the ``${WORKSPACE}`` directory.
+
 Invalid Capsule
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
@@ -943,7 +1032,7 @@ Use the following commands to generate the `capsule_=
config.json` file, which is
=20
     cd ${WORKSPACE}
=20
-    python3 meta-arm/scripts/generate_capsule_json_multiple.py \
+    python3 meta-arm/meta-arm/scripts/generate_capsule_json_multiple.py =
\
     --selected_components DUMMY_START  BL2  TFM_S  FIP  INITRAMFS  DUMMY=
_END \
     --components DUMMY_START  BL2  TFM_S  FIP  INITRAMFS  DUMMY_END \
     --fw_versions 5 5 5 5 5 5 \
@@ -955,12 +1044,12 @@ Use the following commands to generate the `capsul=
e_config.json` file, which is
     --lowest_supported_versions 5 5 5 5 5 5 \
     --monotonic_counts 1  1  1  1  1  1 \
     --payloads \
-    build/tmp/deploy/images/corstone1000-${TARGET}/dummy.bin \
-    build/tmp/deploy/images/corstone1000-${TARGET}/bl2_signed.bin \
-    build/tmp/deploy/images/corstone1000-${TARGET}/tfm_s_signed.bin \
+    build/tmp/work/corstone1000_${TARGET}-poky-linux-musl/corstone1000-f=
lash-firmware-image/1.0/sources/corstone1000-flash-firmware-image-1.0/dum=
my.bin \
+    build/tmp/deploy/images/corstone1000-${TARGET}/trusted-firmware-m/bl=
2_signed.bin \
+    build/tmp/deploy/images/corstone1000-${TARGET}/trusted-firmware-m/tf=
m_s_signed.bin \
     build/tmp/deploy/images/corstone1000-${TARGET}/signed_fip-corstone10=
00.bin \
     build/tmp/deploy/images/corstone1000-${TARGET}/Image.gz-initramfs-co=
rstone1000-${TARGET}.bin \
-    build/tmp/deploy/images/corstone1000-${TARGET}/dummy.bin \
+    build/tmp/work/corstone1000_${TARGET}-poky-linux-musl/corstone1000-f=
lash-firmware-image/1.0/sources/corstone1000-flash-firmware-image-1.0/dum=
my.bin \
     --update_image_indexes 5  1  2  3  4  6 \
     --private_keys \
     build/tmp/deploy/images/corstone1000-${TARGET}/corstone1000_capsule_=
key.key \
@@ -979,23 +1068,6 @@ Use the following commands to generate the `capsule=
_config.json` file, which is
     --output capsule_config.json
=20
=20
-.. important::
-
-    Payload GUIDs (``${BL2_GUID}``, ``${TFM_S_GUID}``, ``${FIP_GUID}``, =
and ``${INITRAMFS_GUID}``)
-    are different depending on whether the capsule is built for the ``fv=
p`` or ``mps3`` ``${TARGET}``.
-
-    +------------+----------------------------------------+-------------=
---------------------------+
-    | Payloads   | FVP                                    | MPS3        =
                           |
-    +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
-    | BL2        | f1d883f9-dfeb-5363-98d8-686ee3b69f4f   | fbfbefaa-0a5=
6-50d5-b651-74091d3d62cf   |
-    +------------+----------------------------------------+-------------=
---------------------------+
-    | TFM_S      | 7fad470e-5ec5-5c03-a2c1-4756b495de61   | af4cc7ad-ee2=
e-5a39-aad5-fac8a1e6173c   |
-    +------------+----------------------------------------+-------------=
---------------------------+
-    | FIP        | f1933675-5a8c-5b6d-9ef4-846739e89bc8   | 55302f96-c4f=
0-5cf9-8624-e7cc388f2b68   |
-    +------------+----------------------------------------+-------------=
---------------------------+
-    | INITRAMFS  | f771aff9-c7e9-5f99-9eda-2369dd694f61   | 3e8ac972-c33=
c-5cc9-90a0-cdd3159683ea   |
-    +------------+----------------------------------------+-------------=
---------------------------+
-
 Run the command below to generate the invalid capsule:
=20
 .. code-block:: console
@@ -1026,6 +1098,7 @@ MPS3
=20
     cp ${WORKSPACE}/build/tmp/deploy/images/corstone1000-mps3/corstone10=
00-mps3-v6.uefi.capsule /dev/sdc/BOOT/
     cp ${WORKSPACE}/corstone1000-mps3-v5.uefi.capsule /dev/sdc/EFI/BOOT/
+    cp ${WORKSPACE}/corstone1000-mps3-partial-v7.uefi.capsule /dev/sdc/E=
FI/BOOT/
     sync
=20
 .. note::
@@ -1076,6 +1149,7 @@ FVP
=20
         sudo cp ${WORKSPACE}/build/tmp/deploy/images/corstone1000-fvp/co=
rstone1000-fvp-v6.uefi.capsule /mnt/ir-acs-live-image-generic-arm64/
         sudo cp ${WORKSPACE}/corstone1000-fvp-v5.uefi.capsule /mnt/ir-ac=
s-live-image-generic-arm64/
+        sudo cp ${WORKSPACE}/corstone1000-fvp-partial-v7.uefi.capsule /m=
nt/ir-acs-live-image-generic-arm64/
         sync
=20
 #. Unmount the IR image:
@@ -1088,8 +1162,8 @@ FVP
 Run Capsule Update Tests
 ************************
=20
-The valid capsule (``corstone1000-${TARGET}-v6.uefi.capsule``) will be u=
sed first to run the positive capsule update test.
-This will be followed by using the invalid capsule (``corstone1000-${TAR=
GET}-v5.uefi.capsule``) to run the rollback protection capsule update tes=
t.
+The valid capsules will be used first to run the positive capsule update=
 tests.
+This will be followed by using the invalid capsule to run the rollback p=
rotection capsule update test.
=20
 .. important::
=20
@@ -1097,10 +1171,10 @@ This will be followed by using the invalid capsul=
e (``corstone1000-${TARGET}-v5.
     The rollback protection capsule update test effectively tests that f=
irmware rollback is not permitted.
=20
=20
-.. _positive-capsule-update-test:
+.. _positive-full-capsule-update-test:
=20
-Positive Capsule Update Test
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
+Positive Full Capsule Update Test
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 #. Run Corstone-1000 with the ACS image containing the two capsule files=
:
=20
@@ -1111,11 +1185,16 @@ Positive Capsule Update Test
=20
     - FVP:
=20
-      #. Run the FVP with the IR prebuilt image which now also contains =
the two capsules:
+      #. Run ``tmux``:
+
+      .. code-block:: console
+
+        cd ${WORKSPACE} && tmux
+
+      #. Run the FVP within ``tmux`` with the IR prebuilt image which no=
w also contains the two capsules:
=20
       .. code-block:: console
=20
-        tmux
         kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l \
         -c "../meta-arm/scripts/runfvp --terminals=3Dtmux \
         -- -C board.msd_mmc.p_mmc_file=3D${ACS_IMAGE_PATH}/ir-acs-live-i=
mage-generic-arm64.wic"
@@ -1237,14 +1316,31 @@ Positive Capsule Update Test
=20
 .. warning::
=20
-    Do not terminate FVP between the positive and rollback protection ca=
psule update tests.
+    Do not terminate FVP between the positive full capsule update and pa=
rtial capsule update tests.
+
+
+.. _positive-partial-capsule-update-test:
+
+Positive Partial Capsule Update Test
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Follow the steps for the `positive full capsule update test <positive-fu=
ll-capsule-update-test_>`__ ensuring you use
+``corstone1000-${TARGET}-partial-v7.uefi.capsule`` instead of ``corstone=
1000-${TARGET}-v6.uefi.capsule``.
+
+Once the system has fully booted again, `read the ESRT <verifying-firmwa=
re-versions-via-esrt_>`__ to
+confirm that the firmware version reflects the updated capsule.
+
+.. warning::
+
+    Do not terminate FVP between the positive partial capsule update rol=
lback protection capsule update tests.
+
=20
 Rollback Protection Capsule Update Test
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 .. important::
=20
-  The `positive capsule update test <positive-capsule-update-test_>`__ m=
ust be run before running the rollback protection capsule update test.
+  The `positive partial capsule update test <positive-partial-capsule-up=
date-test_>`__ must be run before running the rollback protection capsule=
 update test.
=20
 #. After running the positive capsule update test, reboot the system by =
typing the following command on the Host Processor terminal (``ttyUSB2`` =
for MPS3):
=20
@@ -1361,7 +1457,7 @@ Rollback Protection Capsule Update Test
       $ loadm 0x90000000 $kernel_addr_r $filesize
       $ bootefi $kernel_addr_r $fdtcontroladdr
=20
-#. Once the system has fully booted again, `read the ESRT <verifying-fir=
mware-versions-via-esrt_>`__ to=20
+#. Once the system has fully booted again, `read the ESRT <verifying-fir=
mware-versions-via-esrt_>`__ to
    confirm that the firmware version reflects the updated capsule.
=20
 .. _verifying-firmware-versions-via-esrt:
@@ -1431,8 +1527,8 @@ To check the version and status of BL2 (``entry0``)=
, run:
    cat /sys/firmware/efi/esrt/entries/entry0/last_attempt_status
=20
=20
-Positive Capsule Update Test ESRT
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Positive Full Capsule Update Test ESRT
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 The following table shows the details of the first four ESRT entries for=
 the positive capsule update test:
=20
@@ -1448,6 +1544,23 @@ The following table shows the details of the first=
 four ESRT entries for the pos
 | 0                 | ``${INITRAMFS_GUID}`` | 0           | 6           =
   | 0                       | 6                        | 0              =
             |
 +-------------------+-----------------------+-------------+-------------=
---+-------------------------+--------------------------+----------------=
-------------+
=20
+Positive Partial Capsule Update Test ESRT
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The following table shows the details of the first four ESRT entries for=
 the positive capsule update test:
+
++-------------------+-----------------------+-------------+-------------=
---+-------------------------+--------------------------+----------------=
-------------+
+| ``capsule_flags`` | ``fw_class``          | ``fw_type`` | ``fw_version=
`` | ``last_attempt_status`` | ``last_attempt_version`` | ``lowest_suppor=
ted_fw_ver`` |
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D+
+| 0                 | ``${BL2_GUID}``       | 0           | 7           =
   | 0                       | 7                        | 0              =
             |
++-------------------+-----------------------+-------------+-------------=
---+-------------------------+--------------------------+----------------=
-------------+
+| 0                 | ``${TFM_S_GUID}``     | 0           | 6           =
   | 0                       | 6                        | 0              =
             |
++-------------------+-----------------------+-------------+-------------=
---+-------------------------+--------------------------+----------------=
-------------+
+| 0                 | ``${FIP_GUID}``       | 0           | 6           =
   | 0                       | 6                        | 0              =
             |
++-------------------+-----------------------+-------------+-------------=
---+-------------------------+--------------------------+----------------=
-------------+
+| 0                 | ``${INITRAMFS_GUID}`` | 0           | 6           =
   | 0                       | 6                        | 0              =
             |
++-------------------+-----------------------+-------------+-------------=
---+-------------------------+--------------------------+----------------=
-------------+
+
 Rollback Protection Capsule Update Test ESRT
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
@@ -1456,7 +1569,7 @@ The following table shows the details of the first =
four ESRT entries for the rol
 +-------------------+------------------------+-------------+------------=
----+-------------------------+--------------------------+---------------=
--------------+
 | ``capsule_flags`` | ``fw_class``           | ``fw_type`` | ``fw_versio=
n`` | ``last_attempt_status`` | ``last_attempt_version`` | ``lowest_suppo=
rted_fw_ver`` |
 +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D+
-| 0                 | ``${BL2_GUID}``        | 0           | 6          =
    | 1                       | 5                        | 0             =
              |
+| 0                 | ``${BL2_GUID}``        | 0           | 7          =
    | 1                       | 5                        | 0             =
              |
 +-------------------+------------------------+-------------+------------=
----+-------------------------+--------------------------+---------------=
--------------+
 | 0                 | ``${TFM_S_GUID}``      | 0           | 6          =
    | 0                       | 6                        | 0             =
              |
 +-------------------+------------------------+-------------+------------=
----+-------------------------+--------------------------+---------------=
--------------+
@@ -1491,44 +1604,40 @@ Follow the instructions below to create the insta=
llation media.
 #. Using your development machine, download one of following Linux distr=
ibution images:
=20
     - `Debian installer image <https://cdimage.debian.org/mirror/cdimage=
/archive/12.7.0/arm64/iso-dvd/>`__
-    - `OpenSUSE Tumbleweed installer image <http://download.opensuse.org=
/ports/aarch64/tumbleweed/iso/>`__=20
+    - `openSUSE Leap installer image <https://download.opensuse.org/dist=
ribution/leap/15.6/iso/openSUSE-Leap-15.6-DVD-aarch64-Current.iso>`__
=20
     .. note::
-       =20
-        For openSUSE Tumbleweed, search for an ISO file with the format:=
 ``openSUSE-Tumbleweed-DVD-aarch64-Snapshot$DATE-Media.iso``.
-       =20
-        ``openSUSE-Tumbleweed-DVD-aarch64-Snapshot20250509-Media.iso`` w=
as used during development.
-
-    The location of the ISO file on the development machine will be refe=
rred to as ``${DISTRO_INSTALLER_ISO_PATH}``.
+   =20
+        The location of the ISO file on the development machine will be =
referred to as ``${DISTRO_INSTALLER_ISO_PATH}``.
=20
 #. Create the installation media which will contain the necessary files =
to install the operation system.
=20
-    - MPS3:
+- **MPS3**:
=20
-        #. Plug a blank USB drive formatted with FAT32, ensuring it has =
a minimum capacity of 4GB, to the development machine.
+    #. Plug a blank USB drive formatted with FAT32, ensuring it has a mi=
nimum capacity of 4GB, to the development machine.
=20
-        #. Run the following command to discover which device is your US=
B drive:
+    #. Run the following command to discover which device is your USB dr=
ive:
=20
-            .. code-block:: console
+        .. code-block:: console
=20
-                lsblk
+            lsblk
=20
-            The remaining steps assume the USB drive is ``/dev/sdb``.
+        The remaining steps assume the USB drive is ``/dev/sdb``.
=20
-            .. warning::
+        .. warning::
=20
-                Do not mistake your development machine hard drive with =
the USB drive.
+            Do not mistake your development machine hard drive with the =
USB drive.
=20
-        #. Write one of the distribution installer ISO file to the USB d=
rive.
+    #. Write one of the distribution installer ISO file to the USB drive=
.
=20
-            .. code-block:: console
+        .. code-block:: console
=20
-                sudo dd if=3D${DISTRO_INSTALLER_ISO_PATH} of=3D/dev/sdb =
iflag=3Ddirect oflag=3Ddirect status=3Dprogress bs=3D1M; sync;
+            sudo dd if=3D${DISTRO_INSTALLER_ISO_PATH} of=3D/dev/sdb ifla=
g=3Ddirect oflag=3Ddirect status=3Dprogress bs=3D1M; sync;
=20
-    - FVP:
+- **FVP**:
=20
-        The distribution installer ISO file does not need to be burnt to=
 a USB drive.
-        It will be used as is when starting the FVP install the distribu=
tion.
+    The distribution installer ISO file does not need to be burnt to a U=
SB drive.
+    It will be used as is when starting the FVP install the distribution=
.
=20
 ********************
 Prepare System Drive
@@ -1586,11 +1695,17 @@ MPS3
=20
 FVP
 =3D=3D=3D
-#. Start the FVP with the system drive as the primary drive and the dist=
ro ISO file as the secondary drive.
+
+#. Run the ``tmux``:
+
+    .. code-block:: console
+
+        cd ${WORKSPACE} && tmux
+
+#. Start the FVP within ``tmux`` with the system drive as the primary dr=
ive and the distro ISO file as the secondary drive:
=20
     .. code-block:: console
=20
-        tmux
         kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l \
         -c "../meta-arm/scripts/runfvp --terminals=3Dtmux -- \
         -C board.msd_mmc.p_mmc_file=3D${WORKSPACE}/fvp_distro_system_dri=
ve.img \
@@ -1653,11 +1768,16 @@ Boot Distribution
=20
     The target should automatically boot into the installed operating sy=
stem image.
=20
-    Stop the FVP and run the command below to simulate a cold boot:
+    Stop the FVP with ``CTRL+C`` and run ``tmux``:
+
+    .. code-block:: console
+
+        cd ${WORKSPACE} && tmux
+
+    Run the command below to simulate a cold boot:
=20
     .. code-block:: console
=20
-        tmux
         kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l \
         -c "../meta-arm/scripts/runfvp --terminals=3Dtmux -- \
         -C board.msd_mmc.p_mmc_file=3D${WORKSPACE}/fvp_distro_system_dri=
ve.img"
@@ -1681,7 +1801,7 @@ Timeout Optimizations
 .. important::
=20
     Operating system timeouts are inconsistent across systems.
-    Skip this section if the system boots to Debian or OpenSUSE without =
any issue.
+    Skip this section if the system boots to Debian or openSUSE without =
any issue.
=20
 Make the system modification below whilst in recovery mode to increase t=
imeouts and boot to the installed distribution.
=20
@@ -1796,14 +1916,14 @@ The modified ESP image can be found at ``${WORKSP=
ACE}/build/tmp/deploy/images/co
 Run Unsigned Image Boot Test
 ****************************
=20
-.. _unsigned-image-boot-test-fvp:
+.. _unsigned-image-boot-test-mps3:
=20
-FVP
-=3D=3D=3D
+MPS3
+=3D=3D=3D=3D
=20
-#. Follow the instructions `here <use-efi-system-partition-fvp_>`__ to u=
se the ESP.
+#. Follow the instructions `here <use-efi-system-partition-mps3_>`__ to =
use the ESP.
=20
-#. Run the software stack as described `here <running-software-stack-fvp=
_>`__.
+#. Perform a cold boot of the MPS3.
=20
 #. On the Host Processor terminal host side, stop the execution of U-Boo=
t when prompted to do so with the message ``Press any key to stop``.
=20
@@ -1817,34 +1937,49 @@ FVP
   =20
         corstone1000#
=20
-
     .. important::
    =20
         The rest of the instructions below will be executed on the U-Boo=
t terminal.
=20
-#. On the U-Boot console, set the current MMC device.
+#. On the U-Boot console, reset USB.
=20
     .. code-block:: console
=20
-        corstone1000# mmc dev 1
+        corstone1000# usb reset
+        resetting USB...
+        Bus usb@40200000: isp1763 bus width: 16, oc: not available
+        USB ISP 1763 HW rev. 32 started
+        scanning bus usb@40200000 for devices... port 1 high speed
+        3 USB Device(s) found
+                scanning usb for storage devices... 1 Storage Device(s) =
found
+
+    .. note::
+
+        Occasionally, the USB reset may fail to detect the USB device. I=
t is advisable to rerun the USB reset command.
+
+#. Select the first USB device, which should be the USB drive containing=
 the ESP.
+
+    .. code-block:: console
+
+        corstone1000# usb dev 0
=20
 #. Enroll the four UEFI secure boot authenticated variables.
=20
     .. code-block:: console
=20
         corstone1000# \
-        load mmc 1:1 $loadaddr corstone1000_secureboot_keys/PK.auth && s=
etenv -e -nv -bs -rt -at -i $loadaddr:$filesize PK; \
-        load mmc 1:1 $loadaddr corstone1000_secureboot_keys/KEK.auth && =
setenv -e -nv -bs -rt -at -i $loadaddr:$filesize KEK; \
-        load mmc 1:1 $loadaddr corstone1000_secureboot_keys/db.auth && s=
etenv -e -nv -bs -rt -at -i $loadaddr:$filesize db; \
-        load mmc 1:1 $loadaddr corstone1000_secureboot_keys/dbx.auth && =
setenv -e -nv -bs -rt -at -i $loadaddr:$filesize dbx
+        load usb 0 $loadaddr corstone1000_secureboot_keys/PK.auth && set=
env -e -nv -bs -rt -at -i $loadaddr:$filesize PK; \
+        load usb 0 $loadaddr corstone1000_secureboot_keys/KEK.auth && se=
tenv -e -nv -bs -rt -at -i $loadaddr:$filesize KEK; \
+        load usb 0 $loadaddr corstone1000_secureboot_keys/db.auth && set=
env -e -nv -bs -rt -at -i $loadaddr:$filesize db; \
+        load usb 0 $loadaddr corstone1000_secureboot_keys/dbx.auth && se=
tenv -e -nv -bs -rt -at -i $loadaddr:$filesize dbx
=20
 #. Attempt to Load the unsigned kernel image.
=20
     .. code-block:: console
=20
         corstone1000# \
-        load mmc 1:1 $loadaddr corstone1000_secureboot_fvp_images/Image_=
fvp; \
-        loadm $loadaddr $kernel_addr_r $filesize; \
+        load usb 0 $loadaddr corstone1000_secureboot_mps3_images/Image_m=
ps3
+        loadm $loadaddr $kernel_addr_r $filesize
         bootefi $kernel_addr_r $fdtcontroladdr
=20
         Booting /MemoryMapped(0x0,0x88200000,0x236aa00)
@@ -1853,14 +1988,15 @@ FVP
=20
 The unsigned Linux kernel image should not be loaded.
=20
-.. _unsigned-image-boot-test-mps3:
=20
-MPS3
-=3D=3D=3D=3D
+.. _unsigned-image-boot-test-fvp:
=20
-#. Follow the instructions `here <use-efi-system-partition-mps3_>`__ to =
use the ESP.
+FVP
+=3D=3D=3D
=20
-#. Perform a cold boot of the MPS3.
+#. Follow the instructions `here <use-efi-system-partition-fvp_>`__ to u=
se the ESP.
+
+#. Run the software stack as described `here <running-software-stack-fvp=
_>`__.
=20
 #. On the Host Processor terminal host side, stop the execution of U-Boo=
t when prompted to do so with the message ``Press any key to stop``.
=20
@@ -1874,49 +2010,34 @@ MPS3
   =20
         corstone1000#
=20
+
     .. important::
    =20
         The rest of the instructions below will be executed on the U-Boo=
t terminal.
=20
-#. On the U-Boot console, reset USB.
-
-    .. code-block:: console
-
-        corstone1000# usb reset
-        resetting USB...
-        Bus usb@40200000: isp1763 bus width: 16, oc: not available
-        USB ISP 1763 HW rev. 32 started
-        scanning bus usb@40200000 for devices... port 1 high speed
-        3 USB Device(s) found
-                scanning usb for storage devices... 1 Storage Device(s) =
found
-
-    .. note::
-
-        Occasionally, the USB reset may fail to detect the USB device. I=
t is advisable to rerun the USB reset command.
-
-#. Select the first USB device, which should be the USB drive containing=
 the ESP.
+#. On the U-Boot console, set the current MMC device.
=20
     .. code-block:: console
=20
-        corstone1000# usb dev 0
+        corstone1000# mmc dev 1
=20
 #. Enroll the four UEFI secure boot authenticated variables.
=20
     .. code-block:: console
=20
         corstone1000# \
-        load usb 0 $loadaddr corstone1000_secureboot_keys/PK.auth && set=
env -e -nv -bs -rt -at -i $loadaddr:$filesize PK; \
-        load usb 0 $loadaddr corstone1000_secureboot_keys/KEK.auth && se=
tenv -e -nv -bs -rt -at -i $loadaddr:$filesize KEK; \
-        load usb 0 $loadaddr corstone1000_secureboot_keys/db.auth && set=
env -e -nv -bs -rt -at -i $loadaddr:$filesize db; \
-        load usb 0 $loadaddr corstone1000_secureboot_keys/dbx.auth && se=
tenv -e -nv -bs -rt -at -i $loadaddr:$filesize dbx
+        load mmc 1:1 $loadaddr corstone1000_secureboot_keys/PK.auth && s=
etenv -e -nv -bs -rt -at -i $loadaddr:$filesize PK; \
+        load mmc 1:1 $loadaddr corstone1000_secureboot_keys/KEK.auth && =
setenv -e -nv -bs -rt -at -i $loadaddr:$filesize KEK; \
+        load mmc 1:1 $loadaddr corstone1000_secureboot_keys/db.auth && s=
etenv -e -nv -bs -rt -at -i $loadaddr:$filesize db; \
+        load mmc 1:1 $loadaddr corstone1000_secureboot_keys/dbx.auth && =
setenv -e -nv -bs -rt -at -i $loadaddr:$filesize dbx
=20
 #. Attempt to Load the unsigned kernel image.
=20
     .. code-block:: console
=20
         corstone1000# \
-        load usb 0 $loadaddr corstone1000_secureboot_mps3_images/Image_m=
ps3
-        loadm $loadaddr $kernel_addr_r $filesize
+        load mmc 1:1 $loadaddr corstone1000_secureboot_fvp_images/Image_=
fvp; \
+        loadm $loadaddr $kernel_addr_r $filesize; \
         bootefi $kernel_addr_r $fdtcontroladdr
=20
         Booting /MemoryMapped(0x0,0x88200000,0x236aa00)
@@ -1925,41 +2046,43 @@ MPS3
=20
 The unsigned Linux kernel image should not be loaded.
=20
+
 **************************
 Run Signed Image Boot Test
 **************************
=20
-FVP
-=3D=3D=3D
+MPS3
+=3D=3D=3D=3D
=20
 .. important::
=20
-    You must first perform the `Unsigned Image Boot Test <unsigned-image=
-boot-test-fvp_>`__.
+    You must first perform the `Unsigned Image Boot Test <unsigned-image=
-boot-test-mps3_>`__.
=20
 Load the signed kernel image.
=20
 .. code-block:: console
=20
     corstone1000# \
-    load mmc 1:1 $loadaddr corstone1000_secureboot_fvp_images/Image_fvp.=
signed; \
+    load usb 0 $loadaddr corstone1000_secureboot_mps3_images/Image_mps3.=
signed; \
     loadm $loadaddr $kernel_addr_r $filesize; \
     bootefi $kernel_addr_r $fdtcontroladdr
=20
 The signed Linux kernel image should be booted successfully.
=20
-MPS3
-=3D=3D=3D=3D
+
+FVP
+=3D=3D=3D
=20
 .. important::
=20
-    You must first perform the `Unsigned Image Boot Test <unsigned-image=
-boot-test-mps3_>`__.
+    You must first perform the `Unsigned Image Boot Test <unsigned-image=
-boot-test-fvp_>`__.
=20
 Load the signed kernel image.
=20
 .. code-block:: console
=20
     corstone1000# \
-    load usb 0 $loadaddr corstone1000_secureboot_mps3_images/Image_mps3.=
signed; \
+    load mmc 1:1 $loadaddr corstone1000_secureboot_fvp_images/Image_fvp.=
signed; \
     loadm $loadaddr $kernel_addr_r $filesize; \
     bootefi $kernel_addr_r $fdtcontroladdr
=20
@@ -1982,26 +2105,27 @@ To resolve this, the Platform Key (one of the UEF=
I authenticated variables for s
=20
 #. On the U-Boot console, delete the Platform Key (PK).
=20
-    - FVP
+    - MPS3
=20
         .. code-block:: console
=20
             corstone1000# \
-            mmc dev 1; \
-            load mmc 1:1 $loadaddr corstone1000_secureboot_keys/PK_delet=
e.auth && setenv -e -nv -bs -rt -at -i $loadaddr:$filesize PK; \
+            usb reset; \
+            usb dev 0; \
+            load usb 0 $loadaddr corstone1000_secureboot_keys/PK_delete.=
auth && setenv -e -nv -bs -rt -at -i $loadaddr:$filesize PK; \
             boot
=20
-    - MPS3
+    - FVP
=20
         .. code-block:: console
=20
             corstone1000# \
-            usb reset; \
-            usb dev 0; \
-            load usb 0 $loadaddr corstone1000_secureboot_keys/PK_delete.=
auth && setenv -e -nv -bs -rt -at -i $loadaddr:$filesize PK; \
+            mmc dev 1; \
+            load mmc 1:1 $loadaddr corstone1000_secureboot_keys/PK_delet=
e.auth && setenv -e -nv -bs -rt -at -i $loadaddr:$filesize PK; \
             boot
=20
=20
+
 PSA API
 -------
=20
@@ -2098,12 +2222,19 @@ Ethos-U85 NPU
         git clone https://git.gitlab.arm.com/arm-reference-solutions/sys=
temready-patch.git \
         -b CORSTONE1000-2025.12
=20
+#. Copy the additional kas configuration file to:
+
+    .. code-block:: console
+
+        cp ${WORKSPACE}/systemready-patch/embedded-a/corstone1000/ethos-=
u85_test/ethos-u85_test.yml \
+        ${WORKSPACE}/meta-arm/kas/
+
 #. Re-Build the Corstone-1000 with Cortex-A320 FVP software stack as fol=
lows:
=20
     .. code-block:: console
=20
         kas build meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l:meta-arm/kas/corstone1000-a320.yml:\
-        systemready-patch/embedded-a/corstone1000/ethos-u85_test/ethos-u=
85_test.yml
+        meta-arm/kas/ethos-u85_test.yml
=20
 #. Run the Corstone-1000 with Cortex-320 FVP:
=20

