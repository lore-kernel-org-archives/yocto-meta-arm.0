Return-Path: <ali.oezaslan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CDE6C4167B
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 15:27:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10291.1698852471692213208
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Nov 2023 08:27:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ali.oezaslan@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E65AEC15;
	Wed,  1 Nov 2023 08:28:32 -0700 (PDT)
Received: from PW05BKJD.arm.com (PW05BKJD.arm.com [10.1.25.149])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30FB33F64C;
	Wed,  1 Nov 2023 08:27:49 -0700 (PDT)
From: ali.oezaslan@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Ali Can Ozaslan <ali.oezaslan@arm.com>
Subject: [PATCH 1/1] arm-bsp/documentation: corstone1000: Update the user guide
Date: Wed,  1 Nov 2023 15:27:32 +0000
Message-Id: <20231101152732.1060-2-ali.oezaslan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231101152732.1060-1-ali.oezaslan@arm.com>
References: <20231101152732.1060-1-ali.oezaslan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 Nov 2023 15:27:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5193

From: Ali Can Ozaslan <ali.oezaslan@arm.com>

Update capsule document procedure and ACS image in user guide.

Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
---
 .../documentation/corstone1000/user-guide.rst | 96 ++++++++++---------
 1 file changed, 52 insertions(+), 44 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index f2b1fd71..5dfbde6c 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -488,10 +488,10 @@ certifications of SystemReady-IR. To download the r=
epository, run command:
 ::
=20
   cd <_workspace>
-  git clone https://github.com/ARM-software/arm-systemready.git -b v21.0=
9_REL1.0
+  git clone https://github.com/ARM-software/arm-systemready.git
=20
 Once the repository is successfully downloaded, the prebuilt ACS live im=
age can be found in:
- - ``<_workspace>/arm-systemready/IR/prebuilt_images/v21.07_0.9_BETA/ir_=
acs_live_image.img.xz``
+ - ``<_workspace>/arm-systemready/IR/prebuilt_images/v23.03_2.0.0/ir-acs=
-live-image-generic-arm64.wic.xz``
=20
 **NOTE**: This prebuilt ACS image includes v5.13 kernel, which doesn't p=
rovide
 USB driver support for Corstone-1000. The ACS image with newer kernel ve=
rsion
@@ -505,9 +505,9 @@ USB drive. Run the following commands to prepare the =
ACS image in USB stick:
=20
 ::
=20
-  cd <_workspace>/arm-systemready/IR/prebuilt_images/v21.07_0.9_BETA
-  unxz ir_acs_live_image.img.xz
-  sudo dd if=3Dir_acs_live_image.img of=3D/dev/sdb iflag=3Ddirect oflag=3D=
direct bs=3D1M status=3Dprogress; sync
+  cd <_workspace>/arm-systemready/IR/prebuilt_images/v23.03_2.0.0
+  unxz ir-acs-live-image-generic-arm64.wic.xz
+  sudo dd if=3Dir-acs-live-image-generic-arm64.wic of=3D/dev/sdb iflag=3D=
direct oflag=3Ddirect bs=3D1M status=3Dprogress; sync
=20
 Once the USB stick with ACS image is prepared, the user should make sure=
 that
 ensure that only the USB stick with the ACS image is connected to the bo=
ard,
@@ -520,31 +520,30 @@ FVP instructions for ACS image and run
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 Download ACS image from:
- - ``https://gitlab.arm.com/systemready/acs/arm-systemready/-/tree/linux=
-5.17-rc7/IR/prebuilt_images/v22.04_1.0-Linux-v5.17-rc7``
+ - ``https://gitlab.arm.com/systemready/acs/arm-systemready/-/tree/main/=
IR/prebuilt_images/v23.03_2.0.0``
=20
 Use the below command to run the FVP with ACS image support in the
 SD card.
=20
 ::
=20
-  unxz ${<path-to-img>/ir_acs_live_image.img.xz}
+  unxz ${<path-to-img>/ir-acs-live-image-generic-arm64.wic.xz}
=20
-  tmux
-
-  <_workspace>/meta-arm/scripts/runfvp <_workspace>/build/tmp/deploy/ima=
ges/corstone1000-fvp/corstone1000-image-corstone1000-fvp.fvpconf -- -C bo=
ard.msd_mmc.p_mmc_file=3D"${<path-to-img>/ir_acs_live_image.img}"
+  <_workspace>/meta-arm/scripts/runfvp  --terminals=3Dxterm <_workspace>=
/build/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000=
-fvp.fvpconf -- -C board.msd_mmc.p_mmc_file=3D<path-to-img>/ir-acs-live-i=
mage-generic-arm64.wic
=20
 The test results can be fetched using following commands:
=20
 ::
=20
   sudo mkdir /mnt/test
-  sudo mount -o rw,offset=3D<offset_2nd_partition> <path-to-img>/ir_acs_=
live_image.img /mnt/test/
-  fdisk -lu <path-to-img>/ir_acs_live_image.img
+  sudo mount -o rw,offset=3D<offset_3rd_partition> <path-to-img>/ir-acs-=
live-image-generic-arm64.wic /mnt/test/
+  fdisk -lu <path-to-img>/ir-acs-live-image-generic-arm64.wic
   ->  Device                                                     Start  =
   End Sectors  Size Type
-      <path-to-img>/ir_acs_live_image_modified.img1    2048 1050622 1048=
575  512M Microsoft basic data
-      <path-to-img>/ir_acs_live_image_modified.img2 1050624 1153022  102=
399   50M Microsoft basic data
+       <path-to-img>/ir-acs-live-image-generic-arm64.wic1    2048  20684=
7  204800   100M Microsoft basic data
+       <path-to-img>/ir-acs-live-image-generic-arm64.wic2  206848 102423=
9  817392 399.1M Linux filesystem
+       <path-to-img>/ir-acs-live-image-generic-arm64.wic3 1026048 112844=
7  102400    50M Microsoft basic data
=20
-  ->   <offset_2nd_partition> =3D 1050624 * 512 (sector size) =3D 537919=
488
+  ->   <offset_3rd_partition> =3D 1026048 * 512 (sector size) =3D 525336=
576
=20
 The FVP will reset multiple times during the test, and it might take up =
to 1 day to finish
 the test. At the end of test, the FVP host terminal will halt showing a =
shell prompt.
@@ -580,15 +579,18 @@ A positive test case capsule which boots the platfo=
rm correctly until the Linux
 incorrect capsule (corrupted or outdated) which fails to boot to the hos=
t software.
=20
 Check the "Run SystemReady-IR ACS tests" section above to download and u=
npack the ACS image file
- - ``ir_acs_live_image.img.xz``
+ - ``ir-acs-live-image-generic-arm64.wic.xz``
+
=20
-Download edk2 under <_workspace>:
+Download u-boot under <_workspace> and install tools:
=20
 ::
=20
-  git clone https://github.com/tianocore/edk2.git
-  cd edk2
-  git checkout f2188fe5d1553ad1896e27b2514d2f8d0308da8a
+  git clone https://github.com/u-boot/u-boot.git
+  cd u-boot
+  git checkout 83aa0ed1e93e1ffac24888d98d37a5b04ed3fb07
+  make tools-only_defconfig
+  make tools-only
=20
 Download systemready-patch repo under <_workspace>:
 ::
@@ -613,13 +615,14 @@ generate a UEFI capsule.
 ::
=20
    cd <_workspace>
-   edk2/BaseTools/BinWrappers/PosixLike/GenerateCapsule -e -o cs1k_cap_m=
ps3_v6 --fw-version 6 \
-   --lsv 0 --guid    e2bb9c06-70e9-4b14-97a3-5a7913176e3f --verbose --up=
date-image-index  0 \
-   --verbose build/tmp/deploy/images/corstone1000-mps3/corstone1000_imag=
e.nopt
=20
-   edk2/BaseTools/BinWrappers/PosixLike/GenerateCapsule -e -o cs1k_cap_m=
ps3_v5 --fw-version 5 \
-   --lsv 0 --guid    e2bb9c06-70e9-4b14-97a3-5a7913176e3f --verbose --up=
date-image-index  0 \
-   --verbose build/tmp/deploy/images/corstone1000-mps3/corstone1000_imag=
e.nopt
+   ./u-boot/tools/mkeficapsule --monotonic-count 1 --private-key build/t=
mp/deploy/images/corstone1000-mps3/corstone1000_capsule_key.key \
+   --certificate build/tmp/deploy/images/corstone1000-mps3/corstone1000_=
capsule_cert.crt --index 1 --guid 989f3a4e-46e0-4cd0-9877-a25c70c01329 \
+   --fw-version 6 build/tmp/deploy/images/corstone1000-mps3/corstone1000=
_image.nopt cs1k_cap_mps3_v6
+
+   ./u-boot/tools/mkeficapsule --monotonic-count 1 --private-key build/t=
mp/deploy/images/corstone1000-mps3/corstone1000_capsule_key.key \
+   --certificate build/tmp/deploy/images/corstone1000-mps3/corstone1000_=
capsule_cert.crt --index 1 --guid 989f3a4e-46e0-4cd0-9877-a25c70c01329 \
+   --fw-version 5 build/tmp/deploy/images/corstone1000-mps3/corstone1000=
_image.nopt cs1k_cap_mps3_v5
=20
 Generating FVP Capsules
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -632,17 +635,16 @@ Generating FVP Capsules
 This will generate a file called "corstone1000_image.nopt" which will be=
 used to
 generate a UEFI capsule.
=20
-
 ::
=20
    cd <_workspace>
-   edk2/BaseTools/BinWrappers/PosixLike/GenerateCapsule -e -o cs1k_cap_f=
vp_v6 \
-   --fw-version 6 --lsv 0 --guid    e2bb9c06-70e9-4b14-97a3-5a7913176e3f=
 --verbose --update-image-index \
-   0 --verbose build/tmp/deploy/images/corstone1000-fvp/corstone1000_ima=
ge.nopt
+   ./u-boot/tools/mkeficapsule --monotonic-count 1 --private-key build/t=
mp/deploy/images/corstone1000-fvp/corstone1000_capsule_key.key \
+   --certificate build/tmp/deploy/images/corstone1000-fvp/corstone1000_c=
apsule_cert.crt --index 1 --guid 989f3a4e-46e0-4cd0-9877-a25c70c01329 \
+   --fw-version 6 build/tmp/deploy/images/corstone1000-fvp/corstone1000_=
image.nopt cs1k_cap_fvp_v6
=20
-   edk2/BaseTools/BinWrappers/PosixLike/GenerateCapsule -e -o cs1k_cap_f=
vp_v5 --fw-version 5 \
-   --lsv 0 --guid    e2bb9c06-70e9-4b14-97a3-5a7913176e3f --verbose --up=
date-image-index \
-   0 --verbose build/tmp/deploy/images/corstone1000-fvp/corstone1000_ima=
ge.nopt
+   ./u-boot/tools/mkeficapsule --monotonic-count 1 --private-key build/t=
mp/deploy/images/corstone1000-fvp/corstone1000_capsule_key.key \
+   --certificate build/tmp/deploy/images/corstone1000-fvp/corstone1000_c=
apsule_cert.crt --index 1 --guid 989f3a4e-46e0-4cd0-9877-a25c70c01329 \
+   --fw-version 5 build/tmp/deploy/images/corstone1000-fvp/corstone1000_=
image.nopt cs1k_cap_fvp_v5
=20
=20
 Common Notes for FVP and FPGA
@@ -681,7 +683,7 @@ First, mount the IR image:
 ::
=20
    sudo mkdir /mnt/test
-   sudo mount -o rw,offset=3D1048576 <path-to-img>/ir_acs_live_image.img=
  /mnt/test
+   sudo mount -o rw,offset=3D1048576 <path-to-img>/ir-acs-live-image-gen=
eric-arm64.wic  /mnt/test
=20
 Then, copy the capsules:
=20
@@ -700,14 +702,15 @@ Then, unmount the IR image:
 **NOTE:**
=20
 The size of first partition in the image file is calculated in the follo=
wing way. The data is
-just an example and might vary with different ir_acs_live_image.img file=
s.
+just an example and might vary with different ir-acs-live-image-generic-=
arm64.wic files.
=20
 ::
=20
-   fdisk -lu <path-to-img>/ir_acs_live_image.img
+   fdisk -lu <path-to-img>/ir-acs-live-image-generic-arm64.wic
    ->  Device                                                     Start =
    End Sectors  Size Type
-       <path-to-img>/ir_acs_live_image_modified.img1    2048 1050622 104=
8575  512M Microsoft basic data
-       <path-to-img>/ir_acs_live_image_modified.img2 1050624 1153022  10=
2399   50M Microsoft basic data
+       <path-to-img>/ir-acs-live-image-generic-arm64.wic1    2048  20684=
7  204800   100M Microsoft basic data
+       <path-to-img>/ir-acs-live-image-generic-arm64.wic2  206848 102423=
9  817392 399.1M Linux filesystem
+       <path-to-img>/ir-acs-live-image-generic-arm64.wic3 1026048 112844=
7  102400    50M Microsoft basic data
=20
    ->  <offset_1st_partition> =3D 2048 * 512 (sector size) =3D 1048576
=20
@@ -725,7 +728,12 @@ Run the FVP with the IR prebuilt image:
=20
 ::
=20
-   <_workspace>/meta-arm/scripts/runfvp --terminals=3Dxterm <_workspace>=
/build/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000=
-fvp.fvpconf -- -C "board.msd_mmc.p_mmc_file=3D${<path-to-img>/ir_acs_liv=
e_image.img}"
+   <_workspace>/meta-arm/scripts/runfvp --terminals=3Dxterm <_workspace>=
/build/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000=
-fvp.fvpconf -- -C board.msd_mmc.p_mmc_file=3D<path-to-img>/ir-acs-live-i=
mage-generic-arm64.wic
+
+**NOTE:**
+
+<path-to-img> must start from the root directory.
+make sure there are no spaces before or after of "=3D". board.msd_mmc.p_=
mmc_file=3D<path-to-img>/ir-acs-live-image-generic-arm64.wic.
=20
 Running the FPGA with the IR prebuilt image
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -796,7 +804,7 @@ Run the following commands in order to run the Corsto=
ne-1000 Linux kernel and be
 ::
=20
    $ unzip $kernel_addr 0x90000000
-   $ loadm 0x90000000 $kernel_addr_r 0xf00000
+   $ loadm 0x90000000 $kernel_addr_r $filesize
    $ bootefi $kernel_addr_r $fdtcontroladdr
=20
=20
@@ -834,7 +842,7 @@ In the Linux command-line run the following:
    # cat *
    =20
    0x0
-   e2bb9c06-70e9-4b14-97a3-5a7913176e3f
+   989f3a4e-46e0-4cd0-9877-a25c70c01329
    0
    6
    0
@@ -843,7 +851,7 @@ In the Linux command-line run the following:
=20
 .. line-block::
    capsule_flags:	0x0
-   fw_class:	e2bb9c06-70e9-4b14-97a3-5a7913176e3f
+   fw_class:	989f3a4e-46e0-4cd0-9877-a25c70c01329
    fw_type:	0
    fw_version:	6
    last_attempt_status:	0=20
@@ -899,7 +907,7 @@ In the Linux command-line run the following:
    # cat *
    =20
    0x0
-   e2bb9c06-70e9-4b14-97a3-5a7913176e3f
+   989f3a4e-46e0-4cd0-9877-a25c70c01329
    0
    6
    1
@@ -908,7 +916,7 @@ In the Linux command-line run the following:
=20
 .. line-block::
    capsule_flags:	0x0
-   fw_class:	e2bb9c06-70e9-4b14-97a3-5a7913176e3f
+   fw_class:	989f3a4e-46e0-4cd0-9877-a25c70c01329
    fw_type:	0
    fw_version:	6
    last_attempt_status:	1
--=20
2.34.1


