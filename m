Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCD0C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 16:27:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.105392.1701793631882275792
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 Dec 2023 08:27:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22D4C139F;
	Tue,  5 Dec 2023 08:27:58 -0800 (PST)
Received: from e126835.cambridge.arm.com (e126835.cambridge.arm.com [10.1.36.183])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 131473F6C4;
	Tue,  5 Dec 2023 08:27:09 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH nanbield 1/1] arm-bsp/documentation: corstone1000: fix the steps in the user guide and instructions
Date: Tue,  5 Dec 2023 16:26:51 +0000
Message-Id: <20231205162651.200648-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231205162651.200648-1-emekcan.aras@arm.com>
References: <20231205162651.200648-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 05 Dec 2023 16:27:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5293

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

Provide updates and fixes in the user guide identified during testing.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
---
 .../corstone1000/software-architecture.rst    |  2 +-
 .../documentation/corstone1000/user-guide.rst | 97 +++++++++++++------
 2 files changed, 67 insertions(+), 32 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/software-architectur=
e.rst b/meta-arm-bsp/documentation/corstone1000/software-architecture.rst
index ce8bd7e0..6bc8acea 100644
--- a/meta-arm-bsp/documentation/corstone1000/software-architecture.rst
+++ b/meta-arm-bsp/documentation/corstone1000/software-architecture.rst
@@ -235,7 +235,7 @@ References
 .. _Arm security features: https://www.arm.com/architecture/security-fea=
tures/platform-security
 .. _linux repo: https://git.kernel.org/pub/scm/linux/kernel/git/stable/l=
inux.git/
 .. _FF-A: https://developer.arm.com/documentation/den0077/latest
-.. _FF-M: https://developer.arm.com/-/media/Files/pdf/PlatformSecurityAr=
chitecture/Architect/DEN0063-PSA_Firmware_Framework-1.0.0-2.pdf?revision=3D=
2d1429fa-4b5b-461a-a60e-4ef3d8f7f4b4&hash=3D3BFD6F3E687F324672F18E5BE9F08=
EDC48087C93
+.. _FF-M: https://developer.arm.com/architectures/Firmware%20Framework%2=
0for%20M-Profile
 .. _FWU: https://developer.arm.com/documentation/den0118/a/
 .. _OPTEE-OS: https://github.com/OP-TEE/optee_os
 .. _PSA: https://www.psacertified.org/
diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 134ed41d..318cddfd 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -18,7 +18,7 @@ for more information.
 Prerequisites
 -------------
=20
-This guide assumes that your host PC is running Ubuntu 20.04 LTS, with a=
t least
+This guide assumes that your host machine is running Ubuntu 20.04 LTS, w=
ith at least
 32GB of free disk space and 16GB of RAM as minimum requirement.
=20
 The following prerequisites must be available on the host system:
@@ -435,7 +435,7 @@ running the ACS tests.
      dd conv=3Dnotrunc if=3DopenSUSE-Tumbleweed-ARM-JeOS-efi.aarch64-<da=
te>-Snapshot<date>.raw skip=3D<blockaddress_1st_partition> of=3Dcorstone1=
000-efi-partition.img seek=3D<blockaddress_1st_partition> iflag=3Dfullblo=
ck seek=3D<blockaddress_1st_partition> bs=3D512 count=3D<sectorsize_1s_pa=
rtition> && sync
=20
=20
-#. Use the provided disk-layout below to label the ESP correctly.
+#. Create the file efi_disk.layout locally. Copy the content of provided=
 disk layout below to the efi_disk.layout to label the ESP correctly.
=20
    efi_disk.layout
    ::
@@ -470,7 +470,10 @@ running the ACS tests.
 **Using ESP in FPGA:**
=20
 Once the ESP is created, it needs to be flashed to a second USB drive di=
fferent than ACS image.
-This can be done with the development machine.
+This can be done with the development machine. In the given example here
+we assume the USB device is ``/dev/sdb`` (the user should use ``lsblk`` =
command to
+confirm). Be cautious here and don't confuse your host machine own hard =
drive with the
+USB drive. Run the following commands to prepare the ACS image in USB st=
ick:
=20
 ::
=20
@@ -560,7 +563,7 @@ BOOT partition contains the following:
     =E2=94=94=E2=94=80=E2=94=80 ramdisk-busybox.img
=20
 RESULT partition is used to store the test results.
-**NOTE**: PLEASE MAKE SURE THAT THE RESULT PARTITION IS EMPTY BEFORE YOU=
 START THE TESTING. OTHERWISE THE TEST RESULTS
+**NOTE**: PLEASE MAKE SURE THAT "acs_results" FOLDER UNDER THE RESULT PA=
RTITION IS EMPTY BEFORE YOU START THE TESTING. OTHERWISE THE TEST RESULTS
 WILL NOT BE CONSISTENT
=20
 FPGA instructions for ACS image
@@ -589,7 +592,7 @@ SystemReady release in this repository.
=20
 Then, the user should prepare a USB stick with ACS image. In the given e=
xample here,
 we assume the USB device is ``/dev/sdb`` (the user should use ``lsblk`` =
command to
-confirm). Be cautious here and don't confuse your host PC's own hard dri=
ve with the
+confirm). Be cautious here and don't confuse your host machine own hard =
drive with the
 USB drive. Run the following commands to prepare the ACS image in USB st=
ick:
=20
 ::
@@ -604,6 +607,11 @@ and then boot the board.
=20
 The FPGA will reset multiple times during the test, and it might take ap=
prox. 24-36 hours to finish the test.
=20
+**NOTE**: The USB stick which contains the ESP partition might cause gru=
b to
+unable to find the bootable partition (only in the FPGA). If that's the =
case, please
+remove the USB stick and run the ACS tests. ESP partition can be mounted=
 after
+the platform is booted to linux at the end of the ACS tests.
+
=20
 FVP instructions for ACS image and run
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -639,6 +647,20 @@ the test. At the end of test, the FVP host terminal =
will halt showing a shell pr
 Once test is finished, the FVP can be stoped, and result can be copied f=
ollowing above
 instructions.
=20
+**NOTE:** A rare issue has been noticed (5-6% occurence) during which th=
e FVP hangs during booting the system while running ACS tests.
+If this happens, please apply the following patch, rebuild the software =
stack for FVP and re-run the ACS tests.
+
+::
+
+  cd <_workspace>
+  git clone https://git.gitlab.arm.com/arm-reference-solutions/systemrea=
dy-patch.git -b CORSTONE1000-2023.11
+  cp -f systemready-patch/embedded-a/corstone1000/sr_ir_workaround/0001-=
embedded-a-corstone1000-sr-ir-workaround.patch meta-arm
+  cd meta-arm
+  git am 0001-embedded-a-corstone1000-sr-ir-workaround.patch
+  cd ..
+  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c=3D=
"bitbake u-boot -c cleanall; bitbake trusted-firmware-a -c cleanall; cors=
tone1000-image -c cleanall; bitbake corstone1000-image"
+
+
 Common to FVP and FPGA
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
@@ -657,7 +679,7 @@ The results can be fetched from the ``acs_results`` f=
older in the RESULT partiti
 Manual capsule update and ESRT checks
 -------------------------------------
=20
-The following section describes running manual capsule update with the `=
`direct`` method.
+The following section describes running manual capsule update.
=20
 The steps described in this section perform manual capsule update and sh=
ow how to use the ESRT feature
 to retrieve the installed capsule details.
@@ -681,6 +703,13 @@ Download u-boot under <_workspace> and install tools=
:
   make tools-only_defconfig
   make tools-only
=20
+**NOTE:** The following error could happen if the linux build system doe=
s not have "libgnutls28-dev".
+ **error: "tools/mkeficapsule.c:21:10: fatal error: gnutls/gnutls.h: No =
such file or directory"**. If that's the case please install libgnutls28-=
dev and its dependencies by using the following command.
+
+::
+
+  sudo apt-get install -y libgnutls28-dev
+
 Download systemready-patch repo under <_workspace>:
 ::
=20
@@ -788,20 +817,7 @@ Then, unmount the IR image:
=20
    sudo umount /mnt/test
=20
-**NOTE:**
-
-The size of first partition in the image file is calculated in the follo=
wing way. The data is
-just an example and might vary with different ir-acs-live-image-generic-=
arm64.wic files.
-
-::
-
-   fdisk -lu <path-to-img>/ir-acs-live-image-generic-arm64.wic
-   ->  Device                                                     Start =
    End Sectors  Size Type
-       <path-to-img>/ir-acs-live-image-generic-arm64.wic1    2048  20684=
7  204800   100M Microsoft basic data
-       <path-to-img>/ir-acs-live-image-generic-arm64.wic2  206848 102423=
9  817392 399.1M Linux filesystem
-       <path-to-img>/ir-acs-live-image-generic-arm64.wic3 1026048 112844=
7  102400    50M Microsoft basic data
-
-   ->  <offset_1st_partition> =3D 2048 * 512 (sector size) =3D 1048576
+**NOTE:** Please refer to `FVP instructions for ACS image and run`_ sect=
ion to find the first partition offset.
=20
 ******************************
 Performing the capsule update
@@ -819,10 +835,7 @@ Run the FVP with the IR prebuilt image:
=20
    <_workspace>/meta-arm/scripts/runfvp --terminals=3Dxterm <_workspace>=
/build/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000=
-fvp.fvpconf -- -C board.msd_mmc.p_mmc_file=3D<path-to-img>/ir-acs-live-i=
mage-generic-arm64.wic
=20
-**NOTE:**
-
-<path-to-img> must start from the root directory.
-make sure there are no spaces before or after of "=3D". board.msd_mmc.p_=
mmc_file=3D<path-to-img>/ir-acs-live-image-generic-arm64.wic.
+**NOTE:** <path-to-img> must start from the root directory. make sure th=
ere are no spaces before or after of "=3D". board.msd_mmc.p_mmc_file=3D<p=
ath-to-img>/ir-acs-live-image-generic-arm64.wic.
=20
 Running the FPGA with the IR prebuilt image
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -1060,6 +1073,15 @@ documentation.
=20
 On FPGA, please update the cs1000.bin on the SD card with the newly gene=
rated wic file.
=20
+**NOTE:** Skip the shim patch only applies to Debian installation. The u=
ser should remove the patch from meta-arm before running the software to =
boot OpenSUSE or executing any other tests in this user guide. You can ma=
ke sure of removing the skip the shim patch by executing the steps below.
+
+::
+
+  cd <_workspace>/meta-arm
+  git reset --hard HEAD~1
+  cd ..
+  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c=3D=
"bitbake u-boot -c cleanall; bitbake trusted-firmware-a -c cleanall; cors=
tone1000-image -c cleanall; bitbake corstone1000-image"
+
 *************************************************
 Preparing the Installation Media
 *************************************************
@@ -1084,7 +1106,7 @@ This can be done with your development machine.
 In the example given below, we assume the USB device is ``/dev/sdb`` (th=
e user
 should use the `lsblk` command to confirm).
=20
-**NOTE:** Please don't confuse your host PC's own hard drive with the US=
B drive.
+**NOTE:** Please don't confuse your host machine own hard drive with the=
 USB drive.
 Then, copy the contents of the iso file into the first USB stick by runn=
ing the
 following command in the development machine:
=20
@@ -1100,6 +1122,7 @@ To test Linux distro install and boot on FVP, the u=
ser should prepare an mmc ima
 With a minimum size of 8GB formatted with gpt.
=20
 ::
+
   #Generating mmc2
   dd if=3D/dev/zero of=3D<_workspace>/mmc2_file.img bs=3D1 count=3D0 see=
k=3D8G; sync;
   parted -s mmc2_file.img mklabel gpt
@@ -1147,7 +1170,7 @@ As the installation process for Debian is different=
 than the one for openSUSE,
 Debian may need some extra steps, that are indicated below:
=20
 During Debian installation, please answer the following question:
- - "Force GRUB installation to the EFI removable media path?" Yes
+ - "Force grub installation to the EFI removable media path?" Yes
  - "Update NVRAM variables to automatically boot into Debian?" No
=20
 If the grub installation fails, these are the steps to follow on the sub=
sequent
@@ -1198,7 +1221,7 @@ and run this command to boot into the installed OS:
   <_workspace>/meta-arm/scripts/runfvp --terminals=3Dxterm <_workspace>/=
build/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000-=
fvp.fvpconf -- -C board.msd_mmc.p_mmc_file=3D"<_workspace>/mmc2_file.img"
=20
=20
-Once the FVP begins booting, you will need to quickly change the boot op=
tion in GRUB,
+Once the FVP begins booting, you will need to quickly change the boot op=
tion in grub,
 to boot into recovery mode.=20
=20
 **NOTE:** This option will disappear quickly, so it's best to preempt it=
.
@@ -1212,11 +1235,21 @@ Proceed to edit the following files accordingly:
=20
 ::
=20
-  vi /etc/systemd/system.conf #Only applicable to Debian
+  #Only applicable to Debian
+  vi /etc/systemd/system.conf
   DefaultDeviceTimeoutSec=3Dinfinity
-  vi /usr/lib/systemd/system.conf # Only applicable to openSUSE
+
+::
+
+  #Only applicable to openSUSE
+  vi /usr/lib/systemd/system.conf
   DefaultDeviceTimeoutSec=3Dinfinity
=20
+  The system.conf has been moved from /etc/systemd/ to /usr/lib/systemd/=
 and directly modifying
+  the /usr/lib/systemd/system.conf is not working and it is getting over=
ridden. We have to create
+  drop ins system configurations in /etc/systemd/system.conf.d/ director=
y. So, copy the=20
+  /usr/lib/systemd/system.conf to /etc/systemd/system.conf.d/ directory =
after the mentioned modifications.
+
 The file to be edited next is different depending on the installed distr=
o:
=20
 ::
@@ -1242,6 +1275,8 @@ The user should see a login prompt after booting, f=
or example, for debian:
 Login with the username root and its corresponding password (already set=
 at
 installation time).
=20
+**NOTE:** Debian/OpenSUSE Timeouts are not applicable for all systems. S=
ome systems are faster than the others (especially when running the FVP) =
and works well with default timeouts. If the system boots to Debian or Op=
enSUSE unmodified, the user can skip this section.
+
 PSA API tests
 -------------
=20
@@ -1261,7 +1296,7 @@ First, load FF-A TEE kernel module:
=20
 ::
=20
-  insmod /lib/modules/*-yocto-standard/extra/arm-ffa-tee.ko
+  insmod /lib/modules/*-yocto-standard/updates/arm-ffa-tee.ko
=20
 Then, check whether the FF-A TEE driver is loaded correctly by using the=
 following command:
=20
@@ -1273,7 +1308,7 @@ The output should be:
=20
 ::
=20
-   arm_ffa_tee 16384 - - Live 0xffffffc000510000 (O)
+   arm_ffa_tee <ID> - - Live <address> (O)
=20
 Now, run the PSA API tests in the following order:
=20
--=20
2.25.1


