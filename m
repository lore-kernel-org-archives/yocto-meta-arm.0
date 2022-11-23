Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEDC4C4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 13:28:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19886.1669210111999049986
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Nov 2022 05:28:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0692C1FB;
	Wed, 23 Nov 2022 05:28:38 -0800 (PST)
Received: from e126835.arm.com (unknown [10.57.38.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ECAF03F73D;
	Wed, 23 Nov 2022 05:28:29 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH 2/2] arm-bsp/documentation: corstone1000: update the user guide
Date: Wed, 23 Nov 2022 13:28:15 +0000
Message-Id: <20221123132815.555983-3-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221123132815.555983-1-emekcan.aras@arm.com>
References: <20221123132815.555983-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Nov 2022 13:28:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4157

From: Emekcan Aras <Emekcan.Aras@arm.com>

Aligning the user guide with the latest Corstone1000 SW updates.

Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
---
 .../documentation/corstone1000/change-log.rst |  2 +-
 .../corstone1000/release-notes.rst            | 22 ++++-
 .../documentation/corstone1000/user-guide.rst | 82 ++++++++++++-------
 3 files changed, 75 insertions(+), 31 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/change-log.rst b/met=
a-arm-bsp/documentation/corstone1000/change-log.rst
index 7cdcd28d..64e82aac 100644
--- a/meta-arm-bsp/documentation/corstone1000/change-log.rst
+++ b/meta-arm-bsp/documentation/corstone1000/change-log.rst
@@ -11,7 +11,7 @@ This document contains a summary of the new features, c=
hanges and
 fixes in each release of Corstone-1000 software stack.
=20
 ******************
-Version 2022.11.10
+Version 2022.11.23
 ******************
=20
 Changes
diff --git a/meta-arm-bsp/documentation/corstone1000/release-notes.rst b/=
meta-arm-bsp/documentation/corstone1000/release-notes.rst
index f657c26b..89a4fa9a 100644
--- a/meta-arm-bsp/documentation/corstone1000/release-notes.rst
+++ b/meta-arm-bsp/documentation/corstone1000/release-notes.rst
@@ -7,8 +7,21 @@
 Release notes
 #############
=20
+
+*************************
+Disclaimer
+*************************
+
+You expressly assume all liabilities and risks relating to your use or o=
peration
+of Your Software and Your Hardware designed or modified using the Arm To=
ols,
+including without limitation, Your software or Your Hardware designed or
+intended for safety-critical applications. Should Your Software or Your =
Hardware
+prove defective, you assume the entire cost of all necessary servicing, =
repair
+or correction.
+
+
 **************************
-Release notes - 2022.11.10
+Release notes - 2022.11.23
 **************************
=20
 Known Issues or Limitations
@@ -18,10 +31,13 @@ Known Issues or Limitations
  - Due to the performance uplimit of MPS3 FPGA and FVP, some Linux distr=
os like Fedora Rawhide can not boot on Corstone-1000 (i.e. user may exper=
ience timeouts or boot hang).
  - Below SCT FAILURE is a known issues in the FVP:
    UEFI Compliant - Boot from network protocols must be implemented -- F=
AILURE
+ - Below SCT FAILURE is a known issue when a terminal emulator (in the s=
ystem where the user connects to serial ports) does not support 80x25 or =
80x50 mode:
+   EFI_SIMPLE_TEXT_OUT_PROTOCOL.SetMode - SetMode() with valid mode -- F=
AILURE
  - Known limitations regarding ACS tests: The behavior after running ACS=
 tests on FVP is not consistent.  Both behaviors are expected and are val=
id;
    The system might boot till the Linux prompt. Or, the system might wai=
t after finishing the ACS tests.
    In both cases, the system executes the entire test suite and writes t=
he results as stated in the user guide.
=20
+
 Platform Support
 -----------------
  - This software release is tested on Corstone-1000 FPGA version AN550_v=
1
@@ -152,7 +168,9 @@ Known Issues or Limitations
=20
 Support
 -------
-For support email: support-subsystem-iot@arm.com
+For technical support email: support-subsystem-iot@arm.com
+
+For all security issues, contact Arm by email at arm-security@arm.com.
=20
 --------------
=20
diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index a6350bb8..e173f244 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -18,9 +18,7 @@ for more information.
=20
 Prerequisites
 -------------
-These instructions assume your host PC is running Ubuntu Linux 18.04 or =
20.04 LTS, with
-at least 32GB of free disk space and 16GB of RAM as minimum requirement.=
 The
-following instructions expect that you are using a bash shell.
+These instructions assume your host PC is running Ubuntu Linux 18.04 or =
20.04 LTS, with at least 32GB of free disk space and 16GB of RAM as minim=
um requirement. The following instructions expect that you are using a ba=
sh shell. All the paths stated in this document are absolute paths.
=20
 The following prerequisites must be available on the host system. To res=
olve these dependencies, run:
=20
@@ -146,11 +144,13 @@ commands to build the stack. To install kas tool, r=
un:
=20
     pip3 install kas
=20
+If 'kas' command is not found in command-line, please make sure the user=
 installation directories are visible on $PATH. If you have sudo rights, =
try 'sudo pip3 install kas'.=20
+
 In the top directory of the workspace ``<_workspace>``, run:
=20
 ::
=20
-    git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1000-=
2022.11.10
+    git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1000-=
2022.11.23
=20
 To build a Corstone-1000 image for MPS3 FPGA, run:
=20
@@ -215,9 +215,10 @@ The directory structure of the FPGA bundle is shown =
below.
     =E2=94=94=E2=94=80=E2=94=80 config.txt
=20
 Depending upon the MPS3 board version (printed on the MPS3 board) you sh=
ould update the images.txt file
-(in corresponding HBI0309x folder) so that the file points to the images=
 under SOFTWARE directory.
+(in corresponding HBI0309x folder. Boardfiles/MB/HBI0309<board_revision>=
/AN550/images.txt) so that the file points to the images under SOFTWARE d=
irectory.
=20
-Here is an example
+The images.txt file that is compatible with the latest version of the so=
ftware
+stack can be seen below;
=20
 ::
=20
@@ -289,6 +290,9 @@ logs on the serial port terminals. Once the HOST(Cort=
ex-A35) is
 booted completely, user can login to the shell using
 **"root"** login.
=20
+If system does not boot and only the ttyUSB1 logs are visible, please fo=
llow the steps in `Clean Secure Flash Before Testing (applicable to FPGA =
only)`_ under `SystemReady-IR tests`_ section. The previous image used in=
 FPGA (MPS3) might have filled the Secure Flash completely. The best prac=
tice is to clean the secure flash in this case.
+
+
 Running the software on FVP
 ---------------------------
=20
@@ -299,8 +303,11 @@ A Yocto recipe is provided and allows to download th=
e latest supported FVP versi
=20
 The recipe is located at <_workspace>/meta-arm/meta-arm/recipes-devtools=
/fvp/fvp-corstone1000.bb
=20
-The latest supported Fixed Virtual Platform (FVP) version is 11.19_21 an=
d is automatically downloaded
-and installed when using the runfvp command as detailed below.
+The latest supported Fixed Virtual Platform (FVP) version is 11.19_21 an=
d is automatically downloaded and installed when using the runfvp command=
 as detailed below. The FVP version can be checked by running the followi=
ng command:
+
+::
+
+<_workspace>/meta-arm/scripts/runfvp <_workspace>/build/tmp/deploy/image=
s/corstone1000-fvp/corstone1000-image-corstone1000-fvp.fvpconf -- --versi=
on
=20
 The FVP can also be manually downloaded from the `Arm Ecosystem FVPs`_ p=
age. On this page, navigate
 to "Corstone IoT FVPs" section to download the Corstone-1000 platform FV=
P installer.  Follow the
@@ -361,8 +368,8 @@ boot. Run following commands to build such image.
 ::
=20
   cd <_workspace>
-  git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1000-20=
22.11.10
-  git clone https://git.gitlab.arm.com/arm-reference-solutions/systemrea=
dy-patch.git
+  git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1000-20=
22.11.23
+  git clone https://git.gitlab.arm.com/arm-reference-solutions/systemrea=
dy-patch.git -b CORSTONE1000-2022.11.23
   cp -f systemready-patch/embedded-a/corstone1000/erase_flash/0001-arm-b=
sp-trusted-firmware-m-corstone1000-Clean-Secure.patch meta-arm
   cd meta-arm
   git apply 0001-arm-bsp-trusted-firmware-m-corstone1000-Clean-Secure.pa=
tch
@@ -374,7 +381,8 @@ Replace the bl1.bin and cs1000.bin files on the SD ca=
rd with following files:
   - The flash image: <_workspace>/build/tmp/deploy/images/corstone1000-m=
ps3/corstone1000-image-corstone1000-mps3.wic.nopt
=20
 Now reboot the board. This step erases the Corstone-1000 SecureEnclave f=
lash
-completely, the user should expect following message from TF-M log:
+completely, the user should expect following message from TF-M log (can =
be seen
+in ttyUSB1):
=20
 ::
=20
@@ -388,7 +396,7 @@ software stack and flash the FPGA as normal. And cont=
inue the testing.
 Run SystemReady-IR ACS tests
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
=20
-ACS image contains two partitions. BOOT partition and RESULTS partition.
+ACS image contains two partitions. BOOT partition and RESULT partition.
 Following packages are under BOOT partition
=20
  * SCT
@@ -398,8 +406,8 @@ Following packages are under BOOT partition
  * grub
  * uefi manual capsule application
=20
-RESULTS partition is used to store the test results.
-PLEASE MAKE SURE THAT THE RESULTS PARTITION IS EMPTY BEFORE YOU START TH=
E TESTING. OTHERWISE THE TEST RESULTS
+RESULT partition is used to store the test results.
+PLEASE MAKE SURE THAT THE RESULT PARTITION IS EMPTY BEFORE YOU START THE=
 TESTING. OTHERWISE THE TEST RESULTS
 WILL NOT BE CONSISTENT
=20
 FPGA instructions for ACS image
@@ -441,6 +449,8 @@ Once the USB stick with ACS image is prepared, the us=
er should make sure that
 ensure that only the USB stick with the ACS image is connected to the bo=
ard,
 and then boot the board.
=20
+The FPGA will reset multiple times during the test, and it might take ap=
prox. 24-36 hours to finish the test. At the end of test, the FPGA host t=
erminal will halt showing a shell prompt. Once test is finished the resul=
t can be copied following above instructions.
+
 FVP instructions for ACS image and run
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
@@ -456,7 +466,7 @@ SD card.
=20
   tmux
=20
-  <_workspace>/meta-arm/scripts/runfvp <_workspace>/build/tmp/deploy/ima=
ges/corstone1000-fvp/corstone1000-image-corstone1000-fvp.fvpconf =E2=80=93=
 -C board.msd_mmc.p_mmc_file=3D"${<path-to-img>/ir_acs_live_image.img}"
+  <_workspace>/meta-arm/scripts/runfvp <_workspace>/build/tmp/deploy/ima=
ges/corstone1000-fvp/corstone1000-image-corstone1000-fvp.fvpconf -- -C bo=
ard.msd_mmc.p_mmc_file=3D"${<path-to-img>/ir_acs_live_image.img}"
=20
 The test results can be fetched using following commands:
=20
@@ -488,7 +498,7 @@ automatically in the following sequence:
  - FWTS
  - BSA Linux
=20
-The results can be fetched from the ``acs_results`` partition of the USB=
 stick (FPGA) / SD Card (FVP).
+The results can be fetched from the ``acs_results`` folder in the RESULT=
 partition of the USB stick (FPGA) / SD Card (FVP).
=20
 #####################################################
=20
@@ -757,11 +767,29 @@ In the Linux command-line run the following:
 Negative scenario
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-In the negative case scenario, the user should see appropriate logs in
-the secure enclave terminal. If capsule pass initial verification, but f=
ails
-verifications performed during boot time, secure enclave will try new im=
ages
-predetermined number of times (defined in the code), before reverting ba=
ck to
-the previous good bank.
+In the negative case scenario (rollback the capsule version), the user s=
hould=20
+see appropriate logs in the secure enclave terminal.=20
+
+::
+
+  ... =20
+    uefi_capsule_retrieve_images: image 0 at 0xa0000070, size=3D15654928
+    uefi_capsule_retrieve_images: exit
+    flash_full_capsule: enter: image =3D 0x0xa0000070, size =3D 15654928=
, version =3D 10
+    ERROR: flash_full_capsule: version error
+    private_metadata_write: enter: boot_index =3D 1
+    private_metadata_write: success
+    fmp_set_image_info:133 Enter
+    FMP image update: image id =3D 0
+    FMP image update: status =3D 1version=3D11 last_attempt_version=3D10=
.
+    fmp_set_image_info:157 Exit.
+    corstone1000_fwu_flash_image: exit: ret =3D -1
+  ...
+
+
+If capsule pass initial verification, but fails verifications performed =
during=20
+boot time, secure enclave will try new images predetermined number of ti=
mes=20
+(defined in the code), before reverting back to the previous good bank.
=20
 ::
=20
@@ -803,7 +831,7 @@ Linux distros tests
 Debian/OpenSUSE install and boot (applicable to FPGA only)
 ************************************************************************=
***************
=20
-To test Linux distro install and boot, the user should prepare two empty=
 USB sticks.
+To test Linux distro install and boot, the user should prepare two empty=
 USB sticks (minimum size should be 4GB and formatted with FAT32).
=20
 Download one of following Linux distro images:
  - Debian installer image: https://cdimage.debian.org/cdimage/weekly-bui=
lds/arm64/iso-dvd/
@@ -819,7 +847,7 @@ file into the first USB stick, run:
=20
 ::
=20
-  sudo dd if=3D</path/to/iso_file> of=3D/dev/sdb iflag=3Ddirect oflag=3D=
direct status=3Dprogress bs=3D1M; sync;
+  sudo dd if=3D<path-to-iso_file> of=3D/dev/sdb iflag=3Ddirect oflag=3Dd=
irect status=3Dprogress bs=3D1M; sync;
=20
 Boot the MSP3 board with the first USB stick connected. Open following m=
inicom sessions:
=20
@@ -828,9 +856,7 @@ Boot the MSP3 board with the first USB stick connecte=
d. Open following minicom s
   sudo picocom -b 115200 /dev/ttyUSB0  # in one terminal
   sudo picocom -b 115200 /dev/ttyUSB2  # in another terminal.
=20
-Press <Ctrl+x>.
-
-Now plug in the second USB stick, the distro installation process will s=
tart.
+Now plug in the second USB stick (once installation screen is visible), =
the distro installation process will start. The installation prompt can b=
e seen in ttyUSB2. If installer does not start, please try to reboot the =
board with both USB sticks connected and repeat the process.
=20
 **NOTE:** Due to the performance limitation of Corstone-1000 MPS3 FPGA, =
the
 distro installation process can take up to 24 hours to complete.
@@ -922,7 +948,7 @@ First, load FF-A TEE kernel module:
=20
 ::
=20
-  insmod /lib/modules/5.19.9-yocto-standard/extra/arm-ffa-tee.ko
+  insmod /lib/modules/5.19.14-yocto-standard/extra/arm-ffa-tee.ko
=20
 Then, check whether the FF-A TEE driver is loaded correctly by using the=
 following command:
=20
@@ -1034,7 +1060,7 @@ The output on the Host terminal should be:
 Tests results
 -----------------------------------
=20
-As a reference for the end user, reports for various tests for `Corstone=
-1000 software (CORSTONE1000-2022.11.10) <https://git.yoctoproject.org/me=
ta-arm/tag/?h=3DCORSTONE1000-2022.11.10>`__
+As a reference for the end user, reports for various tests for `Corstone=
-1000 software (CORSTONE1000-2022.11.23) <https://git.yoctoproject.org/me=
ta-arm/tag/?h=3DCORSTONE1000-2022.11.23>`__
 can be found in `here <https://gitlab.arm.com/arm-reference-solutions/ar=
m-reference-solutions-test-report/-/tree/master/embedded-a/corstone1000>`=
__.
=20
 Running the software on FVP on Windows
--=20
2.25.1


