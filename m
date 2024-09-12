Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 407EBEED609
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 13:47:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.48241.1726148854860804549
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Sep 2024 06:47:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 615BCDA7;
	Thu, 12 Sep 2024 06:48:03 -0700 (PDT)
Received: from e129527.arm.com (unknown [10.57.77.73])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A613D3F64C;
	Thu, 12 Sep 2024 06:47:32 -0700 (PDT)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH] arm-bsp/documentation: corstone1000: Improve user guide
Date: Thu, 12 Sep 2024 14:47:28 +0100
Message-Id: <20240912134728.700901-1-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 Sep 2024 13:47:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6074

Includes:
* Sentence clarifications
* Usage of list numbering where steps are given
* Usage of code syntax where appropriate
* Usage of RST syntax for notes
* Appropriate capitalization of component names
* Consistently use the term MPS3 to refer to the physical hardware
* Present tests in a clear and consistent manner
* Wrap commands to reduce horizontal scrolling
* Creating paragraphs to improve readability
* Usage of shell variables for placeholders so user can
  create their shell variables and use the provided commands
  as in the user guide.

Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
---
 .../documentation/corstone1000/user-guide.rst | 2350 ++++++++++-------
 1 file changed, 1324 insertions(+), 1026 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 58231731..38ab92b9 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -3,15 +3,15 @@
  #
  # SPDX-License-Identifier: MIT
=20
-#####################################
-User Guide: Build & run the software
-#####################################
+####################
+Build, Flash and Run
+####################
=20
 Notice
 ------
 The Corstone-1000 software stack uses the `Yocto Project <https://www.yo=
ctoproject.org/>`__ to build
 a tiny Linux distribution suitable for the Corstone-1000 platform (kerne=
l and initramfs filesystem less than 5 MB on the flash).
-The Yocto Project relies on the `Bitbake <https://docs.yoctoproject.org/=
bitbake.html#bitbake-documentation>`__
+The Yocto Project relies on the `BitBake <https://docs.yoctoproject.org/=
bitbake.html#bitbake-documentation>`__
 tool as its build tool. Please see `Yocto Project documentation <https:/=
/docs.yoctoproject.org/>`__
 for more information.
=20
@@ -24,10 +24,10 @@ This guide assumes that your host machine is running =
Ubuntu 20.04 LTS, with at l
 The following prerequisites must be available on the host system:
=20
 - Git 1.8.3.1 or greater
-- tar 1.28 or greater
 - Python 3.8.0 or greater.
-- gcc 8.0 or greater.
-- GNU make 4.0 or greater
+- GNU Tar 1.28 or greater
+- GNU Compiler Collection 8.0 or greater.
+- GNU Make 4.0 or greater
=20
 Please follow the steps described in the Yocto mega manual:
=20
@@ -41,470 +41,563 @@ The Corstone-1000 software stack can be run on:
 - `Arm Corstone-1000 Ecosystem FVP (Fixed Virtual Platform) <https://dev=
eloper.arm.com/downloads/-/arm-ecosystem-fvps>`__
 - `Arm Corstone-1000 for MPS3 <https://developer.arm.com/documentation/d=
ai0550/latest/>`__
=20
-.. warning::
-    Arm Corstone-1000 for MPS3 requires an additional 32 MB QSPI flash P=
MOD module. For more information see the `Application Note AN550 document=
 <https://developer.arm.com/documentation/dai0550/latest/>`__.
+    .. important::
+
+        Arm Corstone-1000 for MPS3 requires an additional 32 MB QSPI fla=
sh PMOD module. For more information see the `Application Note AN550 docu=
ment <https://developer.arm.com/documentation/dai0550/latest/>`__.
+
=20
-Yocto stable branch
+Yocto Stable Branch
 -------------------
=20
-Corstone-1000 software stack is built on top of Yocto scarthgap.
+Corstone-1000 software stack is built on top of Yocto scarthgap release.
=20
-Provided components
+Software Components
 -------------------
 Within the Yocto Project, each component included in the Corstone-1000 s=
oftware stack is specified as
-a `bitbake recipe <https://docs.yoctoproject.org/bitbake/2.2/bitbake-use=
r-manual/bitbake-user-manual-intro.html#recipes>`__.
+a `BitBake recipe <https://docs.yoctoproject.org/bitbake/2.2/bitbake-use=
r-manual/bitbake-user-manual-intro.html#recipes>`__.
 The recipes specific to the Corstone-1000 BSP are located at:
-``<_workspace>/meta-arm/meta-arm-bsp/``.
+``$WORKSPACE/meta-arm/meta-arm-bsp/``.
=20
-The Yocto machine config files for the Corstone-1000 FVP and FPGA target=
s are:
+.. note::
=20
- - ``<_workspace>/meta-arm/meta-arm-bsp/conf/machine/include/corstone100=
0.inc``
- - ``<_workspace>/meta-arm/meta-arm-bsp/conf/machine/corstone1000-fvp.co=
nf``
- - ``<_workspace>/meta-arm/meta-arm-bsp/conf/machine/corstone1000-mps3.c=
onf``
+    ``$WORKSPACE`` refers to the absolute path to your workspace where t=
he `meta-arm` repository will be cloned.
=20
-**NOTE:** All the paths stated in this document are absolute paths.
+    ``$TARGET`` is either ``mps3`` or ``fvp``.
=20
-*****************
-Software for Host
-*****************
+The Yocto machine config files for the Corstone-1000 FVP and MPS3 target=
s are:
=20
-Trusted Firmware-A
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-Based on `Trusted Firmware-A <https://git.trustedfirmware.org/TF-A/trust=
ed-firmware-a.git>`__
+ - ``$WORKSPACE/meta-arm/meta-arm-bsp/conf/machine/include/corstone1000.=
inc``
+ - ``$WORKSPACE/meta-arm/meta-arm-bsp/conf/machine/corstone1000-$TARGET.=
conf``
=20
-+----------+------------------------------------------------------------=
-------------------------------------+
-| bbappend | <_workspace>/meta-arm/meta-arm-bsp/recipes-bsp/trusted-firm=
ware-a/trusted-firmware-a_%.bbappend |
-+----------+------------------------------------------------------------=
-------------------------------------+
-| Recipe   | <_workspace>/meta-arm/meta-arm/recipes-bsp/trusted-firmware=
-a/trusted-firmware-a_2.10.4.bb      |
-+----------+------------------------------------------------------------=
-------------------------------------+
+.. note::
=20
-OP-TEE
-=3D=3D=3D=3D=3D=3D
-Based on `OP-TEE <https://git.trustedfirmware.org/OP-TEE/optee_os.git>`_=
_
+    All the paths stated in this document are absolute paths.
+
+*************************
+Host Processor Components
+*************************
+
+`Trusted Firmware-A <https://git.trustedfirmware.org/TF-A/trusted-firmwa=
re-a.git>`__
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
++----------+------------------------------------------------------------=
-----------------------------------------+
+| bbappend | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-bsp/trusted-firm=
ware-a/trusted-firmware-a_%.bbappend``   |
++----------+------------------------------------------------------------=
-----------------------------------------+
+| Recipe   | ``$WORKSPACE/meta-arm/meta-arm/recipes-bsp/trusted-firmware=
-a/trusted-firmware-a_2.10.4.bb``        |
++----------+------------------------------------------------------------=
-----------------------------------------+
+
+`OP-TEE <https://git.trustedfirmware.org/OP-TEE/optee_os.git>`__
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 +----------+------------------------------------------------------------=
----------------------------+
-| bbappend | <_workspace>/meta-arm/meta-arm-bsp/recipes-security/optee/o=
ptee-os_4.%.bbappend        |
+| bbappend | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-security/optee/o=
ptee-os_4.%.bbappend``      |
 +----------+------------------------------------------------------------=
----------------------------+
-| Recipe   |<_workspace>/meta-arm/meta-arm/recipes-security/optee/optee-=
os_4.1.0.bb                 |
+| Recipe   | ``$WORKSPACE/meta-arm/meta-arm/recipes-security/optee/optee=
-os_4.1.0.bb``              |
 +----------+------------------------------------------------------------=
----------------------------+
=20
-U-Boot
-=3D=3D=3D=3D=3D=3D
-Based on `U-Boot repo`_
+`U-Boot <https://github.com/u-boot/u-boot.git>`__
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-+----------+------------------------------------------------------------=
----------------+
-| bbappend | <_workspace>/meta-arm/meta-arm/recipes-bsp/u-boot/u-boot_%.=
bbappend        |
-+----------+------------------------------------------------------------=
----------------+
-| bbappend | <_workspace>/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t_%.bbappend    |
-+----------+------------------------------------------------------------=
----------------+
-| Recipe   | <_workspace>/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t_2023.07.02.bb |
-+----------+------------------------------------------------------------=
----------------+
++----------+------------------------------------------------------------=
--------------------+
+| bbappend | ``$WORKSPACE/meta-arm/meta-arm/recipes-bsp/u-boot/u-boot_%.=
bbappend``          |
++----------+------------------------------------------------------------=
--------------------+
+| bbappend | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t_%.bbappend``      |
++----------+------------------------------------------------------------=
--------------------+
+| Recipe   | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t_2023.07.02.bb``   |
++----------+------------------------------------------------------------=
--------------------+
=20
 Linux
 =3D=3D=3D=3D=3D
-The distro is based on the `poky-tiny <https://wiki.yoctoproject.org/wik=
i/Poky-Tiny>`__
+The distribution is based on the `Poky <https://docs.yoctoproject.org/re=
f-manual/terms.html#term-Poky>`__
 distribution which is a Linux distribution stripped down to a minimal co=
nfiguration.
=20
-The provided distribution is based on busybox and built using musl libc.=
 The
-recipe responsible for building a tiny version of Linux is listed below.
+The provided distribution is based on `BusyBox <https://www.busybox.net/=
>`__ and built using `musl libc <https://musl.libc.org/>`__.
=20
 +-----------+-----------------------------------------------------------=
-----------------------------------+
-| bbappend  | <_workspace>/meta-arm/meta-arm-bsp/recipes-kernel/linux/li=
nux-yocto_%.bbappend               |
+| bbappend  | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-kernel/linux/li=
nux-yocto_%.bbappend``             |
 +-----------+-----------------------------------------------------------=
-----------------------------------+
-| Recipe    | <_workspace>/poky/meta/recipes-kernel/linux/linux-yocto_6.=
6.bb                               |
+| Recipe    | ``$WORKSPACE/poky/meta/recipes-kernel/linux/linux-yocto_6.=
6.bb``                             |
 +-----------+-----------------------------------------------------------=
-----------------------------------+
-| defconfig | <_workspace>/meta-arm/meta-arm-bsp/recipes-kernel/linux/fi=
les/corstone1000/defconfig         |
+| defconfig | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-kernel/linux/fi=
les/corstone1000/defconfig``       |
 +-----------+-----------------------------------------------------------=
-----------------------------------+
=20
-**************************************************
-Software for Boot Processor (a.k.a Secure Enclave)
-**************************************************
-Based on `Trusted Firmware-M <https://git.trustedfirmware.org/TF-M/trust=
ed-firmware-m.git>`__
+*************************
+Secure Enclave Components
+*************************
+
+`Trusted Firmware-M <https://git.trustedfirmware.org/TF-M/trusted-firmwa=
re-m.git>`__
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 +----------+------------------------------------------------------------=
-----------------------------------------+
-| bbappend | <_workspace>/meta-arm/meta-arm-bsp/recipes-bsp/trusted-firm=
ware-m/trusted-firmware-m_%.bbappend     |
+| bbappend | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-bsp/trusted-firm=
ware-m/trusted-firmware-m_%.bbappend``   |
 +----------+------------------------------------------------------------=
-----------------------------------------+
-| Recipe   | <_workspace>/meta-arm/meta-arm/recipes-bsp/trusted-firmware=
-m/trusted-firmware-m_2.0.0.bb           |
+| Recipe   | ``$WORKSPACE/meta-arm/meta-arm/recipes-bsp/trusted-firmware=
-m/trusted-firmware-m_2.0.0.bb``         |
 +----------+------------------------------------------------------------=
-----------------------------------------+
=20
-********************************
-Software for the External System
-********************************
+************************************
+External System Processor Components
+************************************
=20
-RTX
-=3D=3D=3D=3D
-Based on `RTX RTOS <https://git.gitlab.arm.com/arm-reference-solutions/c=
orstone1000/external_system/rtx>`__
+RTX Real-Time operating system
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
+
+An example application that uses the `RTX Real-Time Operating System <ht=
tps://developer.arm.com/Tools%20and%20Software/Keil%20MDK/RTX5%20RTOS>`__=
.
=20
-+----------+------------------------------------------------------------=
-------------------------------------------------------------------------=
------------------+
-| Recipe   | <_workspace>/meta-arm/meta-arm-bsp/recipes-bsp/external-sys=
tem/external-system_0.1.0.bb                                             =
                  |
-+----------+------------------------------------------------------------=
-------------------------------------------------------------------------=
------------------+
+The application project can be found `here <https://git.gitlab.arm.com/a=
rm-reference-solutions/corstone1000/external_system/rtx>`__.
=20
-Building the software stack
----------------------------
-Create a new folder that will be your workspace and will henceforth be r=
eferred
-to as ``<_workspace>`` in these instructions. To create the folder, run:
++----------+------------------------------------------------------------=
--------------------------------+
+| Recipe   | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-bsp/external-sys=
tem/external-system_0.1.0.bb``  |
++----------+------------------------------------------------------------=
--------------------------------+
=20
-::
+.. _building-the-software-stack:
=20
-    mkdir <_workspace>
-    cd <_workspace>
+Build
+-----
+
+.. warning::
=20
-Corstone-1000 software is based on the Yocto Project which uses kas and =
bitbake
-commands to build the stack. kas version 4 is required. To install kas, =
run:
+  Building binaries natively on Windows and AArch64 Linux is not support=
ed.
+ =20
+  Use an AMD64 Linux based development machine to build the software sta=
ck and transfer the binaries to run the software stack on an FVP in Windo=
ws or AArch64 Linux
+  if required.
=20
-::
=20
-    pip3 install kas
+#. Create a new folder that will be your workspace.
=20
-If 'kas' command is not found in command-line, please make sure the user=
 installation directories are visible on $PATH. If you have sudo rights, =
try 'sudo pip3 install kas'.
+    .. code-block:: console
=20
-In the top directory of the workspace ``<_workspace>``, run:
+        mkdir $WORKSPACE
+        cd $WORKSPACE
=20
-::
+#. Install kas version 4.4 with ``sudo`` rights.
=20
-    git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1000-=
2024.06
+    .. code-block:: console
=20
-To build a Corstone-1000 image for MPS3 FPGA, run:
+        sudo pip3 install kas=3D=3D4.4
=20
-::
+    Ensure the kas installation directory is visible on the ``$PATH`` en=
vironment variable.
=20
-    kas build meta-arm/kas/corstone1000-mps3.yml:meta-arm/ci/debug.yml
+#. Clone the `meta-arm` Yocto layer in the workspace ``$WORKSPACE``.
=20
-Alternatively, to build a Corstone-1000 image for FVP, you need to accep=
t
-the EULA at https://developer.arm.com/downloads/-/arm-ecosystem-fvps/eul=
a
-by setting the ARM_FVP_EULA_ACCEPT environment variable as follows:
+    .. code-block:: console
=20
-::
+        cd $WORKSPACE
+        git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1=
000-2024.06
=20
-    export ARM_FVP_EULA_ACCEPT=3D"True"
+#. Build a Corstone-1000 image:
=20
-then run:
+    .. code-block:: console
=20
-::
+        kas build meta-arm/kas/corstone1000-$TARGET.yml:meta-arm/ci/debu=
g.yml
=20
-    kas build meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml
+    .. important::
=20
-By default, the external system is disabled. To build the Corstone-1000 =
image with external system enabled, run:
+        Accept the EULA at https://developer.arm.com/downloads/-/arm-eco=
system-fvps/eula
+        to build a Corstone-1000 image for FVP as follows:
=20
-::
+        .. code-block:: console
=20
-    kas build meta-arm/kas/corstone1000-<fvp,mps3>.yml:meta-arm/ci/debug=
.yml:meta-arm/kas/corstone1000-extsys.yml
+            export ARM_FVP_EULA_ACCEPT=3D"True"
=20
-The initial clean build will be lengthy, given that all host utilities a=
re to
-be built as well as the target images. This includes host executables (p=
ython,
-cmake, etc.) and the required toolchain(s).
=20
-Once the build is successful, all output binaries will be placed in the =
following folders:
- - ``<_workspace>/build/tmp/deploy/images/corstone1000-fvp/`` folder for=
 FVP build;
- - ``<_workspace>/build/tmp/deploy/images/corstone1000-mps3/`` folder fo=
r FPGA build.
+    .. warning::
+
+        Access to the External System Processor is disabled by default.
+        To build the Corstone-1000 image with External System Processor =
enabled, run:
+
+        .. code-block:: console
+
+            kas build meta-arm/kas/corstone1000-$TARGET.yml:meta-arm/ci/=
debug.yml:meta-arm/kas/corstone1000-extsys.yml
+
+A clean build takes a significant amount of time given that all of the d=
evelopment machine utilities are also
+built along with the target images. Those development machine utilities =
include executables (Python,
+CMake, etc.) and the required toolchains.
+
+
+Once the build succeeds, all output binaries will be placed in ``$WORKSP=
ACE/build/tmp/deploy/images/corstone1000-$TARGET/``
=20
 Everything apart from the Secure Enclave ROM firmware and External Syste=
m firmware, is bundled into a single binary, the
-``corstone1000-flash-firmware-image-corstone1000-{mps3,fvp}.wic`` file.
+``corstone1000-flash-firmware-image-corstone1000-$TARGET.wic`` file.
=20
 The output binaries run in the Corstone-1000 platform are the following:
- - The Secure Enclave ROM firmware: ``<_workspace>/build/tmp/deploy/imag=
es/corstone1000-{mps3,fvp}/bl1.bin``
- - The External System firmware: ``<_workspace>/build/tmp/deploy/images/=
corstone1000-{mps3,fvp}/es_flashfw.bin``
- - The flash image: ``<_workspace>/build/tmp/deploy/images/corstone1000-=
{mps3,fvp}/corstone1000-flash-firmware-image-corstone1000-{mps3,fvp}.wic`=
`
-
-Flash the firmware image on FPGA
---------------------------------
-
-The user should download the FPGA bit file image ``AN550:  Arm=C2=AE Cor=
stone=E2=84=A2-1000 for MPS3 Version 2.0``
-from `this link <https://developer.arm.com/tools-and-software/developmen=
t-boards/fpga-prototyping-boards/download-fpga-images>`__
-and under the section ``Arm=C2=AE Corstone=E2=84=A2-1000 for MPS3``. The=
 download is available after logging in.
-
-The directory structure of the FPGA bundle is shown below.
-
-::
-
-   Boardfiles
-   =E2=94=9C=E2=94=80=E2=94=80 config.txt
-   =E2=94=9C=E2=94=80=E2=94=80 MB
-   =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 BRD_LOG.TXT
-   =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 HBI0309B
-   =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 AN550
-   =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=
=94=9C=E2=94=80=E2=94=80 AN550_v2.bit
-   =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=
=94=9C=E2=94=80=E2=94=80 an550_v2.txt
-   =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=
=94=94=E2=94=80=E2=94=80 images.txt
-   =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 board.txt
-   =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80=
 mbb_v210.ebf
-   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 HBI0309C
-   =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 AN550
-   =E2=94=82=C2=A0=C2=A0     =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=
=94=80 AN550_v2.bit
-   =E2=94=82=C2=A0=C2=A0     =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=
=94=80 an550_v2.txt
-   =E2=94=82=C2=A0=C2=A0     =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=
=94=80 images.txt
-   =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 board.txt
-   =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 mbb_v210.ebf
-   =E2=94=94=E2=94=80=E2=94=80 SOFTWARE
-        =E2=94=9C=E2=94=80=E2=94=80 an550_st.axf
-        =E2=94=9C=E2=94=80=E2=94=80 bl1.bin
-        =E2=94=9C=E2=94=80=E2=94=80 cs1000.bin
-        =E2=94=94=E2=94=80=E2=94=80 ES0.bin
-
-Depending upon the MPS3 board version (printed on the MPS3 board) you sh=
ould update the images.txt file
-(in corresponding HBI0309x folder. Boardfiles/MB/HBI0309<board_revision>=
/AN550/images.txt) so that the file points to the images under SOFTWARE d=
irectory.
-
-The images.txt file that is compatible with the latest version of the so=
ftware
-stack can be seen below;
-
-::
-
-  ;************************************************
-  ;       Preload port mapping                    *
-  ;************************************************
-  ;  PORT 0 & ADDRESS: 0x00_0000_0000 QSPI Flash (XNVM) (32MB)
-  ;  PORT 0 & ADDRESS: 0x00_8000_0000 OCVM (DDR4 2GB)
-  ;  PORT 1        Secure Enclave (M0+) ROM (64KB)
-  ;  PORT 2        External System 0 (M3) Code RAM (256KB)
-  ;  PORT 3        Secure Enclave OTP memory (8KB)
-  ;  PORT 4        CVM (4MB)
-  ;************************************************
-
-  [IMAGES]
-  TOTALIMAGES: 3      ;Number of Images (Max: 32)
-
-  IMAGE0PORT: 1
-  IMAGE0ADDRESS: 0x00_0000_0000
-  IMAGE0UPDATE: RAM
-  IMAGE0FILE: \SOFTWARE\bl1.bin
-
-  IMAGE1PORT: 0
-  IMAGE1ADDRESS: 0x00_0000_0000
-  IMAGE1UPDATE: AUTOQSPI
-  IMAGE1FILE: \SOFTWARE\cs1000.bin
-
-  IMAGE2PORT: 2
-  IMAGE2ADDRESS: 0x00_0000_0000
-  IMAGE2UPDATE: RAM
-  IMAGE2FILE: \SOFTWARE\es0.bin
-
-OUTPUT_DIR =3D ``<_workspace>/build/tmp/deploy/images/corstone1000-mps3`=
`
-
-1. Copy ``bl1.bin`` from OUTPUT_DIR directory to SOFTWARE directory of t=
he FPGA bundle.
-2. Copy ``es_flashfw.bin`` from OUTPUT_DIR directory to SOFTWARE directo=
ry of the FPGA bundle
+ - The Secure Enclave ROM firmware: ``$WORKSPACE/build/tmp/deploy/images=
/corstone1000-$TARGET/bl1.bin``
+ - The External System Processor firmware: ``$WORKSPACE/build/tmp/deploy=
/images/corstone1000-$TARGET/es_flashfw.bin``
+ - The internal firmware flash image: ``$WORKSPACE/build/tmp/deploy/imag=
es/corstone1000-$TARGET/corstone1000-flash-firmware-image-corstone1000-$T=
ARGET.wic``
+
+.. _flashing-firmware-images:
+
+Flash
+-----
+
+.. note::
+
+    The steps below only apply to the MPS3. The FVP being a software app=
lication running on your development
+    machine does not require any firmware flashing. Refer to `this <runn=
ing-software-stack-fvp_>`__
+    section for running the software stack on FVP.=20
+
+#. Download the FPGA bit file image ``AN550: Arm=C2=AE Corstone=E2=84=A2=
-1000 for MPS3 Version 2.0``
+   on the `Arm Developer website <https://developer.arm.com/tools-and-so=
ftware/development-boards/fpga-prototyping-boards/download-fpga-images>`_=
_.
+   Click on the ``Download AN550 bundle`` button and login to download t=
he file.
+
+    The directory structure of the FPGA bundle is as shown below:
+
+    .. code-block:: console
+
+        Boardfiles
+        =E2=94=9C=E2=94=80=E2=94=80 config.txt
+        =E2=94=9C=E2=94=80=E2=94=80 MB
+        =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 BRD_LOG.TXT
+        =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 HBI0309B
+        =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=
=94=80 AN550
+        =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0=
 =E2=94=9C=E2=94=80=E2=94=80 AN550_v2.bit
+        =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0=
 =E2=94=9C=E2=94=80=E2=94=80 an550_v2.txt
+        =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0=
 =E2=94=94=E2=94=80=E2=94=80 images.txt
+        =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=
=94=80 board.txt
+        =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=
=94=80 mbb_v210.ebf
+        =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 HBI0309C
+        =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 AN550
+        =E2=94=82=C2=A0=C2=A0     =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 AN550_v2.bit
+        =E2=94=82=C2=A0=C2=A0     =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 an550_v2.txt
+        =E2=94=82=C2=A0=C2=A0     =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=
=E2=94=80 images.txt
+        =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 board.txt
+        =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 mbb_v210.e=
bf
+        =E2=94=94=E2=94=80=E2=94=80 SOFTWARE
+                =E2=94=9C=E2=94=80=E2=94=80 an550_st.axf
+                =E2=94=9C=E2=94=80=E2=94=80 bl1.bin
+                =E2=94=9C=E2=94=80=E2=94=80 cs1000.bin
+                =E2=94=94=E2=94=80=E2=94=80 ES0.bin
+
+#. Depending upon the MPS3 board version, you should update the ``images=
.txt`` file
+   (found in the corresponding ``HBI0309x`` folder e.g. ``Boardfiles/MB/=
HBI0309$BOARD_VERSION/AN550/images.txt``)
+   so it points to the images under the ``SOFTWARE`` directory.
+   Where ``$BOARD_VERSION`` is a variable containing the board printed o=
n the MPS3 board.
+
+   The ``images.txt`` file compatible with the latest version of the sof=
tware
+   stack can be seen below;
+
+    .. code-block:: console
+
+        ;************************************************
+        ;       Preload port mapping                    *
+        ;************************************************
+        ;  PORT 0 & ADDRESS: 0x00_0000_0000 QSPI Flash (XNVM) (32MB)
+        ;  PORT 0 & ADDRESS: 0x00_8000_0000 OCVM (DDR4 2GB)
+        ;  PORT 1        Secure Enclave (M0+) ROM (64KB)
+        ;  PORT 2        External System 0 (M3) Code RAM (256KB)
+        ;  PORT 3        Secure Enclave OTP memory (8KB)
+        ;  PORT 4        CVM (4MB)
+        ;************************************************
+
+        [IMAGES]
+        TOTALIMAGES: 3      ;Number of Images (Max: 32)
+
+        IMAGE0PORT: 1
+        IMAGE0ADDRESS: 0x00_0000_0000
+        IMAGE0UPDATE: RAM
+        IMAGE0FILE: \SOFTWARE\bl1.bin
+
+        IMAGE1PORT: 0
+        IMAGE1ADDRESS: 0x00_0000_0000
+        IMAGE1UPDATE: AUTOQSPI
+        IMAGE1FILE: \SOFTWARE\cs1000.bin
+
+        IMAGE2PORT: 2
+        IMAGE2ADDRESS: 0x00_0000_0000
+        IMAGE2UPDATE: RAM
+        IMAGE2FILE: \SOFTWARE\es0.bin
+
+
+#. Copy ``bl1.bin`` from ``$WORKSPACE/build/tmp/deploy/images/corstone10=
00-mps3`` to the ``SOFTWARE`` directory of the FPGA bundle.
+#. Copy ``es_flashfw.bin`` from ``$WORKSPACE/build/tmp/deploy/images/cor=
stone1000-mps3`` to the ``SOFTWARE`` directory of the FPGA bundle
    and rename the binary to ``es0.bin``.
-3. Copy ``corstone1000-flash-firmware-image-corstone1000-mps3.wic`` from=
 OUTPUT_DIR directory to SOFTWARE
+#. Copy ``corstone1000-flash-firmware-image-corstone1000-mps3.wic`` from=
 ``$WORKSPACE/build/tmp/deploy/images/corstone1000-mps3`` to the ``SOFTWA=
RE``
    directory of the FPGA bundle and rename the wic image to ``cs1000.bin=
``.
=20
-**NOTE:** Renaming of the images are required because MCC firmware has
-limitation of 8 characters before .(dot) and 3 characters after .(dot).
+.. note::
+    Renaming of the images is required because the MCC firmware has
+    a limit of 8 characters for file name and 3 characters for file exte=
nsion.
+
+After making all modifications above, copy the FPGA bit file bundle to t=
he board's SDCard and reboot the MPS3.
+
+Run
+---
+
+.. _running-software-stack-mps3:
+
+Once the target is turned ON, the Secure Enclave will start to boot, whe=
rein the relevant memory contents of the ``*.wic``
+file are copied to their respective memory locations. Firewall policies =
are enforced
+on memories and peripherals before bringing the Host Processor out of re=
set.
+
+The Host Processor will boot TrustedFirmware-A, OP-TEE, U-Boot and then =
Linux before presenting a login prompt.
+
+****
+MPS3
+****
+
+1. Open 4 serial port comms terminals on the host machine.
+   Those might be ``ttyUSB0``, ``ttyUSB1``, ``ttyUSB2``, and ``ttyUSB3``=
 on Linux machines.
+
+  - ``ttyUSB0`` for MCC, OP-TEE and Secure Partition
+  - ``ttyUSB1`` for Secure Enclave (Cortex-M0+)
+  - ``ttyUSB2`` for Host Processor (Cortex-A35)
+  - ``ttyUSB3`` for External System Processor (Cortex-M3)
+
+    The serial ports might be different on Windows machines.
+
+    Run the following commands in separate terminal instances on Linux:
=20
-Now, copy the entire folder to board's SDCard and reboot the board.
+    .. code-block:: console
=20
-Running the software on FPGA
-----------------------------
+        sudo picocom -b 115200 /dev/ttyUSB0
=20
-On the host machine, open 4 serial port terminals. In case of Linux mach=
ine it will
-be ttyUSB0, ttyUSB1, ttyUSB2, ttyUSB3 and it might be different on Windo=
ws machines.
+    .. code-block:: console
=20
-  - ttyUSB0 for MCC, OP-TEE and Secure Partition
-  - ttyUSB1 for Boot Processor (Cortex-M0+)
-  - ttyUSB2 for Host Processor (Cortex-A35)
-  - ttyUSB3 for External System Processor (Cortex-M3)
+        sudo picocom -b 115200 /dev/ttyUSB1
=20
-Run following commands to open serial port terminals on Linux:
+    .. code-block:: console
=20
-::
+        sudo picocom -b 115200 /dev/ttyUSB2
+ =20
+    .. code-block:: console
=20
-  sudo picocom -b 115200 /dev/ttyUSB0  # in one terminal
-  sudo picocom -b 115200 /dev/ttyUSB1  # in another terminal
-  sudo picocom -b 115200 /dev/ttyUSB2  # in another terminal.
-  sudo picocom -b 115200 /dev/ttyUSB3  # in another terminal.
+        sudo picocom -b 115200 /dev/ttyUSB3
=20
-**NOTE:** The MPS3 expects an ethernet cable to be plugged in, otherwise=
 it will
-wait for the network for a considerable amount of time, printing the fol=
lowing
-logs:
+    .. important::
+        Plug a connected Ethernet cable to the MPS3 or it will
+        wait for a network connection for a considerable amount of time,=
 printing the following
+        on the Host Processor terminal (``ttyUSB2``):
=20
-::
+        .. code-block:: console
=20
-  Generic PHY 40100000.ethernet-ffffffff:01: attached PHY driver (mii_bu=
s:phy_addr=3D40100000.ethernet-ffffffff:01, irq=3DPOLL)
-  smsc911x 40100000.ethernet eth0: SMSC911x/921x identified at 0xffffffc=
008e50000, IRQ: 17
-  Waiting up to 100 more seconds for network.
+            Generic PHY 40100000.ethernet-ffffffff:01: attached PHY driv=
er (mii_bus:phy_addr=3D40100000.ethernet-ffffffff:01, irq=3DPOLL)
+            smsc911x 40100000.ethernet eth0: SMSC911x/921x identified at=
 0xffffffc008e50000, IRQ: 17
+            Waiting up to 100 more seconds for network.
=20
-Once the system boot is completed, you should see console
-logs on the serial port terminals. Once the HOST(Cortex-A35) is
-booted completely, user can login to the shell using
-**"root"** login.
+2. Once the system boot is completed, you should see console logs on the=
 serial port terminals.
+   Once the Host Processor is booted completely, user can login to the s=
hell using ``root`` login.
=20
-If system does not boot and only the ttyUSB1 logs are visible, please fo=
llow the
-steps in `Clean Secure Flash Before Testing (applicable to FPGA only)`_ =
under
-`SystemReady-IR tests`_ section. The previous image used in FPGA (MPS3) =
might
-have filled the Secure Flash completely. The best practice is to clean t=
he
-secure flash in this case.
+    .. important::
=20
+        The secure flash might be completely filled if the system does n=
ot boot and only the Secure Enclave logs (``ttyUSB1``) are visible.
=20
-Running the software on FVP
----------------------------
+        Clean the secure flash if that is the case following the steps `=
here <clean-secure-flash_>`__.
=20
-An FVP (Fixed Virtual Platform) model of the Corstone-1000 platform must=
 be available to run the
+.. _running-software-stack-fvp:
+
+***
+FVP
+***
+
+A Fixed Virtual Platform (FVP) model of the Corstone-1000 platform must =
be available to run the
 Corstone-1000 FVP software image.
=20
-A Yocto recipe is provided and allows to download the latest supported F=
VP version.
+A Yocto recipe is provided to download the latest supported FVP version.
+
+The recipe is located at ``$WORKSPACE/meta-arm/meta-arm/recipes-devtools=
/fvp/fvp-corstone1000.bb``.
=20
-The recipe is located at <_workspace>/meta-arm/meta-arm/recipes-devtools=
/fvp/fvp-corstone1000.bb
+The latest FVP version is ``11.23.25`` and is automatically downloaded a=
nd installed when using the
+``runfvp`` command as detailed below.
=20
-The latest supported Fixed Virtual Platform (FVP) version is 11_23.25 an=
d is automatically downloaded and installed when using the runfvp command=
 as detailed below. The FVP version can be checked by running the followi=
ng command:
+.. note::
=20
-::
+    .. code-block:: console
=20
-  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c "=
../meta-arm/scripts/runfvp -- --version"
+        kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l \
+        -c "../meta-arm/scripts/runfvp -- --version"
=20
-The FVP can also be manually downloaded from the `Arm Ecosystem FVPs`_ p=
age. On this page, navigate
-to "Corstone IoT FVPs" section to download the Corstone-1000 platform FV=
P installer.  Follow the
-instructions of the installer and setup the FVP.
+The FVP can also be manually downloaded from the `Arm Ecosystem FVPs`_ p=
age by navigating
+to "Corstone IoT FVPs" section to download the Corstone-1000 platform FV=
P installer. Follow the
+instructions of the installer to setup the FVP.
=20
-To run the FVP using the runfvp command, please run the following comman=
d:
+#. Run the FVP
=20
-::
+    .. code-block:: console
=20
-  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c "=
../meta-arm/scripts/runfvp --terminals=3Dxterm"
+        kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l \
+        -c "../meta-arm/scripts/runfvp --terminals=3Dxterm"
=20
-When the script is executed, three terminal instances will be launched, =
one for the boot processor
-(aka Secure Enclave) processing element and two for the Host processing =
element. Once the FVP is
-executing, the Boot Processor will start to boot, wherein the relevant m=
emory contents of the .wic
-file are copied to their respective memory locations within the model, e=
nforce firewall policies
-on memories and peripherals and then, bring the host out of reset.
+    When the script is executed, three terminal instances will be launch=
ed:
=20
-The host will boot trusted-firmware-a, OP-TEE, U-Boot and then Linux, an=
d present a login prompt
-(FVP host_terminal_0):
+    - one for the Secure Enclave processing element
+    - two for the Host processor processing element.
=20
-::
=20
-    corstone1000-fvp login:
+    .. code-block:: console
=20
-Login using the username root.
+        corstone1000-fvp login:
=20
-Using FVP on Windows or AArch64 Linux
--------------------------------------
+#. Login using the ``root`` username.
=20
-The user should follow the build instructions in this document to build =
on a Linux host machine.
-Then, copy the output binaries to the Windows or Aarch64 Linux machine w=
here the FVP is located.
-Then, launch the FVP binary.
=20
 Security Issue Reporting
 ------------------------
=20
 To report any security issues identified with Corstone-1000, please send=
 an email to psirt@arm.com.
=20
-###########################
-User Guide: Provided tests
-###########################
+#####
+Tests
+#####
=20
-SystemReady-IR tests
---------------------
+.. important::
=20
-*************
-Testing steps
-*************
+    All the tests below assume you have already built the software stack=
 at least once
+    following the instructions `here <building-the-software-stack_>`__.
=20
-**NOTE**: Running the SystemReady-IR tests described below requires the =
user to
-work with USB sticks. In our testing, not all USB stick models work well=
 with
-MPS3 FPGA. Here are the USB sticks models that are stable in our test
-environment.
=20
- - HP V165W 8 GB USB Flash Drive
- - SanDisk Ultra 32GB Dual USB Flash Drive USB M3.0
- - SanDisk Ultra 16GB Dual USB Flash Drive USB M3.0
+.. _clean-secure-flash:
=20
-**NOTE**:
-Before running each of the tests in this chapter, the user should follow=
 the
-steps described in following section "Clean Secure Flash Before Testing"=
 to
-erase the SecureEnclave flash cleanly and prepare a clean board environm=
ent for
-the testing.
+Clean Secure Flash
+------------------
=20
-Prepare EFI System Partition
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-Corstone-1000 FVP and FPGA do not have enough on-chip nonvolatile memory=
 to host
-an EFI System Partition (ESP). Thus, Corstone-1000 uses mass storage dev=
ice for
-ESP. The instructions below should be followed for both FVP and FPGA bef=
ore
-running the ACS tests.
+.. important::
=20
-**Common to FVP and FPGA:**
+    The MPS3 secure flash needs to be cleared before running tests.
+    This is to erase the flash cleanly and prepare a clean board environ=
ment for testing.
=20
-::
=20
-  kas build meta-arm/kas/corstone1000-{mps3,fvp}.yml:meta-arm/ci/debug.y=
ml --target corstone1000-esp-image
+#. Clone the `systemready-patch` repository to your $WORKSPACE.
=20
-Once the build is successful ``corstone1000-esp-image-corstone1000-{mps3=
,fvp}.wic`` will be available in either:
- - ``<_workspace>/build/tmp/deploy/images/corstone1000-fvp/`` folder for=
 FVP build;
- - ``<_workspace>/build/tmp/deploy/images/corstone1000-mps3/`` folder fo=
r FPGA build.
+    .. code-block:: console
=20
-**Using ESP in FPGA:**
+        cd $WORKSPACE
+        git clone https://git.gitlab.arm.com/arm-reference-solutions/sys=
temready-patch.git -b CORSTONE1000-2024.06
=20
-Once the ESP is created, it needs to be flashed to a second USB drive di=
fferent than ACS image.
-This can be done with the development machine. In the given example here
-we assume the USB device is ``/dev/sdb`` (the user should use ``lsblk`` =
command to
-confirm). Be cautious here and don't confuse your host machine own hard =
drive with the
-USB drive. Run the following commands to prepare the ACS image in USB st=
ick:
+#. Copy the secure flash cleaning Git patch file to your copy of `meta-a=
rm`.
=20
-::
+    .. code-block:: console
=20
-   sudo dd if=3Dcorstone1000-esp-image-corstone1000-mps3.wic of=3D/dev/s=
db iflag=3Ddirect oflag=3Ddirect status=3Dprogress bs=3D512; sync;
+        cp -f systemready-patch/embedded-a/corstone1000/erase_flash/0001=
-embedded-a-corstone1000-clean-secure-flash.patch meta-arm
+        cd meta-arm
=20
-Now you can plug this USB stick to the board together with ACS test USB =
stick.
+#. Apply the Git patch to `meta-arm`.
=20
-**Using ESP in FVP:**
+    .. code-block:: console
=20
-The ESP disk image once created will be used automatically in the Corsto=
ne-1000 FVP as the 2nd MMC card image. It will be used when the SystemRea=
dy-IR tests will be performed on the FVP in the later section.
+        cd meta-arm
+        git apply 0001-embedded-a-corstone1000-clean-secure-flash.patch
=20
+#. Rebuild the software stack.
=20
-Clean Secure Flash Before Testing (applicable to FPGA only)
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+    .. code-block:: console
=20
-To prepare a clean board environment with clean secure flash for the tes=
ting,
-the user should prepare an image that erases the secure flash cleanly du=
ring
-boot. Run following commands to build such image.
+        cd $WORKSPACE
+        kas build meta-arm/kas/corstone1000-mps3.yml:meta-arm/ci/debug.y=
ml
=20
-::
+#. Replace the ``bl1.bin`` file on the SD card with ``$WORKSPACE/build/t=
mp/deploy/images/corstone1000-mps3/bl1.bin``.
=20
-  cd <_workspace>
-  git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1000-20=
24.06
-  git clone https://git.gitlab.arm.com/arm-reference-solutions/systemrea=
dy-patch.git -b CORSTONE1000-2024.06
-  cp -f systemready-patch/embedded-a/corstone1000/erase_flash/0001-embed=
ded-a-corstone1000-clean-secure-flash.patch meta-arm
-  cd meta-arm
-  git apply 0001-embedded-a-corstone1000-clean-secure-flash.patch
-  cd ..
-  kas build meta-arm/kas/corstone1000-mps3.yml:meta-arm/ci/debug.yml
+#. Reboot the board to completely erase the secure flash.
=20
-Replace the bl1.bin and cs1000.bin files on the SD card with following f=
iles:
-  - The ROM firmware: <_workspace>/build/tmp/deploy/images/corstone1000-=
mps3/bl1.bin
-  - The flash image: <_workspace>/build/tmp/deploy/images/corstone1000-m=
ps3/corstone1000-flash-firmware-image-corstone1000-mps3.wic
+    The following message log from TrustedFirmware-M should be displayed=
 on the Secure Enclave terminal (``ttyUSB1``):
=20
-Now reboot the board. This step erases the Corstone-1000 SecureEnclave f=
lash
-completely, the user should expect following message from TF-M log (can =
be seen
-in ttyUSB1):
+    .. code-block:: console
=20
-::
+        !!!SECURE FLASH HAS BEEN CLEANED!!!
+        NOW YOU CAN FLASH THE ACTUAL CORSTONE1000 IMAGE
+        PLEASE REMOVE THE LATEST ERASE SECURE FLASH PATCH AND BUILD THE =
IMAGE AGAIN
=20
-  !!!SECURE FLASH HAS BEEN CLEANED!!!
-  NOW YOU CAN FLASH THE ACTUAL CORSTONE1000 IMAGE
-  PLEASE REMOVE THE LATEST ERASE SECURE FLASH PATCH AND BUILD THE IMAGE =
AGAIN
=20
-Then the user should follow "Building the software stack" to build a cle=
an
-software stack and flash the FPGA as normal. And continue the testing.
+#. Follow the `instructions <building-the-software-stack_>`__ to build a=
 clean software stack and flash the MPS3 with it.
=20
-Run SystemReady-IR ACS tests
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
+You can proceed with the test instructions in the following section afte=
r having done all the above.
+
+SystemReady-IR
+--------------
+
+.. important::
+    Running the SystemReady-IR tests described below requires USB drives=
.
+    In our testing, not all USB drive models worked well with the MPS3.
+
+    Here are the USB drive models that were stable in our test environme=
nt:
+
+        - HP v165w 8 GB USB Flash Drive
+        - SanDisk Ultra 32GB Dual USB Flash Drive USB M3.0
+        - SanDisk Ultra 16GB Dual USB Flash Drive USB M3.0
+
+Follow the instructions below before running the Architecture Compliance=
 Suite (ACS) tests.
+
+
+.. _build-efi-system-partition:
+
+*****************************
+Build an EFI System Partition
+*****************************
+
+A storage with EFI System Partition (ESP) must exist in the system for t=
he UEFI-SCT related tests to pass.
+
+#. Build an ESP partition for your target
+
+    .. code-block:: console
+
+        kas build meta-arm/kas/corstone1000-$TARGET.yml:meta-arm/ci/debu=
g.yml --target corstone1000-esp-image
+
+#. Locate the ``corstone1000-esp-image-corstone1000-$TARGET.wic`` build =
artefact
+   in ``$WORKSPACE/build/tmp/deploy/images/corstone1000-$TARGET/``=20
+
+****************************
+Use the EFI System Partition
+****************************
+
+.. _use-efi-system-partition-mps3:
+
+MPS3
+=3D=3D=3D=3D
+
+#. Connect a USB drive to your development machine.
+
+#. Run the following command on your development machine to discover whi=
ch device is your USB drive:
+
+    .. code-block:: console
+
+        lsblk
+
+    The remaining steps assume the USB drive is ``/dev/sdb``.
+
+    .. warning::
+
+        Do not mistake your development machine hard drive with the USB =
drive.
+
+#. Copy the ESP to the USB drive by running the following command:
+
+    .. code-block:: console
=20
-Architecture Compliance Suite (ACS) is used to ensure architectural comp=
liance
-across different implementations of the architecture. Arm Enterprise ACS
-includes a set of examples of the invariant behaviors that are provided =
by a
-set of specifications for enterprise systems (For example: SBSA, SBBR, e=
tc.),
-so that implementers can verify if these behaviours have been interprete=
d correctly.
+        sudo dd \
+        if=3D$WORKSPACE/build/tmp/deploy/images/corstone1000-mps3/corsto=
ne1000-esp-image-costickrstone1000-mps3.wic \
+        of=3D/dev/sdb \
+        iflag=3Ddirect oflag=3Ddirect status=3Dprogress bs=3D512; sync;
=20
-The ACS image contains a BOOT partition.
-Following test suites and bootable applications are under BOOT partition=
:
+#. Plug the USB drive to the MPS3.
+
+
+.. _use-efi-system-partition-fvp:
+
+FVP
+=3D=3D=3D
+
+The ESP disk image will automatically be used by the Corstone-1000 FVP a=
s the 2nd MMC card image.
+It will be used when the SystemReady-IR tests is performed on the FVP in=
 the later section.
+
+
+****************************
+Run SystemReady-IR ACS Tests
+****************************
+
+ACS is used to ensure architectural compliance across different implemen=
tations of the architecture.
+Arm Enterprise ACS includes a set of examples of the invariant behaviors=
 that are provided by a
+set of specifications for enterprise systems (i.e. SBSA, SBBR, etc.).
+Implementers can verify if these behaviors have been interpreted correct=
ly.
+
+The following test suites and bootable applications are under the ``BOOT=
`` partition of the ACS image:
=20
  * SCT
  * FWTS
- * BSA uefi
+ * BSA UEFI
  * BSA linux
- * grub
- * uefi manual capsule application
+ * GRUB
+ * UEFI manual capsule application
=20
-BOOT partition contains the following:
+See the directory structure of the ACS image ``BOOT`` partition below:
=20
-::
+.. code-block:: console
=20
     =E2=94=9C=E2=94=80=E2=94=80 EFI
     =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 BOOT
@@ -521,1068 +614,1273 @@ BOOT partition contains the following:
     =E2=94=9C=E2=94=80=E2=94=80 ramdisk-busybox.img
     =E2=94=94=E2=94=80=E2=94=80 acs_results
=20
-The BOOT partition is also used to store the test results. The
-results are stored in the `acs_results` folder.
+The ``BOOT`` partition is also used to store test results in the ``acs_r=
esults`` folder.
=20
-**NOTE**: PLEASE ENSURE THAT the `acs_results` FOLDER UNDER THE BOOT PAR=
TITION IS
-EMPTY BEFORE YOU START TESTING. OTHERWISE THE TEST RESULTS WILL NOT BE C=
ONSISTENT.
+.. important::
=20
-FPGA instructions for ACS image
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
+    Ensure that the ``acs_results`` folder is empty before starting the =
test.
+
+
+This sections below describe how to build and run ACS tests on Corstone-=
1000.
+
+.. _mps3-instructions-for-acs-image:
+
+MPS3
+=3D=3D=3D=3D
+
+#. On your host development machine, clone the `Arm SystemReady ACS repo=
sitory <https://github.com/ARM-software/arm-systemready/>`_.
=20
-This section describes how the user can build and run Architecture Compl=
iance
-Suite (ACS) tests on Corstone-1000.
+    .. code-block:: console
=20
-First, the user should download the `Arm SystemReady ACS repository <htt=
ps://github.com/ARM-software/arm-systemready/>`__.
-This repository contains the infrastructure to build the Architecture
-Compliance Suite (ACS) and the bootable prebuilt images to be used for t=
he
-certifications of SystemReady-IR. To download the repository, run comman=
d:
+        cd $WORKSPACE
+        git clone https://github.com/ARM-software/arm-systemready.git
=20
-::
+    This repository contains the infrastructure to build the ACS and the=
 bootable prebuilt images to be used for the
+    certifications of SystemReady-IR.
=20
-  cd <_workspace>
-  git clone https://github.com/ARM-software/arm-systemready.git
+#. Find the pre-built ACS live image in ``$WORKSPACE/arm-systemready/IR/=
prebuilt_images/v23.09_2.1.0/ir-acs-live-image-generic-arm64.wic.xz``.
=20
-Once the repository is successfully downloaded, the prebuilt ACS live im=
age can be found in:
- - ``<_workspace>/arm-systemready/IR/prebuilt_images/v23.09_2.1.0/ir-acs=
-live-image-generic-arm64.wic.xz``
+    .. note::
=20
-**NOTE**: This prebuilt ACS image includes v5.13 kernel, which doesn't p=
rovide
-USB driver support for Corstone-1000. The ACS image with newer kernel ve=
rsion
-and with full USB support for Corstone-1000 will be available in the nex=
t
-SystemReady release in this repository.
+        This prebuilt ACS image includes v5.13 kernel, which does not pr=
ovide
+        USB driver support for Corstone-1000. The ACS image with a newer=
 kernel version
+        and full USB support for Corstone-1000 will be available in the =
repository with the next
+        SystemReady release.
=20
-Then, the user should prepare a USB stick with ACS image. In the given e=
xample here,
-we assume the USB device is ``/dev/sdb`` (the user should use ``lsblk`` =
command to
-confirm). Be cautious here and don't confuse your host machine own hard =
drive with the
-USB drive. Run the following commands to prepare the ACS image in USB st=
ick:
+#. Connect a USB drive (other than the one used for the ESP) to the host=
 development machine.
=20
-::
+#. Run the following command to discover which device is your USB drive:
=20
-  cd <_workspace>/arm-systemready/IR/prebuilt_images/v23.09_2.1.0
-  unxz ir-acs-live-image-generic-arm64.wic.xz
-  sudo dd if=3Dir-acs-live-image-generic-arm64.wic of=3D/dev/sdb iflag=3D=
direct oflag=3Ddirect bs=3D1M status=3Dprogress; sync
+    .. code-block:: console
=20
-Once the USB stick with ACS image is prepared, the user should make sure=
 that
-ensure that both USB sticks (ESP and ACS image) are connected to the boa=
rd,
-and then boot the board.
+        lsblk
=20
-The FPGA will reset multiple times during the test, and it might take ap=
prox. 24-36 hours to finish the test.
+    The remaining steps assume the USB drive is ``/dev/sdc``.
=20
-**NOTE**: The USB stick which contains the ESP partition might cause gru=
b to
-unable to find the bootable partition (only in the FPGA). If that's the =
case, please
-remove the USB stick and run the ACS tests. ESP partition can be mounted=
 after
-the platform is booted to linux at the end of the ACS tests.
+    .. warning::
=20
+        Do not mistake your development machine hard drive with the USB =
drive.
=20
-FVP instructions for ACS image and run
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+#. Copy the ACS image to the USB drive by running the following commands=
:
=20
-The FVP has been integrated in the meta-arm-systemready layer so the run=
ning of the ACS tests can be handled automatically as follows
+    .. code-block:: console
=20
-::
+        cd $WORKSPACE/arm-systemready/IR/prebuilt_images/v23.09_2.1.0
+        unxz ir-acs-live-image-generic-arm64.wic.xz
+        sudo dd if=3Dir-acs-live-image-generic-arm64.wic of=3D/dev/sdc i=
flag=3Ddirect oflag=3Ddirect bs=3D1M status=3Dprogress; sync
=20
-  kas build meta-arm/ci/corstone1000-fvp.yml:meta-arm/ci/debug.yml:kas/a=
rm-systemready-ir-acs.yml
+#. Plug the USB drive to the MPS3. At this point you should have both th=
e USB drive with the ESP and the USB drive with the ACS image plugged to =
the MPS3.
=20
-The details of how this layer works can be found in : ``<_workspace>/met=
a-arm-systemready/README.md``
+#. Reboot the MPS3.
=20
-**NOTE:** You can't use the standard meta-arm/kas/corstone1000-fvp.yml k=
as file as it sets the build up for only building firmware
+The MPS3 will reset multiple times during the test, and it might take ap=
proximately 24 to 36 hours to finish the test.
=20
-**NOTE:** These test might take up to 1 day to finish
+.. important::
=20
+    Unplug the ESP USB drive from the MPS3 if it is preventing GRUB
+    from finding the bootable partition. Leave only the ACS image USB dr=
ive
+    plugged in to run the ACS tests. The ESP USB drive can be plugged in=
 again after
+    the platform is booted to Linux at the end of the ACS tests.
=20
-Common to FVP and FPGA
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-U-Boot should be able to boot the grub bootloader from
-the 1st partition and if grub is not interrupted, tests are executed
-automatically in the following sequence:
+.. _fvp-instructions-for-acs-image:
+
+FVP
+=3D=3D=3D
+
+FVP has been integrated in the `meta-arm-systemready Yocto layer <https:=
//git.yoctoproject.org/meta-arm/plain/meta-arm-systemready>`__.
+
+Find more details about the `meta-arm-systemready` Yocto layer from its =
`README <https://git.yoctoproject.org/meta-arm/plain/meta-arm-systemready=
/README.md>`__ file.
+
+Run the following command to build the firmware image with the specific =
kas configuration file for building an image with the ACS tests baked in:
+
+.. code-block:: console
+
+    kas build meta-arm/ci/corstone1000-fvp.yml:meta-arm/ci/debug.yml:met=
a-arm/kas/arm-systemready-ir-acs.yml
+
+
+.. note::
+    The ACS tests might take up to 1 day to complete when run on FVP.
+
+
+Test Sequence and Results
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+
+U-Boot should be able to boot the GRUB bootloader from the first partiti=
on.
+
+If GRUB is not interrupted, the tests are executed automatically in the =
following order:
=20
  - SCT
  - UEFI BSA
  - FWTS
=20
-The results can be fetched from the `acs_results` folder in the BOOT par=
tition of the USB stick (FPGA) / SD Card (FVP).
+The results can be fetched from the `acs_results` folder in the ``BOOT``=
 partition of the USB drive (for MPS3) or SD Card (for FVP).
=20
-**NOTE:** The FVP uses the ``<_workspace>/build/tmp-glibc/work/corstone1=
000_fvp-oe-linux/arm-systemready-ir-acs/2.0.0/deploy-arm-systemready-ir-a=
cs/arm-systemready-ir-acs-corstone1000-fvp.wic`` image if the meta-arm-sy=
stemready layer is used.
-The result can be checked in this image.
+.. note::
+
+    The FVP uses the ``$WORKSPACE/build/tmp-glibc/work/corstone1000_fvp-=
oe-linux/arm-systemready-ir-acs/2.0.0/deploy-arm-systemready-ir-acs/arm-s=
ystemready-ir-acs-corstone1000-fvp.wic``
+    image if the `meta-arm-systemready` Yocto layer is used. The results=
 can be checked in this image.
=20
 #####################################################
=20
-Manual capsule update and ESRT checks
--------------------------------------
+Capsule Update
+--------------
+
+The following section describes the steps to update the firmware using C=
apsule Update
+as the Corstone-1000 supports UEFI.
=20
-The following section describes running manual capsule updates by going =
through
-a negative and positive test. Two capsules are needed to perform the pos=
itive
-and negative updates. The steps also show how to use the EFI System Reso=
urce Table
-(ESRT) to retrieve the installed capsule details.
+The firmware update process is tested with an invalid capsule (negative =
capsule update test)
+and with a valid capsule (positive capsule update test) to validate the =
robustness and
+error-handling capabilities of the firmware update mechanism.
=20
-In the positive test, a valid capsule is used and the platform boots cor=
rectly
-until the Linux prompt after the update. In the negative test, an outdat=
ed
-capsule is used that has a smaller version number. This capsule gets rej=
ected
-because of being outdated and the previous firmware will be used instead=
.
+During the positive capsule update test, the Corstone-1000 is given a va=
lid capsule, which it successfully applies, boots up and then reaches the=
 Linux command prompt.
=20
+During the negative capsule update test, the Corstone-1000 is given an o=
utdated capsule with a lower version number,
+which is expected to be rejected due to its outdated status, thereby ret=
aining the previous firmware.
=20
-*******************
-Generating Capsules
-*******************
+Two different capsules (one for each test) are therefore needed to perfo=
rm the tests.
=20
-A no-partition image is needed for the capsule generation. This image is
-created automatically during a clean Yocto build and it can be found in
-``build/tmp/deploy/images/corstone1000-<fvp/mps3>/corstone1000-<fvp/mps3=
>_image.nopt``.
-A capsule is also automatically generated with U-Boot's ``mkeficapsule``=
 tool
-during the Yocto build that uses this ``corstone1000-<fvp/mps3>_image.no=
pt``. The
-capsule's default metadata, that is passed to the ``mkeficapsule`` tool,
-can be found in the ``meta-arm/meta-arm-bsp/recipes-bsp/images/corstone1=
000-flash-firmware-image.bb``
-and ``meta-arm/kas/corstone1000-image-configuration.yml`` files. These
-data can be modified before the Yocto build if it is needed. It is
-assumed that the default values are used in the following steps.
-
-The automatically generated capsule can be found in
-``build/tmp/deploy/images/corstone1000-<fvp/mps3>/corstone1000-<fvp/mps3=
>-v6.uefi.capsule``.
-This capsule will be used as the positive capsule during the test in the=
 following
-steps.
-
-Generating Capsules Manually
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
=20
-If a new capsule has to be generated with different metadata after the b=
uild
-process, then it can be done manually by using the ``u-boot-tools``'s
-``mkeficapsule`` and the previously created ``.nopt`` image. The
-``mkeficapsule`` tool is built automatically for the host machine
-during the Yocto build.
+*****************
+Generate Capsules
+*****************
=20
-The negative capsule needs a lower ``fw-version`` than the positive
-capsule. For example if the host's architecture is x86_64, this can
-be generated by using the following command:
+U-Boot's ``mkeficapsule`` tool is used to generate capsules. It is built=
 automatically for the host machine during the firmware image building pr=
ocess.
+The tool can be found in the ``$WORKSPACE/build/tmp/sysroots-components/=
x86_64/u-boot-tools-native/usr/bin/mkeficapsule`` directory.
=20
-::
+``mkeficapsule`` uses a no-partition image which is created when perform=
ing a clean firmware build.
+The no-partition image can be found in the ``$WORKSPACE/build/tmp/deploy=
/images/corstone1000-$TARGET/corstone1000-$TARGET_image.nopt`` directory.
=20
-   cd <_workspace>
+The capsule's default metadata passed can be found in the ``$WORKSPACE/m=
eta-arm/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image=
.bb``
+and ``$WORKSPACE/meta-arm/kas/corstone1000-image-configuration.yml`` fil=
es.
=20
-   ./build/tmp/sysroots-components/x86_64/u-boot-tools-native/usr/bin/mk=
eficapsule --monotonic-count 1 \
-   --private-key build/tmp/deploy/images/corstone1000-<fvp/mps3>/corston=
e1000_capsule_key.key \
-   --certificate build/tmp/deploy/images/corstone1000-<fvp/mps3>/corston=
e1000_capsule_cert.crt --index 1 --guid df1865d1-90fb-4d59-9c38-c9f2c1bba=
8cc \
-   --fw-version 5 build/tmp/deploy/images/corstone1000-<fvp/mps3>/corsto=
ne1000-<fvp/mps3>_image.nopt corstone1000-<fvp/mps3>-v5.uefi.capsule
+Valid Capsule
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-This command will put the negative capsule to the ``<_workspace>`` direc=
tory.
+An automatically generated capsule can be found in ``$WORKSPACE/build/tm=
p/deploy/images/corstone1000-$TARGET/corstone1000-$TARGET-v6.uefi.capsule=
`` after running a firmware build.
=20
+The default metadata values are assumed to be correct to generate a vali=
d capsule.
=20
-****************
-Copying Capsules
-****************
+This capsule will be used for the positive capsule update test.
=20
-Copying the FPGA capsules
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+Invalid Capsule
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Generate another capsule with ``fw-version`` metadata set to a lower ver=
sion than the valid capsule.
+The example below assumes the valid capsule has a default firmware versi=
on of 6, and therefore creates an invalid capsule with firmware version 5=
.
+
+
+Run the following commands to generate an invalid capsule with a ``fw-ve=
rsion`` of ``5``:
+
+.. code-block:: console
+
+   cd $WORKSPACE
+
+   ./build/tmp/sysroots-components/x86_64/u-boot-tools-native/usr/bin/mk=
eficapsule \
+   --monotonic-count 1 \
+   --private-key build/tmp/deploy/images/corstone1000-$TARGET/corstone10=
00_capsule_key.key \
+   --certificate build/tmp/deploy/images/corstone1000-$TARGET/corstone10=
00_capsule_cert.crt \
+   --index 1 \
+   --guid df1865d1-90fb-4d59-9c38-c9f2c1bba8cc \
+   --fw-version 5 build/tmp/deploy/images/corstone1000-$TARGET/corstone1=
000-$TARGET_image.nopt \
+   corstone1000-$TARGET-v5.uefi.capsule
+
+The invalid capsule will be located in the ``$WORKSPACE`` directory.
+
+***************************
+Transfer Capsules to Target
+***************************
=20
-The user should prepare a USB stick as explained in ACS image section `F=
PGA instructions for ACS image`_.
-Place the generated ``corstone1000-mps3-v<5/6>.uefi.capsule`` files in t=
he root directory of the boot partition
-in the USB stick. Note: As we are running the direct method, the ``corst=
one1000-mps3-v<5/6>.uefi.capsule`` files
-should not be under the EFI/UpdateCapsule directory as this may or may n=
ot trigger
-the on disk method.
+The capsule delivery process described below is the direct method (usage=
 of capsules from the ACS image)
+as opposed to the on-disk method (delivery of capsules using a file on a=
 mass storage device).
=20
-::
+MPS3
+=3D=3D=3D=3D
+
+#. Prepare a USB drive as explained in `this <mps3-instructions-for-acs-=
image_>`_ section.
+
+#. Copy the capsule file to the root directory of the ``BOOT`` partition=
 in the USB drive.
+
+  .. code-block:: console
+
+    sudo cp $CAPSULES_PATH/corstone1000-mps3-v6.uefi.capsule $ACS_IMAGE_=
USB_DRIVE_PATH/BOOT/
+    sudo cp $CAPSULES_PATH/corstone1000-mps3-v5.uefi.capsule $ACS_IMAGE_=
USB_DRIVE_PATH/BOOT/
+    sync
+
+.. important::
+
+    Since we are using the direct Capsule Update method, the capsule fil=
es should not be placed in
+    the ``EFI/UpdateCapsule`` directory, as this might inadvertently tri=
gger the on-disk update method.
+
+FVP
+=3D=3D=3D
+
+#. Download and extract the ACS image `as described for the MPS3 <mps3-i=
nstructions-for-acs-image_>`_.
+   The ACS image extraction location will be referred below as ``$ACS_IM=
AGE_PATH``.
+
+    .. note::
+
+      Creating a USB drive with the ACS image is not required as the ima=
ge will be mounted with the steps below.
=20
-   sudo cp <capsule path>/corstone1000-mps3-v6.uefi.capsule <mounting pa=
th>/BOOT/
-   sudo cp <capsule path>/corstone1000-mps3-v5.uefi.capsule <mounting pa=
th>/BOOT/
-   sync
+#. Find the first partition's offset of the ``ir-acs-live-image-generic-=
arm64.wic`` image using the ``fdisk`` tool.
+   The partition table can be listed using:
=20
-Copying the FVP capsules
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+    .. code-block:: console
=20
-The ACS image should be used for the FVP as well. Downloaded and extract=
 the
-image the same way as for the FPGA `FPGA instructions for ACS image`_.
-Creating an USB stick with the image is not needed for the FVP.
+        fdisk -lu $ACS_IMAGE_PATH/ir-acs-live-image-generic-arm64.wic
+        Device                                                 Start    =
 End Sectors  Size Type
+        $ACS_IMAGE_PATH/ir-acs-live-image-generic-arm64.wic1    2048  30=
9247  307200  150M Microsoft basic data
+        $ACS_IMAGE_PATH/ir-acs-live-image-generic-arm64.wic2  309248 134=
3339 1034092  505M Linux filesystem
=20
-After getting the ACS image, find the 1st partition's offset of the
-``ir-acs-live-image-generic-arm64.wic`` image. The partition table can b=
e
-listed using the ``fdisk`` tool.
=20
-::
+    Given that the first partition starts at sector 2048 and each sector=
 is 512 bytes in size,
+    the first partition is at offset 1048576 (2048 x 512).
=20
-  fdisk -lu <path-to-img>/ir-acs-live-image-generic-arm64.wic
-      Device                                Start     End Sectors  Size =
Type
-         <path-to-img>/ir-acs-live-image-generic-arm64.wic1   2048  3092=
47  307200  150M Microsoft basic data
-         <path-to-img>/ir-acs-live-image-generic-arm64.wic2 309248 13433=
39 1034092  505M Linux filesystem
+#. Mount the ``ir-acs-live-image-generic-arm64.wic`` image using the pre=
viously calculated offset:
=20
+    .. code-block:: console
=20
-The first partition starts at the 2048th sector. This has to be multipli=
ed
-by the sector size which is 512 so the offset is 2048 * 512 =3D 1048576.
+        sudo mkdir /mnt/ir-acs-live-image-generic-arm64
+        sudo mount -o rw,offset=3D<first_partition_offset> $ACS_IMAGE_PA=
TH/ir-acs-live-image-generic-arm64.wic  /mnt/ir-acs-live-image-generic-ar=
m64
=20
-Next, mount the IR image using the previously calculated offset:
+#. Copy the capsules:
=20
-::
+    .. code-block:: console
=20
-   sudo mkdir /mnt/test
-   sudo mount -o rw,offset=3D<first_partition_offset> <path-to-img>/ir-a=
cs-live-image-generic-arm64.wic  /mnt/test
+        sudo cp $CAPSULES_PATH/corstone1000-fvp-v6.uefi.capsule /mnt/ir-=
acs-live-image-generic-arm64/
+        sudo cp $CAPSULES_PATH/corstone1000-fvp-v5.uefi.capsule /mnt/ir-=
acs-live-image-generic-arm64/
+        sync
=20
-Then, copy the capsules:
+#. Unmount the IR image:
=20
-::
+    .. code-block:: console
=20
-   sudo cp <capsule path>/corstone1000-fvp-v6.uefi.capsule /mnt/test/
-   sudo cp <capsule path>/corstone1000-fvp-v5.uefi.capsule /mnt/test/
-   sync
+        sudo umount /mnt/ir-acs-live-image-generic-arm64
=20
-Then, unmount the IR image:
+************************
+Run Capsule Update Tests
+************************
=20
-::
+The valid capsule (``corstone1000-$TARGET-v6.uefi.capsule``) will be use=
d first to run the positive capsule update test.
+This will be followed by using the invalid capsule (``corstone1000-$TARG=
ET-v5.uefi.capsule``) to run the negative capsule update test.
=20
-   sudo umount /mnt/test
+.. important::
=20
-******************************
-Performing the capsule update
-******************************
+    This sequence order must be respected as the invalid capsule has a f=
irmware version lower than the firmware version in the valid capsule.
+    The negative capsule update test effectively tests that firmware rol=
lback is not permitted.
=20
-During this section we will be using the capsule with the higher version
-(``corstone1000-<fvp/mps3>-v6.uefi.capsule``) for the positive scenario
-and then the capsule with the lower version (``corstone1000-<fvp/mps3>-v=
5.uefi.capsule``)
-for the negative scenario. The two tests have to be done after each othe=
r
-in the correct order to make sure that the negative capsule will get rej=
ected.
=20
-Running the FPGA with the IR prebuilt image
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+.. _positive-capsule-update-test:
=20
-Insert the prepared USB stick which has the IR prebuilt image and two ca=
psules,
-then Power cycle the MPS3 board.
+Positive Capsule Update Test
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
+
+#. Run Corstone-1000 with the ACS image containing the two capsule files=
:
=20
-Running the FVP with the IR prebuilt image
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+    - MPS3:
=20
-Run the FVP with the IR prebuilt image:
+      #. Plug the prepared USB drive which has the IR prebuilt image and=
 two capsules to the MPS3.
+      #. Power cycle the MPS3.
=20
-::
+    - FVP:
=20
-   kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c =
"../meta-arm/scripts/runfvp --terminals=3Dxterm -- -C board.msd_mmc.p_mmc=
_file=3D<path-to-img>/ir-acs-live-image-generic-arm64.wic"
+      #. Run the FVP with the IR prebuilt image which now also contains =
the two capsules:
=20
-**NOTE:** <path-to-img> must start from the root directory. make sure th=
ere are no spaces before or after of "=3D". board.msd_mmc.p_mmc_file=3D<p=
ath-to-img>/ir-acs-live-image-generic-arm64.wic.
-**NOTE:** Do not restart the FVP between the positive and negative test =
because it will start from a clean state.
+      .. code-block:: console
=20
-Executing capsule update for FVP and FPGA
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+        kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l \
+        -c "../meta-arm/scripts/runfvp --terminals=3Dxterm \
+        -- -C board.msd_mmc.p_mmc_file=3D$ACS_IMAGE_PATH/ir-acs-live-ima=
ge-generic-arm64.wic"
=20
-Wait until U-boot loads EFI from the ACS image stick and interrupt the E=
FI
-shell by pressing ESC when the following prompt is displayed in the Host
-terminal (ttyUSB2).
+      .. warning::
=20
-::
+          ``$ACS_IMAGE_PATH`` must be an absolute path. Ensure there are=
 no spaces before or after of ``=3D`` of the ``-C board.msd_mmc.p_mmc_fil=
e`` option.
=20
-   Press ESC in 4 seconds to skip startup.nsh or any other key to contin=
ue.
=20
-Then, type FS0: as shown below:
+#. Wait until U-Boot loads EFI from the ACS image and interrupt the EFI =
shell by pressing the ``Escape`` key when the following prompt is display=
ed on the Host Processor terminal (``ttyUSB2``).
=20
-::
+    .. code-block:: console
=20
-  FS0:
+        Press ESC in 4 seconds to skip startup.nsh or any other key to c=
ontinue.
=20
-Then start the CapsuleApp application. Use the positive capsule
-(corstone1000-<fvp/mps3>-v6.uefi.capsule) first.
+#. Access the content of the first file system (``File System 0``) where=
 we copied the capsule files by running the following command:
=20
-::
+    .. code-block:: console
=20
-  EFI/BOOT/app/CapsuleApp.efi corstone1000-<fvp/mps3>-v6.uefi.capsule
+        FS0:
=20
-The capsule update will be started.
+#. Run the ``CapsuleApp`` application with the valid capsule file:
=20
-**NOTE:**  On the FVP it takes around 15-30 minutes, on the FPGA it take=
s less time.
+    .. code-block:: console
=20
-After successfully updating the capsule the system will reset. Make sure=
 the
-Corstone-1000's Poky Distro is booted after the reset so the ESRT can be=
 checked.
-It is described in the `Select Corstone-1000 Linux kernel boot`_ section=
 how to
-boot the Poky distro after the capsule update.
-The `Positive scenario`_ sections describes how the result should be ins=
pected.
-After the result is checked, the system can be rebooted with the ``reboo=
t`` command in the Host
-terminal (ttyUSB2).
+        EFI/BOOT/app/CapsuleApp.efi corstone1000-$TARGET-v6.uefi.capsule
=20
-Interrupt the EFI shell again and now start the capsule update with the =
negative capsule:
+    The capsule update will be started.
=20
-::
+    .. note::
+        The capsule update takes about 8 minutes to complete on MPS3 and=
 between 15-30 minutes on FVP.
=20
-  EFI/BOOT/app/CapsuleApp.efi corstone1000-<fvp/mps3>-v5.uefi.capsule
+        The Corstone-1000 will reset after successfully applying the cap=
sule.
=20
-The command above should fail and in the TF-M logs the following message=
 should appear:
+   =20
+    The software stack copies the capsule content to the external flash,=
 which is shared between the Secure Enclave and the Host Processor
+    before rebooting the system.
=20
-::
+    After the first reboot, TrustedFirmware-M should apply the valid cap=
sule and display the following log on the Secure Enclave terminal (``ttyU=
SB1``)
+    before rebooting the system a second time:
=20
-   ERROR: flash_full_capsule: version error
+    .. code-block:: console
=20
-Then, reboot manually:
+      ...
+      SysTick_Handler: counted =3D 10, expiring on =3D 360
+      SysTick_Handler: counted =3D 20, expiring on =3D 360
+      SysTick_Handler: counted =3D 30, expiring on =3D 360
+      ...
+      metadata_write: success: active =3D 1, previous =3D 0
+      flash_full_capsule: exit
+      corstone1000_fwu_flash_image: exit: ret =3D 0
+      ...
=20
-::
+    The above log snippet indicates that the new capsule image is succes=
sfully applied, and the board is booting with the external flash's Bank-1=
.
=20
-   Shell> reset
+    After a second reboot, the following log should be displayed on on t=
he Secure Enclave terminal (``ttyUSB1``):
=20
-Make sure the Corstone-1000's Poky Distro is booted again
-(`Select Corstone-1000 Linux kernel boot`_) in order to check the result=
s
-`Negative scenario`_.
+    .. code-block:: console
=20
-Select Corstone-1000 Linux kernel boot
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+      ...
+      fmp_set_image_info:133 Enter
+      FMP image update: image id =3D 0
+      FMP image update: status =3D 0version=3D6 last_attempt_version=3D6=
.
+      fmp_set_image_info:157 Exit.
+      corstone1000_fwu_host_ack: exit: ret =3D 0
+      ...
=20
-Interrupt the U-Boot shell.
+#. Interrupt the U-Boot shell.
=20
-::
+    .. code-block:: console
=20
-   Hit any key to stop autoboot:
+        Hit any key to stop autoboot:
=20
-Run the following commands in order to run the Corstone-1000 Linux kerne=
l and being able to check the ESRT table.
+#. Run the following commands in order to run the Corstone-1000 Linux ke=
rnel.
=20
-**NOTE:** Otherwise, the execution ends up in the ACS live image.
+    .. note::
+        Otherwise, the execution ends up in the ACS live image.
=20
-::
+    .. code-block:: console
=20
-   $ unzip $kernel_addr 0x90000000
-   $ loadm 0x90000000 $kernel_addr_r $filesize
-   $ bootefi $kernel_addr_r $fdtcontroladdr
+        $ unzip $kernel_addr 0x90000000
+        $ loadm 0x90000000 $kernel_addr_r $filesize
+        $ bootefi $kernel_addr_r $fdtcontroladdr
=20
=20
-*********************
-Capsule update status
-*********************
+#. After the system fully boots, read the EFI System Resource Table (ESR=
T) to verify that the firmware version matches the version of the capsule=
 applied.
=20
-Positive scenario
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+  .. code-block:: console
=20
-In the positive case scenario, the software stack copies the capsule to =
the
-External Flash, which is shared between the Secure Enclave and Host,
-then a reboot is triggered. The TF-M accepts the capsule.
-The user should see following TF-M log in the Secure Enclave terminal (t=
tyUSB1)
-before the system reboots automatically, indicating the new capsule
-image is successfully applied, and the board boots correctly.
+    # cd /sys/firmware/efi/esrt/entries/entry0
+    # cat *
=20
-::
+    0x0                                      # capsule_flags
+    989f3a4e-46e0-4cd0-9877-a25c70c01329     # fw_class
+    0                                        # fw_type
+    6                                        # fw_version
+    0                                        # last_attempt_status
+    6                                        # last_attempt_version
+    0                                        # lowest_supported_fw_ver
=20
-  ...
-  SysTick_Handler: counted =3D 10, expiring on =3D 360
-  SysTick_Handler: counted =3D 20, expiring on =3D 360
-  SysTick_Handler: counted =3D 30, expiring on =3D 360
-  ...
-  metadata_write: success: active =3D 1, previous =3D 0
-  flash_full_capsule: exit
-  corstone1000_fwu_flash_image: exit: ret =3D 0
-  ...
+  See the `UEFI documentation <https://uefi.org/specs/UEFI/2.10/23_Firmw=
are_Update_and_Reporting.html#id29>`__ for more information on the signif=
icance of the table fields.
=20
-And after the reboot:
+.. warning::
=20
-::
+    Do not terminate FVP between the positive and negative capsule updat=
e tests.
=20
-  ...
-  fmp_set_image_info:133 Enter
-  FMP image update: image id =3D 0
-  FMP image update: status =3D 0version=3D6 last_attempt_version=3D6.
-  fmp_set_image_info:157 Exit.
-  corstone1000_fwu_host_ack: exit: ret =3D 0
-  ...
+Negative Capsule Update Test
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
=20
+.. important::
=20
-It's possible to check the content of the ESRT table after the system fu=
lly boots.
+  The `positive capsule update test <positive-capsule-update-test_>`__ m=
ust be run before running the negative capsule update test.
=20
-In the Linux command-line run the following:
+#. After running the positive capsule update test, reboot the system by =
typing the following command on the Host Processor terminal (``ttyUSB2``)=
:
=20
-::
+    .. code-block:: console
=20
-   # cd /sys/firmware/efi/esrt/entries/entry0
-   # cat *
+        reboot
=20
-   0x0
-   989f3a4e-46e0-4cd0-9877-a25c70c01329
-   0
-   6
-   0
-   6
-   0
+#. Wait until U-Boot loads EFI from the ACS image and interrupt the EFI =
shell by pressing the ``Escape`` key when the following prompt is display=
ed on the Host Processor terminal (``ttyUSB2``).
=20
-.. line-block::
-   capsule_flags:	0x0
-   fw_class:	989f3a4e-46e0-4cd0-9877-a25c70c01329
-   fw_type:	0
-   fw_version:	6
-   last_attempt_status:	0
-   last_attempt_version:	6
-   lowest_supported_fw_ver:	0
+    .. code-block:: console
=20
+        Press ESC in 4 seconds to skip startup.nsh or any other key to c=
ontinue.
=20
-Negative scenario
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+#. Run the ``CapsuleApp`` application with the invalid capsule file:
=20
-In the negative case scenario (rollback the capsule version),
-the TF-M detects that the new capsule's version number is
-smaller then the current version. The capsule is rejected because
-of this.
-The user should see appropriate logs in the Secure Enclave terminal (tty=
USB1) before the system reboots itself.
+    .. code-block:: console
=20
-::
+        EFI/BOOT/app/CapsuleApp.efi corstone1000-$TARGET-v5.uefi.capsule
=20
-  ...
-    uefi_capsule_retrieve_images: image 0 at 0xa0000070, size=3D15654928
-    uefi_capsule_retrieve_images: exit
-    flash_full_capsule: enter: image =3D 0x0xa0000070, size =3D 7764541,=
 version =3D 5
-    ERROR: flash_full_capsule: version error
-    private_metadata_write: enter: boot_index =3D 1
-    private_metadata_write: success
-    fmp_set_image_info:133 Enter
-    FMP image update: image id =3D 0
-    FMP image update: status =3D 1version=3D6 last_attempt_version=3D5.
-    fmp_set_image_info:157 Exit.
-    corstone1000_fwu_flash_image: exit: ret =3D -1
-    fmp_get_image_info:232 Enter
-    pack_image_info:207 ImageInfo size =3D 105, ImageName size =3D 34, I=
mageVersionName
-    size =3D 36
-    fmp_get_image_info:236 Exit
-  ...
-
-
-If capsule pass initial verification, but fails verifications performed =
during
-boot time, Secure Enclave will try new images predetermined number of ti=
mes
-(defined in the code), before reverting back to the previous good bank.
-
-::
-
-  ...
-  metadata_write: success: active =3D 0, previous =3D 1
-  fwu_select_previous: in regular state by choosing previous active bank
-  ...
-
-It's possible to check the content of the ESRT table after the system fu=
lly boots.
-
-In the Linux command-line run the following:
-
-::
-
-   # cd /sys/firmware/efi/esrt/entries/entry0
-   # cat *
-
-   0x0
-   989f3a4e-46e0-4cd0-9877-a25c70c01329
-   0
-   6
-   1
-   5
-   0
-
-.. line-block::
-   capsule_flags:	0x0
-   fw_class:	989f3a4e-46e0-4cd0-9877-a25c70c01329
-   fw_type:	0
-   fw_version:	6
-   last_attempt_status:	1
-   last_attempt_version:	5
-   lowest_supported_fw_ver:	0
-
-
-Linux distros tests
+
+#. TrustedFirmware-M should reject the capsule due to having a lower fir=
mware version and display the following log on the Secure Enclave termina=
l (``ttyUSB1``):
+
+    .. code-block:: console
+
+      ...
+        uefi_capsule_retrieve_images: image 0 at 0xa0000070, size=3D1565=
4928
+        uefi_capsule_retrieve_images: exit
+        flash_full_capsule: enter: image =3D 0x0xa0000070, size =3D 7764=
541, version =3D 5
+        ERROR: flash_full_capsule: version error
+        private_metadata_write: enter: boot_index =3D 1
+        private_metadata_write: success
+        fmp_set_image_info:133 Enter
+        FMP image update: image id =3D 0
+        FMP image update: status =3D 1version=3D6 last_attempt_version=3D=
5.
+        fmp_set_image_info:157 Exit.
+        corstone1000_fwu_flash_image: exit: ret =3D -1
+        fmp_get_image_info:232 Enter
+        pack_image_info:207 ImageInfo size =3D 105, ImageName size =3D 3=
4, ImageVersionName
+        size =3D 36
+        fmp_get_image_info:236 Exit
+      ...
+
+    The Secure Enclave tries to load the new image a predetermined numbe=
r of times
+    if the capsule passes initial verification but fails verifications p=
erformed during
+    boot time.
+
+      .. code-block:: console
+
+        ...
+        metadata_write: success: active =3D 0, previous =3D 1
+        fwu_select_previous: in regular state by choosing previous activ=
e bank
+        ...
+
+    The Secure Enclave eventually reverts back to the previously running=
 image.
+
+#. Reboot manually:
+
+    .. code-block:: console
+
+        Shell> reset
+
+#. Interrupt the U-Boot shell.
+
+    .. code-block:: console
+
+        Hit any key to stop autoboot:
+
+#. Run the following commands in order to run the Corstone-1000 Linux ke=
rnel.
+
+    .. note::
+        Otherwise, the execution ends up in the ACS live image.
+
+    .. code-block:: console
+
+        $ unzip $kernel_addr 0x90000000
+        $ loadm 0x90000000 $kernel_addr_r $filesize
+        $ bootefi $kernel_addr_r $fdtcontroladdr
+
+#. After the system fully boots, read the ESRT to verify the firmware ve=
rsion does not match what is on the invalid capsule.
+
+    .. code-block:: console
+
+      # cd /sys/firmware/efi/esrt/entries/entry0
+      # cat *
+
+      0x0                                      # capsule_flags
+      989f3a4e-46e0-4cd0-9877-a25c70c01329     # fw_class
+      0                                        # fw_type
+      6                                        # fw_version
+      1                                        # last_attempt_status
+      5                                        # last_attempt_version
+      0                                        # lowest_supported_fw_ver
+
+
+
+Linux Distributions
 -------------------
=20
-*************************************************************
-Debian install and boot preparation
-*************************************************************
+This sections describes the steps to install major Linux distributions t=
o the Corstone-1000 Host Processor.
=20
-There is a known issue in the `Shim 15.7 <https://salsa.debian.org/efi-t=
eam/shim/-/tree/upstream/15.7?ref_type=3Dtags>`__
-provided with the Debian installer image (see below). This bug causes a =
fatal
-error when attempting to boot media installer for Debian, and it resets =
the platform before installation starts.
-A patch to be applied to the Corstone-1000 stack (only applicable when
-installing Debian) is provided to
-`Skip the Shim <https://gitlab.arm.com/arm-reference-solutions/systemrea=
dy-patch/-/blob/CORSTONE1000-2024.06/embedded-a/corstone1000/shim/0001-ar=
m-bsp-u-boot-corstone1000-Skip-the-shim-by-booting.patch>`__.
-This patch makes U-Boot automatically bypass the Shim and run grub and a=
llows
-the user to proceed with a normal installation. If at the moment of read=
ing this
-document the problem is solved in the Shim, the user is encouraged to tr=
y the
-corresponding new installer image. Otherwise, please apply the patch as
-indicated by the instructions listed below. These instructions assume th=
at the
-user has already built the stack by following the build steps of this
-documentation.
+The Linux distributions to be installed are:
=20
-::
+ - `Debian <https://www.debian.org/>`__
+ - `openSUSE <https://www.opensuse.org/>`__
=20
-  cd <_workspace>
-  git clone https://git.gitlab.arm.com/arm-reference-solutions/systemrea=
dy-patch.git -b CORSTONE1000-2024.06
-  cp -f systemready-patch/embedded-a/corstone1000/shim/0001-arm-bsp-u-bo=
ot-corstone1000-Skip-the-shim-by-booting.patch meta-arm
-  cd meta-arm
-  git am 0001-arm-bsp-u-boot-corstone1000-Skip-the-shim-by-booting.patch
-  cd ..
+Follow the instructions below to install the Linux distributions to the =
Corstone-1000 software stack.
=20
-**On FPGA**
+***********************************
+Apply Patch for Debian Installation
+***********************************
=20
-::
+.. warning::
+    **!!Debian ONLY!!**
=20
-  kas shell meta-arm/kas/corstone1000-mps3.yml:meta-arm/ci/debug.yml -c=3D=
"bitbake u-boot trusted-firmware-a corstone1000-flash-firmware-image -c c=
leansstate; bitbake corstone1000-flash-firmware-image"
+    There is a known issue in `Shim 15.7 <https://salsa.debian.org/efi-t=
eam/shim/-/tree/upstream/15.7?ref_type=3Dtags>`__
+    provided with the Debian installer image.
+    This bug causes a fatal error when attempting to boot media installe=
r for Debian, and resets the platform before installation starts.
+   =20
+    A `patch <debian-skip-shim-patch>`__ to be applied to the Corstone-1=
000 software stack is provided to skip the Shim.
+    This patch makes U-Boot automatically bypass the Shim and run GRUB t=
o allow
+    the user to proceed with a normal installation.
+   =20
+    You are encourage to try a new installer if at the moment of reading=
 this document the Shim problem has been solved.
+    Otherwise, please apply the patch as indicated by the instructions b=
elow.
=20
-**On FVP**
+#. Clone the repository containing the patch in your ``$WORKSPACE``:
=20
-::
+    .. code-block:: console
=20
-  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c=3D=
"bitbake u-boot trusted-firmware-a corstone1000-flash-firmware-image -c c=
leansstate; bitbake corstone1000-flash-firmware-image"
+        cd $WORKSPACE
+        git clone https://git.gitlab.arm.com/arm-reference-solutions/sys=
temready-patch.git -b CORSTONE1000-2024.06
=20
-On FPGA, please update the cs1000.bin on the SD card with the newly gene=
rated wic file.
+#. Copy the Git patch file to your local copy of `meta-arm` in your work=
space:
=20
-**NOTE:** Skip the shim patch only applies to Debian installation. The u=
ser should remove the patch from meta-arm before running the software to =
boot OpenSUSE or executing any other tests in this user guide. You can ma=
ke sure of removing the skip the shim patch by executing the steps below.
+    .. code-block:: console
=20
-::
+        cp -f systemready-patch/embedded-a/corstone1000/shim/0001-arm-bs=
p-u-boot-corstone1000-Skip-the-shim-by-booting.patch meta-arm
=20
-  cd <_workspace>/meta-arm
-  git reset --hard HEAD~1
-  cd ..
-  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c=3D=
"bitbake u-boot -c cleanall; bitbake trusted-firmware-a -c cleanall; bitb=
ake corstone1000-flash-firmware-image -c cleanall; bitbake corstone1000-f=
lash-firmware-image"
+#. Change the current working directory to your local copy of the `meta-=
arm` repository to apply the Git patch:
=20
-*************************************************
-Preparing the Installation Media
-*************************************************
+    .. code-block:: console
=20
-Download one of following Linux distro images:
- - `Debian installer image <https://cdimage.debian.org/mirror/cdimage/ar=
chive/12.4.0/arm64/iso-dvd/>`__
- - `OpenSUSE Tumbleweed installer image <http://download.opensuse.org/po=
rts/aarch64/tumbleweed/iso/>`__ (Tested on: openSUSE-Tumbleweed-DVD-aarch=
64-Snapshot20240516-Media.iso)
+        cd meta-arm
+        git am 0001-arm-bsp-u-boot-corstone1000-Skip-the-shim-by-booting=
.patch
=20
-**NOTE:** For OpenSUSE Tumbleweed, the user should look for a DVD Snapsh=
ot like
-openSUSE-Tumbleweed-DVD-aarch64-Snapshot<date>-Media.iso
+#. Change the current working directory back to your ``$WORKSPACE``:
=20
+    .. code-block:: console
=20
-FPGA
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+        cd $WORKSPACE
=20
-To test Linux distro install and boot on FPGA, the user should prepare t=
wo empty USB
-sticks (minimum size should be 4GB and formatted with FAT32).
+#. Initialize a kas shell environment using the debug configuration file=
 for your target to:
=20
-The downloaded iso file needs to be flashed to your USB drive.
-This can be done with your development machine.
+   - remove build artefacts (for ``u-boot``, ``trusted-firmware-a``, and=
 ``corstone1000-flash-firmware-image``)
+   - reset the state of those recipes
+   - re-build the ``corstone1000-flash-firmware-image`` recipe from scra=
tch
=20
-In the example given below, we assume the USB device is ``/dev/sdb`` (th=
e user
-should use the `lsblk` command to confirm).
+    .. code-block:: console
+   =20
+        kas shell meta-arm/kas/corstone1000-$TARGET.yml:meta-arm/ci/debu=
g.yml \
+        -c=3D"bitbake u-boot trusted-firmware-a corstone1000-flash-firmw=
are-image -c cleansstate; \
+        bitbake corstone1000-flash-firmware-image"
=20
-**NOTE:** Please don't confuse your host machine own hard drive with the=
 USB drive.
-Then, copy the contents of the iso file into the first USB stick by runn=
ing the
-following command in the development machine:
+.. important::
=20
-::
+    On MPS3, replace the ``cs1000.bin`` on the SD card with the newly ge=
nerated ``*.wic`` file.
=20
-  sudo dd if=3D<path-to-iso_file> of=3D/dev/sdb iflag=3Ddirect oflag=3Dd=
irect status=3Dprogress bs=3D1M; sync;
+.. warning::
=20
+    The Corstone-1000 patch for Debian installation must be removed from=
 `meta-arm` before running the software to boot openSUSE or
+    executing any other tests in this user guide.
+   =20
+    Remove the patch and rebuild the ``corstone1000-flash-firmware-image=
`` recipe by running the following commands:
=20
-FVP
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+    .. code-block:: console
=20
-To test Linux distro install and boot on FVP, the user should prepare an=
 mmc image.
-With a minimum size of 8GB formatted with gpt.
+        cd $WORKSPACE/meta-arm
+        git reset --hard HEAD~1
+        cd $WORKSPACE
+        kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l \
+        -c=3D"bitbake u-boot -c cleanall; bitbake trusted-firmware-a -c =
cleanall; \
+        bitbake corstone1000-flash-firmware-image -c cleanall; \
+        bitbake corstone1000-flash-firmware-image"
=20
-::
+**************************
+Prepare Installation Media
+**************************
=20
-  #Generating os_file
-  dd if=3D/dev/zero of=3D<_workspace>/os_file.img bs=3D1 count=3D0 seek=3D=
10G; sync;
-  parted -s os_file.img mklabel gpt
+The media containing the bootable files required to start the installati=
on process needs to be prepared.
=20
+Follow the instructions below to create the installation media.
=20
-*************************************************
-Debian/openSUSE install
-*************************************************
+#. Using your development machine, download one of following Linux distr=
ibution images:
=20
-FPGA
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+    - `Debian installer image <https://cdimage.debian.org/mirror/cdimage=
/archive/12.4.0/arm64/iso-dvd/>`__
+    - `OpenSUSE Tumbleweed installer image <http://download.opensuse.org=
/ports/aarch64/tumbleweed/iso/>`__=20
=20
-Unplug the first USB stick from the development machine and connect it t=
o the
-MSP3 board. At this moment, only the first USB stick should be connected=
. Open
-the following picocom sessions in your development machine:
+    .. note::
+       =20
+        For openSUSE Tumbleweed, search for an ISO file with the format:=
 ``openSUSE-Tumbleweed-DVD-aarch64-Snapshot$DATE-Media.iso``.
+       =20
+        ``openSUSE-Tumbleweed-DVD-aarch64-Snapshot20240516-Media.iso`` w=
as used during development.
=20
-::
+    The location of the ISO file on the development machine will be refe=
rred to as ``$DISTRO_INSTALLER_ISO_PATH``.
=20
-  sudo picocom -b 115200 /dev/ttyUSB0  # in one terminal
-  sudo picocom -b 115200 /dev/ttyUSB2  # in another terminal.
+#. Create the installation media which will contain the necessary files =
to install the operation system.
=20
-When the installation screen is visible in ttyUSB2, plug in the second U=
SB stick
-in the MPS3 and start the distro installation process. If the installer =
does not
-start, please try to reboot the board with both USB sticks connected and=
 repeat
-the process.
+    - MPS3:
=20
-**NOTE:** Due to the performance limitation of Corstone-1000 MPS3 FPGA, =
the
-distro installation process can take up to 24 hours to complete.
+        #. Plug a blank USB drive formatted with FAT32, ensuring it has =
a minimum capacity of 4GB, to the development machine.
=20
-FVP
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+        #. Run the following command to discover which device is your US=
B drive:
=20
-::
+            .. code-block:: console
=20
-  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c "=
../meta-arm/scripts/runfvp --terminals=3Dxterm -- -C board.msd_mmc.p_mmc_=
file=3D<_workspace>/os_file.img -C board.msd_mmc_2.p_mmc_file=3D<path-to-=
iso_file>"
+                lsblk
=20
-The installer should now start.
-The OS will be installed on 'os_file.img'.
+            The remaining steps assume the USB drive is ``/dev/sdb``.
=20
-*******************************************************
-Debian install clarifications
-*******************************************************
+            .. warning::
=20
-As the installation process for Debian is different than the one for ope=
nSUSE,
-Debian may need some extra steps, that are indicated below:
+                Do not mistake your development machine hard drive with =
the USB drive.
=20
-During Debian installation, please answer the following question:
- - "Force grub installation to the EFI removable media path?" Yes
- - "Update NVRAM variables to automatically boot into Debian?" No
+        #. Write one of the distribution installer ISO file to the USB d=
rive.
=20
-If the grub installation fails, these are the steps to follow on the sub=
sequent
-popups:
+            .. code-block:: console
=20
-1. Select "Continue", then "Continue" again on the next popup
-2. Scroll down and select "Execute a shell"
-3. Select "Continue"
-4. Enter the following command:
+                sudo dd if=3D$DISTRO_INSTALLER_ISO_PATH of=3D/dev/sdb if=
lag=3Ddirect oflag=3Ddirect status=3Dprogress bs=3D1M; sync;
=20
-::
+    - FVP:
=20
-   in-target grub-install --no-nvram --force-extra-removable
+        The distribution installer ISO file does not need to be burnt to=
 a USB drive.
+        It will be used as is when starting the FVP install the distribu=
tion.
=20
-5. Enter the following command:
+********************
+Prepare System Drive
+********************
=20
-::
+A system (or boot) drive, to store all the operating system files and us=
ed to boot the distribution, is required as
+Corstone-1000 on-board non-volatile storage size is insufficient for ins=
talling the distributions.
=20
-   in-target update-grub
+    - MPS3:
+        #. Find another blank USB drive formatted with FAT32 with a mini=
mum capacity of 4GB.
+        #. Do not yet connect this blank USB drive to the MPS3. It will =
be used as the primary drive to boot the distribution.
=20
-6. Enter the following command:
+    - FVP:
+        #. Create an 8GB GUID Partition Table (GPT) formatted MultiMedia=
Card (MMC) image.
=20
-::
+            .. code-block:: console
=20
-   exit
+                dd if=3D/dev/zero of=3D$WORKSPACE/fvp_distro_system_driv=
e.img \
+                bs=3D1 count=3D0 seek=3D10G; sync; \
+                parted -s fvp_distro_system_drive.img mklabel gpt
+   =20
+        #. This MMC image will be used as the primary drive to boot the =
distribution.
=20
-7. Select "Continue without boot loader", then select "Continue" on the =
next popup
-8. At this stage, the installation should proceed as normal.
=20
-*****************************************************************
-Debian/openSUSE boot after installation
-*****************************************************************
+************
+Installation
+************
=20
-FPGA
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-Once the installation is complete, unplug the first USB stick and reboot=
 the
-board.
-The board will then enter recovery mode, from which the user can access =
a shell
-after entering the password for the root user.
+MPS3
+=3D=3D=3D=3D
+
+#. Connect the installation media, which contains the installer for the =
desired distribution, to the MPS3.
+#. Open a serial port terminal interface to ``/dev/ttyUSB0`` in one term=
inal window on your development machine.
+
+    .. code-block:: console
+
+        sudo picocom -b 115200 /dev/ttyUSB0
+
+#. Open a serial port terminal interface to ``/dev/ttyUSB2`` in another =
terminal window on your development machine.
+
+    .. code-block:: console
+
+        sudo picocom -b 115200 /dev/ttyUSB2
+
+#. When the installation screen is displayed on ``ttyUSB2``, plug in the=
 (still empty) system drive to the MPS3.
+#. Start the distribution installation process.
+
+    .. note::
+
+        Reboot the MPS3 with both USB drives (installation media and emp=
ty system drive) connected to it if the distribution installer does not s=
tart.
+
+.. note::
+
+    Due to the performance limitation, the distribution installation pro=
cess can take up to 24 hours to complete.
=20
 FVP
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-The platform should automatically boot into the installed OS image.
+=3D=3D=3D
+#. Start the FVP with the system drive as the primary drive and the dist=
ro ISO file as the secondary drive.
+
+    .. code-block:: console
=20
-To cold boot:
+        kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l \
+        -c "../meta-arm/scripts/runfvp --terminals=3Dxterm -- \
+        -C board.msd_mmc.p_mmc_file=3D$WORKSPACE/fvp_distro_system_drive=
.img \
+        -C board.msd_mmc_2.p_mmc_file=3D$DISTRO_INSTALLER_ISO_PATH"
=20
- ::
+    The Linux distribution will be installed on ``fvp_distro_system_driv=
e.img``.
=20
-  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c "=
../meta-arm/scripts/runfvp --terminals=3Dxterm -- -C board.msd_mmc.p_mmc_=
file=3D<_workspace>/os_file.img"
=20
+Debian Installation Extra Steps
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
+
+Debian installation may need some extra steps, that are indicated below:
=20
-The board will then enter recovery mode, from which the user can access =
a shell
-after entering the password for the root user.
+#. Answer ``Yes`` to the question ``Force grub installation to the EFI r=
emovable media path?``.
=20
+    If the GRUB installation fails, these are the steps to follow on the=
 subsequent
+    popups:
=20
-**NOTE:** To manually enter recovery mode, once the FVP begins booting, =
you can quickly
-change the boot option in grub, to boot into recovery mode. This option =
will disappear
-quickly, so it's best to preempt it.
+    #. Select ``Continue``, then ``Continue`` again on the next popup.
=20
-Select 'Advanced Options for '<OS>' and then '<OS> (recovery mode)'.
+    #. Scroll down and select ``Execute a shell``.
=20
-Common
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+    #. Select ``Continue``.
=20
-Proceed to edit the following files accordingly:
+    #. Enter the following command:
=20
-::
+        .. code-block:: console
=20
-  #Only applicable to Debian
-  vi /etc/systemd/system.conf
-  DefaultDeviceTimeoutSec=3Dinfinity
+            in-target grub-install --no-nvram --force-extra-removable
=20
-::
+    #. Enter the following command:
=20
-  #Only applicable to openSUSE
-  vi /usr/lib/systemd/system.conf
-  DefaultDeviceTimeoutSec=3Dinfinity
+        .. code-block:: console
=20
-  The system.conf has been moved from /etc/systemd/ to /usr/lib/systemd/=
 and directly modifying
-  the /usr/lib/systemd/system.conf is not working and it is getting over=
ridden. We have to create
-  drop ins system configurations in /etc/systemd/system.conf.d/ director=
y. So, copy the
-  /usr/lib/systemd/system.conf to /etc/systemd/system.conf.d/ directory =
after the mentioned modifications.
+            in-target update-grub
+   =20
+    #. Enter the following command:
=20
-The file to be edited next is different depending on the installed distr=
o:
+        .. code-block:: console
=20
-::
+            exit
=20
-  vi /etc/login.defs # Only applicable to Debian
-  vi /usr/etc/login.defs # Only applicable to openSUSE
-  LOGIN_TIMEOUT   180
+    #. Select ``Continue without boot loader``, then select ``Continue``=
 on the next popup.
=20
-To make sure the changes are applied, please run:
+    #. At this stage, the installation should proceed as normal.
=20
-::
+#. Answer ``No`` to the question ``Update NVRAM variables to automatical=
ly boot into Debian?``.
=20
-  systemctl daemon-reload
=20
-After applying the previous commands, please reboot the board or restart=
 the runfvp command.
+*****************
+Boot Distribution
+*****************
=20
-The user should see a login prompt after booting, for example, for debia=
n:
+- MPS3
=20
-::
+    #. Once the installation is complete, unplug the installation media.
+    #. Perform a cold boot of the MPS3.
=20
-  debian login:
+- FVP
=20
-Login with the username root and its corresponding password (already set=
 at
-installation time).
+    The target should automatically boot into the installed operating sy=
stem image.
=20
-**NOTE:** Debian/OpenSUSE Timeouts are not applicable for all systems. S=
ome systems are faster than the others (especially when running the FVP) =
and works well with default timeouts. If the system boots to Debian or Op=
enSUSE unmodified, the user can skip this section.
+    Stop the FVP and run the command below to simulate a cold boot:
=20
-PSA API tests
--------------
+    .. code-block:: console
=20
-***********************************************************
-Run PSA API test commands (applicable to both FPGA and FVP)
-***********************************************************
+        kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l \
+        -c "../meta-arm/scripts/runfvp --terminals=3Dxterm -- \
+        -C board.msd_mmc.p_mmc_file=3D$WORKSPACE/fvp_distro_system_drive=
.img.img"
=20
-When running PSA API test commands (aka PSA Arch Tests) on MPS3 FPGA, th=
e user should make sure there is no
-USB stick connected to the board. Power on the board and boot the board =
to
-Linux. Then, the user should follow the steps below to run the tests.
+    .. warning::
=20
-When running the tests on the Corstone-1000 FVP, the user should follow =
the
-instructions in `Running the software on FVP`_ section to boot Linux in =
FVP
-host_terminal_0, and login using the username ``root``.
+        To manually enter recovery mode, once the FVP begins booting, yo=
u can quickly
+        change the boot option in GRUB, to boot into recovery mode. This=
 option will disappear
+        quickly, so it is best to preempt it.
=20
-First, load FF-A TEE kernel module:
+        Select ``Advanced Options for <OS>`` and then ``<OS> (recovery m=
ode)``.
=20
-::
=20
-  insmod /lib/modules/*-yocto-standard/updates/arm-tstee.ko
+The target will then enter recovery mode, from which the user can access=
 a shell
+after entering the password for the ``root`` user.
=20
-Then, check whether the FF-A TEE driver is loaded correctly by using the=
 following command:
=20
-::
+Timeout Optimizations
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-  cat /proc/modules | grep arm_tstee
+.. important::
=20
-The output should be similar to:
+    Operating system timeouts are inconsistent across systems.
+    Skip this section if the system boots to Debian or OpenSUSE without =
any issue.
=20
-::
+Make the system modification below whilst in recovery mode to increase t=
imeouts and boot to the installed distribution.
=20
-   arm_tstee 16384 - - Live 0xffffffc000510000 (O)
+#. Remove the timeout limit for device operations.
=20
-Now, run the PSA API tests in the following order:
+    - Debian
+        .. code-block:: console
=20
-::
+            vi /etc/systemd/system.conf
+            DefaultDeviceTimeoutSec=3Dinfinity
=20
-  psa-iat-api-test
-  psa-crypto-api-test
-  psa-its-api-test
-  psa-ps-api-test
+    - openSUSE
+        .. code-block:: console
=20
+            vi /usr/lib/systemd/system.conf
+            DefaultDeviceTimeoutSec=3Dinfinity
=20
-UEFI Secureboot (SB) test
--------------------------
+        .. warning::
=20
-Before running the SB test, the user should make sure that the `FVP and =
FPGA software has been compiled and the ESP image for both the FVP and FP=
GA has been created` as mentioned in the previous sections and user shoul=
d use the same workspace directory under which sources have been compiled=
.
-The SB test is applicable on both the FVP and the FPGA and this involves=
 testing both the signed and unsigned kernel images. Successful test resu=
lts in executing the signed image correctly and not allowing the unsigned=
 image to run at all.
+            As modifying ``system.conf`` in ``/usr/lib/systemd/`` is not=
 working as it is getting overwritten,
+            copy ``system.conf`` from ``/usr/lib/systemd/`` to ``/etc/sy=
stemd/system.conf.d/`` after the above edit.
=20
-***********************************************************
-Below steps are applicable to FVP as well as FPGA
-***********************************************************
-Firstly, the flash firmware image has to be built for both the FVP and F=
PGA as follows:
+#. Set the maximum time that the system will wait for a user to successf=
ully log in before timing out to 180 seconds.
=20
-For FVP,
+    - Debian
+        .. code-block:: console
=20
-::
+            vi /etc/login.defs
+            LOGIN_TIMEOUT   180
=20
-  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c b=
itbake -c build corstone1000-flash-firmware-image"
+    - openSUSE
+        .. code-block:: console
=20
+            vi /usr/etc/login.defs
+            LOGIN_TIMEOUT   180
=20
-For FPGA,
+#. Ensure the changes are applied by run the command below.
=20
-::
+    .. code-block:: console
=20
-  kas shell meta-arm/kas/corstone1000-mps3.yml:meta-arm/ci/debug.yml -c =
bitbake -c build corstone1000-flash-firmware-image"
+        systemctl daemon-reload
=20
-In order to test SB for FVP and FPGA, a bash script is available in the =
systemready-patch repo which is responsible for creating the relevant key=
s, sign the respective kernel images, and copy the same in their correspo=
nding ESP images.
+#. Perform a cold boot of the target.
=20
-The script does the following:
+Log into the Distribution
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+
+Login with the ``root`` username and its corresponding password (set dur=
ing installation)
+at the distribution login prompt after booting. See an illustration for =
Debian below:
+
+.. code-block:: console
+
+    debian login:
=20
-* Create the required UEFI SB keys.
=20
-* Sign the kernel images.
+UEFI Secure Boot
+----------------
=20
-* Copy the public keys and the kernel images (both signed and unsigned) =
to the ESP image for both the FVP and FPGA.
+The UEFI Secure Boot test is designed to verify the integrity and authen=
ticity of the system=E2=80=99s boot process.
+This test ensures that only trusted, signed images are executed, thereby=
 preventing unauthorized or malicious code from running.
+A successful test confirms that the signed image executes correctly, whi=
le any unsigned image is blocked from running.
=20
-Before executing the script, clone the systemready-patch repository unde=
r <_workspace> and set the current working directory to the subdirectory =
where images are built.
=20
-**NOTE:** The `efitools <https://github.com/vathpela/efitools />`__  pac=
kage is required to execute the script. Install the efitools package on y=
our system, if it is missing.
+**********************************************
+Generate Keys, Signed Image and Unsigned Image
+**********************************************
=20
-::
+#. Build an EFI System Partition as described `here <build-efi-system-pa=
rtition_>`__.
=20
-  cd <_workspace>
-  git clone https://git.gitlab.arm.com/arm-reference-solutions/systemrea=
dy-patch.git -b CORSTONE1000-2024.06
-  cd meta-arm/build/tmp/deploy/images/corstone1000-<fvp,mps3>/
-  ../../../../../../systemready-patch/embedded-a/corstone1000/secureboot=
/create_keys_and_sign.sh -d <device type (fvp or mps3)> -v <certification=
 validity in days (optional)> -m <mount point (optional)>
+#. Clone the `systemready-patch` repository to your workspace.
=20
-For example:
-::
+    .. code-block:: console
=20
-  ../../../../../../systemready-patch/embedded-a/corstone1000/secureboot=
/create_keys_and_sign.sh -d fvp -v 365 -m /mnt/secureboot_test
+        cd $WORKSPACE
=20
-For help:
-::
+        git clone https://git.gitlab.arm.com/arm-reference-solutions/sys=
temready-patch.git \
+        -b CORSTONE1000-2024.06
=20
-  ../../../../../../systemready-patch/embedded-a/corstone1000/secureboot=
/create_keys_and_sign.sh -h
+#. Set the current working directory to build directory's subdirectory c=
ontaining the software stack build images.
=20
-**NOTE:** The above script is interactive and contains some commands tha=
t would require sudo password/permissions.
+    .. code-block:: console
=20
-After executing the above script, the relevant keys and the signed/unsig=
ned kernel images will be copied to the ESP images for both the FVP and F=
GPA. The modified ESP images can be found at the same location i.e.
+        cd $WORKSPACE/build/tmp/deploy/images/corstone1000-$TARGET/
=20
-::
+#. Run the image signing script (without changing the current working di=
rectory).
=20
-  For MPS3 FPGA : _workspace/meta-arm/build/tmp/deploy/images/corstone10=
00-mps3/corstone1000-esp-image-corstone1000-mps3.wic
-  For FVP       : _workspace/meta-arm/build/tmp/deploy/images/corstone10=
00-fvp/corstone1000-esp-image-corstone1000-fvp.wic
+    .. code-block:: console
=20
-Now, it is time to test the SB for the Corstone-1000
+        ./$WORKSPACE/systemready-patch/embedded-a/corstone1000/secureboo=
t/create_keys_and_sign.sh \
+        -d $TARGET \
+        -v $CERTIFICATE_VALIDITY_DURATION_IN_DAYS
=20
+    .. important::
=20
-***********************************************************
-Steps to test SB on FVP
-***********************************************************
-Now, as mentioned in the previous section **Prepare EFI System Partition=
**, the ESP image will be used automatically in the Corstone-1000 FVP as =
the 2nd MMC card image. Change directory to your workspace and run the FV=
P as follows:
+        The `efitools <https://github.com/vathpela/efitools/>`__  packag=
e is required to execute the script.
=20
-::
+    .. note::
=20
-  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c "=
../meta-arm/scripts/runfvp --terminals=3Dxterm"
+        Consult the image signing script help message (``-h``) for more =
information about other optional arguments.
=20
-When the script is executed, three terminal instances will be launched, =
one for the boot processor (aka Secure Enclave) processing element and tw=
o for the Host processing element. On the host side, stop the execution a=
t the U-Boot prompt which looks like `corstone1000#`. There is a timeout =
of 3 seconds to stop the execution at the U-Boot prompt. At the U-Boot pr=
ompt, run the following commands:
+        The script is interactive and contains commands that require ``s=
udo`` level permissions.
=20
-Set the current mmc device
=20
-::
+The keys, signed kernel image, and unsigned kernel image will be copied =
to the exisiting ESP image.
+The modified ESP image can be found at ``$WORKSPACE/build/tmp/deploy/ima=
ges/corstone1000-$TARGET/corstone1000-esp-image-corstone1000-$TARGET.wic`=
`.
=20
-  corstone1000# mmc dev 1
=20
-Enroll the four UEFI Secureboot authenticated variables
+****************************
+Run Unsigned Image Boot Test
+****************************
+
+.. _unsigned-image-boot-test-fvp:
+
+FVP
+=3D=3D=3D
+
+#. Follow the instructions `here <use-efi-system-partition-fvp_>`__ to u=
se the ESP.
=20
-::
+#. Run the software stack as described `here <running-software-stack-fvp=
_>`__.
=20
-  corstone1000# load mmc 1:1 ${loadaddr} corstone1000_secureboot_keys/PK=
.auth && setenv -e -nv -bs -rt -at -i ${loadaddr}:$filesize PK
-  corstone1000# load mmc 1:1 ${loadaddr} corstone1000_secureboot_keys/KE=
K.auth && setenv -e -nv -bs -rt -at -i ${loadaddr}:$filesize KEK
-  corstone1000# load mmc 1:1 ${loadaddr} corstone1000_secureboot_keys/db=
.auth && setenv -e -nv -bs -rt -at -i ${loadaddr}:$filesize db
-  corstone1000# load mmc 1:1 ${loadaddr} corstone1000_secureboot_keys/db=
x.auth && setenv -e -nv -bs -rt -at -i ${loadaddr}:$filesize dbx
+#. On the Host Processor terminal host side, stop the execution of U-Boo=
t when prompted to do so with the message ``Press any key to stop``.
=20
-Now, load the unsigned FVP kernel image and execute it. This unsigned ke=
rnel image should not boot and result as follows
+    .. warning::
=20
-::
+        There is a timeout of 3 seconds to stop the execution at the U-B=
oot prompt.
=20
-  corstone1000# load mmc 1:1 ${loadaddr} corstone1000_secureboot_fvp_ima=
ges/Image_fvp
-  corstone1000# loadm $loadaddr $kernel_addr_r $filesize
-  corstone1000# bootefi $kernel_addr_r $fdtcontroladdr
+    The U-Boot console prompt looks as follows:
+  =20
+    .. code-block:: console
+  =20
+        corstone1000#
=20
-  Booting /MemoryMapped(0x0,0x88200000,0x236aa00)
-  Image not authenticated
-  Loading image failed
=20
-The next step is to verify the signed linux kernel image. Load the signe=
d kernel image and execute it as follows:
+    .. important::
+   =20
+        The rest of the instructions below will be executed on the U-Boo=
t terminal.
=20
-::
+#. On the U-Boot console, set the current MMC device.
=20
-  corstone1000# load mmc 1:1 ${loadaddr} corstone1000_secureboot_fvp_ima=
ges/Image_fvp.signed
-  corstone1000# loadm $loadaddr $kernel_addr_r $filesize
-  corstone1000# bootefi $kernel_addr_r $fdtcontroladdr
+    .. code-block:: console
=20
-The above set of commands should result in booting of signed linux kerne=
l image successfully.
+        corstone1000# mmc dev 1
=20
+#. Enroll the four UEFI secure boot authenticated variables.
=20
-***********************************************************
-Steps to test SB on MPS3 FPGA
-***********************************************************
-Now, as mentioned in the previous section **Prepare EFI System Partition=
**, the ESP image for MPS3 FPGA needs to be copied to the USB drive.
-Follow the steps mentioned in the same section for MPS3 FPGA to prepare =
the USB drive with the ESP image. The modified ESP image corresponds to M=
PS3 FPGA can be found at the location as mentioned before i.e. `_workspac=
e/meta-arm/build/tmp/deploy/images/corstone1000-mps3/corstone1000-esp-ima=
ge-corstone1000-mps3.wic`.
-Insert this USB drive to the MPS3 FPGA and boot, and stop the execution =
at the U-Boot prompt similar to the FVP. At the U-Boot prompt, run the fo=
llowing commands:
+    .. code-block:: console
=20
-Reset the USB
+        corstone1000# \
+        load mmc 1:1 $loadaddr corstone1000_secureboot_keys/PK.auth && s=
etenv -e -nv -bs -rt -at -i $loadaddr:$filesize PK; \
+        load mmc 1:1 $loadaddr corstone1000_secureboot_keys/KEK.auth && =
setenv -e -nv -bs -rt -at -i $loadaddr:$filesize KEK; \
+        load mmc 1:1 $loadaddr corstone1000_secureboot_keys/db.auth && s=
etenv -e -nv -bs -rt -at -i $loadaddr:$filesize db; \
+        load mmc 1:1 $loadaddr corstone1000_secureboot_keys/dbx.auth && =
setenv -e -nv -bs -rt -at -i $loadaddr:$filesize dbx
=20
-::
+#. Attempt to Load the unsigned kernel image.
=20
-  corstone1000# usb reset
-  resetting USB...
-  Bus usb@40200000: isp1763 bus width: 16, oc: not available
-  USB ISP 1763 HW rev. 32 started
-  scanning bus usb@40200000 for devices... port 1 high speed
-  3 USB Device(s) found
-         scanning usb for storage devices... 1 Storage Device(s) found
+    .. code-block:: console
=20
-**NOTE:** Sometimes, the usb reset doesn't recognize the USB device. It =
is recomended to rerun the usb reset command.
+        corstone1000# \
+        load mmc 1:1 $loadaddr corstone1000_secureboot_fvp_images/Image_=
fvp; \
+        loadm $loadaddr $kernel_addr_r $filesize; \
+        bootefi $kernel_addr_r $fdtcontroladdr
=20
-Set the current USB device
+        Booting /MemoryMapped(0x0,0x88200000,0x236aa00)
+        Image not authenticated
+        Loading image failed
=20
-::
+The unsigned Linux kernel image should not be loaded.
=20
-  corstone1000# usb dev 0
+.. _unsigned-image-boot-test-mps3:
=20
-Enroll the four UEFI Secureboot authenticated variables
+MPS3
+=3D=3D=3D=3D
=20
-::
+#. Follow the instructions `here <use-efi-system-partition-mps3_>`__ to =
use the ESP.
=20
-  corstone1000# load usb 0 $loadaddr corstone1000_secureboot_keys/PK.aut=
h && setenv -e -nv -bs -rt -at -i $loadaddr:$filesize PK
-  corstone1000# load usb 0 $loadaddr corstone1000_secureboot_keys/KEK.au=
th && setenv -e -nv -bs -rt -at -i $loadaddr:$filesize KEK
-  corstone1000# load usb 0 $loadaddr corstone1000_secureboot_keys/db.aut=
h && setenv -e -nv -bs -rt -at -i $loadaddr:$filesize db
-  corstone1000# load usb 0 $loadaddr corstone1000_secureboot_keys/dbx.au=
th && setenv -e -nv -bs -rt -at -i $loadaddr:$filesize dbx
+#. Perform a cold boot of the MPS3.
=20
+#. On the Host Processor terminal host side, stop the execution of U-Boo=
t when prompted to do so with the message ``Press any key to stop``.
=20
-Now, load the unsigned MPS3 FPGA linux kernel image and execute it. This=
 unsigned kernel image should not boot and result as follows
+    .. warning::
=20
-::
+        There is a timeout of 3 seconds to stop the execution at the U-B=
oot prompt.
=20
-  corstone1000# load usb 0 $loadaddr corstone1000_secureboot_mps3_images=
/Image_mps3
-  corstone1000# loadm $loadaddr $kernel_addr_r $filesize
-  corstone1000# bootefi $kernel_addr_r $fdtcontroladdr
+    The U-Boot console prompt looks as follows:
+  =20
+    .. code-block:: console
+  =20
+        corstone1000#
=20
-  Booting /MemoryMapped(0x0,0x88200000,0x236aa00)
-  Image not authenticated
-  Loading image failed
+    .. important::
+   =20
+        The rest of the instructions below will be executed on the U-Boo=
t terminal.
=20
-The next step is to verify the signed linux kernel image. Load the signe=
d kernel image and execute it as follows:
+#. On the U-Boot console, reset USB.
=20
-::
+    .. code-block:: console
=20
-  corstone1000# load usb 0 $loadaddr corstone1000_secureboot_mps3_images=
/Image_mps3.signed
-  corstone1000# loadm $loadaddr $kernel_addr_r $filesize
-  corstone1000# bootefi $kernel_addr_r $fdtcontroladdr
+        corstone1000# usb reset
+        resetting USB...
+        Bus usb@40200000: isp1763 bus width: 16, oc: not available
+        USB ISP 1763 HW rev. 32 started
+        scanning bus usb@40200000 for devices... port 1 high speed
+        3 USB Device(s) found
+                scanning usb for storage devices... 1 Storage Device(s) =
found
=20
-The above set of commands should result in booting of signed linux kerne=
l image successfully.
+    .. note::
=20
-***********************************************************
-Steps to disable Secureboot on both FVP and MPS3 FPGA
-***********************************************************
-Now, after testing the SB, UEFI authenticated variables get stored in th=
e secure flash. When you try to reboot, the U-Boot will automatically rea=
d the UEFI authenticated variables and authenticates the images before ex=
ecuting them. In normal booting scenario, the linux kernel images will no=
t be signed and hence this will not allow the system to boot, as image au=
thentication will fail. We need to delete the Platform Key (one of the UE=
FI authenticated variable for SB) in order to disable the SB. At the U-Bo=
ot prompt, run the following commands.
+        Occasionally, the USB reset may fail to detect the USB device. I=
t is advisable to rerun the USB reset command.
=20
-On the FVP
+#. Select the first USB device, which should be the USB drive containing=
 the ESP.
=20
-::
+    .. code-block:: console
=20
-  corstone1000# mmc dev 1
-  corstone1000# load mmc 1:1 $loadaddr corstone1000_secureboot_keys/PK_d=
elete.auth && setenv -e -nv -bs -rt -at -i $loadaddr:$filesize PK
-  corstone1000# boot
+        corstone1000# usb dev 0
=20
-On the MPS3 FPGA
+#. Enroll the four UEFI secure boot authenticated variables.
=20
-::
+    .. code-block:: console
=20
-  corstone1000# usb reset
-  corstone1000# usb dev 0
-  corstone1000# load usb 0 $loadaddr corstone1000_secureboot_keys/PK_del=
ete.auth && setenv -e -nv -bs -rt -at -i $loadaddr:$filesize PK
-  corstone1000# boot
+        corstone1000# \
+        load usb 0 $loadaddr corstone1000_secureboot_keys/PK.auth && set=
env -e -nv -bs -rt -at -i $loadaddr:$filesize PK; \
+        load usb 0 $loadaddr corstone1000_secureboot_keys/KEK.auth && se=
tenv -e -nv -bs -rt -at -i $loadaddr:$filesize KEK; \
+        load usb 0 $loadaddr corstone1000_secureboot_keys/db.auth && set=
env -e -nv -bs -rt -at -i $loadaddr:$filesize db; \
+        load usb 0 $loadaddr corstone1000_secureboot_keys/dbx.auth && se=
tenv -e -nv -bs -rt -at -i $loadaddr:$filesize dbx
=20
-The above commands will delete the Platform key (PK) and allow the norma=
l system boot flow without SB.
+#. Attempt to Load the unsigned kernel image.
=20
+    .. code-block:: console
=20
-Testing the External System
----------------------------
-Before testing the external system, please make sure to build the Corsto=
ne-1000 image with external system enabled as mentioned in section `Build=
ing the software stack`_.
+        corstone1000# \
+        load usb 0 $loadaddr corstone1000_secureboot_mps3_images/Image_m=
ps3
+        loadm $loadaddr $kernel_addr_r $filesize
+        bootefi $kernel_addr_r $fdtcontroladdr
=20
-During Linux boot the remoteproc subsystem automatically starts
-the external system.
+        Booting /MemoryMapped(0x0,0x88200000,0x236aa00)
+        Image not authenticated
+        Loading image failed
=20
-The external system can be switched on/off on demand with the following =
commands:
+The unsigned Linux kernel image should not be loaded.
=20
-::
+**************************
+Run Signed Image Boot Test
+**************************
=20
-  echo stop > /sys/class/remoteproc/remoteproc0/state
+FVP
+=3D=3D=3D
=20
-::
+.. important::
=20
-  echo start > /sys/class/remoteproc/remoteproc0/state
+    You must first perform the `Unsigned Image Boot Test <unsigned-image=
-boot-test-fvp_>`__.
=20
+Load the signed kernel image.
=20
-Testing FVP in SMP mode
------------------------
+.. code-block:: console
=20
-Symmetric multiprocessing (SMP) mode is only supported on FVP. It can be=
 enabled by using `corstone1000-fvp-multicore.yml`
+    corstone1000# \
+    load mmc 1:1 $loadaddr corstone1000_secureboot_fvp_images/Image_fvp.=
signed; \
+    loadm $loadaddr $kernel_addr_r $filesize; \
+    bootefi $kernel_addr_r $fdtcontroladdr
=20
-1. Rebuild the platform with SMP mode enabled:
+The signed Linux kernel image should be booted successfully.
=20
-::
+MPS3
+=3D=3D=3D=3D
=20
-  kas build meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml:meta=
-arm/kas/corstone1000-fvp-multicore.yml
+.. important::
=20
-2. Once rebuilt, boot the platform with SMP mode enabled:
+    You must first perform the `Unsigned Image Boot Test <unsigned-image=
-boot-test-mps3_>`__.
=20
-::
+Load the signed kernel image.
=20
-  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml:meta=
-arm/kas/corstone1000-fvp-multicore.yml -c "../meta-arm/scripts/runfvp"
+.. code-block:: console
=20
+    corstone1000# \
+    load usb 0 $loadaddr corstone1000_secureboot_mps3_images/Image_mps3.=
signed; \
+    loadm $loadaddr $kernel_addr_r $filesize; \
+    bootefi $kernel_addr_r $fdtcontroladdr
=20
-3. Validating SMP mode using the nproc command which should return the n=
umber of cores:
+The signed Linux kernel image should be booted successfully.
=20
-::
=20
-  nproc
-  #output: 4
+*******************
+Disable Secure Boot
+*******************
=20
-Testing Secure Debug feature
-----------------------------
+Running the UEFI Secure Boot Test steps stores UEFI authenticated variab=
les in the secure flash.
+As a result, U-Boot reads these variables and verifies the Linux kernel =
image before executing it at each reboot.
=20
-The Corstone-1000 MPS3 based build supports Authenticated Debug Access C=
ontrol (ADAC), using the CoreSight SDC-600 IP. For more information about=
 this, see the following resources:
-`CoreSight SDC-600 <https://developer.arm.com/Processors/CoreSight%20SDC=
-600>`__
-`Authenticated Debug Access Control Specification <https://developer.arm=
.com/documentation/den0101/latest/>`__
-`Arm Corstone-1000 for MPS3 Application Note AN550, Chapter 7 <https://d=
eveloper.arm.com/documentation/dai0550/latest/>`__
+In a typical boot scenario, the Linux kernel image is not signed, which =
will prevent the system from booting due to failed image authentication.
+To resolve this, the Platform Key (one of the UEFI authenticated variabl=
es for secure boot) needs to be deleted.
=20
-The Secure Debug Manager API is implemented in the `secure-debug-manager=
 <https://github.com/ARM-software/secure-debug-manager>`__ repository. Th=
is repository also contains the necessary files for the Arm Development S=
tudio support.
-The build and integration instructions can be found in `its README <http=
s://github.com/ARM-software/secure-debug-manager/blob/master/README.md>`_=
_. The `secure-debug-manager` also contains the private key and chain cer=
tificate to be used during the tests. The private key's public pair is pr=
ovisioned into the OTP in TF-M. These are dummy keys that should not be u=
sed in production.
+#. Perform a cold boot of the MPS3.
=20
-A debug probe (DSTREAM family) and an Arm Development Studio 2022.2 and =
2022.c (or later) are needed to test the Secure Debug feature with the Co=
rstone-1000 MPS3.
+#. On the Host Processor terminal host side, stop the execution of U-Boo=
t when prompted to do so with the message ``Press any key to stop``.
=20
-****************
-Running the test
-****************
+#. On the U-Boot console, delete the Platform Key (PK).
=20
-The debugger host side preparations are not described here, follow `secu=
re-debug-manager` README for that. The Secure Debug feature for Corstone-=
1000 can be enabled by using the `secure-debug.yml` kas configuration fil=
e.
+    - FVP
=20
-1. Build the software stack with Secure Debug enabled. For more informat=
ion see the previous `Building the software stack`_ section:
+        .. code-block:: console
=20
-::
+            corstone1000# \
+            mmc dev 1; \
+            load mmc 1:1 $loadaddr corstone1000_secureboot_keys/PK_delet=
e.auth && setenv -e -nv -bs -rt -at -i $loadaddr:$filesize PK; \
+            boot
=20
-  kas build meta-arm/kas/corstone1000-mps3.yml:meta-arm/ci/debug.yml:met=
a-arm/ci/secure-debug.yml
+    - MPS3
=20
+        .. code-block:: console
=20
-2. Flash the firmware binaries on the FPGA, see `Flash the firmware imag=
e on FPGA`_ section for this.
+            corstone1000# \
+            usb reset; \
+            usb dev 0; \
+            load usb 0 $loadaddr corstone1000_secureboot_keys/PK_delete.=
auth && setenv -e -nv -bs -rt -at -i $loadaddr:$filesize PK; \
+            boot
=20
-3. Run the software on the FPGA, see `Running the software on FPGA`_.
=20
-4. Wait until the Secure Enclave terminal (ttyUSB1) prints the following=
 prompts:
+PSA API
+-------
=20
-::
+The following tests the implementation of the Application Programming In=
terface (API)
+of the Platform Security Architecture (PSA) certification scheme. It use=
s Arm Firmware Framework for Arm A-profile (FF-A)
+to communicate between the normal world and the secure world to run the =
`Arm Platform Security Architecture Test Suite <https://github.com/ARM-so=
ftware/psa-arch-tests>`__.
=20
-  IComPortInit                  :  382 : warn  : init       : IComPortIn=
it: Blocked reading of LPH2RA is active.
-  IComPortInit                  :  383 : warn  : init       : IComPortIn=
it: Blocked reading LPH2RA
+The tests use the `arm_tstee` driver to access Trusted Services Secure P=
artitions from user space. The driver is included in the Linux Kernel, st=
arting from v6.10.
=20
+.. important::
+    Ensure there are no USB drives connected to the board when running t=
he test on the MPS3.
=20
-5. Connect the debug probe to the MPS3 board. Use the 20-pin 1.27mm conn=
ector with the CS_20W_1.27MM silkscreen label.
=20
-6. Create a debug configuration in Arm Development Studio as it is descr=
ibed in `secure-debug-manager README <https://github.com/ARM-software/sec=
ure-debug-manager?tab=3Dreadme-ov-file#arm-development-studio-integration=
>`__.
+The steps below are applicable to both MPS3 and FVP).
=20
-7. Connect to the target, using the debug configuration which was create=
d in the previous step.
+#. Start the Corstone-1000 and wait until it boots to Linux on the Host =
Processor terminal (``ttyUSB2``).
=20
-8. The Arm Development Studio Console will ask for the private key and t=
rust chain certificate. Provide the paths that are located in the `secure=
-debug-manager` repository.
+#. Verify that the `arm_tstee` driver is present.
=20
-::
+    .. code-block:: console
=20
-  ...
+        ls /sys/bus/arm_ffa/drivers | grep arm_tstee
=20
-  Please provide private key file path:
-  Enter file path > <secure-debug-manager repository>\example\data\keys\=
EcdsaP256Key-3.pem
+    ``arm_tstee`` should be printed on the terminal to confirm that the =
driver is present.
=20
-  Please provide trust chain file path:
-  Enter file path > <secure-debug-manager repository>\example\data\chain=
s\chain.EcdsaP256-3
+#. Run the PSA API tests by running the commands below in the order show=
n:
=20
-  ...
+    .. code-block:: console
=20
-9. In case of a successful authentication, the Arm Development Studio wi=
ll connect to the running target and the debug features can be used. The =
following prompt should appear in the Secure Enclave terminal (ttyUSB1):
+        psa-iat-api-test
+        psa-crypto-api-test
+        psa-its-api-test
+        psa-ps-api-test
=20
-::
=20
-  ...
-  boot_platform_init: Corstone-1000 Secure Debug is a success.
-  ...
+External System Processor
+-------------------------
=20
+.. important::
=20
-Tests results
--------------
+    Access to the External System Processor is disabled by default.
+    Ensure you are running a software stack image with access to the Ext=
ernal System Processor enabled following the steps `here <building-the-so=
ftware-stack_>`__.
+
+The Linux operating system running on the Host Processor starts the ``re=
moteproc`` framework to manage the External System Processor.
+
+
+#. Start the External System Processor with the following command:
+
+    .. code-block:: console
+
+        echo stop > /sys/class/remoteproc/remoteproc0/state
+
+#. Stop the External System Processor with the following command:
+
+    .. code-block:: console
+
+        echo start > /sys/class/remoteproc/remoteproc0/state
+
+
+Symmetric Multiprocessing
+-------------------------
+
+.. warning::
+
+    Symmetric multiprocessing (SMP) mode is only supported on FVP but is=
 disabled by default.
+
+
+#. Build the software stack with SMP mode enabled:
+
+    .. code-block:: console
+
+        kas build meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l:meta-arm/kas/corstone1000-fvp-multicore.yml
+
+#. Run the Corstone-1000 FVP:
+
+    .. code-block:: console
+
+        kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l:meta-arm/kas/corstone1000-fvp-multicore.yml \
+        -c "../meta-arm/scripts/runfvp"
+
+
+#. Verify that the FVP is running the Host Processor with more than one =
CPU core:
+
+    .. code-block:: console
+
+        nproc
+        4                  # number of processing units
+
+Secure Debug
+------------
+
+.. warning::
+
+    Secure Debug is only supported on MPS3.
+
+The MPS3 supports Authenticated Debug Access Control (ADAC), using the C=
oreSight SDC-600 IP.
+
+For more information about this, see the following resources:
+
+ - `CoreSight SDC-600 <https://developer.arm.com/Processors/CoreSight%20=
SDC-600>`__
+ - `Authenticated Debug Access Control Specification <https://developer.=
arm.com/documentation/den0101/latest/>`__
+ - `Arm Corstone-1000 for MPS3 Application Note AN550, Chapter 7 <https:=
//developer.arm.com/documentation/dai0550/latest/>`__
+
+The Secure Debug Manager API is implemented in the `secure-debug-manager=
 <https://github.com/ARM-software/secure-debug-manager>`__ repository.
+This repository also contains the necessary files for the Arm Developmen=
t Studio support.
+The build and integration instructions can be found in its `README <secu=
re-debug-manager-repo-readme_>`__.
+
+The `secure-debug-manager` repository also contains the private key and =
chain certificate to be used during the tests.
+The private key's public pair is provisioned into the One-Time Programma=
ble memory in TrustedFirmware-M. These are dummy keys that should not be =
used in production.
+
+A debug probe (DSTREAM family) and an Arm Development Studio 2022.2 and =
2022.c (or later) are needed to test the Secure Debug feature.
+
+
+#. Clone the `secure-debug-manager` repository to your workspace.
+
+    .. code-block:: console
+
+        cd $WORKSPACE
+        git clone https://github.com/ARM-software/secure-debug-manager.g=
it
+
+#. Follow the steps in the `secure-debug-manager`'s `README <secure-debu=
g-manager-repo-readme_>`__ for the development machine setup.
+
+#. Rebuild the software stack with Secure Debug.
+
+    .. code-block:: console
+
+        kas build meta-arm/kas/corstone1000-mps3.yml:meta-arm/ci/debug.y=
ml:meta-arm/ci/secure-debug.yml
+
+#. Flash the firmware image as shown `here <flashing-firmware-images_>`_=
_.
+
+#. Run the software as shown `here <running-software-stack-mps3_>`__.
+
+#. Wait until the Secure Enclave terminal (``ttyUSB1``) prints the follo=
wing prompts:
+
+    .. code-block:: console
+
+        IComPortInit                  :  382 : warn  : init       : ICom=
PortInit: Blocked reading of LPH2RA is active.
+        IComPortInit                  :  383 : warn  : init       : ICom=
PortInit: Blocked reading LPH2RA
+
+
+#. Connect the debug probe to the MPS3 using the 20-pin 1.27mm connector=
 with the ``CS_20W_1.27MM silkscreen`` label.
+
+#. Create a debug configuration in Arm Development Studio as described i=
n the `secure-debug-manager`'s `README <https://github.com/ARM-software/s=
ecure-debug-manager?tab=3Dreadme-ov-file#arm-development-studio-integrati=
on>`__.
+
+#. Connect the debuger to the target using the debug configuration.
+
+#. Provide the paths to the private key and trust chain certificate when=
 asked by Arm Development Studio Console.
+
+    .. code-block:: console
+
+        ...
+
+        Please provide private key file path:
+        Enter file path > $WORKSPACE\secure-debug-manager\example\data\k=
eys\EcdsaP256Key-3.pem
+
+        Please provide trust chain file path:
+        Enter file path > $WORKSPACE\secure-debug-manager\example\data\c=
hains\chain.EcdsaP256-3
+
+        ...
+
+#. When successful authenticated, Arm Development Studio will connect to=
 the running MS3 and the debug features can be used.
+   The following prompt should appear in the Secure Enclave terminal (``=
ttyUSB1``):
+
+    .. code-block:: console
+
+        ...
+        boot_platform_init: Corstone-1000 Secure Debug is a success.
+        ...
+
+
+Reports
+-------
+Various test reports for the `Corstone-1000 software (CORSTONE1000-2024.=
06) <https://git.yoctoproject.org/meta-arm/tag/?h=3DCORSTONE1000-2024.06>=
`__=20
+release version are available for reference `here <https://gitlab.arm.co=
m/arm-reference-solutions/arm-reference-solutions-test-report/-/tree/CORS=
TONE1000-2024.06/embedded-a/corstone1000/CORSTONE1000-2024.06?ref_type=3D=
tags>`__.
=20
-As a reference for the end user, reports for various tests for `Corstone=
-1000 software (CORSTONE1000-2024.06) <https://git.yoctoproject.org/meta-=
arm/tag/?h=3DCORSTONE1000-2024.06>`__
-can be found `here <https://gitlab.arm.com/arm-reference-solutions/arm-r=
eference-solutions-test-report/-/tree/CORSTONE1000-2024.06/embedded-a/cor=
stone1000/CORSTONE1000-2024.06?ref_type=3Dtags>`__.
=20
 --------------
=20
 *Copyright (c) 2022-2024, Arm Limited. All rights reserved.*
=20
 .. _Arm Ecosystem FVPs: https://developer.arm.com/tools-and-software/ope=
n-source-software/arm-platforms-software/arm-ecosystem-fvps
-.. _U-Boot repo: https://github.com/u-boot/u-boot.git
+.. _debian-skip-shim-patch: https://gitlab.arm.com/arm-reference-solutio=
ns/systemready-patch/-/blob/CORSTONE1000-2024.06/embedded-a/corstone1000/=
shim/0001-arm-bsp-u-boot-corstone1000-Skip-the-shim-by-booting.patch
+.. _secure-debug-manager-repo-readme: https://github.com/ARM-software/se=
cure-debug-manager/blob/master/README.md

