Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF57C7EE2F
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 11:24:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.23143.1684495469799320213
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 May 2023 04:24:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 496822F4;
	Fri, 19 May 2023 04:25:14 -0700 (PDT)
Received: from R91284ZP.arm.com (unknown [10.57.21.254])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9961E3F762;
	Fri, 19 May 2023 04:24:28 -0700 (PDT)
From: Gyorgy Szing <Gyorgy.Szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <Gyorgy.Szing@arm.com>,
	Anton Antonov <Anton.Antonov@arm.com>
Subject: [PATCH 08/16] arm/oeqa: enable OP-TEE SPMC tests
Date: Fri, 19 May 2023 13:23:52 +0200
Message-Id: <20230519112400.340-8-Gyorgy.Szing@arm.com>
X-Mailer: git-send-email 2.39.1.windows.1
In-Reply-To: <20230519112400.340-1-Gyorgy.Szing@arm.com>
References: <20230519112400.340-1-Gyorgy.Szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 19 May 2023 11:24:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4672

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


