Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C60C04FFE
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 15:27:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.24293.1714404422193465416
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Apr 2024 08:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A74D8339;
	Mon, 29 Apr 2024 08:27:28 -0700 (PDT)
Received: from FWLNXWH7M5.arm.com (unknown [10.57.2.218])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 32F973F793;
	Mon, 29 Apr 2024 08:27:01 -0700 (PDT)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <gyorgy.szing@arm.com>
Subject: [PATCH 3/5] arm/trusted-services: fix oeqa script
Date: Mon, 29 Apr 2024 17:26:52 +0200
Message-ID: <20240429152654.94534-3-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240429152654.94534-1-gyorgy.szing@arm.com>
References: <20240429152654.94534-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Apr 2024 15:27:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5623

trusted_services.py:test_15_crypto_service runs ts-service test with
an incorrect argument list. The -g argument does not accept two group
names. This resulted in a silent failure.
Fix this by relying the pattern matching capability of the argument.

Additionaly remove references to OP-TEE from test messages as TS tests
are SPMC agonistic.

Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
---
 .../lib/oeqa/runtime/cases/trusted_services.py   | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/meta-arm/lib/oeqa/runtime/cases/trusted_services.py b/meta-a=
rm/lib/oeqa/runtime/cases/trusted_services.py
index e6a840a9..54423999 100644
--- a/meta-arm/lib/oeqa/runtime/cases/trusted_services.py
+++ b/meta-arm/lib/oeqa/runtime/cases/trusted_services.py
@@ -75,7 +75,7 @@ class TrustedServicesTest(OERuntimeTestCase):
     def test_11_ps_service_tests(self):
         if 'ts-storage' not in self.tc.td['MACHINE_FEATURES'] and \
            'ts-se-proxy' not in self.tc.td['MACHINE_FEATURES']:
-            self.skipTest('Storage SP is not included into OPTEE')
+            self.skipTest('Storage SP is not deployed in the system.')
         self.run_test_tool('ts-service-test -g PsServiceTests')
=20
     @OEHasPackage(['ts-service-test'])
@@ -83,7 +83,7 @@ class TrustedServicesTest(OERuntimeTestCase):
     def test_12_its_service_tests(self):
         if 'ts-its' not in self.tc.td['MACHINE_FEATURES'] and \
            'ts-se-proxy' not in self.tc.td['MACHINE_FEATURES']:
-            self.skipTest('Internal Storage SP is not included into OPTE=
E')
+            self.skipTest('Internal Storage SP is not deployed in the sy=
stem.')
         self.run_test_tool('ts-service-test -g ItsServiceTests')
=20
     @OEHasPackage(['ts-service-test'])
@@ -91,9 +91,8 @@ class TrustedServicesTest(OERuntimeTestCase):
     def test_14_attestation_service_tests(self):
         if 'ts-attestation' not in self.tc.td['MACHINE_FEATURES'] and \
            'ts-se-proxy' not in self.tc.td['MACHINE_FEATURES']:
-            self.skipTest('Attestation SP is not included into OPTEE')
-        for grp in ["AttestationProvisioningTests", "AttestationServiceT=
ests"]:
-            self.run_test_tool('ts-service-test -g %s'%grp)
+            self.skipTest('Attestation SP is not deployed in the system.=
')
+        self.run_test_tool('ts-service-test -g Attestation')
=20
     @OEHasPackage(['ts-service-test'])
     @skipIfNotInDataVar('MACHINE_FEATURES', 'ts-crypto', 'Crypto SP is n=
ot included')
@@ -101,8 +100,5 @@ class TrustedServicesTest(OERuntimeTestCase):
     def test_15_crypto_service_tests(self):
         if 'ts-crypto' not in self.tc.td['MACHINE_FEATURES'] and \
            'ts-se-proxy' not in self.tc.td['MACHINE_FEATURES']:
-            self.skipTest('Crypto SP is not included into OPTEE')
-        for grp in ["CryptoKeyDerivationServicePackedcTests", "CryptoMac=
ServicePackedcTests", \
-                    "CryptoCipherServicePackedcTests", "CryptoHashServic=
ePackedcTests", \
-                    "CryptoServicePackedcTests", "CryptoServiceProtobufT=
ests CryptoServiceLimitTests"]:
-            self.run_test_tool('ts-service-test -g %s'%grp)
+            self.skipTest('Crypto SP is not deployed in the system.')
+        self.run_test_tool('ts-service-test -g Crypto')
--=20
2.43.1


