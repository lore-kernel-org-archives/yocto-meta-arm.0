Return-Path: <tomasagustin.gonzalezorlando@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF188C3DA41
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 15:55:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12031.1687794919487148865
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Jun 2023 08:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: tomasagustin.gonzalezorlando@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30D2B2F4;
	Mon, 26 Jun 2023 08:56:03 -0700 (PDT)
Received: from e126979.cambridge.arm.com (e126979.cambridge.arm.com [10.1.38.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A2C33F663;
	Mon, 26 Jun 2023 08:55:17 -0700 (PDT)
From: tomasagustin.gonzalezorlando@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	jon.mason@arm.com,
	abdellatif.elkhlifi@arm.com
Cc: nd@arm.com,
	Tomas Gonzalez <tomasagustin.gonzalezorlando@arm.com>
Subject: [PATCH v2 1/4] arm-bsp/documentation: corstone1000: Update the user guide
Date: Mon, 26 Jun 2023 16:55:05 +0100
Message-Id: <20230626155508.52962-2-tomasagustin.gonzalezorlando@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626155508.52962-1-tomasagustin.gonzalezorlando@arm.com>
References: <20230626155508.52962-1-tomasagustin.gonzalezorlando@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 26 Jun 2023 15:55:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4836

From: Tomas Gonzalez <tomasagustin.gonzalezorlando@arm.com>

Signed-off-by: Tom=C3=A1s Gonz=C3=A1lez <tomasagustin.gonzalezorlando@arm=
.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../documentation/corstone1000/user-guide.rst | 470 +++++++++++-------
 1 file changed, 302 insertions(+), 168 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index e173f244..5937ff82 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -1,5 +1,5 @@
 ..
- # Copyright (c) 2022, Arm Limited.
+ # Copyright (c) 2022-2023, Arm Limited.
  #
  # SPDX-License-Identifier: MIT
=20
@@ -15,21 +15,35 @@ The Yocto Project relies on the `Bitbake <https://doc=
s.yoctoproject.org/bitbake.
 tool as its build tool. Please see `Yocto Project documentation <https:/=
/docs.yoctoproject.org/>`__
 for more information.
=20
-
 Prerequisites
 -------------
-These instructions assume your host PC is running Ubuntu Linux 18.04 or =
20.04 LTS, with at least 32GB of free disk space and 16GB of RAM as minim=
um requirement. The following instructions expect that you are using a ba=
sh shell. All the paths stated in this document are absolute paths.
=20
-The following prerequisites must be available on the host system. To res=
olve these dependencies, run:
+This guide assumes that your host PC is running Ubuntu 20.04 LTS, with a=
t least
+32GB of free disk space and 16GB of RAM as minimum requirement.
=20
-::
+The following prerequisites must be available on the host system:
+
+- Git 1.8.3.1 or greater
+- tar 1.28 or greater
+- Python 3.8.0 or greater.
+- gcc 8.0 or greater.
+- GNU make 4.0 or greater
+
+Please follow the steps described in the Yocto mega manual:
+
+- `Compatible Linux Distribution <https://docs.yoctoproject.org/singlein=
dex.html#compatible-linux-distribution>`__
+- `Build Host Packages <https://docs.yoctoproject.org/singleindex.html#b=
uild-host-packages>`__
=20
-    sudo apt-get update
-    sudo apt-get install gawk wget git-core diffstat unzip texinfo gcc-m=
ultilib \
-     build-essential chrpath socat cpio python3 python3-pip python3-pexp=
ect \
-     xz-utils debianutils iputils-ping python3-git libegl1-mesa libsdl1.=
2-dev \
-     xterm zstd liblz4-tool picocom
-    sudo apt-get upgrade libstdc++6
+Targets
+-------
+
+- `Arm Corstone-1000 Ecosystem FVP (Fixed Virtual Platform) <https://dev=
eloper.arm.com/downloads/-/arm-ecosystem-fvps>`__
+- `Arm Corstone-1000 for MPS3 <https://developer.arm.com/documentation/d=
ai0550/latest/>`__
+
+Yocto stable branch
+-------------------
+
+Corstone-1000 software stack is built on top of Yocto mickledore.
=20
 Provided components
 -------------------
@@ -44,6 +58,8 @@ The Yocto machine config files for the Corstone-1000 FV=
P and FPGA targets are:
  - ``<_workspace>/meta-arm/meta-arm-bsp/conf/machine/corstone1000-fvp.co=
nf``
  - ``<_workspace>/meta-arm/meta-arm-bsp/conf/machine/corstone1000-mps3.c=
onf``
=20
+**NOTE:** All the paths stated in this document are absolute paths.
+
 *****************
 Software for Host
 *****************
@@ -52,50 +68,52 @@ Trusted Firmware-A
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 Based on `Trusted Firmware-A <https://git.trustedfirmware.org/TF-A/trust=
ed-firmware-a.git>`__
=20
-+----------+------------------------------------------------------------=
---------------------------------------+
-| bbappend | <_workspace>/meta-arm/meta-arm-bsp/recipes-bsp/trusted-firm=
ware-a/trusted-firmware-a_2.7.bbappend |
-+----------+------------------------------------------------------------=
---------------------------------------+
-| Recipe   | <_workspace>/meta-arm/meta-arm/recipes-bsp/trusted-firmware=
-a/trusted-firmware-a_2.7.bb           |
-+----------+------------------------------------------------------------=
---------------------------------------+
++----------+------------------------------------------------------------=
-----------------------------------------+
+| bbappend | <_workspace>/meta-arm/meta-arm-bsp/recipes-bsp/trusted-firm=
ware-a/trusted-firmware-a_2.8.%.bbappend |
++----------+------------------------------------------------------------=
-----------------------------------------+
+| Recipe   | <_workspace>/meta-arm/meta-arm/recipes-bsp/trusted-firmware=
-a/trusted-firmware-a_2.8.0.bb           |
++----------+------------------------------------------------------------=
-----------------------------------------+
=20
 OP-TEE
 =3D=3D=3D=3D=3D=3D
 Based on `OP-TEE <https://git.trustedfirmware.org/OP-TEE/optee_os.git>`_=
_
=20
 +----------+------------------------------------------------------------=
------------------------+
-| bbappend | <_workspace>/meta-arm/meta-arm-bsp/recipes-security/optee/o=
ptee-os_3.18.0.bbappend |
+| bbappend | <_workspace>/meta-arm/meta-arm-bsp/recipes-security/optee/o=
ptee-os_3.20.0.bbappend |
 +----------+------------------------------------------------------------=
------------------------+
-| Recipe   | <_workspace>/meta-arm/meta-arm/recipes-security/optee/optee=
-os_3.18.0.bb           |
+| Recipe   | <_workspace>/meta-arm/meta-arm/recipes-security/optee/optee=
-os_3.20.0.bb           |
 +----------+------------------------------------------------------------=
------------------------+
=20
 U-Boot
-=3D=3D=3D=3D=3D=3D=3D
-Based on `U-Boot <https://gitlab.com/u-boot>`__
+=3D=3D=3D=3D=3D=3D
+Based on `U-Boot repo`_
=20
-+----------+------------------------------------------------------------=
---------+
-| bbappend | <_workspace>/meta-arm/meta-arm/recipes-bsp/u-boot/u-boot_%.=
bbappend |
-+----------+------------------------------------------------------------=
---------+
-| Recipe   | <_workspace>/poky/meta/recipes-bsp/u-boot/u-boot_2022.07.bb=
         |
-+----------+------------------------------------------------------------=
---------+
++----------+------------------------------------------------------------=
-------------+
+| bbappend | <_workspace>/meta-arm/meta-arm/recipes-bsp/u-boot/u-boot_%.=
bbappend     |
++----------+------------------------------------------------------------=
-------------+
+| bbappend | <_workspace>/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t_%.bbappend |
++----------+------------------------------------------------------------=
-------------+
+| Recipe   | <_workspace>/poky/meta/recipes-bsp/u-boot/u-boot_2023.01.bb=
             |
++----------+------------------------------------------------------------=
-------------+
=20
 Linux
 =3D=3D=3D=3D=3D
 The distro is based on the `poky-tiny <https://wiki.yoctoproject.org/wik=
i/Poky-Tiny>`__
 distribution which is a Linux distribution stripped down to a minimal co=
nfiguration.
=20
-The provided distribution is based on busybox and built using muslibc. T=
he
+The provided distribution is based on busybox and built using musl libc.=
 The
 recipe responsible for building a tiny version of Linux is listed below.
=20
 +-----------+-----------------------------------------------------------=
-----------------------------------+
 | bbappend  | <_workspace>/meta-arm/meta-arm-bsp/recipes-kernel/linux/li=
nux-yocto_%.bbappend               |
 +-----------+-----------------------------------------------------------=
-----------------------------------+
-| Recipe    | <_workspace>/poky/meta/recipes-kernel/linux/linux-yocto_5.=
19.bb                              |
+| Recipe    | <_workspace>/poky/meta/recipes-kernel/linux/linux-yocto_6.=
1.bb                               |
 +-----------+-----------------------------------------------------------=
-----------------------------------+
 | defconfig | <_workspace>/meta-arm/meta-arm-bsp/recipes-kernel/linux/fi=
les/corstone1000/defconfig         |
 +-----------+-----------------------------------------------------------=
-----------------------------------+
=20
 External System Tests
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 Based on `Corstone-1000/applications <https://git.gitlab.arm.com/arm-ref=
erence-solutions/corstone1000/applications>`__
=20
 +------------+----------------------------------------------------------=
-------------------------------------------------------------------------=
------------------------------------------------------------------+
@@ -109,15 +127,15 @@ Software for Boot Processor (a.k.a Secure Enclave)
 **************************************************
 Based on `Trusted Firmware-M <https://git.trustedfirmware.org/TF-M/trust=
ed-firmware-m.git>`__
=20
-+----------+------------------------------------------------------------=
-------------------------------------+
-| bbappend | <_workspace>/meta-arm/meta-arm-bsp/recipes-bsp/trusted-firm=
ware-m/trusted-firmware-m_%.bbappend |
-+----------+------------------------------------------------------------=
-------------------------------------+
-| Recipe   | <_workspace>/meta-arm/meta-arm/recipes-bsp/trusted-firmware=
-m/trusted-firmware-m_1.6.0.bb       |
-+----------+------------------------------------------------------------=
-------------------------------------+
++----------+------------------------------------------------------------=
-----------------------------------------+
+| bbappend | <_workspace>/meta-arm/meta-arm-bsp/recipes-bsp/trusted-firm=
ware-m/trusted-firmware-m_1.7.%.bbappend |
++----------+------------------------------------------------------------=
-----------------------------------------+
+| Recipe   | <_workspace>/meta-arm/meta-arm/recipes-bsp/trusted-firmware=
-m/trusted-firmware-m_1.7.0.bb           |
++----------+------------------------------------------------------------=
-----------------------------------------+
=20
-**************************************************
+********************************
 Software for the External System
-**************************************************
+********************************
=20
 RTX
 =3D=3D=3D=3D
@@ -150,7 +168,7 @@ In the top directory of the workspace ``<_workspace>`=
`, run:
=20
 ::
=20
-    git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1000-=
2022.11.23
+    git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1000-=
2023.06
=20
 To build a Corstone-1000 image for MPS3 FPGA, run:
=20
@@ -173,17 +191,17 @@ Once the build is successful, all output binaries w=
ill be placed in the followin
  - ``<_workspace>/build/tmp/deploy/images/corstone1000-mps3/`` folder fo=
r FPGA build.
=20
 Everything apart from the Secure Enclave ROM firmware and External Syste=
m firmware, is bundled into a single binary, the
-``corstone1000-image-corstone1000-{mps3,fvp}.wic.nopt`` file.
+``corstone1000-image-corstone1000-{mps3,fvp}.wic`` file.
=20
 The output binaries run in the Corstone-1000 platform are the following:
  - The Secure Enclave ROM firmware: ``<_workspace>/build/tmp/deploy/imag=
es/corstone1000-{mps3,fvp}/bl1.bin``
  - The External System firmware: ``<_workspace>/build/tmp/deploy/images/=
corstone1000-{mps3,fvp}/es_flashfw.bin``
- - The flash image: ``<_workspace>/build/tmp/deploy/images/corstone1000-=
{mps3,fvp}/corstone1000-image-corstone1000-{mps3,fvp}.wic.nopt``
+ - The flash image: ``<_workspace>/build/tmp/deploy/images/corstone1000-=
{mps3,fvp}/corstone1000-image-corstone1000-{mps3,fvp}.wic``
=20
 Flash the firmware image on FPGA
 --------------------------------
=20
-The user should download the FPGA bit file image ``AN550:  Arm=C2=AE Cor=
stone=E2=84=A2-1000 for MPS3 Version 1``
+The user should download the FPGA bit file image ``AN550:  Arm=C2=AE Cor=
stone=E2=84=A2-1000 for MPS3 Version 2.0``
 from `this link <https://developer.arm.com/tools-and-software/developmen=
t-boards/fpga-prototyping-boards/download-fpga-images>`__
 and under the section ``Arm=C2=AE Corstone=E2=84=A2-1000 for MPS3``.
=20
@@ -191,28 +209,29 @@ The directory structure of the FPGA bundle is shown=
 below.
=20
 ::
=20
-    Boardfiles
-    =E2=94=9C=E2=94=80=E2=94=80 MB
-    =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 BRD_LOG.TXT
-    =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 HBI0309B
-    =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=
=80 AN550
-    =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=
=94=9C=E2=94=80=E2=94=80 AN550_v1.bit
-    =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=
=94=9C=E2=94=80=E2=94=80 an550_v1.txt
-    =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=
=94=94=E2=94=80=E2=94=80 images.txt
-    =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=
=80 board.txt
-    =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=
=80 mbb_v210.ebf
-    =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 HBI0309C
-    =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 AN550
-    =E2=94=82=C2=A0=C2=A0     =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=
=94=80 AN550_v1.bit
-    =E2=94=82=C2=A0=C2=A0     =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=
=94=80 an550_v1.txt
-    =E2=94=82=C2=A0=C2=A0     =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=
=94=80 images.txt
-    =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 board.txt
-    =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 mbb_v210.ebf
-    =E2=94=9C=E2=94=80=E2=94=80 SOFTWARE
-    =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 ES0.bin
-    =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 SE.bin
-    =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 an550_st.axf
-    =E2=94=94=E2=94=80=E2=94=80 config.txt
+   Boardfiles
+   =E2=94=9C=E2=94=80=E2=94=80 config.txt
+   =E2=94=9C=E2=94=80=E2=94=80 MB
+   =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 BRD_LOG.TXT
+   =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 HBI0309B
+   =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 AN550
+   =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=
=94=9C=E2=94=80=E2=94=80 AN550_v2.bit
+   =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=
=94=9C=E2=94=80=E2=94=80 an550_v2.txt
+   =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=
=94=94=E2=94=80=E2=94=80 images.txt
+   =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 board.txt
+   =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80=
 mbb_v210.ebf
+   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 HBI0309C
+   =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 AN550
+   =E2=94=82=C2=A0=C2=A0     =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=
=94=80 AN550_v2.bit
+   =E2=94=82=C2=A0=C2=A0     =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=
=94=80 an550_v2.txt
+   =E2=94=82=C2=A0=C2=A0     =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=
=94=80 images.txt
+   =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 board.txt
+   =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 mbb_v210.ebf
+   =E2=94=94=E2=94=80=E2=94=80 SOFTWARE
+        =E2=94=9C=E2=94=80=E2=94=80 an550_st.axf
+        =E2=94=9C=E2=94=80=E2=94=80 bl1.bin
+        =E2=94=9C=E2=94=80=E2=94=80 cs1000.bin
+        =E2=94=94=E2=94=80=E2=94=80 ES0.bin
=20
 Depending upon the MPS3 board version (printed on the MPS3 board) you sh=
ould update the images.txt file
 (in corresponding HBI0309x folder. Boardfiles/MB/HBI0309<board_revision>=
/AN550/images.txt) so that the file points to the images under SOFTWARE d=
irectory.
@@ -242,7 +261,7 @@ stack can be seen below;
   IMAGE0FILE: \SOFTWARE\bl1.bin
   =20
   IMAGE1PORT: 0
-  IMAGE1ADDRESS: 0x00_0010_0000
+  IMAGE1ADDRESS: 0x00_0000_0000
   IMAGE1UPDATE: AUTOQSPI
   IMAGE1FILE: \SOFTWARE\cs1000.bin
   =20
@@ -256,10 +275,9 @@ OUTPUT_DIR =3D ``<_workspace>/build/tmp/deploy/image=
s/corstone1000-mps3``
 1. Copy ``bl1.bin`` from OUTPUT_DIR directory to SOFTWARE directory of t=
he FPGA bundle.
 2. Copy ``es_flashfw.bin`` from OUTPUT_DIR directory to SOFTWARE directo=
ry of the FPGA bundle
    and rename the binary to ``es0.bin``.
-3. Copy ``corstone1000-image-corstone1000-mps3.wic.nopt`` from OUTPUT_DI=
R directory to SOFTWARE
-   directory of the FPGA bundle and rename the wic.nopt image to ``cs100=
0.bin``.
+3. Copy ``corstone1000-image-corstone1000-mps3.wic`` from OUTPUT_DIR dir=
ectory to SOFTWARE
+   directory of the FPGA bundle and rename the wic image to ``cs1000.bin=
``.
=20
-  =20
 **NOTE:** Renaming of the images are required because MCC firmware has
 limitation of 8 characters before .(dot) and 3 characters after .(dot).
=20
@@ -274,7 +292,7 @@ be ttyUSB0, ttyUSB1, ttyUSB2, ttyUSB3 and it might be=
 different on Windows machi
   - ttyUSB0 for MCC, OP-TEE and Secure Partition
   - ttyUSB1 for Boot Processor (Cortex-M0+)
   - ttyUSB2 for Host Processor (Cortex-A35)
-  - ttyUSB3 for External System Processor (Cortex-M3)=20
+  - ttyUSB3 for External System Processor (Cortex-M3)
=20
 Run following commands to open serial port terminals on Linux:
=20
@@ -285,12 +303,26 @@ Run following commands to open serial port terminal=
s on Linux:
   sudo picocom -b 115200 /dev/ttyUSB2  # in another terminal.
   sudo picocom -b 115200 /dev/ttyUSB3  # in another terminal.
=20
+**NOTE:** The MPS3 expects an ethernet cable to be plugged in, otherwise=
 it will
+wait for the network for a considerable amount of time, printing the fol=
lowing
+logs:
+
+::
+
+  Generic PHY 40100000.ethernet-ffffffff:01: attached PHY driver (mii_bu=
s:phy_addr=3D40100000.ethernet-ffffffff:01, irq=3DPOLL)
+  smsc911x 40100000.ethernet eth0: SMSC911x/921x identified at 0xffffffc=
008e50000, IRQ: 17
+  Waiting up to 100 more seconds for network.
+
 Once the system boot is completed, you should see console
 logs on the serial port terminals. Once the HOST(Cortex-A35) is
 booted completely, user can login to the shell using
 **"root"** login.
=20
-If system does not boot and only the ttyUSB1 logs are visible, please fo=
llow the steps in `Clean Secure Flash Before Testing (applicable to FPGA =
only)`_ under `SystemReady-IR tests`_ section. The previous image used in=
 FPGA (MPS3) might have filled the Secure Flash completely. The best prac=
tice is to clean the secure flash in this case.
+If system does not boot and only the ttyUSB1 logs are visible, please fo=
llow the
+steps in `Clean Secure Flash Before Testing (applicable to FPGA only)`_ =
under
+`SystemReady-IR tests`_ section. The previous image used in FPGA (MPS3) =
might
+have filled the Secure Flash completely. The best practice is to clean t=
he
+secure flash in this case.
=20
=20
 Running the software on FVP
@@ -321,7 +353,7 @@ To run the FVP using the runfvp command, please run t=
he following command:
=20
 When the script is executed, three terminal instances will be launched, =
one for the boot processor
 (aka Secure Enclave) processing element and two for the Host processing =
element. Once the FVP is
-executing, the Boot Processor will start to boot, wherein the relevant m=
emory contents of the .wic.nopt
+executing, the Boot Processor will start to boot, wherein the relevant m=
emory contents of the .wic
 file are copied to their respective memory locations within the model, e=
nforce firewall policies
 on memories and peripherals and then, bring the host out of reset.
=20
@@ -337,11 +369,11 @@ Login using the username root.
 The External System can be released out of reset on demand using the sys=
tems-comms-tests command.
=20
 SystemReady-IR tests
--------------------------
+--------------------
=20
-*********************
+*************
 Testing steps
-*********************
+*************
=20
 **NOTE**: Running the SystemReady-IR tests described below requires the =
user to
 work with USB sticks. In our testing, not all USB stick models work well=
 with
@@ -359,7 +391,7 @@ erase the SecureEnclave flash cleanly and prepare a c=
lean board environment for
 the testing.
=20
 Clean Secure Flash Before Testing (applicable to FPGA only)
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 To prepare a clean board environment with clean secure flash for the tes=
ting,
 the user should prepare an image that erases the secure flash cleanly du=
ring
@@ -368,17 +400,17 @@ boot. Run following commands to build such image.
 ::
=20
   cd <_workspace>
-  git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1000-20=
22.11.23
-  git clone https://git.gitlab.arm.com/arm-reference-solutions/systemrea=
dy-patch.git -b CORSTONE1000-2022.11.23
-  cp -f systemready-patch/embedded-a/corstone1000/erase_flash/0001-arm-b=
sp-trusted-firmware-m-corstone1000-Clean-Secure.patch meta-arm
+  git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1000-20=
23.06
+  git clone https://git.gitlab.arm.com/arm-reference-solutions/systemrea=
dy-patch.git -b CORSTONE1000-2023.06
+  cp -f systemready-patch/embedded-a/corstone1000/erase_flash/0001-embed=
ded-a-corstone1000-clean-secure-flash.patch meta-arm
   cd meta-arm
-  git apply 0001-arm-bsp-trusted-firmware-m-corstone1000-Clean-Secure.pa=
tch
+  git apply 0001-embedded-a-corstone1000-clean-secure-flash.patch
   cd ..
   kas build meta-arm/kas/corstone1000-mps3.yml
=20
 Replace the bl1.bin and cs1000.bin files on the SD card with following f=
iles:
   - The ROM firmware: <_workspace>/build/tmp/deploy/images/corstone1000-=
mps3/bl1.bin
-  - The flash image: <_workspace>/build/tmp/deploy/images/corstone1000-m=
ps3/corstone1000-image-corstone1000-mps3.wic.nopt
+  - The flash image: <_workspace>/build/tmp/deploy/images/corstone1000-m=
ps3/corstone1000-image-corstone1000-mps3.wic
=20
 Now reboot the board. This step erases the Corstone-1000 SecureEnclave f=
lash
 completely, the user should expect following message from TF-M log (can =
be seen
@@ -394,7 +426,7 @@ Then the user should follow "Building the software st=
ack" to build a clean
 software stack and flash the FPGA as normal. And continue the testing.
=20
 Run SystemReady-IR ACS tests
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
=20
 ACS image contains two partitions. BOOT partition and RESULT partition.
 Following packages are under BOOT partition
@@ -407,11 +439,11 @@ Following packages are under BOOT partition
  * uefi manual capsule application
=20
 RESULT partition is used to store the test results.
-PLEASE MAKE SURE THAT THE RESULT PARTITION IS EMPTY BEFORE YOU START THE=
 TESTING. OTHERWISE THE TEST RESULTS
+**NOTE**: PLEASE MAKE SURE THAT THE RESULT PARTITION IS EMPTY BEFORE YOU=
 START THE TESTING. OTHERWISE THE TEST RESULTS
 WILL NOT BE CONSISTENT
=20
 FPGA instructions for ACS image
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
=20
 This section describes how the user can build and run Architecture Compl=
iance
 Suite (ACS) tests on Corstone-1000.
@@ -452,7 +484,7 @@ and then boot the board.
 The FPGA will reset multiple times during the test, and it might take ap=
prox. 24-36 hours to finish the test. At the end of test, the FPGA host t=
erminal will halt showing a shell prompt. Once test is finished the resul=
t can be copied following above instructions.
=20
 FVP instructions for ACS image and run
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 Download ACS image from:
  - ``https://gitlab.arm.com/systemready/acs/arm-systemready/-/tree/linux=
-5.17-rc7/IR/prebuilt_images/v22.04_1.0-Linux-v5.17-rc7``
@@ -487,7 +519,7 @@ Once test is finished, the FVP can be stoped, and res=
ult can be copied following
 instructions.
=20
 Common to FVP and FPGA
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 U-Boot should be able to boot the grub bootloader from
 the 1st partition and if grub is not interrupted, tests are executed
@@ -496,14 +528,13 @@ automatically in the following sequence:
  - SCT
  - UEFI BSA
  - FWTS
- - BSA Linux
=20
 The results can be fetched from the ``acs_results`` folder in the RESULT=
 partition of the USB stick (FPGA) / SD Card (FVP).
=20
 #####################################################
=20
 Manual capsule update and ESRT checks
----------------------------------------------------------------------
+-------------------------------------
=20
 The following section describes running manual capsule update with the `=
`direct`` method.
=20
@@ -518,17 +549,22 @@ incorrect capsule (corrupted or outdated) which fai=
ls to boot to the host softwa
 Check the "Run SystemReady-IR ACS tests" section above to download and u=
npack the ACS image file
  - ``ir_acs_live_image.img.xz``
=20
-Download edk2 under <_workspace> :
+Download edk2 under <_workspace>:
=20
 ::
=20
   git clone https://github.com/tianocore/edk2.git
=20
-*********************
+Download systemready-patch repo under <_workspace>:
+::
+
+  git clone https://git.gitlab.arm.com/arm-reference-solutions/systemrea=
dy-patch.git -b CORSTONE1000-2023.06
+
+*******************
 Generating Capsules
-*********************
+*******************
=20
-The capsule binary size (wic.nopt file) should be less than 15 MB.
+The capsule binary size (wic file) should be less than 15 MB.
=20
 Based on the user's requirement, the user can change the firmware versio=
n
 number given to ``--fw-version`` option (the version number needs to be =
>=3D 1).
@@ -538,38 +574,49 @@ Generating FPGA Capsules
=20
 ::
=20
-   <_workspace>/edk2/BaseTools/BinWrappers/PosixLike/GenerateCapsule -e =
-o \
-   cs1k_cap_mps3_v5 --fw-version 5 --lsv 0 --guid \
-   e2bb9c06-70e9-4b14-97a3-5a7913176e3f --verbose --update-image-index \
-   0 --verbose <_workspace>/build/tmp/deploy/images/corstone1000-mps3/co=
rstone1000-image-corstone1000-mps3.wic.nopt
+   cd <_workspace>/build/tmp/deploy/images/corstone1000-mps3/
+   sh <_workspace>/systemready-patch/embedded-a/corstone1000/capsule_gen=
/capsule_gen.sh -d mps3
+
+This will generate a file called "corstone1000_image.nopt" which will be=
 used to
+generate a UEFI capsule.
=20
 ::
=20
-   <_workspace>/edk2/BaseTools/BinWrappers/PosixLike/GenerateCapsule -e =
-o \
-   cs1k_cap_mps3_v6 --fw-version 6 --lsv 0 --guid \
-   e2bb9c06-70e9-4b14-97a3-5a7913176e3f --verbose --update-image-index \
-   0 --verbose <_workspace>/build/tmp/deploy/images/corstone1000-mps3/co=
rstone1000-image-corstone1000-mps3.wic.nopt
+   cd <_workspace>
+   edk2/BaseTools/BinWrappers/PosixLike/GenerateCapsule -e -o cs1k_cap_m=
ps3_v6 --fw-version 6 \
+   --lsv 0 --guid    e2bb9c06-70e9-4b14-97a3-5a7913176e3f --verbose --up=
date-image-index  0 \
+   --verbose build/tmp/deploy/images/corstone1000-mps3/corstone1000_imag=
e.nopt
+
+   edk2/BaseTools/BinWrappers/PosixLike/GenerateCapsule -e -o cs1k_cap_m=
ps3_v5 --fw-version 5 \
+   --lsv 0 --guid    e2bb9c06-70e9-4b14-97a3-5a7913176e3f --verbose --up=
date-image-index  0 \
+   --verbose build/tmp/deploy/images/corstone1000-mps3/corstone1000_imag=
e.nopt
=20
 Generating FVP Capsules
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 ::
=20
-   <_workspace>/edk2/BaseTools/BinWrappers/PosixLike/GenerateCapsule -e =
-o \
-   cs1k_cap_fvp_v6 --fw-version 6 --lsv 0 --guid \
-   e2bb9c06-70e9-4b14-97a3-5a7913176e3f --verbose --update-image-index \
-   0 --verbose <_workspace>/build/tmp/deploy/images/corstone1000-fvp/cor=
stone1000-image-corstone1000-fvp.wic.nopt
+   cd <_workspace>/build/tmp/deploy/images/corstone1000-fvp/
+   sh <_workspace>/systemready-patch/embedded-a/corstone1000/capsule_gen=
/capsule_gen.sh -d fvp
+
+This will generate a file called "corstone1000_image.nopt" which will be=
 used to
+generate a UEFI capsule.
+
=20
 ::
=20
-   <_workspace>/edk2/BaseTools/BinWrappers/PosixLike/GenerateCapsule -e =
-o \
-   cs1k_cap_fvp_v5 --fw-version 5 --lsv 0 --guid \
-   e2bb9c06-70e9-4b14-97a3-5a7913176e3f --verbose --update-image-index \
-   0 --verbose <_workspace>/build/tmp/deploy/images/corstone1000-fvp/cor=
stone1000-image-corstone1000-fvp.wic.nopt
+   cd <_workspace>
+   edk2/BaseTools/BinWrappers/PosixLike/GenerateCapsule -e -o cs1k_cap_f=
vp_v6 \
+   --fw-version 6 --lsv 0 --guid    e2bb9c06-70e9-4b14-97a3-5a7913176e3f=
 --verbose --update-image-index \
+   0 --verbose build/tmp/deploy/images/corstone1000-fvp/corstone1000_ima=
ge.nopt
=20
-*********************
+   edk2/BaseTools/BinWrappers/PosixLike/GenerateCapsule -e -o cs1k_cap_f=
vp_v5 --fw-version 5 \
+   --lsv 0 --guid    e2bb9c06-70e9-4b14-97a3-5a7913176e3f --verbose --up=
date-image-index \
+   0 --verbose build/tmp/deploy/images/corstone1000-fvp/corstone1000_ima=
ge.nopt
+
+****************
 Copying Capsules
-*********************
+****************
=20
 Copying the FPGA capsules
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
@@ -612,7 +659,7 @@ Then, unmount the IR image:
=20
 **NOTE:**
=20
-Size of first partition in the image file is calculated in the following=
 way. The data is
+The size of first partition in the image file is calculated in the follo=
wing way. The data is
 just an example and might vary with different ir_acs_live_image.img file=
s.
=20
 ::
@@ -632,21 +679,21 @@ During this section we will be using the capsule wi=
th the higher version (cs1k_c
 and the capsule with the lower version (cs1k_cap_<fvp/mps3>_v5) for the =
negative scenario.
=20
 Running the FVP with the IR prebuilt image
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 Run the FVP with the IR prebuilt image:
=20
 ::
=20
-   <_workspace>/meta-arm/scripts/runfvp --terminals=3Dxterm <_workspace>=
/build/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000=
-fvp.fvpconf -- -C "board.msd_mmc.p_mmc_file ${<path-to-img>/ir_acs_live_=
image.img}"=20
+   <_workspace>/meta-arm/scripts/runfvp --terminals=3Dxterm <_workspace>=
/build/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000=
-fvp.fvpconf -- -C "board.msd_mmc.p_mmc_file ${<path-to-img>/ir_acs_live_=
image.img}"
=20
 Running the FPGA with the IR prebuilt image
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 Insert the prepared USB stick then Power cycle the MPS3 board.
=20
 Executing capsule update for FVP and FPGA
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 Reach u-boot then interrupt the boot  to reach the EFI shell.
=20
@@ -687,14 +734,14 @@ Then, reboot manually:
    Shell> reset
=20
 FPGA: Select Corstone-1000 Linux kernel boot
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 Remove the USB stick before u-boot is reached so the Corstone-1000 kerne=
l will be detected and used for booting.
=20
 **NOTE:** Otherwise, the execution ends up in the ACS live image.
=20
 FVP: Select Corstone-1000 Linux kernel boot
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 Interrupt the u-boot shell.
=20
@@ -708,15 +755,14 @@ Run the following commands in order to run the Cors=
tone-1000 Linux kernel and be
=20
 ::
=20
-   $ run retrieve_kernel_load_addr
    $ unzip $kernel_addr 0x90000000
    $ loadm 0x90000000 $kernel_addr_r 0xf00000
    $ bootefi $kernel_addr_r $fdtcontroladdr
=20
=20
-***********************
+*********************
 Capsule update status
-***********************
+*********************
=20
 Positive scenario
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -733,7 +779,8 @@ correctly.
   SysTick_Handler: counted =3D 30, expiring on =3D 360
   ...
   metadata_write: success: active =3D 1, previous =3D 0
-  accept_full_capsule: exit: fwu state is changed to regular
+  flash_full_capsule: exit
+  corstone1000_fwu_flash_image: exit: ret =3D 0
   ...
=20
=20
@@ -775,15 +822,19 @@ see appropriate logs in the secure enclave terminal=
.
   ... =20
     uefi_capsule_retrieve_images: image 0 at 0xa0000070, size=3D15654928
     uefi_capsule_retrieve_images: exit
-    flash_full_capsule: enter: image =3D 0x0xa0000070, size =3D 15654928=
, version =3D 10
+    flash_full_capsule: enter: image =3D 0x0xa0000070, size =3D 7764541,=
 version =3D 5
     ERROR: flash_full_capsule: version error
     private_metadata_write: enter: boot_index =3D 1
     private_metadata_write: success
     fmp_set_image_info:133 Enter
     FMP image update: image id =3D 0
-    FMP image update: status =3D 1version=3D11 last_attempt_version=3D10=
.
+    FMP image update: status =3D 1version=3D6 last_attempt_version=3D5.
     fmp_set_image_info:157 Exit.
     corstone1000_fwu_flash_image: exit: ret =3D -1
+    fmp_get_image_info:232 Enter
+    pack_image_info:207 ImageInfo size =3D 105, ImageName size =3D 34, I=
mageVersionName
+    size =3D 36
+    fmp_get_image_info:236 Exit
   ...
=20
=20
@@ -825,54 +876,94 @@ In the Linux command-line run the following:
    lowest_supported_fw_ver:	0
=20
 Linux distros tests
-----------------------------------
+-------------------
+
+*************************************************************
+Debian install and boot preparation (applicable to FPGA only)
+*************************************************************
+
+There is a known issue in the `Shim 15.7 <https://salsa.debian.org/efi-t=
eam/shim/-/tree/upstream/15.7?ref_type=3Dtags>`__
+provided with the Debian installer image (see below). This bug causes a =
fatal
+error when attempting to install Debian.
+A patch to be applied to the Corstone-1000 stack (only applicable when
+installing Debian) is provided to
+`Skip the Shim <https://gitlab.arm.com/arm-reference-solutions/systemrea=
dy-patch/-/blob/CORSTONE1000-2023.06/embedded-a/corstone1000/shim/0001-ar=
m-bsp-u-boot-corstone1000-Skip-the-shim-by-booting.patch>`__.
+This patch makes U-Boot automatically bypass the Shim and run grub and a=
llows
+the user to proceed with a normal installation. If at the moment of read=
ing this
+document the problem is solved in the Shim, the user is encouraged to tr=
y the
+corresponding new installer image. Otherwise, please apply the patch as
+indicated by the instructions listed below. These instructions assume th=
at the
+user has already built the stack by following the build steps of this
+documentation.
+
+::
=20
-************************************************************************=
***************
-Debian/OpenSUSE install and boot (applicable to FPGA only)
-************************************************************************=
***************
+  cd <_workspace>
+  git clone https://git.gitlab.arm.com/arm-reference-solutions/systemrea=
dy-patch.git -b CORSTONE1000-2023.06
+  cp -f systemready-patch/embedded-a/corstone1000/shim/0001-arm-bsp-u-bo=
ot-corstone1000-Skip-the-shim-by-booting.patch meta-arm
+  cd meta-arm
+  git am 0001-arm-bsp-u-boot-corstone1000-Skip-the-shim-by-booting.patch
+  cd ..
+  kas shell meta-arm/kas/corstone1000-mps3.yml -c=3D"bitbake u-boot trus=
ted-firmware-a corstone1000-image -c cleansstate; bitbake corstone1000-im=
age"
=20
-To test Linux distro install and boot, the user should prepare two empty=
 USB sticks (minimum size should be 4GB and formatted with FAT32).
+*************************************************
+Debian/openSUSE install (applicable to FPGA only)
+*************************************************
+
+To test Linux distro install and boot, the user should prepare two empty=
 USB
+sticks (minimum size should be 4GB and formatted with FAT32).
=20
 Download one of following Linux distro images:
- - Debian installer image: https://cdimage.debian.org/cdimage/weekly-bui=
lds/arm64/iso-dvd/
- - OpenSUSE Tumbleweed installer image: http://download.opensuse.org/por=
ts/aarch64/tumbleweed/iso/
-   - The user should look for a DVD Snapshot like openSUSE-Tumbleweed-DV=
D-aarch64-Snapshot<date>-Media.iso
+ - `Debian 12.0.0 installer image <https://cdimage.debian.org/debian-cd/=
current/arm64/iso-dvd/debian-12.0.0-arm64-DVD-1.iso>`__
+ - `OpenSUSE Tumbleweed installer image <http://download.opensuse.org/po=
rts/aarch64/tumbleweed/iso/>`__
+
+**NOTE:** For OpenSUSE Tumbleweed, the user should look for a DVD Snapsh=
ot like
+openSUSE-Tumbleweed-DVD-aarch64-Snapshot<date>-Media.iso
=20
-Once the .iso file is downloaded, the .iso file needs to be flashed to y=
our USB drive.
+Once the iso file is downloaded, the iso file needs to be flashed to you=
r USB
+drive. This can be done with your development machine.
=20
-In the given example here, we assume the USB device is ``/dev/sdb`` (the=
 user
-should use `lsblk` command to confirm). Be cautious here and don't confu=
se your
-host PC's own hard drive with the USB drive. Then copy the contents of a=
n iso
-file into the first USB stick, run:
+In the example given below, we assume the USB device is ``/dev/sdb`` (th=
e user
+should use the `lsblk` command to confirm).
+
+**NOTE:** Please don't confuse your host PC's own hard drive with the US=
B drive.
+Then, copy the contents of the iso file into the first USB stick by runn=
ing the
+following command in the development machine:
=20
 ::
=20
   sudo dd if=3D<path-to-iso_file> of=3D/dev/sdb iflag=3Ddirect oflag=3Dd=
irect status=3Dprogress bs=3D1M; sync;
=20
-Boot the MSP3 board with the first USB stick connected. Open following m=
inicom sessions:
+Unplug the first USB stick from the development machine and connect it t=
o the
+MSP3 board. At this moment, only the first USB stick should be connected=
. Open
+the following picocom sessions in your development machine:
=20
 ::
=20
   sudo picocom -b 115200 /dev/ttyUSB0  # in one terminal
   sudo picocom -b 115200 /dev/ttyUSB2  # in another terminal.
=20
-Now plug in the second USB stick (once installation screen is visible), =
the distro installation process will start. The installation prompt can b=
e seen in ttyUSB2. If installer does not start, please try to reboot the =
board with both USB sticks connected and repeat the process.
+When the installation screen is visible in ttyUSB2, plug in the second U=
SB stick
+in the MPS3 and start the distro installation process. If the installer =
does not
+start, please try to reboot the board with both USB sticks connected and=
 repeat
+the process.
=20
 **NOTE:** Due to the performance limitation of Corstone-1000 MPS3 FPGA, =
the
 distro installation process can take up to 24 hours to complete.
=20
-Once installation is complete, unplug the first USB stick and reboot the=
 board.
-After successfully installing and booting the Linux distro, the user sho=
uld see
-a login prompt:
+*******************************************************
+Debian install clarifications (applicable to FPGA only)
+*******************************************************
=20
-::
-
-  debian login:
+As the installation process for Debian is different than the one for ope=
nSUSE,
+Debian may need some extra steps, that are indicated below:
=20
-Login with the username root.
+During Debian installation, please answer the following question:
+ - "Force GRUB installation to the EFI removable media path?" Yes
+ - "Update NVRAM variables to automatically boot into Debian?" No
=20
-**NOTE:** The Debian installer has a known issue "Install the GRUB bootl=
oader - unable to install " and these are the steps to
-follow on the subsequent popups to solve the issue during the installati=
on:
+If the grub installation fails, these are the steps to follow on the sub=
sequent
+popups:
=20
 1. Select "Continue", then "Continue" again on the next popup
 2. Scroll down and select "Execute a shell"
@@ -898,19 +989,59 @@ follow on the subsequent popups to solve the issue =
during the installation:
 7. Select "Continue without boot loader", then select "Continue" on the =
next popup
 8. At this stage, the installation should proceed as normal.
=20
-************************************************************************=
***************
+*****************************************************************
+Debian/openSUSE boot after installation (applicable to FPGA only)
+*****************************************************************
+
+Once the installation is complete, unplug the first USB stick and reboot=
 the
+board.
+The board will then enter recovery mode, from which the user can access =
a shell
+after entering the password for the root user. Proceed to edit the follo=
wing
+files accordingly:
+
+::
+
+  vi /etc/systemd/system.conf
+  DefaultDeviceTimeoutSec=3Dinfinity
+
+The file to be editted next is different depending on the installed dist=
ro:
+
+::
+
+  vi /etc/login.defs # Only applicable to Debian
+  vi /usr/etc/login.defs # Only applicable to openSUSE
+  LOGIN_TIMEOUT   180
+
+To make sure the changes are applied, please run:
+
+::
+
+  systemctl daemon-reload
+
+After applying the previous commands, please reboot the board. The user =
should
+see a login prompt after booting, for example, for debian:
+
+::
+
+  debian login:
+
+Login with the username root and its corresponding password (already set=
 at
+installation time).
+
+************************************************************
 OpenSUSE Raw image install and boot (applicable to FVP only)
-************************************************************************=
***************
+************************************************************
=20
-Steps to download openSUSE Tumbleweed raw image:
-  - Go to: http://download.opensuse.org/ports/aarch64/tumbleweed/applian=
ces/
-  - The user should look for a Tumbleweed-ARM-JeOS-efi.aarch64-* Snapsho=
t, for example, ``openSUSE-Tumbleweed-ARM-JeOS-efi.aarch64-<date>-Snapsho=
t<date>.raw.xz``
+Steps to download OpenSUSE Tumbleweed raw image:
+  - Under `OpenSUSE Tumbleweed appliances <http://download.opensuse.org/=
ports/aarch64/tumbleweed/appliances/>`__
+  - The user should look for a Tumbleweed-ARM-JeOS-efi.aarch64-* Snapsho=
t, for example,
+    ``openSUSE-Tumbleweed-ARM-JeOS-efi.aarch64-<date>-Snapshot<date>.raw=
.xz``
=20
 Once the .raw.xz file is downloaded, the raw image file needs to be extr=
acted:
=20
 ::
=20
-       unxz <file-name.raw.xz>
+   unxz <file-name.raw.xz>
=20
=20
 The above command will generate a file ending with extension .raw image.=
 Now, use the following command
@@ -918,23 +1049,23 @@ to run FVP with raw image installation process.
=20
 ::
=20
-<_workspace>/meta-arm/scripts/runfvp --terminals=3Dxterm <_workspace>/bu=
ild/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000-fv=
p.fvpconf -- -C board.msd_mmc.p_mmc_file=3D"${openSUSE raw image file pat=
h}"=20
+   <_workspace>/meta-arm/scripts/runfvp --terminals=3Dxterm <_workspace>=
/build/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000=
-fvp.fvpconf -- -C board.msd_mmc.p_mmc_file=3D"${openSUSE raw image file =
path}"
=20
 After successfully installing and booting the Linux distro, the user sho=
uld see
 a openSUSE login prompt.
=20
 ::
=20
-      localhost login:
+   localhost login:
=20
 Login with the username 'root' and password 'linux'.
=20
 PSA API tests
-----------------------
+-------------
=20
-************************************************************************=
***************
+***********************************************************
 Run PSA API test commands (applicable to both FPGA and FVP)
-************************************************************************=
***************
+***********************************************************
=20
 When running PSA API test commands (aka PSA Arch Tests) on MPS3 FPGA, th=
e user should make sure there is no
 USB stick connected to the board. Power on the board and boot the board =
to
@@ -948,7 +1079,7 @@ First, load FF-A TEE kernel module:
=20
 ::
=20
-  insmod /lib/modules/5.19.14-yocto-standard/extra/arm-ffa-tee.ko
+  insmod /lib/modules/6.1.25-yocto-standard/extra/arm-ffa-tee.ko
=20
 Then, check whether the FF-A TEE driver is loaded correctly by using the=
 following command:
=20
@@ -960,7 +1091,7 @@ The output should be:
=20
 ::
=20
-   arm_ffa_tee 16384 - - Live 0xffffffc0004f0000 (O)
+   arm_ffa_tee 16384 - - Live 0xffffffc000510000 (O)
=20
 Now, run the PSA API tests in the following order:
=20
@@ -971,15 +1102,17 @@ Now, run the PSA API tests in the following order:
   psa-its-api-test
   psa-ps-api-test
=20
+**NOTE:** The psa-crypto-api-test takes between 30 minutes to 1 hour to =
run.
+
 External System tests
------------------------------------
+---------------------
=20
-************************************************************************=
***************
+**************************************************************
 Running the External System test command (systems-comms-tests)
-************************************************************************=
***************
+**************************************************************
=20
 Test 1: Releasing the External System out of reset
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
=20
 Run this command in the Linux command-line:
=20
@@ -1004,7 +1137,7 @@ The output on the External System terminal should b=
e:
    MHUv2 module 'MHU1_SE' started
=20
 Test 2: Communication
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 Test 2 releases the External System out of reset if not already done. Th=
en, it performs communication between host and External System.
=20
@@ -1014,7 +1147,7 @@ After running Test 1, run this command in the Linux=
 command-line:
=20
   systems-comms-tests 2
=20
-Additional output on the External System terminal will be printed: =20
+Additional output on the External System terminal will be printed:
=20
 ::
=20
@@ -1058,13 +1191,13 @@ The output on the Host terminal should be:
=20
=20
 Tests results
------------------------------------
+-------------
=20
-As a reference for the end user, reports for various tests for `Corstone=
-1000 software (CORSTONE1000-2022.11.23) <https://git.yoctoproject.org/me=
ta-arm/tag/?h=3DCORSTONE1000-2022.11.23>`__
-can be found in `here <https://gitlab.arm.com/arm-reference-solutions/ar=
m-reference-solutions-test-report/-/tree/master/embedded-a/corstone1000>`=
__.
+As a reference for the end user, reports for various tests for `Corstone=
-1000 software (CORSTONE1000-2023.06) <https://git.yoctoproject.org/meta-=
arm/tag/?h=3DCORSTONE1000-2023.06>`__
+can be found `here <https://gitlab.arm.com/arm-reference-solutions/arm-r=
eference-solutions-test-report/-/tree/master/embedded-a/corstone1000>`__.
=20
 Running the software on FVP on Windows
----------------------------------------------------------------
+--------------------------------------
=20
 If the user needs to run the Corstone-1000 software on FVP on Windows. T=
he user
 should follow the build instructions in this document to build on Linux =
host
@@ -1073,6 +1206,7 @@ and launch the FVP binary.
=20
 --------------
=20
-*Copyright (c) 2022, Arm Limited. All rights reserved.*
+*Copyright (c) 2022-2023, Arm Limited. All rights reserved.*
=20
 .. _Arm Ecosystem FVPs: https://developer.arm.com/tools-and-software/ope=
n-source-software/arm-platforms-software/arm-ecosystem-fvps
+.. _U-Boot repo: https://github.com/u-boot/u-boot.git
--=20
2.25.1


