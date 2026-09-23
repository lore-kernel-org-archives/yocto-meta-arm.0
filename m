Return-Path: <Ahmed.Gomaa@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67292C982FA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:53:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3420.1790157219907041836
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 02:53:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=UfuufuRF;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ahmed.gomaa@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7CA4152B;
	Wed, 23 Sep 2026 02:53:35 -0700 (PDT)
Received: from e142471.cambridge.arm.com (e142471.arm.com [10.2.210.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EED413F86F;
	Wed, 23 Sep 2026 02:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790157219; bh=ZuKMB0j+halyC1Pa5sza99bRi2CXuGss90/8bh2xUcQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UfuufuRF/r85qp56whz1+xlUOCfq41s7+DVD1tTGChHD287WhncGZQDu1NuR1HFri
	 E5sjcBUc3tAjs1jO8mIkaB09NjdBqABk0oL/NZYQedenb0hb5UNg1Xwcw2/iXbtKkJ
	 LJq2V/0IqAbH7IBKCcjOgpTxDc/33hdp6jN+9m3o=
From: Ahmed Gomaa <ahmed.gomaa@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ahmed Gomaa <ahmed.gomaa@arm.com>
Subject: [PATCH 3/3] arm-bsp/trusted-firmware-m: corstone1000: avoid provisioning reset
Date: Wed, 23 Sep 2026 10:53:14 +0100
Message-ID: <20260923095314.382668-4-ahmed.gomaa@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923095314.382668-1-ahmed.gomaa@arm.com>
References: <20260923095314.382668-1-ahmed.gomaa@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Sep 2026 09:53:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7173

Corstone-1000 performs PSA ADAC authentication while the device is
in CM. TF-M runtime provisioning then changes the lifecycle state and
resets the platform, which loses the authenticated debug permissions.

Add a Secure Debug build option that skips TF-M runtime provisioning.
This keeps the device in CM and avoids the provisioning reset until a
reset-safe design can preserve DCU_EN across reset and apply it from
BL2.

Update the Secure Debug guide to use Arm Development Studio's built-in
PSA-ADAC manager and obtain test credentials without building the
external SDM library. Document the connection setup and verify that
the system boots after authentication.

Signed-off-by: Ahmed Gomaa <ahmed.gomaa@arm.com>
---
 .../documentation/corstone1000/user-guide.rst | 141 +++++++++++++-----
 ...one1000-Optionally-skip-provisioning.patch |  68 +++++++++
 .../trusted-firmware-m-corstone1000.inc       |   4 +
 3 files changed, 174 insertions(+), 39 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0016-platform-corstone1000-Optionally-skip-provisioning.patch

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index a0d7b23b..a20571b1 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -2129,35 +2129,75 @@ For more information about this, see the followin=
g resources:
  - `Authenticated Debug Access Control Specification <https://developer.=
arm.com/documentation/den0101/latest/>`__
  - `Arm Corstone-1000 for MPS3 Application Note AN550, Chapter 7 <https:=
//developer.arm.com/documentation/dai0550/latest/>`__
=20
-The Secure Debug Manager API is implemented in the `Secure Debug Manager=
 (PSA-ADAC / SDC-600) <secure-debug-manager-repo-readme_>`__ repository.
-This repository also contains the necessary files for the Arm Developmen=
t Studio support.
-The build and integration instructions can be found in its `README <secu=
re-debug-manager-repo-readme_>`__.
+#. Install `Arm Development Studio <arm-ds-website_>`__ 2026.1, or Arm
+   Development Studio Platinum 2026.b. These releases contain a built-in
+   PSA-ADAC Secure Debug Manager.
=20
-The `Secure Debug Manager (PSA-ADAC / SDC-600)` repository also contains=
 the private key and chain certificate to be used during the tests.
-The private key's public pair is provisioned into the One-Time Programma=
ble memory in TrustedFirmware-M.
-These are dummy keys that should not be used in production.
-
-To test the Secure Debug feature, you'll need a debug probe from the `Ar=
m ULINKpro family <arm-ulink-pro-website_>`__
-and `Arm Development Studio <arm-ds-website_>`__ versions 2022.2, 2022.c=
, or 2023.a.
-
-
-#. Clone the `Secure Debug Manager (PSA-ADAC / SDC-600)` repository to y=
our workspace.
+#. Clone the `Secure Debug Manager
+   <https://github.com/ARM-software/secure-debug-manager>`__
+   repository to obtain the dummy test credentials.
=20
     .. code-block:: console
=20
         cd ${WORKSPACE}
         git clone https://github.com/ARM-software/secure-debug-manager.g=
it
=20
-#. Navigate into the repository directory and checkout the specific comm=
it in the listing below.
+   Only the example private key and certificate chain are needed from th=
is
+   repository.
+
+   The public key corresponding to these credentials is provisioned into=
 the
+   TrustedFirmware-M One-Time Programmable memory. The supplied credenti=
als
+   are test credentials and must not be used in production.
+
+#. Create a user configuration database based on the Arm Development Stu=
dio
+   Corstone-1000 database. The following example assumes that Arm Develo=
pment
+   Studio Platinum 2026.b is installed in ``/opt/arm``:
=20
     .. code-block:: console
=20
-        cd ${WORKSPACE}/secure-debug-manager
-        git checkout b30d6496ca749123e86b39b161b9f70ef76106d6
-        git submodule update --init
+        export ARMDS_INSTALL_DIR=3D/opt/arm/developmentstudio_platinum-2=
026.b
+        export CS1000_ADAC_DB=3D${WORKSPACE}/armds-cs1000-adac611
+
+        mkdir -p "${CS1000_ADAC_DB}/Boards/Arm_Development_Boards"
+        cp -a \
+          "${ARMDS_INSTALL_DIR}/sw/debugger/configdb/Boards/Arm Developm=
ent Boards/MPS3_Corstone_1000" \
+          "${CS1000_ADAC_DB}/Boards/Arm_Development_Boards/MPS3_Corstone=
_1000_ADAC_611"
+        cp -a "${ARMDS_INSTALL_DIR}/sw/debugger/configdb/Include" "${CS1=
000_ADAC_DB}/"
+        cp -a "${ARMDS_INSTALL_DIR}/sw/debugger/configdb/Schemas" "${CS1=
000_ADAC_DB}/"
+        cp -a "${ARMDS_INSTALL_DIR}/sw/debugger/configdb/ATP" "${CS1000_=
ADAC_DB}/"
+
+   If Arm Development Studio is installed elsewhere, change
+   ``ARMDS_INSTALL_DIR`` accordingly.
+
+#. Enable the built-in PSA-ADAC Secure Debug Manager in the copied datab=
ase.
+   In
+   ``${CS1000_ADAC_DB}/Boards/Arm_Development_Boards/MPS3_Corstone_1000_=
ADAC_611/project_types.xml``,
+   add the following element alongside the existing ``dtsl_config`` para=
meter:
+
+    .. code-block:: xml
+
+        <secure_debug_manager type=3D"adac_sdc600" manifest=3D"CDB://../=
../../ATP/manifest.xml" device=3D"CSAPBCOM" reset_type=3D"nSRST"/>
+
+   This selects the built-in PSA-ADAC implementation, its authentication=
-token
+   provider, the SDC-600 communication device, and the board reset signa=
l.
+
+#. Describe the Corstone-1000 debug port as DPv3. In
+   ``${CS1000_ADAC_DB}/Boards/Arm_Development_Boards/MPS3_Corstone_1000_=
ADAC_611/MPS3_Corstone_1000.sdf``,
+   add the following item to the ``<device_info>`` block of the ``ARMCS-=
DP``
+   device:
+
+    .. code-block:: xml
=20
-#. Follow the instructions in the `Secure Debug Manager (PSA-ADAC / SDC-=
600)'s README <secure-debug-manager-repo-readme_>`__ for the development =
machine setup.
-   This setup must include building the Secure Debug Manager because the=
 built library completes the Arm Development Studio configuration.
+        <device_info_item name=3D"DP_VERSION">DPv3</device_info_item>
+
+   DPv3 is required so that Arm Development Studio uses the ADIv6 debug-=
port
+   addressing needed to reach ``CSAPBCOM``.
+
+   In the same file, give the copied platform a unique title:
+
+    .. code-block:: xml
+
+        <platform_info info_url=3D"" manufacturer=3D"Arm" title=3D"MPS3_=
Corstone_1000_ADAC_611"/>
=20
 #. Rebuild the software stack with Secure Debug.
=20
@@ -2177,16 +2217,15 @@ and `Arm Development Studio <arm-ds-website_>`__ =
versions 2022.2, 2022.c, or 202
         IComPortInit                  :  383 : warn  : init       : ICom=
PortInit: Blocked reading LPH2RA
=20
=20
-#. Connect the debug probe to the MPS3 using the 20-pin 1.27mm connector=
 with the ``CS_20W_1.27MM silkscreen`` label.
-
-#. Open a new Arm Development Studio IDE window and add the Secure Debug=
 Manager configuration database.
+#. Open a new Arm Development Studio IDE window and add the user configu=
ration
+   database.
=20
    #. Select ``Window`` > ``Preferences``.
    #. Expand ``Arm DS`` and select ``Configuration Database``.
    #. Select ``Add``.
    #. Enter a descriptive name, such as ``Corstone-1000 Secure Debug``.
       The name does not affect the connection.
-   #. Set ``Location`` to ``${WORKSPACE}/secure-debug-manager/arm_ds/DB`=
`.
+   #. Set ``Location`` to ``${WORKSPACE}/armds-cs1000-adac611``.
    #. Select ``OK`` to close the ``Add configuration database location``=
 dialog.
    #. Select ``Rebuild database``.
    #. Select ``Apply and Close``.
@@ -2197,16 +2236,41 @@ and `Arm Development Studio <arm-ds-website_>`__ =
versions 2022.2, 2022.c, or 202
    #. Select ``Hardware Connection``, then select ``Next``.
    #. Enter a descriptive debug connection name, then select ``Next``.
       The name does not affect the connection.
-   #. In ``Target Selection``, select ``MPS3_Corstone-1000_ADAC``.
+   #. In ``Target Selection``, select ``MPS3_Corstone_1000_ADAC_611``.
    #. Select ``Finish``.
=20
-#. Configure and start the debug connection.
+#. Configure one of the following external debug connections.
+
+   To use an external `ULINKpro D <arm-ulink-pro-d-website_>`__ probe:
=20
-   #. Select ``Arm`` > ``MPS3_Corstone-1000_ADAC`` > ``Bare Metal Debug`=
` > ``Cortex-A35``.
-   #. For ``Target Connection``, select ``ULINKpro``.
-   #. Select ``Browse...``.
-   #. In the ``Connection Browser``, select the name of the connected UL=
INKpro probe, then select ``Select``.
-   #. Select ``Debug``.
+   #. Connect the ULINKpro D probe to the MPS3 connector labelled
+      ``CS_20W_1.27MM``.
+   #. Select ``Arm`` > ``MPS3_Corstone_1000_ADAC_611`` >
+      ``Bare Metal Debug`` > ``Cortex-M0+``.
+   #. For ``Target Connection``, select ``ULINKpro D``.
+   #. Select ``Browse...``, select the detected ULINKpro D probe, and th=
en
+      select ``Select``.
+   #. Select ``JTAG/SWJ``, set the debug clock to ``500 kHz``, and selec=
t
+      ``Connect only``.
+
+   To use an external `DSTREAM <arm-dstream-website_>`__ probe:
+
+   #. Connect the DSTREAM probe to the MPS3 connector labelled
+      ``CS_20W_1.27MM``.
+   #. Select ``Arm`` > ``MPS3_Corstone_1000_ADAC_611`` >
+      ``Bare Metal Debug`` > ``Cortex-M0+``.
+   #. For ``Target Connection``, select ``DSTREAM``.
+   #. Select ``Browse...``, select the detected DSTREAM probe, and then =
select
+      ``Select``.
+   #. Select ``JTAG/SWJ``, set the debug clock to ``500 kHz``, and selec=
t
+      ``Connect only``.
+
+   In both cases, use ``Cortex-M0+`` because Secure Debug runs in the Se=
cure
+   Enclave. Do not select the host ``Cortex-A35`` connection.
+
+#. Select ``Debug``. Arm Development Studio resets the target using ``nS=
RST``
+   and the built-in Secure Debug Manager communicates with ``CSAPBCOM`` =
to
+   perform authentication.
=20
 #. Provide the paths to the private key and trust chain certificate when=
 asked by Arm Development Studio Console.
=20
@@ -2215,21 +2279,21 @@ and `Arm Development Studio <arm-ds-website_>`__ =
versions 2022.2, 2022.c, or 202
         ...
=20
         Please provide private key file path:
-        Enter file path > ${WORKSPACE}\secure-debug-manager\example\data=
\keys\EcdsaP256Key-3.pem
+        Enter file path > ${WORKSPACE}/secure-debug-manager/example/data=
/keys/EcdsaP256Key-3.pem
=20
         Please provide trust chain file path:
-        Enter file path > ${WORKSPACE}\secure-debug-manager\example\data=
\chains\chain.EcdsaP256-3
+        Enter file path > ${WORKSPACE}/secure-debug-manager/example/data=
/chains/chain.EcdsaP256-3
=20
         ...
=20
-#. When successful authenticated, Arm Development Studio will connect to=
 the running MPS3 and the debug features can be used.
-   The following prompt should appear in the Secure Enclave terminal (``=
ttyUSB1``):
+#. After authentication succeeds, verify that the image continues bootin=
g and
+   is not left waiting inside the Secure Debug authentication flow.
+   Authentication alone is not sufficient to pass the test. Confirm that=
 the
+   Host terminal reaches the Linux login prompt:
=20
     .. code-block:: console
=20
-        ...
-        boot_platform_init: Corstone-1000 Secure Debug is a success.
-        ...
+        corstone1000-mps3 login:
=20
=20
 --------------
@@ -2237,9 +2301,8 @@ and `Arm Development Studio <arm-ds-website_>`__ ve=
rsions 2022.2, 2022.c, or 202
 *Copyright (c) 2022-2026, Arm Limited. All rights reserved.*
=20
 .. _arm-developer-fvp: https://developer.arm.com/tools-and-software/open=
-source-software/arm-platforms-software/arm-ecosystem-fvps
-.. _secure-debug-manager-repo-readme: https://github.com/ARM-software/se=
cure-debug-manager/tree/master?tab=3Dreadme-ov-file#secure-debug-manager-=
psa-adac--sdc-600
-.. _secure-debug-manager-armds-integration: https://github.com/ARM-softw=
are/secure-debug-manager?tab=3Dreadme-ov-file#arm-development-studio-inte=
gration
 .. _meta-arm-repository-release-branch: https://docs.yoctoproject.org/ne=
xt/migration-guides/migration-6.0.html
-.. _arm-ulink-pro-website: https://www.arm.com/products/development-tool=
s/debug-probes/ulink-pro
 .. _arm-ds-website: https://www.arm.com/products/development-tools/embed=
ded-and-software/arm-development-studio
+.. _arm-ulink-pro-d-website: https://www.arm.com/products/development-to=
ols/debug-probes/ulink-pro
+.. _arm-dstream-website: https://www.arm.com/products/development-tools/=
debug-probes/dstream-st
 .. _edk2-repository: https://github.com/tianocore/edk2
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0016-platform-corstone1000-Optionally-skip-provisioning.patch b/meta-a=
rm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0016-platform-co=
rstone1000-Optionally-skip-provisioning.patch
new file mode 100644
index 00000000..da808b9a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0016=
-platform-corstone1000-Optionally-skip-provisioning.patch
@@ -0,0 +1,68 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Ahmed Gomaa <ahmed.gomaa@arm.com>
+Date: Wed, 2 Sep 2026 12:00:00 +0100
+Subject: [PATCH] platform: corstone1000: keep CM during secure debug
+
+Add a temporary Corstone-1000 Secure Debug workaround that skips runtime
+TF-M provisioning when Secure Debug is enabled. This keeps the device in
+the CM lifecycle state and avoids the provisioning reset, allowing the
+authenticated debug session to remain active.
+
+Keep this workaround until a reset-safe architecture is implemented to
+preserve the authenticated DCU_EN value across reset and apply it from B=
L2.
+
+Upstream-Status: Inappropriate [temporary platform workaround]
+Signed-off-by: Ahmed Gomaa <ahmed.gomaa@arm.com>
+---
+ secure_fw/spm/CMakeLists.txt |  1 +
+ secure_fw/spm/core/main.c    | 10 ++++++++++
+ 2 files changed, 11 insertions(+)
+
+diff --git a/secure_fw/spm/CMakeLists.txt b/secure_fw/spm/CMakeLists.txt
+--- a/secure_fw/spm/CMakeLists.txt
++++ b/secure_fw/spm/CMakeLists.txt
+@@ -111,6 +111,7 @@ target_compile_definitions(tfm_spm
+         $<$<STREQUAL:${CONFIG_TFM_BRANCH_PROTECTION_FEAT},BRANCH_PROTEC=
TION_PACRET_LEAF>:BRANCH_PROTECTION_CONTROL=3D2>
+         $<$<STREQUAL:${CONFIG_TFM_BRANCH_PROTECTION_FEAT},BRANCH_PROTEC=
TION_BTI>:BRANCH_PROTECTION_CONTROL=3D3>
+         $<$<BOOL:${PLATFORM_PSA_ADAC_SECURE_DEBUG}>:PLATFORM_PSA_ADAC_S=
ECURE_DEBUG>
++        $<$<BOOL:${CORSTONE1000_SKIP_PROVISIONING_FOR_DEBUG}>:CORSTONE1=
000_SKIP_PROVISIONING_FOR_DEBUG>
+         $<$<BOOL:${CONFIG_TFM_REUSE_COPY_AREA_FOR_SP_STACKS}>:CONFIG_TF=
M_REUSE_COPY_AREA_FOR_SP_STACKS>
+         $<$<BOOL:${TFM_TZ_REENTRANCY_CHECK}>:TFM_TZ_REENTRANCY_CHECK>
+ )
+diff --git a/secure_fw/spm/core/main.c b/secure_fw/spm/core/main.c
+--- a/secure_fw/spm/core/main.c
++++ b/secure_fw/spm/core/main.c
+@@ -31,7 +31,9 @@ static fih_ret tfm_core_init(void)
+ {
+     enum tfm_plat_err_t plat_err =3D TFM_PLAT_ERR_SYSTEM_ERR;
+     FIH_DECLARE(fih_rc, FIH_FAILURE);
++#ifndef CORSTONE1000_SKIP_PROVISIONING_FOR_DEBUG
+     bool provisioning_required;
++#endif
+=20
+     /*
+      * Access to any peripheral should be performed after programming
+@@ -65,6 +67,7 @@ static fih_ret tfm_core_init(void)
+         FIH_RET(SPM_ERROR_GENERIC);
+     }
+=20
++#ifndef CORSTONE1000_SKIP_PROVISIONING_FOR_DEBUG
+     /* Perform provisioning. */
+     plat_err =3D tfm_plat_provisioning_is_required(&provisioning_requir=
ed);
+     if (plat_err !=3D TFM_PLAT_ERR_SUCCESS) {
+@@ -77,6 +80,12 @@ static fih_ret tfm_core_init(void)
+             FIH_RET(SPM_ERROR_GENERIC);
+         }
+     }
++#else
++    /* Temporary workaround: retain CM and avoid the provisioning reset=
. */
++    WARN("Skipping TF-M provisioning for Secure Debug workaround. "
++            "Device remains unprovisioned and must not be used in "
++            "production.\n");
++#endif
+=20
+     TFM_COVERITY_DEVIATE_LINE(MISRA_C_2023_Rule_2_2, "Parameters can be=
 changed by user and this code will make effect")
+     tfm_plat_provisioning_check_for_dummy_keys();
+--=20
+2.43.0
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 0ecb75a2..3422163d 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -28,6 +28,9 @@ EXTRA_OECMAKE +=3D "-DPLATFORM_IS_FVP=3D${TFM_PLATFORM_=
IS_FVP}"
 EXTRA_OECMAKE +=3D "-DCC312_LEGACY_DRIVER_API_ENABLED=3DOFF"
 EXTRA_OECMAKE:append =3D " -DENABLE_MULTICORE=3D${@bb.utils.contains('MA=
CHINE_FEATURES', 'corstone1000_smp', 'TRUE', 'FALSE', d)}"
 EXTRA_OECMAKE:append:corstone1000-mps3 =3D " -DPLATFORM_PSA_ADAC_SECURE_=
DEBUG=3D${@bb.utils.contains('MACHINE_FEATURES', 'secure-debug', 'ON', 'O=
FF', d)}"
+# Keep the device in CM until authenticated DCU_EN can be preserved acro=
ss
+# reset and applied from BL2.
+EXTRA_OECMAKE:append:corstone1000-mps3 =3D " -DCORSTONE1000_SKIP_PROVISI=
ONING_FOR_DEBUG=3D${@bb.utils.contains('MACHINE_FEATURES', 'secure-debug'=
, 'ON', 'OFF', d)}"
 EXTRA_OECMAKE:append:corstone1000-mps3 =3D " -DPLATFORM_PSA_ADAC_SOURCE_=
PATH=3D${S}/external/tfm-psa-adac -DPLATFORM_PSA_ADAC_BUILD_PATH=3D${B}/t=
fm-psa-adac-build"
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
@@ -47,6 +50,7 @@ SRC_URI:append:corstone1000 =3D " \
     file://0013-plat-cs1k-Remove-unused-FWU-partitions-upon-version-.pat=
ch \
     file://0014-plat-cs1k-Duplicate-old-images-in-FWU.patch \
     file://0015-platform-corstone1000-Increase-FIP-partition-size.patch =
\
+    file://0016-platform-corstone1000-Optionally-skip-provisioning.patch=
 \
     "
=20
 FILESEXTRAPATHS:prepend:corstone1000-mps3 :=3D "${THISDIR}/files/corston=
e1000/psa-adac:"

