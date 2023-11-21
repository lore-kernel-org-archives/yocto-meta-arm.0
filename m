Return-Path: <delane.brandy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9728EC61D92
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 14:15:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.41478.1700576131148627009
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Nov 2023 06:15:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: delane.brandy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A22EFEC;
	Tue, 21 Nov 2023 06:16:17 -0800 (PST)
Received: from e127094.cambridge.arm.com (e127094.arm.com [10.1.33.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B56FC3F7A6;
	Tue, 21 Nov 2023 06:15:29 -0800 (PST)
From: delane.brandy@arm.com
To: meta-arm@lists.yoctoproject.org,
	jon.mason@arm.com
Cc: nd@arm.com,
	Delane Brandy <delane.brandy@arm.com>
Subject: [PATCH nanbield] arm-bsp/documentation: corstone1000: Update the user guide
Date: Tue, 21 Nov 2023 14:15:15 +0000
Message-Id: <20231121141515.271536-1-delane.brandy@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 Nov 2023 14:15:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5245

From: Delane Brandy <delane.brandy@arm.com>

Update the user guide to include Linux distro installation on fvp

Signed-off-by: Delane Brandy <delane.brandy@arm.com>
---
 .../documentation/corstone1000/user-guide.rst | 140 +++++++++++-------
 1 file changed, 87 insertions(+), 53 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 838a04f1..4f4cd43d 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -927,15 +927,15 @@ Linux distros tests
 -------------------
=20
 *************************************************************
-Debian install and boot preparation (applicable to FPGA only)
+Debian install and boot preparation=20
 *************************************************************
=20
 There is a known issue in the `Shim 15.7 <https://salsa.debian.org/efi-t=
eam/shim/-/tree/upstream/15.7?ref_type=3Dtags>`__
 provided with the Debian installer image (see below). This bug causes a =
fatal
-error when attempting to boot media installer for Debian, and it resets =
the MPS3 before installation starts.
+error when attempting to boot media installer for Debian, and it resets =
the platform before installation starts.
 A patch to be applied to the Corstone-1000 stack (only applicable when
 installing Debian) is provided to
-`Skip the Shim <https://gitlab.arm.com/arm-reference-solutions/systemrea=
dy-patch/-/blob/CORSTONE1000-2023.06/embedded-a/corstone1000/shim/0001-ar=
m-bsp-u-boot-corstone1000-Skip-the-shim-by-booting.patch>`__.
+`Skip the Shim <https://gitlab.arm.com/arm-reference-solutions/systemrea=
dy-patch/-/blob/CORSTONE1000-2023.11/embedded-a/corstone1000/shim/0001-ar=
m-bsp-u-boot-corstone1000-Skip-the-shim-by-booting.patch>`__.
 This patch makes U-Boot automatically bypass the Shim and run grub and a=
llows
 the user to proceed with a normal installation. If at the moment of read=
ing this
 document the problem is solved in the Shim, the user is encouraged to tr=
y the
@@ -947,31 +947,36 @@ documentation.
 ::
=20
   cd <_workspace>
-  git clone https://git.gitlab.arm.com/arm-reference-solutions/systemrea=
dy-patch.git -b CORSTONE1000-2023.06
+  git clone https://git.gitlab.arm.com/arm-reference-solutions/systemrea=
dy-patch.git -b CORSTONE1000-2023.11
   cp -f systemready-patch/embedded-a/corstone1000/shim/0001-arm-bsp-u-bo=
ot-corstone1000-Skip-the-shim-by-booting.patch meta-arm
   cd meta-arm
   git am 0001-arm-bsp-u-boot-corstone1000-Skip-the-shim-by-booting.patch
   cd ..
   kas shell meta-arm/kas/corstone1000-mps3.yml:meta-arm/ci/debug.yml -c=3D=
"bitbake u-boot trusted-firmware-a corstone1000-image -c cleansstate; bit=
bake corstone1000-image"
=20
-Please update the cs1000.bin on the SD card with the newly generated wic=
 file.
+On FPGA, please update the cs1000.bin on the SD card with the newly gene=
rated wic file.
=20
 *************************************************
-Debian/openSUSE install (applicable to FPGA only)
+Preparing the Installation Media
 *************************************************
=20
-To test Linux distro install and boot, the user should prepare two empty=
 USB
-sticks (minimum size should be 4GB and formatted with FAT32).
-
 Download one of following Linux distro images:
- - `Debian 12.0.0 installer image <https://cdimage.debian.org/debian-cd/=
current/arm64/iso-dvd/debian-12.0.0-arm64-DVD-1.iso>`__
- - `OpenSUSE Tumbleweed installer image <http://download.opensuse.org/po=
rts/aarch64/tumbleweed/iso/>`__
-
+ - `Debian installer image <https://cdimage.debian.org/debian-cd/current=
/arm64/iso-dvd/>`__ (Tested on: debian-12.2.0-arm64-DVD-1.iso)
+ - `OpenSUSE Tumbleweed installer image <http://download.opensuse.org/po=
rts/aarch64/tumbleweed/iso/>`__ (Tested on: openSUSE-Tumbleweed-DVD-aarch=
64-Snapshot20231105-Media.iso)
+ =20
 **NOTE:** For OpenSUSE Tumbleweed, the user should look for a DVD Snapsh=
ot like
 openSUSE-Tumbleweed-DVD-aarch64-Snapshot<date>-Media.iso
=20
-Once the iso file is downloaded, the iso file needs to be flashed to you=
r USB
-drive. This can be done with your development machine.
+Once the iso file is downloaded, it needs to be flashed to your drive as=
 explained in the next paragraphs.
+
+FPGA
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+
+To test Linux distro install and boot on FPGA, the user should prepare t=
wo empty USB
+sticks (minimum size should be 4GB and formatted with FAT32).
+
+The downloaded iso file needs to be flashed to your USB drive.=20
+This can be done with your development machine.
=20
 In the example given below, we assume the USB device is ``/dev/sdb`` (th=
e user
 should use the `lsblk` command to confirm).
@@ -984,6 +989,33 @@ following command in the development machine:
=20
   sudo dd if=3D<path-to-iso_file> of=3D/dev/sdb iflag=3Ddirect oflag=3Dd=
irect status=3Dprogress bs=3D1M; sync;
=20
+
+FVP
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+
+To test Linux distro install and boot on FVP, the user should prepare tw=
o mmc images.
+One containing the OS-DVD image and another with a minimum size of 8GB f=
ormatted with gpt.
+
+The downloaded iso file needs to be flashed to one of your mmc images.=20
+
+
+::
+
+  #Generating mmc1=20
+  sudo dd if=3D<path-to-iso_file> of=3D<_workspace>/mmc1.iso iflag=3Ddir=
ect oflag=3Ddirect status=3Dprogress bs=3D1M; sync;
+ =20
+  #Generating mmc2
+  dd if=3D/dev/zero of=3D<_workspace>/mmc2_file.img bs=3D1 count=3D0 see=
k=3D8G; sync;
+  parted -s mmc2_file.img mklabel gpt
+
+
+*************************************************
+Debian/openSUSE install
+*************************************************
+
+FPGA
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+
 Unplug the first USB stick from the development machine and connect it t=
o the
 MSP3 board. At this moment, only the first USB stick should be connected=
. Open
 the following picocom sessions in your development machine:
@@ -1001,8 +1033,18 @@ the process.
 **NOTE:** Due to the performance limitation of Corstone-1000 MPS3 FPGA, =
the
 distro installation process can take up to 24 hours to complete.
=20
+FVP
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+
+::
+
+  <_workspace>/meta-arm/scripts/runfvp --terminals=3Dxterm <_workspace>/=
build/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000-=
fvp.fvpconf -- -C board.msd_mmc.p_mmc_file=3D"<_workspace>/mmc1.iso" -C b=
oard.msd_mmc_2.p_mmc_file=3D"<_workspace>/mmc2_file.img"
+
+The installer should now start.
+The os will be installed on the second mmc 'mmc2_file.img'.=20
+
 *******************************************************
-Debian install clarifications (applicable to FPGA only)
+Debian install clarifications
 *******************************************************
=20
 As the installation process for Debian is different than the one for ope=
nSUSE,
@@ -1040,21 +1082,44 @@ popups:
 8. At this stage, the installation should proceed as normal.
=20
 *****************************************************************
-Debian/openSUSE boot after installation (applicable to FPGA only)
+Debian/openSUSE boot after installation
 *****************************************************************
=20
+FPGA
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 Once the installation is complete, unplug the first USB stick and reboot=
 the
 board.
 The board will then enter recovery mode, from which the user can access =
a shell
-after entering the password for the root user. Proceed to edit the follo=
wing
-files accordingly:
+after entering the password for the root user.=20
+
+FVP
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Once the installation is complete, you will need to exit the shell insta=
nce=20
+and run this command to boot into the installed OS:
+
+::=20
+
+  <_workspace>/meta-arm/scripts/runfvp --terminals=3Dxterm <_workspace>/=
build/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000-=
fvp.fvpconf -- -C board.msd_mmc.p_mmc_file=3D"<_workspace>/mmc2_file.img"
+
+
+Once the FVP begins booting, you will need to quickly change the boot op=
tion in GRUB,
+to boot into recovery mode.=20
+
+**NOTE:** This option will disappear quickly, so it's best to preempt it=
.
+
+Select 'Advanced Options for '<OS>' and then '<OS> (recovery mode)'.=20
+
+Common
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Proceed to edit the following files accordingly:
=20
 ::
=20
   vi /etc/systemd/system.conf
   DefaultDeviceTimeoutSec=3Dinfinity
=20
-The file to be editted next is different depending on the installed dist=
ro:
+The file to be edited next is different depending on the installed distr=
o:
=20
 ::
=20
@@ -1068,8 +1133,9 @@ To make sure the changes are applied, please run:
=20
   systemctl daemon-reload
=20
-After applying the previous commands, please reboot the board. The user =
should
-see a login prompt after booting, for example, for debian:
+After applying the previous commands, please reboot the board or restart=
 the runfvp command.
+
+The user should see a login prompt after booting, for example, for debia=
n:
=20
 ::
=20
@@ -1078,38 +1144,6 @@ see a login prompt after booting, for example, for=
 debian:
 Login with the username root and its corresponding password (already set=
 at
 installation time).
=20
-************************************************************
-OpenSUSE Raw image install and boot (applicable to FVP only)
-************************************************************
-
-Steps to download OpenSUSE Tumbleweed raw image:
-  - Under `OpenSUSE Tumbleweed appliances <http://download.opensuse.org/=
ports/aarch64/tumbleweed/appliances/>`__
-  - The user should look for a Tumbleweed-ARM-JeOS-efi.aarch64-* Snapsho=
t, for example,
-    ``openSUSE-Tumbleweed-ARM-JeOS-efi.aarch64-<date>-Snapshot<date>.raw=
.xz``
-
-Once the .raw.xz file is downloaded, the raw image file needs to be extr=
acted:
-
-::
-
-   unxz <file-name.raw.xz>
-
-
-The above command will generate a file ending with extension .raw image.=
 Now, use the following command
-to run FVP with raw image installation process.
-
-::
-
-   <_workspace>/meta-arm/scripts/runfvp --terminals=3Dxterm <_workspace>=
/build/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000=
-fvp.fvpconf -- -C board.msd_mmc.p_mmc_file=3D"${openSUSE raw image file =
path}"
-
-After successfully installing and booting the Linux distro, the user sho=
uld see
-a openSUSE login prompt.
-
-::
-
-   localhost login:
-
-Login with the username 'root' and password 'linux'.
-
 PSA API tests
 -------------
=20
--=20
2.34.1


