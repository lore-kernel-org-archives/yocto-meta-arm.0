Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 791E8C636D0
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 15:08:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.138980.1700838481748449015
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 24 Nov 2023 07:08:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C880C1BA8;
	Fri, 24 Nov 2023 07:08:47 -0800 (PST)
Received: from e126835.cambridge.arm.com (e126835.cambridge.arm.com [10.1.35.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DA3F3F73F;
	Fri, 24 Nov 2023 07:08:00 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH 1/3] arm-bsp/documentation: corstone1000: Add EFI system partition section
Date: Fri, 24 Nov 2023 15:07:48 +0000
Message-Id: <20231124150750.81497-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231124150750.81497-1-emekcan.aras@arm.com>
References: <20231124150750.81497-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 24 Nov 2023 15:08:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5276

From: Emekcan Aras <Emekcan.Aras@arm.com>

Adds creating an EFI System Partition for Corstone-1000.

Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
---
 .../documentation/corstone1000/user-guide.rst | 109 +++++++++++++++++-
 1 file changed, 105 insertions(+), 4 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index ad1b0c99..f07b971c 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -386,6 +386,107 @@ steps described in following section "Clean Secure =
Flash Before Testing" to
 erase the SecureEnclave flash cleanly and prepare a clean board environm=
ent for
 the testing.
=20
+Prepare EFI System Partition
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Corstone-1000 FVP and MPS3 do not have enough on-chip nonvolatile memory=
 to host
+an EFI System Partition (ESP). Thus, Corstone-1000 uses mass storage dev=
ice for
+ESP. The instructions below should be followed for both FVP and FPGA bef=
ore
+running the ACS tests.
+
+**Common to FVP and FPGA:**
+
+#. Create an empty 100 MB partition:
+   ::
+
+      dd if=3D/dev/zero of=3Dcorstone1000-efi-partition.img iflag=3Dfull=
block bs=3D512 count=3D204800 && sync
+
+#. Use OpenSuse Raw image to copy the contents of EFI partition.
+
+   To download OpenSUSE Tumbleweed raw image:
+     - Under `OpenSUSE Tumbleweed appliances <http://download.opensuse.o=
rg/ports/aarch64/tumbleweed/appliances/>`__
+     - The user should look for a Tumbleweed-ARM-JeOS-efi.aarch64-* Snap=
shot, for example,
+       ``openSUSE-Tumbleweed-ARM-JeOS-efi.aarch64-<date>-Snapshot<date>.=
raw.xz``
+
+   Once the .raw.xz file is downloaded, the raw image file needs to be e=
xtracted:
+
+   ::
+
+      unxz <file-name.raw.xz>
+
+
+   The above command will generate a file ending with extension .raw ima=
ge. Use the
+   following command to get address of the first partition
+
+   ::
+
+     fdisk -lu <path-to-img>/openSUSE-Tumbleweed-ARM-JeOS-efi.aarch64-<d=
ate>-Snapshot<date>.raw
+     ->  Device                                                         =
                      Start     End  Sectors  Size Type
+          <path-to-img>/openSUSE-Tumbleweed-ARM-JeOS-efi.aarch64-<date>-=
Snapshot<date>.raw1    8192   40959    32768   16M EFI System
+          <path-to-img>/openSUSE-Tumbleweed-ARM-JeOS-efi.aarch64-<date>-=
Snapshot<date>.raw2   40960 1064959  1024000  500M Linux swap
+          <path-to-img>/openSUSE-Tumbleweed-ARM-JeOS-efi.aarch64-<date>-=
Snapshot<date>.raw3 1064960 5369822  4304863  2.1G Linux filesystem
+
+     ->   <blockaddress_1st_partition> =3D 8192
+     ->   <sectorsize_1st_partition> =3D 32768
+
+#. Copy the ESP from opensuse image to empty image:
+
+   ::
+
+     dd conv=3Dnotrunc if=3DopenSUSE-Tumbleweed-ARM-JeOS-efi.aarch64-<da=
te>-Snapshot<date>.raw skip=3D<blockaddress_1st_partition> of=3Dcorstone1=
000-efi-partition.img seek=3D<blockaddress_1st_partition> iflag=3Dfullblo=
ck seek=3D<blockaddress_1st_partition> bs=3D512 count=3D<sectorsize_1s_pa=
rtition> && sync
+
+
+#. Use the provided disk-layout below to label the ESP correctly.
+
+   efi_disk.layout
+   ::
+
+     label: gpt
+     label-id: AC53D121-B818-4515-9031-BE02CCEB8701
+     device: corstone1000-efi-partition.img
+     unit: sectors
+     first-lba: 34
+     last-lba: 204766
+
+     corstone1000-efi-partition.img : start=3D8192, size=3D32768, type=3D=
C12A7328-F81F-11D2-BA4B-00A0C93EC93B, uuid=3D792D821F-98AE-46E3-BABD-9480=
03A650F8, name=3D"p.UEFI"
+
+   And use the following command the label the newly created ESP.
+
+   ::
+
+      sfdisk corstone1000-efi-partition.img < efi_disk.layout
+
+   To test the image, you can now mount the disk image
+
+   ::
+
+      fdisk -lu corstone1000-efi-partition.img
+      ->  Device                          Start   End Sectors Size Type
+          corstone1000-efi-partition.img1  8192 40959   32768  16M EFI S=
ystem
+
+          <offset_1st_partition> =3D 8192 * 512 (sector size) =3D 419430=
4
+
+      sudo mount -o loop,offset=3D4194304 corstone1000-efi-partition.img=
 /mount_point
+
+**Using ESP in FPGA:**
+
+Once the ESP is created, it needs to be flashed to a second USB drive di=
fferent than ACS image.
+This can be done with the development machine.
+
+::
+
+   sudo dd if=3Dcorstone1000-efi-partition.img of=3D/dev/sdb iflag=3Ddir=
ect oflag=3Ddirect status=3Dprogress bs=3D512; sync;
+
+Now you can plug this USB stick to the board together with ACS test USB =
stick.
+
+**Using ESP in FVP:**
+
+The ESP disk image can directly be used in Corstone-1000 FVP by simply p=
assing it as
+the 2nd MMC card image.
+
+::
+
+   <_workspace>/meta-arm/scripts/runfvp <_workspace>/build/tmp/deploy/im=
ages/corstone1000-fvp/corstone1000-image-corstone1000-fvp.fvpconf -- -C b=
oard.msd_mmc.p_mmc_file=3D"${<path-to-img>/ir_acs_live_image.img}" -C boa=
rd.msd_mmc_2.p_mmc_file=3D"${<path-to-img>/corstone1000-efi-partition.img=
}"
+
 Clean Secure Flash Before Testing (applicable to FPGA only)
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
@@ -498,7 +599,7 @@ USB drive. Run the following commands to prepare the =
ACS image in USB stick:
   sudo dd if=3Dir-acs-live-image-generic-arm64.wic of=3D/dev/sdb iflag=3D=
direct oflag=3Ddirect bs=3D1M status=3Dprogress; sync
=20
 Once the USB stick with ACS image is prepared, the user should make sure=
 that
-ensure that only the USB stick with the ACS image is connected to the bo=
ard,
+ensure that both USB sticks (ESP and ACS image) are connected to the boa=
rd,
 and then boot the board.
=20
 The FPGA will reset multiple times during the test, and it might take ap=
prox. 24-36 hours to finish the test.
@@ -510,14 +611,14 @@ FVP instructions for ACS image and run
 Download ACS image from:
  - ``https://gitlab.arm.com/systemready/acs/arm-systemready/-/tree/main/=
IR/prebuilt_images/v23.03_2.0.0``
=20
-Use the below command to run the FVP with ACS image support in the
-SD card.
+Use the below command to run the FVP with EFI and ACS image support in t=
he
+SD cards.
=20
 ::
=20
   unxz ${<path-to-img>/ir-acs-live-image-generic-arm64.wic.xz}
=20
-  <_workspace>/meta-arm/scripts/runfvp  --terminals=3Dxterm <_workspace>=
/build/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000=
-fvp.fvpconf -- -C board.msd_mmc.p_mmc_file=3D<path-to-img>/ir-acs-live-i=
mage-generic-arm64.wic
+  <_workspace>/meta-arm/scripts/runfvp  --terminals=3Dxterm <_workspace>=
/build/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000=
-fvp.fvpconf -- -C board.msd_mmc.p_mmc_file=3D<path-to-img>/ir-acs-live-i=
mage-generic-arm64.wic -C board.msd_mmc_2.p_mmc_file=3D"${<path-to-img>/c=
orstone1000-efi-partition.img}"
=20
 The test results can be fetched using following commands:
=20
--=20
2.25.1


