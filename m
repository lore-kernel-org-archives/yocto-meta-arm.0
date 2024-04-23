Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C388C4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 16:33:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.23383.1713890000930721272
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Apr 2024 09:33:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 660AB339;
	Tue, 23 Apr 2024 09:33:48 -0700 (PDT)
Received: from FWLNXWH7M5.arm.com (unknown [10.57.21.110])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9BFEF3F7BD;
	Tue, 23 Apr 2024 09:33:19 -0700 (PDT)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <Gyorgy.Szing@arm.com>
Subject: [PATCH 2/9] arm/trusted-services: Update TS to v1.0.0
Date: Tue, 23 Apr 2024 18:31:58 +0200
Message-ID: <20240423163205.5885-2-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240423163205.5885-1-gyorgy.szing@arm.com>
References: <20240423163205.5885-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Apr 2024 16:33:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5587

From: Gyorgy Szing <Gyorgy.Szing@arm.com>

- Update Trusted Services to v1.0.0.
- Update TS "external components" references to fetch the version
  dictated by the TS repo.
- Remove patches merged up-stream.
- Update the TS nanopb integration fix (see 210a6ace8325)
- Update TS test integration.

Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
---
 documentation/trusted-services.md             |    2 +-
 .../oeqa/runtime/cases/trusted_services.py    |   15 +-
 .../recipes-security/optee/optee-os-ts.inc    |   13 +-
 ...-boot-order-property-to-SP-manifests.patch | 1005 +++++++++++++++++
 ...ch-allow-setting-the-cmake-generator.patch |   46 -
 ...Limit-nanopb-build-to-single-process.patch |   41 -
 ...ch =3D> 0001-Upgrade-nanopb-to-v0.4.7.patch} |   96 +-
 .../trusted-services/trusted-services-src.inc |   18 +-
 .../trusted-services/trusted-services.inc     |   20 +-
 .../ts-psa-api-test-common_git.inc            |    2 +-
 .../trusted-services/ts-sp-common.inc         |   12 +-
 .../trusted-services/ts-sp-spm-test4_git.bb   |    6 +
 .../trusted-services/ts-uuid.inc              |    1 +
 13 files changed, 1136 insertions(+), 141 deletions(-)
 create mode 100644 meta-arm/recipes-security/trusted-services/files/0001=
-Add-boot-order-property-to-SP-manifests.patch
 delete mode 100644 meta-arm/recipes-security/trusted-services/files/0001=
-LazyFetch-allow-setting-the-cmake-generator.patch
 delete mode 100644 meta-arm/recipes-security/trusted-services/files/0001=
-Limit-nanopb-build-to-single-process.patch
 rename meta-arm/recipes-security/trusted-services/files/{nanopb-upgrade.=
patch =3D> 0001-Upgrade-nanopb-to-v0.4.7.patch} (56%)
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-sp-spm-=
test4_git.bb

diff --git a/documentation/trusted-services.md b/documentation/trusted-se=
rvices.md
index a3732713..f672dc2e 100644
--- a/documentation/trusted-services.md
+++ b/documentation/trusted-services.md
@@ -22,7 +22,7 @@ features for each [Secure Partition][^2] you would like=
 to include:
 | Protected Storage | ts-storage      |
 | se-proxy          | ts-se-proxy     |
 | smm-gateway       | ts-smm-gateway  |
-| spm-test[1-3]     | optee-spmc-test |
+| spm-test[1-4]     | optee-spmc-test |
=20
 Other steps depend on your machine/platform definition:
=20
diff --git a/meta-arm/lib/oeqa/runtime/cases/trusted_services.py b/meta-a=
rm/lib/oeqa/runtime/cases/trusted_services.py
index 88298956..bfb42d69 100644
--- a/meta-arm/lib/oeqa/runtime/cases/trusted_services.py
+++ b/meta-arm/lib/oeqa/runtime/cases/trusted_services.py
@@ -28,9 +28,7 @@ class TrustedServicesTest(OERuntimeTestCase):
     @OEHasPackage(['ts-psa-crypto-api-test'])
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_03_psa_crypto_api_test(self):
-        # There are a two expected PSA Crypto tests failures testing fea=
tures
-        # TS will not support.
-        self.run_test_tool('psa-crypto-api-test', expected_status=3D46)
+        self.run_test_tool('psa-crypto-api-test')
=20
     @OEHasPackage(['ts-psa-its-api-test'])
     @OETestDepends(['ssh.SSHTest.test_ssh'])
@@ -53,13 +51,12 @@ class TrustedServicesTest(OERuntimeTestCase):
     def test_09_ts_service_grp_check(self):
         # If this test fails, available test groups in ts-service-test h=
ave changed and all
         # tests using the test executable need to be double checked to e=
nsure test group to
-        # TS SP mapping is still valid.=20
+        # TS SP mapping is still valid.
         test_grp_list=3D"FwuServiceTests PsServiceTests ItsServiceTests =
AttestationProvisioningTests"
         test_grp_list+=3D" AttestationServiceTests CryptoKeyDerivationSe=
rvicePackedcTests"
         test_grp_list+=3D" CryptoMacServicePackedcTests CryptoCipherServ=
icePackedcTests"
         test_grp_list+=3D" CryptoHashServicePackedcTests CryptoServicePa=
ckedcTests"
         test_grp_list+=3D" CryptoServiceProtobufTests CryptoServiceLimit=
Tests"
-        test_grp_list+=3D" DiscoveryServiceTests"
         self.run_test_tool('ts-service-test -lg', expected_output=3Dtest=
_grp_list)
=20
     @OEHasPackage(['optee-test'])
@@ -110,11 +107,3 @@ class TrustedServicesTest(OERuntimeTestCase):
                     "CryptoCipherServicePackedcTests", "CryptoHashServic=
ePackedcTests", \
                     "CryptoServicePackedcTests", "CryptoServiceProtobufT=
ests CryptoServiceLimitTests"]:
             self.run_test_tool('ts-service-test -g %s'%grp)
-
-    @OEHasPackage(['ts-service-test'])
-    @OETestDepends(['ssh.SSHTest.test_ssh'])
-    def test_16_discovery_service_test(self):
-        if 'ts-crypto' not in self.tc.td['MACHINE_FEATURES'] and \
-           'ts-se-proxy' not in self.tc.td['MACHINE_FEATURES']:
-            self.skipTest('Crypto SP is not included into OPTEE')
-        self.run_test_tool('ts-service-test -g DiscoveryServiceTests')
diff --git a/meta-arm/recipes-security/optee/optee-os-ts.inc b/meta-arm/r=
ecipes-security/optee/optee-os-ts.inc
index ce5b8b86..c6b806ff 100644
--- a/meta-arm/recipes-security/optee/optee-os-ts.inc
+++ b/meta-arm/recipes-security/optee/optee-os-ts.inc
@@ -53,9 +53,14 @@ SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEA=
TURES', 'ts-smm-gateway', \
=20
 # SPM test SPs
 DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee-spm=
c-test', \
-                                        ' ts-sp-spm-test1 ts-sp-spm-test=
2 ts-sp-spm-test3', '' , d)}"
+                                        ' ts-sp-spm-test1 ts-sp-spm-test=
2 \
+                                          ts-sp-spm-test3 ts-sp-spm-test=
4', '' , d)}"
 SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee-spm=
c-test', \
-                                        ' ${TS_BIN}/${SPM_TEST1_UUID}.st=
ripped.elf ${TS_BIN}/${SPM_TEST2_UUID}.stripped.elf ${TS_BIN}/${SPM_TEST3=
_UUID}.stripped.elf', '', d)}"
+                            ' ${TS_BIN}/${SPM_TEST1_UUID}.stripped.elf \
+                              ${TS_BIN}/${SPM_TEST2_UUID}.stripped.elf \
+                              ${TS_BIN}/${SPM_TEST3_UUID}.stripped.elf \
+                              ${TS_BIN}/${SPM_TEST4_UUID}.stripped.elf',=
 \
+                              '', d)}"
 EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
                                         ' CFG_SPMC_TESTS=3Dy', '' , d)}"
=20
@@ -66,4 +71,6 @@ DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEAT=
URES', 'ts-block-storage',
 SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-block-=
storage', \
                                         ' ${TS_BIN}/${BLOCK_STORAGE_UUID=
}.stripped.elf', '', d)}"
=20
-EXTRA_OEMAKE:append =3D "${@oe.utils.conditional('SP_PATHS', '', '', ' C=
FG_MAP_EXT_DT_SECURE=3Dy CFG_SECURE_PARTITION=3Dy SP_PATHS=3D"${SP_PATHS}=
" ', d)}"
+EXTRA_OEMAKE:append =3D "${@oe.utils.conditional('SP_PATHS', '', '', \
+                        ' CFG_MAP_EXT_DT_SECURE=3Dy CFG_SECURE_PARTITION=
=3Dy \
+                         SP_PATHS=3D"${SP_PATHS}" ', d)}"
diff --git a/meta-arm/recipes-security/trusted-services/files/0001-Add-bo=
ot-order-property-to-SP-manifests.patch b/meta-arm/recipes-security/trust=
ed-services/files/0001-Add-boot-order-property-to-SP-manifests.patch
new file mode 100644
index 00000000..dc4a4a1b
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/files/0001-Add-boot-orde=
r-property-to-SP-manifests.patch
@@ -0,0 +1,1005 @@
+From b8a6c54f519fce1651bd9d5d43884e62708f825d Mon Sep 17 00:00:00 2001
+From: Gabor Toth <gabor.toth2@arm.com>
+Date: Thu, 14 Mar 2024 11:09:19 +0100
+Subject: [PATCH 1/1] Add boot-order property to SP manifests
+
+Capture the boot-order in the SP manifest files for each SP to help
+portability. The legacy way to set the boot order is integration
+system, packaging method and SPMC implementation specific.
+
+The boot order of SP is dictated by service dependency and relative
+boot order of TS SPs should be as follows:
+
+1 - block-storage
+1 - se-proxy (corstone1000-opteesp)
+2 - se-proxy (default-opteesp or default-sp)
+2 - internal-trusted-storage
+3 - protected-storage
+4 - crypto
+5 - attestation
+6 - se-proxy
+7 - fwu
+8 - smm-gateway
+
+Signed-off-by: Gabor Toth <gabor.toth2@arm.com>
+Change-Id: I4b93015c68e7261fdc87434a6c7f4ec86965af54
+
+Upstream-Status: Backport 7e4babed40dc686ae38d3fe35459e7417717d880
+---
+ components/service/spm_test/spm_test.cmake               | 1 +
+ .../attestation/config/default-opteesp/CMakeLists.txt    | 2 ++
+ .../config/default-opteesp/default_attestation.dts.in    | 1 +
+ deployments/attestation/config/default-sp/CMakeLists.txt | 2 ++
+ .../config/default-sp/default_attestation.dts.in         | 1 +
+ .../block-storage/config/cfi-flash-optee/CMakeLists.txt  | 2 ++
+ .../config/cfi-flash-optee/default_block-storage.dts.in  | 1 +
+ .../block-storage/config/default-opteesp/CMakeLists.txt  | 2 ++
+ .../config/default-opteesp/default_block-storage.dts.in  | 1 +
+ .../block-storage/config/default-sp/CMakeLists.txt       | 2 ++
+ .../config/default-sp/default_block-storage.dts.in       | 1 +
+ .../config/edk2-secure-flash-opteesp/CMakeLists.txt      | 2 ++
+ .../default_block-storage.dts.in                         | 1 +
+ .../config/semihosted-opteesp/CMakeLists.txt             | 2 ++
+ .../semihosted-opteesp/default_block-storage.dts.in      | 1 +
+ deployments/crypto/config/default-opteesp/CMakeLists.txt | 2 ++
+ .../crypto/config/default-opteesp/default_crypto.dts.in  | 1 +
+ deployments/crypto/config/default-sp/CMakeLists.txt      | 2 ++
+ .../crypto/config/default-sp/default_crypto.dts.in       | 1 +
+ .../default_env-test.dts.in                              | 1 +
+ .../baremetal-fvp_base_revc-sp/default_env-test.dts.in   | 1 +
+ .../config/n1sdp-opteesp/default_env-test.dts.in         | 1 +
+ deployments/fwu/config/default-opteesp/CMakeLists.txt    | 2 ++
+ .../fwu/config/default-opteesp/default_fwu.dts.in        | 1 +
+ deployments/fwu/config/default-sp/CMakeLists.txt         | 2 ++
+ deployments/fwu/config/default-sp/default_fwu.dts.in     | 1 +
+ .../config/default-opteesp/CMakeLists.txt                | 2 ++
+ .../default_internal-trusted-storage.dts.in              | 1 +
+ .../config/default-sp/CMakeLists.txt                     | 2 ++
+ .../default-sp/default_internal-trusted-storage.dts.in   | 1 +
+ .../config/shared-flash-opteesp/CMakeLists.txt           | 2 ++
+ .../default_internal-trusted-storage.dts.in              | 1 +
+ .../config/default-opteesp/CMakeLists.txt                | 2 ++
+ .../default-opteesp/default_protected-storage.dts.in     | 1 +
+ .../protected-storage/config/default-sp/CMakeLists.txt   | 2 ++
+ .../config/default-sp/default_protected-storage.dts.in   | 1 +
+ .../config/shared-flash-opteesp/CMakeLists.txt           | 2 ++
+ .../default_protected-storage.dts.in                     | 1 +
+ .../se-proxy/config/corstone1000-opteesp/CMakeLists.txt  | 2 ++
+ .../config/corstone1000-opteesp/default_se-proxy.dts.in  | 1 +
+ .../se-proxy/config/default-opteesp/CMakeLists.txt       | 2 ++
+ .../config/default-opteesp/default_se-proxy.dts.in       | 1 +
+ deployments/se-proxy/config/default-sp/CMakeLists.txt    | 2 ++
+ .../se-proxy/config/default-sp/default_se-proxy.dts.in   | 1 +
+ deployments/sfs-demo/opteesp/default_sfs-demo.dts.in     | 1 +
+ deployments/sfs-demo/sp/default_sfs-demo.dts.in          | 1 +
+ .../smm-gateway/config/default-opteesp/CMakeLists.txt    | 2 ++
+ .../config/default-opteesp/default_smm-gateway.dts.in    | 1 +
+ deployments/smm-gateway/config/default-sp/CMakeLists.txt | 3 +++
+ .../config/default-sp/default_smm-gateway.dts.in         | 1 +
+ deployments/spm-test1/opteesp/CMakeLists.txt             | 1 +
+ deployments/spm-test1/opteesp/default_spm_test1.dts.in   | 1 +
+ deployments/spm-test2/opteesp/CMakeLists.txt             | 1 +
+ deployments/spm-test2/opteesp/default_spm_test2.dts.in   | 1 +
+ deployments/spm-test3/opteesp/CMakeLists.txt             | 2 ++
+ deployments/spm-test3/opteesp/default_spm_test3.dts.in   | 1 +
+ deployments/spm-test4/opteesp/CMakeLists.txt             | 1 +
+ deployments/spm-test4/opteesp/default_spm_test4.dts.in   | 1 +
+ tools/cmake/common/ExportSp.cmake                        | 9 ++++++++-
+ 59 files changed, 90 insertions(+), 1 deletion(-)
+
+diff --git a/components/service/spm_test/spm_test.cmake b/components/ser=
vice/spm_test/spm_test.cmake
+index e8a1ccd48..7cb7e667a 100644
+--- a/components/service/spm_test/spm_test.cmake
++++ b/components/service/spm_test/spm_test.cmake
+@@ -70,4 +70,5 @@ export_sp(
+ 	MK_IN ${TS_ROOT}/environments/opteesp/sp.mk.in
+ 	DTS_IN ${TS_ROOT}/deployments/spm-test${SP_NUMBER}/opteesp/default_spm=
_test${SP_NUMBER}.dts.in
+ 	JSON_IN ${TS_ROOT}/environments/opteesp/sp_pkg.json.in
++	SP_BOOT_ORDER ${SP_BOOT_ORDER}
+ )
+diff --git a/deployments/attestation/config/default-opteesp/CMakeLists.t=
xt b/deployments/attestation/config/default-opteesp/CMakeLists.txt
+index 58ecb3412..7e13465dd 100644
+--- a/deployments/attestation/config/default-opteesp/CMakeLists.txt
++++ b/deployments/attestation/config/default-opteesp/CMakeLists.txt
+@@ -23,6 +23,7 @@ target_include_directories(attestation PRIVATE "${TOP_=
LEVEL_INCLUDE_DIRS}")
+ set(SP_BIN_UUID_CANON "a1baf155-8876-4695-8f7c-54955e8db974")
+ set(SP_FFA_UUID_CANON "${TS_RPC_UUID_CANON}")
+ set(SP_HEAP_SIZE "32 * 1024" CACHE STRING "SP heap size in bytes")
++set(SP_BOOT_ORDER "5")
+ set(TRACE_PREFIX "ATT" CACHE STRING "Trace prefix")
+=20
+ target_include_directories(attestation PRIVATE
+@@ -90,6 +91,7 @@ include(${TS_ROOT}/tools/cmake/common/ExportSp.cmake)
+ export_sp(
+ 	SP_FFA_UUID_CANON ${SP_FFA_UUID_CANON}
+ 	SP_BIN_UUID_CANON ${SP_BIN_UUID_CANON}
++	SP_BOOT_ORDER ${SP_BOOT_ORDER}
+ 	SP_NAME "attestation"
+ 	MK_IN ${TS_ROOT}/environments/opteesp/sp.mk.in
+ 	DTS_IN ${CMAKE_CURRENT_LIST_DIR}/default_attestation.dts.in
+diff --git a/deployments/attestation/config/default-opteesp/default_atte=
station.dts.in b/deployments/attestation/config/default-opteesp/default_a=
ttestation.dts.in
+index 3a2ac76c9..e310cc672 100644
+--- a/deployments/attestation/config/default-opteesp/default_attestation=
.dts.in
++++ b/deployments/attestation/config/default-opteesp/default_attestation=
.dts.in
+@@ -15,6 +15,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AArch64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+ 	elf-format =3D <1>;
+diff --git a/deployments/attestation/config/default-sp/CMakeLists.txt b/=
deployments/attestation/config/default-sp/CMakeLists.txt
+index cdcbdcd71..43d880546 100644
+--- a/deployments/attestation/config/default-sp/CMakeLists.txt
++++ b/deployments/attestation/config/default-sp/CMakeLists.txt
+@@ -28,6 +28,7 @@ set(SP_FFA_UUID_CANON "${TS_RPC_UUID_CANON}")
+ set(TRACE_PREFIX "ATT" CACHE STRING "Trace prefix")
+ set(SP_STACK_SIZE "64 * 1024" CACHE STRING "Stack size")
+ set(SP_HEAP_SIZE "32 * 1024" CACHE STRING "Heap size")
++set(SP_BOOT_ORDER "5")
+=20
+ #----------------------------------------------------------------------=
---------
+ #  Default deployment specific configuration
+@@ -90,6 +91,7 @@ include(${TS_ROOT}/tools/cmake/common/ExportSp.cmake)
+ export_sp(
+ 	SP_FFA_UUID_CANON ${SP_FFA_UUID_CANON}
+ 	SP_BIN_UUID_CANON ${SP_BIN_UUID_CANON}
++	SP_BOOT_ORDER ${SP_BOOT_ORDER}
+ 	SP_NAME ${SP_NAME}
+ 	DTS_IN ${CMAKE_CURRENT_LIST_DIR}/default_${SP_NAME}.dts.in
+ 	DTS_MEM_REGIONS ${SP_BIN_UUID_CANON}_memory_regions.dtsi
+diff --git a/deployments/attestation/config/default-sp/default_attestati=
on.dts.in b/deployments/attestation/config/default-sp/default_attestation=
.dts.in
+index 2e16f7ed9..e8383aec1 100644
+--- a/deployments/attestation/config/default-sp/default_attestation.dts.=
in
++++ b/deployments/attestation/config/default-sp/default_attestation.dts.=
in
+@@ -15,6 +15,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AArch64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+=20
+diff --git a/deployments/block-storage/config/cfi-flash-optee/CMakeLists=
.txt b/deployments/block-storage/config/cfi-flash-optee/CMakeLists.txt
+index b6501f25d..53bd07839 100644
+--- a/deployments/block-storage/config/cfi-flash-optee/CMakeLists.txt
++++ b/deployments/block-storage/config/cfi-flash-optee/CMakeLists.txt
+@@ -28,6 +28,7 @@ target_include_directories(block-storage PRIVATE "${TO=
P_LEVEL_INCLUDE_DIRS}")
+ set(SP_BIN_UUID_CANON "63646e80-eb52-462f-ac4f-8cdf3987519c")
+ set(SP_FFA_UUID_CANON "${TS_RPC_UUID_CANON}")
+ set(SP_HEAP_SIZE "120 * 1024" CACHE STRING "SP heap size in bytes")
++set(SP_BOOT_ORDER "1")
+ set(TRACE_PREFIX "BLOCK" CACHE STRING "Trace prefix")
+=20
+ target_include_directories(block-storage PRIVATE
+@@ -95,6 +96,7 @@ include(${TS_ROOT}/tools/cmake/common/ExportSp.cmake)
+ export_sp(
+ 	SP_FFA_UUID_CANON ${SP_FFA_UUID_CANON}
+ 	SP_BIN_UUID_CANON ${SP_BIN_UUID_CANON}
++	SP_BOOT_ORDER ${SP_BOOT_ORDER}
+ 	SP_NAME "block-storage"
+ 	MK_IN ${TS_ROOT}/environments/opteesp/sp.mk.in
+ 	DTS_IN ${CMAKE_CURRENT_LIST_DIR}/default_block-storage.dts.in
+diff --git a/deployments/block-storage/config/cfi-flash-optee/default_bl=
ock-storage.dts.in b/deployments/block-storage/config/cfi-flash-optee/def=
ault_block-storage.dts.in
+index 0a97cb53e..287ecb032 100644
+--- a/deployments/block-storage/config/cfi-flash-optee/default_block-sto=
rage.dts.in
++++ b/deployments/block-storage/config/cfi-flash-optee/default_block-sto=
rage.dts.in
+@@ -15,6 +15,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AArch64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+ 	elf-format =3D <1>;
+diff --git a/deployments/block-storage/config/default-opteesp/CMakeLists=
.txt b/deployments/block-storage/config/default-opteesp/CMakeLists.txt
+index 5592dcd0a..7702492fa 100644
+--- a/deployments/block-storage/config/default-opteesp/CMakeLists.txt
++++ b/deployments/block-storage/config/default-opteesp/CMakeLists.txt
+@@ -21,6 +21,7 @@ target_include_directories(block-storage PRIVATE "${TO=
P_LEVEL_INCLUDE_DIRS}")
+ set(SP_BIN_UUID_CANON "63646e80-eb52-462f-ac4f-8cdf3987519c")
+ set(SP_FFA_UUID_CANON "${TS_RPC_UUID_CANON}")
+ set(SP_HEAP_SIZE "120 * 1024" CACHE STRING "SP heap size in bytes")
++set(SP_BOOT_ORDER "1")
+ set(TRACE_PREFIX "BLOCK" CACHE STRING "Trace prefix")
+=20
+ target_include_directories(block-storage PRIVATE
+@@ -73,6 +74,7 @@ include(${TS_ROOT}/tools/cmake/common/ExportSp.cmake)
+ export_sp(
+ 	SP_FFA_UUID_CANON ${SP_FFA_UUID_CANON}
+ 	SP_BIN_UUID_CANON ${SP_BIN_UUID_CANON}
++	SP_BOOT_ORDER ${SP_BOOT_ORDER}
+ 	SP_NAME "block-storage"
+ 	MK_IN ${TS_ROOT}/environments/opteesp/sp.mk.in
+ 	DTS_IN ${CMAKE_CURRENT_LIST_DIR}/default_block-storage.dts.in
+diff --git a/deployments/block-storage/config/default-opteesp/default_bl=
ock-storage.dts.in b/deployments/block-storage/config/default-opteesp/def=
ault_block-storage.dts.in
+index 0a97cb53e..287ecb032 100644
+--- a/deployments/block-storage/config/default-opteesp/default_block-sto=
rage.dts.in
++++ b/deployments/block-storage/config/default-opteesp/default_block-sto=
rage.dts.in
+@@ -15,6 +15,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AArch64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+ 	elf-format =3D <1>;
+diff --git a/deployments/block-storage/config/default-sp/CMakeLists.txt =
b/deployments/block-storage/config/default-sp/CMakeLists.txt
+index 2241c9c46..2f9c85ca7 100644
+--- a/deployments/block-storage/config/default-sp/CMakeLists.txt
++++ b/deployments/block-storage/config/default-sp/CMakeLists.txt
+@@ -26,6 +26,7 @@ set(SP_BIN_UUID_CANON "63646e80-eb52-462f-ac4f-8cdf398=
7519c")
+ set(SP_FFA_UUID_CANON "${TS_RPC_UUID_CANON}")
+ set(SP_HEAP_SIZE "120 * 1024" CACHE STRING "SP heap size in bytes")
+ set(SP_STACK_SIZE "64 * 1024" CACHE STRING "Stack size")
++set(SP_BOOT_ORDER "1")
+ set(TRACE_PREFIX "BLOCK" CACHE STRING "Trace prefix")
+=20
+ #----------------------------------------------------------------------=
---------
+@@ -78,6 +79,7 @@ include(${TS_ROOT}/tools/cmake/common/ExportSp.cmake R=
EQUIRED)
+ export_sp(
+ 	SP_FFA_UUID_CANON ${SP_FFA_UUID_CANON}
+ 	SP_BIN_UUID_CANON ${SP_BIN_UUID_CANON}
++	SP_BOOT_ORDER ${SP_BOOT_ORDER}
+ 	SP_NAME ${SP_NAME}
+ 	DTS_IN ${CMAKE_CURRENT_LIST_DIR}/default_${SP_NAME}.dts.in
+ 	DTS_MEM_REGIONS ${SP_BIN_UUID_CANON}_memory_regions.dtsi
+diff --git a/deployments/block-storage/config/default-sp/default_block-s=
torage.dts.in b/deployments/block-storage/config/default-sp/default_block=
-storage.dts.in
+index 5d1cf5d08..916925bf3 100644
+--- a/deployments/block-storage/config/default-sp/default_block-storage.=
dts.in
++++ b/deployments/block-storage/config/default-sp/default_block-storage.=
dts.in
+@@ -15,6 +15,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AArch64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+=20
+diff --git a/deployments/block-storage/config/edk2-secure-flash-opteesp/=
CMakeLists.txt b/deployments/block-storage/config/edk2-secure-flash-optee=
sp/CMakeLists.txt
+index 5b8bedf69..bba970cee 100644
+--- a/deployments/block-storage/config/edk2-secure-flash-opteesp/CMakeLi=
sts.txt
++++ b/deployments/block-storage/config/edk2-secure-flash-opteesp/CMakeLi=
sts.txt
+@@ -32,6 +32,7 @@ target_include_directories(block-storage PRIVATE "${TO=
P_LEVEL_INCLUDE_DIRS}")
+ set(SP_BIN_UUID_CANON "63646e80-eb52-462f-ac4f-8cdf3987519c")
+ set(SP_FFA_UUID_CANON "${TS_RPC_UUID_CANON}")
+ set(SP_HEAP_SIZE "120 * 1024" CACHE STRING "SP heap size in bytes")
++set(SP_BOOT_ORDER "1")
+ set(TRACE_PREFIX "BLOCK" CACHE STRING "Trace prefix")
+=20
+ target_include_directories(block-storage PRIVATE
+@@ -96,6 +97,7 @@ include(${TS_ROOT}/tools/cmake/common/ExportSp.cmake)
+ export_sp(
+ 	SP_FFA_UUID_CANON ${SP_FFA_UUID_CANON}
+ 	SP_BIN_UUID_CANON ${SP_BIN_UUID_CANON}
++	SP_BOOT_ORDER ${SP_BOOT_ORDER}
+ 	SP_NAME "block-storage"
+ 	MK_IN ${TS_ROOT}/environments/opteesp/sp.mk.in
+ 	DTS_IN ${CMAKE_CURRENT_LIST_DIR}/default_block-storage.dts.in
+diff --git a/deployments/block-storage/config/edk2-secure-flash-opteesp/=
default_block-storage.dts.in b/deployments/block-storage/config/edk2-secu=
re-flash-opteesp/default_block-storage.dts.in
+index 0a97cb53e..287ecb032 100644
+--- a/deployments/block-storage/config/edk2-secure-flash-opteesp/default=
_block-storage.dts.in
++++ b/deployments/block-storage/config/edk2-secure-flash-opteesp/default=
_block-storage.dts.in
+@@ -15,6 +15,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AArch64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+ 	elf-format =3D <1>;
+diff --git a/deployments/block-storage/config/semihosted-opteesp/CMakeLi=
sts.txt b/deployments/block-storage/config/semihosted-opteesp/CMakeLists.=
txt
+index 2be517640..fe7b48dc8 100644
+--- a/deployments/block-storage/config/semihosted-opteesp/CMakeLists.txt
++++ b/deployments/block-storage/config/semihosted-opteesp/CMakeLists.txt
+@@ -27,6 +27,7 @@ target_include_directories(block-storage PRIVATE "${TO=
P_LEVEL_INCLUDE_DIRS}")
+ set(SP_BIN_UUID_CANON "63646e80-eb52-462f-ac4f-8cdf3987519c")
+ set(SP_FFA_UUID_CANON "${TS_RPC_UUID_CANON}")
+ set(SP_HEAP_SIZE "120 * 1024" CACHE STRING "SP heap size in bytes")
++set(SP_BOOT_ORDER "1")
+ set(TRACE_PREFIX "BLOCK" CACHE STRING "Trace prefix")
+=20
+ target_include_directories(block-storage PRIVATE
+@@ -92,6 +93,7 @@ include(${TS_ROOT}/tools/cmake/common/ExportSp.cmake)
+ export_sp(
+ 	SP_FFA_UUID_CANON ${SP_FFA_UUID_CANON}
+ 	SP_BIN_UUID_CANON ${SP_BIN_UUID_CANON}
++	SP_BOOT_ORDER ${SP_BOOT_ORDER}
+ 	SP_NAME "block-storage"
+ 	MK_IN ${TS_ROOT}/environments/opteesp/sp.mk.in
+ 	DTS_IN ${CMAKE_CURRENT_LIST_DIR}/default_block-storage.dts.in
+diff --git a/deployments/block-storage/config/semihosted-opteesp/default=
_block-storage.dts.in b/deployments/block-storage/config/semihosted-optee=
sp/default_block-storage.dts.in
+index 0a97cb53e..287ecb032 100644
+--- a/deployments/block-storage/config/semihosted-opteesp/default_block-=
storage.dts.in
++++ b/deployments/block-storage/config/semihosted-opteesp/default_block-=
storage.dts.in
+@@ -15,6 +15,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AArch64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+ 	elf-format =3D <1>;
+diff --git a/deployments/crypto/config/default-opteesp/CMakeLists.txt b/=
deployments/crypto/config/default-opteesp/CMakeLists.txt
+index 1e4069d66..11e2dfbb3 100644
+--- a/deployments/crypto/config/default-opteesp/CMakeLists.txt
++++ b/deployments/crypto/config/default-opteesp/CMakeLists.txt
+@@ -30,6 +30,7 @@ target_include_directories(crypto PRIVATE "${TOP_LEVEL=
_INCLUDE_DIRS}")
+ set(SP_BIN_UUID_CANON "d9df52d5-16a2-4bb2-9aa4-d26d3b84e8c0")
+ set(SP_FFA_UUID_CANON "${TS_RPC_UUID_CANON}")
+ set(SP_HEAP_SIZE "490 * 1024" CACHE STRING "SP heap size in bytes")
++set(SP_BOOT_ORDER "4")
+ set(TRACE_PREFIX "CRYPTO" CACHE STRING "Trace prefix")
+=20
+ target_include_directories(crypto PRIVATE
+@@ -91,6 +92,7 @@ include(${TS_ROOT}/tools/cmake/common/ExportSp.cmake)
+ export_sp(
+ 	SP_FFA_UUID_CANON ${SP_FFA_UUID_CANON}
+ 	SP_BIN_UUID_CANON ${SP_BIN_UUID_CANON}
++	SP_BOOT_ORDER ${SP_BOOT_ORDER}
+ 	SP_NAME "crypto"
+ 	MK_IN ${TS_ROOT}/environments/opteesp/sp.mk.in
+ 	DTS_IN ${CMAKE_CURRENT_LIST_DIR}/default_crypto.dts.in
+diff --git a/deployments/crypto/config/default-opteesp/default_crypto.dt=
s.in b/deployments/crypto/config/default-opteesp/default_crypto.dts.in
+index c9006361d..729dca7f0 100644
+--- a/deployments/crypto/config/default-opteesp/default_crypto.dts.in
++++ b/deployments/crypto/config/default-opteesp/default_crypto.dts.in
+@@ -15,6 +15,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AArch64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+ 	elf-format =3D <1>;
+diff --git a/deployments/crypto/config/default-sp/CMakeLists.txt b/deplo=
yments/crypto/config/default-sp/CMakeLists.txt
+index 83594c5e2..b32772820 100644
+--- a/deployments/crypto/config/default-sp/CMakeLists.txt
++++ b/deployments/crypto/config/default-sp/CMakeLists.txt
+@@ -35,6 +35,7 @@ set(SP_FFA_UUID_CANON "${TS_RPC_UUID_CANON}")
+ set(TRACE_PREFIX "CRYPTO" CACHE STRING "Trace prefix")
+ set(SP_STACK_SIZE "64 * 1024" CACHE STRING "Stack size")
+ set(SP_HEAP_SIZE "490 * 1024" CACHE STRING "Heap size")
++set(SP_BOOT_ORDER "4")
+=20
+ #----------------------------------------------------------------------=
---------
+ #  Components that are specific to deployment in the opteesp environmen=
t.
+@@ -91,6 +92,7 @@ include(${TS_ROOT}/tools/cmake/common/ExportSp.cmake R=
EQUIRED)
+ export_sp(
+ 	SP_FFA_UUID_CANON ${SP_FFA_UUID_CANON}
+ 	SP_BIN_UUID_CANON ${SP_BIN_UUID_CANON}
++	SP_BOOT_ORDER ${SP_BOOT_ORDER}
+ 	SP_NAME ${SP_NAME}
+ 	DTS_IN ${CMAKE_CURRENT_LIST_DIR}/default_${SP_NAME}.dts.in
+ 	DTS_MEM_REGIONS ${SP_BIN_UUID_CANON}_memory_regions.dtsi
+diff --git a/deployments/crypto/config/default-sp/default_crypto.dts.in =
b/deployments/crypto/config/default-sp/default_crypto.dts.in
+index fcc7ce58e..ef63c63a0 100644
+--- a/deployments/crypto/config/default-sp/default_crypto.dts.in
++++ b/deployments/crypto/config/default-sp/default_crypto.dts.in
+@@ -15,6 +15,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AArch64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+=20
+diff --git a/deployments/env-test/config/baremetal-fvp_base_revc-opteesp=
/default_env-test.dts.in b/deployments/env-test/config/baremetal-fvp_base=
_revc-opteesp/default_env-test.dts.in
+index 9c09689cf..c8c8c38f3 100644
+--- a/deployments/env-test/config/baremetal-fvp_base_revc-opteesp/defaul=
t_env-test.dts.in
++++ b/deployments/env-test/config/baremetal-fvp_base_revc-opteesp/defaul=
t_env-test.dts.in
+@@ -15,6 +15,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AArch64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+ 	elf-format =3D <1>;
+diff --git a/deployments/env-test/config/baremetal-fvp_base_revc-sp/defa=
ult_env-test.dts.in b/deployments/env-test/config/baremetal-fvp_base_revc=
-sp/default_env-test.dts.in
+index 8c741b29c..379eba332 100644
+--- a/deployments/env-test/config/baremetal-fvp_base_revc-sp/default_env=
-test.dts.in
++++ b/deployments/env-test/config/baremetal-fvp_base_revc-sp/default_env=
-test.dts.in
+@@ -13,6 +13,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AArch64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+ 	memory-regions {
+diff --git a/deployments/env-test/config/n1sdp-opteesp/default_env-test.=
dts.in b/deployments/env-test/config/n1sdp-opteesp/default_env-test.dts.i=
n
+index 9c09689cf..c8c8c38f3 100644
+--- a/deployments/env-test/config/n1sdp-opteesp/default_env-test.dts.in
++++ b/deployments/env-test/config/n1sdp-opteesp/default_env-test.dts.in
+@@ -15,6 +15,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AArch64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+ 	elf-format =3D <1>;
+diff --git a/deployments/fwu/config/default-opteesp/CMakeLists.txt b/dep=
loyments/fwu/config/default-opteesp/CMakeLists.txt
+index f5087d81e..d19e4293c 100644
+--- a/deployments/fwu/config/default-opteesp/CMakeLists.txt
++++ b/deployments/fwu/config/default-opteesp/CMakeLists.txt
+@@ -23,6 +23,7 @@ target_include_directories(fwu PRIVATE "${TOP_LEVEL_IN=
CLUDE_DIRS}")
+ set(SP_BIN_UUID_CANON "6823a838-1b06-470e-9774-0cce8bfb53fd")
+ set(SP_FFA_UUID_CANON "${TS_RPC_UUID_CANON}")
+ set(SP_HEAP_SIZE "32 * 1024" CACHE STRING "SP heap size in bytes")
++set(SP_BOOT_ORDER "7")
+=20
+ target_include_directories(fwu PRIVATE
+ 	${CMAKE_CURRENT_LIST_DIR}
+@@ -90,6 +91,7 @@ include(${TS_ROOT}/tools/cmake/common/ExportSp.cmake)
+ export_sp(
+ 	SP_FFA_UUID_CANON ${SP_FFA_UUID_CANON}
+ 	SP_BIN_UUID_CANON ${SP_BIN_UUID_CANON}
++	SP_BOOT_ORDER ${SP_BOOT_ORDER}
+ 	SP_NAME "fwu"
+ 	DTS_IN ${CMAKE_CURRENT_LIST_DIR}/default_fwu.dts.in
+ 	JSON_IN ${TS_ROOT}/environments/opteesp/sp_pkg.json.in
+diff --git a/deployments/fwu/config/default-opteesp/default_fwu.dts.in b=
/deployments/fwu/config/default-opteesp/default_fwu.dts.in
+index 14970d592..d62850fe8 100644
+--- a/deployments/fwu/config/default-opteesp/default_fwu.dts.in
++++ b/deployments/fwu/config/default-opteesp/default_fwu.dts.in
+@@ -15,6 +15,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AArch64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+ 	elf-format =3D <1>;
+diff --git a/deployments/fwu/config/default-sp/CMakeLists.txt b/deployme=
nts/fwu/config/default-sp/CMakeLists.txt
+index f84ba8f27..9ddc7cc3f 100644
+--- a/deployments/fwu/config/default-sp/CMakeLists.txt
++++ b/deployments/fwu/config/default-sp/CMakeLists.txt
+@@ -27,6 +27,7 @@ set(SP_BIN_UUID_CANON "6823a838-1b06-470e-9774-0cce8bf=
b53fd")
+ set(SP_FFA_UUID_CANON "${TS_RPC_UUID_CANON}")
+ set(SP_STACK_SIZE "64 * 1024" CACHE STRING "Stack size")
+ set(SP_HEAP_SIZE "32 * 1024" CACHE STRING "Heap size")
++set(SP_BOOT_ORDER "7")
+=20
+ #----------------------------------------------------------------------=
---------
+ #  Configure trace output
+@@ -90,6 +91,7 @@ include(${TS_ROOT}/tools/cmake/common/ExportSp.cmake)
+ export_sp(
+ 	SP_FFA_UUID_CANON ${SP_FFA_UUID_CANON}
+ 	SP_BIN_UUID_CANON ${SP_BIN_UUID_CANON}
++	SP_BOOT_ORDER ${SP_BOOT_ORDER}
+ 	SP_NAME ${SP_NAME}
+ 	DTS_IN ${CMAKE_CURRENT_LIST_DIR}/default_${SP_NAME}.dts.in
+ 	DTS_MEM_REGIONS ${SP_BIN_UUID_CANON}_memory_regions.dtsi
+diff --git a/deployments/fwu/config/default-sp/default_fwu.dts.in b/depl=
oyments/fwu/config/default-sp/default_fwu.dts.in
+index 3f1292e1f..a30111a18 100644
+--- a/deployments/fwu/config/default-sp/default_fwu.dts.in
++++ b/deployments/fwu/config/default-sp/default_fwu.dts.in
+@@ -15,6 +15,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AArch64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+=20
+diff --git a/deployments/internal-trusted-storage/config/default-opteesp=
/CMakeLists.txt b/deployments/internal-trusted-storage/config/default-opt=
eesp/CMakeLists.txt
+index 5ae53d7f7..51040bc9b 100644
+--- a/deployments/internal-trusted-storage/config/default-opteesp/CMakeL=
ists.txt
++++ b/deployments/internal-trusted-storage/config/default-opteesp/CMakeL=
ists.txt
+@@ -21,6 +21,7 @@ set(SP_BIN_UUID_CANON "dc1eef48-b17a-4ccf-ac8b-dfcff77=
11b14")
+ set(SP_FFA_UUID_CANON "${TS_RPC_UUID_CANON}")
+=20
+ set(SP_HEAP_SIZE "32 * 1024" CACHE STRING "SP heap size in bytes")
++set(SP_BOOT_ORDER "2")
+ set(TRACE_PREFIX "ITS" CACHE STRING "Trace prefix")
+=20
+ target_include_directories(internal-trusted-storage PRIVATE
+@@ -74,6 +75,7 @@ include(${TS_ROOT}/tools/cmake/common/ExportSp.cmake)
+ export_sp(
+ 	SP_FFA_UUID_CANON ${SP_FFA_UUID_CANON}
+ 	SP_BIN_UUID_CANON ${SP_BIN_UUID_CANON}
++	SP_BOOT_ORDER ${SP_BOOT_ORDER}
+ 	SP_NAME "internal-trusted-storage"
+ 	MK_IN ${TS_ROOT}/environments/opteesp/sp.mk.in
+ 	DTS_IN ${CMAKE_CURRENT_LIST_DIR}/default_internal-trusted-storage.dts.=
in
+diff --git a/deployments/internal-trusted-storage/config/default-opteesp=
/default_internal-trusted-storage.dts.in b/deployments/internal-trusted-s=
torage/config/default-opteesp/default_internal-trusted-storage.dts.in
+index 77d08051c..9c5c8971e 100644
+--- a/deployments/internal-trusted-storage/config/default-opteesp/defaul=
t_internal-trusted-storage.dts.in
++++ b/deployments/internal-trusted-storage/config/default-opteesp/defaul=
t_internal-trusted-storage.dts.in
+@@ -15,6 +15,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AArch64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+ 	elf-format =3D <1>;
+diff --git a/deployments/internal-trusted-storage/config/default-sp/CMak=
eLists.txt b/deployments/internal-trusted-storage/config/default-sp/CMake=
Lists.txt
+index fd54a6389..6e68e57ae 100644
+--- a/deployments/internal-trusted-storage/config/default-sp/CMakeLists.=
txt
++++ b/deployments/internal-trusted-storage/config/default-sp/CMakeLists.=
txt
+@@ -25,6 +25,7 @@ set(SP_FFA_UUID_CANON "${TS_RPC_UUID_CANON}")
+ set(TRACE_PREFIX "ITS" CACHE STRING "Trace prefix")
+ set(SP_STACK_SIZE "64 * 1024" CACHE STRING "Stack size")
+ set(SP_HEAP_SIZE "32 * 1024" CACHE STRING "Heap size")
++set(SP_BOOT_ORDER "2")
+=20
+ #----------------------------------------------------------------------=
---------
+ #  Add components - this deployment uses an infrastructure that provide=
s
+@@ -78,6 +79,7 @@ include(${TS_ROOT}/tools/cmake/common/ExportSp.cmake R=
EQUIRED)
+ export_sp(
+ 	SP_FFA_UUID_CANON ${SP_FFA_UUID_CANON}
+ 	SP_BIN_UUID_CANON ${SP_BIN_UUID_CANON}
++	SP_BOOT_ORDER ${SP_BOOT_ORDER}
+ 	SP_NAME ${SP_NAME}
+ 	DTS_IN ${CMAKE_CURRENT_LIST_DIR}/default_${SP_NAME}.dts.in
+ 	DTS_MEM_REGIONS ${SP_BIN_UUID_CANON}_memory_regions.dtsi
+diff --git a/deployments/internal-trusted-storage/config/default-sp/defa=
ult_internal-trusted-storage.dts.in b/deployments/internal-trusted-storag=
e/config/default-sp/default_internal-trusted-storage.dts.in
+index bfe55b651..068ecc079 100644
+--- a/deployments/internal-trusted-storage/config/default-sp/default_int=
ernal-trusted-storage.dts.in
++++ b/deployments/internal-trusted-storage/config/default-sp/default_int=
ernal-trusted-storage.dts.in
+@@ -15,6 +15,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AArch64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+=20
+diff --git a/deployments/internal-trusted-storage/config/shared-flash-op=
teesp/CMakeLists.txt b/deployments/internal-trusted-storage/config/shared=
-flash-opteesp/CMakeLists.txt
+index 7a0c20966..ab2cf1c25 100644
+--- a/deployments/internal-trusted-storage/config/shared-flash-opteesp/C=
MakeLists.txt
++++ b/deployments/internal-trusted-storage/config/shared-flash-opteesp/C=
MakeLists.txt
+@@ -21,6 +21,7 @@ set(SP_BIN_UUID_CANON "dc1eef48-b17a-4ccf-ac8b-dfcff77=
11b14")
+ set(SP_FFA_UUID_CANON "${TS_RPC_UUID_CANON}")
+=20
+ set(SP_HEAP_SIZE "32 * 1024" CACHE STRING "SP heap size in bytes")
++set(SP_BOOT_ORDER "2")
+ set(TRACE_PREFIX "ITS" CACHE STRING "Trace prefix")
+=20
+ target_include_directories(internal-trusted-storage PRIVATE
+@@ -74,6 +75,7 @@ include(${TS_ROOT}/tools/cmake/common/ExportSp.cmake)
+ export_sp(
+ 	SP_FFA_UUID_CANON ${SP_FFA_UUID_CANON}
+ 	SP_BIN_UUID_CANON ${SP_BIN_UUID_CANON}
++	SP_BOOT_ORDER ${SP_BOOT_ORDER}
+ 	SP_NAME "internal-trusted-storage"
+ 	MK_IN ${TS_ROOT}/environments/opteesp/sp.mk.in
+ 	DTS_IN ${CMAKE_CURRENT_LIST_DIR}/default_internal-trusted-storage.dts.=
in
+diff --git a/deployments/internal-trusted-storage/config/shared-flash-op=
teesp/default_internal-trusted-storage.dts.in b/deployments/internal-trus=
ted-storage/config/shared-flash-opteesp/default_internal-trusted-storage.=
dts.in
+index 77d08051c..9c5c8971e 100644
+--- a/deployments/internal-trusted-storage/config/shared-flash-opteesp/d=
efault_internal-trusted-storage.dts.in
++++ b/deployments/internal-trusted-storage/config/shared-flash-opteesp/d=
efault_internal-trusted-storage.dts.in
+@@ -15,6 +15,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AArch64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+ 	elf-format =3D <1>;
+diff --git a/deployments/protected-storage/config/default-opteesp/CMakeL=
ists.txt b/deployments/protected-storage/config/default-opteesp/CMakeList=
s.txt
+index 7d6e5a0e6..e1fb3698c 100644
+--- a/deployments/protected-storage/config/default-opteesp/CMakeLists.tx=
t
++++ b/deployments/protected-storage/config/default-opteesp/CMakeLists.tx=
t
+@@ -21,6 +21,7 @@ set(SP_BIN_UUID_CANON "751bf801-3dde-4768-a514-0f10aee=
d1790")
+ set(SP_FFA_UUID_CANON "${TS_RPC_UUID_CANON}")
+=20
+ set(SP_HEAP_SIZE "32 * 1024" CACHE STRING "SP heap size in bytes")
++set(SP_BOOT_ORDER "3")
+ set(TRACE_PREFIX "PS" CACHE STRING "Trace prefix")
+=20
+ target_include_directories(protected-storage PRIVATE
+@@ -73,6 +74,7 @@ include(${TS_ROOT}/tools/cmake/common/ExportSp.cmake)
+ export_sp(
+ 	SP_FFA_UUID_CANON ${SP_FFA_UUID_CANON}
+ 	SP_BIN_UUID_CANON ${SP_BIN_UUID_CANON}
++	SP_BOOT_ORDER ${SP_BOOT_ORDER}
+ 	SP_NAME "protected-storage"
+ 	MK_IN ${TS_ROOT}/environments/opteesp/sp.mk.in
+ 	DTS_IN ${CMAKE_CURRENT_LIST_DIR}/default_protected-storage.dts.in
+diff --git a/deployments/protected-storage/config/default-opteesp/defaul=
t_protected-storage.dts.in b/deployments/protected-storage/config/default=
-opteesp/default_protected-storage.dts.in
+index b305fbbf7..2bc74a40d 100644
+--- a/deployments/protected-storage/config/default-opteesp/default_prote=
cted-storage.dts.in
++++ b/deployments/protected-storage/config/default-opteesp/default_prote=
cted-storage.dts.in
+@@ -15,6 +15,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AArch64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+ 	elf-format =3D <1>;
+diff --git a/deployments/protected-storage/config/default-sp/CMakeLists.=
txt b/deployments/protected-storage/config/default-sp/CMakeLists.txt
+index 1c85ef120..4ee55b84d 100644
+--- a/deployments/protected-storage/config/default-sp/CMakeLists.txt
++++ b/deployments/protected-storage/config/default-sp/CMakeLists.txt
+@@ -25,6 +25,7 @@ set(SP_FFA_UUID_CANON "${TS_RPC_UUID_CANON}")
+ set(TRACE_PREFIX "PS" CACHE STRING "Trace prefix")
+ set(SP_STACK_SIZE "64 * 1024" CACHE STRING "Stack size")
+ set(SP_HEAP_SIZE "32 * 1024" CACHE STRING "Heap size")
++set(SP_BOOT_ORDER "3")
+=20
+ #----------------------------------------------------------------------=
---------
+ #  Add components - this deployment uses an infrastructure that provide=
s
+@@ -78,6 +79,7 @@ include(${TS_ROOT}/tools/cmake/common/ExportSp.cmake R=
EQUIRED)
+ export_sp(
+ 	SP_FFA_UUID_CANON ${SP_FFA_UUID_CANON}
+ 	SP_BIN_UUID_CANON ${SP_BIN_UUID_CANON}
++	SP_BOOT_ORDER ${SP_BOOT_ORDER}
+ 	SP_NAME ${SP_NAME}
+ 	DTS_IN ${CMAKE_CURRENT_LIST_DIR}/default_${SP_NAME}.dts.in
+ 	DTS_MEM_REGIONS ${SP_BIN_UUID_CANON}_memory_regions.dtsi
+diff --git a/deployments/protected-storage/config/default-sp/default_pro=
tected-storage.dts.in b/deployments/protected-storage/config/default-sp/d=
efault_protected-storage.dts.in
+index 38c9b5849..79c001faf 100644
+--- a/deployments/protected-storage/config/default-sp/default_protected-=
storage.dts.in
++++ b/deployments/protected-storage/config/default-sp/default_protected-=
storage.dts.in
+@@ -15,6 +15,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AArch64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+=20
+diff --git a/deployments/protected-storage/config/shared-flash-opteesp/C=
MakeLists.txt b/deployments/protected-storage/config/shared-flash-opteesp=
/CMakeLists.txt
+index 1a3480dce..31724de6a 100644
+--- a/deployments/protected-storage/config/shared-flash-opteesp/CMakeLis=
ts.txt
++++ b/deployments/protected-storage/config/shared-flash-opteesp/CMakeLis=
ts.txt
+@@ -22,6 +22,7 @@ set(SP_FFA_UUID_CANON "${TS_RPC_UUID_CANON}")
+=20
+ set(SP_HEAP_SIZE "32 * 1024" CACHE STRING "SP heap size in bytes")
+ set(TRACE_PREFIX "PS" CACHE STRING "Trace prefix")
++set(SP_BOOT_ORDER "3")
+=20
+ target_include_directories(protected-storage PRIVATE
+ 	${CMAKE_CURRENT_LIST_DIR}
+@@ -72,6 +73,7 @@ include(${TS_ROOT}/tools/cmake/common/ExportSp.cmake)
+ export_sp(
+ 	SP_FFA_UUID_CANON ${SP_FFA_UUID_CANON}
+ 	SP_BIN_UUID_CANON ${SP_BIN_UUID_CANON}
++	SP_BOOT_ORDER ${SP_BOOT_ORDER}
+ 	SP_NAME "protected-storage"
+ 	MK_IN ${TS_ROOT}/environments/opteesp/sp.mk.in
+ 	DTS_IN ${CMAKE_CURRENT_LIST_DIR}/default_protected-storage.dts.in
+diff --git a/deployments/protected-storage/config/shared-flash-opteesp/d=
efault_protected-storage.dts.in b/deployments/protected-storage/config/sh=
ared-flash-opteesp/default_protected-storage.dts.in
+index b305fbbf7..2bc74a40d 100644
+--- a/deployments/protected-storage/config/shared-flash-opteesp/default_=
protected-storage.dts.in
++++ b/deployments/protected-storage/config/shared-flash-opteesp/default_=
protected-storage.dts.in
+@@ -15,6 +15,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AArch64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+ 	elf-format =3D <1>;
+diff --git a/deployments/se-proxy/config/corstone1000-opteesp/CMakeLists=
.txt b/deployments/se-proxy/config/corstone1000-opteesp/CMakeLists.txt
+index 2c0da0e97..3e2cef692 100644
+--- a/deployments/se-proxy/config/corstone1000-opteesp/CMakeLists.txt
++++ b/deployments/se-proxy/config/corstone1000-opteesp/CMakeLists.txt
+@@ -23,6 +23,7 @@ set(SP_BIN_UUID_CANON "46bb39d1-b4d9-45b5-88ff-040027d=
ab249")
+ set(SP_FFA_UUID_CANON "${TS_RPC_UUID_CANON}")
+=20
+ set(SP_HEAP_SIZE "32 * 1024" CACHE STRING "SP heap size in bytes")
++set(SP_BOOT_ORDER "1")
+ set(TRACE_PREFIX "SEPROXY" CACHE STRING "Trace prefix")
+=20
+ target_include_directories(se-proxy PRIVATE
+@@ -84,6 +85,7 @@ include(${TS_ROOT}/tools/cmake/common/ExportSp.cmake)
+ export_sp(
+ 	SP_FFA_UUID_CANON ${SP_FFA_UUID_CANON}
+ 	SP_BIN_UUID_CANON ${SP_BIN_UUID_CANON}
++	SP_BOOT_ORDER ${SP_BOOT_ORDER}
+ 	SP_NAME "se-proxy"
+ 	MK_IN ${TS_ROOT}/environments/opteesp/sp.mk.in
+ 	DTS_IN ${CMAKE_CURRENT_LIST_DIR}/default_se-proxy.dts.in
+diff --git a/deployments/se-proxy/config/corstone1000-opteesp/default_se=
-proxy.dts.in b/deployments/se-proxy/config/corstone1000-opteesp/default_=
se-proxy.dts.in
+index cc42929d5..d3addedbc 100644
+--- a/deployments/se-proxy/config/corstone1000-opteesp/default_se-proxy.=
dts.in
++++ b/deployments/se-proxy/config/corstone1000-opteesp/default_se-proxy.=
dts.in
+@@ -15,6 +15,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AArch64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+ 	elf-format =3D <1>;
+diff --git a/deployments/se-proxy/config/default-opteesp/CMakeLists.txt =
b/deployments/se-proxy/config/default-opteesp/CMakeLists.txt
+index 77ea841d2..a9b1bad17 100644
+--- a/deployments/se-proxy/config/default-opteesp/CMakeLists.txt
++++ b/deployments/se-proxy/config/default-opteesp/CMakeLists.txt
+@@ -25,6 +25,7 @@ set(SP_BIN_UUID_CANON "46bb39d1-b4d9-45b5-88ff-040027d=
ab249")
+ set(SP_FFA_UUID_CANON "${TS_RPC_UUID_CANON}")
+=20
+ set(SP_HEAP_SIZE "32 * 1024" CACHE STRING "SP heap size in bytes")
++set(SP_BOOT_ORDER "2")
+ set(TRACE_PREFIX "SEPROXY" CACHE STRING "Trace prefix")
+=20
+ target_include_directories(se-proxy PRIVATE
+@@ -86,6 +87,7 @@ include(${TS_ROOT}/tools/cmake/common/ExportSp.cmake)
+ export_sp(
+ 	SP_FFA_UUID_CANON ${SP_FFA_UUID_CANON}
+ 	SP_BIN_UUID_CANON ${SP_BIN_UUID_CANON}
++	SP_BOOT_ORDER ${SP_BOOT_ORDER}
+ 	SP_NAME "se-proxy"
+ 	MK_IN ${TS_ROOT}/environments/opteesp/sp.mk.in
+ 	DTS_IN ${CMAKE_CURRENT_LIST_DIR}/default_se-proxy.dts.in
+diff --git a/deployments/se-proxy/config/default-opteesp/default_se-prox=
y.dts.in b/deployments/se-proxy/config/default-opteesp/default_se-proxy.d=
ts.in
+index 902017c35..7c2f038a0 100644
+--- a/deployments/se-proxy/config/default-opteesp/default_se-proxy.dts.i=
n
++++ b/deployments/se-proxy/config/default-opteesp/default_se-proxy.dts.i=
n
+@@ -15,6 +15,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AArch64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+ 	elf-format =3D <1>;
+diff --git a/deployments/se-proxy/config/default-sp/CMakeLists.txt b/dep=
loyments/se-proxy/config/default-sp/CMakeLists.txt
+index 70d40739d..59780b44d 100644
+--- a/deployments/se-proxy/config/default-sp/CMakeLists.txt
++++ b/deployments/se-proxy/config/default-sp/CMakeLists.txt
+@@ -29,6 +29,7 @@ set(SP_FFA_UUID_CANON "${TS_RPC_UUID_CANON}")
+ set(TRACE_PREFIX "SEPROXY" CACHE STRING "Trace prefix")
+ set(SP_STACK_SIZE "64 * 1024" CACHE STRING "Stack size")
+ set(SP_HEAP_SIZE "32 * 1024" CACHE STRING "Heap size")
++set(SP_BOOT_ORDER "2")
+=20
+ #----------------------------------------------------------------------=
---------
+ #  Components that are specific to deployment in the opteesp environmen=
t.
+@@ -85,6 +86,7 @@ include(${TS_ROOT}/tools/cmake/common/ExportSp.cmake R=
EQUIRED)
+ export_sp(
+ 	SP_FFA_UUID_CANON ${SP_FFA_UUID_CANON}
+ 	SP_BIN_UUID_CANON ${SP_BIN_UUID_CANON}
++	SP_BOOT_ORDER ${SP_BOOT_ORDER}
+ 	SP_NAME ${SP_NAME}
+ 	DTS_IN ${CMAKE_CURRENT_LIST_DIR}/default_${SP_NAME}.dts.in
+ 	DTS_MEM_REGIONS ${SP_BIN_UUID_CANON}_memory_regions.dtsi
+diff --git a/deployments/se-proxy/config/default-sp/default_se-proxy.dts=
.in b/deployments/se-proxy/config/default-sp/default_se-proxy.dts.in
+index 3b66f9258..09f0dc129 100644
+--- a/deployments/se-proxy/config/default-sp/default_se-proxy.dts.in
++++ b/deployments/se-proxy/config/default-sp/default_se-proxy.dts.in
+@@ -15,6 +15,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AArch64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+=20
+diff --git a/deployments/sfs-demo/opteesp/default_sfs-demo.dts.in b/depl=
oyments/sfs-demo/opteesp/default_sfs-demo.dts.in
+index 69c36895e..17d1dece3 100644
+--- a/deployments/sfs-demo/opteesp/default_sfs-demo.dts.in
++++ b/deployments/sfs-demo/opteesp/default_sfs-demo.dts.in
+@@ -15,6 +15,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AArch64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+ 	elf-format =3D <1>;
+diff --git a/deployments/sfs-demo/sp/default_sfs-demo.dts.in b/deploymen=
ts/sfs-demo/sp/default_sfs-demo.dts.in
+index 0ea2844d7..b97b5ffea 100644
+--- a/deployments/sfs-demo/sp/default_sfs-demo.dts.in
++++ b/deployments/sfs-demo/sp/default_sfs-demo.dts.in
+@@ -15,6 +15,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AArch64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+=20
+diff --git a/deployments/smm-gateway/config/default-opteesp/CMakeLists.t=
xt b/deployments/smm-gateway/config/default-opteesp/CMakeLists.txt
+index 0ca460601..7becb3999 100644
+--- a/deployments/smm-gateway/config/default-opteesp/CMakeLists.txt
++++ b/deployments/smm-gateway/config/default-opteesp/CMakeLists.txt
+@@ -22,6 +22,7 @@ add_executable(smm-gateway)
+ target_include_directories(smm-gateway PRIVATE "${TOP_LEVEL_INCLUDE_DIR=
S}")
+ set(SP_BIN_UUID_CANON "ed32d533-99e6-4209-9cc0-2d72cdd998a7")
+ set(SP_FFA_UUID_CANON "${SP_BIN_UUID_CANON}")
++set(SP_BOOT_ORDER "8")
+=20
+ set(SP_HEAP_SIZE "32 * 1024" CACHE STRING "SP heap size in bytes")
+ set(TRACE_PREFIX "SMMGW" CACHE STRING "Trace prefix")
+@@ -89,6 +90,7 @@ include(${TS_ROOT}/tools/cmake/common/ExportSp.cmake)
+ export_sp(
+ 	SP_FFA_UUID_CANON ${SP_FFA_UUID_CANON}
+ 	SP_BIN_UUID_CANON ${SP_BIN_UUID_CANON}
++	SP_BOOT_ORDER ${SP_BOOT_ORDER}
+ 	SP_NAME "smm-gateway"
+ 	MK_IN ${TS_ROOT}/environments/opteesp/sp.mk.in
+ 	DTS_IN ${CMAKE_CURRENT_LIST_DIR}/default_smm-gateway.dts.in
+diff --git a/deployments/smm-gateway/config/default-opteesp/default_smm-=
gateway.dts.in b/deployments/smm-gateway/config/default-opteesp/default_s=
mm-gateway.dts.in
+index d74c2f3ee..eb5ebf592 100644
+--- a/deployments/smm-gateway/config/default-opteesp/default_smm-gateway=
.dts.in
++++ b/deployments/smm-gateway/config/default-opteesp/default_smm-gateway=
.dts.in
+@@ -15,6 +15,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AArch64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+ 	elf-format =3D <1>;
+diff --git a/deployments/smm-gateway/config/default-sp/CMakeLists.txt b/=
deployments/smm-gateway/config/default-sp/CMakeLists.txt
+index 95c572632..e56a8559d 100644
+--- a/deployments/smm-gateway/config/default-sp/CMakeLists.txt
++++ b/deployments/smm-gateway/config/default-sp/CMakeLists.txt
+@@ -27,6 +27,8 @@ set(SP_BIN_UUID_CANON "ed32d533-99e6-4209-9cc0-2d72cdd=
998a7")
+ set(SP_FFA_UUID_CANON "${SP_BIN_UUID_CANON}")
+ set(TRACE_PREFIX "SMMGW" CACHE STRING "Trace prefix")
+ set(SP_STACK_SIZE "64 * 1024" CACHE STRING "Stack size")
++set(SP_BOOT_ORDER "8")
++
+ set(SP_HEAP_SIZE "32 * 1024" CACHE STRING "Heap size")
+=20
+ # Setting the MM communication buffer parameters
+@@ -88,6 +90,7 @@ include(${TS_ROOT}/tools/cmake/common/ExportSp.cmake R=
EQUIRED)
+ export_sp(
+ 	SP_FFA_UUID_CANON ${SP_FFA_UUID_CANON}
+ 	SP_BIN_UUID_CANON ${SP_BIN_UUID_CANON}
++	SP_BOOT_ORDER ${SP_BOOT_ORDER}
+ 	SP_NAME ${SP_NAME}
+ 	DTS_IN ${CMAKE_CURRENT_LIST_DIR}/default_${SP_NAME}.dts.in
+ 	DTS_MEM_REGIONS ${SP_BIN_UUID_CANON}_memory_regions.dtsi
+diff --git a/deployments/smm-gateway/config/default-sp/default_smm-gatew=
ay.dts.in b/deployments/smm-gateway/config/default-sp/default_smm-gateway=
.dts.in
+index 9b8988eb1..8e41eb762 100644
+--- a/deployments/smm-gateway/config/default-sp/default_smm-gateway.dts.=
in
++++ b/deployments/smm-gateway/config/default-sp/default_smm-gateway.dts.=
in
+@@ -15,6 +15,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AArch64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+=20
+diff --git a/deployments/spm-test1/opteesp/CMakeLists.txt b/deployments/=
spm-test1/opteesp/CMakeLists.txt
+index 4558303ad..26b846ef6 100644
+--- a/deployments/spm-test1/opteesp/CMakeLists.txt
++++ b/deployments/spm-test1/opteesp/CMakeLists.txt
+@@ -18,6 +18,7 @@ set(SP_FFA_UUID_CANON "5c9edbc3-7b3a-4367-9f83-7c191ae=
86a37")
+ set(SP_NUMBER 1)
+ set(SP_HEAP_SIZE "32 * 1024" CACHE STRING "SP heap size in bytes")
+ set(TRACE_PREFIX "SPM-TEST${SP_NUMBER}" CACHE STRING "Trace prefix")
++set(SP_BOOT_ORDER "0" CACHE STRING "Boot-order.")
+=20
+ #----------------------------------------------------------------------=
---------
+ #  Components that are spm-test specific to deployment in the opteesp
+diff --git a/deployments/spm-test1/opteesp/default_spm_test1.dts.in b/de=
ployments/spm-test1/opteesp/default_spm_test1.dts.in
+index 0cc220798..a672ee19c 100644
+--- a/deployments/spm-test1/opteesp/default_spm_test1.dts.in
++++ b/deployments/spm-test1/opteesp/default_spm_test1.dts.in
+@@ -17,6 +17,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AARCH64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+ 	elf-format =3D <1>;
+diff --git a/deployments/spm-test2/opteesp/CMakeLists.txt b/deployments/=
spm-test2/opteesp/CMakeLists.txt
+index ea82a4ae1..3781567bb 100644
+--- a/deployments/spm-test2/opteesp/CMakeLists.txt
++++ b/deployments/spm-test2/opteesp/CMakeLists.txt
+@@ -18,6 +18,7 @@ set(SP_FFA_UUID_CANON "7817164c-c40c-4d1a-867a-9bb2278=
cf41a")
+ set(SP_NUMBER 2)
+ set(SP_HEAP_SIZE "32 * 1024" CACHE STRING "SP heap size in bytes")
+ set(TRACE_PREFIX "SPM-TEST${SP_NUMBER}" CACHE STRING "Trace prefix")
++set(SP_BOOT_ORDER "0" CACHE STRING "Boot-order.")
+=20
+ #----------------------------------------------------------------------=
---------
+ #  Components that are spm-test specific to deployment in the opteesp
+diff --git a/deployments/spm-test2/opteesp/default_spm_test2.dts.in b/de=
ployments/spm-test2/opteesp/default_spm_test2.dts.in
+index f75bd9e7e..2364ded72 100644
+--- a/deployments/spm-test2/opteesp/default_spm_test2.dts.in
++++ b/deployments/spm-test2/opteesp/default_spm_test2.dts.in
+@@ -17,6 +17,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AARCH64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+ 	elf-format =3D <1>;
+diff --git a/deployments/spm-test3/opteesp/CMakeLists.txt b/deployments/=
spm-test3/opteesp/CMakeLists.txt
+index c448673d6..7d9ae0b42 100644
+--- a/deployments/spm-test3/opteesp/CMakeLists.txt
++++ b/deployments/spm-test3/opteesp/CMakeLists.txt
+@@ -18,6 +18,8 @@ set(SP_FFA_UUID_CANON "23eb0100-e32a-4497-9052-2f11e58=
4afa6")
+ set(SP_NUMBER 3)
+ set(SP_HEAP_SIZE "32 * 1024" CACHE STRING "SP heap size in bytes")
+ set(TRACE_PREFIX "SPM-TEST${SP_NUMBER}" CACHE STRING "Trace prefix")
++set(SP_BOOT_ORDER "0" CACHE STRING "Boot-order.")
++
+=20
+ #----------------------------------------------------------------------=
---------
+ #  Components that are spm-test specific to deployment in the opteesp
+diff --git a/deployments/spm-test3/opteesp/default_spm_test3.dts.in b/de=
ployments/spm-test3/opteesp/default_spm_test3.dts.in
+index c3c768fb5..17e9a47b8 100644
+--- a/deployments/spm-test3/opteesp/default_spm_test3.dts.in
++++ b/deployments/spm-test3/opteesp/default_spm_test3.dts.in
+@@ -17,6 +17,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AARCH64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+ 	elf-format =3D <1>;
+diff --git a/deployments/spm-test4/opteesp/CMakeLists.txt b/deployments/=
spm-test4/opteesp/CMakeLists.txt
+index 4e572ecd2..09cb70944 100644
+--- a/deployments/spm-test4/opteesp/CMakeLists.txt
++++ b/deployments/spm-test4/opteesp/CMakeLists.txt
+@@ -18,6 +18,7 @@ set(SP_FFA_UUID_CANON "23eb0100-e32a-4497-9052-2f11e58=
4afa6")
+ set(SP_NUMBER 4)
+ set(SP_HEAP_SIZE "32 * 1024" CACHE STRING "SP heap size in bytes")
+ set(TRACE_PREFIX "SPM-TEST${SP_NUMBER}" CACHE STRING "Trace prefix")
++set(SP_BOOT_ORDER "0" CACHE STRING "Boot-order.")
+=20
+ #----------------------------------------------------------------------=
---------
+ #  Components that are spm-test specific to deployment in the opteesp
+diff --git a/deployments/spm-test4/opteesp/default_spm_test4.dts.in b/de=
ployments/spm-test4/opteesp/default_spm_test4.dts.in
+index fffc31f45..ac57dcdfb 100644
+--- a/deployments/spm-test4/opteesp/default_spm_test4.dts.in
++++ b/deployments/spm-test4/opteesp/default_spm_test4.dts.in
+@@ -17,6 +17,7 @@
+ 	exception-level =3D <1>; /* S-EL0 */
+ 	execution-state =3D <0>; /* AARCH64 */
+ 	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D /bits/ 16 <@EXPORT_SP_BOOT_ORDER@>;
+ 	messaging-method =3D <3>; /* Direct messaging only */
+ 	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
+ 	elf-format =3D <1>;
+diff --git a/tools/cmake/common/ExportSp.cmake b/tools/cmake/common/Expo=
rtSp.cmake
+index 78701b933..ceb770046 100644
+--- a/tools/cmake/common/ExportSp.cmake
++++ b/tools/cmake/common/ExportSp.cmake
+@@ -15,6 +15,7 @@ include(${CMAKE_CURRENT_LIST_DIR}/Uuid.cmake)
+ 		export_sp(
+ 			SP_FFA_UUID_CANON <uuid_str_canon>
+ 			SP_NAME <name> MK_IN <.mk path>
++			SP_BOOT_ORDER <number>
+ 			DTS_IN <DTS path>
+ 			DTS_MEM_REGIONS <Memory region manifest path>
+ 			JSON_IN <JSON path>
+@@ -29,6 +30,9 @@ include(${CMAKE_CURRENT_LIST_DIR}/Uuid.cmake)
+ 	The UUID of the SP binary a canonical string. When not set use the
+ 	SP_FFA_UUID_CANON as the SP_BIN_UUID_CANON.
+=20
++	``SP_BOOT_ORDER``
++	Boot-order of the SP. 0 will be booted first.
++
+ 	``SP_NAME``
+ 	The name of the SP.
+=20
+@@ -47,7 +51,7 @@ include(${CMAKE_CURRENT_LIST_DIR}/Uuid.cmake)
+ #]=3D=3D=3D]
+ function (export_sp)
+ 	set(options)
+-	set(oneValueArgs SP_FFA_UUID_CANON SP_BIN_UUID_CANON SP_NAME MK_IN DTS=
_IN DTS_MEM_REGIONS JSON_IN)
++	set(oneValueArgs SP_FFA_UUID_CANON SP_BIN_UUID_CANON SP_BOOT_ORDER SP_=
NAME MK_IN DTS_IN DTS_MEM_REGIONS JSON_IN)
+ 	set(multiValueArgs)
+ 	cmake_parse_arguments(EXPORT "${options}" "${oneValueArgs}"
+ 						"${multiValueArgs}" ${ARGN} )
+@@ -59,6 +63,9 @@ function (export_sp)
+ 		# We use the same UUID for the binary and FF-A if the UUID of the SP =
binary is not set
+ 		set(EXPORT_SP_BIN_UUID_CANON ${EXPORT_SP_FFA_UUID_CANON})
+ 	endif()
++	if(NOT DEFINED EXPORT_SP_BOOT_ORDER)
++		message(FATAL_ERROR "export_sp: mandatory parameter SP_BOOT_ORDER not=
 defined!")
++	endif()
+ 	if(NOT DEFINED EXPORT_SP_NAME)
+ 		message(FATAL_ERROR "export_sp: mandatory parameter SP_NAME not defin=
ed!")
+ 	endif()
+--=20
+2.34.1
+
diff --git a/meta-arm/recipes-security/trusted-services/files/0001-LazyFe=
tch-allow-setting-the-cmake-generator.patch b/meta-arm/recipes-security/t=
rusted-services/files/0001-LazyFetch-allow-setting-the-cmake-generator.pa=
tch
deleted file mode 100644
index 6664fd05..00000000
--- a/meta-arm/recipes-security/trusted-services/files/0001-LazyFetch-all=
ow-setting-the-cmake-generator.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From e62709f8e6f586ace7975b58b8a1c726d120759f Mon Sep 17 00:00:00 2001
-From: Gyorgy Szing <Gyorgy.Szing@arm.com>
-Date: Thu, 31 Aug 2023 18:24:50 +0200
-Subject: [PATCH] LazyFetch: allow setting the cmake generator
-
-Allow configuring the CMake generator used for external components. By
-default use the generator the main project is using.
-For details see the documentation in tools/cmake/common/LazyFetch.cmake.
-
-Change-Id: Ie01ea1ae533cf7a40c1f09808de2ad2e83a09db3
-Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- tools/cmake/common/LazyFetch.cmake | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/tools/cmake/common/LazyFetch.cmake b/tools/cmake/common/Laz=
yFetch.cmake
-index 68e790e..7676201 100644
---- a/tools/cmake/common/LazyFetch.cmake
-+++ b/tools/cmake/common/LazyFetch.cmake
-@@ -87,11 +87,20 @@ function(LazyFetch_ConfigAndBuild)
- 							"component specific. Pleas refer to the upstream documentation f=
or more information.")
- 	endif()
-=20
-+	if(NOT DEFINED ${UC_DEP_NAME}_GENERATOR)
-+		if(DEFINED ENV{${UC_DEP_NAME}_GENERATOR})
-+			set(${UC_DEP_NAME}_GENERATOR ENV{${UC_DEP_NAME}_GENERATOR} CACHE STR=
ING "CMake generator used for ${UC_DEP_NAME}.")
-+		else()
-+			set(${UC_DEP_NAME}_GENERATOR ${CMAKE_GENERATOR} CACHE STRING "CMake =
generator used for ${UC_DEP_NAME}.")
-+		endif()
-+	endif()
-+
- 	execute_process(COMMAND
- 		${CMAKE_COMMAND} -E env "CROSS_COMPILE=3D${CROSS_COMPILE}"
- 		${CMAKE_COMMAND}
- 			"-C${CONFIGURED_CACHE_FILE}"
- 			-DCMAKE_BUILD_TYPE=3D${${UC_DEP_NAME}_BUILD_TYPE}
-+			-G${${UC_DEP_NAME}_GENERATOR}
- 			-S ${BUILD_SRC_DIR}
- 			-B ${BUILD_BIN_DIR}
- 		RESULT_VARIABLE
---=20
-2.34.1
-
diff --git a/meta-arm/recipes-security/trusted-services/files/0001-Limit-=
nanopb-build-to-single-process.patch b/meta-arm/recipes-security/trusted-=
services/files/0001-Limit-nanopb-build-to-single-process.patch
deleted file mode 100644
index 28e041bc..00000000
--- a/meta-arm/recipes-security/trusted-services/files/0001-Limit-nanopb-=
build-to-single-process.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From aca9f9ae26235e9da2bc9adef49f9f5578f3e1e7 Mon Sep 17 00:00:00 2001
-From: Gyorgy Szing <Gyorgy.Szing@arm.com>
-Date: Tue, 25 Apr 2023 15:03:46 +0000
-Subject: [PATCH 1/1] Limit nanopb build to single process
-
-Sometimes in yocto the nanopb build step fails. The reason seems
-to be a race condition. This fix disables parallel build as
-a workaround.
-
-Upstream-Status: Inappropriate [yocto specific]
-
-Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
----
- external/nanopb/nanopb.cmake | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/external/nanopb/nanopb.cmake b/external/nanopb/nanopb.cmake
-index 36465f61..94f8048c 100644
---- a/external/nanopb/nanopb.cmake
-+++ b/external/nanopb/nanopb.cmake
-@@ -65,6 +65,8 @@ if(TARGET stdlib::c)
- 	unset_saved_properties(LIBC)
- endif()
-=20
-+set(_PROCESSOR_COUNT ${PROCESSOR_COUNT})
-+set(PROCESSOR_COUNT 1)
- include(${TS_ROOT}/tools/cmake/common/LazyFetch.cmake REQUIRED)
- LazyFetch_MakeAvailable(DEP_NAME nanopb
- 	FETCH_OPTIONS ${GIT_OPTIONS}
-@@ -73,6 +75,8 @@ LazyFetch_MakeAvailable(DEP_NAME nanopb
- 	CACHE_FILE "${TS_ROOT}/external/nanopb/nanopb-init-cache.cmake.in"
- 	SOURCE_DIR "${NANOPB_SOURCE_DIR}"
-   )
-+set(PROCESSOR_COUNT ${_PROCESSOR_COUNT})
-+
- unset(_cmake_fragment)
-=20
- if(TARGET stdlib::c)
---=20
-2.34.1
-
diff --git a/meta-arm/recipes-security/trusted-services/files/nanopb-upgr=
ade.patch b/meta-arm/recipes-security/trusted-services/files/0001-Upgrade=
-nanopb-to-v0.4.7.patch
similarity index 56%
rename from meta-arm/recipes-security/trusted-services/files/nanopb-upgra=
de.patch
rename to meta-arm/recipes-security/trusted-services/files/0001-Upgrade-n=
anopb-to-v0.4.7.patch
index 9ae4c6f2..9e81f26d 100644
--- a/meta-arm/recipes-security/trusted-services/files/nanopb-upgrade.pat=
ch
+++ b/meta-arm/recipes-security/trusted-services/files/0001-Upgrade-nanop=
b-to-v0.4.7.patch
@@ -1,26 +1,33 @@
-From 35d16cdfd51aeca5df70732accc89e250af86b69 Mon Sep 17 00:00:00 2001
+From f3ba58b00ec967970d22dfbd71c406ccb5b2ac78 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 29 Sep 2023 16:21:26 +0100
-Subject: [PATCH] Upgrade nanopb
+Subject: [PATCH 1/1] Upgrade nanopb to v4.7.0
=20
-Upgrade the nanopb checkout to 0.4.7 plus some important build fixes, an=
d
-change the build/install process to be more reliable.
-
-This should be upstreamed, but some pieces of this are not upstreamable =
in their
-current state.
+Upgrade the nanopb to 0.4.7 and add the following fixes:
+  - remove the nanopb patch as it has become obsolete.
+  - stop using the nanopb protoc wrapper when building the generator as
+    this seems to cause build issues.
+  - use the new nanopb_PYTHON_INSTDIR_OVERRIDE variable to set the
+    install location for the generator. Modify TS cmake script to search
+    the generator in the install content instead of the nanopb source.
+  - pass discovered python settings to nanopb build using the initial
+    cache. This speeds up the build and allows easier control of python
+    discovery for integration systems.
=20
 Upstream-Status: Pending
+
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
 ---
  external/nanopb/fix-pyhon-name.patch       | 41 ----------------------
- external/nanopb/nanopb-init-cache.cmake.in |  6 +++-
- external/nanopb/nanopb.cmake               |  7 ++--
- 3 files changed, 8 insertions(+), 46 deletions(-)
+ external/nanopb/nanopb-init-cache.cmake.in |  9 ++++-
+ external/nanopb/nanopb.cmake               | 34 +++++++++---------
+ 3 files changed, 24 insertions(+), 60 deletions(-)
  delete mode 100644 external/nanopb/fix-pyhon-name.patch
=20
 diff --git a/external/nanopb/fix-pyhon-name.patch b/external/nanopb/fix-=
pyhon-name.patch
 deleted file mode 100644
-index ab0e84c550f4..000000000000
+index ab0e84c5..00000000
 --- a/external/nanopb/fix-pyhon-name.patch
 +++ /dev/null
 @@ -1,41 +0,0 @@
@@ -66,15 +73,16 @@ index ab0e84c550f4..000000000000
 -     endforeach()
 - endif()
 diff --git a/external/nanopb/nanopb-init-cache.cmake.in b/external/nanop=
b/nanopb-init-cache.cmake.in
-index fb8104d64b26..8df41ddcb5eb 100644
+index fb8104d6..c53b6e5b 100644
 --- a/external/nanopb/nanopb-init-cache.cmake.in
 +++ b/external/nanopb/nanopb-init-cache.cmake.in
-@@ -12,11 +12,15 @@ set(BUILD_STATIC_LIBS On CACHE BOOL "")
+@@ -12,11 +12,18 @@ set(BUILD_STATIC_LIBS On CACHE BOOL "")
  set(nanopb_BUILD_RUNTIME On CACHE BOOL "")
  set(nanopb_BUILD_GENERATOR On CACHE BOOL "")
  set(nanopb_MSVC_STATIC_RUNTIME Off BOOL "")
 -set(nanopb_PROTOC_PATH ${CMAKE_SOURCE_DIR}/generator/protoc CACHE STRIN=
G "")
 +
++# Specify location of python binary and avoid discovery.
 +set(Python_EXECUTABLE "@Python_EXECUTABLE@" CACHE PATH "Location of pyt=
hon3 executable")
 =20
  string(TOUPPER @CMAKE_CROSSCOMPILING@ CMAKE_CROSSCOMPILING) # CMake exp=
ects TRUE
@@ -82,15 +90,42 @@ index fb8104d64b26..8df41ddcb5eb 100644
  	set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY CACHE STRING "")
  endif()
 =20
++# Override the install directory of the generator. TS will first look a=
t
++# NEWLIB_INSTALL_DIR (aka. BUILD_INSTALL_DIR), then let cmake do system=
 specific
++# search.
 +set(nanopb_PYTHON_INSTDIR_OVERRIDE "@BUILD_INSTALL_DIR@/lib/python" CAC=
HE PATH "")
-+set(NANOPB_GENERATOR_DIR "@BUILD_INSTALL_DIR@/lib/python" CACHE PATH ""=
)
 +
  @_cmake_fragment@
 diff --git a/external/nanopb/nanopb.cmake b/external/nanopb/nanopb.cmake
-index 36465f612d5d..57cf3d697fdd 100644
+index 36465f61..fa35d971 100644
 --- a/external/nanopb/nanopb.cmake
 +++ b/external/nanopb/nanopb.cmake
-@@ -28,7 +28,7 @@ running this module.
+@@ -10,17 +10,14 @@ NanoPB integration for cmake
+ ----------------------------
+=20
+ This module will:
+-	- download nanopb if not available locally
+-	- build the runtime static library and the generator
+-	- import the static library to the build
+-	- define a function to provide access to the generator
++	- use LazyFetch to download nanopb and build the static library and th=
e generator.
++	  Usual LazyFetch configuration to use prefetched source or prebuilt b=
inaries apply.
++	- run find_module() to import the static library
++	- run find_executable() import the generator to the build (extend PYTH=
ONPATH) and
++	  define a cmake function to provide access to the generator to build =
nanopb files.
+=20
+-Note: the python module created by the generator build will be installe=
d under
+-Python_SITELIB ("Third-party platform independent installation director=
y.")
+-This means the build may alter the state of your system. Please use vir=
tualenv.
+-
+-Note: see requirements.txt for dependencies which need to be installed =
before
+-running this module.
++Note: see requirements.txt for dependencies which need to be installed =
in the build
++environment to use this module.
+=20
+ #]=3D=3D=3D]
+=20
+@@ -28,7 +25,7 @@ running this module.
 =20
  set(NANOPB_URL "https://github.com/nanopb/nanopb.git"
  		CACHE STRING "nanopb repository URL")
@@ -99,16 +134,34 @@ index 36465f612d5d..57cf3d697fdd 100644
  		CACHE STRING "nanopb git refspec")
  set(NANOPB_SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps/nanopb-src"
  		CACHE PATH "nanopb source-code")
-@@ -85,7 +85,7 @@ find_package(Python3 REQUIRED COMPONENTS Interpreter)
+@@ -65,6 +62,11 @@ if(TARGET stdlib::c)
+ 	unset_saved_properties(LIBC)
+ endif()
+=20
++# Nanopb build depends on python. Discover python here and pass the res=
ult to
++# nanopb build trough the initial cache file.
++find_package(Python3 REQUIRED COMPONENTS Interpreter)
++
++# Use LazyFetch to manage the external dependency.
+ include(${TS_ROOT}/tools/cmake/common/LazyFetch.cmake REQUIRED)
+ LazyFetch_MakeAvailable(DEP_NAME nanopb
+ 	FETCH_OPTIONS ${GIT_OPTIONS}
+@@ -80,12 +82,9 @@ if(TARGET stdlib::c)
+ endif()
 =20
- find_file(NANOPB_GENERATOR_PATH
+ #### Build access to the protobuf compiler
+-#TODO: verify protoc dependencies: python3-protobuf
+-find_package(Python3 REQUIRED COMPONENTS Interpreter)
+-
+-find_file(NANOPB_GENERATOR_PATH
++find_program(NANOPB_GENERATOR_PATH
  			NAMES nanopb_generator.py
 -			PATHS ${nanopb_SOURCE_DIR}/generator
-+			PATHS ${NANOPB_INSTALL_DIR}/bin
++			HINTS ${NANOPB_INSTALL_DIR}/bin ${NANOPB_INSTALL_DIR}/sbin
  			DOC "nanopb protobuf compiler"
  			NO_DEFAULT_PATH
  		)
-@@ -186,11 +186,10 @@ function(protobuf_generate)
+@@ -186,11 +185,10 @@ function(protobuf_generate)
  		target_include_directories(${PARAMS_TGT} PRIVATE ${_OUT_DIR_BASE})
  	endif()
 =20
@@ -121,3 +174,6 @@ index 36465f612d5d..57cf3d697fdd 100644
  					   ${Python3_EXECUTABLE} ${NANOPB_GENERATOR_PATH}
  						  -I ${PARAMS_BASE_DIR}
  						  -D ${_OUT_DIR_BASE}
+--=20
+2.34.1
+
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-=
src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src=
.inc
index 20a46219..cf301a14 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
@@ -8,13 +8,12 @@ SRC_URI =3D "git://git.trustedfirmware.org/TS/trusted-s=
ervices.git;protocol=3Dhttps;
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
=20
 SRC_URI:append =3D "\
-	file://0001-Limit-nanopb-build-to-single-process.patch \
-	file://0001-LazyFetch-allow-setting-the-cmake-generator.patch \
-	file://nanopb-upgrade.patch \
+	file://0001-Upgrade-nanopb-to-v0.4.7.patch \
+    file://0001-Add-boot-order-property-to-SP-manifests.patch \
 "
=20
-#Latest on 2023 April 28
-SRCREV_trusted-services =3D "08b3d39471f4914186bd23793dc920e83b0e3197"
+# Trusted Services; Tag: v1.0.0
+SRCREV_trusted-services =3D "808904390eb89294d2371959a7d82dde3851ca6c"
 LIC_FILES_CHKSUM =3D "file://${S}/license.rst;md5=3Dea160bac7f690a069c60=
8516b17997f4"
=20
 S =3D "${WORKDIR}/git/trusted-services"
@@ -25,9 +24,9 @@ SRC_URI +=3D "git://github.com/dgibson/dtc;name=3Ddtc;p=
rotocol=3Dhttps;branch=3Dmain;des
 SRCREV_dtc =3D "b6910bec11614980a21e46fbccc35934b671bd81"
 LIC_FILES_CHKSUM +=3D "file://../dtc/README.license;md5=3Da1eb22e37f09df=
5b5511b8a278992d0e"
=20
-# MbedTLS, tag "mbedtls-3.3.0"
+# MbedTLS, tag "mbedtls-3.4.0"
 SRC_URI +=3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls;protoc=
ol=3Dhttps;branch=3Dmaster;destsuffix=3Dgit/mbedtls"
-SRCREV_mbedtls =3D "8c89224991adff88d53cd380f42a2baa36f91454"
+SRCREV_mbedtls =3D "1873d3bfc2da771672bd8e7e8f41f57e0af77f33"
 LIC_FILES_CHKSUM +=3D "file://../mbedtls/LICENSE;md5=3D3b83ef96387f14655=
fc854ddc3c6bd57"
=20
 # Nanopb, tag "nanopb-0.4.7" plus some further fixes
@@ -74,6 +73,11 @@ do_apply_local_src_patches() {
     apply_local_src_patches ${S}/external/nanopb ${WORKDIR}/git/nanopb
 }
=20
+do_config:append:() {
+    # Fine tune MbedTLS configuration for crypto only operation.
+    sh -c "cd ${WORKDIR}/git/mbedtls; python3 scripts/config.py crypto"
+}
+
 # Paths to dependencies required by some TS SPs/tools
 EXTRA_OECMAKE +=3D "-DDTC_SOURCE_DIR=3D${WORKDIR}/git/dtc \
                   -DCPPUTEST_SOURCE_DIR=3D${WORKDIR}/git/cpputest \
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services.=
inc b/meta-arm/recipes-security/trusted-services/trusted-services.inc
index b46cd498..c4a6f78c 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services.inc
@@ -32,7 +32,6 @@ OECMAKE_EXTRA_ROOT_PATH =3D "${WORKDIR}/git/ ${WORKDIR}=
/build/"
=20
 EXTRA_OECMAKE +=3D '-DLIBGCC_LOCATE_CFLAGS=3D"--sysroot=3D${STAGING_DIR_=
HOST}" \
                   -DCROSS_COMPILE=3D"${TARGET_PREFIX}" \
-                  -DSP_PACKAGING_METHOD=3D"${SP_PACKAGING_METHOD}" \
                   -DTS_PLATFORM=3D"${TS_PLATFORM}" \
                  '
 export CROSS_COMPILE=3D"${TARGET_PREFIX}"
@@ -40,13 +39,18 @@ export CROSS_COMPILE=3D"${TARGET_PREFIX}"
 # Default TS installation path
 TS_INSTALL =3D "/usr/${TS_ENV}"
=20
-# Use the Yocto cmake toolchain for arm-linux TS deployments and
-# the TS opteesp toolchain for opteesp TS deployments
-EXTRA_OECMAKE +=3D "${@oe.utils.conditional('TS_ENV', 'opteesp', \
-                    '-DCMAKE_TOOLCHAIN_FILE=3D${S}/environments/${TS_ENV=
}/default_toolchain_file.cmake', \
-                    '-DTS_EXTERNAL_LIB_TOOLCHAIN_FILE=3D${WORKDIR}/toolc=
hain.cmake', \
-                    d)} \
-                 "
+# Use the Yocto cmake toolchain for external components of the arm-linux=
 TS deployments,
+# and the TS toolchain for opteesp and sp deployments
+def get_ts_toolchain_option(d):
+    ts_env=3Dd.getVar('TS_ENV')
+    if ts_env =3D=3D 'opteesp' or ts_env =3D=3D 'sp':
+        return '-DCMAKE_TOOLCHAIN_FILE=3D${S}/environments/'+ts_env+'/de=
fault_toolchain_file.cmake'
+    if ts_env =3D=3D 'arm-linux':
+        return '-DTS_EXTERNAL_LIB_TOOLCHAIN_FILE=3D${WORKDIR}/toolchain.=
cmake'
+    bb.error("Unkown value \"%s\" for TS_ENV." % (ts_env))
+    return ''
+
+EXTRA_OECMAKE +=3D "${@get_ts_toolchain_option(d)}"
=20
 # Paths to pre-built dependencies required by some TS SPs/tools
 EXTRA_OECMAKE +=3D "-Dlibts_ROOT=3D${STAGING_DIR_HOST}${TS_INSTALL}/lib/=
cmake/libts/ \
diff --git a/meta-arm/recipes-security/trusted-services/ts-psa-api-test-c=
ommon_git.inc b/meta-arm/recipes-security/trusted-services/ts-psa-api-tes=
t-common_git.inc
index c8b4e992..93051bf3 100644
--- a/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_g=
it.inc
+++ b/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_g=
it.inc
@@ -13,7 +13,7 @@ SRC_URI +=3D "git://github.com/ARM-software/psa-arch-te=
sts.git;name=3Dpsatest;protoc
             file://0001-Pass-Yocto-build-settings-to-psa-arch-tests-nati=
ve.patch;patchdir=3D../psatest \
            "
=20
-SRCREV_psatest =3D "38cb53a4d9e292435ddf7899960b15af62decfbe"
+SRCREV_psatest =3D "74dc6646ff594e131a726a5305aba77bac30eceb"
 LIC_FILES_CHKSUM +=3D "file://../psatest/LICENSE.md;md5=3D2a944942e1496a=
f1886903d274dedb13"
=20
 EXTRA_OECMAKE +=3D "-DPSA_ARCH_TESTS_SOURCE_DIR=3D${WORKDIR}/git/psatest=
"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-common.inc =
b/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
index 3d756015..5e4cd720 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
@@ -1,6 +1,6 @@
 # Common part of all Trusted Services SPs recipes
=20
-TS_ENV =3D "opteesp"
+TS_ENV ?=3D "opteesp"
=20
 require trusted-services.inc
 require ts-uuid.inc
@@ -30,3 +30,13 @@ INSANE_SKIP:${PN}-dev +=3D "ldflags"
=20
 # Trusted Services SPs do not compile with clang
 TOOLCHAIN =3D "gcc"
+
+# FORTIFY_SOURCE is a glibc feature. Disable it for all SPs as these do =
not use glibc.
+TARGET_CFLAGS:remove =3D "-D_FORTIFY_SOURCE=3D2"
+OECMAKE_C_FLAGS:remove =3D "-D_FORTIFY_SOURCE=3D2"
+OECMAKE_CXX_FLAGS:remove =3D "-D_FORTIFY_SOURCE=3D2"
+
+# Override yoctos default linux specific toolchain file. trusted-service=
s.inc
+# will add a proper tooclhain option.
+OECMAKE_ARGS:remove=3D"-DCMAKE_TOOLCHAIN_FILE:FILEPATH=3D${WORKDIR}/tool=
chain.cmake"
+
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-spm-test4_g=
it.bb b/meta-arm/recipes-security/trusted-services/ts-sp-spm-test4_git.bb
new file mode 100644
index 00000000..2ee69c1f
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-spm-test4_git.bb
@@ -0,0 +1,6 @@
+DESCRIPTION =3D "Trusted Services SPMC test SP4"
+
+SP_INDEX=3D"4"
+
+require ts-sp-spm-test-common.inc
+
diff --git a/meta-arm/recipes-security/trusted-services/ts-uuid.inc b/met=
a-arm/recipes-security/trusted-services/ts-uuid.inc
index 1eb05d8b..0b2bd85a 100644
--- a/meta-arm/recipes-security/trusted-services/ts-uuid.inc
+++ b/meta-arm/recipes-security/trusted-services/ts-uuid.inc
@@ -10,4 +10,5 @@ STORAGE_UUID     =3D "751bf801-3dde-4768-a514-0f10aeed1=
790"
 SPM_TEST1_UUID   =3D "5c9edbc3-7b3a-4367-9f83-7c191ae86a37"
 SPM_TEST2_UUID   =3D "7817164c-c40c-4d1a-867a-9bb2278cf41a"
 SPM_TEST3_UUID   =3D "23eb0100-e32a-4497-9052-2f11e584afa6"
+SPM_TEST4_UUID   =3D "423762ed-7772-406f-99d8-0c27da0abbf8"
 BLOCK_STORAGE_UUID =3D "63646e80-eb52-462f-ac4f-8cdf3987519c"
--=20
2.43.1


