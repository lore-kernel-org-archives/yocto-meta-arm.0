Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1632.1794503670394174491
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Nov 2026 09:14:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=SDjXEj7W;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF5DF1576;
	Thu, 12 Nov 2026 09:14:26 -0800 (PST)
Received: from e142474.cambridge.arm.com (e142474.arm.com [10.2.203.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 347EA3F632;
	Thu, 12 Nov 2026 09:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794503669; bh=HllJs5lWouOHNVIOCeTLHeUVMQgCqjYdtOzlcvU6ASE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SDjXEj7WxrsN7dkm5Gqlt32hpHXpZ8jwpvJkIfWIBs7+wTwFLtlppjQlZ0SbV9C/Z
	 BYV6dJzzyrwKey/n7x+qmkdnpOt7hSQB3BHlbqZhTYudxpX7OQnXKvXBpvyx9tQ6mH
	 LuH2XqsbUrYRHGOqK2lbKsQcWn3gMdkAuBVOCjDY=
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 2/2] arm-bsp/documentation: corstone1000-a320: Update 2026.11 blacksail release documentation
Date: Thu, 12 Nov 2026 17:14:18 +0000
Message-ID: <20261112171420.1135204-3-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112171420.1135204-1-harsimransingh.tungal@arm.com>
References: <20261112171420.1135204-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Thu, 12 Nov 2026 17:14:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7216
Content-Type: text/plain; charset="utf-8"

Update the Corstone-1000 with Cortex-A320 changelog, release notes,
user guide, tests documentation, and metadata for the 2026.11 release.

Add the 2026.11 changelog entry, align component and Yocto distribution
version tables with the Blacksail release content, update release tag and
test report references, and refresh the Yocto migration guide metadata li=
nk.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 .../corstone-a320_metadata.yaml               | 10 +--
 .../corstone1000-a320/topics/change-log.md    | 67 +++++++++++++++
 .../corstone1000-a320/topics/release-notes.md |  9 +++
 .../corstone1000-a320/topics/tests.md         | 81 ++++++++++---------
 .../corstone1000-a320/topics/user-guide.md    |  6 +-
 5 files changed, 125 insertions(+), 48 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000-a320/corstone-a320_m=
etadata.yaml b/meta-arm-bsp/documentation/corstone1000-a320/corstone-a320=
_metadata.yaml
index 11f31235..d956c799 100644
--- a/meta-arm-bsp/documentation/corstone1000-a320/corstone-a320_metadata=
.yaml
+++ b/meta-arm-bsp/documentation/corstone1000-a320/corstone-a320_metadata=
.yaml
@@ -10,8 +10,8 @@ product: Corstone-1000 with Cortex-A320
 product_type: Open Source Projects
 product_revision:
   - prefix: Version
-    version: "0101"
-    version_label: "2026.02"
+    version: "0102"
+    version_label: "2026.11"
 output_type: "software"
 conformance_notice: "true"
 content_type: User Guide
@@ -24,8 +24,8 @@ themes:
 intended_audience: Software Developers
 terminology_review: new
 releases:
- - revision: 0100-01
-   date: 2026-05-01
+ - revision: 0102-01
+   date: 2026-11-09
    change_summary: Update
    permissions: nonconfidential
=20
@@ -97,7 +97,7 @@ variables:
 - name: secure_debug_manager_armds_integration
   value: 'https://github.com/ARM-software/secure-debug-manager?tab=3Drea=
dme-ov-file#arm-development-studio-integration'
 - name: meta_arm_repository_release_branch
-  value: 'https://docs.yoctoproject.org/next/migration-guides/migration-=
6.0.html'
+  value: 'https://docs.yoctoproject.org/next/migration-guides/migration-=
6.1.html'
 - name: arm_ulink_pro_website
   value: 'https://www.arm.com/products/development-tools/debug-probes/ul=
ink-pro'
 - name: arm_ds_website
diff --git a/meta-arm-bsp/documentation/corstone1000-a320/topics/change-l=
og.md b/meta-arm-bsp/documentation/corstone1000-a320/topics/change-log.md
index 02f9629e..f4649083 100644
--- a/meta-arm-bsp/documentation/corstone1000-a320/topics/change-log.md
+++ b/meta-arm-bsp/documentation/corstone1000-a320/topics/change-log.md
@@ -2,6 +2,73 @@
=20
 This document contains a summary of the new features, changes and fixes =
in each release of the Corstone-1000 with Cortex-A320 software stack.
=20
+## Version 2026.11 {.reference}
+
+The following changes are present in this release:
+
+- Continued Corstone-1000 with Cortex-A320 enablement with U-Boot 2026.0=
7, TF-A 2.15.0, TF-M 2.3.1, OP-TEE 4.10.0, Trusted Services 1.3.0, and Li=
nux 6.19.
+- Updated TF-M to include Corstone-1000 security fixes and the latest fi=
rmware-update partition fixes.
+
+### Corstone-1000 with Cortex-A320 components versions {.reference}
+
+The following component versions are available:
+
+Table: Corstone-1000 with Cortex-A320 component versions
+
++----------------------------------------+------------------------------=
-----+
+| Component                              | Version                      =
     |
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D+
+| linux-yocto                            | 6.19                         =
     |
++----------------------------------------+------------------------------=
-----+
+| u-boot                                 | 2026.07                      =
     |
++----------------------------------------+------------------------------=
-----+
+| optee-client                           | 4.10.0                       =
     |
++----------------------------------------+------------------------------=
-----+
+| optee-os                               | 4.10.0                       =
     |
++----------------------------------------+------------------------------=
-----+
+| trusted-firmware-a                     | 2.15.0                       =
     |
++----------------------------------------+------------------------------=
-----+
+| trusted-firmware-m                     | 2.3.1                        =
     |
++----------------------------------------+------------------------------=
-----+
+| libts                                  | v1.3.0                       =
     |
++----------------------------------------+------------------------------=
-----+
+| ts-sp-{se-proxy, smm-gateway}          | v1.3.0                       =
     |
++----------------------------------------+------------------------------=
-----+
+| ts-psa-{crypto, iat, its. ps}-api-test | 74dc6646ff                   =
     |
++----------------------------------------+------------------------------=
-----+
+
+### Yocto distribution components versions {.reference}
+
+The following Yocto distribution components versions are available:
+
+Table: Yocto distribution component versions
+
++-------------------+------------+
+| Component         | Version    |
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D+
+| meta-arm          | blacksail  |
++-------------------+------------+
+| bitbake           | 634f8dede6 |
++-------------------+------------+
+| meta-openembedded | a9d69bc066 |
++-------------------+------------+
+| openembedded-core | e182a0c4b9 |
++-------------------+------------+
+| meta-yocto        | d0119aa2eb |
++-------------------+------------+
+| meta-secure-core  | 56316bacdb |
++-------------------+------------+
+| busybox           | 1.38.0     |
++-------------------+------------+
+| musl              | 1.2.6      |
++-------------------+------------+
+| gcc-arm-none-eabi | 15.3.rel1  |
++-------------------+------------+
+| gcc-cross-aarch64 | 16.2.0     |
++-------------------+------------+
+| openssl           | 4.0.3      |
++-------------------+------------+
+
 ## Version 2026.05 {.reference}
=20
 The following changes are present in this release:
diff --git a/meta-arm-bsp/documentation/corstone1000-a320/topics/release-=
notes.md b/meta-arm-bsp/documentation/corstone1000-a320/topics/release-no=
tes.md
index 5c95fae0..bba86d4c 100644
--- a/meta-arm-bsp/documentation/corstone1000-a320/topics/release-notes.m=
d
+++ b/meta-arm-bsp/documentation/corstone1000-a320/topics/release-notes.m=
d
@@ -7,6 +7,15 @@ intended for safety-critical applications. Should your s=
oftware or hardware
 prove defective, you assume the entire cost of all necessary servicing, =
repair
 or correction.
=20
+## Release notes - 2026.11 {.reference}
+
+The following knowns issues and limitations are present in this release:
+
+- Crypto isolation is not supported in the Secure world of Corstone-1000=
 with Cortex-A320. Additionally, clients in
+  the Normal world are not isolated from one another. Therefore, if an e=
nd user wants to add a new
+  Secure Partition (SP) (such as a software TPM) that accesses the Crypt=
o service via the SE-Proxy,
+  they are responsible for implementing their own isolation mechanisms t=
o ensure proper security boundaries.
+
 ## Release notes - 2026.05 {.reference}
=20
 The following knowns issues and limitations are present in this release:
diff --git a/meta-arm-bsp/documentation/corstone1000-a320/topics/tests.md=
 b/meta-arm-bsp/documentation/corstone1000-a320/topics/tests.md
index c22ff6db..9bb6a885 100644
--- a/meta-arm-bsp/documentation/corstone1000-a320/topics/tests.md
+++ b/meta-arm-bsp/documentation/corstone1000-a320/topics/tests.md
@@ -4,7 +4,7 @@ All the tests in this chapter assume you have already bui=
lt the software stack a
=20
 ## Reports {.reference}
=20
-Reports for the tests conducted on the [Corstone-1000 software (CORSTONE=
1000-2026.05)](https://git.yoctoproject.org/meta-arm/tag/?h=3DCORSTONE100=
0-2026.05) release are available for reference in the [GitLab repo](https=
://gitlab.arm.com/arm-reference-solutions/arm-reference-solutions-test-re=
port/-/tree/CORSTONE1000-2026.05/embedded-a/corstone1000/CORSTONE1000-202=
6.05?ref_type=3Dtags).
+Reports for the tests conducted on the [Corstone-1000 software (CORSTONE=
1000-2026.11)](https://git.yoctoproject.org/meta-arm/tag/?h=3DCORSTONE100=
0-2026.11) release are available for reference in the [GitLab repo](https=
://gitlab.arm.com/arm-reference-solutions/arm-reference-solutions-test-re=
port/-/tree/CORSTONE1000-2026.11/embedded-a/corstone1000/CORSTONE1000-202=
6.11?ref_type=3Dtags).
=20
 ## SystemReady IR {.reference}
=20
@@ -29,8 +29,8 @@ A storage with EFI System Partition (ESP) must exist in=
 the system for the UEFI-
=20
 ### Use the EFI system partition {.reference}
=20
-The ESP disk image will automatically be used by the Corstone-1000 FVP a=
s the 2nd MMC card image.
-It will be used when the SystemReady-IR tests is performed on the FVP in=
 the later section.
+The ESP disk image will automatically be used by the Corstone-1000 with =
Cortex-A320 FVP as the 2nd MMC card image.
+It will be used when the SystemReady-IR tests are performed on the FVP i=
n the later section.
=20
 ### Run SystemReady IR ACS tests {.reference}
=20
@@ -85,7 +85,7 @@ The `BOOT` partition is also used to store test results=
 in the `acs_results` fol
 Ensure that the `acs_results` folder is empty before starting the test.
 :::
=20
-To build and run ACS tests on Corstone-1000:
+To build and run ACS tests on Corstone-1000 with Cortex-A320:
=20
 1. On your host development machine, clone the [Arm SystemReady ACS repo=
sitory](https://github.com/ARM-software/arm-systemready/).
=20
@@ -100,7 +100,7 @@ To build and run ACS tests on Corstone-1000:
 2. Find the pre-built ACS live image in `${WORKSPACE}/arm-systemready/IR=
/prebuilt_images/v23.09_2.1.0/ir-acs-live-image-generic-arm64.wic.xz`.
=20
    :::note
-   This prebuilt ACS image includes v5.13 kernel, which does not provide=
 USB driver support for Corstone-1000.
+   This prebuilt ACS image includes v5.13 kernel, which does not provide=
 USB driver support for Corstone-1000 with Cortex-A320.
    :::
=20
 3. Decompress the pre-built ACS live image.
@@ -172,14 +172,15 @@ Table: Payload GUIDs
 +-----------+--------------------------------------+
=20
 The following section describes the steps to update the firmware using C=
apsule Update
-as the Corstone-1000 supports UEFI.
+as the Corstone-1000 with Cortex-A320 supports UEFI.
=20
 The firmware update process is tested with an invalid capsule and with v=
alid capsules to validate the robustness and
 error-handling capabilities of the firmware update mechanism.
=20
-- Positive full capsule update test: The Corstone-1000 is provided with =
a valid full capsule, which it applies successfully. The system then boot=
s normally and reaches the Linux command prompt.
-- Positive partial capsule update test: The Corstone-1000 is provided wi=
th a valid partial capsule that specifies an update for a single componen=
t only. The capsule is applied successfully, after which the system boots=
 normally and reaches the Linux command prompt.
-- Rollback protection capsule update test: The Corstone-1000 is provided=
 with an outdated capsule containing lower version numbers for all payloa=
ds. The capsule is correctly rejected due to rollback protection, and the=
 previously installed firmware is retained.
+- Positive full capsule update test: The Corstone-1000 with Cortex-A320 =
is provided with a valid full capsule, which it applies successfully. The=
 system then boots normally and reaches the Linux command prompt.
+- Positive partial capsule update test: The Corstone-1000 with Cortex-A3=
20 is provided with a valid partial capsule that specifies an update for =
a single component only. The capsule is applied successfully,
+after which the system boots normally and reaches the Linux command prom=
pt.
+- Rollback protection capsule update test: The Corstone-1000 with Cortex=
-A320 is provided with an outdated capsule containing lower version numbe=
rs for all payloads. The capsule is correctly rejected due to rollback pr=
otection, and the previously installed firmware is retained.
=20
 Three different capsules are therefore needed to perform the tests.
=20
@@ -383,7 +384,7 @@ To run the test:
    ...
    ```
=20
-6. Run the following commands in order to run the Corstone-1000 Linux ke=
rnel.
+6. Run the following commands in order to run the Corstone-1000 with Cor=
tex-A320 Linux kernel.
=20
    :::note
    Otherwise, the execution ends up in the ACS live image.
@@ -420,7 +421,7 @@ To run the test:
    Hit any key to stop autoboot:
    ```
=20
-9. Run the following commands to boot the Corstone-1000 Linux kernel.
+9. Run the following commands to boot the Corstone-1000 with Cortex-A320=
 Linux kernel.
=20
    :::note
    If these commands are not executed, the system will default to bootin=
g into the ACS live image.
@@ -524,7 +525,7 @@ To run the rollback protection capsule update test:
    Hit any key to stop autoboot:
    ```
=20
-8. Run the following commands in order to run the Corstone-1000 Linux ke=
rnel, otherwise, the execution ends up in the ACS live image.
+8. Run the following commands in order to run the Corstone-1000 with Cor=
tex-A320 Linux kernel, otherwise, the execution ends up in the ACS live i=
mage.
=20
    ```
    $ unzip $kernel_addr 0x90000000
@@ -545,7 +546,7 @@ To run the rollback protection capsule update test:
     Hit any key to stop autoboot:
     ```
=20
-11. Run the following commands to boot the Corstone-1000 Linux kernel. I=
f these commands are not executed, the system will default to booting int=
o the ACS live image.
+11. Run the following commands to boot the Corstone-1000 with Cortex-A32=
0 Linux kernel. If these commands are not executed, the system will defau=
lt to booting into the ACS live image.
=20
     ```
     $ unzip $kernel_addr 0x90000000
@@ -621,28 +622,28 @@ cat /sys/firmware/efi/esrt/entries/entry0/last_atte=
mpt_status
 The following list shows the details of the first four ESRT entries for =
the positive capsule update test:
=20
 - BL2 (`${BL2_GUID}`):
-  - FW type: 0
+  - FW type: 1
   - FW version: 6
   - Lowest supported version: 0
   - Capsule flags: 0
   - Last attempt status: 0
   - Last attempt version: 6
 - TFM_S (`${TFM_S_GUID}`):
-  - FW type: 0
+  - FW type: 1
   - FW version: 6
   - Lowest supported version: 0
   - Capsule flags: 0
   - Last attempt status: 0
   - Last attempt version: 6
 - FIP (`${FIP_GUID}`):
-  - FW type: 0
+  - FW type: 1
   - FW version: 6
   - Lowest supported version: 0
   - Capsule flags: 0
   - Last attempt status: 0
   - Last attempt version: 6
 - INITRAMFS (`${INITRAMFS_GUID}`):
-  - FW type: 0
+  - FW type: 1
   - FW version: 6
   - Lowest supported version: 0
   - Capsule flags: 0
@@ -654,28 +655,28 @@ The following list shows the details of the first f=
our ESRT entries for the posi
 The following list shows the details of the first four ESRT entries for =
the positive partial capsule update test:
=20
 - BL2 (`${BL2_GUID}`):
-  - FW type: 0
+  - FW type: 1
   - FW version: 7
   - Lowest supported version: 0
   - Capsule flags: 0
   - Last attempt status: 0
   - Last attempt version: 7
 - TFM_S (`${TFM_S_GUID}`):
-  - FW type: 0
+  - FW type: 1
   - FW version: 6
   - Lowest supported version: 0
   - Capsule flags: 0
   - Last attempt status: 0
   - Last attempt version: 6
 - FIP (`${FIP_GUID}`):
-  - FW type: 0
+  - FW type: 1
   - FW version: 6
   - Lowest supported version: 0
   - Capsule flags: 0
   - Last attempt status: 0
   - Last attempt version: 6
 - INITRAMFS (`${INITRAMFS_GUID}`):
-  - FW type: 0
+  - FW type: 1
   - FW version: 6
   - Lowest supported version: 0
   - Capsule flags: 0
@@ -687,28 +688,28 @@ The following list shows the details of the first f=
our ESRT entries for the posi
 The following list shows the details of the first four ESRT entries for =
the rollback protection capsule update test:
=20
 - BL2 (`${BL2_GUID}`):
-  - FW type: 0
+  - FW type: 1
   - FW version: 7
   - Lowest supported version: 0
   - Capsule flags: 0
   - Last attempt status: 1
   - Last attempt version: 5
 - TFM_S (`${TFM_S_GUID}`):
-  - FW type: 0
+  - FW type: 1
   - FW version: 6
   - Lowest supported version: 0
   - Capsule flags: 0
   - Last attempt status: 0
   - Last attempt version: 6
 - FIP (`${FIP_GUID}`):
-  - FW type: 0
+  - FW type: 1
   - FW version: 6
   - Lowest supported version: 0
   - Capsule flags: 0
   - Last attempt status: 0
   - Last attempt version: 6
 - INITRAMFS (`${INITRAMFS_GUID}`):
-  - FW type: 0
+  - FW type: 1
   - FW version: 6
   - Lowest supported version: 0
   - Capsule flags: 0
@@ -719,14 +720,14 @@ See the [UEFI documentation](https://uefi.org/specs=
/UEFI/2.10/23_Firmware_Update
=20
 ## Linux distributions {.reference}
=20
-This sections describes the steps to install major Linux distributions t=
o the Corstone-1000 Host Processor.
+This section describes the steps to install major Linux distributions to=
 the Corstone-1000 with Cortex-A320 Host Processor.
=20
 The Linux distributions to be installed are:
=20
 - [Debian](https://www.debian.org/)
 - [openSUSE](https://www.opensuse.org/)
=20
-Follow the instructions below to install the Linux distributions to the =
Corstone-1000 software stack.
+Follow the instructions below to install the Linux distributions to the =
Corstone-1000 with Cortex-A320 software stack.
=20
 ### Prepare installation media {.reference}
=20
@@ -741,7 +742,7 @@ Follow the instructions below to create the installat=
ion media.
=20
    Note that the location of the ISO file on the development machine wil=
l be referred to as `${DISTRO_INSTALLER_ISO_PATH}`.
=20
-2. Create the installation media which will contain the necessary files =
to install the operation system.
+2. Create the installation media which will contain the necessary files =
to install the operating system.
=20
    The distribution installer ISO file does not need to be burnt to a US=
B drive.
    It will be used as is when starting the FVP install the distribution.
@@ -749,9 +750,9 @@ Follow the instructions below to create the installat=
ion media.
 ### Prepare system drive {.reference}
=20
 A system (or boot) drive, to store all the operating system files and us=
ed to boot the distribution, is required as
-Corstone-1000 on-board non-volatile storage size is insufficient for ins=
talling the distributions.
+Corstone-1000 with Cortex-A320 on-board non-volatile storage size is ins=
ufficient for installing the distributions.
=20
-1. Create an 10 GB GUID Partition Table (GPT) formatted MultiMediaCard (=
MMC) image.
+1. Create a 10 GB GUID Partition Table (GPT) formatted MultiMediaCard (M=
MC) image.
=20
    ```
    dd if=3D/dev/zero of=3D${WORKSPACE}/fvp_distro_system_drive.img \
@@ -914,7 +915,7 @@ To generate keys:
    cd ${WORKSPACE}
=20
    git clone https://gitlab.arm.com/arm-reference-solutions/iot-platform=
-assets \
-   -b CORSTONE1000-2026.05
+   -b CORSTONE1000-2026.11
    ```
=20
 3. Set the current working directory to build directory's subdirectory c=
ontaining the software stack build images.
@@ -927,7 +928,7 @@ To generate keys:
=20
    ```
    ${WORKSPACE}/iot-platform-assets/corstone1000/secureboot/create_keys_=
and_sign.sh \
-   -d fvp \
+   -d a320-fvp \
    -v ${CERTIFICATE_VALIDITY_DURATION_IN_DAYS}
    ```
=20
@@ -978,7 +979,7 @@ To run an unsigned image boot test:
=20
    ```
    corstone1000# \
-   load mmc 1:1 $loadaddr corstone1000_secureboot_fvp_images/Image_fvp; =
\
+   load mmc 1:1 $loadaddr corstone1000_secureboot_a320-fvp_images/Image_=
a320-fvp; \
    loadm $loadaddr $kernel_addr_r $filesize; \
    bootefi $kernel_addr_r $fdtcontroladdr
=20
@@ -997,7 +998,7 @@ Load the signed kernel image.
=20
 ```
 corstone1000# \
-load mmc 1:1 $loadaddr corstone1000_secureboot_fvp_images/Image_fvp.sign=
ed; \
+load mmc 1:1 $loadaddr corstone1000_secureboot_a320-fvp_images/Image_a32=
0-fvp.signed; \
 loadm $loadaddr $kernel_addr_r $filesize; \
 bootefi $kernel_addr_r $fdtcontroladdr
 ```
@@ -1036,7 +1037,7 @@ to communicate between the normal world and the sec=
ure world to run the [Arm Pla
=20
 The tests use the `arm_tstee` driver to access Trusted Services Secure P=
artitions from user space. The driver is included in the Linux Kernel, st=
arting from v6.10.
=20
-1. Start the Corstone-1000 FVP and wait until it boots to Linux.
+1. Start the Corstone-1000 with Cortex-A320 FVP and wait until it boots =
to Linux.
=20
 2. Run the PSA API tests by running the commands below in the order show=
n:
=20
@@ -1058,7 +1059,7 @@ Symmetric multiprocessing (SMP) mode is supported o=
n the Corstone-1000 with Cort
    meta-arm/kas/corstone1000-multicore.yml
    ```
=20
-2. Run the Corstone-1000 FVP.
+2. Run the Corstone-1000 with Cortex-A320 FVP.
=20
    ```
    kas shell meta-arm/kas/corstone1000-a320-fvp.yml:meta-arm/ci/debug.ym=
l:\
@@ -1082,7 +1083,7 @@ To build on Ethos-U85 NPU:
    ```
    cd ${WORKSPACE}
    git clone https://git.gitlab.arm.com/arm-reference-solutions/iot-plat=
form-assets.git \
-   -b CORSTONE1000-2026.05
+   -b CORSTONE1000-2026.11
    ```
=20
 2. Copy the additional kas configuration file to:
@@ -1107,14 +1108,14 @@ To build on Ethos-U85 NPU:
    cd ${WORKSPACE}
    ```
=20
-5. Re-build the Corstone-1000 FVP software stack as follows:
+5. Re-build the Corstone-1000 with Cortex-A320 FVP software stack as fol=
lows:
=20
    ```
    kas build meta-arm/kas/corstone1000-a320-fvp.yml:meta-arm/ci/debug.ym=
l:\
    meta-arm/kas/ethos-u85-test.yml
    ```
=20
-6. Run the Corstone-1000 FVP:
+6. Run the Corstone-1000 with Cortex-A320 FVP:
=20
    ```
    kas shell meta-arm/kas/corstone1000-a320-fvp.yml:meta-arm/ci/debug.ym=
l:\
@@ -1122,7 +1123,7 @@ To build on Ethos-U85 NPU:
    -c "../meta-arm/scripts/runfvp"
    ```
=20
-7. To verify you are running the Corstone-1000 FVP (Cortex-A320), build =
and run the FVP and inspect the CPU model
+7. To verify you are running the Corstone-1000 with Cortex-A320 FVP, bui=
ld and run the FVP and inspect the CPU model
    reported in `/proc/cpuinfo` as shown below. Inside the FVP shell, con=
firm the core type:
=20
    ```
diff --git a/meta-arm-bsp/documentation/corstone1000-a320/topics/user-gui=
de.md b/meta-arm-bsp/documentation/corstone1000-a320/topics/user-guide.md
index f56e8d06..3db78907 100644
--- a/meta-arm-bsp/documentation/corstone1000-a320/topics/user-guide.md
+++ b/meta-arm-bsp/documentation/corstone1000-a320/topics/user-guide.md
@@ -2,7 +2,7 @@
=20
 The Arm Corstone-1000 with Cortex-A320 software stack uses the Yocto Pro=
ject to build a tiny Linux distribution suitable for the Arm Corstone-100=
0 with Cortex-A320 platform (kernel and initramfs filesystem less than 6 =
MB on the flash).
=20
-The Corstone-1000 with Cortex-A320 software stack can be run on [Arm Cor=
stone-1000 with Cortex-A320 FVP (Fixed Virtual Platform)](https://develop=
er.arm.com/downloads/-/arm-ecosystem-fvps) and is built on top of Yocto P=
roject's [Wrynose release]($meta_arm_repository_release_branch).
+The Corstone-1000 with Cortex-A320 software stack can be run on [Arm Cor=
stone-1000 with Cortex-A320 FVP (Fixed Virtual Platform)](https://develop=
er.arm.com/downloads/-/arm-ecosystem-fvps) and is built on top of Yocto P=
roject's [Blacksail release]($meta_arm_repository_release_branch).
=20
 The Yocto Project relies on the [BitBake](https://docs.yoctoproject.org/=
bitbake.html#bitbake-documentation) tool as its build tool. Please see th=
e [Yocto Project documentation](https://docs.yoctoproject.org/) for more =
information.
=20
@@ -135,7 +135,7 @@ Table: Trusted Firmware-M secure enclave components
 | Type      | Path                                                      =
                                                       |
 | --------- | ----------------------------------------------------------=
------------------------------------------------------ |
 | bbappend  | `${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/trusted-fi=
rmware-m/trusted-firmware-m_%.bbappend`                |
-| Recipe    | `${WORKSPACE}/meta-arm/meta-arm/recipes-bsp/trusted-firmwa=
re-m/trusted-firmware-m_2.3.0.bb`                      |
+| Recipe    | `${WORKSPACE}/meta-arm/meta-arm/recipes-bsp/trusted-firmwa=
re-m/trusted-firmware-m_2.3.1.bb`                      |
=20
 ## Build {.reference}
=20
@@ -164,7 +164,7 @@ Building binaries natively on Windows and AArch64 Lin=
ux is not supported. Use an
=20
    ```
    cd ${WORKSPACE}
-   git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1000-2=
026.05
+   git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1000-2=
026.11
    ```
=20
 4. Accept the EULA on the [Arm Developer](https://developer.arm.com/down=
loads/-/arm-ecosystem-fvps/eula) site to build a Corstone-1000 with Corte=
x-A320 image for FVP as follows:
