Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73940EB64DA
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 14:19:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19736.1686838790062863879
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Jun 2023 07:19:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01C961FB;
	Thu, 15 Jun 2023 07:20:34 -0700 (PDT)
Received: from R91284ZP.arm.com (unknown [10.57.33.138])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F18703F663;
	Thu, 15 Jun 2023 07:19:48 -0700 (PDT)
From: Gyorgy Szing <Gyorgy.Szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <Gyorgy.Szing@arm.com>,
	Anton Antonov <Anton.Antonov@arm.com>
Subject: [PATCH mickledore 08/17] arm/oeqa: enable OP-TEE SPMC tests
Date: Thu, 15 Jun 2023 16:19:21 +0200
Message-Id: <20230615141930.2407-8-Gyorgy.Szing@arm.com>
X-Mailer: git-send-email 2.39.1.windows.1
In-Reply-To: <20230615141930.2407-1-Gyorgy.Szing@arm.com>
References: <20230615141930.2407-1-Gyorgy.Szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 15 Jun 2023 14:19:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4791

Run the ffa_spmc test group of xtest if the optee-spmc-test machine
feature is enabled.

Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
---
 meta-arm/lib/oeqa/runtime/cases/trusted_services.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-arm/lib/oeqa/runtime/cases/trusted_services.py b/meta-a=
rm/lib/oeqa/runtime/cases/trusted_services.py
index 1eeca205..88298956 100644
--- a/meta-arm/lib/oeqa/runtime/cases/trusted_services.py
+++ b/meta-arm/lib/oeqa/runtime/cases/trusted_services.py
@@ -62,6 +62,12 @@ class TrustedServicesTest(OERuntimeTestCase):
         test_grp_list+=3D" DiscoveryServiceTests"
         self.run_test_tool('ts-service-test -lg', expected_output=3Dtest=
_grp_list)
=20
+    @OEHasPackage(['optee-test'])
+    @skipIfNotInDataVar('MACHINE_FEATURES', 'optee-spmc-test', 'SPMC Tes=
t SPs are not included')
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_07_spmc_test(self):
+        self.run_test_tool('xtest -t ffa_spmc')
+
     @OEHasPackage(['ts-service-test'])
     @skipIfNotInDataVar('MACHINE_FEATURES', 'ts-fwu', 'FWU SP is not inc=
luded')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
--=20
2.39.1.windows.1


