Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA7EEB64DC
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 14:40:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.25670.1688654406263421982
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 07:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 177CAD75;
	Thu,  6 Jul 2023 07:40:48 -0700 (PDT)
Received: from e126835.cambridge.arm.com (e126835.cambridge.arm.com [10.1.27.128])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 059173F762;
	Thu,  6 Jul 2023 07:40:04 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH 2/2] arm-bsp/documentation: corstone1000: update user guide
Date: Thu,  6 Jul 2023 15:39:54 +0100
Message-Id: <20230706143954.69680-3-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230706143954.69680-1-emekcan.aras@arm.com>
References: <20230706143954.69680-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Jul 2023 14:40:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4860

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Adding extra details to corstone1000 user guide.

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
---
 .../documentation/corstone1000/user-guide.rst | 58 +++++++++++++++----
 1 file changed, 46 insertions(+), 12 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 5937ff82..a5ccb313 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -203,7 +203,7 @@ Flash the firmware image on FPGA
=20
 The user should download the FPGA bit file image ``AN550:  Arm=C2=AE Cor=
stone=E2=84=A2-1000 for MPS3 Version 2.0``
 from `this link <https://developer.arm.com/tools-and-software/developmen=
t-boards/fpga-prototyping-boards/download-fpga-images>`__
-and under the section ``Arm=C2=AE Corstone=E2=84=A2-1000 for MPS3``.
+and under the section ``Arm=C2=AE Corstone=E2=84=A2-1000 for MPS3``. The=
 download is available after logging in.
=20
 The directory structure of the FPGA bundle is shown below.
=20
@@ -428,8 +428,14 @@ software stack and flash the FPGA as normal. And con=
tinue the testing.
 Run SystemReady-IR ACS tests
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
=20
+Architecture Compliance Suite (ACS) is used to ensure architectural comp=
liance
+across different implementations of the architecture. Arm Enterprise ACS
+includes a set of examples of the invariant behaviors that are provided =
by a
+set of specifications for enterprise systems (For example: SBSA, SBBR, e=
tc.),
+so that implementers can verify if these behaviours have been interprete=
d correctly.
+
 ACS image contains two partitions. BOOT partition and RESULT partition.
-Following packages are under BOOT partition
+Following test suites and bootable applications are under BOOT partition=
:
=20
  * SCT
  * FWTS
@@ -438,6 +444,24 @@ Following packages are under BOOT partition
  * grub
  * uefi manual capsule application
=20
+BOOT partition contains the following:
+
+::
+
+    =E2=94=9C=E2=94=80=E2=94=80 EFI
+    =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 BOOT
+    =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 app
+    =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 bbr
+    =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 bootaa64.efi
+    =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 bsa
+    =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 debug
+    =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 Shell.efi
+    =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 startup.nsh
+    =E2=94=9C=E2=94=80=E2=94=80 grub
+    =E2=94=9C=E2=94=80=E2=94=80 grub.cfg
+    =E2=94=9C=E2=94=80=E2=94=80 Image
+    =E2=94=94=E2=94=80=E2=94=80 ramdisk-busybox.img
+
 RESULT partition is used to store the test results.
 **NOTE**: PLEASE MAKE SURE THAT THE RESULT PARTITION IS EMPTY BEFORE YOU=
 START THE TESTING. OTHERWISE THE TEST RESULTS
 WILL NOT BE CONSISTENT
@@ -481,7 +505,8 @@ Once the USB stick with ACS image is prepared, the us=
er should make sure that
 ensure that only the USB stick with the ACS image is connected to the bo=
ard,
 and then boot the board.
=20
-The FPGA will reset multiple times during the test, and it might take ap=
prox. 24-36 hours to finish the test. At the end of test, the FPGA host t=
erminal will halt showing a shell prompt. Once test is finished the resul=
t can be copied following above instructions.
+The FPGA will reset multiple times during the test, and it might take ap=
prox. 24-36 hours to finish the test.
+
=20
 FVP instructions for ACS image and run
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -554,6 +579,8 @@ Download edk2 under <_workspace>:
 ::
=20
   git clone https://github.com/tianocore/edk2.git
+  cd edk2
+  git checkout f2188fe5d1553ad1896e27b2514d2f8d0308da8a
=20
 Download systemready-patch repo under <_workspace>:
 ::
@@ -564,11 +591,6 @@ Download systemready-patch repo under <_workspace>:
 Generating Capsules
 *******************
=20
-The capsule binary size (wic file) should be less than 15 MB.
-
-Based on the user's requirement, the user can change the firmware versio=
n
-number given to ``--fw-version`` option (the version number needs to be =
>=3D 1).
-
 Generating FPGA Capsules
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
@@ -614,6 +636,16 @@ generate a UEFI capsule.
    --lsv 0 --guid    e2bb9c06-70e9-4b14-97a3-5a7913176e3f --verbose --up=
date-image-index \
    0 --verbose build/tmp/deploy/images/corstone1000-fvp/corstone1000_ima=
ge.nopt
=20
+
+Common Notes for FVP and FPGA
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+
+The capsule binary size (wic file) should be less than 15 MB.
+
+Based on the user's requirement, the user can change the firmware versio=
n
+number given to ``--fw-version`` option (the version number needs to be =
>=3D 1).
+
+
 ****************
 Copying Capsules
 ****************
@@ -621,7 +653,7 @@ Copying Capsules
 Copying the FPGA capsules
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
=20
-The user should prepare a USB stick as explained in ACS image section (s=
ee above).
+The user should prepare a USB stick as explained in ACS image section `F=
PGA instructions for ACS image`_.
 Place the generated ``cs1k_cap`` files in the root directory of the boot=
 partition
 in the USB stick. Note: As we are running the direct method, the ``cs1k_=
cap`` file
 should not be under the EFI/UpdateCapsule directory as this may or may n=
ot trigger
@@ -685,7 +717,7 @@ Run the FVP with the IR prebuilt image:
=20
 ::
=20
-   <_workspace>/meta-arm/scripts/runfvp --terminals=3Dxterm <_workspace>=
/build/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000=
-fvp.fvpconf -- -C "board.msd_mmc.p_mmc_file ${<path-to-img>/ir_acs_live_=
image.img}"
+   <_workspace>/meta-arm/scripts/runfvp --terminals=3Dxterm <_workspace>=
/build/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000=
-fvp.fvpconf -- -C "board.msd_mmc.p_mmc_file=3D${<path-to-img>/ir_acs_liv=
e_image.img}"
=20
 Running the FPGA with the IR prebuilt image
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -884,7 +916,7 @@ Debian install and boot preparation (applicable to FP=
GA only)
=20
 There is a known issue in the `Shim 15.7 <https://salsa.debian.org/efi-t=
eam/shim/-/tree/upstream/15.7?ref_type=3Dtags>`__
 provided with the Debian installer image (see below). This bug causes a =
fatal
-error when attempting to install Debian.
+error when attempting to boot media installer for Debian, and it resets =
the MPS3 before installation starts.
 A patch to be applied to the Corstone-1000 stack (only applicable when
 installing Debian) is provided to
 `Skip the Shim <https://gitlab.arm.com/arm-reference-solutions/systemrea=
dy-patch/-/blob/CORSTONE1000-2023.06/embedded-a/corstone1000/shim/0001-ar=
m-bsp-u-boot-corstone1000-Skip-the-shim-by-booting.patch>`__.
@@ -906,6 +938,8 @@ documentation.
   cd ..
   kas shell meta-arm/kas/corstone1000-mps3.yml -c=3D"bitbake u-boot trus=
ted-firmware-a corstone1000-image -c cleansstate; bitbake corstone1000-im=
age"
=20
+Please update the cs1000.bin on the SD card with the newly generated wic=
 file.
+
 *************************************************
 Debian/openSUSE install (applicable to FPGA only)
 *************************************************
@@ -1079,7 +1113,7 @@ First, load FF-A TEE kernel module:
=20
 ::
=20
-  insmod /lib/modules/6.1.25-yocto-standard/extra/arm-ffa-tee.ko
+  insmod /lib/modules/6.1.32-yocto-standard/extra/arm-ffa-tee.ko
=20
 Then, check whether the FF-A TEE driver is loaded correctly by using the=
 following command:
=20
--=20
2.25.1


