Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D92BC10F16
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 16:30:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20351.1714494612303217881
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 09:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61CA7339;
	Tue, 30 Apr 2024 09:30:38 -0700 (PDT)
Received: from e126835.cambridge.arm.com (e126835.cambridge.arm.com [10.1.29.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 56C763F73F;
	Tue, 30 Apr 2024 09:30:11 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Drew Reed <Drew.Reed@arm.com>
Subject: [PATCH 5/6] arm-bsp/corstone1000: Update Corstone-1000 user guide
Date: Tue, 30 Apr 2024 17:29:56 +0100
Message-Id: <20240430162957.94499-6-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240430162957.94499-1-emekcan.aras@arm.com>
References: <20240430162957.94499-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 16:30:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5670

From: Drew Reed <Drew.Reed@arm.com>

Update the Corstone-1000 user guide with the new instructions on how to
build/use an ESP image and how to use the meta-arm-systemready layer to
run the ACS tests.

Signed-off-by: Drew Reed <Drew.Reed@arm.com>
---
 .../documentation/corstone1000/user-guide.rst | 132 ++++--------------
 1 file changed, 27 insertions(+), 105 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 073ea213..4b15d6c3 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -395,77 +395,12 @@ running the ACS tests.
=20
 **Common to FVP and FPGA:**
=20
-#. Create an empty 100 MB partition:
-   ::
-
-      dd if=3D/dev/zero of=3Dcorstone1000-efi-partition.img iflag=3Dfull=
block bs=3D512 count=3D204800 && sync
-
-#. Use OpenSuse Raw image to copy the contents of EFI partition.
-
-   To download OpenSUSE Tumbleweed raw image:
-     - Under `OpenSUSE Tumbleweed appliances <http://download.opensuse.o=
rg/ports/aarch64/tumbleweed/appliances/>`__
-     - The user should look for a Tumbleweed-ARM-JeOS-efi.aarch64-* Snap=
shot, for example,
-       ``openSUSE-Tumbleweed-ARM-JeOS-efi.aarch64-<date>-Snapshot<date>.=
raw.xz``
-
-   Once the .raw.xz file is downloaded, the raw image file needs to be e=
xtracted:
-
-   ::
-
-      unxz <file-name.raw.xz>
-
-
-   The above command will generate a file ending with extension .raw ima=
ge. Use the
-   following command to get address of the first partition
-
-   ::
-
-     fdisk -lu <path-to-img>/openSUSE-Tumbleweed-ARM-JeOS-efi.aarch64-<d=
ate>-Snapshot<date>.raw
-     ->  Device                                                         =
                      Start     End  Sectors  Size Type
-          <path-to-img>/openSUSE-Tumbleweed-ARM-JeOS-efi.aarch64-<date>-=
Snapshot<date>.raw1    8192   40959    32768   16M EFI System
-          <path-to-img>/openSUSE-Tumbleweed-ARM-JeOS-efi.aarch64-<date>-=
Snapshot<date>.raw2   40960 1064959  1024000  500M Linux swap
-          <path-to-img>/openSUSE-Tumbleweed-ARM-JeOS-efi.aarch64-<date>-=
Snapshot<date>.raw3 1064960 5369822  4304863  2.1G Linux filesystem
-
-     ->   <blockaddress_1st_partition> =3D 8192
-     ->   <sectorsize_1st_partition> =3D 32768
-
-#. Copy the ESP from opensuse image to empty image:
-
-   ::
-
-     dd conv=3Dnotrunc if=3DopenSUSE-Tumbleweed-ARM-JeOS-efi.aarch64-<da=
te>-Snapshot<date>.raw skip=3D<blockaddress_1st_partition> of=3Dcorstone1=
000-efi-partition.img seek=3D<blockaddress_1st_partition> iflag=3Dfullblo=
ck seek=3D<blockaddress_1st_partition> bs=3D512 count=3D<sectorsize_1s_pa=
rtition> && sync
-
-
-#. Create the file efi_disk.layout locally. Copy the content of provided=
 disk layout below to the efi_disk.layout to label the ESP correctly.
-
-   efi_disk.layout
-   ::
-
-     label: gpt
-     label-id: AC53D121-B818-4515-9031-BE02CCEB8701
-     device: corstone1000-efi-partition.img
-     unit: sectors
-     first-lba: 34
-     last-lba: 204766
-
-     corstone1000-efi-partition.img : start=3D8192, size=3D32768, type=3D=
C12A7328-F81F-11D2-BA4B-00A0C93EC93B, uuid=3D792D821F-98AE-46E3-BABD-9480=
03A650F8, name=3D"p.UEFI"
-
-   And use the following command the label the newly created ESP.
-
-   ::
-
-      sfdisk corstone1000-efi-partition.img < efi_disk.layout
-
-   To test the image, you can now mount the disk image
-
-   ::
-
-      fdisk -lu corstone1000-efi-partition.img
-      ->  Device                          Start   End Sectors Size Type
-          corstone1000-efi-partition.img1  8192 40959   32768  16M EFI S=
ystem
-
-          <offset_1st_partition> =3D 8192 * 512 (sector size) =3D 419430=
4
+::
+  kas build meta-arm/kas/corstone1000-{mps3,fvp}.yml:meta-arm/ci/debug.y=
ml --target corstone1000-esp-image
=20
-      sudo mount -o loop,offset=3D4194304 corstone1000-efi-partition.img=
 /mount_point
+Once the build is successful ``corstone1000-esp-image-corstone1000-{mps3=
,fvp}.wic`` will be available in either:
+ - ``<_workspace>/build/tmp/deploy/images/corstone1000-fvp/`` folder for=
 FVP build;
+ - ``<_workspace>/build/tmp/deploy/images/corstone1000-mps3/`` folder fo=
r FPGA build.
=20
 **Using ESP in FPGA:**
=20
@@ -476,19 +411,16 @@ confirm). Be cautious here and don't confuse your h=
ost machine own hard drive wi
 USB drive. Run the following commands to prepare the ACS image in USB st=
ick:
=20
 ::
-
-   sudo dd if=3Dcorstone1000-efi-partition.img of=3D/dev/sdb iflag=3Ddir=
ect oflag=3Ddirect status=3Dprogress bs=3D512; sync;
+   sudo dd if=3Dcorstone1000-esp-image-corstone1000-mps3.wic of=3D/dev/s=
db iflag=3Ddirect oflag=3Ddirect status=3Dprogress bs=3D512; sync;
=20
 Now you can plug this USB stick to the board together with ACS test USB =
stick.
=20
 **Using ESP in FVP:**
=20
-The ESP disk image can directly be used in Corstone-1000 FVP by simply p=
assing it as
-the 2nd MMC card image.
+The ESP disk image once created will be used automatically in the Corsto=
ne-1000 FVP as the 2nd MMC card image.
=20
 ::
-
-   kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c =
"../meta-arm/scripts/runfvp -- -C board.msd_mmc.p_mmc_file=3D"${<path-to-=
img>/ir_acs_live_image.img}" -C board.msd_mmc_2.p_mmc_file=3D"${<path-to-=
img>/corstone1000-efi-partition.img}"
+   kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c =
"../meta-arm/scripts/runfvp -- -C board.msd_mmc.p_mmc_file=3D"${<path-to-=
img>/ir_acs_live_image.img}"
=20
 Clean Secure Flash Before Testing (applicable to FPGA only)
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -616,36 +548,16 @@ the platform is booted to linux at the end of the A=
CS tests.
 FVP instructions for ACS image and run
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-Download ACS image from:
- - ``https://gitlab.arm.com/systemready/acs/arm-systemready/-/tree/main/=
IR/prebuilt_images/v23.03_2.0.0``
-
-Use the below command to run the FVP with EFI and ACS image support in t=
he
-SD cards.
-
+The FVP has been integrated in the meta-arm-systemready layer so the run=
ning of the ACS tests can be handled automatically as follows
 ::
=20
-  unxz ${<path-to-img>/ir-acs-live-image-generic-arm64.wic.xz}
-
-  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c "=
../meta-arm/scripts/runfvp --terminals=3Dxterm -- -C board.msd_mmc.p_mmc_=
file=3D<path-to-img>/ir-acs-live-image-generic-arm64.wic -C board.msd_mmc=
_2.p_mmc_file=3D"${<path-to-img>/corstone1000-efi-partition.img}"
+  kas build meta-arm/ci/corstone1000-fvp.yml:meta-arm/ci/debug.yml:kas/a=
rm-systemready-ir-acs.yml
=20
-The test results can be fetched using following commands:
-
-::
-
-  sudo mkdir /mnt/test
-  sudo mount -o rw,offset=3D<offset_3rd_partition> <path-to-img>/ir-acs-=
live-image-generic-arm64.wic /mnt/test/
-  fdisk -lu <path-to-img>/ir-acs-live-image-generic-arm64.wic
-  ->  Device                                                     Start  =
   End Sectors  Size Type
-       <path-to-img>/ir-acs-live-image-generic-arm64.wic1    2048  20684=
7  204800   100M Microsoft basic data
-       <path-to-img>/ir-acs-live-image-generic-arm64.wic2  206848 102423=
9  817392 399.1M Linux filesystem
-       <path-to-img>/ir-acs-live-image-generic-arm64.wic3 1026048 112844=
7  102400    50M Microsoft basic data
+The details of how this layer works can be found in : ``<_workspace>/met=
a-arm-systemready/README.md``
=20
-  ->   <offset_3rd_partition> =3D 1026048 * 512 (sector size) =3D 525336=
576
+**NOTE:** You can't use the standard meta-arm/kas/corstone1000-fvp.yml k=
as file as it sets the build up for only building firmware
=20
-The FVP will reset multiple times during the test, and it might take up =
to 1 day to finish
-the test. At the end of test, the FVP host terminal will halt showing a =
shell prompt.
-Once test is finished, the FVP can be stoped, and result can be copied f=
ollowing above
-instructions.
+**NOTE:** These test might take up to 1 day to finish
=20
 **NOTE:** A rare issue has been noticed (5-6% occurence) during which th=
e FVP hangs during booting the system while running ACS tests.
 If this happens, please apply the following patch, rebuild the software =
stack for FVP and re-run the ACS tests.
@@ -796,12 +708,24 @@ the on disk method.
 Copying the FVP capsules
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-First, mount the IR image:
+First, Find the 1st partition offset:
+
+::
+
+  fdisk -lu <path-to-img>/ir-acs-live-image-generic-arm64.wic
+  ->  Device                                                     Start  =
   End Sectors  Size Type
+       <path-to-img>/ir-acs-live-image-generic-arm64.wic1    2048  20684=
7  204800   100M Microsoft basic data
+       <path-to-img>/ir-acs-live-image-generic-arm64.wic2  206848 102423=
9  817392 399.1M Linux filesystem
+       <path-to-img>/ir-acs-live-image-generic-arm64.wic3 1026048 112844=
7  102400    50M Microsoft basic data
+
+  ->   <offset_3rd_partition> =3D 2048 * 512 (sector size) =3D 1048576
+
+Next, mount the IR image:
=20
 ::
=20
    sudo mkdir /mnt/test
-   sudo mount -o rw,offset=3D1048576 <path-to-img>/ir-acs-live-image-gen=
eric-arm64.wic  /mnt/test
+   sudo mount -o rw,offset=3D<first_partition_offset> <path-to-img>/ir-a=
cs-live-image-generic-arm64.wic  /mnt/test
=20
 Then, copy the capsules:
=20
@@ -817,8 +741,6 @@ Then, unmount the IR image:
=20
    sudo umount /mnt/test
=20
-**NOTE:** Please refer to `FVP instructions for ACS image and run`_ sect=
ion to find the first partition offset.
-
 ******************************
 Performing the capsule update
 ******************************
--=20
2.25.1


