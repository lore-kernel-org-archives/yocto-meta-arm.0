Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CEDDC624B4
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 15:08:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.138899.1700838483551345686
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 24 Nov 2023 07:08:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A21B91063;
	Fri, 24 Nov 2023 07:08:49 -0800 (PST)
Received: from e126835.cambridge.arm.com (e126835.cambridge.arm.com [10.1.35.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9EE063F73F;
	Fri, 24 Nov 2023 07:08:01 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>,
	Delane Brandy <delane.brandy@arm.com>
Subject: [PATCH 2/3] arm-bsp/documentation: corstone1000: add a note and fix instructions
Date: Fri, 24 Nov 2023 15:07:49 +0000
Message-Id: <20231124150750.81497-3-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231124150750.81497-1-emekcan.aras@arm.com>
References: <20231124150750.81497-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 24 Nov 2023 15:08:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5277

From: Emekcan Aras <Emekcan.Aras@arm.com>

Add a note for Capsule update negative test scenario and fixes instructio=
ns
regarding distro-boot in Corstone-1000 user guide.

Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
Signed-off-by: Delane Brandy <delane.brandy@arm.com>
---
 .../documentation/corstone1000/user-guide.rst | 41 +++++++++++--------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index f07b971c..134ed41d 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -388,7 +388,7 @@ the testing.
=20
 Prepare EFI System Partition
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-Corstone-1000 FVP and MPS3 do not have enough on-chip nonvolatile memory=
 to host
+Corstone-1000 FVP and FPGA do not have enough on-chip nonvolatile memory=
 to host
 an EFI System Partition (ESP). Thus, Corstone-1000 uses mass storage dev=
ice for
 ESP. The instructions below should be followed for both FVP and FPGA bef=
ore
 running the ACS tests.
@@ -948,8 +948,8 @@ In the Linux command-line run the following:
    lowest_supported_fw_ver:	0
=20
=20
-Negative scenario
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Negative scenario (Applicable to FPGA only)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 In the negative case scenario (rollback the capsule version), the user s=
hould=20
 see appropriate logs in the secure enclave terminal.=20
@@ -1012,6 +1012,12 @@ In the Linux command-line run the following:
    last_attempt_version:	5
    lowest_supported_fw_ver:	0
=20
+**Note**: This test is currently not working properly in Corstone-1000 F=
VP.
+However, it is not part of the System-Ready IR tests, and it won't affec=
t the
+SR-IR certification. All the compulsory `capsule update tests for SR-IR
+<https://developer.arm.com/documentation/DUI1101/2-1/Test-SystemReady-IR=
/Test-UpdateCapsule>`__
+works on both Corstone-1000 FVP and FPGA.
+
 Linux distros tests
 -------------------
=20
@@ -1041,8 +1047,17 @@ documentation.
   cd meta-arm
   git am 0001-arm-bsp-u-boot-corstone1000-Skip-the-shim-by-booting.patch
   cd ..
+
+**On FPGA**
+::
+
   kas shell meta-arm/kas/corstone1000-mps3.yml:meta-arm/ci/debug.yml -c=3D=
"bitbake u-boot trusted-firmware-a corstone1000-image -c cleansstate; bit=
bake corstone1000-image"
=20
+**On FVP**
+::
+
+  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c=3D=
"bitbake u-boot trusted-firmware-a corstone1000-image -c cleansstate; bit=
bake corstone1000-image"
+
 On FPGA, please update the cs1000.bin on the SD card with the newly gene=
rated wic file.
=20
 *************************************************
@@ -1051,12 +1066,11 @@ Preparing the Installation Media
=20
 Download one of following Linux distro images:
  - `Debian installer image <https://cdimage.debian.org/debian-cd/current=
/arm64/iso-dvd/>`__ (Tested on: debian-12.2.0-arm64-DVD-1.iso)
- - `OpenSUSE Tumbleweed installer image <http://download.opensuse.org/po=
rts/aarch64/tumbleweed/iso/>`__ (Tested on: openSUSE-Tumbleweed-DVD-aarch=
64-Snapshot20231105-Media.iso)
+ - `OpenSUSE Tumbleweed installer image <http://download.opensuse.org/po=
rts/aarch64/tumbleweed/iso/>`__ (Tested on: openSUSE-Tumbleweed-DVD-aarch=
64-Snapshot20231120-Media.iso)
  =20
 **NOTE:** For OpenSUSE Tumbleweed, the user should look for a DVD Snapsh=
ot like
 openSUSE-Tumbleweed-DVD-aarch64-Snapshot<date>-Media.iso
=20
-Once the iso file is downloaded, it needs to be flashed to your drive as=
 explained in the next paragraphs.
=20
 FPGA
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
@@ -1082,17 +1096,10 @@ following command in the development machine:
 FVP
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
=20
-To test Linux distro install and boot on FVP, the user should prepare tw=
o mmc images.
-One containing the OS-DVD image and another with a minimum size of 8GB f=
ormatted with gpt.
-
-The downloaded iso file needs to be flashed to one of your mmc images.=20
-
+To test Linux distro install and boot on FVP, the user should prepare an=
 mmc image.
+With a minimum size of 8GB formatted with gpt.
=20
 ::
-
-  #Generating mmc1=20
-  sudo dd if=3D<path-to-iso_file> of=3D<_workspace>/mmc1.iso iflag=3Ddir=
ect oflag=3Ddirect status=3Dprogress bs=3D1M; sync;
- =20
   #Generating mmc2
   dd if=3D/dev/zero of=3D<_workspace>/mmc2_file.img bs=3D1 count=3D0 see=
k=3D8G; sync;
   parted -s mmc2_file.img mklabel gpt
@@ -1127,7 +1134,7 @@ FVP
=20
 ::
=20
-  <_workspace>/meta-arm/scripts/runfvp --terminals=3Dxterm <_workspace>/=
build/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000-=
fvp.fvpconf -- -C board.msd_mmc.p_mmc_file=3D"<_workspace>/mmc1.iso" -C b=
oard.msd_mmc_2.p_mmc_file=3D"<_workspace>/mmc2_file.img"
+  <_workspace>/meta-arm/scripts/runfvp --terminals=3Dxterm <_workspace>/=
build/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000-=
fvp.fvpconf -- -C board.msd_mmc.p_mmc_file=3D"<path-to-iso_file>" -C boar=
d.msd_mmc_2.p_mmc_file=3D"<_workspace>/mmc2_file.img"
=20
 The installer should now start.
 The os will be installed on the second mmc 'mmc2_file.img'.=20
@@ -1205,7 +1212,9 @@ Proceed to edit the following files accordingly:
=20
 ::
=20
-  vi /etc/systemd/system.conf
+  vi /etc/systemd/system.conf #Only applicable to Debian
+  DefaultDeviceTimeoutSec=3Dinfinity
+  vi /usr/lib/systemd/system.conf # Only applicable to openSUSE
   DefaultDeviceTimeoutSec=3Dinfinity
=20
 The file to be edited next is different depending on the installed distr=
o:
--=20
2.25.1


