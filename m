Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC65E77170
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 16:00:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.15089.1733414396712528098
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 05 Dec 2024 07:59:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BE9E1063;
	Thu,  5 Dec 2024 08:00:24 -0800 (PST)
Received: from e129527.arm.com (unknown [10.57.89.208])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 935B23F5A1;
	Thu,  5 Dec 2024 07:59:54 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH styhead 1/3] arm-bsp/documentation: corstone1000: Amend documentation for CORSTONE1000-2024.11 release
Date: Thu,  5 Dec 2024 15:59:46 +0000
Message-Id: <20241205155948.787069-2-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241205155948.787069-1-hugues.kambampiana@arm.com>
References: <20241205155948.787069-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 05 Dec 2024 16:00:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6273

* Fix typographical error in documentation.
* Add missing instructions.
* Create paragraphs where necessary to improve readability.
* Change `note` box to `important` box

* Remove verification of arm_tstee driver presence:
arm-tstee driver has been integrated in Linux v6.10.14 which is
the one used in the software stack. It is built as part of Linux and
is no longer a loadable module.
The steps to verify the driver presence are no longer applicable.

* Standardise naming of the target platform:
Consistently use the name `Corstone-1000` to refer to the target platform=
.

* Update Debian OS version from 12.4 to 12.7
Debian version 12.4 has a bug in Shim 15.7.
This bug causes a fatal error when attempting to boot media installer
for Debian,and resets the platform before installation starts.
A patch to skip the Shim was applied to Corstone-1000 to avoid
the error.
Debian version 12.7 no longer has the bug in the Shim thus making
the usage of the patch redundant.
Bump Debian installer to version 12.7 and remove usage of the patch
for the Debian installation test.

* Replace xterm with tmux:
Update the user guide to specify tmux instead of xterm.
Using tmux as opposed to xterm provides a better user experience
when running the commands listed on the user guide.

* Use ACS image for FVP SystemReady test:
Due to fixed timeout values in the meta-arm-systemready the ACS time
test do not complete successfully.
Instead, specify commands to use the pre-built ACS image.

* List Trusted Services as a host component:
Add Trusted Services to the list of components used on the Host processor
of the Corstone-1000. The various BitBake recipes and append files used t=
o
build Trusted Services are listed for the component.

* Update release version to CORSTONE1000-2024.11:
All references to the version of the Corstone-1000 software reference
stack have been updated from CORSTONE1000-2024.06 to CORSTONE1000-2024.11=
.
Add to the changelog the 2024.11 release information.
Add the 2024.11 release notes.

Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../documentation/corstone1000/change-log.rst |  63 ++++
 .../corstone1000/release-notes.rst            |   6 +
 .../corstone1000/software-architecture.rst    |  25 +-
 .../documentation/corstone1000/user-guide.rst | 289 ++++++++++--------
 4 files changed, 241 insertions(+), 142 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/change-log.rst b/met=
a-arm-bsp/documentation/corstone1000/change-log.rst
index f22a99c2..a98de3f9 100644
--- a/meta-arm-bsp/documentation/corstone1000/change-log.rst
+++ b/meta-arm-bsp/documentation/corstone1000/change-log.rst
@@ -11,6 +11,69 @@ This document contains a summary of the new features, =
changes and
 fixes in each release of Corstone-1000 software stack.
=20
=20
+***************
+Version 2024.11
+***************
+
+Changes
+=3D=3D=3D=3D=3D=3D=3D
+
+- Implementation of a replication strategy for FWU metadata in TF-M acco=
rding to the FWU specification.
+- Upgrade to metadata version 2 in TF-M.
+- Increase the ITS and PS memory size in Secure Flash for TF-M.
+- SW components upgrades.
+- Bug fixes.
+
+Corstone-1000 components versions
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
++-------------------------------------------+---------------------------=
--------------------------+
+| linux-yocto                               |                   6.10.14 =
                          |
++-------------------------------------------+---------------------------=
--------------------------+
+| u-boot                                    |                   2023.07.=
02                        |
++-------------------------------------------+---------------------------=
--------------------------+
+| external-system                           |                   0.1.0   =
                          |
++-------------------------------------------+---------------------------=
--------------------------+
+| optee-client                              |                   4.2.0   =
                          |
++-------------------------------------------+---------------------------=
--------------------------+
+| optee-os                                  |                   4.2.0   =
                          |
++-------------------------------------------+---------------------------=
--------------------------+
+| trusted-firmware-a                        |                   2.11.0  =
                          |
++-------------------------------------------+---------------------------=
--------------------------+
+| trusted-firmware-m                        |                   2.1.0   =
                          |
++-------------------------------------------+---------------------------=
--------------------------+
+| libts                                     |                   602be607=
19                        |
++-------------------------------------------+---------------------------=
--------------------------+
+| ts-newlib                                 |                   4.1.0   =
                          |
++-------------------------------------------+---------------------------=
--------------------------+
+| ts-psa-{crypto, iat, its. ps}-api-test    |                   74dc6646=
ff                        |
++-------------------------------------------+---------------------------=
--------------------------+
+| ts-sp-{se-proxy, smm-gateway}             |                   602be607=
19                        |
++-------------------------------------------+---------------------------=
--------------------------+
+
+Yocto distribution components versions
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
++-------------------------------------------+---------------------------=
---+
+| meta-arm                                  | styhead                   =
   |
++-------------------------------------------+---------------------------=
---+
+| poky                                      | 5465094be9                =
   |
++-------------------------------------------+---------------------------=
---+
+| meta-openembedded                         | 461d85a183                =
   |
++-------------------------------------------+---------------------------=
---+
+| meta-secure-core                          | 59d7e90542                =
   |
++-------------------------------------------+---------------------------=
---+
+| busybox                                   |                   1.36.1  =
   |
++-------------------------------------------+---------------------------=
---+
+| musl                                      |                   1.2.5   =
   |
++-------------------------------------------+---------------------------=
---+
+| gcc-arm-none-eabi                         |          13.3.rel1        =
   |
++-------------------------------------------+---------------------------=
---+
+| gcc-cross-aarch64                         |                   14.2.0  =
   |
++-------------------------------------------+---------------------------=
---+
+| openssl                                   |                   3.3.1   =
   |
++-------------------------------------------+---------------------------=
---+
+
 ***************
 Version 2024.06
 ***************
diff --git a/meta-arm-bsp/documentation/corstone1000/release-notes.rst b/=
meta-arm-bsp/documentation/corstone1000/release-notes.rst
index 0cad0266..bd85fae0 100644
--- a/meta-arm-bsp/documentation/corstone1000/release-notes.rst
+++ b/meta-arm-bsp/documentation/corstone1000/release-notes.rst
@@ -19,6 +19,12 @@ intended for safety-critical applications. Should Your=
 Software or Your Hardware
 prove defective, you assume the entire cost of all necessary servicing, =
repair
 or correction.
=20
+***********************
+Release notes - 2024.11
+***********************
+
+The same notes as the 2024.06 release still apply.
+
 ***********************
 Release notes - 2024.06
 ***********************
diff --git a/meta-arm-bsp/documentation/corstone1000/software-architectur=
e.rst b/meta-arm-bsp/documentation/corstone1000/software-architecture.rst
index 42278e38..a4e0a424 100644
--- a/meta-arm-bsp/documentation/corstone1000/software-architecture.rst
+++ b/meta-arm-bsp/documentation/corstone1000/software-architecture.rst
@@ -4,7 +4,7 @@
  # SPDX-License-Identifier: MIT
=20
 ######################
-Software architecture
+Software Architecture
 ######################
=20
=20
@@ -20,7 +20,7 @@ Corstone-1000 software plus hardware reference solution=
 is PSA Level-2 ready
 certified (`PSA L2 Ready`_) as well as System Ready IR certified(`SRIR c=
ert`_).
 More information on the Corstone-1000 subsystem product and design can b=
e
 found at:
-`Arm corstone1000 Software`_ and `Arm corstone1000 Technical Overview`_.
+`Arm Corstone-1000 Software`_ and `Arm Corstone-1000 Technical Overview`=
_.
=20
 This readme explicitly focuses on the software part of the solution and
 provides internal details on the software components. The reference
@@ -57,7 +57,7 @@ TrustedFirmware-M(`TF-M`_) as runtime software. The sof=
tware design on
 Secure Enclave follows Firmware Framework for M class
 processor (`FF-M`_) specification.
=20
-The Host System is based on ARM Cotex-A35 processor with standardized
+The Host System is based on ARM Cortex-A35 processor with standardized
 peripherals to allow for the booting of a Linux OS. The Cortex-A35 has
 the TrustZone technology that allows secure and non-secure security
 states in the processor. The software design in the Host System follows
@@ -213,15 +213,18 @@ Image (the initramfs bundle). The new images are ac=
cepted in the form of a UEFI
=20
 When Firmware update is triggered, U-Boot verifies the capsule by checki=
ng the
 capsule signature, version number and size. Then it signals the Secure E=
nclave
-that can start writing UEFI capsule into the flash. Once this operation =
finishes
-,Secure Enclave resets the entire system.
+that can start writing UEFI capsule into the flash.
+
+Once this operation finishes, Secure Enclave resets the entire system.
 The Metadata Block in the flash has the below firmware update state mach=
ine.
 TF-M runs an OTA service that is responsible for accepting and updating =
the
 images in the flash. The communication between the UEFI Capsule update
 subsystem and the OTA service follows the same data path explained above=
.
 The OTA service writes the new images to the passive bank after successf=
ul
 capsule verification. It changes the state of the system to trial state =
and
-triggers the reset. Boot loaders in Secure Enclave and Host read the Met=
adata
+triggers the reset.
+
+Boot loaders in Secure Enclave and Host read the Metadata
 block to get the information on the boot bank. In the successful trial s=
tage,
 the acknowledgment from the host moves the state of the system from tria=
l to
 regular. Any failure in the trial stage or system hangs leads to a syste=
m
@@ -258,17 +261,17 @@ calls are forwarded to the Secure Enclave as explai=
ned above.
 ***************
 References
 ***************
-`ARM corstone1000 Search`_
+`ARM Corstone-1000 Search`_
=20
 `Arm security features`_
=20
 --------------
=20
-*Copyright (c) 2022-2023, Arm Limited. All rights reserved.*
+*Copyright (c) 2022-2024, Arm Limited. All rights reserved.*
=20
-.. _Arm corstone1000 Technical Overview: https://developer.arm.com/docum=
entation/102360/0000
-.. _Arm corstone1000 Software: https://developer.arm.com/Tools%20and%20S=
oftware/Corstone-1000%20Software
-.. _Arm corstone1000 Search: https://developer.arm.com/search#q=3Dcorsto=
ne-1000
+.. _Arm Corstone-1000 Technical Overview: https://developer.arm.com/docu=
mentation/102360/0000
+.. _Arm Corstone-1000 Software: https://developer.arm.com/Tools%20and%20=
Software/Corstone-1000%20Software
+.. _Arm Corstone-1000 Search: https://developer.arm.com/search#q=3Dcorst=
one-1000
 .. _Arm security features: https://www.arm.com/architecture/security-fea=
tures/platform-security
 .. _linux repo: https://git.kernel.org/pub/scm/linux/kernel/git/stable/l=
inux.git/
 .. _FF-A: https://developer.arm.com/documentation/den0077/latest
diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 38ab92b9..0c7b2fd1 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -18,16 +18,17 @@ for more information.
 Prerequisites
 -------------
=20
-This guide assumes that your host machine is running Ubuntu 20.04 LTS, w=
ith at least
+This guide assumes that your host machine is running Ubuntu 20.04 LTS ( =
with ``sudo`` rights), with at least
 32GB of free disk space and 16GB of RAM as minimum requirement.
=20
 The following prerequisites must be available on the host system:
=20
-- Git 1.8.3.1 or greater
+- Git 1.8.3.1 or greater.
 - Python 3.8.0 or greater.
-- GNU Tar 1.28 or greater
+- GNU Tar 1.28 or greater.
 - GNU Compiler Collection 8.0 or greater.
-- GNU Make 4.0 or greater
+- GNU Make 4.0 or greater.
+- tmux.
=20
 Please follow the steps described in the Yocto mega manual:
=20
@@ -49,7 +50,7 @@ The Corstone-1000 software stack can be run on:
 Yocto Stable Branch
 -------------------
=20
-Corstone-1000 software stack is built on top of Yocto scarthgap release.
+Corstone-1000 software stack is built on top of Yocto styhead release.
=20
 Software Components
 -------------------
@@ -58,7 +59,7 @@ a `BitBake recipe <https://docs.yoctoproject.org/bitbak=
e/2.2/bitbake-user-manual
 The recipes specific to the Corstone-1000 BSP are located at:
 ``$WORKSPACE/meta-arm/meta-arm-bsp/``.
=20
-.. note::
+.. important::
=20
     ``$WORKSPACE`` refers to the absolute path to your workspace where t=
he `meta-arm` repository will be cloned.
=20
@@ -83,16 +84,49 @@ Host Processor Components
 +----------+------------------------------------------------------------=
-----------------------------------------+
 | bbappend | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-bsp/trusted-firm=
ware-a/trusted-firmware-a_%.bbappend``   |
 +----------+------------------------------------------------------------=
-----------------------------------------+
-| Recipe   | ``$WORKSPACE/meta-arm/meta-arm/recipes-bsp/trusted-firmware=
-a/trusted-firmware-a_2.10.4.bb``        |
+| Recipe   | ``$WORKSPACE/meta-arm/meta-arm/recipes-bsp/trusted-firmware=
-a/trusted-firmware-a_2.11.0.bb``        |
 +----------+------------------------------------------------------------=
-----------------------------------------+
=20
+`Trusted Services <https://trusted-services.readthedocs.io/en/latest/ind=
ex.html>`__
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
++----------+------------------------------------------------------------=
-----------------------------------------------+
+| bbappend | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-security/trusted=
-services/libts_%.bbappend``                   |
++----------+------------------------------------------------------------=
-----------------------------------------------+
+| bbappend | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-security/trusted=
-services/ts-psa-crypto-api-test_%.bbappend``  |
++----------+------------------------------------------------------------=
-----------------------------------------------+
+| bbappend | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-security/trusted=
-services/ts-psa-iat-api-test_%.bbappend``     |
++----------+------------------------------------------------------------=
-----------------------------------------------+
+| bbappend | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-security/trusted=
-services/ts-psa-its-api-test_%.bbappend``     |
++----------+------------------------------------------------------------=
-----------------------------------------------+
+| bbappend | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-security/trusted=
-services/ts-psa-ps-api-test_%.bbappend``      |
++----------+------------------------------------------------------------=
-----------------------------------------------+
+| bbappend | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-security/trusted=
-services/ts-sp-se-proxy_%.bbappend``          |
++----------+------------------------------------------------------------=
-----------------------------------------------+
+| bbappend | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-security/trusted=
-services/ts-sp-smm-gateway_%.bbappend``       |
++----------+------------------------------------------------------------=
-----------------------------------------------+
+| Recipe   | ``$WORKSPACE/meta-arm/meta-arm/recipes-security/trusted-ser=
vices/libts_git.bb``                           |
++----------+------------------------------------------------------------=
-----------------------------------------------+
+| Recipe   | ``$WORKSPACE/meta-arm/meta-arm/recipes-security/trusted-ser=
vices/ts-psa-crypto-api-test_git.bb``          |
++----------+------------------------------------------------------------=
-----------------------------------------------+
+| Recipe   | ``$WORKSPACE/meta-arm/meta-arm/recipes-security/trusted-ser=
vices/ts-psa-iat-api-test_git.bb``             |
++----------+------------------------------------------------------------=
-----------------------------------------------+
+| Recipe   | ``$WORKSPACE/meta-arm/meta-arm/recipes-security/trusted-ser=
vices/ts-psa-its-api-test_git.bb``             |
++----------+------------------------------------------------------------=
-----------------------------------------------+
+| Recipe   | ``$WORKSPACE/meta-arm/meta-arm/recipes-security/trusted-ser=
vices/ts-psa-ps-api-test_git.bb``              |
++----------+------------------------------------------------------------=
-----------------------------------------------+
+| Recipe   | ``$WORKSPACE/meta-arm/meta-arm/recipes-security/trusted-ser=
vices/ts-sp-smm-gateway.bb``                   |
++----------+------------------------------------------------------------=
-----------------------------------------------+
+| Recipe   | ``$WORKSPACE/meta-arm/meta-arm/recipes-security/trusted-ser=
vices/ts-sp-se-proxy.bb``                      |
++----------+------------------------------------------------------------=
-----------------------------------------------+
+
 `OP-TEE <https://git.trustedfirmware.org/OP-TEE/optee_os.git>`__
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 +----------+------------------------------------------------------------=
----------------------------+
 | bbappend | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-security/optee/o=
ptee-os_4.%.bbappend``      |
 +----------+------------------------------------------------------------=
----------------------------+
-| Recipe   | ``$WORKSPACE/meta-arm/meta-arm/recipes-security/optee/optee=
-os_4.1.0.bb``              |
+| Recipe   | ``$WORKSPACE/meta-arm/meta-arm/recipes-security/optee/optee=
-os_4.2.0.bb``              |
 +----------+------------------------------------------------------------=
----------------------------+
=20
 `U-Boot <https://github.com/u-boot/u-boot.git>`__
@@ -116,7 +150,7 @@ The provided distribution is based on `BusyBox <https=
://www.busybox.net/>`__ and
 +-----------+-----------------------------------------------------------=
-----------------------------------+
 | bbappend  | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-kernel/linux/li=
nux-yocto_%.bbappend``             |
 +-----------+-----------------------------------------------------------=
-----------------------------------+
-| Recipe    | ``$WORKSPACE/poky/meta/recipes-kernel/linux/linux-yocto_6.=
6.bb``                             |
+| Recipe    | ``$WORKSPACE/poky/meta/recipes-kernel/linux/linux-yocto_6.=
10.bb``                            |
 +-----------+-----------------------------------------------------------=
-----------------------------------+
 | defconfig | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-kernel/linux/fi=
les/corstone1000/defconfig``       |
 +-----------+-----------------------------------------------------------=
-----------------------------------+
@@ -131,7 +165,7 @@ Secure Enclave Components
 +----------+------------------------------------------------------------=
-----------------------------------------+
 | bbappend | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-bsp/trusted-firm=
ware-m/trusted-firmware-m_%.bbappend``   |
 +----------+------------------------------------------------------------=
-----------------------------------------+
-| Recipe   | ``$WORKSPACE/meta-arm/meta-arm/recipes-bsp/trusted-firmware=
-m/trusted-firmware-m_2.0.0.bb``         |
+| Recipe   | ``$WORKSPACE/meta-arm/meta-arm/recipes-bsp/trusted-firmware=
-m/trusted-firmware-m_2.1.0.bb``         |
 +----------+------------------------------------------------------------=
-----------------------------------------+
=20
 ************************************
@@ -182,7 +216,7 @@ Build
     .. code-block:: console
=20
         cd $WORKSPACE
-        git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1=
000-2024.06
+        git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1=
000-2024.11
=20
 #. Build a Corstone-1000 image:
=20
@@ -414,7 +448,7 @@ instructions of the installer to setup the FVP.
     .. code-block:: console
=20
         kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l \
-        -c "../meta-arm/scripts/runfvp --terminals=3Dxterm"
+        -c "../meta-arm/scripts/runfvp --terminals=3Dtmux"
=20
     When the script is executed, three terminal instances will be launch=
ed:
=20
@@ -460,14 +494,13 @@ Clean Secure Flash
     .. code-block:: console
=20
         cd $WORKSPACE
-        git clone https://git.gitlab.arm.com/arm-reference-solutions/sys=
temready-patch.git -b CORSTONE1000-2024.06
+        git clone https://git.gitlab.arm.com/arm-reference-solutions/sys=
temready-patch.git -b CORSTONE1000-2024.11
=20
 #. Copy the secure flash cleaning Git patch file to your copy of `meta-a=
rm`.
=20
     .. code-block:: console
=20
         cp -f systemready-patch/embedded-a/corstone1000/erase_flash/0001=
-embedded-a-corstone1000-clean-secure-flash.patch meta-arm
-        cd meta-arm
=20
 #. Apply the Git patch to `meta-arm`.
=20
@@ -481,7 +514,9 @@ Clean Secure Flash
     .. code-block:: console
=20
         cd $WORKSPACE
-        kas build meta-arm/kas/corstone1000-mps3.yml:meta-arm/ci/debug.y=
ml
+        kas shell meta-arm/kas/corstone1000-mps3.yml:meta-arm/ci/debug.y=
ml
+        bitbake -c cleansstate trusted-firmware-m corstone1000-flash-fir=
mware-image
+        bitbake -c build corstone1000-flash-firmware-image
=20
 #. Replace the ``bl1.bin`` file on the SD card with ``$WORKSPACE/build/t=
mp/deploy/images/corstone1000-mps3/bl1.bin``.
=20
@@ -495,6 +530,15 @@ Clean Secure Flash
         NOW YOU CAN FLASH THE ACTUAL CORSTONE1000 IMAGE
         PLEASE REMOVE THE LATEST ERASE SECURE FLASH PATCH AND BUILD THE =
IMAGE AGAIN
=20
+#. Whilst still in the ``kas`` shell, revert the changes the patch intro=
duced by running the following commands:
+
+    .. code-block:: console
+
+        cd $WORKSPACE/meta-arm
+        git reset --hard
+        cd ..
+        bitbake -c cleansstate trusted-firmware-m corstone1000-flash-fir=
mware-image
+        exit
=20
 #. Follow the `instructions <building-the-software-stack_>`__ to build a=
 clean software stack and flash the MPS3 with it.
=20
@@ -561,7 +605,7 @@ MPS3
     .. code-block:: console
=20
         sudo dd \
-        if=3D$WORKSPACE/build/tmp/deploy/images/corstone1000-mps3/corsto=
ne1000-esp-image-costickrstone1000-mps3.wic \
+        if=3D$WORKSPACE/build/tmp/deploy/images/corstone1000-mps3/corsto=
ne1000-esp-image-corstone1000-mps3.wic \
         of=3D/dev/sdb \
         iflag=3Ddirect oflag=3Ddirect status=3Dprogress bs=3D512; sync;
=20
@@ -625,8 +669,6 @@ This sections below describe how to build and run ACS=
 tests on Corstone-1000.
=20
 .. _mps3-instructions-for-acs-image:
=20
-MPS3
-=3D=3D=3D=3D
=20
 #. On your host development machine, clone the `Arm SystemReady ACS repo=
sitory <https://github.com/ARM-software/arm-systemready/>`_.
=20
@@ -647,6 +689,16 @@ MPS3
         and full USB support for Corstone-1000 will be available in the =
repository with the next
         SystemReady release.
=20
+#. Decompress the pre-built ACS live image.
+
+    .. code-block:: console
+
+        cd $WORKSPACE/arm-systemready/IR/prebuilt_images/v23.09_2.1.0
+        unxz ir-acs-live-image-generic-arm64.wic.xz
+
+MPS3
+=3D=3D=3D=3D
+
 #. Connect a USB drive (other than the one used for the ESP) to the host=
 development machine.
=20
 #. Run the following command to discover which device is your USB drive:
@@ -666,7 +718,6 @@ MPS3
     .. code-block:: console
=20
         cd $WORKSPACE/arm-systemready/IR/prebuilt_images/v23.09_2.1.0
-        unxz ir-acs-live-image-generic-arm64.wic.xz
         sudo dd if=3Dir-acs-live-image-generic-arm64.wic of=3D/dev/sdc i=
flag=3Ddirect oflag=3Ddirect bs=3D1M status=3Dprogress; sync
=20
 #. Plug the USB drive to the MPS3. At this point you should have both th=
e USB drive with the ESP and the USB drive with the ACS image plugged to =
the MPS3.
@@ -679,29 +730,48 @@ The MPS3 will reset multiple times during the test,=
 and it might take approximat
=20
     Unplug the ESP USB drive from the MPS3 if it is preventing GRUB
     from finding the bootable partition. Leave only the ACS image USB dr=
ive
-    plugged in to run the ACS tests. The ESP USB drive can be plugged in=
 again after
-    the platform is booted to Linux at the end of the ACS tests.
+    plugged in to run the ACS tests.
=20
+    The ESP USB drive can be plugged in again after
+    selecting the `Linux Boot` option in the GRUB menu at the end of the=
 ACS tests.
+
+.. warning::
+
+    A timeout issue has been observed while booting Linux during the ACS=
 tests, causing the system to boot into emergency mode.
+    Booting Linux is necessary to run certain tests, such as `dt-validat=
ion`.
+    The following workaround is required to enable Linux to boot properl=
y and perform all Linux-based tests:
+
+    #. Press Enter at the Linux prompt.
+    #. Open the file `/etc/systemd/system.conf` and set `DefaultDeviceTi=
meoutSec=3Dinfinity`.
+    #. Reboot the platform using the `reboot` command.
+    #. Select the `Linux Boot` option from the GRUB menu.
+    #. Allow Linux to boot and run the remaining ACS tests until complet=
ion.
=20
 .. _fvp-instructions-for-acs-image:
=20
 FVP
 =3D=3D=3D
=20
-FVP has been integrated in the `meta-arm-systemready Yocto layer <https:=
//git.yoctoproject.org/meta-arm/plain/meta-arm-systemready>`__.
=20
-Find more details about the `meta-arm-systemready` Yocto layer from its =
`README <https://git.yoctoproject.org/meta-arm/plain/meta-arm-systemready=
/README.md>`__ file.
-
-Run the following command to build the firmware image with the specific =
kas configuration file for building an image with the ACS tests baked in:
+Run the commands below to run the ACS test on FVP using the built firmwa=
re image and the pre-built ACS image identified above:
=20
 .. code-block:: console
=20
-    kas build meta-arm/ci/corstone1000-fvp.yml:meta-arm/ci/debug.yml:met=
a-arm/kas/arm-systemready-ir-acs.yml
+    cd $WORKSPACE
+    tmux
+    ./meta-arm/scripts/runfvp \
+    --terminals=3Dtmux \
+    ./build/tmp/deploy/images/corstone1000-fvp/corstone1000-flash-firmwa=
re-image-corstone1000-fvp.fvpconf \
+    -- -C board.msd_mmc.p_mmc_file=3D$WORKSPACE/arm-systemready/IR/prebu=
ilt_images/v23.09_2.1.0/ir-acs-live-image-generic-arm64.wic
=20
=20
 .. note::
+    The FVP will reset multiple times during the test.
     The ACS tests might take up to 1 day to complete when run on FVP.
=20
+The message `ACS run is completed` will be displayed on the FVP host ter=
minal when the test runs to completion.
+You will be prompted to press the Enter key to access the Linux prompt.
+
=20
 Test Sequence and Results
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
@@ -718,8 +788,14 @@ The results can be fetched from the `acs_results` fo=
lder in the ``BOOT`` partiti
=20
 .. note::
=20
-    The FVP uses the ``$WORKSPACE/build/tmp-glibc/work/corstone1000_fvp-=
oe-linux/arm-systemready-ir-acs/2.0.0/deploy-arm-systemready-ir-acs/arm-s=
ystemready-ir-acs-corstone1000-fvp.wic``
-    image if the `meta-arm-systemready` Yocto layer is used. The results=
 can be checked in this image.
+    Access the `acs_results` folder in FVP by running the following comm=
ands:
+
+    .. code-block:: console
+
+        sudo mkdir /mnt/test
+        sudo mount -o rw,offset=3D1048576 \
+        $WORKSPACE/arm-systemready/IR/prebuilt_images/v23.09_2.1.0/ir-ac=
s-live-image-generic-arm64.wic \
+        /mnt/test
=20
 #####################################################
=20
@@ -781,10 +857,18 @@ Run the following commands to generate an invalid c=
apsule with a ``fw-version``
    --private-key build/tmp/deploy/images/corstone1000-$TARGET/corstone10=
00_capsule_key.key \
    --certificate build/tmp/deploy/images/corstone1000-$TARGET/corstone10=
00_capsule_cert.crt \
    --index 1 \
-   --guid df1865d1-90fb-4d59-9c38-c9f2c1bba8cc \
+   --guid $TARGET_GUID \
    --fw-version 5 build/tmp/deploy/images/corstone1000-$TARGET/corstone1=
000-$TARGET_image.nopt \
    corstone1000-$TARGET-v5.uefi.capsule
=20
+
+.. important::
+
+    ``$TARGET_GUID`` is different depending on whether the capsule is bu=
ilt for the ``fvp`` or ``mps3`` ``$TARGET``.
+
+    - ``fvp`` ``$TARGET_GUID`` is ``989f3a4e-46e0-4cd0-9877-a25c70c01329=
``
+    - ``mps3`` ``$TARGET_GUID`` is ``df1865d1-90fb-4d59-9c38-c9f2c1bba8c=
c``
+
 The invalid capsule will be located in the ``$WORKSPACE`` directory.
=20
 ***************************
@@ -889,7 +973,7 @@ Positive Capsule Update Test
       .. code-block:: console
=20
         kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l \
-        -c "../meta-arm/scripts/runfvp --terminals=3Dxterm \
+        -c "../meta-arm/scripts/runfvp --terminals=3Dtmux \
         -- -C board.msd_mmc.p_mmc_file=3D$ACS_IMAGE_PATH/ir-acs-live-ima=
ge-generic-arm64.wic"
=20
       .. warning::
@@ -911,9 +995,17 @@ Positive Capsule Update Test
=20
 #. Run the ``CapsuleApp`` application with the valid capsule file:
=20
-    .. code-block:: console
+    - MPS3:
+
+        .. code-block:: console
+
+            EFI/BOOT/app/CapsuleApp.efi EFI/BOOT/corstone1000-mps3-v6.ue=
fi.capsule
=20
-        EFI/BOOT/app/CapsuleApp.efi corstone1000-$TARGET-v6.uefi.capsule
+    - FVP:
+
+        .. code-block:: console
+
+            EFI/BOOT/app/CapsuleApp.efi corstone1000-fvp-v6.uefi.capsule
=20
     The capsule update will be started.
=20
@@ -1013,11 +1105,25 @@ Negative Capsule Update Test
=20
         Press ESC in 4 seconds to skip startup.nsh or any other key to c=
ontinue.
=20
-#. Run the ``CapsuleApp`` application with the invalid capsule file:
+#. Access the content of the first file system (``File System 0``) where=
 we copied the capsule files by running the following command:
=20
     .. code-block:: console
=20
-        EFI/BOOT/app/CapsuleApp.efi corstone1000-$TARGET-v5.uefi.capsule
+        FS0:
+
+#. Run the ``CapsuleApp`` application with the invalid capsule file:
+
+    - MPS3:
+
+        .. code-block:: console
+
+            EFI/BOOT/app/CapsuleApp.efi EFI/BOOT/corstone1000-mps3-v5.ue=
fi.capsule
+
+    - FVP:
+
+        .. code-block:: console
+
+            EFI/BOOT/app/CapsuleApp.efi corstone1000-fvp-v5.uefi.capsule
=20
=20
 #. TrustedFirmware-M should reject the capsule due to having a lower fir=
mware version and display the following log on the Secure Enclave termina=
l (``ttyUSB1``):
@@ -1107,83 +1213,6 @@ The Linux distributions to be installed are:
=20
 Follow the instructions below to install the Linux distributions to the =
Corstone-1000 software stack.
=20
-***********************************
-Apply Patch for Debian Installation
-***********************************
-
-.. warning::
-    **!!Debian ONLY!!**
-
-    There is a known issue in `Shim 15.7 <https://salsa.debian.org/efi-t=
eam/shim/-/tree/upstream/15.7?ref_type=3Dtags>`__
-    provided with the Debian installer image.
-    This bug causes a fatal error when attempting to boot media installe=
r for Debian, and resets the platform before installation starts.
-   =20
-    A `patch <debian-skip-shim-patch>`__ to be applied to the Corstone-1=
000 software stack is provided to skip the Shim.
-    This patch makes U-Boot automatically bypass the Shim and run GRUB t=
o allow
-    the user to proceed with a normal installation.
-   =20
-    You are encourage to try a new installer if at the moment of reading=
 this document the Shim problem has been solved.
-    Otherwise, please apply the patch as indicated by the instructions b=
elow.
-
-#. Clone the repository containing the patch in your ``$WORKSPACE``:
-
-    .. code-block:: console
-
-        cd $WORKSPACE
-        git clone https://git.gitlab.arm.com/arm-reference-solutions/sys=
temready-patch.git -b CORSTONE1000-2024.06
-
-#. Copy the Git patch file to your local copy of `meta-arm` in your work=
space:
-
-    .. code-block:: console
-
-        cp -f systemready-patch/embedded-a/corstone1000/shim/0001-arm-bs=
p-u-boot-corstone1000-Skip-the-shim-by-booting.patch meta-arm
-
-#. Change the current working directory to your local copy of the `meta-=
arm` repository to apply the Git patch:
-
-    .. code-block:: console
-
-        cd meta-arm
-        git am 0001-arm-bsp-u-boot-corstone1000-Skip-the-shim-by-booting=
.patch
-
-#. Change the current working directory back to your ``$WORKSPACE``:
-
-    .. code-block:: console
-
-        cd $WORKSPACE
-
-#. Initialize a kas shell environment using the debug configuration file=
 for your target to:
-
-   - remove build artefacts (for ``u-boot``, ``trusted-firmware-a``, and=
 ``corstone1000-flash-firmware-image``)
-   - reset the state of those recipes
-   - re-build the ``corstone1000-flash-firmware-image`` recipe from scra=
tch
-
-    .. code-block:: console
-   =20
-        kas shell meta-arm/kas/corstone1000-$TARGET.yml:meta-arm/ci/debu=
g.yml \
-        -c=3D"bitbake u-boot trusted-firmware-a corstone1000-flash-firmw=
are-image -c cleansstate; \
-        bitbake corstone1000-flash-firmware-image"
-
-.. important::
-
-    On MPS3, replace the ``cs1000.bin`` on the SD card with the newly ge=
nerated ``*.wic`` file.
-
-.. warning::
-
-    The Corstone-1000 patch for Debian installation must be removed from=
 `meta-arm` before running the software to boot openSUSE or
-    executing any other tests in this user guide.
-   =20
-    Remove the patch and rebuild the ``corstone1000-flash-firmware-image=
`` recipe by running the following commands:
-
-    .. code-block:: console
-
-        cd $WORKSPACE/meta-arm
-        git reset --hard HEAD~1
-        cd $WORKSPACE
-        kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l \
-        -c=3D"bitbake u-boot -c cleanall; bitbake trusted-firmware-a -c =
cleanall; \
-        bitbake corstone1000-flash-firmware-image -c cleanall; \
-        bitbake corstone1000-flash-firmware-image"
-
 **************************
 Prepare Installation Media
 **************************
@@ -1194,7 +1223,7 @@ Follow the instructions below to create the install=
ation media.
=20
 #. Using your development machine, download one of following Linux distr=
ibution images:
=20
-    - `Debian installer image <https://cdimage.debian.org/mirror/cdimage=
/archive/12.4.0/arm64/iso-dvd/>`__
+    - `Debian installer image <https://cdimage.debian.org/mirror/cdimage=
/archive/12.7.0/arm64/iso-dvd/>`__
     - `OpenSUSE Tumbleweed installer image <http://download.opensuse.org=
/ports/aarch64/tumbleweed/iso/>`__=20
=20
     .. note::
@@ -1246,7 +1275,7 @@ Corstone-1000 on-board non-volatile storage size is=
 insufficient for installing
         #. Do not yet connect this blank USB drive to the MPS3. It will =
be used as the primary drive to boot the distribution.
=20
     - FVP:
-        #. Create an 8GB GUID Partition Table (GPT) formatted MultiMedia=
Card (MMC) image.
+        #. Create an 10 GB GUID Partition Table (GPT) formatted MultiMed=
iaCard (MMC) image.
=20
             .. code-block:: console
=20
@@ -1295,7 +1324,7 @@ FVP
     .. code-block:: console
=20
         kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l \
-        -c "../meta-arm/scripts/runfvp --terminals=3Dxterm -- \
+        -c "../meta-arm/scripts/runfvp --terminals=3Dtmux -- \
         -C board.msd_mmc.p_mmc_file=3D$WORKSPACE/fvp_distro_system_drive=
.img \
         -C board.msd_mmc_2.p_mmc_file=3D$DISTRO_INSTALLER_ISO_PATH"
=20
@@ -1361,8 +1390,8 @@ Boot Distribution
     .. code-block:: console
=20
         kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l \
-        -c "../meta-arm/scripts/runfvp --terminals=3Dxterm -- \
-        -C board.msd_mmc.p_mmc_file=3D$WORKSPACE/fvp_distro_system_drive=
.img.img"
+        -c "../meta-arm/scripts/runfvp --terminals=3Dtmux -- \
+        -C board.msd_mmc.p_mmc_file=3D$WORKSPACE/fvp_distro_system_drive=
.img"
=20
     .. warning::
=20
@@ -1460,7 +1489,7 @@ Generate Keys, Signed Image and Unsigned Image
         cd $WORKSPACE
=20
         git clone https://git.gitlab.arm.com/arm-reference-solutions/sys=
temready-patch.git \
-        -b CORSTONE1000-2024.06
+        -b CORSTONE1000-2024.11
=20
 #. Set the current working directory to build directory's subdirectory c=
ontaining the software stack build images.
=20
@@ -1718,14 +1747,6 @@ The steps below are applicable to both MPS3 and FV=
P).
=20
 #. Start the Corstone-1000 and wait until it boots to Linux on the Host =
Processor terminal (``ttyUSB2``).
=20
-#. Verify that the `arm_tstee` driver is present.
-
-    .. code-block:: console
-
-        ls /sys/bus/arm_ffa/drivers | grep arm_tstee
-
-    ``arm_tstee`` should be printed on the terminal to confirm that the =
driver is present.
-
 #. Run the PSA API tests by running the commands below in the order show=
n:
=20
     .. code-block:: console
@@ -1747,13 +1768,13 @@ External System Processor
 The Linux operating system running on the Host Processor starts the ``re=
moteproc`` framework to manage the External System Processor.
=20
=20
-#. Start the External System Processor with the following command:
+#. Stop the External System Processor with the following command:
=20
     .. code-block:: console
=20
         echo stop > /sys/class/remoteproc/remoteproc0/state
=20
-#. Stop the External System Processor with the following command:
+#. Start the External System Processor with the following command:
=20
     .. code-block:: console
=20
@@ -1811,7 +1832,7 @@ The build and integration instructions can be found=
 in its `README <secure-debug
 The `secure-debug-manager` repository also contains the private key and =
chain certificate to be used during the tests.
 The private key's public pair is provisioned into the One-Time Programma=
ble memory in TrustedFirmware-M. These are dummy keys that should not be =
used in production.
=20
-A debug probe (DSTREAM family) and an Arm Development Studio 2022.2 and =
2022.c (or later) are needed to test the Secure Debug feature.
+To test the Secure Debug feature, you'll need a debug probe from the DST=
REAM family and Arm Development Studio versions 2022.2, 2022.c, or 2023.a=
.
=20
=20
 #. Clone the `secure-debug-manager` repository to your workspace.
@@ -1821,6 +1842,13 @@ A debug probe (DSTREAM family) and an Arm Developm=
ent Studio 2022.2 and 2022.c (
         cd $WORKSPACE
         git clone https://github.com/ARM-software/secure-debug-manager.g=
it
=20
+#. Navigate into the repository directory and checkout the specific comm=
it in the listing below.
+
+    .. code-block:: console
+
+        cd $WORKSPACE/secure-debug-manager
+        git checkout b30d6496ca749123e86b39b161b9f70ef76106d6
+
 #. Follow the steps in the `secure-debug-manager`'s `README <secure-debu=
g-manager-repo-readme_>`__ for the development machine setup.
=20
 #. Rebuild the software stack with Secure Debug.
@@ -1873,8 +1901,8 @@ A debug probe (DSTREAM family) and an Arm Developme=
nt Studio 2022.2 and 2022.c (
=20
 Reports
 -------
-Various test reports for the `Corstone-1000 software (CORSTONE1000-2024.=
06) <https://git.yoctoproject.org/meta-arm/tag/?h=3DCORSTONE1000-2024.06>=
`__=20
-release version are available for reference `here <https://gitlab.arm.co=
m/arm-reference-solutions/arm-reference-solutions-test-report/-/tree/CORS=
TONE1000-2024.06/embedded-a/corstone1000/CORSTONE1000-2024.06?ref_type=3D=
tags>`__.
+Various test reports for the `Corstone-1000 software (CORSTONE1000-2024.=
11) <https://git.yoctoproject.org/meta-arm/tag/?h=3DCORSTONE1000-2024.11>=
`__
+release version are available for reference `here <https://gitlab.arm.co=
m/arm-reference-solutions/arm-reference-solutions-test-report/-/tree/CORS=
TONE1000-2024.11/embedded-a/corstone1000/CORSTONE1000-2024.11?ref_type=3D=
tags>`__.
=20
=20
 --------------
@@ -1882,5 +1910,4 @@ release version are available for reference `here <=
https://gitlab.arm.com/arm-re
 *Copyright (c) 2022-2024, Arm Limited. All rights reserved.*
=20
 .. _Arm Ecosystem FVPs: https://developer.arm.com/tools-and-software/ope=
n-source-software/arm-platforms-software/arm-ecosystem-fvps
-.. _debian-skip-shim-patch: https://gitlab.arm.com/arm-reference-solutio=
ns/systemready-patch/-/blob/CORSTONE1000-2024.06/embedded-a/corstone1000/=
shim/0001-arm-bsp-u-boot-corstone1000-Skip-the-shim-by-booting.patch
 .. _secure-debug-manager-repo-readme: https://github.com/ARM-software/se=
cure-debug-manager/blob/master/README.md

