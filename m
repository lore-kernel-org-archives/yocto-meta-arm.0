Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 664BBC04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 10:24:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.37348.1715941456434553637
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 17 May 2024 03:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11F051424;
	Fri, 17 May 2024 03:24:40 -0700 (PDT)
Received: from e132995.arm.com (unknown [10.57.69.180])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FA923F762;
	Fri, 17 May 2024 03:24:15 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 1/1] arm-bsp/documentation: corstone1000: Update user guide for secureboot test
Date: Fri, 17 May 2024 11:24:02 +0100
Message-Id: <20240517102402.3065167-2-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240517102402.3065167-1-harsimransingh.tungal@arm.com>
References: <20240517102402.3065167-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 17 May 2024 10:24:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5731

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

This changeset updates the user guide to test the secureboot for both the
FVP and FPGA.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 .../documentation/corstone1000/user-guide.rst | 168 ++++++++++++++++++
 1 file changed, 168 insertions(+)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 6eededf6..c67fb6b0 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -1221,6 +1221,174 @@ Now, run the PSA API tests in the following order=
:
=20
 **NOTE:** The psa-crypto-api-test takes between 30 minutes to 1 hour to =
run.
=20
+UEFI Secureboot test
+--------------------
+
+Before running the secureboot test, the user should make sure that the `=
FVP and FPGA software has been compiled and the ESP image for both the FV=
P and FPGA has been created` as mentioned in the previous sections and us=
er should use the same workspace directory under which sources have been =
compiled.=20
+The secureboot tests is applicable on both the FVP and the FPGA and this=
 involves testing both the signed and unsigned kernel images. Successful =
test results in executing the signed image correctly and not allowing the=
 unsigned image to run at all.
+
+***********************************************************
+Below steps are applicable to FVP as well as FPGA
+***********************************************************
+In order to achieve this for FVP and FPGA, a bash script is available in=
 the systemready-patch repo which is responsible in creating the relevant=
 keys, sign the respective kernel images, and copy the same in their corr=
esponding ESP images.
+
+Clone the systemready-patch repo under <_workspace. Then, change directo=
ry to where the script `create_keys_and_sign.sh` is and execute the scrip=
t as follows:
+
+::
+
+  git clone https://git.gitlab.arm.com/arm-reference-solutions/systemrea=
dy-patch.git -b CORSTONE1000-2024.06
+  cd systemready-patch/embedded-a/corstone1000/secureboot/
+
+The script is responsible to create the required UEFI secureboot keys, s=
ign the kernel images and copy the public keys and the kernel images (bot=
h signed and unsigned) to the ESP image for both the FVP and FPGA.=20
+
+::
+ =20
+  ./create_keys_and_sign.sh -w <Absolute path to _workspace/meta-arm dir=
ectory under which sources have been compiled> -v <certification validity=
 in days>
+  For ex: ./create_keys_and_sign.sh -w "/home/xyz/workspace/meta-arm" -v=
 365
+  For help: ./create_keys_and_sign.sh -h
+
+**NOTE:** The above script is interactive and contains some commands tha=
t would require sudo password/permissions.
+
+After executing the above script, the relevant keys and the signed/unsig=
ned kernel images will be copied to the ESP images for both the FVP and F=
GPA. The modified ESP images can be found at the same location i.e.=20
+
+::
+
+  For MPS3 FPGA : _workspace/meta-arm/build/tmp/deploy/images/corstone10=
00-mps3/corstone1000-esp-image-corstone1000-mps3.wic
+  For FVP       : _workspace/meta-arm/build/tmp/deploy/images/corstone10=
00-fvp/corstone1000-esp-image-corstone1000-fvp.wic
+
+Now, it is time to test the UEFI secureboot for the Corstone-1000
+
+***********************************************************
+Steps to test Secureboot on FVP
+***********************************************************
+Now, as mentioned in the previous section **Prepare EFI System Partition=
**, the ESP image will be used automatically in the Corstone-1000 FVP as =
the 2nd MMC card image. Change directory to your workspace and run the FV=
P as follows:
+
+::
+
+  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c "=
../meta-arm/scripts/runfvp --terminals=3Dxterm"
+
+When the script is executed, three terminal instances will be launched, =
one for the boot processor (aka Secure Enclave) processing element and tw=
o for the Host processing element. On the host side, stop the execution a=
t the U-Boot prompt which looks like `corstone1000#`. There is a timeout =
of 3 seconds to stop the execution at the U-Boot prompt. At the U-Boot pr=
ompt, run the following commands:
+
+Set the current mmc device
+
+::
+
+  corstone1000# mmc dev 1
+
+Enroll the four UEFI Secureboot authenticated variables
+
+::
+
+  corstone1000# load mmc 1:1 ${loadaddr} corstone1000_secureboot_keys/PK=
.auth && setenv -e -nv -bs -rt -at -i ${loadaddr}:$filesize PK
+  corstone1000# load mmc 1:1 ${loadaddr} corstone1000_secureboot_keys/KE=
K.auth && setenv -e -nv -bs -rt -at -i ${loadaddr}:$filesize KEK
+  corstone1000# load mmc 1:1 ${loadaddr} corstone1000_secureboot_keys/db=
.auth && setenv -e -nv -bs -rt -at -i ${loadaddr}:$filesize db
+  corstone1000# load mmc 1:1 ${loadaddr} corstone1000_secureboot_keys/db=
x.auth && setenv -e -nv -bs -rt -at -i ${loadaddr}:$filesize dbx
+
+Now, load the unsigned FVP kernel image and execute it. This unsigned ke=
rnel image should not boot and result as follows
+
+::
+
+  corstone1000# load mmc 1:1 ${loadaddr} corstone1000_secureboot_fvp_ima=
ges/Image_fvp
+  corstone1000# loadm $loadaddr $kernel_addr_r $filesize
+  corstone1000# bootefi $kernel_addr_r $fdtcontroladdr
+
+  Booting /MemoryMapped(0x0,0x88200000,0x236aa00)
+  Image not authenticated
+  Loading image failed
+
+The next step is to verify the signed linux kernel image. Load the signe=
d kernel image and execute it as follows:
+
+::
+
+  corstone1000# load mmc 1:1 ${loadaddr} corstone1000_secureboot_fvp_ima=
ges/Image_fvp.signed
+  corstone1000# loadm $loadaddr $kernel_addr_r $filesize
+  corstone1000# bootefi $kernel_addr_r $fdtcontroladdr
+
+The above set of commands should result in booting of signed linux kerne=
l image successfully.
+
+
+***********************************************************
+Steps to test Secureboot on MPS3 FPGA
+***********************************************************
+Now, as mentioned in the previous section **Prepare EFI System Partition=
**, the ESP image for MPS3 FPGA needs to be copied to the USB drive. foll=
ow the steps mentioned in the same section for MPS3 FPGA to prepare the U=
SB drive with the ESP image. The modified ESP image corresponds to MPS3 F=
PGA can be found at the location as mentioned before i.e. `_workspace/met=
a-arm/build/tmp/deploy/images/corstone1000-mps3/corstone1000-esp-image-co=
rstone1000-mps3.wic`. =20
+Insert this USB drive to the MPS3 FPGA and boot, and stop the execution =
at the U-Boot prompt similar to the FVP. At the U-Boot prompt, run the fo=
llowing commands:
+
+Reset the USB
+
+::
+
+  corstone1000# usb reset
+  resetting USB...
+  Bus usb@40200000: isp1763 bus width: 16, oc: not available
+  USB ISP 1763 HW rev. 32 started
+  scanning bus usb@40200000 for devices... port 1 high speed
+  3 USB Device(s) found
+         scanning usb for storage devices... 1 Storage Device(s) found
+
+**NOTE:** Sometimes, the usb reset doesn't recognize the USB device. It =
is recomended to rerun the usb reset command.
+
+Set the current USB device
+
+::
+
+  corstone1000# usb dev 0
+
+Enroll the four UEFI Secureboot authenticated variables
+
+::
+
+  corstone1000# load usb 0 $loadaddr corstone1000_secureboot_keys/PK.aut=
h && setenv -e -nv -bs -rt -at -i $loadaddr:$filesize PK
+  corstone1000# load usb 0 $loadaddr corstone1000_secureboot_keys/KEK.au=
th && setenv -e -nv -bs -rt -at -i $loadaddr:$filesize KEK
+  corstone1000# load usb 0 $loadaddr corstone1000_secureboot_keys/db.aut=
h && setenv -e -nv -bs -rt -at -i $loadaddr:$filesize db
+  corstone1000# load usb 0 $loadaddr corstone1000_secureboot_keys/dbx.au=
th && setenv -e -nv -bs -rt -at -i $loadaddr:$filesize dbx
+
+
+Now, load the unsigned MPS3 FPGA linux kernel image and execute it. This=
 unsigned kernel image should not boot and result as follows
+
+::
+
+  corstone1000# load usb 0 $loadaddr corstone1000_secureboot_mps3_images=
/Image_mps3
+  corstone1000# loadm $loadaddr $kernel_addr_r $filesize
+  corstone1000# bootefi $kernel_addr_r $fdtcontroladdr
+
+  Booting /MemoryMapped(0x0,0x88200000,0x236aa00)
+  Image not authenticated
+  Loading image failed
+
+The next step is to verify the signed linux kernel image. Load the signe=
d kernel image and execute it as follows:
+
+::
+
+  corstone1000# load usb 0 $loadaddr corstone1000_secureboot_mps3_images=
/Image_mps3.signed
+  corstone1000# loadm $loadaddr $kernel_addr_r $filesize
+  corstone1000# bootefi $kernel_addr_r $fdtcontroladdr
+
+The above set of commands should result in booting of signed linux kerne=
l image successfully.
+
+***********************************************************
+Steps to disable Secureboot on both FVP and MPS3 FPGA
+***********************************************************
+Now, after testing the secureboot, UEFI authenticated variables get stor=
ed in the secure flash. When you try to reboot, the U-Boot will automatic=
ally read the UEFI authenticated variables and authenticates the images b=
efore executing them. In normal booting scenario, the linux kernel images=
 will not be signed and hence this will not allow the system to boot, as =
image authentication will fail. We need to delete the Platform Key (one o=
f the UEFI authenticated variable for Secureboot) in order to disable the=
 secureboot. At the U-Boot prompt, run the following commands.=20
+
+On the FVP
+
+::
+
+  corstone1000# mmc dev 1
+  corstone1000# load mmc 1:1 $loadaddr corstone1000_secureboot_keys/PK_d=
elete.auth && setenv -e -nv -bs -rt -at -i $loadaddr:$filesize PK
+  corstone1000# boot
+
+On the MPS3 FPGA
+
+::
+
+  corstone1000# usb reset
+  corstone1000# usb dev 0
+  corstone1000# load usb 0 $loadaddr corstone1000_secureboot_keys/PK_del=
ete.auth && setenv -e -nv -bs -rt -at -i $loadaddr:$filesize PK
+  corstone1000# boot
+
+The above commands will delete the Platform key (PK) and allow the norma=
l system boot flow without secure boot.=20
+
 Tests results
 -------------
=20
--=20
2.25.1


