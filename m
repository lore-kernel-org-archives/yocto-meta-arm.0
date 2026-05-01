Return-Path: <alex.chapman@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A26A5CD3424
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 13:30:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14441.1777642250587283652
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 May 2026 06:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=JRa1kKhX;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: alex.chapman@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFD56176A;
	Fri,  1 May 2026 06:30:44 -0700 (PDT)
Received: from e142473.cambridge.arm.com (e142473.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DC713FAF5;
	Fri,  1 May 2026 06:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777642250; bh=lqeL5v4PSz30/kqD9ePM/JtPbGsqstBjGYxcSPY2Wio=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JRa1kKhXU71Gp2P1IurbjGROuCuQBRlnLUuoo2dKp4/hQdPkDa8IPHWktTzBpuCnU
	 8MmiRrvaqME+Zfpc/8f5/gjRtDAuKtRjhvgjY9KZd+nfctxpR/+sXWc0vclaEAM4QJ
	 ZYKJV+Eqqp3PDtG+empLiKeyE7hjddkcdnckoV7o=
From: Alex Chapman <alex.chapman@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Alex Chapman <alex.chapman@arm.com>
Subject: [PATCH 2/2] arm-bsp/docs:corstone1000: Reduce sudo dependency in OOB tests
Date: Fri,  1 May 2026 14:30:17 +0100
Message-ID: <20260501133017.2820317-3-alex.chapman@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260501133017.2820317-1-alex.chapman@arm.com>
References: <20260501133017.2820317-1-alex.chapman@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 01 May 2026 13:30:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7032

- Add `wic`` image manipulation requirement, `mtools`, to prerequisites
- switch the `kas` install step to a user-local virtual environment
  removing `sudo` requirement
- Add `wic` install step
- replaced the mount/unmount acs_results and capsule staging steps
  with non-`sudo` wic-based image manipulation.
- Adds guidance for using serial-console without `sudo`
- Standardise capsule transfer to the root of the BOOT partition
- Update docs to align with new non-`sudo` requirement for
  `create_keys_and_sign.sh` interactive script.

These updates remove several unnecessary `sudo`` dependencies when
running OOB CS1K testing.
---
 .../documentation/corstone1000/user-guide.rst | 126 ++++++++----------
 1 file changed, 58 insertions(+), 68 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 5bade38e..03038942 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -28,6 +28,7 @@ The following prerequisites must be available on the ho=
st system:
 - GNU Tar 1.34 or greater.
 - GNU Compiler Collection 12.2 or greater.
 - GNU Make 4.3 or greater.
+- mtools 4.0 or greater.
 - tmux 3.3 or greater.
=20
 Please follow the steps described in the Yocto mega manual:
@@ -210,13 +211,22 @@ Build
         mkdir ${WORKSPACE}
         cd ${WORKSPACE}
=20
-#. Install kas version 4.4 with ``sudo`` rights.
+#. Create a Python virtual environment and activate it.
=20
     .. code-block:: console
=20
-        sudo pip3 install kas=3D=3D4.4
+        python3 -m venv ${WORKSPACE}/venv_cs1k
+        source ${WORKSPACE}/venv_cs1k/bin/activate
=20
-    Ensure the kas installation directory is visible on the ``$PATH`` en=
vironment variable.
+#. Install ``kas`` and ``wic`` inside the virtual environment.
+
+    .. code-block:: console
+
+        python3 -m pip install kas=3D=3D5.1 "git+https://git.yoctoprojec=
t.org/wic@v0.3.0"
+
+    .. note::
+
+        Ensure the kas and wic installation directory is visible on the =
``$PATH`` environment variable.
=20
 #. Clone the `meta-arm` Yocto layer in the workspace ``${WORKSPACE}``.
=20
@@ -425,6 +435,10 @@ MPS3
=20
         sudo picocom -b 115200 /dev/ttyUSB3
=20
+    .. note::
+
+        If the user is a member of the ``dialout`` group, ``sudo`` is no=
t required for this step.
+
     .. important::
         Plug a connected Ethernet cable to the MPS3 or it will
         wait for a network connection for a considerable amount of time,=
 printing the following
@@ -851,14 +865,15 @@ The results can be fetched from the `acs_results` f=
older in the ``BOOT`` partiti
=20
 .. note::
=20
-    Access the `acs_results` folder in FVP by running the following comm=
ands:
+    Access the `acs_results` folder in FVP by copying it from the same A=
CS image that was used to boot the FVP.
+    The following command copies the ``acs_results`` directory from the =
ACS image to
+    ``${WORKSPACE}/acs_results`` on the host development machine.
=20
     .. code-block:: console
=20
-        sudo mkdir /mnt/test
-        sudo mount -o rw,offset=3D1048576 \
-        ${WORKSPACE}/arm-systemready/IR/prebuilt_images/v23.09_2.1.0/ir-=
acs-live-image-generic-arm64.wic \
-        /mnt/test
+        cd ${WORKSPACE}
+        wic cp ${WORKSPACE}/arm-systemready/IR/prebuilt_images/v23.09_2.=
1.0/ir-acs-live-image-generic-arm64.wic:1/acs_results \
+          ${WORKSPACE}
=20
 #####################################################
=20
@@ -1061,76 +1076,48 @@ Transfer Capsules to Target
 The capsule delivery process described below is the direct method (usage=
 of capsules from the ACS image)
 as opposed to the on-disk method (delivery of capsules using a file on a=
 mass storage device).
=20
-MPS3
-=3D=3D=3D=3D
-
-#. Prepare a USB drive as explained in `this <mps3-instructions-for-acs-=
image_>`_ section.
-
-#. Copy the capsule file to the root directory of the ``BOOT`` partition=
 in the USB drive.
-
-  .. code-block:: console
-
-    cp ${WORKSPACE}/build/tmp/deploy/images/corstone1000-mps3/corstone10=
00-mps3-v6.uefi.capsule /dev/sdc/BOOT/
-    cp ${WORKSPACE}/corstone1000-mps3-v5.uefi.capsule /dev/sdc/EFI/BOOT/
-    cp ${WORKSPACE}/corstone1000-mps3-partial-v7.uefi.capsule /dev/sdc/E=
FI/BOOT/
-    sync
-
 .. note::
=20
-    ``/dev/sdc`` is the assumed path for the ACS Image USB drive.
-    Replace it with the actual device path as enumerated on your develop=
ment machine.
-
-
-.. important::
-
-    The direct Capsule Update method requires that the capsule files not=
 be placed in the ``EFI/UpdateCapsule`` directory,
-    as doing so might inadvertently trigger the on-disk update method.
-
-FVP
-=3D=3D=3D
+    The staging steps below are shared between ``mps3`` and ``fvp``.
=20
 #. Download and extract the ACS image `as described for the MPS3 <mps3-i=
nstructions-for-acs-image_>`_.
    The ACS image extraction location will be referred below as ``${ACS_I=
MAGE_PATH}``.
=20
-    .. note::
-
-      Creating a USB drive with the ACS image is not required as the ima=
ge will be mounted with the steps below.
+#. Copy the ACS image to the workspace root directory and rename it to
+   ``ir-acs-live-image-generic-arm64-staged.wic``. The staged image will=
 then be
+   populated with the capsule files.
=20
-#. Find the first partition's offset of the ``ir-acs-live-image-generic-=
arm64.wic`` image using the ``fdisk`` tool.
-   The partition table can be listed using:
+    ``${ACS_STAGED_IMAGE}`` refers to
+    ``${WORKSPACE}/ir-acs-live-image-generic-arm64-staged.wic``.
=20
     .. code-block:: console
=20
-        fdisk -lu ${ACS_IMAGE_PATH}/ir-acs-live-image-generic-arm64.wic
-        Device                                                 Start    =
 End Sectors  Size Type
-        ${ACS_IMAGE_PATH}/ir-acs-live-image-generic-arm64.wic1    2048  =
309247  307200  150M Microsoft basic data
-        ${ACS_IMAGE_PATH}/ir-acs-live-image-generic-arm64.wic2  309248 1=
343339 1034092  505M Linux filesystem
-
-
-    Given that the first partition starts at sector 2048 and each sector=
 is 512 bytes in size,
-    the first partition is at offset 1048576 (2048 x 512).
+        cp ${ACS_IMAGE_PATH}/ir-acs-live-image-generic-arm64.wic \
+          ${ACS_STAGED_IMAGE}
=20
-#. Mount the ``ir-acs-live-image-generic-arm64.wic`` image using the pre=
viously calculated offset:
+#. Copy the capsules to the staged ACS image:
=20
     .. code-block:: console
=20
-        sudo mkdir /mnt/ir-acs-live-image-generic-arm64
-        sudo mount -o rw,offset=3D<first_partition_offset> ${ACS_IMAGE_P=
ATH}/ir-acs-live-image-generic-arm64.wic  /mnt/ir-acs-live-image-generic-=
arm64
-
-#. Copy the capsules:
-
-    .. code-block:: console
+        cd ${WORKSPACE}
+        wic cp ${WORKSPACE}/build/tmp/deploy/images/corstone1000-${TARGE=
T}/corstone1000-${TARGET}-v6.uefi.capsule \
+          ${ACS_STAGED_IMAGE}:1/corstone1000-${TARGET}-v6.uefi.capsule
+        wic cp ${WORKSPACE}/corstone1000-${TARGET}-v5.uefi.capsule \
+          ${ACS_STAGED_IMAGE}:1/corstone1000-${TARGET}-v5.uefi.capsule
+        wic cp ${WORKSPACE}/corstone1000-${TARGET}-partial-v7.uefi.capsu=
le \
+          ${ACS_STAGED_IMAGE}:1/corstone1000-${TARGET}-partial-v7.uefi.c=
apsule
=20
-        sudo cp ${WORKSPACE}/build/tmp/deploy/images/corstone1000-fvp/co=
rstone1000-fvp-v6.uefi.capsule /mnt/ir-acs-live-image-generic-arm64/
-        sudo cp ${WORKSPACE}/corstone1000-fvp-v5.uefi.capsule /mnt/ir-ac=
s-live-image-generic-arm64/
-        sudo cp ${WORKSPACE}/corstone1000-fvp-partial-v7.uefi.capsule /m=
nt/ir-acs-live-image-generic-arm64/
-        sync
+.. important::
=20
-#. Unmount the IR image:
+    The direct Capsule Update method requires that the capsule files not=
 be placed in the ``EFI/UpdateCapsule`` directory,
+    as doing so might inadvertently trigger the on-disk update method.
=20
-    .. code-block:: console
+MPS3
+=3D=3D=3D
=20
-        sudo umount /mnt/ir-acs-live-image-generic-arm64
+#. Write ``${ACS_STAGED_IMAGE}`` to the ACS USB drive by following the
+   `MPS3 ACS image steps <mps3-instructions-for-acs-image_>`_ and replac=
ing
+   ``ir-acs-live-image-generic-arm64.wic`` with ``${ACS_STAGED_IMAGE}``.
=20
 ************************
 Run Capsule Update Tests
@@ -1169,13 +1156,14 @@ Positive Full Capsule Update Test
=20
       .. code-block:: console
=20
+        cd ${WORKSPACE}
         kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l \
         -c "../meta-arm/scripts/runfvp --terminals=3Dtmux \
-        -- -C board.msd_mmc.p_mmc_file=3D${ACS_IMAGE_PATH}/ir-acs-live-i=
mage-generic-arm64.wic"
+        -- -C board.msd_mmc.p_mmc_file=3D${ACS_STAGED_IMAGE}"
=20
       .. warning::
=20
-          ``${ACS_IMAGE_PATH}`` must be an absolute path. Ensure there a=
re no spaces before or after of ``=3D`` of the ``-C board.msd_mmc.p_mmc_f=
ile`` option.
+          ``${ACS_STAGED_IMAGE}`` must be an absolute path. Ensure there=
 are no spaces before or after of ``=3D`` of the ``-C board.msd_mmc.p_mmc=
_file`` option.
=20
=20
 #. Wait until U-Boot loads EFI from the ACS image and interrupt the EFI =
shell by pressing the ``Escape`` key when the following prompt is display=
ed on the Host Processor terminal (``ttyUSB2`` for MPS3).
@@ -1196,7 +1184,7 @@ Positive Full Capsule Update Test
=20
         .. code-block:: console
=20
-            EFI/BOOT/app/CapsuleApp.efi EFI/BOOT/corstone1000-mps3-v6.ue=
fi.capsule
+            EFI/BOOT/app/CapsuleApp.efi corstone1000-mps3-v6.uefi.capsul=
e
=20
     - FVP:
=20
@@ -1340,7 +1328,7 @@ Rollback Protection Capsule Update Test
=20
         .. code-block:: console
=20
-            EFI/BOOT/app/CapsuleApp.efi EFI/BOOT/corstone1000-mps3-v5.ue=
fi.capsule
+            EFI/BOOT/app/CapsuleApp.efi corstone1000-mps3-v5.uefi.capsul=
e
=20
     - FVP:
=20
@@ -1656,6 +1644,10 @@ MPS3
=20
         sudo picocom -b 115200 /dev/ttyUSB2
=20
+    .. note::
+
+        If the user is a member of the ``dialout`` group, ``sudo`` is no=
t required for this step.
+
 #. When the installation screen is displayed on ``ttyUSB2``, plug in the=
 (still empty) system drive to the MPS3.
 #. Start the distribution installation process.
=20
@@ -1873,19 +1865,17 @@ Generate Keys, Signed Image and Unsigned Image
=20
         The `efitools <https://github.com/vathpela/efitools/>`__  packag=
e is required to execute the script.
=20
+        The ``mtools`` package is required on the host development machi=
ne to execute the script.
+
         ``${CERTIFICATE_VALIDITY_DURATION_IN_DAYS}`` is an integer that =
specifies the certificate's validity period in days.
=20
     .. note::
=20
         Consult the image signing script help message (``-h``) for more =
information about other optional arguments.
=20
-        The script is interactive and contains commands that require ``s=
udo`` level permissions.
-
-
 The keys, signed kernel image, and unsigned kernel image will be copied =
to the exisiting ESP image.
 The modified ESP image can be found at ``${WORKSPACE}/build/tmp/deploy/i=
mages/corstone1000-${TARGET}/corstone1000-esp-image-corstone1000-${TARGET=
}.wic``.
=20
-
 ****************************
 Run Unsigned Image Boot Test
 ****************************

