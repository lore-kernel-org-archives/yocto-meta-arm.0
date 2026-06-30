Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E011BC44502
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 12:47:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20452.1782823632854058936
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 05:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=jcTOeCuv;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F39352C46;
	Tue, 30 Jun 2026 05:47:07 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.29.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE4073F905;
	Tue, 30 Jun 2026 05:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782823632; bh=tlSKGWTgxk4jBdI6xJvpoSploB/gmPQidloC35IlbFc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jcTOeCuv1EjO48L/8URSWOab0tGbs5XqLqQ0MFbOE3mVx/llhNFBifLdh/OkJhxVt
	 J7K3Jqt0dN7hpSuYk7uBm/p6K7b4Y01xjWdtSzD5S6YbyjAJkY2u5yFWy9wSt4Ezpu
	 Hg8vZt9MDCCxWYxIS9VTEo6r8MkioVn8tEEUDEpg=
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH wrynose 1/5] arm-bsp/documentation: corstone1000: update 2026.05 wrynose release documentation
Date: Tue, 30 Jun 2026 13:47:00 +0100
Message-Id: <20260630124704.301310-2-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630124704.301310-1-harsimransingh.tungal@arm.com>
References: <20260630124704.301310-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Jun 2026 12:47:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7100

Update the Corstone-1000 changelog, release notes and user guide for
the 2026.05 wrynose release.

Add the new 2026.05 changelog entry and capture the main release work,
including the component upgrades, TF-M GPT and PSA FWU changes, and the
updated SSH-enabled build flow.
Refresh the component version tables and Yocto distribution component
versions in changelog for the new release.

Update the user guide to align with the 2026.05 release branch and
documentation state, including the Yocto release name, recipe version
references, release tag references, and related asset and report links.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 .../documentation/corstone1000/change-log.rst |  65 +++++++
 .../corstone1000/release-notes.rst            |   6 +
 .../documentation/corstone1000/user-guide.rst | 180 ++++++++++--------
 3 files changed, 176 insertions(+), 75 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/change-log.rst b/met=
a-arm-bsp/documentation/corstone1000/change-log.rst
index 7bab9e21..0c79ad1b 100644
--- a/meta-arm-bsp/documentation/corstone1000/change-log.rst
+++ b/meta-arm-bsp/documentation/corstone1000/change-log.rst
@@ -10,6 +10,71 @@ Change Log
 This document contains a summary of the new features, changes and
 fixes in each release of Corstone-1000 software stack.
=20
+***************
+Version 2026.05
+***************
+
+Changes
+=3D=3D=3D=3D=3D=3D=3D
+
+- Upgraded key Corstone-1000 components to U-Boot 2025.10, TF-A 2.14.1, =
TF-M 2.2.2, OP-TEE 4.9.0, Trusted Services 1.3.0, and Linux 6.19.
+- Added GPT support in TF-M and updated MCUboot to use the GPT library f=
or firmware-update partitions.
+- Extended the TF-M firmware update flow with GPT fixes, partition creat=
e/remove/duplicate operations, metadata-only handling, flash erase protec=
tion, stale partition cleanup, and better handling of older images during=
 PSA FWU.
+- Added SSH-enabled build overlay for FVP mass-storage images.
+- Removed GRUB from the initramfs boot package set.
+
+Corstone-1000 components versions
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
++-------------------------------------------+-------------------+
+| linux-yocto                               | 6.19              |
++-------------------------------------------+-------------------+
+| u-boot                                    | 2025.10           |
++-------------------------------------------+-------------------+
+| external-system                           | 0.1.0             |
++-------------------------------------------+-------------------+
+| optee-client                              | 4.9.0             |
++-------------------------------------------+-------------------+
+| optee-os                                  | 4.9.0             |
++-------------------------------------------+-------------------+
+| trusted-firmware-a                        | 2.14.1            |
++-------------------------------------------+-------------------+
+| trusted-firmware-m                        | 2.2.2             |
++-------------------------------------------+-------------------+
+| libts                                     | v1.3.0            |
++-------------------------------------------+-------------------+
+| ts-sp-{se-proxy, smm-gateway}             | v1.3.0            |
++-------------------------------------------+-------------------+
+| ts-psa-{crypto, iat, its. ps}-api-test    | 74dc6646ff        |
++-------------------------------------------+-------------------+
+
+Yocto distribution components versions
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
++-------------------------------------------+----------------+
+| meta-arm                                  | wrynose        |
++-------------------------------------------+----------------+
+| bitbake                                   | 22021758e6     |
++-------------------------------------------+----------------+
+| meta-openembedded                         | 9af4488d46     |
++-------------------------------------------+----------------+
+| openembedded-core                         | 06dd66e622     |
++-------------------------------------------+----------------+
+| meta-yocto                                | 8251bdad5f     |
++-------------------------------------------+----------------+
+| meta-secure-core                          | 07a99ae241     |
++-------------------------------------------+----------------+
+| busybox                                   | 1.37.0         |
++-------------------------------------------+----------------+
+| musl                                      | 1.2.6          |
++-------------------------------------------+----------------+
+| gcc-arm-none-eabi                         | 15.2.rel1      |
++-------------------------------------------+----------------+
+| gcc-cross-aarch64                         | 15.2.0         |
++-------------------------------------------+----------------+
+| openssl                                   | 3.5.6          |
++-------------------------------------------+----------------+
+
 ***************
 Version 2025.12
 ***************
diff --git a/meta-arm-bsp/documentation/corstone1000/release-notes.rst b/=
meta-arm-bsp/documentation/corstone1000/release-notes.rst
index 1a7e312a..7757e749 100644
--- a/meta-arm-bsp/documentation/corstone1000/release-notes.rst
+++ b/meta-arm-bsp/documentation/corstone1000/release-notes.rst
@@ -19,6 +19,12 @@ intended for safety-critical applications. Should Your=
 Software or Your Hardware
 prove defective, you assume the entire cost of all necessary servicing, =
repair
 or correction.
=20
+***********************
+Release notes - 2026.05
+***********************
+
+The same notes as the 2025.05 release still apply.
+
 ***********************
 Release notes - 2025.12
 ***********************
diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index a33ed066..0e72659c 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -50,7 +50,7 @@ The Corstone-1000 software stack can be run on:
 Yocto Stable Branch
 -------------------
=20
-Corstone-1000 software stack is built on top of Yocto Project's `Whinlat=
ter release <meta-arm-repository-release-branch_>`__.
+Corstone-1000 software stack is built on top of Yocto Project's `Wrynose=
 release <meta-arm-repository-release-branch_>`__.
=20
 Software Components
 -------------------
@@ -91,7 +91,7 @@ Host Processor Components
 +----------+------------------------------------------------------------=
-------------------------------------------+
 | bbappend | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/trusted-fi=
rmware-a/trusted-firmware-a_%.bbappend``   |
 +----------+------------------------------------------------------------=
-------------------------------------------+
-| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm/recipes-bsp/trusted-firmwa=
re-a/trusted-firmware-a_2.14.0.bb``        |
+| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm/recipes-bsp/trusted-firmwa=
re-a/trusted-firmware-a_2.14.1.bb``        |
 +----------+------------------------------------------------------------=
-------------------------------------------+
=20
 `Trusted Services <https://trusted-services.readthedocs.io/en/latest/ind=
ex.html>`__
@@ -131,7 +131,7 @@ Host Processor Components
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 +----------+------------------------------------------------------------=
------------------------------+
-| bbappend | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-security/optee=
/optee-os_4.%.bbappend``      |
+| bbappend | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-security/optee=
/optee-os_%.bbappend``        |
 +----------+------------------------------------------------------------=
------------------------------+
 | Recipe   | ``${WORKSPACE}/meta-arm/meta-arm/recipes-security/optee/opt=
ee-os_4.9.0.bb``              |
 +----------+------------------------------------------------------------=
------------------------------+
@@ -144,7 +144,7 @@ Host Processor Components
 +----------+------------------------------------------------------------=
----------------------+
 | bbappend | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot_%.bbappend``      |
 +----------+------------------------------------------------------------=
----------------------+
-| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot_2025.04.bb``      |
+| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot_2025.10.bb``      |
 +----------+------------------------------------------------------------=
----------------------+
=20
 Linux
@@ -172,7 +172,7 @@ Secure Enclave Components
 +----------+------------------------------------------------------------=
-------------------------------------------+
 | bbappend | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/trusted-fi=
rmware-m/trusted-firmware-m_%.bbappend``   |
 +----------+------------------------------------------------------------=
-------------------------------------------+
-| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm/recipes-bsp/trusted-firmwa=
re-m/trusted-firmware-m_2.2.1.bb``         |
+| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm/recipes-bsp/trusted-firmwa=
re-m/trusted-firmware-m_2.2.2.bb``         |
 +----------+------------------------------------------------------------=
-------------------------------------------+
=20
 ************************************
@@ -223,7 +223,7 @@ Build
     .. code-block:: console
=20
         cd ${WORKSPACE}
-        git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1=
000-2025.12
+        git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1=
000-2026.05
=20
 #. Build a Corstone-1000 image:
=20
@@ -272,20 +272,26 @@ Build with SSH
 The ``meta-arm/kas/corstone1000-${TARGET}.yml`` build produces an image =
for
 booting from flash.
=20
-To build a bootable mass storage OS image with Dropbear SSH enabled, run=
:
+.. important::
+
+    The SSH-enabled mass storage image is supported only for the FVP tar=
get.
+    It is not supported for the MPS3 target, because it relies on pre-ge=
nerated
+    SSH host keys intended for virtual platforms.
+
+To build a bootable mass storage OS image with Dropbear SSH enabled for =
FVP,
+run:
=20
 .. code-block:: console
=20
-    kas build meta-arm/ci/corstone1000-${TARGET}.yml:meta-arm/kas/corsto=
ne1000-ssh.yml
+    kas build meta-arm/ci/corstone1000-fvp.yml:meta-arm/kas/corstone1000=
-ssh.yml
=20
-The mass storage OS image can be found at ``${WORKSPACE}/build/tmp/deplo=
y/images/corstone1000-${TARGET}/core-image-minimal-corstone1000-${TARGET}=
.wic``
+The mass storage OS image can be found at
+``${WORKSPACE}/build/tmp/deploy/images/corstone1000-fvp/core-image-minim=
al-corstone1000-fvp.wic``
=20
 .. note::
=20
-    For the FVP, the generated ``core-image-minimal-corstone1000-fvp.fvp=
conf``
-    configures the mass storage OS image using ``board.msd_mmc.p_mmc_fil=
e``.
-
-    For the MPS3 platform, write the ``*.wic`` image directly to the mas=
s storage device.
+    The generated ``core-image-minimal-corstone1000-fvp.fvpconf`` config=
ures
+    the mass storage OS image using ``board.msd_mmc.p_mmc_file``.
=20
=20
 .. _flashing-firmware-images:
@@ -379,8 +385,8 @@ Flash
=20
=20
 #. Copy ``bl1.bin`` from ``${WORKSPACE}/build/tmp/deploy/images/corstone=
1000-mps3/trusted-firmware-m/`` to the ``SOFTWARE`` directory of the FPGA=
 bundle.
-#. Copy ``es_flashfw.bin`` from ``${WORKSPACE}/build/tmp/deploy/images/c=
orstone1000-mps3`` to the ``SOFTWARE`` directory of the FPGA bundle
-   and rename the binary to ``es0.bin``.
+#. Remove ``ES0.bin`` from the ``SOFTWARE`` directory of the FPGA bundle=
. Copy ``es_flashfw.bin`` from
+   ``${WORKSPACE}/build/tmp/deploy/images/corstone1000-mps3`` to the ``S=
OFTWARE`` directory of the FPGA bundle and rename the binary to ``es0.bin=
``.
 #. Copy ``corstone1000-flash-firmware-image-corstone1000-mps3.wic`` from=
 ``${WORKSPACE}/build/tmp/deploy/images/corstone1000-mps3`` to the ``SOFT=
WARE``
    directory of the FPGA bundle and rename the wic image to ``cs1000.bin=
``.
=20
@@ -524,8 +530,8 @@ Tests
 Reports
 -------
=20
-Reports for the tests conducted on the `Corstone-1000 software (CORSTONE=
1000-2025.12) <https://git.yoctoproject.org/meta-arm/tag/?h=3DCORSTONE100=
0-2025.12>`__
-release are available for reference `here <https://gitlab.arm.com/arm-re=
ference-solutions/arm-reference-solutions-test-report/-/tree/CORSTONE1000=
-2025.12/embedded-a/corstone1000/CORSTONE1000-2025.12?ref_type=3Dtags>`__=
.
+Reports for the tests conducted on the `Corstone-1000 software (CORSTONE=
1000-2026.05) <https://git.yoctoproject.org/meta-arm/tag/?h=3DCORSTONE100=
0-2026.05>`__
+release are available for reference `here <https://gitlab.arm.com/arm-re=
ference-solutions/arm-reference-solutions-test-report/-/tree/CORSTONE1000=
-2026.05/embedded-a/corstone1000/CORSTONE1000-2026.05?ref_type=3Dtags>`__=
.
=20
=20
 .. _clean-secure-flash:
@@ -544,7 +550,7 @@ Clean Secure Flash
     .. code-block:: console
=20
         cd ${WORKSPACE}
-        git clone https://git.gitlab.arm.com/arm-reference-solutions/iot=
-platform-assets.git -b CORSTONE1000-2025.12
+        git clone https://git.gitlab.arm.com/arm-reference-solutions/iot=
-platform-assets.git -b CORSTONE1000-2026.05
=20
 #. Copy the secure flash cleaning Git patch file to your copy of `meta-a=
rm`.
=20
@@ -782,7 +788,12 @@ MPS3
         cd ${WORKSPACE}/arm-systemready/IR/prebuilt_images/v23.09_2.1.0
         sudo dd if=3Dir-acs-live-image-generic-arm64.wic of=3D/dev/sdc i=
flag=3Ddirect oflag=3Ddirect bs=3D1M status=3Dprogress; sync
=20
-#. Plug the USB drive to the MPS3. At this point you should have both th=
e USB drive with the ESP and the USB drive with the ACS image plugged to =
the MPS3.
+#. Unplug the ESP USB drive from the MPS3, if connected.
+
+#. Plug only the ACS image USB drive to the MPS3.
+
+   The ESP USB drive must remain unplugged while the ACS image is bootin=
g,
+   otherwise GRUB might fail to find the bootable partition on the ACS i=
mage USB drive.
=20
 #. Reboot the MPS3.
=20
@@ -790,12 +801,10 @@ The MPS3 will reset multiple times during the test,=
 and it might take approximat
=20
 .. important::
=20
-    Unplug the ESP USB drive from the MPS3 if it is preventing GRUB
-    from finding the bootable partition. Leave only the ACS image USB dr=
ive
-    plugged in to run the ACS tests.
-
-    The ESP USB drive can be plugged in again after
-    selecting the `Linux Boot` option in the GRUB menu at the end of the=
 ACS tests.
+    Keep the ESP USB drive unplugged until the GRUB menu is displayed du=
ring
+    the Linux boot timeout workaround described below. Plug the ESP USB =
drive
+    back in just before selecting the `Linux Boot` option, so it is avai=
lable
+    for the remaining ACS tests.
=20
 .. warning::
=20
@@ -806,6 +815,7 @@ The MPS3 will reset multiple times during the test, a=
nd it might take approximat
     #. Press Enter at the Linux prompt.
     #. Open the file `/etc/systemd/system.conf` and set `DefaultDeviceTi=
meoutSec=3Dinfinity`.
     #. Reboot the platform using the `reboot` command.
+    #. When the GRUB menu appears, plug the ESP USB drive back into the =
MPS3.
     #. Select the `Linux Boot` option from the GRUB menu.
     #. Allow Linux to boot and run the remaining ACS tests until complet=
ion.
=20
@@ -850,7 +860,7 @@ If GRUB is not interrupted, the tests are executed au=
tomatically in the followin
  - UEFI BSA
  - FWTS
=20
-The results can be fetched from the `acs_results` folder in the ``BOOT``=
 partition of the USB drive (for MPS3) or SD Card (for FVP).
+The results can be fetched from the `acs_results` folder in the ``BOOT``=
 partition of the ACS image USB drive (for MPS3) or SD Card (for FVP).
=20
 .. note::
=20
@@ -921,6 +931,11 @@ Generate Capsules
 for the host machine during the firmware image building process.
 The tool can be found at ``${WORKSPACE}/build/tmp/sysroots-components/aa=
rch64/edk2-basetools-native/usr/bin/edk2-BaseTools/BinWrappers/PosixLike/=
GenerateCapsule``.
=20
+.. note::
+
+    The ``aarch64`` part of this path depends on the build host architec=
ture
+    and can be different on another host.
+
 A JSON file containing metadata about the capsule payloads needs to be c=
reated using the script
 found at ``${WORKSPACE}/meta-arm/meta-arm/scripts/generate_capsule_json_=
multiple.py``.
 This JSON file is required by EDK II's ``GenerateCapsule`` tool to gener=
ate the capsule.
@@ -1069,7 +1084,7 @@ MPS3
=20
 #. Prepare a USB drive as explained in `this <mps3-instructions-for-acs-=
image_>`_ section.
=20
-#. Copy the capsule file to the root directory of the ``BOOT`` partition=
 in the USB drive.
+#. Copy the capsule files to the root directory of the ``BOOT`` partitio=
n in the USB drive.
=20
   .. code-block:: console
=20
@@ -1153,7 +1168,7 @@ This will be followed by using the invalid capsule =
to run the rollback protectio
 Positive Full Capsule Update Test
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-#. Run Corstone-1000 with the ACS image containing the two capsule files=
:
+#. Run Corstone-1000 with the ACS image containing the capsule files:
=20
     - MPS3:
=20
@@ -1216,42 +1231,40 @@ Positive Full Capsule Update Test
=20
    =20
     The software stack copies the capsule content to the external flash,=
 which is shared between the Secure Enclave and the Host Processor
-    before rebooting the system.
-
-    After the first reboot, TrustedFirmware-M should apply the valid cap=
sule and display the following log on the Secure Enclave terminal (``ttyU=
SB1`` for MPS3)
-    before rebooting the system a second time:
+    before rebooting the system, and the following logs should be displa=
yed on the Secure Enclave terminal (``ttyUSB1`` for MPS3):
=20
     .. code-block:: console
=20
       ...
-      SysTick_Handler: counted =3D 10, expiring on =3D 360
-      SysTick_Handler: counted =3D 20, expiring on =3D 360
-      SysTick_Handler: counted =3D 30, expiring on =3D 360
-      ...
+      fwu_bootloader_install_image: enter
+      metadata_read: success: active =3D 0, previous =3D 1
+      fwu_update_metadata: enter
       metadata_write: success: active =3D 1, previous =3D 0
-      flash_full_capsule: exit
-      corstone1000_fwu_flash_image: exit: ret =3D 0
+      fwu_update_metadata: exit: ret =3D 0
+      fwu_bootloader_install_image: exit: ret =3D 0
       ...
=20
-    The above log snippet indicates that the new capsule image is succes=
sfully applied, and the board is booting with the external flash's Bank-1=
.
+    The above log snippet indicates that the new capsule image is succes=
sfully applied.
+   =20
+    After the first reboot,=20
=20
-    After a second reboot, the following log should be displayed on on t=
he Secure Enclave terminal (``ttyUSB1``):
+#. Interrupt the U-Boot shell.
=20
     .. code-block:: console
=20
-      ...
-      fmp_set_image_info:133 Enter
-      FMP image update: image id =3D 0
-      FMP image update: status =3D 0version=3D6 last_attempt_version=3D6=
.
-      fmp_set_image_info:157 Exit.
-      corstone1000_fwu_host_ack: exit: ret =3D 0
-      ...
-
-#. Interrupt the U-Boot shell.
+        Hit any key to stop autoboot:
+   =20
+    After the first reboot, TrustedFirmware-M should display the followi=
ng log on the Secure Enclave terminal (``ttyUSB1`` for MPS3):
=20
     .. code-block:: console
=20
-        Hit any key to stop autoboot:
+      ...
+      [INF] Starting TF-M BL1_1
+      metadata_read: success: active =3D 1, previous =3D 0
+      get_fwu_agent_state: exit: FWU Agent PSA_FWU_TRIAL (index mismatch=
)
+      bl1_get_active_bl2_image: booting from trial bank: 1
+      bl1_get_active_bl2_image: exit: booting from bank =3D 1, offset =3D=
 0x1002000
+      ...
=20
 #. Run the following commands in order to run the Corstone-1000 Linux ke=
rnel.
=20
@@ -1264,6 +1277,18 @@ Positive Full Capsule Update Test
         $ loadm 0x90000000 $kernel_addr_r $filesize
         $ bootefi $kernel_addr_r $fdtcontroladdr
=20
+    After executing above set of commands, the following log should be d=
isplayed on the Secure Enclave terminal (``ttyUSB1``):
+
+    .. code-block:: console
+
+      ...
+      fwu_accept_image: success: fwu state is changed to regular
+      update_nv_counters: success
+      disable_host_ack_timer: timer to reset is disabled
+      FMP image update: status =3D 0version=3D6 last_attempt_version=3D6=
.
+      fwu_bootloader_mark_image_accepted: exit: ret =3D 0
+      ...
+
 #. The first boot after a capsule update is considered the trial stage, =
during which the FWU image is accepted.
    However, to view the updated contents of the EFI System Resource Tabl=
e (ESRT), an additional reboot is required.
=20
@@ -1357,21 +1382,20 @@ Rollback Protection Capsule Update Test
     .. code-block:: console
=20
       ...
-        uefi_capsule_retrieve_images: image 0 at 0xa0000070, size=3D1565=
4928
-        uefi_capsule_retrieve_images: exit
-        flash_full_capsule: enter: image =3D 0x0xa0000070, size =3D 7764=
541, version =3D 5
-        ERROR: flash_full_capsule: version error
-        private_metadata_write: enter: boot_index =3D 1
-        private_metadata_write: success
-        fmp_set_image_info:133 Enter
-        FMP image update: image id =3D 0
-        FMP image update: status =3D 1version=3D6 last_attempt_version=3D=
5.
-        fmp_set_image_info:157 Exit.
-        corstone1000_fwu_flash_image: exit: ret =3D -1
-        fmp_get_image_info:232 Enter
-        pack_image_info:207 ImageInfo size =3D 105, ImageName size =3D 3=
4, ImageVersionName
-        size =3D 36
-        fmp_get_image_info:236 Exit
+      fwu_bootloader_load_image: enter: block_offset =3D 0
+      FMP version: 0x5, metadata version : 0x7
+      private_metadata_write: enter: boot_index =3D 0
+      private_metadata_write: success
+      fmp_set_image_info:160 Enter
+      FMP image update: image id =3D 0
+      FMP image update: status =3D 1version=3D7 last_attempt_version=3D5=
.
+      fmp_set_image_info:184 Exit.
+      ERROR: fwu_bootloader_load_image: version error
+      remove_all_stale_partitions: Removed GPT partition 'bl2_secondary'
+      remove_all_stale_partitions: Removed GPT partition 'tfm_secondary'
+      remove_all_stale_partitions: Removed GPT partition 'FIP_B'
+      remove_all_stale_partitions: Removed GPT partition 'kernel_seconda=
ry'
+      fwu_bootloader_load_image: exit: ret =3D -248
       ...
=20
     The Secure Enclave tries to load the new image a predetermined numbe=
r of times
@@ -1634,7 +1658,7 @@ Corstone-1000 on-board non-volatile storage size is=
 insufficient for installing
=20
                 dd if=3D/dev/zero of=3D${WORKSPACE}/fvp_distro_system_dr=
ive.img \
                 bs=3D1 count=3D0 seek=3D10G; sync; \
-                parted -s fvp_distro_system_drive.img mklabel gpt
+                parted -s ${WORKSPACE}/fvp_distro_system_drive.img mklab=
el gpt
    =20
         #. This MMC image will be used as the primary drive to boot the =
distribution.
=20
@@ -1688,6 +1712,10 @@ FVP
         -C board.msd_mmc.p_mmc_file=3D${WORKSPACE}/fvp_distro_system_dri=
ve.img \
         -C board.msd_mmc_2.p_mmc_file=3D${DISTRO_INSTALLER_ISO_PATH}"
=20
+    .. note::
+
+        The FVP distribution installation process can take 6-8 hours to =
complete.
+
     The Linux distribution will be installed on ``fvp_distro_system_driv=
e.img``.
=20
=20
@@ -1696,7 +1724,7 @@ Debian Installation Extra Steps
=20
 Debian installation may need some extra steps, that are indicated below:
=20
-#. Answer ``Yes`` to the question ``Force grub installation to the EFI r=
emovable media path?``.
+#. Answer ``Yes`` to the question ``Install the GRUB boot loader``.
=20
     If the GRUB installation fails, these are the steps to follow on the=
 subsequent
     popups:
@@ -1855,8 +1883,7 @@ Generate Keys, Signed Image and Unsigned Image
         cd ${WORKSPACE}
=20
         git clone https://gitlab.arm.com/arm-reference-solutions/iot-pla=
tform-assets \
-
-        -b CORSTONE1000-2025.12
+        -b CORSTONE1000-2026.05
=20
 #. Set the current working directory to build directory's subdirectory c=
ontaining the software stack build images.
=20
@@ -1868,7 +1895,7 @@ Generate Keys, Signed Image and Unsigned Image
=20
     .. code-block:: console
=20
-        ./${WORKSPACE}/iot-platform-assets/corstone1000/secureboot/creat=
e_keys_and_sign.sh \
+        ${WORKSPACE}/iot-platform-assets/corstone1000/secureboot/create_=
keys_and_sign.sh \
         -d ${TARGET} \
         -v ${CERTIFICATE_VALIDITY_DURATION_IN_DAYS}
=20
@@ -1902,7 +1929,7 @@ MPS3
=20
 #. Perform a cold boot of the MPS3.
=20
-#. On the Host Processor terminal host side, stop the execution of U-Boo=
t when prompted to do so with the message ``Press any key to stop``.
+#. On the Host Processor terminal host side, stop the execution of U-Boo=
t when prompted to do so with the message ``Hit any key to stop autoboot`=
`.
=20
     .. warning::
=20
@@ -1975,7 +2002,7 @@ FVP
=20
 #. Run the software stack as described `here <running-software-stack-fvp=
_>`__.
=20
-#. On the Host Processor terminal host side, stop the execution of U-Boo=
t when prompted to do so with the message ``Press any key to stop``.
+#. On the Host Processor terminal host side, stop the execution of U-Boo=
t when prompted to do so with the message ``Hit any key to stop autoboot`=
`.
=20
     .. warning::
=20
@@ -2076,9 +2103,12 @@ As a result, U-Boot reads these variables and veri=
fies the Linux kernel image be
 In a typical boot scenario, the Linux kernel image is not signed, which =
will prevent the system from booting due to failed image authentication.
 To resolve this, the Platform Key (one of the UEFI authenticated variabl=
es for secure boot) needs to be deleted.
=20
-#. Perform a cold boot of the MPS3.
+#. For MPS3, perform a cold boot.
+
+#. For FVP, continue in the same boot cycle in which the UEFI secure boo=
t keys were enrolled.
+   Do not cold boot FVP before deleting the Platform Key, because the se=
cure flash contents are not preserved across an FVP cold boot.
=20
-#. On the Host Processor terminal host side, stop the execution of U-Boo=
t when prompted to do so with the message ``Press any key to stop``.
+#. On the Host Processor terminal host side, stop the execution of U-Boo=
t when prompted to do so with the message ``Hit any key to stop autoboot`=
`.
=20
 #. On the U-Boot console, delete the Platform Key (PK).
=20
@@ -2279,7 +2309,7 @@ and `Arm Development Studio <arm-ds-website_>`__ ve=
rsions 2022.2, 2022.c, or 202
 .. _arm-developer-fvp: https://developer.arm.com/tools-and-software/open=
-source-software/arm-platforms-software/arm-ecosystem-fvps
 .. _secure-debug-manager-repo-readme: https://github.com/ARM-software/se=
cure-debug-manager/tree/master?tab=3Dreadme-ov-file#secure-debug-manager-=
psa-adac--sdc-600
 .. _secure-debug-manager-armds-integration: https://github.com/ARM-softw=
are/secure-debug-manager?tab=3Dreadme-ov-file#arm-development-studio-inte=
gration
-.. _meta-arm-repository-release-branch: https://docs.yoctoproject.org/ne=
xt/migration-guides/migration-5.3.html
+.. _meta-arm-repository-release-branch: https://docs.yoctoproject.org/ne=
xt/migration-guides/migration-6.0.html
 .. _arm-ulink-pro-website: https://www.arm.com/products/development-tool=
s/debug-probes/ulink-pro
 .. _arm-ds-website: https://www.arm.com/products/development-tools/embed=
ded-and-software/arm-development-studio
 .. _edk2-repository: https://github.com/tianocore/edk2

