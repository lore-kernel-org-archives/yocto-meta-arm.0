Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A8BBC25B5C
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 15:59:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19462.1714492779520162668
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 08:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7AAD12F4;
	Tue, 30 Apr 2024 09:00:05 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.32.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B35173F73F;
	Tue, 30 Apr 2024 08:59:37 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH 3/5] arm-bsp/documentation: corstone1000: update capsule generation steps
Date: Tue, 30 Apr 2024 17:59:22 +0200
Message-Id: <20240430155924.799192-4-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240430155924.799192-1-bence.balogh@arm.com>
References: <20240430155924.799192-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 15:59:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5658

From: Bence Balogh <bence.balogh@arm.com>

The .nopt and capsule are generated during the yocto build. Sync the
documentation with the changes.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../documentation/corstone1000/user-guide.rst | 95 ++++++++-----------
 1 file changed, 37 insertions(+), 58 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 073ea213..1a7ce22a 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -692,24 +692,6 @@ incorrect capsule (corrupted or outdated) which fail=
s to boot to the host softwa
 Check the "Run SystemReady-IR ACS tests" section above to download and u=
npack the ACS image file
  - ``ir-acs-live-image-generic-arm64.wic.xz``
=20
-
-Download u-boot under <_workspace> and install tools:
-
-::
-
-  git clone https://github.com/u-boot/u-boot.git
-  cd u-boot
-  git checkout 83aa0ed1e93e1ffac24888d98d37a5b04ed3fb07
-  make tools-only_defconfig
-  make tools-only
-
-**NOTE:** The following error could happen if the linux build system doe=
s not have "libgnutls28-dev".
- **error: "tools/mkeficapsule.c:21:10: fatal error: gnutls/gnutls.h: No =
such file or directory"**. If that's the case please install libgnutls28-=
dev and its dependencies by using the following command.
-
-::
-
-  sudo apt-get install -y libgnutls28-dev
-
 Download systemready-patch repo under <_workspace>:
 ::
=20
@@ -719,51 +701,48 @@ Download systemready-patch repo under <_workspace>:
 Generating Capsules
 *******************
=20
-Generating FPGA Capsules
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+A no-partition image is created during the Yocto build. An update capsul=
e is generated using this ``.nopt`` image.
+This can be found in ``build/tmp_corstone1000-<fvp/mps3>/deploy/images/c=
orstone1000-<fvp/mps3>/corstone1000-<fvp/mps3>_image.nopt``.
+The capsule's default metadata (name, version, etc.) can be found in ``m=
eta-arm/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image=
.bb``
+and ``meta-arm/kas/corstone1000-image-configuration.yml``.
=20
-::
+FPGA Capsules
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-   cd <_workspace>/build/tmp/deploy/images/corstone1000-mps3/
-   sh <_workspace>/systemready-patch/embedded-a/corstone1000/capsule_gen=
/capsule_gen.sh -d mps3
-
-This will generate a file called "corstone1000_image.nopt" which will be=
 used to
-generate a UEFI capsule.
+The generated capsule can be found in ``build/tmp_corstone1000-mps3/depl=
oy/images/corstone1000-mps3/corstone1000-mps3-v6.uefi.capsule``.
+If a new capsule has to be generated with different metadata, then it ca=
n be done by using the ``u-boot-tools`` and the previously
+created ``.nopt`` image.
=20
+For example a capsule for the negative update test scenario, if the host=
's architecture is x86_64:
 ::
=20
    cd <_workspace>
=20
-   ./u-boot/tools/mkeficapsule --monotonic-count 1 --private-key build/t=
mp/deploy/images/corstone1000-mps3/corstone1000_capsule_key.key \
+   ./build/tmp/sysroots-components/x86_64/u-boot-tools-native/usr/bin/mk=
eficapsule --monotonic-count 1 \
+   --private-key build/tmp/deploy/images/corstone1000-mps3/corstone1000_=
capsule_key.key \
    --certificate build/tmp/deploy/images/corstone1000-mps3/corstone1000_=
capsule_cert.crt --index 1 --guid df1865d1-90fb-4d59-9c38-c9f2c1bba8cc \
-   --fw-version 6 build/tmp/deploy/images/corstone1000-mps3/corstone1000=
_image.nopt cs1k_cap_mps3_v6
+   --fw-version 5 build/tmp_corstone1000-mps3/deploy/images/corstone1000=
-mps3/corstone1000-mps3_image.nopt corstone1000-mps3-v5.uefi.capsule
=20
-   ./u-boot/tools/mkeficapsule --monotonic-count 1 --private-key build/t=
mp/deploy/images/corstone1000-mps3/corstone1000_capsule_key.key \
-   --certificate build/tmp/deploy/images/corstone1000-mps3/corstone1000_=
capsule_cert.crt --index 1 --guid df1865d1-90fb-4d59-9c38-c9f2c1bba8cc \
-   --fw-version 5 build/tmp/deploy/images/corstone1000-mps3/corstone1000=
_image.nopt cs1k_cap_mps3_v5
+This command will put the newly generated capsule to the ``<_workspace>`=
` directory.
=20
 Generating FVP Capsules
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-::
-
-   cd <_workspace>/build/tmp/deploy/images/corstone1000-fvp/
-   sh <_workspace>/systemready-patch/embedded-a/corstone1000/capsule_gen=
/capsule_gen.sh -d fvp
-
-This will generate a file called "corstone1000_image.nopt" which will be=
 used to
-generate a UEFI capsule.
+The generated capsule can be found in ``build/tmp_corstone1000-fvp/deplo=
y/images/corstone1000-fvp/corstone1000-fvp-v6.uefi.capsule``.
+If a new capsule has to be generated with different metadata, then it ca=
n be done by using the ``u-boot-tools`` and the previously
+created ``.nopt`` image.
=20
+For example a capsule for the negative update test scenario, if the host=
's architecture is x86_64:
 ::
=20
    cd <_workspace>
-   ./u-boot/tools/mkeficapsule --monotonic-count 1 --private-key build/t=
mp/deploy/images/corstone1000-fvp/corstone1000_capsule_key.key \
-   --certificate build/tmp/deploy/images/corstone1000-fvp/corstone1000_c=
apsule_cert.crt --index 1 --guid 989f3a4e-46e0-4cd0-9877-a25c70c01329 \
-   --fw-version 6 build/tmp/deploy/images/corstone1000-fvp/corstone1000_=
image.nopt cs1k_cap_fvp_v6
=20
-   ./u-boot/tools/mkeficapsule --monotonic-count 1 --private-key build/t=
mp/deploy/images/corstone1000-fvp/corstone1000_capsule_key.key \
+   ./build/tmp/sysroots-components/x86_64/u-boot-tools-native/usr/bin/mk=
eficapsule --monotonic-count 1 \
+   --private-key build/tmp/deploy/images/corstone1000-fvp/corstone1000_c=
apsule_key.key \
    --certificate build/tmp/deploy/images/corstone1000-fvp/corstone1000_c=
apsule_cert.crt --index 1 --guid 989f3a4e-46e0-4cd0-9877-a25c70c01329 \
-   --fw-version 5 build/tmp/deploy/images/corstone1000-fvp/corstone1000_=
image.nopt cs1k_cap_fvp_v5
+   --fw-version 5 build/tmp_corstone1000-fvp/deploy/images/corstone1000-=
fvp/corstone1000-fvp_image.nopt corstone1000-fvp-v5.uefi.capsule
=20
+This command will put the newly generated capsule to the ``<_workspace>`=
` directory.
=20
 Common Notes for FVP and FPGA
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
@@ -782,15 +761,15 @@ Copying the FPGA capsules
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
=20
 The user should prepare a USB stick as explained in ACS image section `F=
PGA instructions for ACS image`_.
-Place the generated ``cs1k_cap`` files in the root directory of the boot=
 partition
-in the USB stick. Note: As we are running the direct method, the ``cs1k_=
cap`` file
+Place the generated ``corstone1000-mps3-v<5/6>.uefi.capsule`` files in t=
he root directory of the boot partition
+in the USB stick. Note: As we are running the direct method, the ``corst=
one1000-mps3-v<5/6>.uefi.capsule`` files
 should not be under the EFI/UpdateCapsule directory as this may or may n=
ot trigger
 the on disk method.
=20
 ::
=20
-   sudo cp cs1k_cap_mps3_v6 <mounting path>/BOOT/
-   sudo cp cs1k_cap_mps3_v5 <mounting path>/BOOT/
+   sudo cp <capsule path>/corstone1000-mps3-v6.uefi.capsule <mounting pa=
th>/BOOT/
+   sudo cp <capsule path>/corstone1000-mps3-v5.uefi.capsule <mounting pa=
th>/BOOT/
    sync
=20
 Copying the FVP capsules
@@ -807,8 +786,8 @@ Then, copy the capsules:
=20
 ::
=20
-   sudo cp cs1k_cap_fvp_v6 /mnt/test/
-   sudo cp cs1k_cap_fvp_v5 /mnt/test/
+   sudo cp <capsule path>/corstone1000-fvp-v6.uefi.capsule /mnt/test/
+   sudo cp <capsule path>/corstone1000-fvp-v5.uefi.capsule /mnt/test/
    sync
=20
 Then, unmount the IR image:
@@ -823,8 +802,13 @@ Then, unmount the IR image:
 Performing the capsule update
 ******************************
=20
-During this section we will be using the capsule with the higher version=
 (cs1k_cap_<fvp/mps3>_v6) for the positive scenario
-and the capsule with the lower version (cs1k_cap_<fvp/mps3>_v5) for the =
negative scenario.
+During this section we will be using the capsule with the higher version=
 (``corstone1000-<fvp/mps3>-v6.uefi.capsule``) for the positive scenario
+and the capsule with the lower version (``corstone1000-<fvp/mps3>-v5.uef=
i.capsule``) for the negative scenario.
+
+Running the FPGA with the IR prebuilt image
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Insert the prepared USB stick then Power cycle the MPS3 board.
=20
 Running the FVP with the IR prebuilt image
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -837,11 +821,6 @@ Run the FVP with the IR prebuilt image:
=20
 **NOTE:** <path-to-img> must start from the root directory. make sure th=
ere are no spaces before or after of "=3D". board.msd_mmc.p_mmc_file=3D<p=
ath-to-img>/ir-acs-live-image-generic-arm64.wic.
=20
-Running the FPGA with the IR prebuilt image
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Insert the prepared USB stick then Power cycle the MPS3 board.
-
 Executing capsule update for FVP and FPGA
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
@@ -861,7 +840,7 @@ In case of the positive scenario run the update with =
the higher version capsule
=20
 ::
=20
-  EFI/BOOT/app/CapsuleApp.efi cs1k_cap_<fvp/mps3>_v6
+  EFI/BOOT/app/CapsuleApp.efi corstone1000-<fvp/mps3>-v6.uefi.capsule
=20
 After successfully updating the capsule the system will reset.
=20
@@ -869,7 +848,7 @@ In case of the negative scenario run the update with =
the lower version capsule a
=20
 ::
=20
-  EFI/BOOT/app/CapsuleApp.efi cs1k_cap_<fvp/mps3>_v5
+  EFI/BOOT/app/CapsuleApp.efi corstone1000-<fvp/mps3>-v5.uefi.capsule
=20
 The command above should fail and in the TF-M logs the following message=
 should appear:
=20
--=20
2.25.1


