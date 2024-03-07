Return-Path: <drew.reed@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 814C0C54E58
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 11:19:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20913.1709810340500540938
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Mar 2024 03:19:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: drew.reed@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23BCF1FB;
	Thu,  7 Mar 2024 03:19:37 -0800 (PST)
Received: from C02DP1BVML7H.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A9D53F762;
	Thu,  7 Mar 2024 03:18:59 -0800 (PST)
From: drew.reed@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Drew Reed <Drew.Reed@arm.com>
Subject: [PATCH 2/2] bsp: Corstone-1000 userguide updates
Date: Thu,  7 Mar 2024 11:18:36 +0000
Message-ID: <20240307111836.59383-3-drew.reed@arm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240307111836.59383-1-drew.reed@arm.com>
References: <20240307111836.59383-1-drew.reed@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 07 Mar 2024 11:19:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5418

From: Drew Reed <Drew.Reed@arm.com>

The user guide document for Corstone-1000 has been updated to reflect
the changes required following the multiconfig changes as well as now
running the fvp within the kas shell to ensure all environment variables
are picked up correctly.

Signed-off-by: Drew Reed <Drew.Reed@arm.com>
---
 .../documentation/corstone1000/user-guide.rst | 91 +++++++++----------
 1 file changed, 45 insertions(+), 46 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index a308e423..dc1d1023 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -1,5 +1,5 @@
 ..
- # Copyright (c) 2022-2023, Arm Limited.
+ # Copyright (c) 2022-2024, Arm Limited.
  #
  # SPDX-License-Identifier: MIT
=20
@@ -152,7 +152,7 @@ commands to build the stack. kas version 4 is require=
d. To install kas, run:
=20
     pip3 install kas
=20
-If 'kas' command is not found in command-line, please make sure the user=
 installation directories are visible on $PATH. If you have sudo rights, =
try 'sudo pip3 install kas'.=20
+If 'kas' command is not found in command-line, please make sure the user=
 installation directories are visible on $PATH. If you have sudo rights, =
try 'sudo pip3 install kas'.
=20
 In the top directory of the workspace ``<_workspace>``, run:
=20
@@ -171,7 +171,7 @@ the EULA at https://developer.arm.com/downloads/-/arm=
-ecosystem-fvps/eula
 by setting the ARM_FVP_EULA_ACCEPT environment variable as follows:
=20
 ::
- =20
+
     export ARM_FVP_EULA_ACCEPT=3D"True"
=20
 then run:
@@ -189,12 +189,12 @@ Once the build is successful, all output binaries w=
ill be placed in the followin
  - ``<_workspace>/build/tmp/deploy/images/corstone1000-mps3/`` folder fo=
r FPGA build.
=20
 Everything apart from the Secure Enclave ROM firmware and External Syste=
m firmware, is bundled into a single binary, the
-``corstone1000-image-corstone1000-{mps3,fvp}.wic`` file.
+``corstone1000-flash-firmware-image-corstone1000-{mps3,fvp}.wic`` file.
=20
 The output binaries run in the Corstone-1000 platform are the following:
  - The Secure Enclave ROM firmware: ``<_workspace>/build/tmp/deploy/imag=
es/corstone1000-{mps3,fvp}/bl1.bin``
  - The External System firmware: ``<_workspace>/build/tmp/deploy/images/=
corstone1000-{mps3,fvp}/es_flashfw.bin``
- - The flash image: ``<_workspace>/build/tmp/deploy/images/corstone1000-=
{mps3,fvp}/corstone1000-image-corstone1000-{mps3,fvp}.wic``
+ - The flash image: ``<_workspace>/build/tmp/deploy/images/corstone1000-=
{mps3,fvp}/corstone1000-flash-firmware-image-corstone1000-{mps3,fvp}.wic`=
`
=20
 Flash the firmware image on FPGA
 --------------------------------
@@ -252,17 +252,17 @@ stack can be seen below;
=20
   [IMAGES]
   TOTALIMAGES: 3      ;Number of Images (Max: 32)
-  =20
+
   IMAGE0PORT: 1
   IMAGE0ADDRESS: 0x00_0000_0000
   IMAGE0UPDATE: RAM
   IMAGE0FILE: \SOFTWARE\bl1.bin
-  =20
+
   IMAGE1PORT: 0
   IMAGE1ADDRESS: 0x00_0000_0000
   IMAGE1UPDATE: AUTOQSPI
   IMAGE1FILE: \SOFTWARE\cs1000.bin
-  =20
+
   IMAGE2PORT: 2
   IMAGE2ADDRESS: 0x00_0000_0000
   IMAGE2UPDATE: RAM
@@ -273,7 +273,7 @@ OUTPUT_DIR =3D ``<_workspace>/build/tmp/deploy/images=
/corstone1000-mps3``
 1. Copy ``bl1.bin`` from OUTPUT_DIR directory to SOFTWARE directory of t=
he FPGA bundle.
 2. Copy ``es_flashfw.bin`` from OUTPUT_DIR directory to SOFTWARE directo=
ry of the FPGA bundle
    and rename the binary to ``es0.bin``.
-3. Copy ``corstone1000-image-corstone1000-mps3.wic`` from OUTPUT_DIR dir=
ectory to SOFTWARE
+3. Copy ``corstone1000-flash-firmware-image-corstone1000-mps3.wic`` from=
 OUTPUT_DIR directory to SOFTWARE
    directory of the FPGA bundle and rename the wic image to ``cs1000.bin=
``.
=20
 **NOTE:** Renaming of the images are required because MCC firmware has
@@ -337,7 +337,7 @@ The latest supported Fixed Virtual Platform (FVP) ver=
sion is 11_23.25 and is aut
=20
 ::
=20
-<_workspace>/meta-arm/scripts/runfvp <_workspace>/build/tmp/deploy/image=
s/corstone1000-fvp/corstone1000-image-corstone1000-fvp.fvpconf -- --versi=
on
+  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c "=
../meta-arm/scripts/runfvp -- --version"
=20
 The FVP can also be manually downloaded from the `Arm Ecosystem FVPs`_ p=
age. On this page, navigate
 to "Corstone IoT FVPs" section to download the Corstone-1000 platform FV=
P installer.  Follow the
@@ -347,7 +347,7 @@ To run the FVP using the runfvp command, please run t=
he following command:
=20
 ::
=20
-<_workspace>/meta-arm/scripts/runfvp --terminals=3Dxterm <_workspace>/bu=
ild/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000-fv=
p.fvpconf
+  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c "=
../meta-arm/scripts/runfvp --terminals=3Dxterm"
=20
 When the script is executed, three terminal instances will be launched, =
one for the boot processor
 (aka Secure Enclave) processing element and two for the Host processing =
element. Once the FVP is
@@ -488,7 +488,7 @@ the 2nd MMC card image.
=20
 ::
=20
-   <_workspace>/meta-arm/scripts/runfvp <_workspace>/build/tmp/deploy/im=
ages/corstone1000-fvp/corstone1000-image-corstone1000-fvp.fvpconf -- -C b=
oard.msd_mmc.p_mmc_file=3D"${<path-to-img>/ir_acs_live_image.img}" -C boa=
rd.msd_mmc_2.p_mmc_file=3D"${<path-to-img>/corstone1000-efi-partition.img=
}"
+   kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c =
"../meta-arm/scripts/runfvp -- -C board.msd_mmc.p_mmc_file=3D"${<path-to-=
img>/ir_acs_live_image.img}" -C board.msd_mmc_2.p_mmc_file=3D"${<path-to-=
img>/corstone1000-efi-partition.img}"
=20
 Clean Secure Flash Before Testing (applicable to FPGA only)
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -510,7 +510,7 @@ boot. Run following commands to build such image.
=20
 Replace the bl1.bin and cs1000.bin files on the SD card with following f=
iles:
   - The ROM firmware: <_workspace>/build/tmp/deploy/images/corstone1000-=
mps3/bl1.bin
-  - The flash image: <_workspace>/build/tmp/deploy/images/corstone1000-m=
ps3/corstone1000-image-corstone1000-mps3.wic
+  - The flash image: <_workspace>/build/tmp/deploy/images/corstone1000-m=
ps3/corstone1000-flash-firmware-image-corstone1000-mps3.wic
=20
 Now reboot the board. This step erases the Corstone-1000 SecureEnclave f=
lash
 completely, the user should expect following message from TF-M log (can =
be seen
@@ -626,7 +626,7 @@ SD cards.
=20
   unxz ${<path-to-img>/ir-acs-live-image-generic-arm64.wic.xz}
=20
-  <_workspace>/meta-arm/scripts/runfvp  --terminals=3Dxterm <_workspace>=
/build/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000=
-fvp.fvpconf -- -C board.msd_mmc.p_mmc_file=3D<path-to-img>/ir-acs-live-i=
mage-generic-arm64.wic -C board.msd_mmc_2.p_mmc_file=3D"${<path-to-img>/c=
orstone1000-efi-partition.img}"
+  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c "=
../meta-arm/scripts/runfvp --terminals=3Dxterm -- -C board.msd_mmc.p_mmc_=
file=3D<path-to-img>/ir-acs-live-image-generic-arm64.wic -C board.msd_mmc=
_2.p_mmc_file=3D"${<path-to-img>/corstone1000-efi-partition.img}"
=20
 The test results can be fetched using following commands:
=20
@@ -658,7 +658,7 @@ If this happens, please apply the following patch, re=
build the software stack fo
   cd meta-arm
   git am 0001-embedded-a-corstone1000-sr-ir-workaround.patch
   cd ..
-  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c=3D=
"bitbake u-boot -c cleanall; bitbake trusted-firmware-a -c cleanall; bitb=
ake corstone1000-image -c cleanall; bitbake corstone1000-image"
+  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c "=
bitbake u-boot -c cleanall; bitbake trusted-firmware-a -c cleanall; bitba=
ke corstone1000-flash-firmware-image -c cleanall; bitbake corstone1000-fl=
ash-firmware-image"
=20
=20
 Common to FVP and FPGA
@@ -833,7 +833,7 @@ Run the FVP with the IR prebuilt image:
=20
 ::
=20
-   <_workspace>/meta-arm/scripts/runfvp --terminals=3Dxterm <_workspace>=
/build/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000=
-fvp.fvpconf -- -C board.msd_mmc.p_mmc_file=3D<path-to-img>/ir-acs-live-i=
mage-generic-arm64.wic
+   kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c =
"../meta-arm/scripts/runfvp --terminals=3Dxterm -- -C board.msd_mmc.p_mmc=
_file=3D<path-to-img>/ir-acs-live-image-generic-arm64.wic"
=20
 **NOTE:** <path-to-img> must start from the root directory. make sure th=
ere are no spaces before or after of "=3D". board.msd_mmc.p_mmc_file=3D<p=
ath-to-img>/ir-acs-live-image-generic-arm64.wic.
=20
@@ -857,25 +857,25 @@ Then, type FS0: as shown below:
=20
   FS0:
=20
-In case of the positive scenario run the update with the higher version =
capsule as shown below:=20
+In case of the positive scenario run the update with the higher version =
capsule as shown below:
=20
 ::
- =20
+
   EFI/BOOT/app/CapsuleApp.efi cs1k_cap_<fvp/mps3>_v6
=20
 After successfully updating the capsule the system will reset.
=20
-In case of the negative scenario run the update with the lower version c=
apsule as shown below:=20
+In case of the negative scenario run the update with the lower version c=
apsule as shown below:
=20
 ::
- =20
+
   EFI/BOOT/app/CapsuleApp.efi cs1k_cap_<fvp/mps3>_v5
=20
 The command above should fail and in the TF-M logs the following message=
 should appear:
=20
 ::
=20
-   ERROR: flash_full_capsule: version error=20
+   ERROR: flash_full_capsule: version error
=20
 Then, reboot manually:
=20
@@ -942,7 +942,7 @@ In the Linux command-line run the following:
=20
    # cd /sys/firmware/efi/esrt/entries/entry0
    # cat *
-   =20
+
    0x0
    989f3a4e-46e0-4cd0-9877-a25c70c01329
    0
@@ -956,7 +956,7 @@ In the Linux command-line run the following:
    fw_class:	989f3a4e-46e0-4cd0-9877-a25c70c01329
    fw_type:	0
    fw_version:	6
-   last_attempt_status:	0=20
+   last_attempt_status:	0
    last_attempt_version:	6
    lowest_supported_fw_ver:	0
=20
@@ -964,12 +964,12 @@ In the Linux command-line run the following:
 Negative scenario (Applicable to FPGA only)
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-In the negative case scenario (rollback the capsule version), the user s=
hould=20
-see appropriate logs in the secure enclave terminal.=20
+In the negative case scenario (rollback the capsule version), the user s=
hould
+see appropriate logs in the secure enclave terminal.
=20
 ::
=20
-  ... =20
+  ...
     uefi_capsule_retrieve_images: image 0 at 0xa0000070, size=3D15654928
     uefi_capsule_retrieve_images: exit
     flash_full_capsule: enter: image =3D 0x0xa0000070, size =3D 7764541,=
 version =3D 5
@@ -988,8 +988,8 @@ see appropriate logs in the secure enclave terminal.
   ...
=20
=20
-If capsule pass initial verification, but fails verifications performed =
during=20
-boot time, secure enclave will try new images predetermined number of ti=
mes=20
+If capsule pass initial verification, but fails verifications performed =
during
+boot time, secure enclave will try new images predetermined number of ti=
mes
 (defined in the code), before reverting back to the previous good bank.
=20
 ::
@@ -1007,7 +1007,7 @@ In the Linux command-line run the following:
=20
    # cd /sys/firmware/efi/esrt/entries/entry0
    # cat *
-   =20
+
    0x0
    989f3a4e-46e0-4cd0-9877-a25c70c01329
    0
@@ -1035,7 +1035,7 @@ Linux distros tests
 -------------------
=20
 *************************************************************
-Debian install and boot preparation=20
+Debian install and boot preparation
 *************************************************************
=20
 There is a known issue in the `Shim 15.7 <https://salsa.debian.org/efi-t=
eam/shim/-/tree/upstream/15.7?ref_type=3Dtags>`__
@@ -1064,12 +1064,12 @@ documentation.
 **On FPGA**
 ::
=20
-  kas shell meta-arm/kas/corstone1000-mps3.yml:meta-arm/ci/debug.yml -c=3D=
"bitbake u-boot trusted-firmware-a corstone1000-image -c cleansstate; bit=
bake corstone1000-image"
+  kas shell meta-arm/kas/corstone1000-mps3.yml:meta-arm/ci/debug.yml -c=3D=
"bitbake u-boot trusted-firmware-a corstone1000-flash-firmware-image -c c=
leansstate; bitbake corstone1000-flash-firmware-image"
=20
 **On FVP**
 ::
=20
-  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c=3D=
"bitbake u-boot trusted-firmware-a corstone1000-image -c cleansstate; bit=
bake corstone1000-image"
+  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c=3D=
"bitbake u-boot trusted-firmware-a corstone1000-flash-firmware-image -c c=
leansstate; bitbake corstone1000-flash-firmware-image"
=20
 On FPGA, please update the cs1000.bin on the SD card with the newly gene=
rated wic file.
=20
@@ -1080,7 +1080,7 @@ On FPGA, please update the cs1000.bin on the SD car=
d with the newly generated wi
   cd <_workspace>/meta-arm
   git reset --hard HEAD~1
   cd ..
-  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c=3D=
"bitbake u-boot -c cleanall; bitbake trusted-firmware-a -c cleanall; bitb=
ake corstone1000-image -c cleanall; bitbake corstone1000-image"
+  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c=3D=
"bitbake u-boot -c cleanall; bitbake trusted-firmware-a -c cleanall; bitb=
ake corstone1000-flash-firmware-image -c cleanall; bitbake corstone1000-f=
lash-firmware-image"
=20
 *************************************************
 Preparing the Installation Media
@@ -1089,7 +1089,7 @@ Preparing the Installation Media
 Download one of following Linux distro images:
  - `Debian installer image <https://cdimage.debian.org/debian-cd/current=
/arm64/iso-dvd/>`__ (Tested on: debian-12.2.0-arm64-DVD-1.iso)
  - `OpenSUSE Tumbleweed installer image <http://download.opensuse.org/po=
rts/aarch64/tumbleweed/iso/>`__ (Tested on: openSUSE-Tumbleweed-DVD-aarch=
64-Snapshot20231120-Media.iso)
- =20
+
 **NOTE:** For OpenSUSE Tumbleweed, the user should look for a DVD Snapsh=
ot like
 openSUSE-Tumbleweed-DVD-aarch64-Snapshot<date>-Media.iso
=20
@@ -1100,7 +1100,7 @@ FPGA
 To test Linux distro install and boot on FPGA, the user should prepare t=
wo empty USB
 sticks (minimum size should be 4GB and formatted with FAT32).
=20
-The downloaded iso file needs to be flashed to your USB drive.=20
+The downloaded iso file needs to be flashed to your USB drive.
 This can be done with your development machine.
=20
 In the example given below, we assume the USB device is ``/dev/sdb`` (th=
e user
@@ -1157,10 +1157,10 @@ FVP
=20
 ::
=20
-  <_workspace>/meta-arm/scripts/runfvp --terminals=3Dxterm <_workspace>/=
build/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000-=
fvp.fvpconf -- -C board.msd_mmc.p_mmc_file=3D"<path-to-iso_file>" -C boar=
d.msd_mmc_2.p_mmc_file=3D"<_workspace>/mmc2_file.img"
+  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c "=
../meta-arm/scripts/runfvp --terminals=3Dxterm -- -C board.msd_mmc.p_mmc_=
file=3D"<path-to-iso_file>" -C board.msd_mmc_2.p_mmc_file=3D"<_workspace>=
/mmc2_file.img"
=20
 The installer should now start.
-The os will be installed on the second mmc 'mmc2_file.img'.=20
+The os will be installed on the second mmc 'mmc2_file.img'.
=20
 *******************************************************
 Debian install clarifications
@@ -1209,24 +1209,23 @@ FPGA
 Once the installation is complete, unplug the first USB stick and reboot=
 the
 board.
 The board will then enter recovery mode, from which the user can access =
a shell
-after entering the password for the root user.=20
+after entering the password for the root user.
=20
 FVP
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-Once the installation is complete, you will need to exit the shell insta=
nce=20
+Once the installation is complete, you will need to exit the shell insta=
nce
 and run this command to boot into the installed OS:
=20
-::=20
-
-  <_workspace>/meta-arm/scripts/runfvp --terminals=3Dxterm <_workspace>/=
build/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000-=
fvp.fvpconf -- -C board.msd_mmc.p_mmc_file=3D"<_workspace>/mmc2_file.img"
+::
=20
+  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c "=
../meta-arm/scripts/runfvp --terminals=3Dxterm -- -C board.msd_mmc.p_mmc_=
file=3D"<path-to-iso_file>" -C board.msd_mmc.p_mmc_file=3D"<_workspace>/m=
mc2_file.img"
=20
 Once the FVP begins booting, you will need to quickly change the boot op=
tion in grub,
-to boot into recovery mode.=20
+to boot into recovery mode.
=20
 **NOTE:** This option will disappear quickly, so it's best to preempt it=
.
=20
-Select 'Advanced Options for '<OS>' and then '<OS> (recovery mode)'.=20
+Select 'Advanced Options for '<OS>' and then '<OS> (recovery mode)'.
=20
 Common
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -1247,7 +1246,7 @@ Proceed to edit the following files accordingly:
=20
   The system.conf has been moved from /etc/systemd/ to /usr/lib/systemd/=
 and directly modifying
   the /usr/lib/systemd/system.conf is not working and it is getting over=
ridden. We have to create
-  drop ins system configurations in /etc/systemd/system.conf.d/ director=
y. So, copy the=20
+  drop ins system configurations in /etc/systemd/system.conf.d/ director=
y. So, copy the
   /usr/lib/systemd/system.conf to /etc/systemd/system.conf.d/ directory =
after the mentioned modifications.
=20
 The file to be edited next is different depending on the installed distr=
o:
@@ -1338,7 +1337,7 @@ To report any security issues identified with Corst=
one-1000, please send an emai
=20
 --------------
=20
-*Copyright (c) 2022-2023, Arm Limited. All rights reserved.*
+*Copyright (c) 2022-2024, Arm Limited. All rights reserved.*
=20
 .. _Arm Ecosystem FVPs: https://developer.arm.com/tools-and-software/ope=
n-source-software/arm-platforms-software/arm-ecosystem-fvps
 .. _U-Boot repo: https://github.com/u-boot/u-boot.git
--=20
2.44.0


