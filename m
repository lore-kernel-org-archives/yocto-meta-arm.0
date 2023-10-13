Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C5EECDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 16:52:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.43943.1697215929226279956
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 09:52:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A71D11FB;
	Fri, 13 Oct 2023 09:52:49 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 52B773F5A1;
	Fri, 13 Oct 2023 09:52:08 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/3] arm/oeqa/selftest: tag all tests with "meta-arm"
Date: Fri, 13 Oct 2023 17:52:03 +0100
Message-Id: <20231013165205.1678618-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Oct 2023 16:52:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5121

From: Ross Burton <ross.burton@arm.com>

Tag all of the tests in meta-arm so that they can be selectively ran
without needing to explicitly list them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/lib/oeqa/selftest/cases/runfvp.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arm/lib/oeqa/selftest/cases/runfvp.py b/meta-arm/lib/oe=
qa/selftest/cases/runfvp.py
index d60aa3c4..61ce2ab9 100644
--- a/meta-arm/lib/oeqa/selftest/cases/runfvp.py
+++ b/meta-arm/lib/oeqa/selftest/cases/runfvp.py
@@ -7,10 +7,12 @@ import tempfile
 import unittest.mock
=20
 from oeqa.selftest.case import OESelftestTestCase
+from oeqa.core.decorator import OETestTag
=20
 runfvp =3D pathlib.Path(__file__).parents[5] / "scripts" / "runfvp"
 testdir =3D pathlib.Path(__file__).parent / "tests"
=20
+@OETestTag("meta-arm")
 class RunFVPTests(OESelftestTestCase):
     def setUpLocal(self):
         self.assertTrue(runfvp.exists())
@@ -51,6 +53,7 @@ class RunFVPTests(OESelftestTestCase):
         # test-parameter sets one argument, add another manually
         self.run_fvp(testdir / "test-parameter.json", "--", "--parameter=
", "board.dog=3Dwoof")
=20
+@OETestTag("meta-arm")
 class ConfFileTests(OESelftestTestCase):
     def test_no_exe(self):
         from fvp import conffile
@@ -80,6 +83,7 @@ class ConfFileTests(OESelftestTestCase):
             self.assertTrue("env" in conf)
=20
=20
+@OETestTag("meta-arm")
 class RunnerTests(OESelftestTestCase):
     def create_mock(self):
         return unittest.mock.patch("subprocess.Popen")
--=20
2.34.1


