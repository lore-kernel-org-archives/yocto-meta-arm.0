Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDDB1C27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 16:19:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12828.1718295592626313613
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 13 Jun 2024 09:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0168FEC;
	Thu, 13 Jun 2024 09:20:16 -0700 (PDT)
Received: from e130802.arm.com (unknown [10.57.83.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B302A3F73B;
	Thu, 13 Jun 2024 09:19:50 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com
Cc: Bence Balogh <bence.balogh@arm.com>,
	Delane Brandy <delane.brandy@arm.com>,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 2/2] arm-bsp/documentation: corstone1000: improve tests documentation
Date: Thu, 13 Jun 2024 17:19:38 +0100
Message-Id: <20240613161938.345869-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613161938.345869-1-abdellatif.elkhlifi@arm.com>
References: <20240613161938.345869-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 13 Jun 2024 16:19:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5802

From: Bence Balogh <bence.balogh@arm.com>

Improve the documentation in the user guide of the following tests:

- SystemReady-IR tests
- Manual capsule update and ESRT checks
- Linux distros tests
- UEFI Secureboot (SB) test
- PSA API tests

In addition, we moved the tests in one section for better readability.

Signed-off-by: Delane Brandy <delane.brandy@arm.com>
Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Signed-off-by: Bence Balogh <bence.balogh@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../documentation/corstone1000/user-guide.rst | 363 ++++++++++--------
 1 file changed, 197 insertions(+), 166 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 9e3b9dfd..5dc95642 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -3,9 +3,9 @@
  #
  # SPDX-License-Identifier: MIT
=20
-##########
-User Guide
-##########
+#####################################
+User Guide: Build & run the software
+#####################################
=20
 Notice
 ------
@@ -43,7 +43,7 @@ Targets
 Yocto stable branch
 -------------------
=20
-Corstone-1000 software stack is built on top of Yocto mickledore.
+Corstone-1000 software stack is built on top of Yocto scarthgap.
=20
 Provided components
 -------------------
@@ -364,6 +364,22 @@ The host will boot trusted-firmware-a, OP-TEE, U-Boo=
t and then Linux, and presen
=20
 Login using the username root.
=20
+Using FVP on Windows or AArch64 Linux
+-------------------------------------
+
+The user should follow the build instructions in this document to build =
on a Linux host machine.
+Then, copy the output binaries to the Windows or Aarch64 Linux machine w=
here the FVP is located.
+Then, launch the FVP binary.
+
+Security Issue Reporting
+------------------------
+
+To report any security issues identified with Corstone-1000, please send=
 an email to psirt@arm.com.
+
+###########################
+User Guide: Provided tests
+###########################
+
 SystemReady-IR tests
 --------------------
=20
@@ -419,11 +435,8 @@ Now you can plug this USB stick to the board togethe=
r with ACS test USB stick.
=20
 **Using ESP in FVP:**
=20
-The ESP disk image once created will be used automatically in the Corsto=
ne-1000 FVP as the 2nd MMC card image.
+The ESP disk image once created will be used automatically in the Corsto=
ne-1000 FVP as the 2nd MMC card image. It will be used when the SystemRea=
dy-IR tests will be performed on the FVP in the later section.
=20
-::
-
-   kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c =
"../meta-arm/scripts/runfvp -- -C board.msd_mmc.p_mmc_file=3D"${<path-to-=
img>/ir_acs_live_image.img}"
=20
 Clean Secure Flash Before Testing (applicable to FPGA only)
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -469,7 +482,7 @@ includes a set of examples of the invariant behaviors=
 that are provided by a
 set of specifications for enterprise systems (For example: SBSA, SBBR, e=
tc.),
 so that implementers can verify if these behaviours have been interprete=
d correctly.
=20
-ACS image contains two partitions. BOOT partition and RESULT partition.
+The ACS image contains a BOOT partition.
 Following test suites and bootable applications are under BOOT partition=
:
=20
  * SCT
@@ -495,11 +508,14 @@ BOOT partition contains the following:
     =E2=94=9C=E2=94=80=E2=94=80 grub
     =E2=94=9C=E2=94=80=E2=94=80 grub.cfg
     =E2=94=9C=E2=94=80=E2=94=80 Image
-    =E2=94=94=E2=94=80=E2=94=80 ramdisk-busybox.img
+    =E2=94=9C=E2=94=80=E2=94=80 ramdisk-busybox.img
+    =E2=94=94=E2=94=80=E2=94=80 acs_results
=20
-RESULT partition is used to store the test results.
-**NOTE**: PLEASE MAKE SURE THAT "acs_results" FOLDER UNDER THE RESULT PA=
RTITION IS EMPTY BEFORE YOU START THE TESTING. OTHERWISE THE TEST RESULTS
-WILL NOT BE CONSISTENT
+The BOOT partition is also used to store the test results. The
+results are stored in the `acs_results` folder.
+
+**NOTE**: PLEASE ENSURE THAT the `acs_results` FOLDER UNDER THE BOOT PAR=
TITION IS
+EMPTY BEFORE YOU START TESTING. OTHERWISE THE TEST RESULTS WILL NOT BE C=
ONSISTENT.
=20
 FPGA instructions for ACS image
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
@@ -563,19 +579,6 @@ The details of how this layer works can be found in =
: ``<_workspace>/meta-arm-sy
=20
 **NOTE:** These test might take up to 1 day to finish
=20
-**NOTE:** A rare issue has been noticed (5-6% occurence) during which th=
e FVP hangs during booting the system while running ACS tests.
-If this happens, please apply the following patch, rebuild the software =
stack for FVP and re-run the ACS tests.
-
-::
-
-  cd <_workspace>
-  git clone https://git.gitlab.arm.com/arm-reference-solutions/systemrea=
dy-patch.git -b CORSTONE1000-2024.06
-  cp -f systemready-patch/embedded-a/corstone1000/sr_ir_workaround/0001-=
embedded-a-corstone1000-sr-ir-workaround.patch meta-arm
-  cd meta-arm
-  git am 0001-embedded-a-corstone1000-sr-ir-workaround.patch
-  cd ..
-  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c "=
bitbake u-boot -c cleanall; bitbake trusted-firmware-a -c cleanall; bitba=
ke corstone1000-flash-firmware-image -c cleanall; bitbake corstone1000-fl=
ash-firmware-image"
-
=20
 Common to FVP and FPGA
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -588,88 +591,70 @@ automatically in the following sequence:
  - UEFI BSA
  - FWTS
=20
-The results can be fetched from the ``acs_results`` folder in the RESULT=
 partition of the USB stick (FPGA) / SD Card (FVP).
+The results can be fetched from the `acs_results` folder in the BOOT par=
tition of the USB stick (FPGA) / SD Card (FVP).
+
+**NOTE:** The FVP uses the ``<_workspace>/build/tmp-glibc/work/corstone1=
000_fvp-oe-linux/arm-systemready-ir-acs/2.0.0/deploy-arm-systemready-ir-a=
cs/arm-systemready-ir-acs-corstone1000-fvp.wic`` image if the meta-arm-sy=
stemready layer is used.
+The result can be checked in this image.
=20
 #####################################################
=20
 Manual capsule update and ESRT checks
 -------------------------------------
=20
-The following section describes running manual capsule update.
-
-The steps described in this section perform manual capsule update and sh=
ow how to use the ESRT feature
-to retrieve the installed capsule details.
+The following section describes running manual capsule updates by going =
through
+a negative and positive test. Two capsules are needed to perform the pos=
itive
+and negative updates. The steps also show how to use the EFI System Reso=
urce Table
+(ESRT) to retrieve the installed capsule details.
=20
-For the following tests two capsules are needed to perform 2 capsule upd=
ates. A positive update and a negative update.
+In the positive test, a valid capsule is used and the platform boots cor=
rectly
+until the Linux prompt after the update. In the negative test, an outdat=
ed
+capsule is used that has a smaller version number. This capsule gets rej=
ected
+because of being outdated and the previous firmware will be used instead=
.
=20
-A positive test case capsule which boots the platform correctly until th=
e Linux prompt, and a negative test case with an
-incorrect capsule (corrupted or outdated) which fails to boot to the hos=
t software.
-
-Check the "Run SystemReady-IR ACS tests" section above to download and u=
npack the ACS image file
- - ``ir-acs-live-image-generic-arm64.wic.xz``
-
-Download systemready-patch repo under <_workspace>:
-
-::
-
-  git clone https://git.gitlab.arm.com/arm-reference-solutions/systemrea=
dy-patch.git -b CORSTONE1000-2024.06
=20
 *******************
 Generating Capsules
 *******************
=20
-A no-partition image is created during the Yocto build. An update capsul=
e is generated using this ``.nopt`` image.
-This can be found in ``build/tmp/deploy/images/corstone1000-<fvp/mps3>/c=
orstone1000-<fvp/mps3>_image.nopt``.
-The capsule's default metadata (name, version, etc.) can be found in ``m=
eta-arm/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image=
.bb``
-and ``meta-arm/kas/corstone1000-image-configuration.yml``.
-
-FPGA Capsules
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-The generated capsule can be found in ``build/tmp/deploy/images/corstone=
1000-mps3/corstone1000-mps3-v6.uefi.capsule``.
-If a new capsule has to be generated with different metadata, then it ca=
n be done by using the ``u-boot-tools`` and the previously
-created ``.nopt`` image.
-
-For example a capsule for the negative update test scenario, if the host=
's architecture is x86_64:
-
-::
-
-   cd <_workspace>
-
-   ./build/tmp/sysroots-components/x86_64/u-boot-tools-native/usr/bin/mk=
eficapsule --monotonic-count 1 \
-   --private-key build/tmp/deploy/images/corstone1000-mps3/corstone1000_=
capsule_key.key \
-   --certificate build/tmp/deploy/images/corstone1000-mps3/corstone1000_=
capsule_cert.crt --index 1 --guid df1865d1-90fb-4d59-9c38-c9f2c1bba8cc \
-   --fw-version 5 build/tmp/deploy/images/corstone1000-mps3/corstone1000=
-mps3_image.nopt corstone1000-mps3-v5.uefi.capsule
-
-This command will put the newly generated capsule to the ``<_workspace>`=
` directory.
-
-Generating FVP Capsules
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+A no-partition image is needed for the capsule generation. This image is
+created automatically during a clean Yocto build and it can be found in
+``build/tmp/deploy/images/corstone1000-<fvp/mps3>/corstone1000-<fvp/mps3=
>_image.nopt``.
+A capsule is also automatically generated with U-Boot's ``mkeficapsule``=
 tool
+during the Yocto build that uses this ``corstone1000-<fvp/mps3>_image.no=
pt``. The
+capsule's default metadata, that is passed to the ``mkeficapsule`` tool,
+can be found in the ``meta-arm/meta-arm-bsp/recipes-bsp/images/corstone1=
000-flash-firmware-image.bb``
+and ``meta-arm/kas/corstone1000-image-configuration.yml`` files. These
+data can be modified before the Yocto build if it is needed. It is
+assumed that the default values are used in the following steps.
+
+The automatically generated capsule can be found in
+``build/tmp/deploy/images/corstone1000-<fvp/mps3>/corstone1000-<fvp/mps3=
>-v6.uefi.capsule``.
+This capsule will be used as the positive capsule during the test in the=
 following
+steps.
+
+Generating Capsules Manually
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
=20
-The generated capsule can be found in ``build/tmp/deploy/images/corstone=
1000-fvp/corstone1000-fvp-v6.uefi.capsule``.
-If a new capsule has to be generated with different metadata, then it ca=
n be done by using the ``u-boot-tools`` and the previously
-created ``.nopt`` image.
+If a new capsule has to be generated with different metadata after the b=
uild
+process, then it can be done manually by using the ``u-boot-tools``'s
+``mkeficapsule`` and the previously created ``.nopt`` image. The
+``mkeficapsule`` tool is built automatically for the host machine
+during the Yocto build.
=20
-For example a capsule for the negative update test scenario, if the host=
's architecture is x86_64:
+The negative capsule needs a lower ``fw-version`` than the positive
+capsule. For example if the host's architecture is x86_64, this can
+be generated by using the following command:
=20
 ::
=20
    cd <_workspace>
=20
    ./build/tmp/sysroots-components/x86_64/u-boot-tools-native/usr/bin/mk=
eficapsule --monotonic-count 1 \
-   --private-key build/tmp/deploy/images/corstone1000-fvp/corstone1000_c=
apsule_key.key \
-   --certificate build/tmp/deploy/images/corstone1000-fvp/corstone1000_c=
apsule_cert.crt --index 1 --guid 989f3a4e-46e0-4cd0-9877-a25c70c01329 \
-   --fw-version 5 build/tmp/deploy/images/corstone1000-fvp/corstone1000-=
fvp_image.nopt corstone1000-fvp-v5.uefi.capsule
-
-This command will put the newly generated capsule to the ``<_workspace>`=
` directory.
-
-Common Notes for FVP and FPGA
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+   --private-key build/tmp/deploy/images/corstone1000-<fvp/mps3>/corston=
e1000_capsule_key.key \
+   --certificate build/tmp/deploy/images/corstone1000-<fvp/mps3>/corston=
e1000_capsule_cert.crt --index 1 --guid df1865d1-90fb-4d59-9c38-c9f2c1bba=
8cc \
+   --fw-version 5 build/tmp/deploy/images/corstone1000-<fvp/mps3>/corsto=
ne1000-<fvp/mps3>_image.nopt corstone1000-<fvp/mps3>-v5.uefi.capsule
=20
-The capsule binary size (wic file) should be less than 15 MB.
-
-Based on the user's requirement, the user can change the firmware versio=
n
-number given to ``--fw-version`` option (the version number needs to be =
>=3D 1).
+This command will put the negative capsule to the ``<_workspace>`` direc=
tory.
=20
=20
 ****************
@@ -694,19 +679,26 @@ the on disk method.
 Copying the FVP capsules
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-First, Find the 1st partition offset:
+The ACS image should be used for the FVP as well. Downloaded and extract=
 the
+image the same way as for the FPGA `FPGA instructions for ACS image`_.
+Creating an USB stick with the image is not needed for the FVP.
+
+After getting the ACS image, find the 1st partition's offset of the
+``ir-acs-live-image-generic-arm64.wic`` image. The partition table can b=
e
+listed using the ``fdisk`` tool.
=20
 ::
=20
   fdisk -lu <path-to-img>/ir-acs-live-image-generic-arm64.wic
-  ->  Device                                                     Start  =
   End Sectors  Size Type
-       <path-to-img>/ir-acs-live-image-generic-arm64.wic1    2048  20684=
7  204800   100M Microsoft basic data
-       <path-to-img>/ir-acs-live-image-generic-arm64.wic2  206848 102423=
9  817392 399.1M Linux filesystem
-       <path-to-img>/ir-acs-live-image-generic-arm64.wic3 1026048 112844=
7  102400    50M Microsoft basic data
+      Device                                Start     End Sectors  Size =
Type
+         <path-to-img>/ir-acs-live-image-generic-arm64.wic1   2048  3092=
47  307200  150M Microsoft basic data
+         <path-to-img>/ir-acs-live-image-generic-arm64.wic2 309248 13433=
39 1034092  505M Linux filesystem
+
=20
-  ->   <offset_3rd_partition> =3D 2048 * 512 (sector size) =3D 1048576
+The first partition starts at the 2048th sector. This has to be multipli=
ed
+by the sector size which is 512 so the offset is 2048 * 512 =3D 1048576.
=20
-Next, mount the IR image:
+Next, mount the IR image using the previously calculated offset:
=20
 ::
=20
@@ -731,13 +723,17 @@ Then, unmount the IR image:
 Performing the capsule update
 ******************************
=20
-During this section we will be using the capsule with the higher version=
 (``corstone1000-<fvp/mps3>-v6.uefi.capsule``) for the positive scenario
-and the capsule with the lower version (``corstone1000-<fvp/mps3>-v5.uef=
i.capsule``) for the negative scenario.
+During this section we will be using the capsule with the higher version
+(``corstone1000-<fvp/mps3>-v6.uefi.capsule``) for the positive scenario
+and then the capsule with the lower version (``corstone1000-<fvp/mps3>-v=
5.uefi.capsule``)
+for the negative scenario. The two tests have to be done after each othe=
r
+in the correct order to make sure that the negative capsule will get rej=
ected.
=20
 Running the FPGA with the IR prebuilt image
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-Insert the prepared USB stick then Power cycle the MPS3 board.
+Insert the prepared USB stick which has the IR prebuilt image and two ca=
psules,
+then Power cycle the MPS3 board.
=20
 Running the FVP with the IR prebuilt image
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -749,11 +745,14 @@ Run the FVP with the IR prebuilt image:
    kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c =
"../meta-arm/scripts/runfvp --terminals=3Dxterm -- -C board.msd_mmc.p_mmc=
_file=3D<path-to-img>/ir-acs-live-image-generic-arm64.wic"
=20
 **NOTE:** <path-to-img> must start from the root directory. make sure th=
ere are no spaces before or after of "=3D". board.msd_mmc.p_mmc_file=3D<p=
ath-to-img>/ir-acs-live-image-generic-arm64.wic.
+**NOTE:** Do not restart the FVP between the positive and negative test =
because it will start from a clean state.
=20
 Executing capsule update for FVP and FPGA
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-Reach U-Boot then interrupt the boot  to reach the EFI shell.
+Wait until U-boot loads EFI from the ACS image stick and interrupt the E=
FI
+shell by pressing ESC when the following prompt is displayed in the Host
+terminal (ttyUSB2).
=20
 ::
=20
@@ -765,15 +764,26 @@ Then, type FS0: as shown below:
=20
   FS0:
=20
-In case of the positive scenario run the update with the higher version =
capsule as shown below:
+Then start the CapsuleApp application. Use the positive capsule
+(corstone1000-<fvp/mps3>-v6.uefi.capsule) first.
=20
 ::
=20
   EFI/BOOT/app/CapsuleApp.efi corstone1000-<fvp/mps3>-v6.uefi.capsule
=20
-After successfully updating the capsule the system will reset.
+The capsule update will be started.
=20
-In case of the negative scenario run the update with the lower version c=
apsule as shown below:
+**NOTE:**  On the FVP it takes around 15-30 minutes, on the FPGA it take=
s less time.
+
+After successfully updating the capsule the system will reset. Make sure=
 the
+Corstone-1000's Poky Distro is booted after the reset so the ESRT can be=
 checked.
+It is described in the `Select Corstone-1000 Linux kernel boot`_ section=
 how to
+boot the Poky distro after the capsule update.
+The `Positive scenario`_ sections describes how the result should be ins=
pected.
+After the result is checked, the system can be rebooted with the ``reboo=
t`` command in the Host
+terminal (ttyUSB2).
+
+Interrupt the EFI shell again and now start the capsule update with the =
negative capsule:
=20
 ::
=20
@@ -791,15 +801,12 @@ Then, reboot manually:
=20
    Shell> reset
=20
-FPGA: Select Corstone-1000 Linux kernel boot
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Remove the USB stick before U-Boot is reached so the Corstone-1000 kerne=
l will be detected and used for booting.
+Make sure the Corstone-1000's Poky Distro is booted again
+(`Select Corstone-1000 Linux kernel boot`_) in order to check the result=
s
+`Negative scenario`_.
=20
-**NOTE:** Otherwise, the execution ends up in the ACS live image.
-
-FVP: Select Corstone-1000 Linux kernel boot
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Select Corstone-1000 Linux kernel boot
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 Interrupt the U-Boot shell.
=20
@@ -825,9 +832,12 @@ Capsule update status
 Positive scenario
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-In the positive case scenario, the user should see following log in TF-M=
 log,
-indicating the new capsule image is successfully applied, and the board =
boots
-correctly.
+In the positive case scenario, the software stack copies the capsule to =
the
+External Flash, which is shared between the Secure Enclave and Host,
+then a reboot is triggered. The TF-M accepts the capsule.
+The user should see following TF-M log in the Secure Enclave terminal (t=
tyUSB1)
+before the system reboots automatically, indicating the new capsule
+image is successfully applied, and the board boots correctly.
=20
 ::
=20
@@ -841,6 +851,18 @@ correctly.
   corstone1000_fwu_flash_image: exit: ret =3D 0
   ...
=20
+And after the reboot:
+
+::
+
+  ...
+  fmp_set_image_info:133 Enter
+  FMP image update: image id =3D 0
+  FMP image update: status =3D 0version=3D6 last_attempt_version=3D6.
+  fmp_set_image_info:157 Exit.
+  corstone1000_fwu_host_ack: exit: ret =3D 0
+  ...
+
=20
 It's possible to check the content of the ESRT table after the system fu=
lly boots.
=20
@@ -869,11 +891,14 @@ In the Linux command-line run the following:
    lowest_supported_fw_ver:	0
=20
=20
-Negative scenario (Applicable to FPGA only)
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Negative scenario
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-In the negative case scenario (rollback the capsule version), the user s=
hould
-see appropriate logs in the secure enclave terminal.
+In the negative case scenario (rollback the capsule version),
+the TF-M detects that the new capsule's version number is
+smaller then the current version. The capsule is rejected because
+of this.
+The user should see appropriate logs in the Secure Enclave terminal (tty=
USB1) before the system reboots itself.
=20
 ::
=20
@@ -897,7 +922,7 @@ see appropriate logs in the secure enclave terminal.
=20
=20
 If capsule pass initial verification, but fails verifications performed =
during
-boot time, secure enclave will try new images predetermined number of ti=
mes
+boot time, Secure Enclave will try new images predetermined number of ti=
mes
 (defined in the code), before reverting back to the previous good bank.
=20
 ::
@@ -933,11 +958,6 @@ In the Linux command-line run the following:
    last_attempt_version:	5
    lowest_supported_fw_ver:	0
=20
-**Note**: This test is currently not working properly in Corstone-1000 F=
VP.
-However, it is not part of the System-Ready IR tests, and it won't affec=
t the
-SR-IR certification. All the compulsory `capsule update tests for SR-IR
-<https://developer.arm.com/documentation/DUI1101/2-1/Test-SystemReady-IR=
/Test-UpdateCapsule>`__
-works on both Corstone-1000 FVP and FPGA.
=20
 Linux distros tests
 -------------------
@@ -1033,9 +1053,9 @@ With a minimum size of 8GB formatted with gpt.
=20
 ::
=20
-  #Generating mmc2
-  dd if=3D/dev/zero of=3D<_workspace>/mmc2_file.img bs=3D1 count=3D0 see=
k=3D10G; sync;
-  parted -s mmc2_file.img mklabel gpt
+  #Generating os_file
+  dd if=3D/dev/zero of=3D<_workspace>/os_file.img bs=3D1 count=3D0 seek=3D=
10G; sync;
+  parted -s os_file.img mklabel gpt
=20
=20
 *************************************************
@@ -1067,10 +1087,10 @@ FVP
=20
 ::
=20
-  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c "=
../meta-arm/scripts/runfvp --terminals=3Dxterm -- -C board.msd_mmc.p_mmc_=
file=3D<path-to-iso_file> -C board.msd_mmc_2.p_mmc_file=3D<_workspace>/mm=
c2_file.img"
+  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c "=
../meta-arm/scripts/runfvp --terminals=3Dxterm -- -C board.msd_mmc.p_mmc_=
file=3D<_workspace>/os_file.img -C board.msd_mmc_2.p_mmc_file=3D<path-to-=
iso_file>"
=20
 The installer should now start.
-The os will be installed on the second mmc 'mmc2_file.img'.
+The OS will be installed on 'os_file.img'.
=20
 *******************************************************
 Debian install clarifications
@@ -1123,17 +1143,22 @@ after entering the password for the root user.
=20
 FVP
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-Once the installation is complete, you will need to exit the shell insta=
nce
-and run this command to boot into the installed OS:
+The platform should automatically boot into the installed OS image.
=20
-::
+To cold boot:
=20
-  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c "=
../meta-arm/scripts/runfvp --terminals=3Dxterm -- -C board.msd_mmc.p_mmc_=
file=3D<path-to-iso_file> -C board.msd_mmc.p_mmc_file=3D<_workspace>/mmc2=
_file.img"
+ ::
=20
-Once the FVP begins booting, you will need to quickly change the boot op=
tion in grub,
-to boot into recovery mode.
+  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c "=
../meta-arm/scripts/runfvp --terminals=3Dxterm -- -C board.msd_mmc.p_mmc_=
file=3D<_workspace>/os_file.img"
=20
-**NOTE:** This option will disappear quickly, so it's best to preempt it=
.
+
+The board will then enter recovery mode, from which the user can access =
a shell
+after entering the password for the root user.
+
+
+**NOTE:** To manually enter recovery mode, once the FVP begins booting, =
you can quickly
+change the boot option in grub, to boot into recovery mode. This option =
will disappear
+quickly, so it's best to preempt it.
=20
 Select 'Advanced Options for '<OS>' and then '<OS> (recovery mode)'.
=20
@@ -1213,7 +1238,7 @@ Then, check whether the FF-A TEE driver is loaded c=
orrectly by using the followi
=20
   cat /proc/modules | grep arm_tstee
=20
-The output should be:
+The output should be similar to:
=20
 ::
=20
@@ -1229,16 +1254,31 @@ Now, run the PSA API tests in the following order=
:
   psa-ps-api-test
=20
=20
-UEFI Secureboot test
---------------------
+UEFI Secureboot (SB) test
+-------------------------
=20
-Before running the secureboot test, the user should make sure that the `=
FVP and FPGA software has been compiled and the ESP image for both the FV=
P and FPGA has been created` as mentioned in the previous sections and us=
er should use the same workspace directory under which sources have been =
compiled.=20
-The secureboot tests is applicable on both the FVP and the FPGA and this=
 involves testing both the signed and unsigned kernel images. Successful =
test results in executing the signed image correctly and not allowing the=
 unsigned image to run at all.
+Before running the SB test, the user should make sure that the `FVP and =
FPGA software has been compiled and the ESP image for both the FVP and FP=
GA has been created` as mentioned in the previous sections and user shoul=
d use the same workspace directory under which sources have been compiled=
.
+The SB test is applicable on both the FVP and the FPGA and this involves=
 testing both the signed and unsigned kernel images. Successful test resu=
lts in executing the signed image correctly and not allowing the unsigned=
 image to run at all.
=20
 ***********************************************************
 Below steps are applicable to FVP as well as FPGA
 ***********************************************************
-In order to achieve this for FVP and FPGA, a bash script is available in=
 the systemready-patch repo which is responsible in creating the relevant=
 keys, sign the respective kernel images, and copy the same in their corr=
esponding ESP images.
+Firstly, the flash firmware image has to be built for both the FVP and F=
PGA as follows:
+
+For FVP,
+
+::
+
+  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c b=
itbake -c build corstone1000-flash-firmware-image"
+
+
+For FPGA,
+
+::
+
+  kas shell meta-arm/kas/corstone1000-mps3.yml:meta-arm/ci/debug.yml -c =
bitbake -c build corstone1000-flash-firmware-image"
+
+In order to test SB for FVP and FPGA, a bash script is available in the =
systemready-patch repo which is responsible in creating the relevant keys=
, sign the respective kernel images, and copy the same in their correspon=
ding ESP images.
=20
 Clone the systemready-patch repo under <_workspace. Then, change directo=
ry to where the script `create_keys_and_sign.sh` is and execute the scrip=
t as follows:
=20
@@ -1247,27 +1287,30 @@ Clone the systemready-patch repo under <_workspac=
e. Then, change directory to wh
   git clone https://git.gitlab.arm.com/arm-reference-solutions/systemrea=
dy-patch.git -b CORSTONE1000-2024.06
   cd systemready-patch/embedded-a/corstone1000/secureboot/
=20
-The script is responsible to create the required UEFI secureboot keys, s=
ign the kernel images and copy the public keys and the kernel images (bot=
h signed and unsigned) to the ESP image for both the FVP and FPGA.=20
+**NOTE:** The efitools package is required to execute the script. Instal=
l the efitools package on your system, if it doesn't exist.
+
+The script is responsible to create the required UEFI secureboot keys, s=
ign the kernel images and copy the public keys and the kernel images (bot=
h signed and unsigned) to the ESP image for both the FVP and FPGA.
=20
 ::
- =20
-  ./create_keys_and_sign.sh -w <Absolute path to _workspace/meta-arm dir=
ectory under which sources have been compiled> -v <certification validity=
 in days>
+
+  ./create_keys_and_sign.sh -w <Absolute path to <workdir> directory und=
er which sources have been compiled> -v <certification validity in days>
   For ex: ./create_keys_and_sign.sh -w "/home/xyz/workspace/meta-arm" -v=
 365
   For help: ./create_keys_and_sign.sh -h
=20
 **NOTE:** The above script is interactive and contains some commands tha=
t would require sudo password/permissions.
=20
-After executing the above script, the relevant keys and the signed/unsig=
ned kernel images will be copied to the ESP images for both the FVP and F=
GPA. The modified ESP images can be found at the same location i.e.=20
+After executing the above script, the relevant keys and the signed/unsig=
ned kernel images will be copied to the ESP images for both the FVP and F=
GPA. The modified ESP images can be found at the same location i.e.
=20
 ::
=20
   For MPS3 FPGA : _workspace/meta-arm/build/tmp/deploy/images/corstone10=
00-mps3/corstone1000-esp-image-corstone1000-mps3.wic
   For FVP       : _workspace/meta-arm/build/tmp/deploy/images/corstone10=
00-fvp/corstone1000-esp-image-corstone1000-fvp.wic
=20
-Now, it is time to test the UEFI secureboot for the Corstone-1000
+Now, it is time to test the SB for the Corstone-1000
+
=20
 ***********************************************************
-Steps to test Secureboot on FVP
+Steps to test SB on FVP
 ***********************************************************
 Now, as mentioned in the previous section **Prepare EFI System Partition=
**, the ESP image will be used automatically in the Corstone-1000 FVP as =
the 2nd MMC card image. Change directory to your workspace and run the FV=
P as follows:
=20
@@ -1316,9 +1359,10 @@ The above set of commands should result in booting=
 of signed linux kernel image
=20
=20
 ***********************************************************
-Steps to test Secureboot on MPS3 FPGA
+Steps to test SB on MPS3 FPGA
 ***********************************************************
-Now, as mentioned in the previous section **Prepare EFI System Partition=
**, the ESP image for MPS3 FPGA needs to be copied to the USB drive. foll=
ow the steps mentioned in the same section for MPS3 FPGA to prepare the U=
SB drive with the ESP image. The modified ESP image corresponds to MPS3 F=
PGA can be found at the location as mentioned before i.e. `_workspace/met=
a-arm/build/tmp/deploy/images/corstone1000-mps3/corstone1000-esp-image-co=
rstone1000-mps3.wic`. =20
+Now, as mentioned in the previous section **Prepare EFI System Partition=
**, the ESP image for MPS3 FPGA needs to be copied to the USB drive.
+Follow the steps mentioned in the same section for MPS3 FPGA to prepare =
the USB drive with the ESP image. The modified ESP image corresponds to M=
PS3 FPGA can be found at the location as mentioned before i.e. `_workspac=
e/meta-arm/build/tmp/deploy/images/corstone1000-mps3/corstone1000-esp-ima=
ge-corstone1000-mps3.wic`.
 Insert this USB drive to the MPS3 FPGA and boot, and stop the execution =
at the U-Boot prompt similar to the FVP. At the U-Boot prompt, run the fo=
llowing commands:
=20
 Reset the USB
@@ -1376,7 +1420,7 @@ The above set of commands should result in booting =
of signed linux kernel image
 ***********************************************************
 Steps to disable Secureboot on both FVP and MPS3 FPGA
 ***********************************************************
-Now, after testing the secureboot, UEFI authenticated variables get stor=
ed in the secure flash. When you try to reboot, the U-Boot will automatic=
ally read the UEFI authenticated variables and authenticates the images b=
efore executing them. In normal booting scenario, the linux kernel images=
 will not be signed and hence this will not allow the system to boot, as =
image authentication will fail. We need to delete the Platform Key (one o=
f the UEFI authenticated variable for Secureboot) in order to disable the=
 secureboot. At the U-Boot prompt, run the following commands.=20
+Now, after testing the SB, UEFI authenticated variables get stored in th=
e secure flash. When you try to reboot, the U-Boot will automatically rea=
d the UEFI authenticated variables and authenticates the images before ex=
ecuting them. In normal booting scenario, the linux kernel images will no=
t be signed and hence this will not allow the system to boot, as image au=
thentication will fail. We need to delete the Platform Key (one of the UE=
FI authenticated variable for SB) in order to disable the SB. At the U-Bo=
ot prompt, run the following commands.
=20
 On the FVP
=20
@@ -1395,13 +1439,7 @@ On the MPS3 FPGA
   corstone1000# load usb 0 $loadaddr corstone1000_secureboot_keys/PK_del=
ete.auth && setenv -e -nv -bs -rt -at -i $loadaddr:$filesize PK
   corstone1000# boot
=20
-The above commands will delete the Platform key (PK) and allow the norma=
l system boot flow without secure boot.=20
-
-Tests results
--------------
-
-As a reference for the end user, reports for various tests for `Corstone=
-1000 software (CORSTONE1000-2024.06) <https://git.yoctoproject.org/meta-=
arm/tag/?h=3DCORSTONE1000-2024.06>`__
-can be found `here <https://gitlab.arm.com/arm-reference-solutions/arm-r=
eference-solutions-test-report/-/tree/master/embedded-a/corstone1000>`__.
+The above commands will delete the Platform key (PK) and allow the norma=
l system boot flow without SB.
=20
=20
 Testing the External System
@@ -1420,18 +1458,11 @@ The external system can be switched on/off on dem=
and with the following commands
=20
   echo start > /sys/class/remoteproc/remoteproc0/state
=20
+Tests results
+-------------
=20
-Using FVP on Windows or AArch64 Linux
--------------------------------------
-
-The user should follow the build instructions in this document to build =
on a Linux host machine.
-Then, copy the output binaries to the Windows or Aarch64 Linux machine w=
here the FVP is located.
-Then, launch the FVP binary.
-
-Security Issue Reporting
-------------------------
-
-To report any security issues identified with Corstone-1000, please send=
 an email to psirt@arm.com.
+As a reference for the end user, reports for various tests for `Corstone=
-1000 software (CORSTONE1000-2024.06) <https://git.yoctoproject.org/meta-=
arm/tag/?h=3DCORSTONE1000-2024.06>`__
+can be found `here <https://gitlab.arm.com/arm-reference-solutions/arm-r=
eference-solutions-test-report/-/tree/CORSTONE1000-2024.06/embedded-a/cor=
stone1000/CORSTONE1000-2024.06?ref_type=3Dtags>`__.
=20
 --------------
=20
--=20
2.25.1


