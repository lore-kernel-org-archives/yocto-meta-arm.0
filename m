Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0450C87FCC
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 16:11:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.66170.1753978287559369412
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 31 Jul 2025 09:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20E521BF7;
	Thu, 31 Jul 2025 09:11:19 -0700 (PDT)
Received: from LXKV206JHX.arm.com (unknown [10.57.0.228])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E30E3F5A1;
	Thu, 31 Jul 2025 09:11:26 -0700 (PDT)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH] arm-bsp/documentation: corstone1000: Revamp user guide Capsule Update test section
Date: Thu, 31 Jul 2025 17:11:22 +0100
Message-Id: <20250731161122.50568-1-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 31 Jul 2025 16:11:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6651

- Rename "negative capsule update test" to "rollback capsule update test"
- Replace U-Boot mkeficapsule with EDK II GenerateCapsule workflow
- Add JSON-driven helper script example (generate_capsule_json_multiple.p=
y)
- Document multi-payload support (BL2, TFM_S, FIP, INITRAMFS)

Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
---
 .../documentation/corstone1000/user-guide.rst | 291 ++++++++++++++----
 1 file changed, 234 insertions(+), 57 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index b7fb8d84..78ed1585 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -841,27 +841,36 @@ Capsule Update
 The following section describes the steps to update the firmware using C=
apsule Update
 as the Corstone-1000 supports UEFI.
=20
-The firmware update process is tested with an invalid capsule (negative =
capsule update test)
+The firmware update process is tested with an invalid capsule (rollback =
protection capsule update test)
 and with a valid capsule (positive capsule update test) to validate the =
robustness and
 error-handling capabilities of the firmware update mechanism.
=20
 During the positive capsule update test, the Corstone-1000 is given a va=
lid capsule, which it successfully applies, boots up and then reaches the=
 Linux command prompt.
=20
-During the negative capsule update test, the Corstone-1000 is given an o=
utdated capsule with a lower version number,
+During the rollback protection capsule update test, the Corstone-1000 is=
 given an outdated capsule with a lower version number for all payloads,
 which is expected to be rejected due to its outdated status, thereby ret=
aining the previous firmware.
=20
 Two different capsules (one for each test) are therefore needed to perfo=
rm the tests.
=20
+The following payloads can be individually updated:
+
+    - Boot Loader stage 2 (BL2)
+    - Trusted Firmware-M Secure partition (TFM_S)
+    - Firmware Image Package (FIP)
+    - Initial RAM Filesystem (INITRAMFS)
+
=20
 *****************
 Generate Capsules
 *****************
=20
-U-Boot's ``mkeficapsule`` tool is used to generate capsules. It is built=
 automatically for the host machine during the firmware image building pr=
ocess.
-The tool can be found in the ``${WORKSPACE}/build/tmp/sysroots-component=
s/x86_64/u-boot-tools-native/usr/bin/mkeficapsule`` directory.
+`EDK II's <edk2-repository_>`__ ``GenerateCapsule`` tool is used to gene=
rate capsules and is built automatically
+for the host machine during the firmware image building process.
+The tool can be found in the ``${WORKSPACE}/build/tmp/sysroots-component=
s/aarch64/edk2-basetools-native/usr/bin/edk2-BaseTools/BinWrappers/PosixL=
ike/GenerateCapsule`` directory.
=20
-``mkeficapsule`` uses a no-partition image which is created when perform=
ing a clean firmware build.
-The no-partition image can be found in the ``${WORKSPACE}/build/tmp/depl=
oy/images/corstone1000-${TARGET}/corstone1000-${TARGET}/corstone1000-${TA=
RGET}_image.nopt`` directory.
+A JSON file containing metadata about the capsule payloads needs to be c=
reated using the script
+found at ``${WORKSPACE}/meta-arm/scripts/generate_capsule_json_multiple.=
py``.
+This JSON file is required by EDK II's ``GenerateCapsule`` tool to gener=
ate the capsule.
=20
 The capsule's default metadata passed can be found in the ``${WORKSPACE}=
/meta-arm/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-ima=
ge.bb``
 and ``${WORKSPACE}/meta-arm/kas/corstone1000-image-configuration.yml`` f=
iles.
@@ -869,7 +878,7 @@ and ``${WORKSPACE}/meta-arm/kas/corstone1000-image-co=
nfiguration.yml`` files.
 Valid Capsule
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-An automatically generated capsule can be found in ``${WORKSPACE}/build/=
tmp/deploy/images/corstone1000-${TARGET}/corstone1000-${TARGET}-v6.uefi.c=
apsule`` after running a firmware build.
+An automatically generated capsule can be found at ``${WORKSPACE}/build/=
tmp/deploy/images/corstone1000-${TARGET}-v6.uefi.capsule`` after running =
a firmware build.
=20
 The default metadata values are assumed to be correct to generate a vali=
d capsule.
=20
@@ -878,33 +887,77 @@ This capsule will be used for the positive capsule =
update test.
 Invalid Capsule
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-Generate another capsule with ``fw-version`` metadata set to a lower ver=
sion than the valid capsule.
-The example below assumes the valid capsule has a default firmware versi=
on of 6, and therefore creates an invalid capsule with firmware version 5=
.
-
+Generate a capsule with firmware version metadata for all payloads set l=
ower than that of a valid capsule.
+The valid capsule has a default firmware version of 6 for all payloads, =
while the simulated invalid capsule has the firmware version set to 5 for=
 all payloads.
=20
-Run the following commands to generate an invalid capsule with a ``fw-ve=
rsion`` of ``5``:
+Use the following commands to generate the `capsule_config.json` file, w=
hich is required by the EDK2 tool for capsule creation:
=20
 .. code-block:: console
=20
-   cd ${WORKSPACE}
+    cd ${WORKSPACE}
=20
-   ./build/tmp/sysroots-components/x86_64/u-boot-tools-native/usr/bin/mk=
eficapsule \
-   --monotonic-count 1 \
-   --private-key build/tmp/deploy/images/corstone1000-${TARGET}/corstone=
1000_capsule_key.key \
-   --certificate build/tmp/deploy/images/corstone1000-${TARGET}/corstone=
1000_capsule_cert.crt \
-   --index 1 \
-   --guid ${TARGET}_GUID \
-   --fw-version 5 \
-   build/tmp/deploy/images/corstone1000-${TARGET}/corstone1000-${TARGET}=
_image.nopt \
-   corstone1000-${TARGET}-v5.uefi.capsule
+    python3 meta-arm/scripts/generate_capsule_json_multiple.py \
+    --selected_components DUMMY_START  BL2  TFM_S  FIP  INITRAMFS  DUMMY=
_END \
+    --components DUMMY_START  BL2  TFM_S  FIP  INITRAMFS  DUMMY_END \
+    --fw_versions 5 5 5 5 5 5 \
+    --guids \
+    6f784cbf-7938-5c23-8d6e-24d2f1410fa9  \
+    ${BL2_GUID} ${TFM_S_GUID}  ${FIP_GUID}  ${INITRAMFS_GUID} \
+    b57e432b-a250-5c73-93e3-90205e64baba \
+    --hardware_instances 1  1  1  1  1  1 \
+    --lowest_supported_versions 5 5 5 5 5 5 \
+    --monotonic_counts 1  1  1  1  1  1 \
+    --payloads \
+    build/tmp/deploy/images/corstone1000-${TARGET}/dummy.bin \
+    build/tmp/deploy/images/corstone1000-${TARGET}/bl2_signed.bin \
+    build/tmp/deploy/images/corstone1000-${TARGET}/tfm_s_signed.bin \
+    build/tmp/deploy/images/corstone1000-${TARGET}/signed_fip-corstone10=
00.bin \
+    build/tmp/deploy/images/corstone1000-${TARGET}/Image.gz-initramfs-co=
rstone1000-${TARGET}.bin \
+    build/tmp/deploy/images/corstone1000-${TARGET}/dummy.bin \
+    --update_image_indexes 5  1  2  3  4  6 \
+    --private_keys \
+    build/tmp/deploy/images/corstone1000-${TARGET}/corstone1000_capsule_=
key.key \
+    build/tmp/deploy/images/corstone1000-${TARGET}/corstone1000_capsule_=
key.key \
+    build/tmp/deploy/images/corstone1000-${TARGET}/corstone1000_capsule_=
key.key \
+    build/tmp/deploy/images/corstone1000-${TARGET}/corstone1000_capsule_=
key.key \
+    build/tmp/deploy/images/corstone1000-${TARGET}/corstone1000_capsule_=
key.key \
+    build/tmp/deploy/images/corstone1000-${TARGET}/corstone1000_capsule_=
key.key \
+    --certificates \
+    build/tmp/deploy/images/corstone1000-${TARGET}/corstone1000_capsule_=
cert.crt \
+    build/tmp/deploy/images/corstone1000-${TARGET}/corstone1000_capsule_=
cert.crt \
+    build/tmp/deploy/images/corstone1000-${TARGET}/corstone1000_capsule_=
cert.crt \
+    build/tmp/deploy/images/corstone1000-${TARGET}/corstone1000_capsule_=
cert.crt \
+    build/tmp/deploy/images/corstone1000-${TARGET}/corstone1000_capsule_=
cert.crt \
+    build/tmp/deploy/images/corstone1000-${TARGET}/corstone1000_capsule_=
cert.crt \
+    --output capsule_config.json
=20
=20
 .. important::
=20
-    ``${TARGET}_GUID`` is different depending on whether the capsule is =
built for the ``fvp`` or ``mps3`` ``${TARGET}``.
+    Payload GUIDs (``${BL2_GUID}``, ``${TFM_S_GUID}``, ``${FIP_GUID}``, =
and ``${INITRAMFS_GUID}``)
+    are different depending on whether the capsule is built for the ``fv=
p`` or ``mps3`` ``${TARGET}``.
+
+    +------------+----------------------------------------+-------------=
---------------------------+
+    | Payloads   | FVP                                    | MPS3        =
                           |
+    +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
+    | BL2        | f1d883f9-dfeb-5363-98d8-686ee3b69f4f   | fbfbefaa-0a5=
6-50d5-b651-74091d3d62cf   |
+    +------------+----------------------------------------+-------------=
---------------------------+
+    | TFM_S      | 7fad470e-5ec5-5c03-a2c1-4756b495de61   | af4cc7ad-ee2=
e-5a39-aad5-fac8a1e6173c   |
+    +------------+----------------------------------------+-------------=
---------------------------+
+    | FIP        | f1933675-5a8c-5b6d-9ef4-846739e89bc8   | 55302f96-c4f=
0-5cf9-8624-e7cc388f2b68   |
+    +------------+----------------------------------------+-------------=
---------------------------+
+    | INITRAMFS  | f771aff9-c7e9-5f99-9eda-2369dd694f61   | 3e8ac972-c33=
c-5cc9-90a0-cdd3159683ea   |
+    +------------+----------------------------------------+-------------=
---------------------------+
=20
-    - ``fvp`` ``${TARGET}_GUID`` is ``989f3a4e-46e0-4cd0-9877-a25c70c013=
29``
-    - ``mps3`` ``${TARGET}_GUID`` is ``df1865d1-90fb-4d59-9c38-c9f2c1bba=
8cc``
+Run the command below to generate the invalid capsule:
+
+.. code-block:: console
+
+    ./build/tmp/sysroots-components/aarch64/edk2-basetools-native/usr/bi=
n/edk2-BaseTools/BinWrappers/PosixLike/GenerateCapsule \
+    -e \
+    -j capsule_config.json \
+    --capflag PersistAcrossReset \
+    -o corstone1000-${TARGET}-v5.uefi.capsule
=20
 The invalid capsule will be located in the ``${WORKSPACE}`` directory.
=20
@@ -936,8 +989,8 @@ MPS3
=20
 .. important::
=20
-    Since we are using the direct Capsule Update method, the capsule fil=
es should not be placed in
-    the ``EFI/UpdateCapsule`` directory, as this might inadvertently tri=
gger the on-disk update method.
+    The direct Capsule Update method requires that the capsule files not=
 be placed in the ``EFI/UpdateCapsule`` directory,
+    as doing so might inadvertently trigger the on-disk update method.
=20
 FVP
 =3D=3D=3D
@@ -989,12 +1042,12 @@ Run Capsule Update Tests
 ************************
=20
 The valid capsule (``corstone1000-${TARGET}-v6.uefi.capsule``) will be u=
sed first to run the positive capsule update test.
-This will be followed by using the invalid capsule (``corstone1000-${TAR=
GET}-v5.uefi.capsule``) to run the negative capsule update test.
+This will be followed by using the invalid capsule (``corstone1000-${TAR=
GET}-v5.uefi.capsule``) to run the rollback protection capsule update tes=
t.
=20
 .. important::
=20
     This sequence order must be respected as the invalid capsule has a f=
irmware version lower than the firmware version in the valid capsule.
-    The negative capsule update test effectively tests that firmware rol=
lback is not permitted.
+    The rollback protection capsule update test effectively tests that f=
irmware rollback is not permitted.
=20
=20
 .. _positive-capsule-update-test:
@@ -1031,7 +1084,7 @@ Positive Capsule Update Test
=20
         Press ESC in 4 seconds to skip startup.nsh or any other key to c=
ontinue.
=20
-#. Access the content of the first file system (``File System 0``) where=
 we copied the capsule files by running the following command:
+#. The content of the first file system (``File System 0``), where the c=
apsule files were copied, can be accessed by running the following comman=
d:
=20
     .. code-block:: console
=20
@@ -1108,34 +1161,43 @@ Positive Capsule Update Test
         $ loadm 0x90000000 $kernel_addr_r $filesize
         $ bootefi $kernel_addr_r $fdtcontroladdr
=20
+#. The first boot after a capsule update is considered the trial stage, =
during which the FWU image is accepted.
+   However, to view the updated contents of the EFI System Resource Tabl=
e (ESRT), an additional reboot is required.
=20
-#. After the system fully boots, read the EFI System Resource Table (ESR=
T) to verify that the firmware version matches the version of the capsule=
 applied.
+   .. code-block:: console
=20
-  .. code-block:: console
+      # reboot
+
+#. Interrupt the U-Boot shell when prompted.
=20
-    # cd /sys/firmware/efi/esrt/entries/entry0
-    # cat *
+   .. code-block:: console
=20
-    0x0                                      # capsule_flags
-    989f3a4e-46e0-4cd0-9877-a25c70c01329     # fw_class
-    0                                        # fw_type
-    6                                        # fw_version
-    0                                        # last_attempt_status
-    6                                        # last_attempt_version
-    0                                        # lowest_supported_fw_ver
+      Hit any key to stop autoboot:
=20
-  See the `UEFI documentation <https://uefi.org/specs/UEFI/2.10/23_Firmw=
are_Update_and_Reporting.html#id29>`__ for more information on the signif=
icance of the table fields.
+#. Run the following commands to boot the Corstone-1000 Linux kernel.
+
+   .. note::
+      If these commands are not executed, the system will default to boo=
ting into the ACS live image.
+
+   .. code-block:: console
+
+      $ unzip $kernel_addr 0x90000000
+      $ loadm 0x90000000 $kernel_addr_r $filesize
+      $ bootefi $kernel_addr_r $fdtcontroladdr
+
+#. Once the system has fully booted again, `read the ESRT <verifying-fir=
mware-versions-via-esrt_>`__ to=20
+   confirm that the firmware version reflects the updated capsule.
=20
 .. warning::
=20
-    Do not terminate FVP between the positive and negative capsule updat=
e tests.
+    Do not terminate FVP between the positive and rollback protection ca=
psule update tests.
=20
-Negative Capsule Update Test
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
+Rollback Protection Capsule Update Test
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 .. important::
=20
-  The `positive capsule update test <positive-capsule-update-test_>`__ m=
ust be run before running the negative capsule update test.
+  The `positive capsule update test <positive-capsule-update-test_>`__ m=
ust be run before running the rollback protection capsule update test.
=20
 #. After running the positive capsule update test, reboot the system by =
typing the following command on the Host Processor terminal (``ttyUSB2`` =
for MPS3):
=20
@@ -1149,7 +1211,7 @@ Negative Capsule Update Test
=20
         Press ESC in 4 seconds to skip startup.nsh or any other key to c=
ontinue.
=20
-#. Access the content of the first file system (``File System 0``) where=
 we copied the capsule files by running the following command:
+#. The content of the first file system (``File System 0``), where the c=
apsule files were copied, can be accessed by running the following comman=
d:
=20
     .. code-block:: console
=20
@@ -1228,21 +1290,135 @@ Negative Capsule Update Test
         $ loadm 0x90000000 $kernel_addr_r $filesize
         $ bootefi $kernel_addr_r $fdtcontroladdr
=20
-#. After the system fully boots, read the ESRT to verify the firmware ve=
rsion does not match what is on the invalid capsule.
+#. The first boot after a capsule update is considered the trial stage, =
during which the FWU image is rejected.
+   However, to view the updated contents of the ESRT, an additional rebo=
ot is required.
=20
-    .. code-block:: console
+   .. code-block:: console
+
+      # reboot
+
+#. Interrupt the U-Boot shell when prompted.
+
+   .. code-block:: console
=20
-      # cd /sys/firmware/efi/esrt/entries/entry0
-      # cat *
+      Hit any key to stop autoboot:
=20
-      0x0                                      # capsule_flags
-      989f3a4e-46e0-4cd0-9877-a25c70c01329     # fw_class
-      0                                        # fw_type
-      6                                        # fw_version
-      1                                        # last_attempt_status
-      5                                        # last_attempt_version
-      0                                        # lowest_supported_fw_ver
+#. Run the following commands to boot the Corstone-1000 Linux kernel.
+
+   .. note::
+      If these commands are not executed, the system will default to boo=
ting into the ACS live image.
+
+   .. code-block:: console
+
+      $ unzip $kernel_addr 0x90000000
+      $ loadm 0x90000000 $kernel_addr_r $filesize
+      $ bootefi $kernel_addr_r $fdtcontroladdr
+
+#. Once the system has fully booted again, `read the ESRT <verifying-fir=
mware-versions-via-esrt_>`__ to=20
+   confirm that the firmware version reflects the updated capsule.
+
+.. _verifying-firmware-versions-via-esrt:
+
+*************************************
+Verifying Firmware Versions via ESRT
+*************************************
+
+After the system has fully booted, verify that the firmware versions of =
all applied capsule payloads
+match those currently installed on the system. This can be done by inspe=
cting the ESRT, which is exposed by the Linux kernel.
+
+Reading ESRT Entries
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+To read each ESRT entry, use the following commands:
+
+.. code-block:: bash
+
+   cat /sys/firmware/efi/esrt/entries/entry0/*
+   cat /sys/firmware/efi/esrt/entries/entry1/*
+   cat /sys/firmware/efi/esrt/entries/entry2/*
+   cat /sys/firmware/efi/esrt/entries/entry3/*
+
+These entries typically correspond to:
+
+- ``entry0``: BL2
+- ``entry1``: TFM_S
+- ``entry2``: FIP
+- ``entry3``: INITRAMFS
+
+.. note::
+
+   Entry indices may vary depending on how your firmware capsules are st=
ructured. Adjust as needed.
+
+Structure of Each ESRT Entry
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
=20
+Each directory under ``/sys/firmware/efi/esrt/entries/entryX/`` contains=
 files representing the following fields:
+
++---------------------------------+-------------------------------------=
-------------------------+
+| Field Name                      | Description                         =
                         |
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
+| ``capsule_flags``               | Attributes of the update capsule (e.=
g., persist, reset)      |
++---------------------------------+-------------------------------------=
-------------------------+
+| ``fw_class``                    | GUID identifying the firmware compon=
ent                      |
++---------------------------------+-------------------------------------=
-------------------------+
+| ``fw_type``                     | Firmware type (e.g., system, device,=
 peripheral)             |
++---------------------------------+-------------------------------------=
-------------------------+
+| ``fw_version``                  | Currently installed firmware version=
                         |
++---------------------------------+-------------------------------------=
-------------------------+
+| ``last_attempt_status``         | Status of the last update attempt (e=
.g., success, failure)   |
++---------------------------------+-------------------------------------=
-------------------------+
+| ``last_attempt_version``        | Version that was last attempted to i=
nstall                   |
++---------------------------------+-------------------------------------=
-------------------------+
+| ``lowest_supported_fw_version`` | Minimum firmware version that is sti=
ll supported             |
++---------------------------------+-------------------------------------=
-------------------------+
+
+Verifying an ESRT Entry
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+To check the version and status of BL2 (``entry0``), run:
+
+.. code-block:: bash
+
+   cat /sys/firmware/efi/esrt/entries/entry0/fw_version
+   cat /sys/firmware/efi/esrt/entries/entry0/last_attempt_version
+   cat /sys/firmware/efi/esrt/entries/entry0/last_attempt_status
+
+
+Positive Capsule Update Test ESRT
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The following table shows the details of the first four ESRT entries for=
 the positive capsule update test:
+
++-------------------+-----------------------+-------------+-------------=
---+-------------------------+--------------------------+----------------=
-------------+
+| ``capsule_flags`` | ``fw_class``          | ``fw_type`` | ``fw_version=
`` | ``last_attempt_status`` | ``last_attempt_version`` | ``lowest_suppor=
ted_fw_ver`` |
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D+
+| 0                 | ``${BL2_GUID}``       | 0           | 6           =
   | 0                       | 6                        | 0              =
             |
++-------------------+-----------------------+-------------+-------------=
---+-------------------------+--------------------------+----------------=
-------------+
+| 0                 | ``${TFM_S_GUID}``     | 0           | 6           =
   | 0                       | 6                        | 0              =
             |
++-------------------+-----------------------+-------------+-------------=
---+-------------------------+--------------------------+----------------=
-------------+
+| 0                 | ``${FIP_GUID}``       | 0           | 6           =
   | 0                       | 6                        | 0              =
             |
++-------------------+-----------------------+-------------+-------------=
---+-------------------------+--------------------------+----------------=
-------------+
+| 0                 | ``${INITRAMFS_GUID}`` | 0           | 6           =
   | 0                       | 6                        | 0              =
             |
++-------------------+-----------------------+-------------+-------------=
---+-------------------------+--------------------------+----------------=
-------------+
+
+Rollback Protection Capsule Update Test ESRT
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The following table shows the details of the first four ESRT entries for=
 the rollback protection capsule update test:
+
++-------------------+------------------------+-------------+------------=
----+-------------------------+--------------------------+---------------=
--------------+
+| ``capsule_flags`` | ``fw_class``           | ``fw_type`` | ``fw_versio=
n`` | ``last_attempt_status`` | ``last_attempt_version`` | ``lowest_suppo=
rted_fw_ver`` |
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D+
+| 0                 | ``${BL2_GUID}``        | 0           | 6          =
    | 1                       | 5                        | 0             =
              |
++-------------------+------------------------+-------------+------------=
----+-------------------------+--------------------------+---------------=
--------------+
+| 0                 | ``${TFM_S_GUID}``      | 0           | 6          =
    | 0                       | 6                        | 0             =
              |
++-------------------+------------------------+-------------+------------=
----+-------------------------+--------------------------+---------------=
--------------+
+| 0                 | ``${FIP_GUID}``        | 0           | 6          =
    | 0                       | 6                        | 0             =
              |
++-------------------+------------------------+-------------+------------=
----+-------------------------+--------------------------+---------------=
--------------+
+| 0                 | ``${INITRAMFS_GUID}``  | 0           | 6          =
    | 0                       | 6                        | 0             =
              |
++-------------------+------------------------+-------------+------------=
----+-------------------------+--------------------------+---------------=
--------------+
+
+See the `UEFI documentation <https://uefi.org/specs/UEFI/2.10/23_Firmwar=
e_Update_and_Reporting.html#id29>`__ for more information on the signific=
ance of the table fields.
=20
=20
 Linux Distributions
@@ -1960,3 +2136,4 @@ and `Arm Development Studio <arm-ds-website_>`__ ve=
rsions 2022.2, 2022.c, or 202
 .. _meta-arm-repository-release-branch: https://web.git.yoctoproject.org=
/meta-arm?h=3Dwalnascar
 .. _arm-ulink-pro-website: https://www.arm.com/products/development-tool=
s/debug-probes/ulink-pro
 .. _arm-ds-website: https://www.arm.com/products/development-tools/embed=
ded-and-software/arm-development-studio
+.. _edk2-repository: https://github.com/tianocore/edk2

