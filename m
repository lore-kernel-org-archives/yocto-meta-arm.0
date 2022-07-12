Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCA05C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 10:28:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7454.1657621730562113547
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jul 2022 03:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8120A1515;
	Tue, 12 Jul 2022 03:28:50 -0700 (PDT)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BDA23F792;
	Tue, 12 Jul 2022 03:28:49 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	robbie.cao@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 2/6] arm/oeqa: Add selftests for FVP library
Date: Tue, 12 Jul 2022 11:28:26 +0100
Message-Id: <20220712102830.625090-3-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712102830.625090-1-peter.hoyes@arm.com>
References: <20220712102830.625090-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 12 Jul 2022 10:28:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3556

From: Peter Hoyes <Peter.Hoyes@arm.com>

Create basic tests for conffile and runner in meta-arm/lib/fvp

Issue-Id: SCM-4957
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I1684b0c99fb4fd5299df19f00abb30e8faab3495
---
 meta-arm/lib/oeqa/selftest/cases/runfvp.py | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/meta-arm/lib/oeqa/selftest/cases/runfvp.py b/meta-arm/lib/oe=
qa/selftest/cases/runfvp.py
index 5b06ca8..aabd0b7 100644
--- a/meta-arm/lib/oeqa/selftest/cases/runfvp.py
+++ b/meta-arm/lib/oeqa/selftest/cases/runfvp.py
@@ -1,6 +1,9 @@
+import asyncio
 import os
 import pathlib
 import subprocess
+import tempfile
+import unittest.mock
=20
 from oeqa.selftest.case import OESelftestTestCase
=20
@@ -49,3 +52,58 @@ class RunFVPTests(OESelftestTestCase):
     def test_fvp_options(self):
         # test-parameter sets one argument, add another manually
         self.run_fvp(testdir / "test-parameter.json", "--", "--parameter=
", "board.dog=3Dwoof")
+
+class ConfFileTests(OESelftestTestCase):
+    def test_no_exe(self):
+        from fvp import conffile
+        with tempfile.NamedTemporaryFile('w') as tf:
+            tf.write('{}')
+            tf.flush()
+
+            with self.assertRaises(ValueError):
+                conffile.load(tf.name)
+
+    def test_minimal(self):
+        from fvp import conffile
+        with tempfile.NamedTemporaryFile('w') as tf:
+            tf.write('{"exe": "FVP_Binary"}')
+            tf.flush()
+
+            conf =3D conffile.load(tf.name)
+            self.assertTrue('fvp-bindir' in conf)
+            self.assertTrue('fvp-bindir' in conf)
+            self.assertTrue("exe" in conf)
+            self.assertTrue("parameters" in conf)
+            self.assertTrue("data" in conf)
+            self.assertTrue("applications" in conf)
+            self.assertTrue("terminals" in conf)
+            self.assertTrue("args" in conf)
+            self.assertTrue("console" in conf)
+
+
+class RunnerTests(OESelftestTestCase):
+    def create_mock(self):
+        return unittest.mock.patch("asyncio.create_subprocess_exec")
+
+    def test_start(self):
+        from fvp import runner
+        with self.create_mock() as m:
+            fvp =3D runner.FVPRunner(self.logger)
+            asyncio.run(fvp.start({
+                "fvp-bindir": "/usr/bin",
+                "exe": "FVP_Binary",
+                "parameters": {'foo': 'bar'},
+                "data": ['data1'],
+                "applications": {'a1': 'file'},
+                "terminals": {},
+                "args": ['--extra-arg'],
+            }))
+
+            m.assert_called_once_with('/usr/bin/FVP_Binary',
+                '--parameter', 'foo=3Dbar',
+                '--data', 'data1',
+                '--application', 'a1=3Dfile',
+                '--extra-arg',
+                stdin=3Dunittest.mock.ANY,
+                stdout=3Dunittest.mock.ANY,
+                stderr=3Dunittest.mock.ANY)
--=20
2.25.1


