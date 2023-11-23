Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B1FC636BD
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 10:43:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.88467.1700736180024115815
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Nov 2023 02:43:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22D261042;
	Thu, 23 Nov 2023 02:43:46 -0800 (PST)
Received: from e130802.arm.com (unknown [10.57.83.218])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86B9A3F73F;
	Thu, 23 Nov 2023 02:42:58 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH nanbield 3/4] arm-bsp/documentation: corstone1000: update the user guide
Date: Thu, 23 Nov 2023 10:42:47 +0000
Message-Id: <20231123104248.74503-3-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231123104248.74503-1-abdellatif.elkhlifi@arm.com>
References: <20231123104248.74503-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Nov 2023 10:43:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5253

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

align the user guide with the upcoming CORSTONE1000-2023.11 release

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../documentation/corstone1000/user-guide.rst | 165 ++++--------------
 1 file changed, 32 insertions(+), 133 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 838a04f1..2e5966b8 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -68,33 +68,33 @@ Trusted Firmware-A
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 Based on `Trusted Firmware-A <https://git.trustedfirmware.org/TF-A/trust=
ed-firmware-a.git>`__
=20
-+----------+------------------------------------------------------------=
-----------------------------------------+
-| bbappend | <_workspace>/meta-arm/meta-arm-bsp/recipes-bsp/trusted-firm=
ware-a/trusted-firmware-a_2.8.%.bbappend |
-+----------+------------------------------------------------------------=
-----------------------------------------+
-| Recipe   | <_workspace>/meta-arm/meta-arm/recipes-bsp/trusted-firmware=
-a/trusted-firmware-a_2.8.0.bb           |
-+----------+------------------------------------------------------------=
-----------------------------------------+
++----------+------------------------------------------------------------=
-------------------------------------+
+| bbappend | <_workspace>/meta-arm/meta-arm-bsp/recipes-bsp/trusted-firm=
ware-a/trusted-firmware-a_%.bbappend |
++----------+------------------------------------------------------------=
-------------------------------------+
+| Recipe   | <_workspace>/meta-arm/meta-arm/recipes-bsp/trusted-firmware=
-a/trusted-firmware-a_2.9.0.bb       |
++----------+------------------------------------------------------------=
-------------------------------------+
=20
 OP-TEE
 =3D=3D=3D=3D=3D=3D
 Based on `OP-TEE <https://git.trustedfirmware.org/OP-TEE/optee_os.git>`_=
_
=20
-+----------+------------------------------------------------------------=
------------------------+
-| bbappend | <_workspace>/meta-arm/meta-arm-bsp/recipes-security/optee/o=
ptee-os_3.20.0.bbappend |
-+----------+------------------------------------------------------------=
------------------------+
-| Recipe   | <_workspace>/meta-arm/meta-arm/recipes-security/optee/optee=
-os_3.20.0.bb           |
-+----------+------------------------------------------------------------=
------------------------+
++----------+------------------------------------------------------------=
----------------------------+
+| bbappend | <_workspace>/meta-arm/meta-arm-bsp/recipes-security/optee/o=
ptee-os_3.22.0.bbappend     |
++----------+------------------------------------------------------------=
----------------------------+
+| Recipe   | <_workspace>/meta-arm/meta-arm-bsp/recipes-security/optee/o=
ptee-os_3.22.0.bb           |
++----------+------------------------------------------------------------=
----------------------------+
=20
 U-Boot
 =3D=3D=3D=3D=3D=3D
 Based on `U-Boot repo`_
=20
-+----------+------------------------------------------------------------=
-------------+
-| bbappend | <_workspace>/meta-arm/meta-arm/recipes-bsp/u-boot/u-boot_%.=
bbappend     |
-+----------+------------------------------------------------------------=
-------------+
-| bbappend | <_workspace>/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t_%.bbappend |
-+----------+------------------------------------------------------------=
-------------+
-| Recipe   | <_workspace>/poky/meta/recipes-bsp/u-boot/u-boot_2023.01.bb=
             |
-+----------+------------------------------------------------------------=
-------------+
++----------+------------------------------------------------------------=
----------------+
+| bbappend | <_workspace>/meta-arm/meta-arm/recipes-bsp/u-boot/u-boot_%.=
bbappend        |
++----------+------------------------------------------------------------=
----------------+
+| bbappend | <_workspace>/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t_%.bbappend    |
++----------+------------------------------------------------------------=
----------------+
+| Recipe   | <_workspace>/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t_2023.07.02.bb |
++----------+------------------------------------------------------------=
----------------+
=20
 Linux
 =3D=3D=3D=3D=3D
@@ -107,30 +107,20 @@ recipe responsible for building a tiny version of L=
inux is listed below.
 +-----------+-----------------------------------------------------------=
-----------------------------------+
 | bbappend  | <_workspace>/meta-arm/meta-arm-bsp/recipes-kernel/linux/li=
nux-yocto_%.bbappend               |
 +-----------+-----------------------------------------------------------=
-----------------------------------+
-| Recipe    | <_workspace>/poky/meta/recipes-kernel/linux/linux-yocto_6.=
1.bb                               |
+| Recipe    | <_workspace>/poky/meta/recipes-kernel/linux/linux-yocto_6.=
5.bb                               |
 +-----------+-----------------------------------------------------------=
-----------------------------------+
 | defconfig | <_workspace>/meta-arm/meta-arm-bsp/recipes-kernel/linux/fi=
les/corstone1000/defconfig         |
 +-----------+-----------------------------------------------------------=
-----------------------------------+
=20
-External System Tests
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-Based on `Corstone-1000/applications <https://git.gitlab.arm.com/arm-ref=
erence-solutions/corstone1000/applications>`__
-
-+------------+----------------------------------------------------------=
-------------------------------------------------------------------------=
------------------------------------------------------------------+
-| Recipe     | <_workspace>/meta-arm/meta-arm-bsp/recipes-test/corstone1=
000-external-sys-tests/corstone1000-external-sys-tests_1.0.bb            =
                                                                  |
-+------------+----------------------------------------------------------=
-------------------------------------------------------------------------=
------------------------------------------------------------------+
-
-The recipe provides the systems-comms-tests command run in Linux and use=
d for testing the External System.
-
 **************************************************
 Software for Boot Processor (a.k.a Secure Enclave)
 **************************************************
 Based on `Trusted Firmware-M <https://git.trustedfirmware.org/TF-M/trust=
ed-firmware-m.git>`__
=20
 +----------+------------------------------------------------------------=
-----------------------------------------+
-| bbappend | <_workspace>/meta-arm/meta-arm-bsp/recipes-bsp/trusted-firm=
ware-m/trusted-firmware-m_1.7.%.bbappend |
+| bbappend | <_workspace>/meta-arm/meta-arm-bsp/recipes-bsp/trusted-firm=
ware-m/trusted-firmware-m_%.bbappend     |
 +----------+------------------------------------------------------------=
-----------------------------------------+
-| Recipe   | <_workspace>/meta-arm/meta-arm/recipes-bsp/trusted-firmware=
-m/trusted-firmware-m_1.7.0.bb           |
+| Recipe   | <_workspace>/meta-arm/meta-arm/recipes-bsp/trusted-firmware=
-m/trusted-firmware-m_1.8.1.bb           |
 +----------+------------------------------------------------------------=
-----------------------------------------+
=20
 ********************************
@@ -168,7 +158,7 @@ In the top directory of the workspace ``<_workspace>`=
`, run:
=20
 ::
=20
-    git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1000-=
2023.06
+    git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1000-=
2023.11
=20
 To build a Corstone-1000 image for MPS3 FPGA, run:
=20
@@ -343,7 +333,7 @@ A Yocto recipe is provided and allows to download the=
 latest supported FVP versi
=20
 The recipe is located at <_workspace>/meta-arm/meta-arm/recipes-devtools=
/fvp/fvp-corstone1000.bb
=20
-The latest supported Fixed Virtual Platform (FVP) version is 11.19_21 an=
d is automatically downloaded and installed when using the runfvp command=
 as detailed below. The FVP version can be checked by running the followi=
ng command:
+The latest supported Fixed Virtual Platform (FVP) version is 11_23.25 an=
d is automatically downloaded and installed when using the runfvp command=
 as detailed below. The FVP version can be checked by running the followi=
ng command:
=20
 ::
=20
@@ -374,8 +364,6 @@ The host will boot trusted-firmware-a, OP-TEE, U-Boot=
 and then Linux, and presen
=20
 Login using the username root.
=20
-The External System can be released out of reset on demand using the sys=
tems-comms-tests command.
-
 SystemReady-IR tests
 --------------------
=20
@@ -408,8 +396,8 @@ boot. Run following commands to build such image.
 ::
=20
   cd <_workspace>
-  git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1000-20=
23.06
-  git clone https://git.gitlab.arm.com/arm-reference-solutions/systemrea=
dy-patch.git -b CORSTONE1000-2023.06
+  git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1000-20=
23.11
+  git clone https://git.gitlab.arm.com/arm-reference-solutions/systemrea=
dy-patch.git -b CORSTONE1000-2023.11
   cp -f systemready-patch/embedded-a/corstone1000/erase_flash/0001-embed=
ded-a-corstone1000-clean-secure-flash.patch meta-arm
   cd meta-arm
   git apply 0001-embedded-a-corstone1000-clean-secure-flash.patch
@@ -595,7 +583,7 @@ Download u-boot under <_workspace> and install tools:
 Download systemready-patch repo under <_workspace>:
 ::
=20
-  git clone https://git.gitlab.arm.com/arm-reference-solutions/systemrea=
dy-patch.git -b CORSTONE1000-2023.06
+  git clone https://git.gitlab.arm.com/arm-reference-solutions/systemrea=
dy-patch.git -b CORSTONE1000-2023.11
=20
 *******************
 Generating Capsules
@@ -935,7 +923,7 @@ provided with the Debian installer image (see below).=
 This bug causes a fatal
 error when attempting to boot media installer for Debian, and it resets =
the MPS3 before installation starts.
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
@@ -947,7 +935,7 @@ documentation.
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
@@ -1129,7 +1117,7 @@ First, load FF-A TEE kernel module:
=20
 ::
=20
-  insmod /lib/modules/6.1.32-yocto-standard/extra/arm-ffa-tee.ko
+  insmod /lib/modules/*-yocto-standard/extra/arm-ffa-tee.ko
=20
 Then, check whether the FF-A TEE driver is loaded correctly by using the=
 following command:
=20
@@ -1154,105 +1142,16 @@ Now, run the PSA API tests in the following orde=
r:
=20
 **NOTE:** The psa-crypto-api-test takes between 30 minutes to 1 hour to =
run.
=20
-External System tests
----------------------
-
-**************************************************************
-Running the External System test command (systems-comms-tests)
-**************************************************************
-
-Test 1: Releasing the External System out of reset
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
-
-Run this command in the Linux command-line:
-
-::
-
-  systems-comms-tests 1
-
-The output on the External System terminal should be:
-
-::
-
-    ___  ___
-   |    / __|
-   |=3D=3D=3D \___
-   |___ |___/
-   External System Cortex-M3 Processor
-   Running RTX RTOS
-   v0.1.0_2022-10-19_16-41-32-8c9dca7
-   MHUv2 module 'MHU0_H' started
-   MHUv2 module 'MHU1_H' started
-   MHUv2 module 'MHU0_SE' started
-   MHUv2 module 'MHU1_SE' started
-
-Test 2: Communication
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Test 2 releases the External System out of reset if not already done. Th=
en, it performs communication between host and External System.
-
-After running Test 1, run this command in the Linux command-line:
-
-::
-
-  systems-comms-tests 2
-
-Additional output on the External System terminal will be printed:
-
-::
-
-   MHUv2: Message from 'MHU0_H': 0xabcdef1
-   Received 'abcdef1' From Host MHU0
-   CMD: Increment and return to sender...
-   MHUv2: Message from 'MHU1_H': 0xabcdef1
-   Received 'abcdef1' From Host MHU1
-   CMD: Increment and return to sender...
-
-When running Test 2 the first, Test 1 will be run in the background.
-
-The output on the External System terminal should be:
-
-::
-
-    ___  ___
-   |    / __|
-   |=3D=3D=3D \___
-   |___ |___/
-   External System Cortex-M3 Processor
-   Running RTX RTOS
-   v0.1.0_2022-10-19_16-41-32-8c9dca7
-   MHUv2 module 'MHU0_H' started
-   MHUv2 module 'MHU1_H' started
-   MHUv2 module 'MHU0_SE' started
-   MHUv2 module 'MHU1_SE' started
-   MHUv2: Message from 'MHU0_H': 0xabcdef1
-   Received 'abcdef1' From Host MHU0
-   CMD: Increment and return to sender...
-   MHUv2: Message from 'MHU1_H': 0xabcdef1
-   Received 'abcdef1' From Host MHU1
-   CMD: Increment and return to sender...
-
-The output on the Host terminal should be:
-
-::
-
-   Received abcdf00 from es0mhu0
-   Received abcdf00 from es0mhu1
-
-
 Tests results
 -------------
=20
-As a reference for the end user, reports for various tests for `Corstone=
-1000 software (CORSTONE1000-2023.06) <https://git.yoctoproject.org/meta-=
arm/tag/?h=3DCORSTONE1000-2023.06>`__
+As a reference for the end user, reports for various tests for `Corstone=
-1000 software (CORSTONE1000-2023.11) <https://git.yoctoproject.org/meta-=
arm/tag/?h=3DCORSTONE1000-2023.11>`__
 can be found `here <https://gitlab.arm.com/arm-reference-solutions/arm-r=
eference-solutions-test-report/-/tree/master/embedded-a/corstone1000>`__.
=20
-Running the software on FVP on Windows
---------------------------------------
+Running the software on FVP on Windows or AArch64 Linux
+------------------------------------------------------------
=20
-If the user needs to run the Corstone-1000 software on FVP on Windows. T=
he user
-should follow the build instructions in this document to build on Linux =
host
-PC, and copy the output binaries to the Windows PC where the FVP is loca=
ted,
-and launch the FVP binary.
+The user should follow the build instructions in this document to build =
on a Linux host machine. Then, copy the output binaries to the Windows or=
 Aarch64 Linux machine where the FVP is located. Then, launch the FVP bin=
ary.
=20
 Security Issue Reporting
 ------------------------
--=20
2.25.1


