Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F89C43217
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 15:45:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9137.1668095126269206820
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Nov 2022 07:45:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F60A1FB;
	Thu, 10 Nov 2022 07:45:32 -0800 (PST)
Received: from e121910.cambridge.arm.com (e121910.cambridge.arm.com [10.1.32.125])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72B253F703;
	Thu, 10 Nov 2022 07:45:24 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 1/3] arm-bsp/documentation: corstone1000: 2022.11.10 RC: update the user guide
Date: Thu, 10 Nov 2022 15:45:05 +0000
Message-Id: <20221110154507.23779-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221110154507.23779-1-abdellatif.elkhlifi@arm.com>
References: <20221110154507.23779-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 10 Nov 2022 15:45:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4119

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Aligning the user guide with the latest Corstone1000 SW updates.

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../documentation/corstone1000/user-guide.rst | 641 ++++++++++++++----
 1 file changed, 504 insertions(+), 137 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index d5930fc8..a6350bb8 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -9,9 +9,9 @@ User Guide
=20
 Notice
 ------
-The corstone1000 software stack uses the `Yocto Project <https://www.yoc=
toproject.org/>`__ to build
-a tiny Linux distribution suitable for the corstone1000 platform. The Yo=
cto Project relies on the
-`Bitbake <https://docs.yoctoproject.org/bitbake.html#bitbake-documentati=
on>`__
+The Corstone-1000 software stack uses the `Yocto Project <https://www.yo=
ctoproject.org/>`__ to build
+a tiny Linux distribution suitable for the Corstone-1000 platform (kerne=
l and initramfs filesystem less than 5 MB on the flash).
+The Yocto Project relies on the `Bitbake <https://docs.yoctoproject.org/=
bitbake.html#bitbake-documentation>`__
 tool as its build tool. Please see `Yocto Project documentation <https:/=
/docs.yoctoproject.org/>`__
 for more information.
=20
@@ -35,12 +35,12 @@ The following prerequisites must be available on the =
host system. To resolve the
=20
 Provided components
 -------------------
-Within the Yocto Project, each component included in the corstone1000 so=
ftware stack is specified as
-a `bitbake recipe <https://www.yoctoproject.org/docs/1.6/bitbake-user-ma=
nual/bitbake-user-manual.html#recipes>`__.
-The recipes specific to the corstone1000 BSP are located at:
+Within the Yocto Project, each component included in the Corstone-1000 s=
oftware stack is specified as
+a `bitbake recipe <https://docs.yoctoproject.org/bitbake/2.2/bitbake-use=
r-manual/bitbake-user-manual-intro.html#recipes>`__.
+The recipes specific to the Corstone-1000 BSP are located at:
 ``<_workspace>/meta-arm/meta-arm-bsp/``.
=20
-The Yocto machine config files for the corstone1000 FVP and FPGA are:
+The Yocto machine config files for the Corstone-1000 FVP and FPGA target=
s are:
=20
  - ``<_workspace>/meta-arm/meta-arm-bsp/conf/machine/include/corstone100=
0.inc``
  - ``<_workspace>/meta-arm/meta-arm-bsp/conf/machine/corstone1000-fvp.co=
nf``
@@ -86,7 +86,7 @@ The distro is based on the `poky-tiny <https://wiki.yoc=
toproject.org/wiki/Poky-T
 distribution which is a Linux distribution stripped down to a minimal co=
nfiguration.
=20
 The provided distribution is based on busybox and built using muslibc. T=
he
-recipe responsible for building a tiny version of linux is listed below.
+recipe responsible for building a tiny version of Linux is listed below.
=20
 +-----------+-----------------------------------------------------------=
-----------------------------------+
 | bbappend  | <_workspace>/meta-arm/meta-arm-bsp/recipes-kernel/linux/li=
nux-yocto_%.bbappend               |
@@ -96,6 +96,16 @@ recipe responsible for building a tiny version of linu=
x is listed below.
 | defconfig | <_workspace>/meta-arm/meta-arm-bsp/recipes-kernel/linux/fi=
les/corstone1000/defconfig         |
 +-----------+-----------------------------------------------------------=
-----------------------------------+
=20
+External System Tests
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Based on `Corstone-1000/applications <https://git.gitlab.arm.com/arm-ref=
erence-solutions/corstone1000/applications>`__
+
++------------+----------------------------------------------------------=
-------------------------------------------------------------------------=
------------------------------------------------------------------+
+| Recipe     | <_workspace>/meta-arm/meta-arm-bsp/recipes-test/corstone1=
000-external-sys-tests/corstone1000-external-sys-tests_1.0.bb            =
                                                                  |
++------------+----------------------------------------------------------=
-------------------------------------------------------------------------=
------------------------------------------------------------------+
+
+The recipe provides the systems-comms-tests command run in Linux and use=
d for testing the External System.
+
 **************************************************
 Software for Boot Processor (a.k.a Secure Enclave)
 **************************************************
@@ -107,6 +117,18 @@ Based on `Trusted Firmware-M <https://git.trustedfir=
mware.org/TF-M/trusted-firmw
 | Recipe   | <_workspace>/meta-arm/meta-arm/recipes-bsp/trusted-firmware=
-m/trusted-firmware-m_1.6.0.bb       |
 +----------+------------------------------------------------------------=
-------------------------------------+
=20
+**************************************************
+Software for the External System
+**************************************************
+
+RTX
+=3D=3D=3D=3D
+Based on `RTX RTOS <https://git.gitlab.arm.com/arm-reference-solutions/c=
orstone1000/external_system/rtx>`__
+
++----------+------------------------------------------------------------=
-------------------------------------------------------------------------=
------------------+
+| Recipe   | <_workspace>/meta-arm/meta-arm-bsp/recipes-bsp/external-sys=
tem/external-system_0.1.0.bb                                             =
                  |
++----------+------------------------------------------------------------=
-------------------------------------------------------------------------=
------------------+
+
 Building the software stack
 ---------------------------
 Create a new folder that will be your workspace and will henceforth be r=
eferred
@@ -117,7 +139,7 @@ to as ``<_workspace>`` in these instructions. To crea=
te the folder, run:
     mkdir <_workspace>
     cd <_workspace>
=20
-corstone1000 is a Bitbake based Yocto Project which uses kas and bitbake
+Corstone-1000 software is based on the Yocto Project which uses kas and =
bitbake
 commands to build the stack. To install kas tool, run:
=20
 ::
@@ -128,15 +150,15 @@ In the top directory of the workspace ``<_workspace=
>``, run:
=20
 ::
=20
-    git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1000-=
2022.04.07
+    git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1000-=
2022.11.10
=20
-To build corstone1000 image for MPS3 FPGA, run:
+To build a Corstone-1000 image for MPS3 FPGA, run:
=20
 ::
=20
     kas build meta-arm/kas/corstone1000-mps3.yml
=20
-Alternatively, to build corstone1000 image for FVP, run:
+Alternatively, to build a Corstone-1000 image for FVP, run:
=20
 ::
=20
@@ -150,22 +172,19 @@ Once the build is successful, all output binaries w=
ill be placed in the followin
  - ``<_workspace>/build/tmp/deploy/images/corstone1000-fvp/`` folder for=
 FVP build;
  - ``<_workspace>/build/tmp/deploy/images/corstone1000-mps3/`` folder fo=
r FPGA build.
=20
-Everything apart from the ROM firmware is bundled into a single binary, =
the
-``corstone1000-image-corstone1000-{mps3,fvp}.wic.nopt`` file. The ROM fi=
rmware is the
-``bl1.bin`` file.
-
-The output binaries used by FVP are the following:
- - The ROM firmware: ``<_workspace>/build/tmp/deploy/images/corstone1000=
-fvp/bl1.bin``
- - The flash image: ``<_workspace>/build/tmp/deploy/images/corstone1000-=
fvp/corstone1000-image-corstone1000-fvp.wic.nopt``
+Everything apart from the Secure Enclave ROM firmware and External Syste=
m firmware, is bundled into a single binary, the
+``corstone1000-image-corstone1000-{mps3,fvp}.wic.nopt`` file.
=20
-The output binaries used by FPGA are the following:
- - The ROM firmware: ``<_workspace>/build/tmp/deploy/images/corstone1000=
-mps3/bl1.bin``
- - The flash image: ``<_workspace>/build/tmp/deploy/images/corstone1000-=
mps3/corstone1000-image-corstone1000-mps3.wic.nopt``
+The output binaries run in the Corstone-1000 platform are the following:
+ - The Secure Enclave ROM firmware: ``<_workspace>/build/tmp/deploy/imag=
es/corstone1000-{mps3,fvp}/bl1.bin``
+ - The External System firmware: ``<_workspace>/build/tmp/deploy/images/=
corstone1000-{mps3,fvp}/es_flashfw.bin``
+ - The flash image: ``<_workspace>/build/tmp/deploy/images/corstone1000-=
{mps3,fvp}/corstone1000-image-corstone1000-{mps3,fvp}.wic.nopt``
=20
 Flash the firmware image on FPGA
 --------------------------------
=20
-The user should download the FPGA bit file image from `this link <https:=
//developer.arm.com/tools-and-software/development-boards/fpga-prototypin=
g-boards/download-fpga-images>`__
+The user should download the FPGA bit file image ``AN550:  Arm=C2=AE Cor=
stone=E2=84=A2-1000 for MPS3 Version 1``
+from `this link <https://developer.arm.com/tools-and-software/developmen=
t-boards/fpga-prototyping-boards/download-fpga-images>`__
 and under the section ``Arm=C2=AE Corstone=E2=84=A2-1000 for MPS3``.
=20
 The directory structure of the FPGA bundle is shown below.
@@ -214,24 +233,32 @@ Here is an example
   ;************************************************
=20
   [IMAGES]
-  TOTALIMAGES: 2      ;Number of Images (Max: 32)
-
+  TOTALIMAGES: 3      ;Number of Images (Max: 32)
+  =20
   IMAGE0PORT: 1
   IMAGE0ADDRESS: 0x00_0000_0000
   IMAGE0UPDATE: RAM
   IMAGE0FILE: \SOFTWARE\bl1.bin
-
+  =20
   IMAGE1PORT: 0
-  IMAGE1ADDRESS: 0x00_00010_0000
+  IMAGE1ADDRESS: 0x00_0010_0000
   IMAGE1UPDATE: AUTOQSPI
   IMAGE1FILE: \SOFTWARE\cs1000.bin
+  =20
+  IMAGE2PORT: 2
+  IMAGE2ADDRESS: 0x00_0000_0000
+  IMAGE2UPDATE: RAM
+  IMAGE2FILE: \SOFTWARE\es0.bin
=20
 OUTPUT_DIR =3D ``<_workspace>/build/tmp/deploy/images/corstone1000-mps3`=
`
=20
 1. Copy ``bl1.bin`` from OUTPUT_DIR directory to SOFTWARE directory of t=
he FPGA bundle.
-2. Copy ``corstone1000-image-corstone1000-mps3.wic.nopt`` from OUTPUT_DI=
R directory to SOFTWARE
-   directory of the FPGA bundle and rename the wic image to ``cs1000.bin=
``.
+2. Copy ``es_flashfw.bin`` from OUTPUT_DIR directory to SOFTWARE directo=
ry of the FPGA bundle
+   and rename the binary to ``es0.bin``.
+3. Copy ``corstone1000-image-corstone1000-mps3.wic.nopt`` from OUTPUT_DI=
R directory to SOFTWARE
+   directory of the FPGA bundle and rename the wic.nopt image to ``cs100=
0.bin``.
=20
+  =20
 **NOTE:** Renaming of the images are required because MCC firmware has
 limitation of 8 characters before .(dot) and 3 characters after .(dot).
=20
@@ -240,41 +267,54 @@ Now, copy the entire folder to board's SDCard and r=
eboot the board.
 Running the software on FPGA
 ----------------------------
=20
-On the host machine, open 3 minicom sessions. In case of Linux machine i=
t will
-be ttyUSB0, ttyUSB1, ttyUSB2 and it might be different on Window machine=
.
+On the host machine, open 4 serial port terminals. In case of Linux mach=
ine it will
+be ttyUSB0, ttyUSB1, ttyUSB2, ttyUSB3 and it might be different on Windo=
ws machines.
=20
   - ttyUSB0 for MCC, OP-TEE and Secure Partition
   - ttyUSB1 for Boot Processor (Cortex-M0+)
   - ttyUSB2 for Host Processor (Cortex-A35)
+  - ttyUSB3 for External System Processor (Cortex-M3)=20
=20
-Run following commands to open minicom sessions on Linux:
+Run following commands to open serial port terminals on Linux:
=20
 ::
=20
   sudo picocom -b 115200 /dev/ttyUSB0  # in one terminal
   sudo picocom -b 115200 /dev/ttyUSB1  # in another terminal
   sudo picocom -b 115200 /dev/ttyUSB2  # in another terminal.
+  sudo picocom -b 115200 /dev/ttyUSB3  # in another terminal.
=20
 Once the system boot is completed, you should see console
-logs on the minicom sessions. Once the HOST(Cortex-A35) is
+logs on the serial port terminals. Once the HOST(Cortex-A35) is
 booted completely, user can login to the shell using
 **"root"** login.
=20
 Running the software on FVP
 ---------------------------
-An FVP (Fixed Virtual Platform) of the corstone1000 platform must be ava=
ilable to execute the
-included run script.
=20
-The Fixed Virtual Platform (FVP) version 11.17_23 can be downloaded from=
 the
-`Arm Ecosystem FVPs`_ page. On this page, navigate to "Corstone IoT FVPs=
"
-section to download the Corstone1000 platform FVP installer.  Follow the
+An FVP (Fixed Virtual Platform) model of the Corstone-1000 platform must=
 be available to run the
+Corstone-1000 FVP software image.
+
+A Yocto recipe is provided and allows to download the latest supported F=
VP version.
+
+The recipe is located at <_workspace>/meta-arm/meta-arm/recipes-devtools=
/fvp/fvp-corstone1000.bb
+
+The latest supported Fixed Virtual Platform (FVP) version is 11.19_21 an=
d is automatically downloaded
+and installed when using the runfvp command as detailed below.
+
+The FVP can also be manually downloaded from the `Arm Ecosystem FVPs`_ p=
age. On this page, navigate
+to "Corstone IoT FVPs" section to download the Corstone-1000 platform FV=
P installer.  Follow the
 instructions of the installer and setup the FVP.
=20
+To run the FVP using the runfvp command, please run the following comman=
d:
+
+::
+
 <_workspace>/meta-arm/scripts/runfvp --terminals=3Dxterm <_workspace>/bu=
ild/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000-fv=
p.fvpconf
=20
 When the script is executed, three terminal instances will be launched, =
one for the boot processor
 (aka Secure Enclave) processing element and two for the Host processing =
element. Once the FVP is
-executing, the Boot Processor will start to boot, wherein the relevant m=
emory contents of the .wic
+executing, the Boot Processor will start to boot, wherein the relevant m=
emory contents of the .wic.nopt
 file are copied to their respective memory locations within the model, e=
nforce firewall policies
 on memories and peripherals and then, bring the host out of reset.
=20
@@ -282,13 +322,20 @@ The host will boot trusted-firmware-a, OP-TEE, U-Bo=
ot and then Linux, and presen
 (FVP host_terminal_0):
=20
 ::
+
     corstone1000-fvp login:
=20
 Login using the username root.
=20
-Running test applications
+The External System can be released out of reset on demand using the sys=
tems-comms-tests command.
+
+SystemReady-IR tests
 -------------------------
=20
+*********************
+Testing steps
+*********************
+
 **NOTE**: Running the SystemReady-IR tests described below requires the =
user to
 work with USB sticks. In our testing, not all USB stick models work well=
 with
 MPS3 FPGA. Here are the USB sticks models that are stable in our test
@@ -305,7 +352,8 @@ erase the SecureEnclave flash cleanly and prepare a c=
lean board environment for
 the testing.
=20
 Clean Secure Flash Before Testing (applicable to FPGA only)
------------------------------------------------------------
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
 To prepare a clean board environment with clean secure flash for the tes=
ting,
 the user should prepare an image that erases the secure flash cleanly du=
ring
 boot. Run following commands to build such image.
@@ -313,7 +361,7 @@ boot. Run following commands to build such image.
 ::
=20
   cd <_workspace>
-  git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1000-20=
22.02.18
+  git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1000-20=
22.11.10
   git clone https://git.gitlab.arm.com/arm-reference-solutions/systemrea=
dy-patch.git
   cp -f systemready-patch/embedded-a/corstone1000/erase_flash/0001-arm-b=
sp-trusted-firmware-m-corstone1000-Clean-Secure.patch meta-arm
   cd meta-arm
@@ -325,7 +373,7 @@ Replace the bl1.bin and cs1000.bin files on the SD ca=
rd with following files:
   - The ROM firmware: <_workspace>/build/tmp/deploy/images/corstone1000-=
mps3/bl1.bin
   - The flash image: <_workspace>/build/tmp/deploy/images/corstone1000-m=
ps3/corstone1000-image-corstone1000-mps3.wic.nopt
=20
-Now reboot the board. This step erases the Corstone1000 SecureEnclave fl=
ash
+Now reboot the board. This step erases the Corstone-1000 SecureEnclave f=
lash
 completely, the user should expect following message from TF-M log:
=20
 ::
@@ -338,7 +386,7 @@ Then the user should follow "Building the software st=
ack" to build a clean
 software stack and flash the FPGA as normal. And continue the testing.
=20
 Run SystemReady-IR ACS tests
------------------------------
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
=20
 ACS image contains two partitions. BOOT partition and RESULTS partition.
 Following packages are under BOOT partition
@@ -355,10 +403,10 @@ PLEASE MAKE SURE THAT THE RESULTS PARTITION IS EMPT=
Y BEFORE YOU START THE TESTIN
 WILL NOT BE CONSISTENT
=20
 FPGA instructions for ACS image
--------------------------------
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
=20
 This section describes how the user can build and run Architecture Compl=
iance
-Suite (ACS) tests on Corstone1000.
+Suite (ACS) tests on Corstone-1000.
=20
 First, the user should download the `Arm SystemReady ACS repository <htt=
ps://github.com/ARM-software/arm-systemready/>`__.
 This repository contains the infrastructure to build the Architecture
@@ -374,8 +422,8 @@ Once the repository is successfully downloaded, the p=
rebuilt ACS live image can
  - ``<_workspace>/arm-systemready/IR/prebuilt_images/v21.07_0.9_BETA/ir_=
acs_live_image.img.xz``
=20
 **NOTE**: This prebuilt ACS image includes v5.13 kernel, which doesn't p=
rovide
-USB driver support for Corstone1000. The ACS image with newer kernel ver=
sion
-and with full USB support for Corstone1000 will be available in the next
+USB driver support for Corstone-1000. The ACS image with newer kernel ve=
rsion
+and with full USB support for Corstone-1000 will be available in the nex=
t
 SystemReady release in this repository.
=20
 Then, the user should prepare a USB stick with ACS image. In the given e=
xample here,
@@ -385,7 +433,7 @@ USB drive. Run the following commands to prepare the =
ACS image in USB stick:
=20
 ::
=20
-  cd <_workspace>/arm-systemready/IR/scripts/output/
+  cd <_workspace>/arm-systemready/IR/prebuilt_images/v21.07_0.9_BETA
   unxz ir_acs_live_image.img.xz
   sudo dd if=3Dir_acs_live_image.img of=3D/dev/sdb iflag=3Ddirect oflag=3D=
direct bs=3D1M status=3Dprogress; sync
=20
@@ -394,19 +442,21 @@ ensure that only the USB stick with the ACS image i=
s connected to the board,
 and then boot the board.
=20
 FVP instructions for ACS image and run
----------------------------------------
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-Download acs image from:
+Download ACS image from:
  - ``https://gitlab.arm.com/systemready/acs/arm-systemready/-/tree/linux=
-5.17-rc7/IR/prebuilt_images/v22.04_1.0-Linux-v5.17-rc7``
=20
-Use the below command to run the FVP with acs image support in the
+Use the below command to run the FVP with ACS image support in the
 SD card.
=20
 ::
=20
   unxz ${<path-to-img>/ir_acs_live_image.img.xz}
=20
-<_workspace>/meta-arm/scripts/runfvp --terminals=3Dxterm <_workspace>/bu=
ild/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000-fv=
p.fvpconf -- -C board.msd_mmc.p_mmc_file=3D"${<path-to-img>/ir_acs_live_i=
mage.img}"=20
+  tmux
+
+  <_workspace>/meta-arm/scripts/runfvp <_workspace>/build/tmp/deploy/ima=
ges/corstone1000-fvp/corstone1000-image-corstone1000-fvp.fvpconf =E2=80=93=
 -C board.msd_mmc.p_mmc_file=3D"${<path-to-img>/ir_acs_live_image.img}"
=20
 The test results can be fetched using following commands:
=20
@@ -416,8 +466,8 @@ The test results can be fetched using following comma=
nds:
   sudo mount -o rw,offset=3D<offset_2nd_partition> <path-to-img>/ir_acs_=
live_image.img /mnt/test/
   fdisk -lu <path-to-img>/ir_acs_live_image.img
   ->  Device                                                     Start  =
   End Sectors  Size Type
-      /home/emeara01/Downloads/ir_acs_live_image_modified.img1    2048 1=
050622 1048575  512M Microsoft basic data
-      /home/emeara01/Downloads/ir_acs_live_image_modified.img2 1050624 1=
153022  102399   50M Microsoft basic data
+      <path-to-img>/ir_acs_live_image_modified.img1    2048 1050622 1048=
575  512M Microsoft basic data
+      <path-to-img>/ir_acs_live_image_modified.img2 1050624 1153022  102=
399   50M Microsoft basic data
=20
   ->   <offset_2nd_partition> =3D 1050624 * 512 (sector size) =3D 537919=
488
=20
@@ -427,7 +477,7 @@ Once test is finished, the FVP can be stoped, and res=
ult can be copied following
 instructions.
=20
 Common to FVP and FPGA
------------------------
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
=20
 U-Boot should be able to boot the grub bootloader from
 the 1st partition and if grub is not interrupted, tests are executed
@@ -440,81 +490,226 @@ automatically in the following sequence:
=20
 The results can be fetched from the ``acs_results`` partition of the USB=
 stick (FPGA) / SD Card (FVP).
=20
-Manual capsule update test
---------------------------
+#####################################################
+
+Manual capsule update and ESRT checks
+---------------------------------------------------------------------
=20
-The following steps describe running manual capsule update with the ``di=
rect``
-method.
+The following section describes running manual capsule update with the `=
`direct`` method.
=20
-Check the "Run SystemReady-IR ACS tests" section above to download and u=
npack the acs image file
+The steps described in this section perform manual capsule update and sh=
ow how to use the ESRT feature
+to retrieve the installed capsule details.
+
+For the following tests two capsules are needed to perform 2 capsule upd=
ates. A positive update and a negative update.
+
+A positive test case capsule which boots the platform correctly until th=
e Linux prompt, and a negative test case with an
+incorrect capsule (corrupted or outdated) which fails to boot to the hos=
t software.
+
+Check the "Run SystemReady-IR ACS tests" section above to download and u=
npack the ACS image file
  - ``ir_acs_live_image.img.xz``
=20
-Download edk2 and generate capsule file:
+Download edk2 under <_workspace> :
=20
 ::
=20
   git clone https://github.com/tianocore/edk2.git
-  edk2/BaseTools/BinWrappers/PosixLike/GenerateCapsule -e -o \
-    cs1k_cap --fw-version 1 --lsv 0 --guid \
-    e2bb9c06-70e9-4b14-97a3-5a7913176e3f --verbose --update-image-index =
\
-    0 --verbose <binary_file>
=20
-The <binary_file> here should be a corstone1000-image-corstone1000-fvp.w=
ic.nopt image for FVP and
-corstone1000-image-corstone1000-mps3.wic.nopt for FPGA. And this input b=
inary file
-(capsule) should be less than 15 MB.
+*********************
+Generating Capsules
+*********************
+
+The capsule binary size (wic.nopt file) should be less than 15 MB.
=20
 Based on the user's requirement, the user can change the firmware versio=
n
 number given to ``--fw-version`` option (the version number needs to be =
>=3D 1).
=20
-Capsule Copy instructions for FPGA
------------------------------------
+Generating FPGA Capsules
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+::
+
+   <_workspace>/edk2/BaseTools/BinWrappers/PosixLike/GenerateCapsule -e =
-o \
+   cs1k_cap_mps3_v5 --fw-version 5 --lsv 0 --guid \
+   e2bb9c06-70e9-4b14-97a3-5a7913176e3f --verbose --update-image-index \
+   0 --verbose <_workspace>/build/tmp/deploy/images/corstone1000-mps3/co=
rstone1000-image-corstone1000-mps3.wic.nopt
+
+::
+
+   <_workspace>/edk2/BaseTools/BinWrappers/PosixLike/GenerateCapsule -e =
-o \
+   cs1k_cap_mps3_v6 --fw-version 6 --lsv 0 --guid \
+   e2bb9c06-70e9-4b14-97a3-5a7913176e3f --verbose --update-image-index \
+   0 --verbose <_workspace>/build/tmp/deploy/images/corstone1000-mps3/co=
rstone1000-image-corstone1000-mps3.wic.nopt
+
+Generating FVP Capsules
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+::
+
+   <_workspace>/edk2/BaseTools/BinWrappers/PosixLike/GenerateCapsule -e =
-o \
+   cs1k_cap_fvp_v6 --fw-version 6 --lsv 0 --guid \
+   e2bb9c06-70e9-4b14-97a3-5a7913176e3f --verbose --update-image-index \
+   0 --verbose <_workspace>/build/tmp/deploy/images/corstone1000-fvp/cor=
stone1000-image-corstone1000-fvp.wic.nopt
+
+::
+
+   <_workspace>/edk2/BaseTools/BinWrappers/PosixLike/GenerateCapsule -e =
-o \
+   cs1k_cap_fvp_v5 --fw-version 5 --lsv 0 --guid \
+   e2bb9c06-70e9-4b14-97a3-5a7913176e3f --verbose --update-image-index \
+   0 --verbose <_workspace>/build/tmp/deploy/images/corstone1000-fvp/cor=
stone1000-image-corstone1000-fvp.wic.nopt
+
+*********************
+Copying Capsules
+*********************
+
+Copying the FPGA capsules
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
=20
 The user should prepare a USB stick as explained in ACS image section (s=
ee above).
-Place the generated ``cs1k_cap`` file in the root directory of the boot =
partition
+Place the generated ``cs1k_cap`` files in the root directory of the boot=
 partition
 in the USB stick. Note: As we are running the direct method, the ``cs1k_=
cap`` file
 should not be under the EFI/UpdateCapsule directory as this may or may n=
ot trigger
 the on disk method.
=20
-Capsule Copy instructions for FVP
----------------------------------
+::
+
+   sudo cp cs1k_cap_mps3_v6 <mounting path>/BOOT/
+   sudo cp cs1k_cap_mps3_v5 <mounting path>/BOOT/
+   sync
+
+Copying the FVP capsules
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-Run below commands to copy capsule into the
-image file and run FVP software.
+First, mount the IR image:
=20
 ::
=20
-  sudo mkdir /mnt/test
-  sudo mount -o rw,offset=3D<offset_1st_partition> <path-to-img>/ir_acs_=
live_image.img /mnt/test/
-  sudo cp cs1k_cap /mnt/test/
-  sudo umount /mnt/test
-  exit
+   sudo mkdir /mnt/test
+   sudo mount -o rw,offset=3D1048576 <path-to-img>/ir_acs_live_image.img=
  /mnt/test
+
+Then, copy the capsules:
+
+::
+
+   sudo cp cs1k_cap_fvp_v6 /mnt/test/
+   sudo cp cs1k_cap_fvp_v5 /mnt/test/
+   sync
+
+Then, unmount the IR image:
=20
-<_workspace>/meta-arm/scripts/runfvp --terminals=3Dxterm <_workspace>/bu=
ild/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000-fv=
p.fvpconf -- -C "board.msd_mmc.p_mmc_file ${<path-to-img>/ir_acs_live_ima=
ge.img}"=20
+::
+
+   sudo umount /mnt/test
+
+**NOTE:**
=20
 Size of first partition in the image file is calculated in the following=
 way. The data is
 just an example and might vary with different ir_acs_live_image.img file=
s.
=20
 ::
=20
-  fdisk -lu <path-to-img>/ir_acs_live_image.img
-  ->  Device                                                     Start  =
   End Sectors  Size Type
-      /home/emeara01/Downloads/ir_acs_live_image_modified.img1    2048 1=
050622 1048575  512M Microsoft basic data
-      /home/emeara01/Downloads/ir_acs_live_image_modified.img2 1050624 1=
153022  102399   50M Microsoft basic data
+   fdisk -lu <path-to-img>/ir_acs_live_image.img
+   ->  Device                                                     Start =
    End Sectors  Size Type
+       <path-to-img>/ir_acs_live_image_modified.img1    2048 1050622 104=
8575  512M Microsoft basic data
+       <path-to-img>/ir_acs_live_image_modified.img2 1050624 1153022  10=
2399   50M Microsoft basic data
=20
-  ->  <offset_1st_partition> =3D 2048 * 512 (sector size) =3D 1048576
+   ->  <offset_1st_partition> =3D 2048 * 512 (sector size) =3D 1048576
=20
-Common to FVP and FPGA
------------------------
-Reach u-boot then interrupt shell to reach EFI shell. Use below command =
at EFI shell.
+******************************
+Performing the capsule update
+******************************
+
+During this section we will be using the capsule with the higher version=
 (cs1k_cap_<fvp/mps3>_v6) for the positive scenario
+and the capsule with the lower version (cs1k_cap_<fvp/mps3>_v5) for the =
negative scenario.
+
+Running the FVP with the IR prebuilt image
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Run the FVP with the IR prebuilt image:
+
+::
+
+   <_workspace>/meta-arm/scripts/runfvp --terminals=3Dxterm <_workspace>=
/build/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000=
-fvp.fvpconf -- -C "board.msd_mmc.p_mmc_file ${<path-to-img>/ir_acs_live_=
image.img}"=20
+
+Running the FPGA with the IR prebuilt image
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Insert the prepared USB stick then Power cycle the MPS3 board.
+
+Executing capsule update for FVP and FPGA
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Reach u-boot then interrupt the boot  to reach the EFI shell.
+
+::
+
+   Press ESC in 4 seconds to skip startup.nsh or any other key to contin=
ue.
+
+Then, type FS0: as shown below:
=20
 ::
=20
   FS0:
-  EFI/BOOT/app/CapsuleApp.efi cs1k_cap
=20
-For this test, the user can provide two capsules for testing: a positive=
 test
-case capsule which boots the board correctly, and a negative test case w=
ith an
-incorrect capsule which fails to boot the host software.
+In case of the positive scenario run the update with the higher version =
capsule as shown below:=20
+
+::
+ =20
+  EFI/BOOT/app/CapsuleApp.efi cs1k_cap_<fvp/mps3>_v6
+
+After successfully updating the capsule the system will reset.
+
+In case of the negative scenario run the update with the lower version c=
apsule as shown below:=20
+
+::
+ =20
+  EFI/BOOT/app/CapsuleApp.efi cs1k_cap_<fvp/mps3>_v5
+
+The command above should fail and in the TF-M logs the following message=
 should appear:
+
+::
+
+   ERROR: flash_full_capsule: version error=20
+
+Then, reboot manually:
+
+::
+
+   Shell> reset
+
+FPGA: Select Corstone-1000 Linux kernel boot
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Remove the USB stick before u-boot is reached so the Corstone-1000 kerne=
l will be detected and used for booting.
+
+**NOTE:** Otherwise, the execution ends up in the ACS live image.
+
+FVP: Select Corstone-1000 Linux kernel boot
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Interrupt the u-boot shell.
+
+::
+
+   Hit any key to stop autoboot:
+
+Run the following commands in order to run the Corstone-1000 Linux kerne=
l and being able to check the ESRT table.
+
+**NOTE:** Otherwise, the execution ends up in the ACS live image.
+
+::
+
+   $ run retrieve_kernel_load_addr
+   $ unzip $kernel_addr 0x90000000
+   $ loadm 0x90000000 $kernel_addr_r 0xf00000
+   $ bootefi $kernel_addr_r $fdtcontroladdr
+
+
+***********************
+Capsule update status
+***********************
+
+Positive scenario
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 In the positive case scenario, the user should see following log in TF-M=
 log,
 indicating the new capsule image is successfully applied, and the board =
boots
@@ -532,6 +727,36 @@ correctly.
   ...
=20
=20
+It's possible to check the content of the ESRT table after the system fu=
lly boots.
+
+In the Linux command-line run the following:
+
+::
+
+   # cd /sys/firmware/efi/esrt/entries/entry0
+   # cat *
+   =20
+   0x0
+   e2bb9c06-70e9-4b14-97a3-5a7913176e3f
+   0
+   6
+   0
+   6
+   0
+
+.. line-block::
+   capsule_flags:	0x0
+   fw_class:	e2bb9c06-70e9-4b14-97a3-5a7913176e3f
+   fw_type:	0
+   fw_version:	6
+   last_attempt_status:	0=20
+   last_attempt_version:	6
+   lowest_supported_fw_ver:	0
+
+
+Negative scenario
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
 In the negative case scenario, the user should see appropriate logs in
 the secure enclave terminal. If capsule pass initial verification, but f=
ails
 verifications performed during boot time, secure enclave will try new im=
ages
@@ -545,16 +770,45 @@ the previous good bank.
   fwu_select_previous: in regular state by choosing previous active bank
   ...
=20
-*******************************************************
-Linux distro install and boot (applicable to FPGA only)
-*******************************************************
+It's possible to check the content of the ESRT table after the system fu=
lly boots.
+
+In the Linux command-line run the following:
+
+::
+
+   # cd /sys/firmware/efi/esrt/entries/entry0
+   # cat *
+   =20
+   0x0
+   e2bb9c06-70e9-4b14-97a3-5a7913176e3f
+   0
+   6
+   1
+   5
+   0
+
+.. line-block::
+   capsule_flags:	0x0
+   fw_class:	e2bb9c06-70e9-4b14-97a3-5a7913176e3f
+   fw_type:	0
+   fw_version:	6
+   last_attempt_status:	1
+   last_attempt_version:	5
+   lowest_supported_fw_ver:	0
+
+Linux distros tests
+----------------------------------
+
+************************************************************************=
***************
+Debian/OpenSUSE install and boot (applicable to FPGA only)
+************************************************************************=
***************
=20
 To test Linux distro install and boot, the user should prepare two empty=
 USB sticks.
=20
 Download one of following Linux distro images:
  - Debian installer image: https://cdimage.debian.org/cdimage/weekly-bui=
lds/arm64/iso-dvd/
  - OpenSUSE Tumbleweed installer image: http://download.opensuse.org/por=
ts/aarch64/tumbleweed/iso/
-   - The user should look for a DVD Snapshot like openSUSE-Tumbleweed-DV=
D-aarch64-Snapshot20211125-Media.iso
+   - The user should look for a DVD Snapshot like openSUSE-Tumbleweed-DV=
D-aarch64-Snapshot<date>-Media.iso
=20
 Once the .iso file is downloaded, the .iso file needs to be flashed to y=
our USB drive.
=20
@@ -578,7 +832,7 @@ Press <Ctrl+x>.
=20
 Now plug in the second USB stick, the distro installation process will s=
tart.
=20
-**NOTE:** Due to the performance limitation of Corstone1000 MPS3 FPGA, t=
he
+**NOTE:** Due to the performance limitation of Corstone-1000 MPS3 FPGA, =
the
 distro installation process can take up to 24 hours to complete.
=20
 Once installation is complete, unplug the first USB stick and reboot the=
 board.
@@ -591,46 +845,98 @@ a login prompt:
=20
 Login with the username root.
=20
-Run psa-arch-test (applicable to both FPGA and FVP)
----------------------------------------------------
+**NOTE:** The Debian installer has a known issue "Install the GRUB bootl=
oader - unable to install " and these are the steps to
+follow on the subsequent popups to solve the issue during the installati=
on:
=20
-When running psa-arch-test on MPS3 FPGA, the user should make sure there=
 is no
-USB stick connected to the board. Power on the board and boot the board =
to
-Linux. Then, the user should follow the steps below to run the psa_arch_=
tests.
+1. Select "Continue", then "Continue" again on the next popup
+2. Scroll down and select "Execute a shell"
+3. Select "Continue"
+4. Enter the following command:
=20
-When running psa-arch-test on Corstone1000 FVP, the user should follow t=
he
-instructions in `Running the software on FVP`_ section to boot Linux in =
FVP
-host_terminal_0, and login using the username ``root``.
+::
=20
-As a reference for the user's test results, the psa-arch-test report for=
 `Corstone1000 software (CORSTONE1000-2022.02.18) <https://git.yoctoproje=
ct.org/meta-arm/tag/?h=3DCORSTONE1000-2022.02.18>`__
-can be found in `here <https://gitlab.arm.com/arm-reference-solutions/ar=
m-reference-solutions-test-report/-/tree/master/embedded-a/corstone1000>`=
__.
+   in-target grub-install --no-nvram --force-extra-removable
=20
-First, create a file containing SE_PROXY_SP UUID. Run:
+5. Enter the following command:
=20
 ::
=20
-  echo 46bb39d1-b4d9-45b5-88ff-040027dab249 > sp_uuid_list.txt
+   in-target update-grub
=20
-Then, load FFA driver module into Linux kernel. Run:
+6. Enter the following command:
=20
 ::
=20
-  load_ffa_debugfs.sh .
+   exit
+
+7. Select "Continue without boot loader", then select "Continue" on the =
next popup
+8. At this stage, the installation should proceed as normal.
=20
-Then, check whether the FFA driver loaded correctly by using the followi=
ng command:
+************************************************************************=
***************
+OpenSUSE Raw image install and boot (applicable to FVP only)
+************************************************************************=
***************
+
+Steps to download openSUSE Tumbleweed raw image:
+  - Go to: http://download.opensuse.org/ports/aarch64/tumbleweed/applian=
ces/
+  - The user should look for a Tumbleweed-ARM-JeOS-efi.aarch64-* Snapsho=
t, for example, ``openSUSE-Tumbleweed-ARM-JeOS-efi.aarch64-<date>-Snapsho=
t<date>.raw.xz``
+
+Once the .raw.xz file is downloaded, the raw image file needs to be extr=
acted:
=20
 ::
=20
-  cat /proc/modules | grep arm_ffa_user
+       unxz <file-name.raw.xz>
+
+
+The above command will generate a file ending with extension .raw image.=
 Now, use the following command
+to run FVP with raw image installation process.
+
+::
+
+<_workspace>/meta-arm/scripts/runfvp --terminals=3Dxterm <_workspace>/bu=
ild/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000-fv=
p.fvpconf -- -C board.msd_mmc.p_mmc_file=3D"${openSUSE raw image file pat=
h}"=20
+
+After successfully installing and booting the Linux distro, the user sho=
uld see
+a openSUSE login prompt.
+
+::
+
+      localhost login:
+
+Login with the username 'root' and password 'linux'.
+
+PSA API tests
+----------------------
+
+************************************************************************=
***************
+Run PSA API test commands (applicable to both FPGA and FVP)
+************************************************************************=
***************
+
+When running PSA API test commands (aka PSA Arch Tests) on MPS3 FPGA, th=
e user should make sure there is no
+USB stick connected to the board. Power on the board and boot the board =
to
+Linux. Then, the user should follow the steps below to run the tests.
+
+When running the tests on the Corstone-1000 FVP, the user should follow =
the
+instructions in `Running the software on FVP`_ section to boot Linux in =
FVP
+host_terminal_0, and login using the username ``root``.
+
+First, load FF-A TEE kernel module:
+
+::
+
+  insmod /lib/modules/5.19.9-yocto-standard/extra/arm-ffa-tee.ko
+
+Then, check whether the FF-A TEE driver is loaded correctly by using the=
 following command:
+
+::
+
+  cat /proc/modules | grep arm_ffa_tee
=20
 The output should be:
=20
 ::
=20
-  arm_ffa_user 16384 - - Live 0xffffffc0084b0000 (O)
+   arm_ffa_tee 16384 - - Live 0xffffffc0004f0000 (O)
=20
-Now, run the PSA arch tests with following commands. The user should run=
 the
-tests in following order:
+Now, run the PSA API tests in the following order:
=20
 ::
=20
@@ -639,47 +945,108 @@ tests in following order:
   psa-its-api-test
   psa-ps-api-test
=20
-********************************************************
-Linux distro: OpenSUSE Raw image installation (FVP Only)
-********************************************************
+External System tests
+-----------------------------------
=20
-Steps to download openSUSE Tumbleweed raw image:
-  - Go to: http://download.opensuse.org/ports/aarch64/tumbleweed/applian=
ces/
-  - The user should look for a Tumbleweed-ARM-JeOS-efi.aarch64-* Snapsho=
t, for example, ``openSUSE-Tumbleweed-ARM-JeOS-efi.aarch64-2022.03.18-Sna=
pshot20220331.raw.xz``
+************************************************************************=
***************
+Running the External System test command (systems-comms-tests)
+************************************************************************=
***************
=20
-Once the .raw.xz file is downloaded, the raw image file needs to be extr=
acted:
+Test 1: Releasing the External System out of reset
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+
+Run this command in the Linux command-line:
=20
 ::
=20
-       unxz <file-name.raw.xz>
+  systems-comms-tests 1
=20
+The output on the External System terminal should be:
=20
-The above command will generate a file ending with extension .raw image.=
 Now, use the following command
-to run FVP with raw image installation process.
+::
+
+    ___  ___
+   |    / __|
+   |=3D=3D=3D \___
+   |___ |___/
+   External System Cortex-M3 Processor
+   Running RTX RTOS
+   v0.1.0_2022-10-19_16-41-32-8c9dca7
+   MHUv2 module 'MHU0_H' started
+   MHUv2 module 'MHU1_H' started
+   MHUv2 module 'MHU0_SE' started
+   MHUv2 module 'MHU1_SE' started
+
+Test 2: Communication
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Test 2 releases the External System out of reset if not already done. Th=
en, it performs communication between host and External System.
+
+After running Test 1, run this command in the Linux command-line:
=20
 ::
=20
-<_workspace>/meta-arm/scripts/runfvp --terminals=3Dxterm <_workspace>/bu=
ild/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000-fv=
p.fvpconf -- -C board.msd_mmc.p_mmc_file=3D"${openSUSE raw image file pat=
h}"=20
+  systems-comms-tests 2
=20
-After successfully installing and booting the Linux distro, the user sho=
uld see
-a openSUSE login prompt.
+Additional output on the External System terminal will be printed: =20
=20
 ::
=20
-      localhost login:
+   MHUv2: Message from 'MHU0_H': 0xabcdef1
+   Received 'abcdef1' From Host MHU0
+   CMD: Increment and return to sender...
+   MHUv2: Message from 'MHU1_H': 0xabcdef1
+   Received 'abcdef1' From Host MHU1
+   CMD: Increment and return to sender...
=20
-Login with the username 'root' and password 'linux'.
+When running Test 2 the first, Test 1 will be run in the background.
+
+The output on the External System terminal should be:
+
+::
+
+    ___  ___
+   |    / __|
+   |=3D=3D=3D \___
+   |___ |___/
+   External System Cortex-M3 Processor
+   Running RTX RTOS
+   v0.1.0_2022-10-19_16-41-32-8c9dca7
+   MHUv2 module 'MHU0_H' started
+   MHUv2 module 'MHU1_H' started
+   MHUv2 module 'MHU0_SE' started
+   MHUv2 module 'MHU1_SE' started
+   MHUv2: Message from 'MHU0_H': 0xabcdef1
+   Received 'abcdef1' From Host MHU0
+   CMD: Increment and return to sender...
+   MHUv2: Message from 'MHU1_H': 0xabcdef1
+   Received 'abcdef1' From Host MHU1
+   CMD: Increment and return to sender...
+
+The output on the Host terminal should be:
+
+::
+
+   Received abcdf00 from es0mhu0
+   Received abcdf00 from es0mhu1
+
+
+Tests results
+-----------------------------------
+
+As a reference for the end user, reports for various tests for `Corstone=
-1000 software (CORSTONE1000-2022.11.10) <https://git.yoctoproject.org/me=
ta-arm/tag/?h=3DCORSTONE1000-2022.11.10>`__
+can be found in `here <https://gitlab.arm.com/arm-reference-solutions/ar=
m-reference-solutions-test-report/-/tree/master/embedded-a/corstone1000>`=
__.
=20
-**************************************
 Running the software on FVP on Windows
-**************************************
-If the user needs to run the Corstone1000 software on FVP on Windows. Th=
e user
+---------------------------------------------------------------
+
+If the user needs to run the Corstone-1000 software on FVP on Windows. T=
he user
 should follow the build instructions in this document to build on Linux =
host
 PC, and copy the output binaries to the Windows PC where the FVP is loca=
ted,
 and launch the FVP binary.
=20
 --------------
=20
-*Copyright (c) 2021, Arm Limited. All rights reserved.*
+*Copyright (c) 2022, Arm Limited. All rights reserved.*
=20
 .. _Arm Ecosystem FVPs: https://developer.arm.com/tools-and-software/ope=
n-source-software/arm-platforms-software/arm-ecosystem-fvps
--=20
2.17.1


