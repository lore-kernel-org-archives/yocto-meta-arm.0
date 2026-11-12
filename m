Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1612.1794503669733813250
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Nov 2026 09:14:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=nnA99bO7;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2981153B;
	Thu, 12 Nov 2026 09:14:25 -0800 (PST)
Received: from e142474.cambridge.arm.com (e142474.arm.com [10.2.203.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 396DC3F632;
	Thu, 12 Nov 2026 09:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794503668; bh=F5qsC/4MTziFprhumj2Hzd+7bCz3izA2ufzypOoQxYs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nnA99bO7JNBNPApWsQWMC663uen6ZoKmASg+vCxCJXnYq01Wuljsao66zNmAIlMJI
	 zM3M1z7X6gvWoxAnism9Yr+Makr4ruCdivNRR9e95D6SHS8P66rwKCJV8/LeBaT+AR
	 Jmb7avpuU37h6qjEceDUhQeD/ak8vaHPu+3ErxrI=
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 1/2] arm-bsp/documentation: corstone1000: Update 2026.11 blacksail release documentation
Date: Thu, 12 Nov 2026 17:14:17 +0000
Message-ID: <20261112171420.1135204-2-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112171420.1135204-1-harsimransingh.tungal@arm.com>
References: <20261112171420.1135204-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Thu, 12 Nov 2026 17:14:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7215

Update the Corstone-1000 changelog, release notes, and user guide for
the 2026.11 Blacksail release.

Add the 2026.11 changelog entry, align component and Yocto distribution
version tables with the current release content, and update release tag,
test report, asset branch, recipe version, and Yocto migration guide refe=
rences.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 .../documentation/corstone1000/change-log.rst | 62 +++++++++++++++++
 .../corstone1000/release-notes.rst            |  6 ++
 .../documentation/corstone1000/user-guide.rst | 68 +++++++++++--------
 3 files changed, 107 insertions(+), 29 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/change-log.rst b/met=
a-arm-bsp/documentation/corstone1000/change-log.rst
index 0c79ad1b..fae4d7a4 100644
--- a/meta-arm-bsp/documentation/corstone1000/change-log.rst
+++ b/meta-arm-bsp/documentation/corstone1000/change-log.rst
@@ -10,6 +10,68 @@ Change Log
 This document contains a summary of the new features, changes and
 fixes in each release of Corstone-1000 software stack.
=20
+***************
+Version 2026.11
+***************
+
+Changes
+=3D=3D=3D=3D=3D=3D=3D
+
+- Upgraded key Corstone-1000 components to U-Boot 2026.07, TF-A 2.15.0, =
TF-M 2.3.1, OP-TEE 4.10.0, and Linux 6.19.
+- Updated TF-M to include Corstone-1000 security fixes and the latest fi=
rmware-update partition fixes.
+
+Corstone-1000 components versions
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
++-------------------------------------------+-------------------+
+| linux-yocto                               | 6.19              |
++-------------------------------------------+-------------------+
+| u-boot                                    | 2026.07           |
++-------------------------------------------+-------------------+
+| external-system                           | 0.1.0             |
++-------------------------------------------+-------------------+
+| optee-client                              | 4.10.0            |
++-------------------------------------------+-------------------+
+| optee-os                                  | 4.10.0            |
++-------------------------------------------+-------------------+
+| trusted-firmware-a                        | 2.15.0            |
++-------------------------------------------+-------------------+
+| trusted-firmware-m                        | 2.3.1             |
++-------------------------------------------+-------------------+
+| libts                                     | v1.3.0            |
++-------------------------------------------+-------------------+
+| ts-sp-{se-proxy, smm-gateway}             | v1.3.0            |
++-------------------------------------------+-------------------+
+| ts-psa-{crypto, iat, its. ps}-api-test    | 74dc6646ff        |
++-------------------------------------------+-------------------+
+
+Yocto distribution components versions
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
++-------------------------------------------+----------------+
+| meta-arm                                  | blacksail      |
++-------------------------------------------+----------------+
+| bitbake                                   | 634f8dede6     |
++-------------------------------------------+----------------+
+| meta-openembedded                         | a9d69bc066     |
++-------------------------------------------+----------------+
+| openembedded-core                         | e182a0c4b9     |
++-------------------------------------------+----------------+
+| meta-yocto                                | d0119aa2eb     |
++-------------------------------------------+----------------+
+| meta-secure-core                          | 56316bacdb     |
++-------------------------------------------+----------------+
+| busybox                                   | 1.38.0         |
++-------------------------------------------+----------------+
+| musl                                      | 1.2.6          |
++-------------------------------------------+----------------+
+| gcc-arm-none-eabi                         | 15.3.rel1      |
++-------------------------------------------+----------------+
+| gcc-cross-aarch64                         | 16.2.0         |
++-------------------------------------------+----------------+
+| openssl                                   | 4.0.3          |
++-------------------------------------------+----------------+
+
 ***************
 Version 2026.05
 ***************
diff --git a/meta-arm-bsp/documentation/corstone1000/release-notes.rst b/=
meta-arm-bsp/documentation/corstone1000/release-notes.rst
index 7757e749..c34bea0b 100644
--- a/meta-arm-bsp/documentation/corstone1000/release-notes.rst
+++ b/meta-arm-bsp/documentation/corstone1000/release-notes.rst
@@ -19,6 +19,12 @@ intended for safety-critical applications. Should Your=
 Software or Your Hardware
 prove defective, you assume the entire cost of all necessary servicing, =
repair
 or correction.
=20
+***********************
+Release notes - 2026.11
+***********************
+
+The same notes as the 2025.05 release still apply.
+
 ***********************
 Release notes - 2026.05
 ***********************
diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 56adbf0c..adeda319 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -51,7 +51,7 @@ The Corstone-1000 software stack can be run on:
 Yocto Stable Branch
 -------------------
=20
-Corstone-1000 software stack is built on top of Yocto Project's `Wrynose=
 release <meta-arm-repository-release-branch_>`__.
+Corstone-1000 software stack is built on top of Yocto Project's `Blacksa=
il release <meta-arm-repository-release-branch_>`__.
=20
 Software Components
 -------------------
@@ -173,7 +173,7 @@ Secure Enclave Components
 +----------+------------------------------------------------------------=
-------------------------------------------+
 | bbappend | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/trusted-fi=
rmware-m/trusted-firmware-m_%.bbappend``   |
 +----------+------------------------------------------------------------=
-------------------------------------------+
-| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm/recipes-bsp/trusted-firmwa=
re-m/trusted-firmware-m_2.3.0.bb``         |
+| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm/recipes-bsp/trusted-firmwa=
re-m/trusted-firmware-m_2.3.1.bb``         |
 +----------+------------------------------------------------------------=
-------------------------------------------+
=20
 ************************************
@@ -233,7 +233,7 @@ Build
     .. code-block:: console
=20
         cd ${WORKSPACE}
-        git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1=
000-2026.05
+        git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1=
000-2026.11
=20
 #. Build a Corstone-1000 image:
=20
@@ -322,7 +322,7 @@ Flash
     Using smaller cards or unsupported file systems (e.g., exFAT, NTFS) =
may cause the flashing
     process to fail or the device to become unresponsive.
=20
-#. Download the FPGA bit file image ``AN550: Arm=C2=AE Corstone=E2=84=A2=
-1000 for MPS3 Version 2.0``
+#. Download the FPGA bit file image ``AN550: Arm=C2=AE Corstone=E2=84=A2=
-1000 for MPS3 Version 2.0 r2p0-00rel0``
    on the `Arm Developer website <https://developer.arm.com/tools-and-so=
ftware/development-boards/fpga-prototyping-boards/download-fpga-images>`_=
_.
    Click on the ``Download AN550 bundle`` button and login to download t=
he file.
=20
@@ -544,8 +544,8 @@ Tests
 Reports
 -------
=20
-Reports for the tests conducted on the `Corstone-1000 software (CORSTONE=
1000-2026.05) <https://git.yoctoproject.org/meta-arm/tag/?h=3DCORSTONE100=
0-2026.05>`__
-release are available for reference `here <https://gitlab.arm.com/arm-re=
ference-solutions/arm-reference-solutions-test-report/-/tree/CORSTONE1000=
-2026.05/embedded-a/corstone1000/CORSTONE1000-2026.05?ref_type=3Dtags>`__=
.
+Reports for the tests conducted on the `Corstone-1000 software (CORSTONE=
1000-2026.11) <https://git.yoctoproject.org/meta-arm/tag/?h=3DCORSTONE100=
0-2026.11>`__
+release are available for reference `here <https://gitlab.arm.com/arm-re=
ference-solutions/arm-reference-solutions-test-report/-/tree/CORSTONE1000=
-2026.11/embedded-a/corstone1000/CORSTONE1000-2026.11?ref_type=3Dtags>`__=
.
=20
=20
 .. _clean-secure-flash:
@@ -564,7 +564,7 @@ Clean Secure Flash
     .. code-block:: console
=20
         cd ${WORKSPACE}
-        git clone https://git.gitlab.arm.com/arm-reference-solutions/iot=
-platform-assets.git -b CORSTONE1000-2026.05
+        git clone https://git.gitlab.arm.com/arm-reference-solutions/iot=
-platform-assets.git -b CORSTONE1000-2026.11
=20
 #. Copy the secure flash cleaning Git patch file to your copy of `meta-a=
rm`.
=20
@@ -691,7 +691,7 @@ FVP
 =3D=3D=3D
=20
 The ESP disk image will automatically be used by the Corstone-1000 FVP a=
s the 2nd MMC card image.
-It will be used when the SystemReady-IR tests is performed on the FVP in=
 the later section.
+It will be used when the SystemReady-IR tests are performed on the FVP i=
n the later section.
=20
=20
 ****************************
@@ -749,7 +749,7 @@ The ``BOOT`` partition is also used to store test res=
ults in the ``acs_results``
     Ensure that the ``acs_results`` folder is empty before starting the =
test.
=20
=20
-This sections below describe how to build and run ACS tests on Corstone-=
1000.
+This section below describe how to build and run ACS tests on Corstone-1=
000.
=20
 .. _mps3-instructions-for-acs-image:
=20
@@ -1126,7 +1126,7 @@ Positive Full Capsule Update Test
     The capsule update will be started.
=20
     .. note::
-        The capsule update takes about 8 minutes to complete on MPS3 and=
 between 15-30 minutes on FVP.
+        The capsule update takes about 8 minutes to complete on MPS3 and=
 between 10-15 minutes on FVP.
=20
         The Corstone-1000 will reset after successfully applying the cap=
sule.
=20
@@ -1437,13 +1437,13 @@ The following table shows the details of the firs=
t four ESRT entries for the pos
 +-------------------+-----------------------+-------------+-------------=
---+-------------------------+--------------------------+----------------=
-------------+
 | ``capsule_flags`` | ``fw_class``          | ``fw_type`` | ``fw_version=
`` | ``last_attempt_status`` | ``last_attempt_version`` | ``lowest_suppor=
ted_fw_ver`` |
 +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D+
-| 0                 | ``${BL2_GUID}``       | 0           | 6           =
   | 0                       | 6                        | 0              =
             |
+| 0                 | ``${BL2_GUID}``       | 1           | 6           =
   | 0                       | 6                        | 0              =
             |
 +-------------------+-----------------------+-------------+-------------=
---+-------------------------+--------------------------+----------------=
-------------+
-| 0                 | ``${TFM_S_GUID}``     | 0           | 6           =
   | 0                       | 6                        | 0              =
             |
+| 0                 | ``${TFM_S_GUID}``     | 1           | 6           =
   | 0                       | 6                        | 0              =
             |
 +-------------------+-----------------------+-------------+-------------=
---+-------------------------+--------------------------+----------------=
-------------+
-| 0                 | ``${FIP_GUID}``       | 0           | 6           =
   | 0                       | 6                        | 0              =
             |
+| 0                 | ``${FIP_GUID}``       | 1           | 6           =
   | 0                       | 6                        | 0              =
             |
 +-------------------+-----------------------+-------------+-------------=
---+-------------------------+--------------------------+----------------=
-------------+
-| 0                 | ``${INITRAMFS_GUID}`` | 0           | 6           =
   | 0                       | 6                        | 0              =
             |
+| 0                 | ``${INITRAMFS_GUID}`` | 1           | 6           =
   | 0                       | 6                        | 0              =
             |
 +-------------------+-----------------------+-------------+-------------=
---+-------------------------+--------------------------+----------------=
-------------+
=20
 Positive Partial Capsule Update Test ESRT
@@ -1454,13 +1454,13 @@ The following table shows the details of the firs=
t four ESRT entries for the pos
 +-------------------+-----------------------+-------------+-------------=
---+-------------------------+--------------------------+----------------=
-------------+
 | ``capsule_flags`` | ``fw_class``          | ``fw_type`` | ``fw_version=
`` | ``last_attempt_status`` | ``last_attempt_version`` | ``lowest_suppor=
ted_fw_ver`` |
 +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D+
-| 0                 | ``${BL2_GUID}``       | 0           | 7           =
   | 0                       | 7                        | 0              =
             |
+| 0                 | ``${BL2_GUID}``       | 1           | 7           =
   | 0                       | 7                        | 0              =
             |
 +-------------------+-----------------------+-------------+-------------=
---+-------------------------+--------------------------+----------------=
-------------+
-| 0                 | ``${TFM_S_GUID}``     | 0           | 6           =
   | 0                       | 6                        | 0              =
             |
+| 0                 | ``${TFM_S_GUID}``     | 1           | 6           =
   | 0                       | 6                        | 0              =
             |
 +-------------------+-----------------------+-------------+-------------=
---+-------------------------+--------------------------+----------------=
-------------+
-| 0                 | ``${FIP_GUID}``       | 0           | 6           =
   | 0                       | 6                        | 0              =
             |
+| 0                 | ``${FIP_GUID}``       | 1           | 6           =
   | 0                       | 6                        | 0              =
             |
 +-------------------+-----------------------+-------------+-------------=
---+-------------------------+--------------------------+----------------=
-------------+
-| 0                 | ``${INITRAMFS_GUID}`` | 0           | 6           =
   | 0                       | 6                        | 0              =
             |
+| 0                 | ``${INITRAMFS_GUID}`` | 1           | 6           =
   | 0                       | 6                        | 0              =
             |
 +-------------------+-----------------------+-------------+-------------=
---+-------------------------+--------------------------+----------------=
-------------+
=20
 Rollback Protection Capsule Update Test ESRT
@@ -1471,13 +1471,13 @@ The following table shows the details of the firs=
t four ESRT entries for the rol
 +-------------------+------------------------+-------------+------------=
----+-------------------------+--------------------------+---------------=
--------------+
 | ``capsule_flags`` | ``fw_class``           | ``fw_type`` | ``fw_versio=
n`` | ``last_attempt_status`` | ``last_attempt_version`` | ``lowest_suppo=
rted_fw_ver`` |
 +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D+
-| 0                 | ``${BL2_GUID}``        | 0           | 7          =
    | 1                       | 5                        | 0             =
              |
+| 0                 | ``${BL2_GUID}``        | 1           | 7          =
    | 1                       | 5                        | 0             =
              |
 +-------------------+------------------------+-------------+------------=
----+-------------------------+--------------------------+---------------=
--------------+
-| 0                 | ``${TFM_S_GUID}``      | 0           | 6          =
    | 0                       | 6                        | 0             =
              |
+| 0                 | ``${TFM_S_GUID}``      | 1           | 6          =
    | 0                       | 6                        | 0             =
              |
 +-------------------+------------------------+-------------+------------=
----+-------------------------+--------------------------+---------------=
--------------+
-| 0                 | ``${FIP_GUID}``        | 0           | 6          =
    | 0                       | 6                        | 0             =
              |
+| 0                 | ``${FIP_GUID}``        | 1           | 6          =
    | 0                       | 6                        | 0             =
              |
 +-------------------+------------------------+-------------+------------=
----+-------------------------+--------------------------+---------------=
--------------+
-| 0                 | ``${INITRAMFS_GUID}``  | 0           | 6          =
    | 0                       | 6                        | 0             =
              |
+| 0                 | ``${INITRAMFS_GUID}``  | 1           | 6          =
    | 0                       | 6                        | 0             =
              |
 +-------------------+------------------------+-------------+------------=
----+-------------------------+--------------------------+---------------=
--------------+
=20
 See the `UEFI documentation <https://uefi.org/specs/UEFI/2.10/23_Firmwar=
e_Update_and_Reporting.html#id29>`__ for more information on the signific=
ance of the table fields.
@@ -1486,7 +1486,7 @@ See the `UEFI documentation <https://uefi.org/specs=
/UEFI/2.10/23_Firmware_Update
 Linux Distributions
 -------------------
=20
-This sections describes the steps to install major Linux distributions t=
o the Corstone-1000 Host Processor.
+This section describes the steps to install major Linux distributions to=
 the Corstone-1000 Host Processor.
=20
 The Linux distributions to be installed are:
=20
@@ -1512,7 +1512,7 @@ Follow the instructions below to create the install=
ation media.
    =20
         The location of the ISO file on the development machine will be =
referred to as ``${DISTRO_INSTALLER_ISO_PATH}``.
=20
-#. Create the installation media which will contain the necessary files =
to install the operation system.
+#. Create the installation media which will contain the necessary files =
to install the operating system.
=20
 - **MPS3**:
=20
@@ -1553,7 +1553,7 @@ Corstone-1000 on-board non-volatile storage size is=
 insufficient for installing
         #. Do not yet connect this blank USB drive to the MPS3. It will =
be used as the primary drive to boot the distribution.
=20
     - FVP:
-        #. Create an 10 GB GUID Partition Table (GPT) formatted MultiMed=
iaCard (MMC) image.
+        #. Create a 10 GB GUID Partition Table (GPT) formatted MultiMedi=
aCard (MMC) image.
=20
             .. code-block:: console
=20
@@ -1674,6 +1674,13 @@ Boot Distribution
     #. Once the installation is complete, unplug the installation media.
     #. Perform a cold boot of the MPS3.
=20
+    .. note::
+
+        As a workaround, if U-Boot does not detect the USB drive that co=
ntains
+        the installed operating system, copy the contents of that USB dr=
ive to
+        another supported USB drive that U-Boot can detect, then boot fr=
om the
+        new USB drive.
+
 - FVP
=20
     The target should automatically boot into the installed operating sy=
stem image.
@@ -1788,7 +1795,7 @@ Generate Keys, Signed Image and Unsigned Image
         cd ${WORKSPACE}
=20
         git clone https://gitlab.arm.com/arm-reference-solutions/iot-pla=
tform-assets \
-        -b CORSTONE1000-2026.05
+        -b CORSTONE1000-2026.11
=20
 #. Set the current working directory to build directory's subdirectory c=
ontaining the software stack build images.
=20
@@ -2172,10 +2179,12 @@ For more information about this, see the followin=
g resources:
 #. Enable the built-in PSA-ADAC Secure Debug Manager in the copied datab=
ase.
    In
    ``${CS1000_ADAC_DB}/Boards/Arm_Development_Boards/MPS3_Corstone_1000_=
ADAC_611/project_types.xml``,
-   add the following element alongside the existing ``dtsl_config`` para=
meter:
+   add the ``secure_debug_manager`` element immediately below the existi=
ng
+   ``dtsl_config`` parameter:
=20
     .. code-block:: xml
=20
+        <param default=3D"DtslScript" id=3D"dtsl_config" type=3D"string"=
 visible=3D"false"/>
         <secure_debug_manager type=3D"adac_sdc600" manifest=3D"CDB://../=
../../ATP/manifest.xml" device=3D"CSAPBCOM" reset_type=3D"nSRST"/>
=20
    This selects the built-in PSA-ADAC implementation, its authentication=
-token
@@ -2193,7 +2202,8 @@ For more information about this, see the following =
resources:
    DPv3 is required so that Arm Development Studio uses the ADIv6 debug-=
port
    addressing needed to reach ``CSAPBCOM``.
=20
-   In the same file, give the copied platform a unique title:
+   In the same file, rename the platform to a unique title in the
+   ``<extension name=3D"ds">`` extension block:
=20
     .. code-block:: xml
=20
@@ -2301,7 +2311,7 @@ For more information about this, see the following =
resources:
 *Copyright (c) 2022-2026, Arm Limited. All rights reserved.*
=20
 .. _arm-developer-fvp: https://developer.arm.com/tools-and-software/open=
-source-software/arm-platforms-software/arm-ecosystem-fvps
-.. _meta-arm-repository-release-branch: https://docs.yoctoproject.org/ne=
xt/migration-guides/migration-6.0.html
+.. _meta-arm-repository-release-branch: https://docs.yoctoproject.org/ne=
xt/migration-guides/migration-6.1.html
 .. _arm-ds-website: https://www.arm.com/products/development-tools/embed=
ded-and-software/arm-development-studio
 .. _arm-ulink-pro-d-website: https://www.arm.com/products/development-to=
ols/debug-probes/ulink-pro
 .. _arm-dstream-website: https://www.arm.com/products/development-tools/=
debug-probes/dstream-st
