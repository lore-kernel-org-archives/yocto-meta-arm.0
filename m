Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C596C7EE2D
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 11:24:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.23139.1684495464611645818
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 May 2023 04:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 070BB2F4;
	Fri, 19 May 2023 04:25:09 -0700 (PDT)
Received: from R91284ZP.arm.com (unknown [10.57.21.254])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 845953F762;
	Fri, 19 May 2023 04:24:23 -0700 (PDT)
From: Gyorgy Szing <Gyorgy.Szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anton Antonov <Anton.Antonov@arm.com>
Subject: [PATCH 03/16] arm/oeqa: Make ts-service-test config match selected SPs
Date: Fri, 19 May 2023 13:23:47 +0200
Message-Id: <20230519112400.340-3-Gyorgy.Szing@arm.com>
X-Mailer: git-send-email 2.39.1.windows.1
In-Reply-To: <20230519112400.340-1-Gyorgy.Szing@arm.com>
References: <20230519112400.340-1-Gyorgy.Szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 19 May 2023 11:24:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4667

From: Anton Antonov <Anton.Antonov@arm.com>

Split tests to groups, and enable groups based on machine features set.
This allows limiting tests to testing deployed SPs only.

Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
---
 .../oeqa/runtime/cases/trusted_services.py    | 78 +++++++++++++++++--
 1 file changed, 71 insertions(+), 7 deletions(-)

diff --git a/meta-arm/lib/oeqa/runtime/cases/trusted_services.py b/meta-a=
rm/lib/oeqa/runtime/cases/trusted_services.py
index a5f93760..1eeca205 100644
--- a/meta-arm/lib/oeqa/runtime/cases/trusted_services.py
+++ b/meta-arm/lib/oeqa/runtime/cases/trusted_services.py
@@ -3,25 +3,23 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
+from oeqa.core.decorator.data import skipIfNotInDataVar
=20
 class TrustedServicesTest(OERuntimeTestCase):
=20
-    def run_test_tool(self, cmd, expected_status=3D0 ):
+    def run_test_tool(self, cmd, expected_status=3D0, expected_output=3D=
None ):
         """ Run a test utility """
=20
         status, output =3D self.target.run(cmd)
         self.assertEqual(status, expected_status, msg=3D'\n'.join([cmd, =
output]))
+        if expected_output is not None:
+            self.assertEqual(output, expected_output, msg=3D'\n'.join([c=
md, output]))
=20
     @OEHasPackage(['ts-demo'])
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_00_ts_demo(self):
         self.run_test_tool('ts-demo')
=20
-    @OEHasPackage(['ts-service-test'])
-    @OETestDepends(['ssh.SSHTest.test_ssh'])
-    def test_01_ts_service_test(self):
-        self.run_test_tool('ts-service-test')
-
     @OEHasPackage(['ts-uefi-test'])
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_02_ts_uefi_test(self):
@@ -30,7 +28,8 @@ class TrustedServicesTest(OERuntimeTestCase):
     @OEHasPackage(['ts-psa-crypto-api-test'])
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_03_psa_crypto_api_test(self):
-        # There are a few expected PSA Crypto tests failing
+        # There are a two expected PSA Crypto tests failures testing fea=
tures
+        # TS will not support.
         self.run_test_tool('psa-crypto-api-test', expected_status=3D46)
=20
     @OEHasPackage(['ts-psa-its-api-test'])
@@ -48,3 +47,68 @@ class TrustedServicesTest(OERuntimeTestCase):
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_06_psa_iat_api_test(self):
         self.run_test_tool('psa-iat-api-test')
+
+    @OEHasPackage(['ts-service-test'])
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_09_ts_service_grp_check(self):
+        # If this test fails, available test groups in ts-service-test h=
ave changed and all
+        # tests using the test executable need to be double checked to e=
nsure test group to
+        # TS SP mapping is still valid.=20
+        test_grp_list=3D"FwuServiceTests PsServiceTests ItsServiceTests =
AttestationProvisioningTests"
+        test_grp_list+=3D" AttestationServiceTests CryptoKeyDerivationSe=
rvicePackedcTests"
+        test_grp_list+=3D" CryptoMacServicePackedcTests CryptoCipherServ=
icePackedcTests"
+        test_grp_list+=3D" CryptoHashServicePackedcTests CryptoServicePa=
ckedcTests"
+        test_grp_list+=3D" CryptoServiceProtobufTests CryptoServiceLimit=
Tests"
+        test_grp_list+=3D" DiscoveryServiceTests"
+        self.run_test_tool('ts-service-test -lg', expected_output=3Dtest=
_grp_list)
+
+    @OEHasPackage(['ts-service-test'])
+    @skipIfNotInDataVar('MACHINE_FEATURES', 'ts-fwu', 'FWU SP is not inc=
luded')
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_10_fwu_service_tests(self):
+        self.run_test_tool('ts-service-test -g FwuServiceTests')
+
+    @OEHasPackage(['ts-service-test'])
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_11_ps_service_tests(self):
+        if 'ts-storage' not in self.tc.td['MACHINE_FEATURES'] and \
+           'ts-se-proxy' not in self.tc.td['MACHINE_FEATURES']:
+            self.skipTest('Storage SP is not included into OPTEE')
+        self.run_test_tool('ts-service-test -g PsServiceTests')
+
+    @OEHasPackage(['ts-service-test'])
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_12_its_service_tests(self):
+        if 'ts-its' not in self.tc.td['MACHINE_FEATURES'] and \
+           'ts-se-proxy' not in self.tc.td['MACHINE_FEATURES']:
+            self.skipTest('Internal Storage SP is not included into OPTE=
E')
+        self.run_test_tool('ts-service-test -g ItsServiceTests')
+
+    @OEHasPackage(['ts-service-test'])
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_14_attestation_service_tests(self):
+        if 'ts-attestation' not in self.tc.td['MACHINE_FEATURES'] and \
+           'ts-se-proxy' not in self.tc.td['MACHINE_FEATURES']:
+            self.skipTest('Attestation SP is not included into OPTEE')
+        for grp in ["AttestationProvisioningTests", "AttestationServiceT=
ests"]:
+            self.run_test_tool('ts-service-test -g %s'%grp)
+
+    @OEHasPackage(['ts-service-test'])
+    @skipIfNotInDataVar('MACHINE_FEATURES', 'ts-crypto', 'Crypto SP is n=
ot included')
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_15_crypto_service_tests(self):
+        if 'ts-crypto' not in self.tc.td['MACHINE_FEATURES'] and \
+           'ts-se-proxy' not in self.tc.td['MACHINE_FEATURES']:
+            self.skipTest('Crypto SP is not included into OPTEE')
+        for grp in ["CryptoKeyDerivationServicePackedcTests", "CryptoMac=
ServicePackedcTests", \
+                    "CryptoCipherServicePackedcTests", "CryptoHashServic=
ePackedcTests", \
+                    "CryptoServicePackedcTests", "CryptoServiceProtobufT=
ests CryptoServiceLimitTests"]:
+            self.run_test_tool('ts-service-test -g %s'%grp)
+
+    @OEHasPackage(['ts-service-test'])
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_16_discovery_service_test(self):
+        if 'ts-crypto' not in self.tc.td['MACHINE_FEATURES'] and \
+           'ts-se-proxy' not in self.tc.td['MACHINE_FEATURES']:
+            self.skipTest('Crypto SP is not included into OPTEE')
+        self.run_test_tool('ts-service-test -g DiscoveryServiceTests')
--=20
2.39.1.windows.1


